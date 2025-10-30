Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1BC1F547
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2109010E271;
	Thu, 30 Oct 2025 09:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXvFdDly";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5nAS8AL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675A010E271
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:37:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U9PKWX3509316
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=; b=WXvFdDlyVDlLgs24
 hRq6p+6qK8CV9lic9QlCuUfaa0N8G3YCqYN7vRhVoRwikaXnrxpBvPouyJN9TthI
 Rvvxg6gHR2/83eMMhgIKHaF/2gzjTsd0/pwzyo1HiT7DJWdmxw4zXGOxJzj75wPv
 MxIqgQRwirpvHbcGxz6Uh5x1NIHXK1NA5mM+EXNEXSpNYv+ArFuWKkIbnB6TyN+z
 J+Mh2nk3LYfSRxD1D/R5R5tkklf9An488gzGNuxoue23wlQwz+TJGmjzPZzFtIfl
 Ecw7mI8ytS+6TnUauCSxQKMRKMdlm9JUK7i5oHYuEdiLkBsiOgfN0108MZ76Nj9P
 ZeiYXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdg1et-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:37:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-294ecadf909so2181445ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761817030; x=1762421830;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=;
 b=I5nAS8ALCs8IHSW010No60DodlxO14UCxmdicLXdCGFjqYMBGzLpN1nqzxDpFGsUfk
 wCPhFLHA4V8Oaqf+3c3QfzGBo/ohcecARzlfvVvH6i8wAHhXq13N0usS+Fg3PtndqrMY
 7yObeJMc5pkEao6O7F6dTRlwVdqdV+z+yak/fZgGK3mLGKOJMhYzWYmz5ILGLVp0GQrl
 G0EpiwzQhrUX+S/96+SZc604nJYJ1UEpn1lQing5Z9R67RmXaeYTUE2eZr9ZoleewO+F
 oMW4sEwP3lDH7292+kYGEOQ9VnSs19IJX0OroJ4IxnJjD1TIriKjrJIHJpBGBsrSS4NQ
 Gt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761817030; x=1762421830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=;
 b=BW2iXDN9DxjPPMRUO2K+wJgoEMVCrM6SRHNxO8l1PjyxXfyZ8i8gNtPyUjKAwXgX81
 X6BOw8LBA+v8dujpIJe+9GhGqxkw+W51aZgFyaDKmTEJHWG/FFcajBsVOg0d7bU1kXPY
 +33xDLzDBpPZUNaS9Pfw+3HLLQXSzDjr1wxZKbWPEX2zceKvh6jqSg0aAxtkk6sHPIiE
 KmoeRm6AGWov3Q5dyj/SsixpipZgyKnRVdqIrA/mX3xbb4zaSh3vZoQeVMBSzX2BCHpQ
 1BdrcLm98Ya9fY0vM4sMYukn/MtmBpMqk9UEmkWIGH4H2VFDFZTTOFcKzf8cAuFuXKn7
 +Kkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKoQ+cCgl4koEryvv25GcKb4WBHyLntS1mDXwfOBwPXn35E7J5Ld4Sjd/Fhf3oz3pXzVs1ayf/M90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkKGCjyXEaV9+eHHNJnULZGxr0vCXMT47xt6fQCFXmUfYfPfHf
 V31C3eT/Qy2ELnxPlwakZjjBqxuthxu679Bn8AsoAuC5EOjrb7s9wJsJ/qd47wJZiKn5+ZZl6G4
 Cl9zT3mYKYG+W6COsXWgMfb/XTN0LcYjvAdL3qF2rteu9fd/SyD4FxaRMGj9YTLKTt5pO4YM=
X-Gm-Gg: ASbGncvCk9ZfWYeuTK3U5IiZ+xhK0+5J4NIqBkVrcnf/khet9ztOlNx2kKFCUnOcugl
 3GdZ7KpKozDx0Dx9BYV5uAzkZQR3LJclA378K/wDWIwGhQF0Ho75s+vcRdcb161esYDLBgqyhGU
 MqwC1uD9Fk49y8w+5x4/tpXP4CUgc714VEGn9PMyYJFzlyxMMujCU2RTxOaHfbi8RJN6r8CSY7S
 HyLC/oLEDzS/lstL9fv5lvazUZMznIdGZazjSg0FqfPYM+5fJx1a8Dfnq8MS59RwROMmA/HYqq3
 6oAihRIFOn/q9taiutLERRR96tOqzLbllTF7RfhhV6H3KPDf+0thWzk1+abwXOb1RqJY6f9t9X0
 LH6uZwkoHfpsWMUCgg6UHUTFyHL/kV+a4a+Hy70xl60kpm6KE3h8FvOm2
X-Received: by 2002:a05:6214:487:b0:84f:81b4:4440 with SMTP id
 6a1803df08f44-88009c059damr57947616d6.7.1761816406107; 
 Thu, 30 Oct 2025 02:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENOdltg392rpt/C6P2DXClkaCW6AuvtVnIkahf+FfBy++WBa3yu6xR0D9iLMYKtJjowkMGMg==
X-Received: by 2002:a05:6214:487:b0:84f:81b4:4440 with SMTP id
 6a1803df08f44-88009c059damr57947516d6.7.1761816405687; 
 Thu, 30 Oct 2025 02:26:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f9a0fsm1679780866b.50.2025.10.30.02.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 02:26:45 -0700 (PDT)
Message-ID: <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hc202Wk17b1lyB5wErwWIC_7bUWExKlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3OCBTYWx0ZWRfXxiH2uKyklezP
 pUAR8MUT2v8fS1s3EYnBRSuUs6ShEwWnpZxPU9U2pC/QEEiIRkuRTcCnOmClm8MVlOQtn2YbY6Z
 DxUveE4M+OKZqLMne/Z2XymgOXYNsf0yNz+hga5U8YzEs1E1nGkiQjRTU/S/ReKDEcdW8MVq5Kd
 PwJIy3Q52Tt6Bqbk1qXi1gasPyz3jWpMrjCGwRgptfhWwudtg+ed4sOnJHBgko4A21WcuQRxYGC
 gLkRHShAMiEkJ4RE+YWMNyAUtS98CXiRyQQF7RsxYv/Cbg066Jh8YVp1Bpv1RysXQGJFDBkvLPc
 9ceGnUkzrM9X2P87IzkC2t+90ervmp6WW7DesXTOk5d75mIaKUIFQBkh6heWeJnZbVOvOiFHWvl
 R9ut+dYo9yJ6x2WW3/8EYBtLa38IGQ==
X-Proofpoint-ORIG-GUID: hc202Wk17b1lyB5wErwWIC_7bUWExKlV
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=690331c6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=7QP1INNbtZu8WugdpZMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300078
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

On 10/29/25 7:07 PM, Neil Armstrong wrote:
> The I2C Hub controller is a simpler GENI I2C variant that doesn't
> support DMA at all, add a no_dma flag to make sure it nevers selects
> the SE DMA mode with mappable 32bytes long transfers.
> 
> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 43fdd89b8beb..bfb352b04902 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -97,6 +97,7 @@ struct geni_i2c_dev {
>  	dma_addr_t dma_addr;
>  	struct dma_chan *tx_c;
>  	struct dma_chan *rx_c;
> +	bool no_dma;
>  	bool gpi_mode;
>  	bool abort_done;
>  };
> @@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	size_t len = msg->len;
>  	struct i2c_msg *cur;
>  
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);

Not a huge fan of putting the ternary operator here, but I don't
mind that much either

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
