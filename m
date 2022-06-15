Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A6654C612
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 12:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106CD10E082;
	Wed, 15 Jun 2022 10:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579E910E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:28:39 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id hh4so7793959qtb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5AvCzV/qAuI7bWpBXxG/Nqj5ArEGXpfhZRBeCyeuUgQ=;
 b=B7T3jGhOh96+HQqjFaBvXx5Qblxeyq2/IWkCavhwANY5BJ082XVB/INkKlWXB2CWjM
 +wlATX9xcmkvr9bgTz9LIjzi1KhAnGxma+tTljwi/THilaWMX8L/THptViEqmg7swLtl
 fAHBVQTt/eqdmjZBVO25k3eDG9BIisH5JsrbFucnPeNMpkXhaPwfwGnLmOVrFXl+8Ax+
 cvcidu0blDozQMvNgEYs/+lcWAc5fKXjB8iIhNAELyHTGRCRP0+LSghteu5x6XPWQu2C
 rqEm8E0t9Z+niFwJvrgoQ5UHrViJRpmS2fEaSLFFWaAL5id2aEXRu/DxAO+EfAcYGtmV
 hdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5AvCzV/qAuI7bWpBXxG/Nqj5ArEGXpfhZRBeCyeuUgQ=;
 b=SScrWB7bEcfyqJLaLClqdjH3IFweA2saa334d8sDj78ADmeigZuus5m5cq54YlC2mv
 5y++BuUqv4+YbjNYnQ72rYnZl/nUFI+cZla74b45nL+1XTbwPmp5tGnXGfYhHhBaEczT
 OojsqwMuVN1rDzfkd7rWcD0UqIbLcU34x/Ptv2E1nDXIGSBofkHCbmb95eka9j65SN0s
 TAj0VgDc2SHsccH1H6cBGWTwEaINGjuTG+RvELENYRQpiZ5LDGWoHJUUEGUrfqr89FdE
 uuIsXmH51nSgml5CsywQK3/37Od0vf89zgARMvr/04kttwBNLDjeJojX6jvibzlb7rGk
 M18g==
X-Gm-Message-State: AOAM530qXppTq4MWRAnwhGqzyUbsbUaF8sWTu/cpGC1KqV6/LC0K5CKW
 JihuMT44a2pSJ3lIz5ZHa+AMjZnT3cnOzQgpNWmuDw==
X-Google-Smtp-Source: ABdhPJwt4UdjNNMt5RFrBj0SVHw/NJX+pbEHJb1fSV0Rp+uVukRrCUveQlDV6O8j1EkY3e+RuatpMex07QktOP5CpMg=
X-Received: by 2002:ac8:598f:0:b0:305:8f8:2069 with SMTP id
 e15-20020ac8598f000000b0030508f82069mr8202247qte.370.1655288918492; Wed, 15
 Jun 2022 03:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220614230136.3726047-1-emma@anholt.net>
In-Reply-To: <20220614230136.3726047-1-emma@anholt.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Jun 2022 13:28:27 +0300
Message-ID: <CAA8EJpqs8ooZL43gCV=+rR7TdRJhOLrPSBrUfStkZkH4igCL7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu: arm-smmu-impl: Add 8250 display compatible to
 the client list.
To: Emma Anholt <emma@anholt.net>
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
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 at 02:01, Emma Anholt <emma@anholt.net> wrote:
>
> Required for turning on per-process page tables for the GPU.
>
> Signed-off-by: Emma Anholt <emma@anholt.net>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index d8e1ef83c01b..bb9220937068 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -233,6 +233,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>         { .compatible = "qcom,sc7280-mdss" },
>         { .compatible = "qcom,sc7280-mss-pil" },
>         { .compatible = "qcom,sc8180x-mdss" },
> +       { .compatible = "qcom,sm8250-mdss" },
>         { .compatible = "qcom,sdm845-mdss" },
>         { .compatible = "qcom,sdm845-mss-pil" },
>         { }
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
