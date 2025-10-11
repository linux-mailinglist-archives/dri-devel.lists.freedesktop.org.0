Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DFBBCF85F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 18:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D1510E0D0;
	Sat, 11 Oct 2025 16:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLqgqwoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B03E10E0D0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:43:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B4df8i002209
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oU8z37jW2RVoQp1KEkGDZ9URJlR67NRQMN6KJdRrleY=; b=PLqgqwoRduc24kB7
 JOpguXw3AHarqLRhvmEjCA7orCb1Yb5Vp54N2JNiik9hZw3Q5GS/CsGGr/rn+kbH
 XvlUV3qMnnc/n+eNif3+p3JHDijyFWyyLIN+tFhr/Q8P08EzZpODZ0+g1C7kfCZs
 mIpN9J9IWg6ZB/x+4qwN0AORRBIRjFKzXWllgMI3mveizK8XNgCk67fP3A5Vt04n
 BGDZXHguWHe2rMbKJ+1hkklsXlpndtaiYdQXyyzOb0fqBVT+4gv2MS8E8MRdxF5Y
 LFkJ6RMyHyid/aB1e3J0SKC4CGFkhZiPfP4h2xhh4X8Zo4FEI3z6Q+qqnLAiAUK3
 NqOAzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfrtmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:42:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8589058c59bso2534144785a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 09:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760200978; x=1760805778;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oU8z37jW2RVoQp1KEkGDZ9URJlR67NRQMN6KJdRrleY=;
 b=UMWwibMccaYgt2GLyQgOLjhMBRuWJkMxrKxysZQj9+W9apTgbQusmm3/RmKHnckBuP
 gZk+vdsxkxRKXvbuX12rBP8xwAWAqsDanuX/JCUKvgMdhtu2XCLBLRVfhDx+v2/6NSXY
 3mE9Tz7QpuwD7TA47UjXF56yz89qFhdvhQce6Bpcn/osphOklsl4v07uHgKbXb8SPh0U
 TRChuQnncjWfBeMa5+GzpCcETBr9oE1tgJOWvZ6yzo80DVmsFOnT4JBnXjMy7hog9aJA
 Dcwf3YoDcRgk/BJYodxpk4l6niPJJuZFGaSKkLxhd0aKMbmyxEStyr0W89jjTWFhGW0v
 C28Q==
X-Gm-Message-State: AOJu0Yzpmpuix804PncalxH3f58YmHweQlNiodHv8oFfO03wqdVLFkIh
 NskpCQtFX6c8sZ8OeloI/zsvHrl7byDJ2RGKbpu6uagXA1hfP7/eT65+UJebSl0+m0Z059hnUkR
 EVa1onjj/hkrLRlcQPt5ckgbTvr4rabBvMTTXkZFn009kBo7+PRDz6loIWbLFvELOHw5kzqA=
X-Gm-Gg: ASbGncspxf8gRU/J3xJ1aO9C6lP9ZPLVw0dG1GI5C/5AbkDPxkSX1gkVK812kczWcZP
 Kqx0t5/fXjl+W7Qko19MxzXvWbiWoJydYY5rV5Zx3S7+Rl1EOynYlPD2EvCjteNLfvGVELJ/jCk
 q3BmBCcAplJoi8DLIn+WjjKs8NwvBd+2rkb7/+YJtC7ujrcPYGN0fzQOF5YHbEbIyNsnWcK3vLu
 xjhxtI7dSBqrl3U4GLHF2Y1HNmd+aiTBq6vq11bGKQ0zqbcbMtTEtNCYrhRfytBLUIQoyJ95YEC
 /z06/aigOd/FZOdXh4gjkFIb2ko2Fz+lPVuNiitqyAc08+46OKUZqF4K+iIY8z4NzlUjH11/41P
 +ZxfL5Xqasw00jqADF2kSwM/+hxTn8w+bC5379kLRna+VgT2qhkpE
X-Received: by 2002:a05:620a:28cd:b0:85a:8ea3:6bc with SMTP id
 af79cd13be357-883530825dfmr2224386185a.76.1760200978133; 
 Sat, 11 Oct 2025 09:42:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyRBrA5ub0D9xiLSTTyD8F4ZQVZbG4+qt8sq5D9lCrfjQaUF2g0CmtNStaGtHg0F16Uqmspg==
X-Received: by 2002:a05:620a:28cd:b0:85a:8ea3:6bc with SMTP id
 af79cd13be357-883530825dfmr2224383885a.76.1760200977643; 
 Sat, 11 Oct 2025 09:42:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088583b94sm2060261e87.120.2025.10.11.09.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 09:42:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marek.vasut@mailbox.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20251011110017.12521-1-marek.vasut@mailbox.org>
References: <20251011110017.12521-1-marek.vasut@mailbox.org>
Subject: Re: [PATCH] drm/bridge: lt9211: Drop check for last nibble of
 version register
Message-Id: <176020097648.1820151.12050934300163392170.b4-ty@oss.qualcomm.com>
Date: Sat, 11 Oct 2025 19:42:56 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX3bu5OBkmFBNa
 D1XqFtYUYT8naNUh13SSavYygMFsI4UFSZ8n4tPW0iJt7ur0C/kXQSTf/mXz+hY/qdD4qlmk1wY
 Qw/6UoAaRVaGe2EqPoV9LbBfH0GQILvoXQvbeo5Vl8roD9tRWgPneh3sooRHycXd/oZcXislYgm
 LAvn4ONqQKHpQI5p5ow3A7/9HqDoZ16om6jrR1fHcIG8+KqMfV9kiw1sr5uy6doee/D4GYdnqau
 FGcWBFUlwfnTEBXhmX9cwyIb0jFbw+WhzmVtBa6jwQhzEMqTqkH84rHhAWaRtXpC1aoSzH5KZYA
 lefr3SL8UzYLY2HuZeD0AjxsQGvmkL+90hpnQF74TsEwxkc+HppdWUBTxB3j1mZMseiCSubyRZs
 n6iew+8yhSMqyOCikwh9Lb743U5NwQ==
X-Proofpoint-GUID: lUAnib4r6U7_TmEbBXdv6OLiMuJvv3J2
X-Proofpoint-ORIG-GUID: lUAnib4r6U7_TmEbBXdv6OLiMuJvv3J2
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ea8913 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=t-dOTaZRNLiD7Fd0zFAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On Sat, 11 Oct 2025 12:59:53 +0200, Marek Vasut wrote:
> There is now a new LT9211 rev. U5, which reports chip ID 0x18 0x01 0xe4 .
> The previous LT9211 reported chip ID 0x18 0x01 0xe3 , which is what the
> driver checks for right now. Since there is a possibility there will be
> yet another revision of the LT9211 in the future, drop the last version
> nibble check to allow all future revisions of the chip to work with this
> driver.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/1] drm/bridge: lt9211: Drop check for last nibble of version register
      commit: db74b04edce1bc86b9a5acc724c7ca06f427ab60

Best regards,
-- 
With best wishes
Dmitry


