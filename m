Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89542D1015C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 23:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6F010E009;
	Sun, 11 Jan 2026 22:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4k2zhc2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McTP9Ljk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ABB10E009
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 22:39:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BLU24t3038593
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 22:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+RPBAcP9xaNHoSSDkl3fH1Sy
 vIjRExAbikGPqzw/p/E=; b=o4k2zhc2QhydfBu0XHJiMVi8osO0npdSDP+BRE2y
 Ye7i4/4BI84xYxlOGsM1eooQ5OO/vCO6G3+mpQwbBM1HFU4bq8Eo3BGRIeV4QetT
 riugmai9Atjkya2N4+MfcOrB0PvcmNeDZ0mnzuWLmdFHCxBNPxpOGZm5kArEXshl
 QbjwIAtn/KQyYAFUUuaLwIue+gpMlIN/jwTlLJ05/MRzbPgC8VI+ZleoA1zUTXXo
 QYQLTlJbAMs7zKrcOoWIaU9t6iUhnz+2x/sAvLllwyC0qRLXwUCN8fZq0X9h71kK
 qNm2u5OiJL1XTe+P6gbOL7Xx8L1NsGQEMAwHruFJxls1zw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntuja8x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 22:39:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso1332613185a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 14:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768171151; x=1768775951;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+RPBAcP9xaNHoSSDkl3fH1SyvIjRExAbikGPqzw/p/E=;
 b=McTP9LjkAnW3t8JikPVfnVQHBO0SEV4SYd1x4SbSy4I41lUw8kBML0zFI3ICXHF4FZ
 xte5g/pfi64f6hXvd8PWThQCEDob2nl7zImOswnggA00aLFNTQJFMXZ2dln0rCj1m3/I
 lqLYwdyLVzvyq5PpzhUpdb0EcENLHMAMv65umaNTWIYezT8N8RohhhNLnDD/2KdnpD/l
 qwpLJ3eO8AQIufVUh287OvnennIrzH1C8O2Il/x7RXM6eXvWzFEt5xyzkcVCt+OaLnYL
 FQsY4591qbGxe81xteEIm96cu0+FPODbeouGGWSnLNod8l/1uYT0LeGixfPwqk+z48NG
 199g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768171151; x=1768775951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RPBAcP9xaNHoSSDkl3fH1SyvIjRExAbikGPqzw/p/E=;
 b=XK+WwVOMN1wNVGGUBvhih8CJf6eNS8zHVz/61lNLPUapEiFHM/AqF0L4fpmM48jXI2
 bz8H3LDzke2Ocmo+Jh7RT2etzYHkG/03uxDarUeiLQ0HtqGSZ7livmlmbsg2JbsD80Yi
 5KebSg0qBBBNUQu4OkGA3RsBr4J3BArPS1ZsbaxszGHXnSXPwsD8dO/Sx5laoyY6tqhO
 yIeM6LkifiFs4wiwoc4DNaGfxV/stBo1NhIV6lK6F8SGd1FZMvdxaTLOURVGQHvJdHe6
 YexcKlT2fGjTmLmXHcYlJHkwAhbBqCAM6+7yq9eVdr6n0wJhKyBRdUMWOhKV3eHEWEhZ
 YHXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgYUPL37kvhXHqnQthAgLybmDPDkH4bOMY3v92By6S4YGNbsfsjJ20FN4szxSad/p0AdQwdkBMQ1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0wmIRXb0FVMyezE831Zc0w3dVd358UwS+VTtJk2Py65zkPxmI
 Wcrjj1feZnIrwqQvvhi6/+SZgQ2pK0+/e/p40KFLhux2h1/PkqORqbzBocs9+lJ9MdGa7Lxny1p
 9qcCHguP75TJFJkVTznsJeWbRD7myNVefFw1Q56OrWuW1NeiMzVd00rpjw3tf/vi1QnsCB8U=
X-Gm-Gg: AY/fxX5sb8MHHokIADdFp7O9/Ny83E+/5Rub2xBnryZjIvhdoUARMJEXhMRkuhjkTZl
 6691vHquiyxUBNGOQE/qysSuNKmST6lP/CbiZ2a8qqakQ7c+HGJOGixAt4zBE/+7QL1Jj1tJ140
 CwkocRdApcVyoDKQiYxH32+igWnJeQL7V9OzlI+7vaCNHsVB8ZkCuhlsvS0EEwmV5y5l3OAHFWx
 A2eajUdRJirBewUZwBlhqJBHl65rWDaXfOFeKW6ClKPkFrbYjVy3QJko35pHAnMoxu3MUSUFcZb
 7x0Wu3LN8n1FimxhSMDwJGMmV5ccT2PM2HiRkbcdKgj7sGKq8FGIzVpJYWoNbE1L9T90q1J6TAr
 QndhWcye0q3j0gUCgROFy/htiQu3UVKSUiGiGD0+uRn0g6fB5Rae/Gr5oe5K2mRYuQvCpa/DLIs
 1mDKClWdJx8bdh325o1FXc7NM=
X-Received: by 2002:a05:620a:4081:b0:8b2:ed3b:e642 with SMTP id
 af79cd13be357-8c37f53760dmr2840809685a.34.1768171151549; 
 Sun, 11 Jan 2026 14:39:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjxdmJgakn1EPp8Nr7AXb0meRMwEnhmDGjxOcxQ3/OAMRAeTXOCi00XDZHpl3r3/CPT5gJkg==
X-Received: by 2002:a05:620a:4081:b0:8b2:ed3b:e642 with SMTP id
 af79cd13be357-8c37f53760dmr2840807885a.34.1768171151049; 
 Sun, 11 Jan 2026 14:39:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65cea275sm4270403e87.1.2026.01.11.14.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 14:39:10 -0800 (PST)
Date: Mon, 12 Jan 2026 00:39:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <hkmtcrf734vw6bln42uez2iqt24edmrxqplleh3ocbmwcvco5p@bo5qnf6vtdtb>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <s5qWCzqArtZJ__Z5g_Op86qPiA_J5OUkdeknnroNURmDWWR4-FvpsYpevQffI_wcobL40Rz9T71z3TBgVw32dw==@protonmail.internalid>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <bd95734f-5c38-46d0-a3f3-e88f85d384f5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd95734f-5c38-46d0-a3f3-e88f85d384f5@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDIwNyBTYWx0ZWRfX2cOpV1WG3g7X
 L3X3F2NUnC5+W9GPXOXX8uKR5yWiYt86vI8ZrnuUwAdxbwYrPsg016Gb0+mOLSukn8NC9iLUDDP
 u8eYzxcvax/YZdL8pDBEJ8KgSqoyM8afDpNKQjOfJ5Ujln8TN+fISPoJA9WfV23S+NyxaG33WaR
 7DOjP7/oUNkaYg6Anh270++wp97r8IixCahp/gjrI4idu9CAolMsePmbSd6uLKbJALM5LYSjXYn
 T7/oNCt8rHVsgei+Ds0RkUi93UtWquC9qr3RjFoRPk2xQf+YRhnc/nIoUbwqPh8TaZ2osANhEt7
 yxjwP47+nilhDuxpdtkb5w5q1X4bTjtkh7Pthiy8pXSsyqXknTLqwuTF2Sdr8s9HdtQfsX5K9Ma
 hYwO1f0pBEN0PTdm/S6Hf7hQUX5RJC+1uuRqUrib/AHVIovuAkQHIkcMGL89TAx8id6X0suihfr
 SYcCxje1UBvGJYkT12A==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=69642690 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bOdX0WsABJpHto0p3fIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: n0gPNiuH9jWfwQEXjO30ImvUBjHarkys
X-Proofpoint-GUID: n0gPNiuH9jWfwQEXjO30ImvUBjHarkys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_08,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110207
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

On Sun, Jan 11, 2026 at 09:05:35PM +0000, Bryan O'Donoghue wrote:
> On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> > MDSS and GPU drivers use different approaches to get min_acc length.
> > Add helper function that can be used by all the drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   include/linux/soc/qcom/ubwc.h | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index f052e241736c..50d891493ac8 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >   	return ret;
> >   }
> > 
> > +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> > +{
> > +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> > +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> > +		 cfg->ubwc_dec_version == UBWC_3_0);
> > +}
> > +
> >   #endif /* __QCOM_UBWC_H__ */
> > 
> > --
> > 2.47.3
> > 
> > 
> 
> Why not have this function return either 64 if the above is true or 32 if
> not, then rename to qcom_ubwc_min_acc_length() ?

See, how it's used. We have several callsites which pass 0 / 1 depending
on MAL being 32 or 64.

> 
> You could imagine some function SoC having a 128b length for argument's
> sake, it would make more sense just to modify this function then instead of
> all of the callsites.

It would require changes to the drivers code anyway as they would now
have to cope with updated register maps / values.


-- 
With best wishes
Dmitry
