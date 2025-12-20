Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2ECD33FD
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 17:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038910E2B8;
	Sat, 20 Dec 2025 16:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lew08moB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb1V3Nji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C2510E2B8
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:52:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBQsYx3648252
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=md820MSJFmMhxzBhoy9K+H94
 1G1BAf7npRq1mwTR9kI=; b=Lew08moBKmsRyNrL9SesOrsXUaVNS0HMRZ6xjred
 dIzNReB6N8e/4pAtN4YPXoTQR6By4GSvBp+61ubKABL2PmWQk8+SR8swpBmSHbbN
 QfhgGr2697eMHBLSs9TYNAcgC4U0NpgdgYk+WGPCRM7EFJgoHyX2vMCw2Q670yrz
 55yenpkIGWRxOnV9Iei8/HLHV98+BffG+4SdXsVnaEMNkWVkZxXs6YsDYAjRwzJG
 FKrW3pQtblUqMgk3I9sTqH3BU7KD/EZ1GoQ9c4styrV2QeWcVr8TASDSHVs1umf5
 Kl3UQmcl0aB5ulsv5svVbeRcjyyTFsiVvVy0Ifs55vncAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrws097-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:52:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so83594261cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766249528; x=1766854328;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
 b=Lb1V3NjidmLlNxT4Al+0+H7CMopsjx9YVdnsWq/zHpLyoOxHdTn1wRjTNJLxS4gOXj
 Jf6F8eYTtGaJAgt1RFmFCDpNSgeIZHq8qHx8rPaKDqMGJURC3f1/UfWlcFOV30wCik3v
 yXWD28p2xHl8H9A2tOLVd2T8jiIG2L+wVnm5oPOMTBUBOBWzyC2qWN/muL3Zao19vl3x
 Ss1RHdePONPry1H0Kb6RlHUZNHZKV2/7KxHNiCrBYCM220WJfvHmzClq8I1SEsybxe0D
 wqszm4RMTc2dkl76wBhlM73bhOXxhll8AxjUd2ThdLaXF6EAuBaRPiQCG7j0Qvux2J7k
 Fjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766249528; x=1766854328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
 b=ukeWJjKV+BGfHs4FQ/y6XGsP42cKfE7SUFFAQOAjqdAS7wWHhaot8VpGw6JW7tbTIO
 pIN7cdeJgPteQk8WfrnjNGBQA8X2CLZWYF+iz+4lZpyTVkSGOOsTsJS63swYrazm77IU
 LPFPci2rN0v16jv5QiyuVsJ3v3Z/moBCiKtzPySJdF8DiddkB8ASMoQhaNstjHv8NtHy
 zYVBjKmvNfyx9J7D5asAx1KsqoJm9OGZJUCyBGioFTf4Iso6noeRHOvJmxMSfW9XGcjC
 zw59fvUe2ZED6O0dzW4Lqn5SF/VdRoi41N0+0s+qpi0hpHISuuW43+keuAp8ZboS/wSi
 AWsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc2h16ol9J7u9H9qfoZ/Z0okpNOnctPu7F2p13ioFTV8COCVHXndUeKctQC6CDKihfjvB8454rM40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWF/rD3JG0KQRZ7MaKQlaMtDXmqAl+1dPefQjeDyvQbzrZABik
 cLfoqZ8WC6kx42mAoUp5p6CDPI8qavB6jO8zpY6zgkzMkVrSPSH5ky/dzqbHDUfNvekmsz2301l
 cAXrw7iF8QY9+qv6B/fYQFyuPapV6dFj1SzzVaFr3w0U3rkhzGnK0NWTAMmLs+b9A27MpZ44=
X-Gm-Gg: AY/fxX7deelrBfZbUMEsUoyCqKC7H57x8e9IlD6kw8icz38+/M5dZ5hUBFjs2EtAglB
 5zkdwrG09RJguIIjLpewXeoU2JYJz5g96QH2hhDXimPhTDz+G5aosDGIH3snzOwdR7VkQeowZ6d
 naq/t9Gd1Ol4cpBF8/NhzzxUgoB5LOCmAQYdlfWNiQMGzmusSaJ/aZVL3dFafUblXY2UYh7mC9G
 FCK0FAn5l5aHyTlhUKmUpf1UB3oZXYqrX/Hzuz7YotEWoDeVU6zgb4dWfidZHmvmESnem3Yb0mw
 ftqjC7Hs/tgredtn311h1Z2hCeG5kNKz77QYCsNuTlofkJxMLBKN82+JuNpwzTieC5yQjAuILbW
 mU8IkYM8fxUrzk8vISKFynNtwEgK1aMG+0/wV2blT+a1iEY1vXWq1IN9Re2uH9WGuqo64GkEcVv
 vgdSSWWF/TQV6k/GMg/i1t3y0=
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id
 d75a77b69052e-4f35f43a9damr148411951cf.22.1766249528039; 
 Sat, 20 Dec 2025 08:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6MpmVZ7ZQhZ40pLdCdrBIOL53YEAOVIlZxLQot31bDGrYAK4K35/1+HqCakHdqkzMA7+JTA==
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id
 d75a77b69052e-4f35f43a9damr148411641cf.22.1766249527582; 
 Sat, 20 Dec 2025 08:52:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b36dsm13394911fa.30.2025.12.20.08.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:52:05 -0800 (PST)
Date: Sat, 20 Dec 2025 18:52:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
Message-ID: <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
X-Proofpoint-GUID: h6pq-BoeYChU03gbFwigajl_EObsk784
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6946d439 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ybx_Rsa12JF0X6GijNIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfXwivN2rXU/ec7
 +ST636IhUjAZK4ETj7lINzjXCUgKH6Fd1DJKrmjfO5WAmeULvuStt+4BlDs5F82DVBnq+TPUsop
 KaNRNDBaxVXouWn7gs6CQjO78BeYzmE0352dVUY9jED7KHuWdbCtCCvIJAIedRRQPqwM3kswLcp
 zArThbWlLN4lnnNBNqLcwYuMYOg9tJ9X1Nbslp9niAy4NOVCeuDJPSB8aIicuftOw6ye6FNlt+M
 aFFEfKbYPo1RxB1MZ4jYUNb4bXTrDuOP5+D2K72EaonHz7t4KcaKI4szMr7rFAgjvqY244jsJjp
 rKJW19vkOpbwz/hIJ4goOVMUGB28Csa5l827i8V35PZbb6oBURNP2AdTRypjCh2Vk88iTopcQlz
 MX/ybYA879L33l7YEJBjpOzPM8XMDFN80blhXDN4/yiD5KWVQ4D8hZLyT6xYz1Nz4eGtAHkbNoT
 PTUC3Ct+j+b9AhJ+SDg==
X-Proofpoint-ORIG-GUID: h6pq-BoeYChU03gbFwigajl_EObsk784
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200146
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

On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
> Add support for MDSS on Milos.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Though 14000 seems lower than the value for all other platforms.

-- 
With best wishes
Dmitry
