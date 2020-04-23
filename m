Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999921B6197
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 19:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73586E959;
	Thu, 23 Apr 2020 17:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45DA6E959
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:09:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g12so7342355wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 10:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HyYauB8Zb4kPY2jhycDpuK1O3YKpPPWs1jRZhg3W+PY=;
 b=YIzqtZTQ86QFuC3Fm4NBWsdOm0pT4cBdJ7LP5GP2m1Iy0O7jxZ4FN6lCTA4pC3+xEi
 h8VeJgo2IBWMDWo+UMx5OdJyoS3Dq7CwWyqIzw+mpQOoXpKhW6CaDct1MaBX0WFNswe8
 S0Fd49PA/VO1sC7i2qPSiJU2syTaaBJbrhV0dWWNbPVG3KxVQZW1Y6bEZIH9/6cxLJmM
 L/T1dn/jbwKPs4moZuwT8rK7gg6iiHRx4h358kfomBb7V37Y/DqboBHiSGV8uTjXTW1C
 2uJGiuc9P3sMJZlpspCAZFLGblsS6gZqFdijjC7UOcFH8G58rHKZgdYuqVqPEKasyViT
 pdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HyYauB8Zb4kPY2jhycDpuK1O3YKpPPWs1jRZhg3W+PY=;
 b=QI47JDiGe/TemHfeZLBCbifo+P+sPuaiJBQrKQnyu+C+9RZo9chb++FACNeDJZoiBN
 USkCRDGCIu79R/5kWeyOOJKMB2dItjQ5LC6Pcc8xHJSPNwsHORxzFHdPKx8Bxvgfjff3
 xnph7dsWmchLweaMc7zoXOMIKV27ktqvbFxMGI6aJekSWRoQHNQFWTWJruMFRkQ42EIZ
 rAKsFyvTeXJY5aUMFsWdZQZEblW4nAaytD9gNwtfpEUGA67Mr+sdRxTYJP3MFoub2lj/
 qo/PYr/QMR3L+Q++FGPH9f6yxwpo8SWzL0sMolgYH+krGsaXmuyxiUtd9HyhHUUuUTPB
 gPEQ==
X-Gm-Message-State: AGi0PuZB5/d96vKHtqHedQn6yUeO8uRc6eS/exugaYsBmNKHf1KFX+ZW
 67Sg9YGAFrY0rx4wAuuYO1/0FA==
X-Google-Smtp-Source: APiQypLTFoqOzEEgVSqQsK2DVwkZLCzK4Qr3KYvzNDTrgnBoJM5h/atmfsvo1wLAjiYN7AmpJR6jMg==
X-Received: by 2002:a1c:40c4:: with SMTP id n187mr5040344wma.28.1587661739472; 
 Thu, 23 Apr 2020 10:08:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s30sm4475128wrb.67.2020.04.23.10.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 10:08:58 -0700 (PDT)
Date: Thu, 23 Apr 2020 18:08:56 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 4/4] backlight: qcom-wled: Add support for WLED5
 peripheral that is present on PM8150L PMICs
Message-ID: <20200423170856.f4r62iwcg7qtppva@holly.lan>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 09:03:37PM +0530, Kiran Gunda wrote:
> From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> 
> PM8150L WLED supports the following:
>     - Two modulators and each sink can use any of the modulator
>     - Multiple CABC selection options from which one can be selected/enabled
>     - Multiple brightness width selection (12 bits to 15 bits)
> 
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
