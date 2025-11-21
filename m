Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F5C7BA8A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 21:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804A210E900;
	Fri, 21 Nov 2025 20:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfWZlsVc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKKiOlS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEBE10E900
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 20:38:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALHfDW03048216
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 20:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=w1hR2eH7HnUwa5LndV/w046o
 vky70Gx8uo/fdHVtGbQ=; b=KfWZlsVc8a4iw6vpneS4JJXq5iVwzhZlNHXVa+F2
 w0L7p4cm28R2V4PiaGhsZ4ejNd3JCc4qs0csbeW5zO4mb5JDLc0MJs+Cc51fR9QE
 Zmrjsuth7uco5r734F2ZRaHZX/iGYMWckW2TNeEwGn6FlYxIeaiHfBL33XNUiyGk
 2So5Jaky7n4gbx5fCBKwBGlNL9KpGLdE9IK9FCJ0VblVayidqkB/OM0axZ89qz1W
 W4HMH1Cg65sbzxUEVa8qBMbfnAtDQFNMLYt7XV0k68mwkWfhD+u15js17epg76rQ
 NFpqVnLrXYgmgCmK4Ooxvo1BLi5lKMKAy6oxebl1RUvsAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjsyjm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 20:38:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b1d8f56e24so708613785a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763757510; x=1764362310;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w1hR2eH7HnUwa5LndV/w046ovky70Gx8uo/fdHVtGbQ=;
 b=AKKiOlS/dki5VHTBIuURBfe2fBVqLQMzfkTwDLO+BJPc8n4FUwyqNf08JRxAs6iFB7
 duDJyRCozbd8weg1FJvwlAkTfhYzD5ipFeW9VGvosgNUO5sRIqRxy5yhUkGnVAoLjCVr
 iJyIxLR76+TQiuwETENuY7LaldxjKqj4DDmHPQ8BuDdqfU4mATIgIh3ikyki/It+q+22
 oZfzTv1uqcwF2MMmGY09Hpum/RdznoLQhCSXviFl4lZUVbQNR4nHyGJIWKniur62MAYU
 io8F5i9l5mS3MkDQQbkelx7l3nZBBor1GosAfyUb79V5Fv38vcSwEynkcWb9m7G0b3sz
 ZAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763757510; x=1764362310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w1hR2eH7HnUwa5LndV/w046ovky70Gx8uo/fdHVtGbQ=;
 b=jXMHTKK8dUgMz9bIHkKddcB7NY4uZbOoS4vdGZkNi51v+A/m4sNg19QSjkK6I5UH6V
 JoO+PeSIMGhayF7cRB4ZRR5WEOqFMPzFM8KdI9gEC+SJfImhnTavo3C7/+8fKgKySR8I
 kOYdW8psv5vdRybb+/GNRp69BoTmvSftbe7pjI6uaYI9xv8oGyPs+i2u5VLv3W3nrWfP
 PLfqjkWoiNWkL1KMjazxWvMIuC5c2BpY8oDZ2OstPz8LKnfuw9T2kUKSQxfTGYPJmWHG
 ZfRUBdAgafyBOFhzSs0mcENwq4NgT9iVEcId1EplRTvgyAYZ79Eh/IefTAgOPS5ahPAY
 eVtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNSdibmXBpR38HQ/f0Fb06xtd4L5SyBd2KkXB/dcawx3ikYcp5bQWD9VqT/68u87OoIUMb/zKpoOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx/Bwoyu/FqBnK62d48GXAGm7VlI6fb4B8DbqDgYJIOj/TEWqL
 U7N//bReIynnM9nmzwUoGD9qIng/ffAEzh6NDdXLS14e/Q6nv9MZTEjf4COHBD/TqOgLib0PYGE
 cRYkW86NlYi2oAJTrFNbe2iYmXqQQwatXIAntWp/FhQGe+ydoq3HGhrTmUXef0tEgZ3FP+Jk=
X-Gm-Gg: ASbGncsoAK1NVYjmnCklm5yFrbgDscrgKVSYPlTeG8Xb0zCj2fubCQSTQYDisbI29NW
 Q+a5NT1b8lGarTHpIyMghrmhHwcvo5Z69XF2sJXXwfhYfBU2c4oVv0vjSHYUHk1dQBpSEV6fsNw
 lqyTet4z/H5DhISezS4QZiAlulSsNQ5Tm8bbGI2LHW5PMRZbR6KLfJhI4CjKAj3K3dHJUObez2L
 0f73uPBfh73ohgiJjaiByHvsbt8f6LZcRlUAG0CBLv5JxvYmLxPac8HqFl6Kj6InNzv2MAwV/xA
 aw5vGD/fVqYLDlkLvPy1QB8pgMWfBcckTqaLdUEBxnuUsIGtfhipvTfCDFt4BN4vQ0SjRR2p1kP
 hHvG6PUrubXAYAMykUlxdFRE5Nyw8XNTP4AZiwzuHni5j5YzHAM4XK9JSBRcfswfCRIs7H5OFoS
 pEpkg82XCVdkRjjz0Jx8PLw7Y=
X-Received: by 2002:a05:620a:31a3:b0:8b2:e638:7dc8 with SMTP id
 af79cd13be357-8b33d1fe720mr430041285a.31.1763757509868; 
 Fri, 21 Nov 2025 12:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwF/pqDLiyW2+aj6+2SODooudu2r2Z5OlD6MluktC0Ty0nB4MBp9KGjJ/A39fi3PedEuDFRQ==
X-Received: by 2002:a05:620a:31a3:b0:8b2:e638:7dc8 with SMTP id
 af79cd13be357-8b33d1fe720mr430036985a.31.1763757509405; 
 Fri, 21 Nov 2025 12:38:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db75710sm1851688e87.8.2025.11.21.12.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 12:38:28 -0800 (PST)
Date: Fri, 21 Nov 2025 22:38:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
Message-ID: <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Rhr0RbbA_dG60kL-MaW9ghhXNnTz_q1t
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=6920cdc6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8 a=QyehCSxPrjoiuWyWIt0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE1NyBTYWx0ZWRfXywHl6mR8axD9
 ZYRkVGL36TSDrpoltnhAdovqyFi8ka+pxSUPpVaXg1P4dSX6QWyo3SxIIz/RvVYJ6qMXt/R0l7I
 zoG2hVQoJ2c95ZLFpT1ei8P81kqQbAh6YdYSEr2B68/PUwuBfF3ABvn35LkCgwfEmd4t5xDIhOm
 6eVejaUWEMAx9bAjezkapLeOi0s+tH5mVfG1dGWi0vrw0cMNEEZnbkWL7OZ99Rwzd55tg715dHj
 sU774c6yK0uqcqHgM0F3xCzaivQMme/zISqSDHqx8MDCTALPjUzshncubn3u4uK8GpGoHarlE4S
 PjzNU6pN0JdFBfLr3dGLeHmcSTuJ0wWISz0zVCvUlLiP5nwUtc17V2CL0NND41ZA2mr680mq6ZP
 g20w7fDzknKi4qUI+C3rvkKGpDN04A==
X-Proofpoint-GUID: Rhr0RbbA_dG60kL-MaW9ghhXNnTz_q1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210157
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

On Fri, Nov 21, 2025 at 08:36:08PM +0100, Konrad Dybcio wrote:
> On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> > Add two remaining bits necessary to enable Adreno A225 support.
> > Note, this wasn't tested on the actual hardware and is purely based on
> > the old KGSL driver from msm-3.0. For example, running on MSM8960 might
> > require adjusting PM_OVERRIDE[12] registers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Dmitry Baryshkov (2):
> >       drm/msm/a2xx: fix pixel shader start on A225
> >       drm/msm/a2xx: add A225 entry to catalog
> 
> Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary
> 
> https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c

Yep. msm-3.0 does some other things for a200 / a220, which we don't
perform. I don't know which parts actually apply to our stack and which
don't.

-- 
With best wishes
Dmitry
