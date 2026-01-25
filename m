Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPrUIpqHdWn0FwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 04:01:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5177F8E7
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 04:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A35F10E07F;
	Sun, 25 Jan 2026 03:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fim4JMsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B488D10E07F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:01:40 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-5635f3eff8aso717015e0c.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 19:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769310099; cv=none;
 d=google.com; s=arc-20240605;
 b=EdcMHePbGOztSeD8xbtBMumS/vzatXMhG/Fcuxt2hy5NYD1H9bkhvcfIslr1Efumy9
 gDuV/yqPOCztzZDWCnla29N6XMgONEojX0SqymWgTbv40WzfucbGAhPowW8fcJc1bdLX
 vMYmr7HbsQ9xvpfKVrjMHFJuqX6nvKE6Z2MTfbFw2mK6jo3gLPB2bNs9q+e/zLt0W8pO
 imoh1Pjf0X2dIY66uir7dT4A7qjinbjyIl8IDGko8xDWVNU8u3G6yPBgWdGfWljvEyu9
 ktyXcYX/62hu/xFppF5iC3jDfl1OMlYrUw7kZ8haDnzwrTtR0hFl8LmHoO7GDYPMsqEQ
 kZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hcWFM/HB6nnN5K2qLYIAW1J7U+avCqDxkAOsieUzDRA=;
 fh=OZsejbfnw1WyJ7qxml4/eoqApuoBuTjguQKsWOqRwEo=;
 b=HkIcjOipWebloRIMyHu1fJjg6V1WFoggRoYaxnwDsU0aWckL7OeDXsGdOybvuHw/wd
 WQiSb7bx38yj3s+PtP7k+5rgUyxfV5yPNkPjBb/hmnB1raR433nIJAFidqxaHp0ABRGD
 OxfRppQFlISfGux3buqpmFcHqvgyImqrrhgJfccJ1xDDXqO/1SEX6d8SntGoKubpV2Yv
 sJIgdi2vBi+SE/kYnlE2oVw7be6jQnDZGw8fGgz0ZHi3TXz1KrbtejUh6KoMwjYr4YeN
 oBpMoqG2bVKAY4c7ubF3al3tqCJlqQo6ZFWdIZSKI9NZha6rXpZxr2952z0AZZRU7Ajz
 1A+g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769310099; x=1769914899; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hcWFM/HB6nnN5K2qLYIAW1J7U+avCqDxkAOsieUzDRA=;
 b=Fim4JMsZOSB/h+GPbLFiB8KsQIC7MdbQkFI0mM5ouuc2AqU4zPTADKBSdYuebzASIL
 li18fSzWkn/vG4sWHes0zP9MLsZeITWkECjFQp0oCDjtjlepaeIYU2PzS9hJ2zZ6vBp5
 GRKtONpHUioZfPU01vEu02trT0+PSoXahVF58hFMRXB/DLNShBa+rNDnxgfm53UOwNPl
 rdk+XLPE28U3CWiMEVxmQwsoQ/oVXbjyDZeaoXyzs0Jvq7a7KH2ch+7eOMQrvEIErAkM
 Y38mOdxNGk2qoodjvT6iRKZxQnE4lyAEWsPASEo0I67rIxBlqpEmucrPnm/5/6sOmo6p
 Vtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769310099; x=1769914899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hcWFM/HB6nnN5K2qLYIAW1J7U+avCqDxkAOsieUzDRA=;
 b=hWl1306hdao5bVXCGKCMB6L1wEz+7pDyPNUjsQ86danycXhZYy0o2ufPCyPU39QJRH
 7LK2/SZddBb73+wuo1nR8Ih5o75mWXPP8nIMdpGSaxQHKu7fcV8XMZewSFxOezpmBHqE
 avpJ9m59xphP/CLWaMUdHxhMx8XOvL03WjJgWtcsw5g+O0wIRARsxJtSgVoeQV3YgmDH
 6d4Yf9POIUdQToRe1lWBRtvP4FF4gDaGvBDb2YItByV+MiBWJAouUJY6chg02jwL0SZP
 UDfVBk1aSQdByYDnwzCRfqqV1KLeM1PXUzbFS+pxTfsZarTWyQy04QEh7+imu9mpXFPk
 6Vsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeXexIPKBrEXpivw8E5lGOUbGKpSYQDm9iZnLvqBg5v1HRX60r77C2WMZl5x6MvIg4frl0NIuMels=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxohG9gjM7RZLAbPtLSihqhNjbJyMxmFt+EPB1xd81CUM2Qwgt3
 pwYmy1+DbPuGO1sE3mMNqs+6yrwrZ7VPDrN1TexvAmMq7WaOtVGwBJUvKCTZhnL/4zG3ZeY+Fze
 H0qMI9qzxwzZEMTHpzOf4SehuDhkaGj0=
X-Gm-Gg: AZuq6aKiHYNcCfBIApW2/vjiUkoC8cxRiCgQTYBl/T+6cPn8uTZiDMpvKNe3C9DoG03
 px1LcrGYYGJz3My42oQmdfUBdaMI6LdJAG7YyWecNwGOwCewlkj0yb8zp0P16/60lLMBDQfu7TU
 6Br3FHTNBcU0CC2ZzQjpF3eWaNYeKl8RbDfepG+IU8rXKT8zAw/GoTOPII3Y+OMwkEu3kzDp1+a
 cwi2g5/y0D7Nlf18FPpFbZ+bkpAxMpBdvVqkBMzrOmvjTVjOsaxtkA8ao2qbVjliuR5WA==
X-Received: by 2002:a05:6122:180c:b0:566:23dd:19b9 with SMTP id
 71dfb90a1353d-5665c95a387mr205074e0c.3.1769310099141; Sat, 24 Jan 2026
 19:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20260119082553.195181-1-aha310510@gmail.com>
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 25 Jan 2026 12:01:28 +0900
X-Gm-Features: AZwV_QilnwXmpNb4vsxKVjfib332OJwT0DkZJ_FMU5FrX5DjvtcP1yPCVewW67g
Message-ID: <CAAQKjZMHSQrowPWnWaO88Wynub00YjGLPnSNCg4n4CyNwgYtTQ@mail.gmail.com>
Subject: Re: [PATCH 0/3 RESEND] drm/exynos: vidi: fix various memory
 corruption bugs
To: Jeongjun Park <aha310510@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000f4f85106492d9bc6"
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aha310510@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daeinki@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeinki@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AD5177F8E7
X-Rspamd-Action: no action

--000000000000f4f85106492d9bc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mr Park,

I'm sorry for being late. I forgot to review the patch you had posted
before. I will proceed with the review soon.

Thanks,
Inki Dae


2026=EB=85=84 1=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:26, J=
eongjun Park <aha310510@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> This is a series of patches that address several memory bugs that occur
> in the Exynos Virtual Display driver.
>
> Jeongjun Park (3):
>   drm/exynos: vidi: use priv->vidi_dev for ctx lookup in
> vidi_connection_ioctl()
>   drm/exynos: vidi: fix to avoid directly dereferencing user pointer
>   drm/exynos: vidi: use ctx->lock to protect struct vidi_context member
> variables related to memory alloc/free
>
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------=
-
>  2 files changed, 64 insertions(+), 11 deletions(-)
>
>

--000000000000f4f85106492d9bc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Mr Park,<div dir=3D"auto"><br></div><div dir=3D"aut=
o">I&#39;m sorry for being late. I forgot to review the patch you had poste=
d before. I will proceed with the review soon.=C2=A0</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Inki Dae<br><di=
v dir=3D"auto"><div dir=3D"auto"><div dir=3D"auto"><div dir=3D"auto"><div d=
ir=3D"auto"><div dir=3D"auto"><div dir=3D"auto"><br></div></div></div></div=
></div></div></div></div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">2026=EB=85=84 1=EC=9B=94 19=
=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:26, Jeongjun Park &lt;<a href=3D=
"mailto:aha310510@gmail.com">aha310510@gmail.com</a>&gt;=EB=8B=98=EC=9D=B4 =
=EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is a serie=
s of patches that address several memory bugs that occur<br>
in the Exynos Virtual Display driver.<br>
<br>
Jeongjun Park (3):<br>
=C2=A0 drm/exynos: vidi: use priv-&gt;vidi_dev for ctx lookup in vidi_conne=
ction_ioctl()<br>
=C2=A0 drm/exynos: vidi: fix to avoid directly dereferencing user pointer<b=
r>
=C2=A0 drm/exynos: vidi: use ctx-&gt;lock to protect struct vidi_context me=
mber variables related to memory alloc/free<br>
<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_drv.h=C2=A0 |=C2=A0 1 +<br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++-----------<br>
=C2=A02 files changed, 64 insertions(+), 11 deletions(-)<br>
<br>
</blockquote></div>

--000000000000f4f85106492d9bc6--
