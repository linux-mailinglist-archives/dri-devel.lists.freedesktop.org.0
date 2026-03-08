Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DrPF5J2rWkC3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 14:16:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109DA2305F0
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 14:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8365D10E06C;
	Sun,  8 Mar 2026 13:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UdIMsgoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CBF10E06C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 13:15:57 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so3516055e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 06:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772975756; x=1773580556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W16o/5pYkG3GvaHOdd+xpHF0ibaFhIutuRk+8zbaIXo=;
 b=UdIMsgohadtbwsK5hcRWw/LKhDT3VVyO2wuV5hs0EaAsEcrPQzYjFf7xz5P6aMW2oD
 7ja/PfPv1HdlW85fhQT601nJsgYzpK1I+bm6B36jTMerFi4hPdM7l3ogkOt/se4+06wE
 7UNfD9qYOGCYG5Hl5UB9bfZr0o0ujNNfpQB8b3ddCKOSXxQk85EwiYHZOKLM9+ieADSi
 bRdv7nQGvdzvnokUwMt9HzT7Jla+3ooD0Nuf3iX7DyNf74yWJAwqmnx251KYw7pLVu6i
 82kng8hnYBxxnZChxgjTuosz8VhFQCwrkooKlIjXJRrmYUV/w02xKFluE8grCvHaqC/k
 yuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772975756; x=1773580556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W16o/5pYkG3GvaHOdd+xpHF0ibaFhIutuRk+8zbaIXo=;
 b=GkIFXy/mYXT9g4mFIidumkfigkZlt+Qz7+wYxtDpRUjGwMb+FfE061u2mROlBd/Hyi
 1jx5dVWk/l4ambJ9oIDaRZEfGIXzTleOQQI1jUGkb7CfAtuZZWskoeFWvFVrXjuGk3N3
 Ttc1ZLpJY4aq/Nfn/XbK6hEZyvQfQJYwJpnJHm7E01Zhebv87vRtRfx86fcuzQZ/1p22
 rOZRErw+h1F98pvPu7Dc2ISIodjKGFKDpULw16ShGKjBszCmHdH26xZ7eMuxrXjuJKdp
 ATz7a7EXakQdQYQGyNQNL3FsBQEN2iaNZwYm3fO045H4oJF87zLMubsGoHVCYhu0HUK2
 iXfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1sc5Fk8uitc8LbJbNsxV75G9V/qK3YwiNWl1CQSIMazARkkQfvGaiscTgjogKgahqtGHR9TL+ze0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBIvSTW6P+LqXXRFCbkGT4UvFtv2K2cyZvXWn9v8j0aCbXxcr/
 cFdSHnEbSEVL/vDvW3oCOKZ0GKNkFVIh9klmXbXluYyCtyGNwMao1isg
X-Gm-Gg: ATEYQzxuPnd7hclGHL2bFHt+JWTspNQqPQytp9YVXacxGSLwkg0VnKW8lvSiRQSc8uL
 eIE292/E7lk2XthA3JAHN4l4PMOqbj5XFmJooRDfsxeiIjYYd/eHpJP5y4OG62k+0cpct0gh6e9
 +yR1591JSz+PYkFNy5snqY2b1DgdCYo/jAhgSWlusrXSwqSmRfOGk3RtzmHKBoaXNnXy1XqS8zr
 xCTg1hI4iwnq+ohLNHgeRgwdZpcUXO+htq37f+hO29CXMa3ByfKBp3yL/5VgT4CJ1Fy8fyNJcJI
 zmdK+PF2Y+tYB1YipY/ftHH+DvpIpT8IbBVsdELw8yhw2XZvNEN0/8P7HOQimoQAH3JulrrOmI+
 7LAR1GgG0MbpKEVxL5jdH+lLueuOV+ggTbKm7X6ygRLCZZ+VyO6wb16E+Z7TmiTp3a2BQW+bNj5
 ryTIEewupaSrDhQXPaZ1QaHH7mEkhCqlnR/KXFv3r/HmsqEw+nC3/CUrGHQKhpPj2075LZdcRF
X-Received: by 2002:a05:600c:b93:b0:483:badb:618e with SMTP id
 5b1f17b1804b1-48526923941mr132168465e9.8.1772975756097; 
 Sun, 08 Mar 2026 06:15:56 -0700 (PDT)
Received: from timur-hyperion.localnet (5E1B97DE.dsl.pool.telekom.hu.
 [94.27.151.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852f6994a1sm92743425e9.9.2026.03.08.06.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 06:15:54 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Hung <alex.hung@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, "chr[]" <chris@rudorff.com>,
 Sasha Levin <sashal@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 for 6.112 and 6.6 0/2] amdgpu: fix panic on old GPUs
Date: Sun, 08 Mar 2026 14:15:54 +0100
Message-ID: <2332143.t9SDvczpPo@timur-hyperion>
In-Reply-To: <CAKxU2N9MHp+m3A0w38pfGEJUkLKCCsLgvmgAG3sfSn-Rhc0sgA@mail.gmail.com>
References: <20260228045356.3561-1-rosenp@gmail.com>
 <5828571.IbC2pHGDlb@timur-hyperion>
 <CAKxU2N9MHp+m3A0w38pfGEJUkLKCCsLgvmgAG3sfSn-Rhc0sgA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Queue-Id: 109DA2305F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:alex.hung@amd.com,m:gregkh@linuxfoundation.org,m:lijo.lazar@amd.com,m:chris@rudorff.com,m:sashal@kernel.org,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linuxfoundation.org,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wednesday, March 4, 2026 11:23:33=E2=80=AFPM Central European Standard T=
ime Rosen=20
Penev wrote:
> The DC code path just works bettter. So what if suspend is broken. I
> would much rather a working system. Hyprsunset for example doesn't
> work without DC. No idea why.

It's great that it works better for you. Unfortunately that isn't the case =
for=20
everyone. It wasn't feature complete until 6.19 so it wasn't a feasible=20
default until then on these GPUs. Since 6.19 I would say it's pretty good n=
ow.

> Speaking of suspend, the fixes for it are fairly trivial to backport
> to 6.12 as well.

Yes. I don't understand why those patches weren't backported.
Like I said, I sent them for backporting to 6.17 many months ago and expect=
ed=20
to see them backported to older kernels as well.

> > Now that the situation is cleared up, is there anything else we need to=
 do
> > for these two patches here?
>=20
> Speaking of which, it's probably best to take over here. It's not fun
> dealing with stable. I also didn't author these patches.

The question was meant for Christian and Greg.
What do I need to do to get these patches backported?

Thanks & best regards,
Timur


