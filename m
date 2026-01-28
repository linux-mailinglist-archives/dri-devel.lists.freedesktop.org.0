Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DvnG3cjemmv2wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:55:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C0A355D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0BE10E6E1;
	Wed, 28 Jan 2026 14:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0BJQGVsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943F210E1C2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:55:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so10606365e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 06:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769612146; x=1770216946;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i42N5v7By+ZY86n8VpHTlNhVXeHCr4/OH8RItQTbOSE=;
 b=0BJQGVsa5ypBjJgSiOMBG4OL6HVs0bMmDjaZVOKwZuVkx1yaOzbxmDpxnqaRJuqy9e
 Xf52jDG6RzrpUHzl/mD3bo8YGdQO7oaJfz997DfR1QE0qW7bpxa1VW1IlFs/uHOoLLCM
 7dmX+3BftiHIJnvOhAaJcbSzeoZCMVj3j8/MVwGgVY3JLw9MClpQw6mpzu+xNh03wvLX
 hz5uHp8WQ+zBSq9jLW7nrf5Szzu+MqaePumrjxgAfzuWEoUXbAAH6IY0FAYMFBFRnkqa
 +ZZhT9PYy4qiuPzdcQj63rFhAI4Wy1P9fMhfX/DLzGUkxuV3h/j0oFWGjJ4H5BUrdRgB
 v6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769612146; x=1770216946;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i42N5v7By+ZY86n8VpHTlNhVXeHCr4/OH8RItQTbOSE=;
 b=SAebjYOYq6mS07IqNYmm6v9gGntzIJXq+d4iHoqokB6lzNxq2l2oP4Go+5tRCGDal3
 7VasqLSU196Yhf67/gvhdsekGsAyH2+K8YGrQOJ2X/qQ3hxYcaPoVpvC0o1cw5C1S55d
 J1l6xXKiNNcsG8Q5IbqA3FQ1clKJg9nkiKvUjlz5k+QbUMKLxzsboRzqbpWW0iJyjN8+
 Ll69M9Wabr3EunWI1Vxu8yWOZ1kjDn6uhn+WZJVGWtXNUtOrk+lJRy2UHEfWrgM7dp5d
 wSJqZqmsN2X4ss2KJGL2AscoEDGpo8W1RVtaeJ61m2ENykbLlNL57NUK/4EUhfTqR/IE
 6EMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhoMogF9U+Ix27VrXAqEP8+2Y41COZFgBlXMOuSJUq5VvH/JQxbdy8qCjeY3Aw+n9GOxC1fR0RFw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx25jWdP5XNr666psOXoWl0ZjKen4fHsim1WTwhF4XzL5AFEmgd
 p06B2JZcAe5OZLd0C0F7nFlu3vw2NNHqbVNmfohwmVwAlxUgjtPR3VoosV4RoMKqxk0=
X-Gm-Gg: AZuq6aKlXzqzc6F5c1ZqEsWNoFsqNFXxZ5y+61EMS0DJMGwV0jIKKnT28Y6K9PLimir
 0iSDKgakGGkdU1lzl4NoXUI/cRA+HxsCZE+YlpXgE/cZnjevSbHSVTwPmSXgHHTFKNLO8tlRqvT
 hGe5DI6MC8FGtN0mEQPa5j4sgRtE9zc9yOjPx7GPrUy2FroW+8dkpTFBDY1xCD7Bc3D8kjaN8Ad
 1LkJ5m2irgSOS79brzBCblyyDPi/YAnTlDTRYXzoNHI3eB/kk0PgmmpxfQ6rf23LGS27hy410zx
 0WdFpbZH6nGPvMcIvLd++oJcxhD3LQfSi3dqlXbfTa9eLvfX9WnYdtvgdxnmKrUWS9G7439gNeU
 a6kgiUpB3P7tT1UeVPhaANGDeJMtAztZB2e4Mb3NzGijhgMnnvUEWdxxS/cA7NDqJ+/ldWI6d14
 tVFAUHmM3UQ/AvsTzWKZGNpxaCLRBnyGK+RW3lemHxhg439wNjSucHbdZfIDlIOhpTQI+P5KVoI
 Q==
X-Received: by 2002:a05:600c:6748:b0:477:7a53:f493 with SMTP id
 5b1f17b1804b1-48069c5b9a7mr68909475e9.23.1769612145949; 
 Wed, 28 Jan 2026 06:55:45 -0800 (PST)
Received: from localhost
 (p200300f65f20eb0406c9e4547c877c41.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:6c9:e454:7c87:7c41])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48066aaf235sm132090615e9.0.2026.01.28.06.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:55:45 -0800 (PST)
Date: Wed, 28 Jan 2026 15:55:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, elfring@users.sourceforge.net, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: au1100fb: Add missing check for clk_enable
Message-ID: <zytpnyodschvn4mmpllxp62yg3o77hjl7l5nyckoxyuvucjyaj@xsxbybnyzd44>
References: <20260128091004.2747011-1-nichen@iscas.ac.cn>
 <9ca6e1cc-7469-450b-a58f-9279412fb9de@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ib6mlg4lv6d3ff4d"
Content-Disposition: inline
In-Reply-To: <9ca6e1cc-7469-450b-a58f-9279412fb9de@gmx.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:elfring@users.sourceforge.net,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BF0C0A355D
X-Rspamd-Action: no action


--ib6mlg4lv6d3ff4d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fbdev: au1100fb: Add missing check for clk_enable
MIME-Version: 1.0

On Wed, Jan 28, 2026 at 02:29:37PM +0100, Helge Deller wrote:
> On 1/28/26 10:10, Chen Ni wrote:
> > Add check for the return value of clk_enable() andreturn the error
> > if it fails in order to catch the error.
>=20
> Why?
> If it really fails, the screen and everything stay blank,
> so it's even worse....
> It seems nobody is actually checking the return value, most likely
> because if it fails, the system will sleep forever anyway.
> Or am I missing something?
>=20
> For now I reject this patch.

I think it's the right approach to check the return value. If
au1100fb_drv_resume() fails, the system as a whole will still be
up and it will know that the fb failed to resume.

With the status quo it will assume it's properly resumed despite it
didn't.

Still there are some things so criticise:

	- s/Add missing check for clk_enable/Check return value of clk_enable() in=
 .resume().
	- s/  / /

While looking at the driver I spotted another issue: There is a single

	static struct au1100fb_regs fbregs;

to store the register values. This only works if there are <=3D 1 such
devices (and wastes memory if there is no such device).

Usually there is at most one such device, but it's cheap to move the
struct into struct au1100fb_device, and if it's only to make the driver
a better template for new drivers.

Best regards
Uwe

--ib6mlg4lv6d3ff4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml6I2QACgkQj4D7WH0S
/k6jAwf/V/KZI3V3blnkUAyYn5WOUUNFxqGteXW//6beysYog6Jzpb1C4mlGXCrz
n0fWqKVIY27RNNCLxI4sL1quIBg5vRMwsyf7IVbfHNYaxzRi4sKZfgnQy/tllR9n
FbnL5qqGG3K/wUF2QrX6ocLUWzb7aVJQUl2rNbISThQXQyMGYT5vs2l072QUUNpX
3kS4Z+yvHR7vGV8aXfOROrs/1jR7XtcWgkTGvzklOB6InxvlJEG083f7Ysqc8H37
w4tUAS5Obu7aXc8E1n8BYvllpWm05Vadpn1b7x+e9P6IsUXXF3gbH57RRyzBhhIs
32dWUnRSUh7TPqeDD6MmrcL/s7szJQ==
=/2It
-----END PGP SIGNATURE-----

--ib6mlg4lv6d3ff4d--
