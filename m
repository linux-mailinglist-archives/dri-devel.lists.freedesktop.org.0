Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iExoNt9QimmmJQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:25:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C48114CAD
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062F810E474;
	Mon,  9 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LMIN+10I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033D110E455
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 18:46:56 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b885d8f4092so581776166b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 10:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770662814; cv=none;
 d=google.com; s=arc-20240605;
 b=ksBYM4efsEuQAsMazpXTCbIgFtlcPcAQ+e+c2yOIUSZ1G/XbDo0DlIrW95qTEbXarC
 Lvav8d7aw8c3OJoo1IYeYSZu6Aj+BH/hSR9uWszzJTntnVG6fmErJlB3IwI6lXNpLgPk
 0LtppfuyrUaTXiWaPzYFjK8DAOo4mJIFLa0Kuz//Xg6vi7EOKli1XjGqZDnunhwt1xNN
 m/tzE9VrAliksPnH0YYVQLTFATssGzqwAIcvPaUaOgUpyNSywWtNdCso87Zyv5rCxSdG
 M0s+pdT3Tt9pslniGeFHtvwZyz3P3Mp0sCRLn3lXkkuGe8WV4tgNZ317cg15qc7HNNZ5
 c4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
 fh=tL67ObkRl0tzrO2eIWWQi119QRuaqloJZI8H7sO/62g=;
 b=XjUmVv8VnAs3uXthUyHvaOLQijPfMLSg/4dvC72Z8ROayaaVBFblF/3h2pVNX0+x1j
 d9EbmGMXZXRnHHwfitXg/4Zi7KRQyTefCEjrD2sRhE35EzIGnhdeQ3a1BGLAE6oaOc6G
 Rb1dmrEl4+uwsvlowExUWAr+NjQcJeR9NFr0W9zjeWTKHPFDYEqUilnBtXOIaElHPmQf
 jgyP3q93kU1WKNQmjuOiVVDgpGwF3mLEpEuzWhoaC7shNofHNPOpHJ3cLPIxn8qujPL9
 1N0QMxoDY19S9OgsjYxmA4y+ejVHLpjywxYLXkh3EyhntqDeNQNLyASrjtUytuhMgY3l
 Vmhg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770662814; x=1771267614; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
 b=LMIN+10IiS9jP0RXqer8rZSmt6cFm0U3hlCpJgeNsGqi7QF5URcMzkCVYLNdPOdp4d
 2M+dfW+n6ZHgACPugjgC77dY9kClQPnBRuzPUHD40tG6ifFLfZqs4NWYOrKH6HDUu54S
 6I0eOmI+9Zn8qXQOBuJ3jJ/E8mKhyhKZ+uV5tpkLQgQOs//wLnHO6/FsLcnMnoJUr13H
 AjvpjWiHu6u2OVfctArfQMgXCUINdDAwFrQvFELugbtTTLOinYY67GvRQ+kd6fTgq5jT
 A7b3RxA5uqfLtZi8SL1t8jEwDL7EKrf0m/7pB1lwB/s41LkYioUk50MP77qP6h4vocBk
 OKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770662814; x=1771267614;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
 b=GVWFcazH0heKhtUFOqvh+uIoyARVUna89Ju4XZYUfl335p7v19mVJzp+RFzSdWy+/x
 ZlOfZv8paEoduz+A4c7dDjjHCObK3mjSXY8lVOl2UyWC/ceO6urEZs+bbQQ//QeSaGRH
 UE+l/Vk3YR4kIaOvgiaJkBWZqigwppgwWP7nr6SpNyDduZNEqVEVnDJ/cvTWlDxGaC5P
 lWEbrGZVd/PII9tbudOx9XlNm206wxf0IY7yNTZWtfTWESaWc8KeqGKBtviM5oKywn4e
 zn2g1pR2p3NU7S0MdiFVoji5A+T1m90NB1JyS9Dx9WIkThZty0fmtL4rAhJCI7f5XVhK
 TL9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVylfrT5KR+2dOnIF/++978n45npDsa72Vkn0b9iz5Fs0yzTdYwfSE4wZ/Cje2Y+I200d9Cjqr0g9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1OzXmBjbiOYN7MVbvDWVDTDYizPpt+2EwZ16s0yucYF2c4vIT
 ahB5rHqPmj41uvkYamwWagswib/TzrKszuaFrUZSRwZHR+1EHoEtt30ezJz5BPiR3L2jje9WtR5
 vHx77VwvX6PQKc07nCL+rMXW0u60eaf0=
X-Gm-Gg: AZuq6aJT99T7iGS4iuzk0eJLc62YlPAYy7IW1oAROpbutqJ2x+729DZxnWltsKEyCb1
 nSQKynGSUQrvMRLJqRBcVBjwsuLQuhc56xths1qG15S73yJFYzQX1VCHRhBWRnkEzHkxb7lX6t6
 IpoHgaAvGOh+qqk8vlYVLnbECHTlLQbnbMviSdfUwJDB4KyqtVHUIAxbCcojKTBcVGC4+UjZ6VJ
 ClhWAR9E9m3NAAMKF/zIE+Ls5RQ/ODitbNUzoZtlbjSgX05F+2wxY8AdpfS1qu05+SRDQ==
X-Received: by 2002:a17:907:2d22:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8edf34115emr746950966b.50.1770662814147; Mon, 09 Feb 2026
 10:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20260209090516.14369-1-l.scorcia@gmail.com>
 <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
In-Reply-To: <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Feb 2026 19:46:42 +0100
X-Gm-Features: AZwV_QheTmAVmlDGudBbkamp8UbdQU6-uwWFc-1fInCP0BGz1DgvN8YwMPCQ4dI
Message-ID: <CAORyz2J=zEMgNS6n6ouVZ3QA1moYfP053Jr5vhcscR9nDmKOfA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Feb 2026 21:25:44 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,pengutronix.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 28C48114CAD
X-Rspamd-Action: no action

Il giorno lun 9 feb 2026 alle ore 12:40 AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> ha scritto:
>
> Il 09/02/26 10:05, Luca Leonardo Scorcia ha scritto:
> > The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
> > which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
> > structure needs to be stored inside the driver data before invoking it.
> >
> > As drvdata is currently uninitialized it leads to a crash when
> > registering the DSI DRM encoder right after acquiring
> > the mode_config.idr_mutex, blocking all subsequent DRM operations.
> >
> > Fixes the following crash during mediatek-drm probe (tested on Xiaomi
> > Smart Clock x04g):
> >
> > Unable to handle kernel NULL pointer dereference at virtual address
> >   0000000000000040
> > [...]
> > ---[ end trace 0000000000000000 ]---
> >
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ... but wait, what have I just read? Xiaomi Smart Clock?! MT8167?
>
> Are you running upstream on this device?
> If so, why don't you also contribute a nice devicetree to get this device finally
> upstream?!?! :-)

That's correct! Most of the work had already been done by the
wonderful people at postmarketOS, I just had to connect the dots. Some
crucial patches (mt6392 regulator, mt8167 display nodes) were
submitted in the past but weren't merged for various reasons.

Just rebased on v6.19: https://pasteboard.co/6bXQeWlwUqmz.jpg

I am trying to get it working as much as I can, then cleanup and
submit. At the moment storage, usb networking, rtc, buttons, screen,
touch, backlight, light/presence sensors, drm and gce are all working;
still missing wifi/bt, audio and cpuidle.

> Cheers,
> Angelo
>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 4c2983852596..2358407b8a6b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >
> >       dsi->host.ops = &mtk_dsi_ops;
> >       dsi->host.dev = dev;
> > +     platform_set_drvdata(pdev, dsi);
> > +
> >       ret = mipi_dsi_host_register(&dsi->host);
> >       if (ret < 0)
> >               return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> > @@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >
> >       init_waitqueue_head(&dsi->irq_wait_queue);
> >
> > -     platform_set_drvdata(pdev, dsi);
> > -
> >       dsi->bridge.of_node = dev->of_node;
> >       dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> >
>
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
