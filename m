Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B67CA9FB6
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 04:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E5610E106;
	Sat,  6 Dec 2025 03:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3iTVbx7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxHHz3I1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066AB10E106
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 03:35:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B63VOes2401631
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 03:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IXPcbCBaPEtCMiINSRS9p4GH
 WlWr4Um92ZlmDVQDvTo=; b=L3iTVbx7dVdcXG+O9jJyH0p75W9XT87kBHMEUB9Q
 htsTLKbh29AcH47+pzItGPY/fSInYKMGroQhXtKWW/+Cojd3CplebDqmofmZOTcT
 rJBrwhjeNeQmifbOLcaiNiYK+/xvcRkhCqx/XRaUeoNK0xLhzFu0Pna5pSdmoK+I
 ubmMtKiGbCebb6ctER83GUjfxLzCKs98VX3Slqjbl8KriIyBIge92dzE6/UMRwN7
 fMZb7q/Cz5DnnQMCIg16AvC2ssam1MMZyzJIrgZ/aPC8ATPp30lQC5byXZlUYqdb
 pZvRrV+FCTX5dj49O/6/r+/4S1nDyyxQ/PpUgJaPkp58Qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcndr083-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 03:35:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b245c49d0cso46261685a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 19:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764992138; x=1765596938;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IXPcbCBaPEtCMiINSRS9p4GHWlWr4Um92ZlmDVQDvTo=;
 b=TxHHz3I1PIj1o3JYxrtqme0iyWXKl2Lcg3EZabpBGFr0u22nvtqnmwdKiFiOHQTRQS
 c2He5squBqyLmogaTuoxX+GLpkolJMhOi3TnquZsxkIUkI2RrLB56r24uo/VGaU6INls
 FFkDVVeNF9EKcvAEw0c+Xup3DijHyY1/rB7ppqy1gfvF9AgtJfT/NAzhwupIQ8ie3zCJ
 l4131CBNYfBmMLNnnyIlUeBKJ0uChExA7nROLQe/qVL+CE6BSfyUkH0J2a+XM/NZsjtL
 y1PPEcg9LlvtGZykUL4ImIU3RTanf9Gk3tOPqeFEzCgN3nEW9mWrt0QrkG1a7j3gQiOL
 5tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764992138; x=1765596938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXPcbCBaPEtCMiINSRS9p4GHWlWr4Um92ZlmDVQDvTo=;
 b=D1ACGVwdUE2tW6502kqYUadYzHuyYNDboTXVzPkm7C+GcdsRYD/GkllTfpMMiBFlhW
 PmXK7VTPGRCzWMoNyR3M0E2w3KvZNmSNJktzbwHA+8LSPHWxJMiIdhYjRe5Iz+vDbKdq
 7/gPetLCy5bW6v3Z5POSlXjU50JARuy5i6tZdkHx7kHDdUFX6e60PE+5cbHUZCDp7ph1
 rMJ/OET06oJJbLS+QicrqvfqCqP/nrDv6fdBeO30m5Di7MLpLNNQUs8tmPAShiDAU5i2
 wl37rGNnu7Xk97aTlnktfcOB1fkjcp9eLH1pm7DbkCMbinU4Xr6wbSLzsy7Y9ZhEhmru
 1eEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC8LuMmEP2z+B0x/gXcMflXNUVUoH4OLgTrStSXKQFRgS4hBSinmD1Tf819i0X+F0x/XcdNyuaFM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz30ozEcC8rV7FfBjzYldJo4Yc8EplCao453tsgqwyX/7NpYylA
 K1C8rt6ePUbiQAz9w2aVsGA6+ZoIQ5e5IhQbSuvHY+oJ/g77KZEAtybh0qEVbGzpchIzikKX8z1
 WnmWHUzVCta5XEBE1wBoGGg1xFr7WjNNjwmmkp+lNVh5i9OoZ5t8+x4ggSDwfQX96z+GJNcA=
X-Gm-Gg: ASbGncui4dXRveobux37uYT2XnTBCuvNu1UUhkJNykEaUoELf2qNOS3pJv3wSmtxDLh
 DessJbJHA5pu1I+caFUXimP/Pk8ihjTAyQzzfYL6OSJvNmL38/nmQvA1rES+/xMhQNJkzddoPc5
 2SD3eMoAGPrihmKGWKvM5q5cWFMoOH1zWmQN0WGC7w1uKG8yieUr1nh5U3tHTtD6g7qkTHxjRSO
 ktE8h8WmPukZNqhZpsTxZLgIXd/hj+XT9rzlCH0nhMUYBCmRADiS06c7gNtn/sFRvhmVeABYIae
 zm2pRl4zvRQLAAFqCbP3U8PummbPPJFBMjq1DjBQAOG/tKdY5/ie8bK8tPSbrObjy+1n780IcNh
 Xei1JkFh/sckhIbT5vvLFK0YCaBd3sWci6run0njfLewqGdBnJuc+ExmeYFzRvlnarsOKoyXtJz
 m8vTvcyWWbYunmq87oEOQBE1U=
X-Received: by 2002:a05:620a:3190:b0:8b2:71dd:588e with SMTP id
 af79cd13be357-8b6a24f64e7mr210231885a.90.1764992138354; 
 Fri, 05 Dec 2025 19:35:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUbE/SHRgDvUvm5YVOFdimtJ2ZhaIalFbIGKwVQ6n+VX8QscibWner/JGt2413Nypt1oy+pg==
X-Received: by 2002:a05:620a:3190:b0:8b2:71dd:588e with SMTP id
 af79cd13be357-8b6a24f64e7mr210228685a.90.1764992137950; 
 Fri, 05 Dec 2025 19:35:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c28026sm2035628e87.71.2025.12.05.19.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 19:35:35 -0800 (PST)
Date: Sat, 6 Dec 2025 05:35:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
Subject: Re: [PATCH v4] arm64: qcom: sdm845-oneplus-enchilada: Specify panel
 name within the compatible
Message-ID: <hsjeuii636bzihsbxfb5e37bizagcseme3czhesffpraa7sufx@qjzylz7jbktq>
References: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
X-Proofpoint-ORIG-GUID: ngGOlH7B15lWLVtZbew2e_xH44yy582U
X-Authority-Analysis: v=2.4 cv=baJmkePB c=1 sm=1 tr=0 ts=6933a48a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=alNsdzoY9l9OrmpsANkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ngGOlH7B15lWLVtZbew2e_xH44yy582U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyNyBTYWx0ZWRfX4gGFHxjQRZAW
 PtB2kW5oDSYujx3X7nELE2osajS+JjEm8hDpueRQIZW9NEvYGUV3uLYbCDodSVs1AV2ku7qBFX7
 83KZzhOK7DLb3BRr7K6SJ3alZW9DZxbIY9botiPoJ0thc1Zm3lU4JnWwmS7mfqNQCEpQnEFWYgu
 u7nIO072HglnPgTXRXe9wrMDCKahoI2okaifso5X30AQcsnQK/AJCBUeSNUQ8/ePFk89SDe1eoq
 RbCtbNhd+hDee3NY+DCKtHdE3P0IOLcGdEgUidFSA+j3jM9rlZZdXcIg8DcMuXdeJu3HItc176Z
 btN6GWbGBLAfKDSjSECVBo3IiCRQgs5uBc0BbXOxNLs3xoUPRpPpJ0o9dbY/wKIXWTsVvKOduRn
 ZPk7g2FQkXKV+z1bt4EYmYX478kg4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060027
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

On Thu, Dec 04, 2025 at 11:41:24AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> New device-tree will work with old driver as expected, due to secondary
> compatible.
> 
> cosmetic: sort the node.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
> (SDC variant). With proper support, all downstream patches in
> sdm845-mainline and sdm670-mainline can be dropped.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
