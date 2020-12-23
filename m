Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA5A2E2AD1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC089BAE;
	Fri, 25 Dec 2020 09:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057966E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 15:38:23 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id q75so6504532wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 07:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FLK03MoPTeVjiiFwNtS1OJi+2ld8fgev60+sqAPXpLo=;
 b=aC3XOqzY6SoQTeia6KLuOxot8sYnDpr+WcX5Gf8TnqSRzAGywSgSslZ3koDvjM6ib3
 Pdi8mTDstbmvSu74oQEOtEGOcaGapMdnt2guYjiyiuNyI9a0TublPIgvHTytVaRBjlZT
 P6j/dMWOfY+mTZFcmLTsQreejEnkaqN7T3glvlvOKrKRJBytjK48P5nyy1ekeQIxEJAB
 gda50nuPKtQTzYWtUjJf88582ql+s/mzHL29B5zze3o1y6CijcBcwgJuKKQ8+HjIiYYF
 PGpvC72eJLuyXVCZV+q1RrmtxpKoco3/pXOVOVNIk2k/ntzBIAeEEqbwtGUoGa90XnNF
 ZrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FLK03MoPTeVjiiFwNtS1OJi+2ld8fgev60+sqAPXpLo=;
 b=OMDyuxbRcin3ntaf3LjwPRFM+pjnMVBOk5u0oarpBaxGgqIVKCgEj6BxgcXaUjHfQi
 Q8881w6EKqxgsGHPtFnLlE1+glVB2+AxPMrNUU6znjmF5G4HYLiGNUY736vQLSyT2Ipg
 3uavTf1s2wYxVgU3PR+FTIWAPxFAcCCiI7PL2BINrF3F9tg8lu2JT7E3B4ao/OZuhymz
 N6kG4OHs8+NpTWPl6UV7zQ0s66+OD5WkApRqW4YpArt+JHeISE7ghFp7asZud4ZmPymk
 XE/ri0u4WZFpw25T5EnyPgzXCCT1I0Yu+xn8twpMjQyrPJsgu4RvEvbMRXs3L/xU7hMk
 T0ig==
X-Gm-Message-State: AOAM532glq+vkCjjKnCT1feYmQEID2H9lgMYZ5ekVvQJnN4Ur+nJPi17
 8Pxy53PQ/PT+3vmk0tCWNWp8zA==
X-Google-Smtp-Source: ABdhPJytXmL1Uj/jup8IDzFLZKwpMK6mZxS/1lbVrDQSOq3KCd2Df1ttM6R0Ksfu/w1e0jCslBiSlA==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr301307wmi.128.1608737901527; 
 Wed, 23 Dec 2020 07:38:21 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
 by smtp.googlemail.com with ESMTPSA id y11sm212109wmi.0.2020.12.23.07.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 07:38:20 -0800 (PST)
Subject: Re: [PATCH v2 1/7] iommu/io-pgtable: Introduce dynamic io-pgtable fmt
 registration
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-2-git-send-email-isaacm@codeaurora.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <65b5382c-c7a9-0f18-96da-fe49e92e3b00@linaro.org>
Date: Wed, 23 Dec 2020 17:38:19 +0200
MIME-Version: 1.0
In-Reply-To: <1608597876-32367-2-git-send-email-isaacm@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: will@kernel.org, pdaly@codeaurora.org, kernel-team@android.com,
 joro@8bytes.org, robin.murphy@arm.com, pratikp@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Isaac,

On 22.12.20 2:44, Isaac J. Manjarres wrote:
> The io-pgtable code constructs an array of init functions for each
> page table format at compile time. This is not ideal, as this
> increases the footprint of the io-pgtable code, as well as prevents
> io-pgtable formats from being built as kernel modules.
> 
> In preparation for modularizing the io-pgtable formats, switch to a
> dynamic registration scheme, where each io-pgtable format can register
> their init functions with the io-pgtable code at boot or module
> insertion time.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 34 +++++++++++++-
>   drivers/iommu/io-pgtable-arm.c     | 90 ++++++++++++++++++++++++++----------
>   drivers/iommu/io-pgtable.c         | 94 ++++++++++++++++++++++++++++++++------
>   include/linux/io-pgtable.h         | 51 +++++++++++++--------
>   4 files changed, 209 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 1d92ac9..89aad2f 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -28,6 +28,7 @@
[..]
> +static int __init arm_lpae_init(void)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(io_pgtable_arm_lpae_init_fns); i++) {
> +		ret = io_pgtable_ops_register(&io_pgtable_arm_lpae_init_fns[i]);
> +		if (ret < 0) {
> +			pr_err("Failed to register ARM LPAE fmt: %d\n");

I guess we want to print the format here?

Thanks,
Georgi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
