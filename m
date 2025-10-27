Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6A3C0E630
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E09A10E4C1;
	Mon, 27 Oct 2025 14:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgWOyT3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28FF10E4C0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:24:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RDh7Ix2961876
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Z22q11bJjODxBoHmYKUh4Hk9
 cf6IJGKHIianKI9ipUY=; b=IgWOyT3IN8iuBQVuTPSWo9K6Tf208zO9kvOf4adB
 UToFUTwzGTlrjU5UB526DTG2nFzeOSCjkiGNtZnNj4e6LJ4rZ5mSNC6QztUtFaEf
 Edmo4Z1QU11fLYwU+se2aRcon45fGDI511m3erRxjdLW/qpahw+tgJsxfVQ1Blvu
 BIMwYIi2wS8ahyoObhGc/6NRVnRZtQhALrXDOL7VNHae6mEEN1yFdWpumWSGV/2y
 cO4oy1zkIKB3h5+G8utP0k+USpd0WeOuEjjKveWGMkxwR2Vhr2GBuyklVOmw6VFm
 k0VuXFDwnNnfjinAuWzmERHiCsfm6ahMmVz0rkBoJFTd6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29v9r48g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:24:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ecfa212e61so33368831cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761575056; x=1762179856;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z22q11bJjODxBoHmYKUh4Hk9cf6IJGKHIianKI9ipUY=;
 b=tMmdE9p49icLu7kmaEBdUeuVWv1jQVPm+PAT1TVQaw90ZgQp+lYRPkzsPMIpqYD2YT
 LOeYyudLq5F/WgHA/CVtr9sbi8PyI37zQ8F8UhGs41BVX579Q03R19olizdYqkeOq2yj
 BmBl4+QcTKHbpfovH3wGonKDrSsQiABECAQILe7s8PL74MvTZEaLtVr4rGqe+eY7RngF
 WnZbSb7Je1hVz68do45YVnsy50SWN832e0SFp2SEHsG9mmxWBGUr9lJ1WIt7akaMg7sc
 okoVtS7XKYIPpXMnYCU20cMERjOvTdEHNLgGzqvJXt6wQJRRaktOtL8hBrG1sVb64Mw9
 Dkkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnVPAMRH07v1q0Wz5cCZOgqayasvo6On7fCFOO00vqpcqdNuNUvCHTICGqV0zqGY015t3QalB9quQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjQOsfU5QJO/KN/4bzMdSGx6yF+fbQHdsCuHt0Wro5BY1t3y7q
 sDNrk7mY7ove/rOn6CyiIQOnfNI8hjteljoOTgCFs5kD35EKGsBptCE+6OxMcdn2+oLK/e/s/4j
 Zp+vyfM/wpgfb9cyZ3xl7138FtZgizvU4ZtsucCDwshnPIeXXSWdydYG7lPK/L81SCcTta8E=
X-Gm-Gg: ASbGncsaszTD62u2JIv1fD5kkOV7SLdf5+NyTy3Rz98/qq59vFnA+s0RbuGKP8qEBbp
 k/r1347LenrhnJQ9a10xSnxqrCDwavYJEGC17sM0vclrMVumfgpRfv1rufnI1Q3E/2xEA8T/J4Q
 39GYb4JezzEozwCssk2M26snHtMsGJOlb5UW4v5Cn6bD1lVkudOZ4YBBicqAJPfnhe1Jpzc7fGl
 vnTvgZte4657wZyIJLHW1FwEDaxv+DXED/nrwz8gDkukArq9uIZkBmLkvdp5hBAVRSy6vufIlJM
 sYeushpweIaCmS+jChuUWAIzsSR7LW5UeyQebyRhVDuxIUtCMNZuospKLmGitG+498wPIFbBhdF
 e3FJVKCrz4SajyMseTbOAVgwOcctNlFroGbPHkQJnsZoRr+f06Yhkk7BuI0WmVc3LUormpPH64W
 zlJvGvChn54p63
X-Received: by 2002:ac8:5ac2:0:b0:4b4:906b:d05d with SMTP id
 d75a77b69052e-4eb92c5efbfmr144865301cf.29.1761575055878; 
 Mon, 27 Oct 2025 07:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHedx+dtjFeyY8ERWvJ3HADlgp6xnamk0D1DPH/Gu8IaWETgNF+9zta9rUpjvduSYCDstnPbQ==
X-Received: by 2002:ac8:5ac2:0:b0:4b4:906b:d05d with SMTP id
 d75a77b69052e-4eb92c5efbfmr144864781cf.29.1761575055300; 
 Mon, 27 Oct 2025 07:24:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0e0246sm20252481fa.49.2025.10.27.07.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:24:14 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:24:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <62nvrszyslvmjwhsw2hrtqjny47o6eoz7wrixbgga5gpwjcorl@bhme3j25ywvs>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
 <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
X-Proofpoint-GUID: RzbndGDAL9SZqhkBBxqHIGtt4W87d4UA
X-Authority-Analysis: v=2.4 cv=D/VK6/Rj c=1 sm=1 tr=0 ts=68ff8090 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=EUspDBNiAAAA:8 a=5iTMaUzIoB_AQxUztnYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: RzbndGDAL9SZqhkBBxqHIGtt4W87d4UA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNCBTYWx0ZWRfX5fqXsYRoLXdk
 ilczAQw+uWfLkS4xwAPZwSuCKLFk9ZzXgxs56OHM3HYqRyJ86Ys014b/7D76wU8GQVVUED/2wI1
 dOr4JZT1Nr28iwFhyzfXL08pKBnOHNXDgqwGTvTeZ4hQp6obfaaaoSXKmK8DvLpJPIIDF8Ompcm
 mNZTodUIYE8FL4+WiUCDN+kl2Z7regHXI7WUR2hszK2ai94c4WoghqNouryGJ3q36phPEQ3oT80
 T0kal/sb19rKrJkXSBzU+8PcpH/gl+kwMGnh6Ym1awy0Yqy5rh/FCl7QmlUaDXVfTbOYjhUG601
 edISZlj4AceC1ynJ0GPjTTKovwlZdEQTmJw88ufdlPt3RJuzZGx7NxAH856Ax8+Z7af+k+n8mhX
 frN62n7Z8uejdxGbfxeKL/LjDas0fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270134
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

On Thu, Oct 23, 2025 at 10:24:26PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> by OnePlus 6T device-tree.
> The reason is because DDIC itself without knowing the panel type used
> with it will not give the driver enough information about the panel used,
> as the panel cannot be autodetected.
> While would be more practical to support the original compatible,
> I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  MAINTAINERS                                      |   1 +
>  drivers/gpu/drm/panel/Kconfig                    |  13 +
>  drivers/gpu/drm/panel/Makefile                   |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 385 +++++++++++++++++++++++
>  4 files changed, 400 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
