Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12FA92E94
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 02:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C4B10E3D3;
	Fri, 18 Apr 2025 00:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWHSHncb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE8710E3D3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 00:03:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClM3M014573
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 00:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jJkocawK74IHVR8GG2dYux9L
 W2UbP5wOCkAP2RU5Rpw=; b=bWHSHncbmPt6gikdLZmn1hyrWc0tm9hKLyenD2UF
 lshwKyh6ufPC+1ezDuhAOcXZGnfhOwo4CLMtQYAgU2kV4ShVqCSvCfYXW7A/2LyW
 BYWops45xStt4Yaps3vvBnmr6ciPF/LhixIctgQt5yuQuk3fSp/tkzzUkh/Nuiiv
 65w0RYSnkd+axqZpjNY6fdNgixFPYnOwjuU7HIzkix8V6U1ovIMvW/StzfNPbS9+
 g8YHOu/E5M3qFYlin/30kFNT5G3S2adUtLQeeqF9P8Opx/lGo5Z+PUCg+/Oj0YKP
 lYF+icWgyV/SFO73vVd1dawj1d3l095re5/ow88nxFm4qA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6rm5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 00:03:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff4b130bb2so1295223a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934603; x=1745539403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jJkocawK74IHVR8GG2dYux9LW2UbP5wOCkAP2RU5Rpw=;
 b=hLosNDUrv7yJSEHIUrgw5dqy7wWV+Wev34giW0nzZESup+ikbOq3roYBCQjpCiyWbK
 +BVyy1Kaq0wLcJnJNIyNXWuJpXx1NLfiWUW0Uj9BwY+z1ypEQ2DoMgsDnlhMbZQT2R22
 EEz4xyy5eDIHjQ+8iB/TyrKTfpdeDjs10d87XY0dXgKgvMmQYGzBXoKYC1Go4o803X0T
 2rbwdUj84FKCN3mwTXQo6a9HwW51rwxswc5fTGRfqUyhHIh+KajfNyEq6l1YPdIjG6pX
 3tJBoIXE7IMhS32x8rMZQrYi0vhUqEb19fRuFnMdpdAIaygGg3mjaj0Kios8+YhIEMDl
 J9cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJjEbiXhQThRV5Q2YtZDfEeZdyFhnUqNqOMC/BIvWJu4ASGpk5OpxWpn6KspTzNbWlboFBreZvcE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZRSoQ4tSMOEtpIlDEPzfFfj8sUVR0EICO8Uj4D6x31+Ogor5I
 wGiI+OYTJKWli3CnNZqVoAEg8aBJqU7aFtdhyH7aITWP9guF5GJgv6Q/+Xl3KlxHMhqycI4j0eo
 wMG6RdVBKUKeXVvIulBM+DpzEF18l+U+0cTFrmMmQO2Vrd0QxUzRDZtxRvw5f8DXQ3VAEZsZbwh
 GkduSaYrg/YswZjlWJhmSCsVdR7b9D6yQM7Vq4T5Uu+Q==
X-Gm-Gg: ASbGncvMM0is3wjzdYvm1Jk7qkO/hUGdW2SNZIC5L5JmfA2XB8fVn9TCbQEFfNM3aAu
 IJSzliyoGG3cD2AgOTrMWlsG5Gm3lPL/KcmXJxjBfl/H6T4hvzbO5rn8rbbycLDbpcq60GyjvB8
 HStyPvNcmiTyuBIi2DSPSq/RFAwQ==
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-3087bb4d0bbmr1348840a91.13.1744934603063; 
 Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3zEHzT/caZi4wnZ175L8zlXV3e1qMB/QyXjcrkOHqa4wh1gNr+1LZYEHvAQ/csu/mkfLj9QPTnPMCwx+vTk=
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-3087bb4d0bbmr1348781a91.13.1744934602616; Thu, 17 Apr 2025
 17:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-arboreal-turkey-of-acumen-e1e3da@shite>
 <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
 <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
In-Reply-To: <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 03:03:11 +0300
X-Gm-Features: ATxdqUHUTgGLYvTODPooo91SkskG-gwTNA2jG92kWlujJbztIUTMTuUwe0XuE_s
Message-ID: <CAO9ioeWgtsTtMmqm4w4KTYYSVOWpj1Sgb6D4oy+54wBHU_DZ8g@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller:
 describe SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 3nNnecp-fvBwOrFY1pHPx5YdHZEubK_m
X-Proofpoint-GUID: 3nNnecp-fvBwOrFY1pHPx5YdHZEubK_m
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=680196cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=ni2JVXtQXpgTILOyzusA:9
 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=660 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170178
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

On Thu, 17 Apr 2025 at 15:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/04/2025 13:12, Konrad Dybcio wrote:
> > On 4/17/25 8:03 AM, Krzysztof Kozlowski wrote:
> >> On Thu, Apr 17, 2025 at 02:16:31AM GMT, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <lumag@kernel.org>
> >>>
> >>> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> Addresses do not match. You re-authored the commit, so now everywhere is
> >> mess.
> >
> > It's git's fault with replacing the linaro address based on .mailmap
> No. You can easily see:
> $ git show 51a6256b00008a3c520f6f31bcd62cd15cb05960
> top author is like you say - mailmapped, but Sob is my @samsung.com
>
> $ git format-patch 51a6256b00008a3c520f6f31bcd62cd15cb05960 -1
> What is in "From" field? Samsung, not mailmapped.
>
> I believe that's a known problem in b4, already reported. I don't
> remember if this was fixed, but till it is - you need to use some sort
> of workaround.

No worries, I will resend.


-- 
With best wishes
Dmitry
