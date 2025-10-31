Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13DC2670D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81A10EC01;
	Fri, 31 Oct 2025 17:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQvCDgXx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrnAT1sw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E289F10EC01
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:44:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59VF79te3210472
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vvHKLumKKaVNpfG3W6t6aYP4
 CbJ/5LJdAfa5MGOu8/4=; b=KQvCDgXxzqVclXNmB/ngqm50Mk7X6iKbKzWhNvSZ
 3UOCW9qdgrNnEhPbnfM8eiYiRoHX03qLmUAIo1ISyAVsf/690rZHRCi212QFmYoC
 MxwhMx99YqoMX4x6p0oi5H0zFOziho/1iXldgNH5SYdvwKq9ArNlY8vkFBMgCGH9
 t34Kbv/jT5VjbaWOinGglah/q5jqQYRwHShskdT4mhcytUeOu0E4/5eKkbBWStil
 +Zp2V8ITUy1QEUpi7Le4mhpRqu8dnw4c8VOuus9SW18opppNxMnwLGbfy2aWlp7S
 7zPJDOaOJ4agF8YSsEARJozB5mkk2aqGY3U/7ZV/q0K15Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4yfpge78-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:44:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8a387d01bso91035211cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761932696; x=1762537496;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vvHKLumKKaVNpfG3W6t6aYP4CbJ/5LJdAfa5MGOu8/4=;
 b=PrnAT1sw/kZn5qObwWSkA/kjiMdtQVEJ41dVaNCutGdjv8ubZwR5NUy4fTlGPIcKuV
 0ADNzxv39fm7e0ziIfRffJnmN15BR0pVbDNO3UWFDv2NlGSfpVemF0zqsGJSTnUvM38I
 yACSTnAjv8EzUlbfUq8g6/HnMh17tDhBEaCR0qOIsKcY/kCoTRxcjZePDQgsuXr11XSc
 UzDEZFD7+Ye8n/MCYe08ttzBlYfXt+qyS7NPlJhPrfawV2wRDht57O8ypevpfdH63qsn
 870i+qxNpB5hVd+CojsvTF5M45RnwhhXf9Wt8m2F8VUqLW2hkLsBNa8alObtIJi09Rdt
 4SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761932696; x=1762537496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvHKLumKKaVNpfG3W6t6aYP4CbJ/5LJdAfa5MGOu8/4=;
 b=SAYaU+hl9UsnOlBp36HB67h/5azvO7eBf0q/EfRT0qtV4OGtHNBm2/C9SPVf2abp+U
 xpADAn4JNjYz0+PZpIoV9/TdlWk7zx7ysVzHzbqyfPzn98u+JtMmkYXH4TzU59DkUGmK
 NuYi/xHyb3t/OxTHZayU6UXe6uwCq9wRwj4D30TX2gxCvM613M1ooNxZrcYR+n13CFzM
 U/PkpfSUkf7/p/yxsMr86ySKDKeFqezupwiug9lALCkSnufpQicsvJFSB3Zj0IcDmWka
 y6GJHSP33Q8nquqM9CBklchSJMv8h7JqklES9Ux6iQQL3TXJnvSjP1Yu3EKDX29HWQRk
 iqIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5RnFaxwzukoqz1N71+oT+Ke90trTPM1DaZCveLxgjyYQZTAGBUE2STTBj0jlNxAzUvdObDqdjlnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5iZQQG0YFiYRXTqx8iNgHQdSYf/udqGCgalHXsMz+5gqJlJxt
 CoRsvAxgCaOJdKiOkhMiL0VtGc7ERlDMZiKs9AUggIfxu2jLR9R9lC//JXZmI5YURrwdkdMBbHv
 JyIkMYwmG83W4YJaTjbAFxPeJU3EYDrFcZOCqoFMApyXYflZeHYpPvPgUVQEr9KvZfVd6zns=
X-Gm-Gg: ASbGncugriklUAOxefIwWsUxWc0M9E8FL4wD4NHksGCdhGqIPwbsuo2rHV4nOt166fs
 6UJysOT0KlbSbg0lhxlxvgrnhwcmcZCQzqGGI/Ucf04RtwcLCz7Wv5y0qnhx0rm6R9/MajIwdY7
 n8JFz91SgvJkXwVKt9FiVFCMc31aKY4sOI4sPAcAzHwLlEK+RYT4qLevY9cJZQxQBM0KS/INxIo
 foIM2TUK2AW2I3Pl2IK0Bhkn1YWfrS2cTYxDnxIvMPRp2NrHskr/XTI65llWl9bzz9Y7IEesvdv
 m0vI+M/U7TaIzKJBy1pS7WJm0VN4tXi6tWdrP2YkqXasUYKWm6eeTlyq8BjOoYs+Dw3aoBjSbRu
 zf+SD7s75ixHIOgKTDNrLpmngDE8H39DejzTj3m+7yASoPtV/WXq3MwHwu+h8k/7+/o2gIIxTuM
 YAj8njfuZZNfr1
X-Received: by 2002:a05:622a:1aa4:b0:4ec:f4be:cd9e with SMTP id
 d75a77b69052e-4ed3109b8f2mr50682871cf.73.1761932695719; 
 Fri, 31 Oct 2025 10:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9bEHzE8FUhJ91Y/44yaTELcPDElgy8o9JtMJnkidFrR8S2ct4TEYiKDSKIhS6PFHQgLRXEQ==
X-Received: by 2002:a05:622a:1aa4:b0:4ec:f4be:cd9e with SMTP id
 d75a77b69052e-4ed3109b8f2mr50682271cf.73.1761932695194; 
 Fri, 31 Oct 2025 10:44:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5941f5b5cc4sm639106e87.72.2025.10.31.10.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:44:54 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:44:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <epz7tibi4kduo6agfirr4fe477dakdccwob4xq2nz6qkjqakr6@jmweqjka4xgd>
References: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
 <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
 <4e444fd3-b079-4e0c-9449-1c119e1d710a@kernel.org>
 <aQQevC/Jd76rTNSU@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQQevC/Jd76rTNSU@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE1OCBTYWx0ZWRfX4rnD1pUNcvKE
 0b6UOVbdtGpRcX8eLOmrEsD5vJMYlmmSJTdM+EmDJlwOq8d8mFNrXhXPNV/U4Llq4T9f+SmPfcl
 EyPfM+tuGQazmUYXe1QDkJTYDzt/aZVCokrE5hnOWRsnDW1V7FN31LvahFfCPe/VUlqfn1tbLYv
 /e0vxWI8Ey8I2PL4MOn8qJY78x/ZexQnm5a5T5HcZlESuN9GY9BWDjc5tT0qc/bePwz15/WHS/y
 eADMm/LxqGbEHKG2z0ls+r92CtYwkDdmfzHafDTkQzV8tODisXVHvlujPLmc4JWIAHbNdHY6WJp
 RzorEuX+AlqQEf+VT9fYot4s/3IcasH9ZdnlV0oocVVB3JFQAfaIGiINUDFWSye4ps8MRuKgvbl
 jfD+zVdZ5xMvpuC0xQd6XVM96ERErg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=6904f598 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=SA9wRs256TnAP9KdDBoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: T3-Bk3lxbYoCEEoz3UdUMFec2uBiWqcK
X-Proofpoint-ORIG-GUID: T3-Bk3lxbYoCEEoz3UdUMFec2uBiWqcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310158
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

On Fri, Oct 31, 2025 at 10:28:12AM +0800, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 11:43:49AM +0100, Krzysztof Kozlowski wrote:
> > On 30/10/2025 08:07, yuanjiey wrote:
> > > On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> > >> On 30/10/2025 03:33, yuanjiey wrote:
> > >>> On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> > >>>> On 29/10/2025 03:37, yuanjiey wrote:
> > >>>>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> > >>>>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> > >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>>>
> > >>>>>>> Build the NT37801 DSI panel driver as module.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>>
> > >>>>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> > >>>>>> provided certificate of origin, then you provide certificate of origin
> > >>>>>> and send it to list?
> > >>>>>>
> > >>>>>> Please correct.
> > >>>>>
> > >>>>> All the display patches were jointly developed by Yongxing and me.
> > >>>>> So every patch 
> > >>>>
> > >>>>
> > >>>> So two people were working on this absolutely trivial defconfig change?
> > >>>> I have troubles believing this.
> > >>> I want to say these patches I am first author and yongxing give me support, so
> > >>> I think yongxing is second author.
> > >>>
> > >>> I want to express my gratitude for Yongxing's support in every patch, so I included
> > >>> both our names in the sign-off for each one.
> > >>>
> > >>> However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> > >>> sign-off from this patch.
> > >>
> > >>
> > >> Please read submitting patches to understand what Signed-off-by means.
> > >> Otherwise I have doubts we can accept your patches - you simply do not
> > >> understand what you are certifying.
> > > Thanks for your tips, and I learn some tips from submitting patches: 
> > > https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524
> > > 
> > > I thinks below sign should be true, if you also think it true, I will use it in next patches.
> > > 
> > >  Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > 
> > How does co-developing match what you wrote "give me support"?
> OK, I will fix sign, will keep sign below in next patch:
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

There was already one and it doesn't help, because co-developing means
actually developing together or one after another. "giving support" is
not co-developing-by.

> 
> Thanks,
> Yuanjie
>  
> > >  Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >  Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > 
> > 
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry
