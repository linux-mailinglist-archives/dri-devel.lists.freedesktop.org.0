Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sApwNM+vnmlxWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:16:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF9194060
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653510E6DF;
	Wed, 25 Feb 2026 08:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ccubr1Vr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4996710E6DF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:16:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-65c01595082so9548041a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 00:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772007369; cv=none;
 d=google.com; s=arc-20240605;
 b=PVkIFvDJQEH4iwifLhOhtm7GCtFCmp3182Am7RnfFrR++UcRd7iciRbnCTmg1hF3Ix
 SqgISmQ1+IdxCFNr6Xx30Vc5rXpTrmQZKUnPoQlY3D55OKpebFHBQyNlUhKHeEuKgaWn
 ON+rxVKGf+z9TU8faDo7kQu5ZsOmuG28pCdlwo3jlQudSOZkZp6rNKJHAQRS7OP/4m/f
 yR4dUL+dumcyDWj1+pfhasld4sgChOUgfSTFYtZqRf2+y99Rng+ScaeEsVQJ6ZXE8WCr
 i6eCfgnoDy7m3OV+7TdBbFmQJo2OLlJcf6W+R4sv2vMR+rnLbouQB/GAl50Ktxvy+cS2
 /qNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
 fh=MJ4TRFAjljGnnqOx1ZCjdtF6d9OF5EMddWErXljaVBA=;
 b=D5MBQTxqAf9AaxcfKuCWVCKcJQs7Tel9/WQUVw7GHl7AHQoIdvmeE6qgdNpDB0T/8E
 d2nBe1r6/z4Kn4jBTKozUQ6mI4DlFEY5Tisda+Kx4bbxcgFicBksAz6hu/27BeJzdMR1
 N3bLwCDpTeCWbDfguBO+rDPa6qSKT69O8C4fArVAMDzE77rf0w7wwQrkt/djZ9zyTNbq
 a7qKCLS8jVt3P+6oetW3G7ztOgdLelXTlbbdjtBZZfvRT/xqDP2rtVAxn9wgNFziBCBF
 SB3g2D8vVoneyF6KSt07eIs8aS81gNnKd2F72OH9yU2Q2Qkrw/iqY1anb6feoucPxkJo
 TZ0g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772007369; x=1772612169; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
 b=ccubr1Vrura3zA2icbf/fYz6q+n8qUj+pKZsh/YDmClY96r0RMuvLIbI0ouyv6s10T
 +VjE+kMBj78R6olXiorZfAj3rm+1OvZZGovfd716iWFMXLZZCj9wD6lYL3svYItpS77b
 QP/82QpcMIWH2a0ifT8g3NPEPSii+skSUjf8QNBXKz14SV1TvdLANEHxyGvRCps9/uJb
 2AFZzCNSP73N1DYNxy2Cise9h1dPJ+w7DzOdgyWTk2pdhvh14onIYdsOKYaTeiiBPh7y
 T9P60zq3J/L1lOilFolwANfZtpjcAJRacLhjMRtdVYbGS2DD9VINSCc8BpGRKHNqh7C6
 Jz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772007369; x=1772612169;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2LJlLYDb1+QOSf2a+RA+BcJzRTj83OmLJeFRnjwCps=;
 b=eGB49Wmzz+QDm76eWv7+HPLzfFbH/XkeK+nTgHDyqEWb1vqYreWAiGqwRGADKpu/3B
 g6UVJH+74h05tLCRmu8gSBebf+9KaGVmmcO8ektkPDitpkKXIIi/dVQCLhN2c5ZUq85S
 a8fAbOEaCLL0Pmxazecr4jty7pwHBp/t9vXi66B/iz31nrX8j7CzcDUk593rhw0THc7g
 6XR805Tl3De2vD7Z+ekUyeYOQTRcWikS7C/7dDR6kWay4fj31PYaBYQUa3M3akKVc0lp
 CsbE5ZVgsiaHQcunrvFMF9FJshrE5HOjChtIHv3UEho/nM+wpxI5/rN1pJ6akbu1i3Bg
 k10g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiOqk9HUSv3C37qt+/aU9SNxbFWdxgriUnAcZgDo0oy3cWBk//XDO+rzmcQY7Qksht7eNDEUNLRiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZrrOsnpBFZS83TD9yEntLybZQpDKwOmZFi60eYwOoOyM01PXb
 vIpLa8sprmnFXGEbF1cC1XK/D7Z6WQQCgwPA6GzB5RLlK/imQwsQ1Wp60hDl75e+fPGLH5oA2Sr
 gbz1e85MQZgCHaiKp7eb0JRVY+Rx50uQ=
X-Gm-Gg: ATEYQzzTbOfuaq9PL6W4YbWEXV+cHbEyzJ0hcA3lFcxFAsuD1sKU//FmGOHhRWM141o
 4AkgEQS2/Beg3CNWfqSnh+31sID/A7eJPFbfJN3RUrsXoLnyZUXcw0tNdR/pnUOmpGSvQNqPNh7
 lQDxO/STKSLK6+y2NJ2BrD4QjyGc6l7WJfZ+pc5QunaZEQLtCYwbBB+hJt6FqGB0p2+IjETpT5J
 Awn7zC5tNgzG1aLfFZuIwGXv3n9kRU81DglyQ2D7HI8NNshL3EAhtAyUgxwRecSxkKu3soy65Om
 KqeFNg==
X-Received: by 2002:a05:6402:23d0:b0:65f:8b6e:e1e0 with SMTP id
 4fb4d7f45d1cf-65f8b6ee3eamr689444a12.14.1772007368034; Wed, 25 Feb 2026
 00:16:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com>
 <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
 <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
In-Reply-To: <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 25 Feb 2026 09:15:54 +0100
X-Gm-Features: AaiRm52dJLE1LivX43DCdk6HfEogq21vfzP2R-PH1LBTeVTcW8EPNiYL5Cy5zOU
Message-ID: <CAORyz2Ki5aPNbcY5-_mRwFgwT46VN_pRV2iP7z7x3snzrbKz=g@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robh@kernel.org" <robh@kernel.org>, 
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "mripard@kernel.org" <mripard@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ck.hu@mediatek.com,m:linux-mediatek@lists.infradead.org,m:robh@kernel.org,m:Chunfeng.Yun@mediatek.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:mripard@kernel.org,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:chunkuang.hu@kernel.org,m:vkoul@kernel.org,m:krzk+dt@kernel.org,m:linux-phy@lists.infradead.org,m:p.zabel@pengutronix.de,m:conor+dt@kernel.org,m:airlied@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:matthias.bgg@gmail.com,m:neil.armstrong@linaro.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,mediatek.com,suse.de,ffwll.ch,collabora.com,vger.kernel.org,linux.intel.com,lists.freedesktop.org,pengutronix.de,gmail.com,linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 43BF9194060
X-Rspamd-Action: no action

> > The mt8167 DSI controller is fully compatible with the one found in
> > mt2701. Device tree documentation is already present upstream.
>
> If mt8167 DSI is fully compatible with mt2701 DSI, I think the binding document and device tree should be modified.
> In device tree,
>
>     compatible = "mediatek,mt8167-dsi", "mediatek,mt2701-dsi";
>
> And this patch is not necessary.

Hi, if I understand your review correctly that's what v2 [1] of this
patch did, but the change was rejected during review.

As far as I can see there is no win-win solution here. This tricky
situation derives from the fact that in last year's submissions the
change was only partially merged - the bindings went upstream while
the driver did not, and now we have to work around this. In v3 I tried
to address the issue by actually implementing what the binding
document says.
I'll be happy to resubmit v4 but I need to know what's the consensus here.

Thanks!

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com/

> >
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index af4871de9e4c..ad10e86b161d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1301,6 +1301,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
> >
> >  static const struct of_device_id mtk_dsi_of_match[] = {
> >         { .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
> > +       { .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
> >         { .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
> >         { .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
> >         { .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
> > --
> > 2.43.0
> >
> >
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
