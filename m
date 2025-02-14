Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3962A364A4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EC010E36A;
	Fri, 14 Feb 2025 17:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IiavAt39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7597E10ED20
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:34:22 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-21f2339dcfdso36749645ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739554462; x=1740159262; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GSFBEwov7SYxp73AsWF2Q+VXEt3MRx5pEFKdxej0uOE=;
 b=IiavAt39NKuylseTwuulzlrGARYGEmlaDjuubGGPxLp4d93vAUngjsONrsHnLCpQjy
 IrNI+rvkqlhM8gd+viZl6ql8S3O5w9YHLYuqsl1VAVHIV1QPXyV484wyROXrbSmD5Ghj
 b04JYY5yyLVr0xTn45XiAbifYrgMjbcgkpZOocOI9nwe6xrRniL8ryC90BFDcJZl1Ho3
 GazWKALPjU+95bW3WcrNL8J67x4uhIaqZHNkaYDIBrlyfZqNTzu6EQJ1JNOd2xMkd5Q1
 KCRFgs1Ek+EfNEPbO6yFwGj8H/lESV5IZn9gOw7nGjgsbwv/Anr6Gqd7LP0SNMN3YOo9
 2kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739554462; x=1740159262;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GSFBEwov7SYxp73AsWF2Q+VXEt3MRx5pEFKdxej0uOE=;
 b=d9naRo0udlPnragnjjJHZ9Haga4XxflRTYLCGnVIhDVN3M6HKK91cyt6huqNBi5ybP
 cpu5mb7Fgu2eIedQi+qCFnID6Q5bjr4BbqszXRUPXXA7lAL5oPue+YHfU6OgiH+xNHXA
 4/p1mk5FCJI+Zp3Ti5gnVkBGxqxtV8V1RLFHSUOEUO4y2AhcNMBPivcjayjwlp0ZlT2w
 feYohrM0aDF8I56LMzXeCmABIVBM+AZLhHSsQL37Ls3g/YL9ff9axfSe79AVlTGuANfn
 7galEANsGlBYKViqPN2s53todpO7yUNPxRHIrpJ/QTJGNV+7n7qTEye3MrampbfQWMTd
 w1qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfXYUmw2Ybiy4N5ilGbi59l6p/KCgroYprYBIdEaN0GdPIOQfavwfBa3C40w9b0y+uBfBa/hubk7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwciOxvYjDcjU5cTPqHMnQLBUCVQXIvvVabt7uBrXyqjgQlhwh9
 Q901WNFgFpVvVBj1pr955uMRYK42lHALWiK692HqRkezqxnTMGCBkce8gYQCIMsB5hsca0MckNA
 =
X-Gm-Gg: ASbGnctKR29PWYR00eCyCFIrgTeLkUcmh7V1j2Y3NtkJjPkATCV6BwX1inQI3wZ3MvB
 ay/2YMLTUezU6dLEgQ+jNfPmM/Ah/vgiHAyy/8Z8sFzu97U3/rBanPeTExajtn3jdySA8NcY2JK
 M+AxWHsagtMuElVsRNUB4crggJT9kalZHK0TxdD3bPDnaM1iniwTFu6PcEgeHI1EzJfepGolEn6
 4n+OyZEV7GgcURpYb0S/O191N7kxr+utIRUSs7z+QiouE/p4x0v3FKWsAhJO3TouN5l5ZTqqk4y
 xzfepusmqOX0fj4Uv2CjdwAqCrE=
X-Google-Smtp-Source: AGHT+IFFgRVHE1TWwpWWAfTH1Nd1d99UjW4+AL/w3P3sw93jVzRmaegWBJLBzf4sbPwtEerPHqeTSw==
X-Received: by 2002:a17:903:27c7:b0:220:fbde:5d70 with SMTP id
 d9443c01a7336-220fbde5df6mr18990985ad.21.1739554461992; 
 Fri, 14 Feb 2025 09:34:21 -0800 (PST)
Received: from thinkpad ([120.60.134.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-221040434d9sm193265ad.196.2025.02.14.09.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 09:34:21 -0800 (PST)
Date: Fri, 14 Feb 2025 23:04:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
 dan.carpenter@linaro.org, ogabbay@kernel.org, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 mhi@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
Message-ID: <20250214173416.b6y7o6tqsnkuzkbh@thinkpad>
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
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

On Fri, Feb 14, 2025 at 09:21:09AM -0700, Jeffrey Hugo wrote:
> If mhi_fw_load_handler() bails out early because the EE is not capable
> of loading firmware, we may reference fw_load_type in cleanup which is
> uninitialized at this point. The cleanup code checks fw_load_type as a
> proxy for knowing if fbc_image was allocated and needs to be freed, but
> we can directly test for that. This avoids the possible uninitialized
> access and appears to be clearer code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")

The best thing would be to squash this fix into the offending commit as the
fixes tag would become meaningless once merged upstream.

> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index c8e48f621a8c..efa3b6dddf4d 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -608,7 +608,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	return;
>  
>  error_ready_state:
> -	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +	if (mhi_cntrl->fbc_image) {
>  		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  		mhi_cntrl->fbc_image = NULL;
>  	}
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
