Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1174AD4B4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D88D10E34A;
	Tue,  8 Feb 2022 09:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37310E3F7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 09:23:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w11so29541150wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 01:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nv9eGMngUI4irs2c+oCw9hCjsOWg2bDP2XUBGqADoak=;
 b=pjGIicdCBYz734ZtdMDLF0Vk0sQ4CQdXf13cqIefkoiIZvpwGSwsRPI7XLM+fzR/JU
 66QDwlp33BgK6zTu5GMchSO6Ya9LIEeg4vIq/hsPX9qoPO/DBT617X9KBShEQ9HjKS3U
 gVwWvGKzfRSOZn7GFMBRHHBpbfJhj1VVzWYRmEtM2bYZZmCn/l/ewK9rphxpSqANRpvG
 E1nBnNFufGsa7tYM50+ZOtRY6zuv0Y53TRZq2ffG0QggCSdsLFY2h57mKKXYqGlDp4VO
 pdzzVHt/rJ+K6LFu45fvQxTcKaMVXBNOCUfbuZEfXzpsVIs/gOslOA0VAS15MRIPWYTV
 OKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nv9eGMngUI4irs2c+oCw9hCjsOWg2bDP2XUBGqADoak=;
 b=adlT7ryDFFVdJcu0aF3bo/NvCLLnmNQtD2BpcXo3ZzNrbHg0+4kOiBdCa3og8ajtMW
 qQZPOrQK+xKvmYt5pEElBmkiTItocpMq7RO2GB53/OlYOVeKuYP9LOBLR+XH6emLXl9p
 Q+CL9KUbI5DN875oDYDjR5kSoKsZFzjXsxrdW5Yu9G2GgEZjdsmlNZyumKiPqPBHr22L
 44Hh1h58wzPy9Urc35ygFPRGxFfj1heqNZ6aXWb+ntTgfJvmP46WRkgVSWuLBcrBbzlk
 D5cz3KYRgG9Kv8eiWOv0ZcJ8vO/Zlo2gNaE3tUqjNoSZBCDPI5wzqnjcap01GrSgS/O+
 ElDg==
X-Gm-Message-State: AOAM530l4oCoT2fO6tvmKxhiklBABDJ9ed+SAVyH1MG5SZQs6qsywIgJ
 FNeeKO76lZ3b4Hmz1n//0hGM+g==
X-Google-Smtp-Source: ABdhPJxjRg1M0ImAnVJO2McmBHHY7WjBVt9i/brwoGpY52oPDZ+DU4XInyUB2s7IiA+cTZulDHS/rg==
X-Received: by 2002:adf:b610:: with SMTP id f16mr2693143wre.266.1644312218574; 
 Tue, 08 Feb 2022 01:23:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id y1sm1771596wmi.36.2022.02.08.01.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 01:23:37 -0800 (PST)
Date: Tue, 8 Feb 2022 09:23:34 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: qcom-wled: Add PM6150L
 compatible
Message-ID: <YgI2ltTYI/1mAxR+@google.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
 <20211229170358.2457006-2-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211229170358.2457006-2-luca.weiss@fairphone.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, phone-devel@vger.kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Dec 2021, Luca Weiss wrote:

> Document the compatible for the wled block found in PM6150L.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
