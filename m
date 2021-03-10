Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE940333896
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 10:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFE96E9E3;
	Wed, 10 Mar 2021 09:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C20B6E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 09:21:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h98so22407055wrh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1dMDsRJi6X7RFDQQQ96QgnONRBTG+sEDdR1IWXfZlxI=;
 b=W+DJoNj9bBYATgZUAqeGOcJC+D6Hm0fUTfpOX/nfrQorUYX0n4GMgTKiGPm9maOEGo
 jJEbPk9YxrksTMIUWEKLTMMPZUE3K3JD1uzy2/YgERbc+DtReqEclprcHzcXbUZkCtgK
 dofcYGgRLjspqQ02wswCtKFFlcgHYCG7pI64jxsoFj6wjEdDKRS1gt8ucvtPMr1+wiXH
 V/ZWINFeo54CPqxA/rG5FASsH7SuIr/xMoPbF+VsDdIRqKv/UxlwLwcteDBdVTSJWc0O
 mMDifDG6brOm+PToPYN85FgTl6AZyRU9xfUh9opj8fWJz2+IRQ0JWOsQc08QN5F0mrcp
 5KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1dMDsRJi6X7RFDQQQ96QgnONRBTG+sEDdR1IWXfZlxI=;
 b=LJ+ogip4VCDqB7LKx+9C3U7YsJPOMCYC8dsqOhxW9CB5cfC1P1PcIJwm+Q4byBLnBx
 hGCmN9mvJD4OGQpQSHwmp8yCspN5bQf/BVvE5qc4P3cCdx5Sa2R4jNSbGX2IXStmlf05
 YVw6TpbopFq/fzjjSFTJ/6hJveLyWDYz1JHyq1btNyZ6y+vkW7P8dG4/6cwlF/TzY5e0
 gPvKDNe6jVA8jUZOO0h7LaoftJAJ9PKJJzwNaZ7jRBn+rpdXmp/R/eAnZyL5ziFcrMyq
 CmXz80DRNJFMnogNVVdURnC95S+L+V+TmT6XRrheDFch3nynjRjb9+XL+D+TuOosuqOO
 rqpQ==
X-Gm-Message-State: AOAM5321Hpsro2LzPtfBDL1aJceniDxVdqVw8mUp4G/XhY9GBKHv6cfD
 2d0XGbwpGKRsp0Fx5JzaP4GYPA==
X-Google-Smtp-Source: ABdhPJxuPtNe3ElR6uJROL0vscwDtpq5CtKpwKbdJ63dZObdhgzH/OA+daBodljwBXleRgt+pFfpUg==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr2393819wrq.339.1615368104145; 
 Wed, 10 Mar 2021 01:21:44 -0800 (PST)
Received: from dell ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id a131sm8233043wmc.48.2021.03.10.01.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 01:21:43 -0800 (PST)
Date: Wed, 10 Mar 2021 09:21:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: qcom-wled: Add PMI8994
 compatible
Message-ID: <20210310092141.GO4931@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
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
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyOCBGZWIgMjAyMSwgS29ucmFkIER5YmNpbyB3cm90ZToKCj4gRG9jdW1lbnQgdGhl
IG5ld2x5IGFkZGVkIFBNSTg5OTQgY29tcGF0aWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLb25y
YWQgRHliY2lvIDxrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnPgoKQXBwbGllZCwgdGhhbmtz
LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZl
bG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFy
bSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
