Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC8CD15F96
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 01:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B35D10E29F;
	Tue, 13 Jan 2026 00:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnpIResj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2NHf44J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294BD10E29F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:24:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CN5VeE177711
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dzxkXozKtULhcUZuJh1MUOqg
 XLBE5AuFunSWmMnWvjI=; b=WnpIResjGpzemU0cGefeUfym+RgYNJJ4pdc3juM3
 DeeHYy7ACajDJoQxQAl9+ci16isOb7UB17G/i3lB3w+Lgez0c5cXN0uvrSNRRCTo
 ARm46dTkyaDL0+muCBT8RYs9LYwrWaexu8mWYjgIkyq19idWKZANZgqmbsKLaDHc
 BMTZcCn1ZyMxcpVJIHKFXb5LyQRjVttqZtxI8W/54kd6JrLFJ1SnWGzl9ZEz69Rk
 xTbOqRGEkDuentWxforWADOoBXBVXMCvdKAhfVvkl/c2FpSNxh6lZk///x3iYj94
 gYiGy4uHhLUM9m1D4S5mH+HIrdNWZkuN4G4OBAxhvar9tQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f14f4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:24:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8bb6a7fea4dso1731593385a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768263889; x=1768868689;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
 b=L2NHf44JBtCak88UNtSuHRfFsSR+LbIHGpLA3rnxi6Sf7phRr8/8zHFIsQWJIR5J18
 tw2CO9F/POjxV8txSyXRx8rErqMSX9ft+GpVVgXjgwXN2ClFY+lG01G/SEg/71wWpJtP
 f/wzA25USAROiQEaL7a+bXSR0kOWmIQ7meNk892/TYajq5/px5EThZye841O0j/30o+x
 uhUJcyamdw+zUne6tRoAtrKTKWvTsAdvZ7a1QwYsyfzL6+WKKzfGpBglciFJh5ipxfZt
 FLHmi1kaxzBlYcmZLNqt/71cYxlnNkkY0OCyLyFG2oHxpD/hlZTXG6uaMU50JfCXBh9+
 lKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768263889; x=1768868689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
 b=h6Ld0t8/9V+8TTGecz03iGu2GcCuXT3SA/9a98FxcEqOafvciN9g3BwrDKkTkpUL6q
 UnvBY2Mcg9uKC9N1LWbuYI6D0Hq40mvdIS/W3N/YF9r+1UhnpiM9j7WdI1cFSh+4k3sB
 NA8Jey+u/Kq+2VxAnJCFKYGh/0ASk3ELC+OetmWxfc6qFzb5W7fXV+QZbXDQhfUeVn5F
 uWlVQl73HC3oZLZb3L9u/agGW2/RlBpEGKqec8sc0StCJHqaywYqacrhK41IUSg3BZEv
 WrdZ79rRjL4AUizQs1PvUOUVs9o4/H/MqvmGMn2DMIG1ZFH3oFCX/Uyldy3In+NK2iOZ
 3kVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMbA2tLc4XYRJCHF1O5/dm7/cLZcIFirucLJN0T2CJsXbgjgHRrd8RLHM7FqjqgOtaHI2zT3yS178=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqeTrSvNaOyZsZxv8+/UbhI887An8zG+bSqLp7Ckc7DDp5OAiK
 CHS2e0j+j8jKsAWdpSdpYjwzNXnlBpHNUeUNsRdCuhPMvX/46kYrzbQce4u7VoU7FCvWpy87Uzs
 j7JeEKrEVvU0FnGoveLRvpSyhqv+lCiB6m7CxTy8tPYMZK0wgzdi4UREUyF7ORFNyLDrQVBg=
X-Gm-Gg: AY/fxX6GKIaoQh6hsRgs+Hif12q1xF2QIVLPlPS+ebhX3dQkgFteD3UDeGu7NqV6kkg
 lkhpa+WioEqEYWu/9TplQhKOLbo7AeEOnewzIzW9+wHmX0ERgMSY96B81qpN70AULwASsXT2QCG
 y4m72cokl4I9Zcgf52fRcYiqav1PPQlOybxaHyrR0FD8w8BUjZ/tdR4QsfK5Bg8cV9YZrb3afTq
 wfLzoqdyQGobJGeT5f81tgqxHUcP6EX3o8HIYjCQdNb+MI6KqLdPAgozi/fL+G5DMH3+jYthpHK
 R22JjTGKZsV1I3q6rjaPsv/BHEvbp1Fya89GUpkL0wOmehNT2ibEDn1jMJe02jdDxCiEdtAXUc7
 D1PjrNhZObHnSG/DM3OuVzAGqIQPtEd2DStBUe1AJgFLWEu+uM3UAU1yPwSq2d2mXcKaUEysRyD
 o7Wm6fskeW10v6WD198z5nLNQ=
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id
 af79cd13be357-8c389368bbemr2941976985a.5.1768263889555; 
 Mon, 12 Jan 2026 16:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyjpi+M7spreDJMit+P3ck5UUiEC5t+Si07Rff8PFo3t5TmSHbXB39Wl8TRKez4c9R2Z2VvA==
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id
 af79cd13be357-8c389368bbemr2941974185a.5.1768263889102; 
 Mon, 12 Jan 2026 16:24:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382fc17b990sm33674221fa.40.2026.01.12.16.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 16:24:47 -0800 (PST)
Date: Tue, 13 Jan 2026 02:24:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwMSBTYWx0ZWRfXzpkETHipq3Sf
 pCYhi187eOpeEuDiq7LUrSFknUYbBrPdjxqW2kLQzqBpK636FLl6p9rGj3woGP70LKvGTgLpZEr
 FDhHqLe4hOSAhaTQTJMgiDBR8yBhH92ydGy9f2f9ufW+G3APnXbuNyO/ZL5zBeHN6xCEK+XjBBD
 p0uha26UbXh+Gfle7L47t4LNxU8Gck0AorM2lFTsuJKsx2LN7rinp0CylfUelxe9qdHgd63gVZG
 5kIFs/WTFgBQ6DJOeaFXLYobmZdcdprBz/jSz9xBao3WLyn9Mfq33LHkmClq9kDIWOtVxOkOlAs
 iLWfd90+GQ3OLPfM1SBprLvaGmJYGMlRMTGEyBr4j4p4xfM4OL/xhFcxhWAdig4DKTYSjpGq6gk
 wyWTyOA/sqP5paPxYPTryaigXVATWZorYvVWt7QSnVhUQ1+KMg1U0v1v6U9LNnqUrwuMNVqSfiS
 M2N076mNcCOKhCOLw2g==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=696590d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V2uskYJtpVaDOKukMOMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: smhzf_n1JeEWVytyqj6DqcD2iRsS7Xn_
X-Proofpoint-ORIG-GUID: smhzf_n1JeEWVytyqj6DqcD2iRsS7Xn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130001
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

On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> > MDSS and GPU drivers use different approaches to get min_acc length.
> > Add helper function that can be used by all the drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  include/linux/soc/qcom/ubwc.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index f052e241736c..50d891493ac8 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >  	return ret;
> >  }
> >  
> > +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> > +{
> > +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> > +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> > +		 cfg->ubwc_dec_version == UBWC_3_0);
> 
> Are you sure this is a correct heuristic?

No, but it matches what we had in MDSS driver (and I think it matches
the chipsets that were selected by the GPU driver).

-- 
With best wishes
Dmitry
