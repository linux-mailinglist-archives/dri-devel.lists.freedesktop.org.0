Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C5CDBCBA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3710E9AA;
	Wed, 24 Dec 2025 09:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1fEX1sF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy8O69pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29F10E9A6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNNF1Sq1123243
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=; b=B1fEX1sFeM1nBkXj
 FYmoO2+CnU/wIvf4Fgc0eUZVnTgcVxPGSZgB2Yyu85mC/SOJlMVHMkeDmloqzUpd
 hMRTi1d91LRh7xV+Xgu6w7QC9/dQwrJxW+D3H8DHk5JgW/gur3b9AVRTu8SYo+So
 cDv7VSlBK64As09G8HiES1C6KlKi8usy4MTDtA+G3jA+XRkemNqdoMvN6IOU252b
 b4eHLR3TBy9Mljwwyvzki/kTFdYj6yLa2p2G7zSgVTkvYmafYVPzp1YPYkqVrV2b
 sSYnBF2xxvOVXojaskvuGiulDs1IdTvECDPMcRKGEGkHD16t+keaggsy+D5anStF
 2/71WQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9t05-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed7591799eso139203771cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568476; x=1767173276;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=;
 b=Yy8O69pZpEhgEAYcYhSM8jDX5C3MQfx6cFgkxROjh2C87kOO9PtxWrknThkqv+6hX8
 JyLT0Kvsx2JtWTG1a3xwZUkaUpLWallCkNHSHRitAmTHcVHIGY3cWhJG73RJ9bTbb/H5
 h6eIbBtxw6tHz+64cOEYDPchZcbeEJsdc8gVfyAe7mftniue0QM/ZXKDElsr4CDRMSRv
 h5qzqAJaxSB7hz7e+olSK8bEqaoYeexu2stlo0uaC0n5zjK5+RtIfo8DkM4sp87VGE41
 +gUxpnHj/pUP/grDS+prcooZjAaLqoGI/KpWBTOIa3ER9sx8WjLYQPELPA9Acs3VlVQ0
 PJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568476; x=1767173276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=;
 b=N6D6iIxljiSyOpm8nBScqx1ZzpGYUw7Oa9i0WIIz10AR1rMrsg/M5/ITO8HzUhjvzc
 c97JHgI+Rze3k1U0ai3FhnYG382twGkvoS83uSTxSoMmKwRixKYSIvm/pERuxTpqnndE
 p492K4m8AbgMb463kCaRzb8bSRqvSwlXdvGsqvxoXwMpauJ3Fr5lKCEUxhtVPcW5kcCn
 aarLGfyonvNW++8nqkJO2ymFL4b5zC89awxGX1xn/WMzYryvArKi7IBz5wyKLQJW4HM1
 1aEjKYRa+yXXWl6T33HoyUkMHpUhPHjJ++s+55TPaK7U5L0JqeHMITx4XSIIy/oiKf5a
 XTZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3JE+Jv6Io2d37SrKCzoiNUpv/QX27+Hr3MJ3yt36Jeg6UhbSKNIBoXU+RgWu3HmKYeBLtwM+l8aY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyml7iecDwPWewFkUbjA6hBMRc4i862pFSwJGQUfoOxnX12Nq3R
 wenBWwst51JSh04prZs0uwTThvq7fbnzcqSzUaixj6kFjgCZUTHb6KvZXtMuwNWY4rX8VbOOttv
 nayr6MbCe2rbGATbZ+0gSlXquOfraWWd5MK1mP6Q9WJX4MAUQFDNVadACyNVZ7dadN5egxlk=
X-Gm-Gg: AY/fxX6rgm10ojpc+J1r50N2C/YTGvT2ftr+UKyJaRqNjZ7LiBZKeCy5L06SyToXnL5
 9835iQ9kh60LoMYTtZQwhXK7R9ExruTFkAT5uRWEs2I5wMStiWDCaN2nQ96C4ie1aHMojWnuI03
 MsjV86vLTBR3tlMSJid2REMZ6Ynrwu7AoeoYJBmBYKbreG//W3ZZmko/jecjnVtxQFLNju6xs96
 nhAly9RE6TXTX83Bficr/ka0/R1PQNbbQWoBRkJCkEoBq2s6G3w3OCSptglQ3ETUTyW1/u8ZwCF
 7tHyJTqMT/bexyYgMjOPmtY4xjsQQodvTBKAU7i+UXtEpH+0IfFknvAZQE7Dhh3zGWq2gymTCQ7
 YpFxoK1Dm/ShJy+SjovSNa8qwCL4X5gp2KK7urLitXIfR7Tj14o5CwkxO6MO6cE3fdz1IU49ZYx
 cE5OvjmDEM35pYweF8jxfMRp8=
X-Received: by 2002:a05:622a:4013:b0:4e8:aa15:c96d with SMTP id
 d75a77b69052e-4f4abdb59d6mr260677481cf.55.1766568475668; 
 Wed, 24 Dec 2025 01:27:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPmb4FBu/+NZZjSLP6QEyoiN3Sxslg5qAtxT5t/ZMlY4bCsQu8Zu0+SBGsXE1HnUerjBYM2g==
X-Received: by 2002:a05:622a:4013:b0:4e8:aa15:c96d with SMTP id
 d75a77b69052e-4f4abdb59d6mr260677211cf.55.1766568475245; 
 Wed, 24 Dec 2025 01:27:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, veygax <veyga@veygax.dev>
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Date: Wed, 24 Dec 2025 11:27:47 +0200
Message-ID: <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251130012834.142585-2-veyga@veygax.dev>
References: <20251130012834.142585-2-veyga@veygax.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bb21c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Sr6y7Swg9AFsQnQ4lA8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vTO5WcHL-ykUeRTtLzhY9v_D55rQWBbJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfXxHJL89nDJLiz
 zSLvysuHWvD2+W8jfnyW5KiyltYyGGIQEb3JItfICgP+1F89Mr03HSu9iuLohh1IS4avs+SL7XF
 HJjn19y3Q+3cTRPVY2GN7tIArWZpadzU3HSWkbQ5G5b91zH+TfmMBtOlW3dH6MuPltYuhlQST3M
 x/eJk1AiRUAEXCF9AakCmwMMfshVh/7ANA+JB6yZm7y8iDmet1tRqSSwx8gpwZA0zDy5rZdcSPq
 eaTWhgjOrqh8HyQ+PmIe4W9lI+imZiWp2ll/VYZV35E2mbv6WB6R5CVi/jg3nq/0Fb23VwT702g
 JhjNak7DaBKZJq8A+7oQ1WECUpk3CwrHgdzgaq1oD6wWrrP/WrkEb4ESPr9L9fWOrSDXuV/xZ2R
 SG7mgzjaqXOjr5otJqNaodY/SKJIEEY3UpDM849XGrGH6a6pUAJpU/XWMqBSqk8bJ3BG8qfnViX
 df7hwO4utEw+VbW2I6g==
X-Proofpoint-ORIG-GUID: vTO5WcHL-ykUeRTtLzhY9v_D55rQWBbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240080
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

On Sun, 30 Nov 2025 01:28:54 +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
      https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382

Best regards,
-- 
With best wishes
Dmitry


