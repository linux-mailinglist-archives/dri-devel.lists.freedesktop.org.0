Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EABC5B5E1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 06:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9962710E224;
	Fri, 14 Nov 2025 05:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oeh7SY9L";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdPU6lII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECC410E224
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 05:10:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbpxG1747910
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 05:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=44Ob5C/eoxZ2Iu9/axNE0sTh
 pLfy1097Mev4yzWFqq8=; b=Oeh7SY9LSjsB4E/J3e8aul8Ycz0iFAxs2afaa9I3
 3u2vK7s3FFheMWDDA5uCsQbLwSlNms6AkfpQ0A4jfiGQhtVU8WntONIcNdddbcja
 90chCVTHblcoE4B7lPygos6TOItlu/aX7qnnke0j4ZC2CPP1MH/Rrk5zoiMNtsnQ
 NkFv68mkDgh8zCDUkPowk6H9XbeLRQZEKx+BSdElk0SHZ42sobTGgrfbO5D+D20S
 4YPw9ycwcRMrQPK0QJ9cTnXC0Cn2416s172TsE3JwUcC3+zD/sdhaVYadt0SpHlG
 +ZI2UhnrkmmdCdq433zb/QsGJ5/GcLPe138YklXbAFU6fQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9egwrt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 05:10:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b286006ffaso520263285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 21:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763097044; x=1763701844;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
 b=fdPU6lIII2GzsvXk5u2P1RdsdswM//HJb9uLgZx59krEgHrx4ERUn3X2UDX/DY8OZo
 RaI3sGSF7wObTjIcF5rWkg8HQLu49Y/6BP5ayX0zs79mT8pC1/hJyPPGdOxVszvHvjPW
 iGK4NuSRUIoKmU9Ol9OUVR6wRlYRqIUJz+XtqnqNBERE2izwelH0XMZ/+l6IzhfbuS1S
 iR7KUulgD6SGb08tKVaSbUHL85tgqhuvfxF9Pm1ln1bWyBoKYSOkpQ/DswvG4ZIChLrq
 2GN98CDMTdt/ZbrJAXkIpiS59oWEe3UerOE/bujWag9cScbI5E3lcoR8J4BCPM94VkhM
 g1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763097044; x=1763701844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
 b=vq9nAMW1uiI5kP6nYoHPGoB+YtCa9lGJAjNY7bZ9g14W54s6bQcegCBl3Xis5p9sgZ
 JU8O4ohHCkPD6uyi3SKHhyMLJmYpfOb0IzVUD2NJbmzXxA8MgzZH21Z0HNkXqLWBU2Np
 CSJpbhgIxXdxt4Zp+Zs9AO/9/l577NmF7wsET14cC2HIlubyhUE1Og9O0sQfBcBpKXw7
 hi6VxawABLxJxujxYlzd0/QCbjJBAMFxb0yVD3SQuxOLLWx6IoEr1YQTs9ZnpPUHZw4t
 nRaYuGQFopC69Gr+pFxjs3JF3YuPMdVG+lCKeuLxhzf/KCmIfGRrCaLeUZMg+xu9MI9J
 waow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx2ThGTlLu+Gu/rJf8lIq8+AhsfFwr+lcQqfqfpT5smNtkbEOrZfuIakJ0CrKI7XPkJH8g8PMsNEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw6Fsqu6JeilDaNy19Ba5uOqC5H4+P+mTfaCRD9A6jA4dS2r3x
 1IsCcfmbXE0QtUHN9YySdCLyYQwrAZEz6nuZP6IGpCL6GqIUE38uqFbfGg6/tg2+N8fXVkNnZGT
 /2oYAYkNa1oxb+uCmD1i4j78xEku5wyGdWp7BXRXUgQKjbh9MnIgMbMdNygTX54vRxREvH/c=
X-Gm-Gg: ASbGncuHvPyRZ+Gt9UWiGcFNri81t+1SOGiL4TtPxMu+9rwcBeJzCycXF/rhNy8v1q7
 MLZMrvJ04Zx9LLDIGqwBF1+4YSJlIqlUPMNx92BahBkFVajswvDwaN0tGCEFVf6up/iJAWmJRLX
 liT66FwOayI0Ikqn7s6JmbFr8T3YSUGitRP0HA5JA8PeFHnyPifRL8SRVhZ8pE5ajLHDQQPsPrv
 2taQFJuwsMZwcxxXMDCwi3DBMcD8mURLHT8FXiKF/T1th8AGzJBVZR2H6snUjxosoH5Lo0N1CR7
 6VuxW6cGZYLxTlFu0CtSGQ5Fc8krtKmLUe9JE/uSzb2lgNhV0QyXYSqS/3P+R4DvpZkH9GBhh+N
 5yf1njoj77QEJnX2qMucWGaAOuHWNesu0VH9BcbnOkopLcNqrnd6CqKUy62av6Ppm618g/gj7qe
 RiSp29S62QxLkB
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4edf20e9f4bmr34512281cf.51.1763097043806; 
 Thu, 13 Nov 2025 21:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6GjIlXHWYQldrxdWCXMS1QKmAQg9PVKQ1at1juGVNtZz0+QnY0nul8zlaGm4YiXDNCleLcQ==
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4edf20e9f4bmr34511941cf.51.1763097043256; 
 Thu, 13 Nov 2025 21:10:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b9ee0sm818641e87.50.2025.11.13.21.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 21:10:41 -0800 (PST)
Date: Fri, 14 Nov 2025 07:10:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <5gtcpea2cqjyagoy7ielhauetcqoo4b4dkfilma2drujn32oh6@gyaahiusmwfv>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
 <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAzOCBTYWx0ZWRfX56tjE05NwRzH
 9JiRBW8/vcRSpQTqNmr1zWkNoTAvRJD8ZkEqL96Kbt/iQXghKQUsbcQNvP1sllC4CarcxhnZHRH
 AedEJ53TerO5SuwRPWszY9v+mNtxn5/CsY2KEBX4aWiZT1frJpLh7WwWr/UqCcdLilAAVHGX28q
 vlGKjS3OiQKf8xXH5iFO2AddWgUYSgFHBFzR0+/ttRjrfkp+XSm8UZgVhxuanL//8gkUsVGZhJH
 vWLd4lT5XRZTv3tJ/CoD83avjD8P85M9t5U1FWp+PP4DbkJMAR1RpPLz0Uu6msRkJ8hWkZ7z7L2
 ZHrNhNHbrUiXBCj1VG3z3uAoP0aHmVbgC1Jaz6YiWfDs1G/u10EUpaLqyZCt231ZyLunA/AY7Ij
 AvVtiB0v1+6uEHqrzjukuyI7g/tk5g==
X-Proofpoint-ORIG-GUID: Obio1VkAeE1i67PeSQRnGaHN--zgMifz
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=6916b9d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RxLA63kN50J1D6vl5DIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Obio1VkAeE1i67PeSQRnGaHN--zgMifz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140038
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

On Thu, Oct 09, 2025 at 03:06:55PM -0700, Mahesh Bharadwaj Kannan wrote:
> On 10/9/2025 1:09 PM, Christophe JAILLET wrote:
> 
> > 'mixer' is only zeroed and is not use. Remove it.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
> >   1 file changed, 3 deletions(-)
> 
> Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>

WARNING: 'Acked-by:' is the preferred signature form

-- 
With best wishes
Dmitry
