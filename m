Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9DA8BADFD
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF3F10ED26;
	Fri,  3 May 2024 13:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KjXDPamZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E6110FB38
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 13:47:37 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso9132221276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714744057; x=1715348857; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g3ua50wpq46PgdKK2kII6t9P1G0JXIDxe02SWFIKB2s=;
 b=KjXDPamZsOV1H0wIdbIC101oWGYqaXbSOau4U2LV0rYjt2XPAt5JC+nQ0IxMwu1zow
 vXBWZdoI8ouBe+zX7n3V/c7bi53kvuDbNwMxNMf/NNa9M98aSducLdRBm3eJaaSjJqeN
 0laFDZaG0pvnkOnF07Fy1pXLMaP0t9M3BvLzR/rpe+WfUvEilBaazKNFs04UrYCDrGLq
 ZZ8saNvMNBZL6xvkbiDeYzcpPeEMh9HQukk/dLovaGprLMv+ZKeOPtgkkGHv727VXg4L
 gUQx1CNRZoTlJR521Uh3ODcdGKLnVCr0hBVgSRgmH/9mHYjIxaV66XdzB9jWGuh5HCIk
 UtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714744057; x=1715348857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g3ua50wpq46PgdKK2kII6t9P1G0JXIDxe02SWFIKB2s=;
 b=HTnFyImKZOYlsJUxBEV+HQShswJ6uAxS04UFQB5+/tn94NvECSQ1WFV76fl4QoHmqK
 bndRPcvCOENSH1nz6Po/8eoybmEd/TMfESiqLhZvMHXXWnVI5GKp8I/0Zk28bbSN7wpH
 UsrVV9lpYIRrzOZZX1PvBlo+1t5VxJ2y46o+K4nH8GCw40HLaLKAO+G5EdVbgjNq3kJR
 oNNQESpjFIG1hBlIVAQE6Tjb5zEauEUcZYEq+6DL0fKoq8pQVBIt1a4fXO9HVkVlY5Ma
 z7AajPdg2ADXdhDtkzIoZepBfUqGKdfD7cgDF1KYPSYTC2Q/8LXzl5myRYZVf5kp34K5
 w9Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuEKo0akivgpbtTD3awP2ud6Z/NeHzoSPCXK0fIqPdVxtmXRow2L8GeGe3rBIhguyqMnCbX6viBBF/JhgGYOidZC+kuIrhVKrmXrJ5vnQM
X-Gm-Message-State: AOJu0YyECyRnPERWgrCz7QKPqLQHGz5IDWXNlnDW7HeuEHV1r8xs6LW9
 riuGpdNcsCbgw0G9gDNDGX/SCm8tIyYt17IMP6PUHiGxtpKTk+VXUrABPAKo1x7bl9XfkEt6Gh2
 gkE0E1m0TUhXLOYAZDjA2euiNA7V2ovLVsPsuTA==
X-Google-Smtp-Source: AGHT+IFCuW+7abwZEByNtAeiagPvZZDoW1SqybjOPgHEIkI9MFnN7S85ZcrViqmJw/BY7SH5+t9n6nJVkwGDYTNHIL8=
X-Received: by 2002:a25:b115:0:b0:dda:a7a9:7b59 with SMTP id
 g21-20020a25b115000000b00ddaa7a97b59mr2785467ybj.50.1714744056830; Fri, 03
 May 2024 06:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-ti-sci-pd-v1-0-a0e56b8ad897@ideasonboard.com>
 <20240415-ti-sci-pd-v1-1-a0e56b8ad897@ideasonboard.com>
In-Reply-To: <20240415-ti-sci-pd-v1-1-a0e56b8ad897@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 May 2024 15:47:01 +0200
Message-ID: <CAPDyKFrGJFy87STpBcdUKaVCRg+PKDKKSZHMkbeSHsVGe6urQw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] pmdomain: ti-sci: Fix duplicate PD referrals
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
 J Keerthy <j-keerthy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Mon, 15 Apr 2024 at 18:00, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> When the dts file has multiple referrers to a single PD (e.g.
> simple-framebuffer and dss nodes both point to the DSS power-domain) the
> ti-sci driver will create two power domains, both with the same ID, and
> that will cause problems as one of the power domains will hide the other
> one.
>
> Fix this checking if a PD with the ID has already been created, and only
> create a PD for new IDs.
>
> Fixes: efa5c01cd7ee ("soc: ti: ti_sci_pm_domains: switch to use multiple genpds instead of one")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index 9dddf227a3a6..1510d5ddae3d 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -114,6 +114,18 @@ static const struct of_device_id ti_sci_pm_domain_matches[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ti_sci_pm_domain_matches);
>
> +static bool ti_sci_pm_idx_exists(struct ti_sci_genpd_provider *pd_provider, u32 idx)
> +{
> +       struct ti_sci_pm_domain *pd;
> +
> +       list_for_each_entry(pd, &pd_provider->pd_list, node) {
> +               if (pd->idx == idx)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -149,8 +161,14 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>                                 break;
>
>                         if (args.args_count >= 1 && args.np == dev->of_node) {
> -                               if (args.args[0] > max_id)
> +                               if (args.args[0] > max_id) {
>                                         max_id = args.args[0];
> +                               } else {
> +                                       if (ti_sci_pm_idx_exists(pd_provider, args.args[0])) {
> +                                               index++;
> +                                               continue;
> +                                       }
> +                               }
>
>                                 pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>                                 if (!pd) {
>
> --
> 2.34.1
>
