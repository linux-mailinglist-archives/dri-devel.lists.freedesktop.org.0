Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21796479BBF
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 17:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C29112CCE;
	Sat, 18 Dec 2021 16:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB81311357B
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 16:23:25 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id m12so8343180ljj.6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 08:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CT+taMHRza/UDXhL528VUpODcNvw/ubR6oyOC8X9Wdw=;
 b=Tv2DOX79UEnrnuO1h61dSfhprFrMdKLtswO+OTm7IXUY9NoSJTSi0dUhq799rWt2Rn
 HuuFjJhzNnl6u6wC72VmiEnOmLgqkC8GduhFHPLWCr+ZKsYOi2JgriM892VkS76AOkxw
 8HzaW6jyu+IYAkEOFl8ko1bp699GbC51xsl0hTjHECg07nMs2sNgw9tWanSbyru1wRM2
 Xuxk0BvjAwQtRbO2ABqVmue11+Wk/saDy7Y2tsNrIqlExpXNqj3wuIhxmSejlVc/mXHN
 v0AZHySQIVH59HLbTDt0L6rc73vFb4LXJvzgSqxhyegXsAP3ACtD+rB/BpSi1kpECUvr
 axQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CT+taMHRza/UDXhL528VUpODcNvw/ubR6oyOC8X9Wdw=;
 b=B0Pdr1I3qbM3glojk68wCZS/PzkISQNGC9Gx6xpfU7w+G1j8VG4nptXMePOx9MezM3
 xajZNF1Kuw4aohI03lFTYTxsJM20KN42o5hhXkPkEjSRjvbJKYWNeTYSSQFL00Pyj8rH
 agvX63tXWCbZ6CidyMELzya8VoNYUHSFmEwnRc2AgQPRFcb2kSyRPK9N2Yg94HV8aDmI
 wYtcvezU0vvz8WLvVpao/Zk2uYpnhaHjtCOM4HENSogpmKrTFH4D3VRoa8obv3GU8/F5
 dH64vpEiR5wLcn6Qd1fWLqaBHlSNB+K//CLO7cD8SH4SiMIwA3Y0L7ppassPo1RMI1pm
 63kw==
X-Gm-Message-State: AOAM532nxhJTn7bopxrybfJOfAQ1CxMIbSSraZhVQWvpOa8X+w53Z3Lz
 eeZGtXflVRdeHGMOchG2iV93Ov0paEOOT61paaM=
X-Google-Smtp-Source: ABdhPJxJnfSrLNaqB6iW92bjbg8H0Jtao8C93yQc/c7+tg7Mc5frwZ1wHJsJrj4GnPjDYB2296jlkQ1KjD3FYhAavgM=
X-Received: by 2002:a05:651c:323:: with SMTP id
 b3mr7271328ljp.316.1639844604258; 
 Sat, 18 Dec 2021 08:23:24 -0800 (PST)
MIME-Version: 1.0
References: <1639473108-18629-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1639473108-18629-1-git-send-email-zou_wei@huawei.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Sun, 19 Dec 2021 00:23:07 +0800
Message-ID: <CAFPSGXZLWmahF+ptQC2TT84rB6E0v=V2c6ETkKAd4GKP3c756A@mail.gmail.com>
Subject: Re: [PATCH -next] drm/sprd: fix potential NULL dereference
To: Zou Wei <zou_wei@huawei.com>
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
Cc: airlied@linux.ie, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech, baolin.wang7@gmail.com,
 orsonzhai@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Wei,
Thank you for your notice. I have received it. I will be fix it later.

Best wishes

Zou Wei <zou_wei@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=8814=E6=97=A5=
=E5=91=A8=E4=BA=8C 17:11=E5=86=99=E9=81=93=EF=BC=9A
>
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 2 ++
>  drivers/gpu/drm/sprd/sprd_dsi.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_=
dpu.c
> index 06a3414..920cb7d 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -790,6 +790,8 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu=
,
>         int ret;
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
>         ctx->base =3D devm_ioremap(dev, res->start, resource_size(res));
>         if (!ctx->base) {
>                 dev_err(dev, "failed to map dpu registers\n");
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_=
dsi.c
> index 911b3cd..c90a950 100644
> --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -907,6 +907,8 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi=
,
>         struct resource *res;
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
>         ctx->base =3D devm_ioremap(dev, res->start, resource_size(res));
>         if (!ctx->base) {
>                 drm_err(dsi->drm, "failed to map dsi host registers\n");
> --
> 2.6.2
>
