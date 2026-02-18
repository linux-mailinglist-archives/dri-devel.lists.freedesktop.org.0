Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dTUIKDhelWk0PwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 07:37:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A5153777
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 07:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF21610E197;
	Wed, 18 Feb 2026 06:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZXByU6x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D71E10E197
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 06:37:40 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-64ad019bb5eso4514442d50.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 22:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771396659; cv=none;
 d=google.com; s=arc-20240605;
 b=Xffv9CXZ/2CO1I5zzq1KxSqE/sZi4/2bvbxiTZZ/kpoUd4b8YJlfOskuQaK6p24z0g
 QJgDZsTsukFCoGKeCoHZmSaeSjEiGiid5YMmpnDBJduO0NLIrLJ3PD9vhe04YM20GyPe
 0pD8VM77lSJ3QXLeoj/4bEKfoqMAZQj0zLj3NX66vJADDpTmxQTTeKLfQr4TdBkDZj/b
 lz0hCA+z0SBS0Mb4W5V6qM7FP6kLptTduxAnlg2O5uYXmOUQRQMC0SKVRlc7GHFSxc6V
 2sOqEeDnfBUhCVy4uh6XRCYkwnud7lLAEM7cZDVcZMNQjvmamtihySG6CBRe+nwZ6Z5s
 GSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ds7YQxw27ANmnMy4vFgBOW8wmj7bD1TJWIiuI1meKdw=;
 fh=yNAJp0lFt1083z+WKXpbl1i6+f4nKC7EuF0VxflM9Wo=;
 b=jzORYx91elJNVzYHPmMscvNDSGpHeXt/x8+1efEDEjO6igFWIQe/cscO2WZ3PpLXnY
 xYGUoNDfPNcEpt6qGsl8O44a4dO4YAFkdvyAUEBt6ShfAT9c2dC1PQDyIRMnsu6IQqbv
 E6le4ldXUyxX6JDbxaRH95+xnz6zCdiKcYI/5Py+DwieWI8R/dAgEZysAk9wxXaFSnk4
 /aM18pK1w9H8iOgZGw2mVSUMsog2HYVIrw5vkIGud+TOc6NmDICo6es0kAGXjVmPDh77
 FNdm5BJQac56i76GucsQA+YOw8PYHI2/LdacdaGwyLObE2/YoskP2XA3bdhoEmcXhgeW
 gomg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771396659; x=1772001459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ds7YQxw27ANmnMy4vFgBOW8wmj7bD1TJWIiuI1meKdw=;
 b=ZXByU6x9JmOHoq5hOBNC6iF/BLZm8E7U3mS9YVeTUwsDNSgS5eSz2GoyKbREI7M6hf
 B1ypzRlEE3NLbAHWdTYbnD35RREba1ErUjb4V4Xxw8znytqnYxaX2DI8pG7Xc/QVsHBE
 J4Z3V+F42VAZ8prLINDS4leyhsQZRvwCvp5qy9UDEkEaYeqSTP8YprcUzF54WvabWpvT
 ThZub37HcL1GLXcATNxXdaRm7GBwCSRnHuzE4uYmt9+3keZyJ9nOAJiHc8TyEerAgFSj
 eTpan6wJOYOH/dff0wXFuTYjCS0DWBPKYS9fjPcInmmO4Pg8aJJT3WCGHt//k2QKwV1v
 Xa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771396659; x=1772001459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ds7YQxw27ANmnMy4vFgBOW8wmj7bD1TJWIiuI1meKdw=;
 b=AkWEQRWE4pIYRa295MBXewKXw//EQCr71EVBvkIO9Yw8j5/xbFVzkimRg7nQbIR4I9
 sgBmnRzFHEptEvpWL9RFdL861O4FOadRP8SmRnJMx7Z8wrunIvNP03JjLNsNQ5eGYDUI
 4J3UnhCBzpB1ShY//LVMzCzDd+yLv0iQd5zef9NeDlUmDY1kU1RAFWvEMnKwd1DJuKw6
 hhEX/3Jrt+lGwFEdekqBwLtL6leYkrGqqcIHrO0iimwoaDCO9OjDVc9Dlo7hGZQD7A8D
 TEXTmmOprQvYdZnQm0D/Xdp/tFWRmFW9YmNmGQoAPO1pu5riLZ1LBYliiRiPmnCIvT9z
 lTRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGEbavDaeL88wgubf7lahHanEFztaM/CsQOu3noe6Kn4p+ned4uU9IpvvKNqD7l1IiXvhqunNjzD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf4NvqhDgDliEKc5cU+TwSkBdZtVyZkQ6fDYgt9E1apzxLH7Pc
 ubQP3daoeEv75wgGAcJvgz1v8RcsPSvDhN+pqepYOe8AuFF6HAsb830gLJxHcFjJIi6PIGdnfl9
 KU+r5RSckXGPgF0QcbHbnrhBUAd6kWeQ=
X-Gm-Gg: AZuq6aKu5t+Le2NB2FsdN6zw9WaCzZqfYAObej/eUuDng7GNhu2Lspn++isPE1xdCbR
 73Jb9jM8htTJ48mdnvRu63ttz8KBDPjInMRhMd9G+hlM41xI+PWNinApZIBxFr7jLfvQvZY61WD
 3T5SXjfOrrX/Z52Rc3rwl1v5x9NVfjUA5U+RGReS8RnAy1+oqUQOvS1tPIBemZnqR7D6Jg3ZGcq
 1nI/k763S9JPcu5EsoqOS2qZym4dDBGxEl5uusmtNzzgZYJPByMByCJDEl9GC1mN/pAicTYiGN/
 V3PD4/0Jg6DFro5LOpmm0Aa2Fth68/gY1/SCMw==
X-Received: by 2002:a53:b118:0:b0:64c:21c4:d017 with SMTP id
 956f58d0204a3-64c21c4d535mr8472876d50.78.1771396658906; Tue, 17 Feb 2026
 22:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20260217092738.3238016-1-wens@kernel.org>
In-Reply-To: <20260217092738.3238016-1-wens@kernel.org>
From: Archit Anant <architanant5@gmail.com>
Date: Wed, 18 Feb 2026 12:07:27 +0530
X-Gm-Features: AZwV_QhuV-mjrGEKCT_oX3GbO4x-xStrhOVF6asGfzRrTBmYvZQLSDtpj0Pd4JE
Message-ID: <CADJHxWB5b2jMXV2ut49beh5gc1ebfYV+yS_WfFeK=PiVaHw1+g@mail.gmail.com>
Subject: Re: [RFT PATCH v2 0/2] drm/panel: sitronix-st7789v: Convert to
 mipi_dbi
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,collabora.com,wolfvision.net,bootlin.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: F21A5153777
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 2:57=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> Hi folks,
>
> This small series converts the st7789v panel to use the mipi-dbi helpers
> for register access.
>
> Originally I intended to also add tinydrm support. My purpose was just
> to test a TFT module that is on the Avaota A1 board. Archit is interested
> in working on this driver, and I already used his/her previous patch to
> check that my TFT was sort of working, albeit probably with the wrong
> internal parameters. So this series will serve as a base for that work.
>
> Patch 1 adds an option to invert the reset GPIO logic in the mipi-dbi
> helpers. The reset logic originally assumes "high" is out of reset,
> so an "enable" GPIO rather than a "reset" GPIO. However the st7789v
> drivers assumes the proper "reset" GPIO logic.
>
> Patch 2 converts all SPI register accesses in the st7789v to use the
> mipi_dbi helpers. This actually reduces the number of function calls,
> as the command and data portions of each message are combined. This
> conversion also lets the driver support 8-bit plus D/C GPIO transfers.
>
>
> This series is unfortunately only compile tested, as I do not have an
> st7789v panel that is wired up for RGB input. So please help test the
> changes.
>
>
> Thanks
> ChenYu
>

Hi ChenYu,

Thank you for sharing the series.

I=E2=80=99ll focus on completing the transition to the mipi_dbi helpers,
ensuring the reset
handling works correctly with the optional logic inversion, and updating
st7789v_check_id() to use ST7789V_IDS_SIZE and sizeof(ids) as discussed.

Although I don=E2=80=99t have access to the hardware, I=E2=80=99ll make sur=
e the series builds
cleanly and review the changes carefully. I=E2=80=99ll also verify that the
8-bit SPI + D/C
GPIO configuration is handled correctly at the driver level.

--
Sincerely,
Archit Anant
