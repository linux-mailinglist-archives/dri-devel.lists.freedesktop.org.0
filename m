Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A187B9D5535
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34A710E1EA;
	Thu, 21 Nov 2024 22:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JZHfXkr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D82710E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 22:10:41 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ff64e5d31bso15702821fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 14:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732227040; x=1732831840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gFDuP7IjDwDMv6NR+DnprUqGpxBiP59fQ/sq6qPsJrg=;
 b=JZHfXkr1u/+krjRzURm8r3Bgw/JNTcJwd7DbNAWU0mNmZYrStouH/NiamOAx7HJ6wU
 j5cPBpCrS4fVpqcmfipynDYPMkz6BettRkvHuuZ2DpWoHbU+ScqPdNoT8nLpizW4m20o
 O1ppz1z2Lu/Olr4W9MQHco2egWHKXYHj7SJtZFCV00taqFu0DgBPGnbNu3W72xSuim4x
 Dyw5dO6aKVz5E2sLs9N7tKzaO591CjLkxcF9LlFl/g+91XHbSxE7YeZcqe8SdU7thxUN
 Tb/Kn0UvPY/nKMTyq5R1W0GQ3lkCejA4N8hWI6pyQAgLOoIsC206Jpn2o+WdhrmpKaSB
 xUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732227040; x=1732831840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFDuP7IjDwDMv6NR+DnprUqGpxBiP59fQ/sq6qPsJrg=;
 b=NU+YvPl6jEwq1w8ey369f7WYw6WNuBDGyToSoBttw7SxISGCCg8P/g01+gDzxJ8FUU
 4r2abb1/9HuwpMNS/6BVvNAtfxEgp7SDDUWEpf+uoKhK3Zkhm7gzRu8IgQ4fycW8XtnL
 gl9JjNyfzKXA6vsDbs/SshNJNOOHdyGebR68b1+kqnterujtI6gO1je5MDdnAIfHDWYb
 iIBStnAylW8wV9H5aXt9d0sSQSE9K/WgnEJosDZ5OMg0HHARu8RXeDpT4ARefybVsJFH
 i1ASAdj1fGbcYD78MtcUfTh2VzqBBytUKlOH+a9Z4Uk9aA6KE3818kk9agKe4fIQDMov
 iCVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXncrNzkVE9FgKqXmh5aJUEq38qytsY1SNvGUKCs4KWUmD+hcvQn3Qpqa4c3HDKft0fn7rd3py3HT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH/uDtmEAakZ/4kejr6OQpxJsAg0nGu5T+YhOtaxFKNNxtAqfj
 c2eAR1bn6dwoxcDUa/Gq+nqYxu1AEmO9eVdNnU0sLP7J0cYSNtgVBaVJ92sIoAc=
X-Gm-Gg: ASbGncvFxSCeMkjnxxtt4lKy1ehh79D1lp+Vv1wVgPb+dceQeMe/mQnOrbYLQxZr0Jl
 kTsWKZI4bbKB9Tscy1RX7HcvGueffdNo+dprwx+SV+0Vrva82OtLcEMfKuqnj7gOvniEAv3eHLn
 UagLPDqFi9P6HaO1nU8tPSSDpo3RYeZcDcElvNQyss4bBDE40fSlpQQ/S+C4l4hNy5XuMyDuyGe
 J4TLHmwyMTYNXXuymUnHxZVoUSnCmH16qjzDrJ2+nfloiCI7q4fm0Ch3OtgWEPujm0l3KbBV3UI
 FFbJvv8tR/sgblpHpGWndCLofwsS8Q==
X-Google-Smtp-Source: AGHT+IF5UEvVH8EwlVFvDbA8yqDXP2EnIvz85XTHp+jyVxMS03tfkpla0bwll8dc1ETCUfCWi+KKfg==
X-Received: by 2002:a05:651c:2208:b0:2f4:3de7:ac4c with SMTP id
 38308e7fff4ca-2ffa70f0968mr1996351fa.8.1732227039935; 
 Thu, 21 Nov 2024 14:10:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa538f100sm593151fa.103.2024.11.21.14.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 14:10:38 -0800 (PST)
Date: Fri, 22 Nov 2024 00:10:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com
Subject: Re: [PATCH v3 3/3] i2c: i2c-qcom-geni: Update compile dependenices
 for I2C GENI driver
Message-ID: <zfkhbjm6wrmcocqcvluov3nbrpb2ozbo52c6nlwxro44gublcw@5645ksz4cfm2>
References: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
 <20241121130134.29408-4-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121130134.29408-4-quic_jseerapu@quicinc.com>
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

On Thu, Nov 21, 2024 at 06:31:34PM +0530, Jyothi Kumar Seerapu wrote:
> I2C functionality has dependencies on the GPI driver.
> Ensure that the GPI driver is enabled when using the I2C
> driver functionality.
> Therefore, update the I2C GENI driver to depend on the GPI driver.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> v2 -> v3:
>    - Moved this change to patch3.
>    - Updated commit description.
> 
> v1 -> v2:
>    -  This patch is added in v2 to address the kernel test robot
>       reported compilation error.
>       ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
> 
>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 0aa948014008..87634a682855 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
>  	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on QCOM_GENI_SE
> +	depends on QCOM_GPI_DMA

So... without this change the previous patch is broken, which is a
no-go. And anyway, adding dependency onto a particular DMA driver is a
bad idea. Please make use of the DMA API instead.

>  	help
>  	  This driver supports GENI serial engine based I2C controller in
>  	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
