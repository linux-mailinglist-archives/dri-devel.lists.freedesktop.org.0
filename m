Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0FA83EB2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0110E84A;
	Thu, 10 Apr 2025 09:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4qt6Arr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DCC10E84A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:30:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75blg018348
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZqtW7bMzYMRTd98Pj3PG0q2g
 Dn33XGbZdcTOcs859xA=; b=U4qt6Arrts/3s5R7WCtPT72fdEBKMGz0cgUJspjF
 yIMtE5/F01t55ETOsLgVxUrPyAn17+4r8EHp3634HwO4WCBRD+mWpiQsZEsfZ0cs
 f/sF1dvg/hYTuhESxL6Okg7UTm896P7eDtlKWNBi2anNT9p4CUeFsoNFsUn3M3C5
 JxuLp9Kki9+dHEHhE8+26uwpYCtAqrAXOL/egYYZ8YtdAMpMKEkMG8Q2ae4RYt7H
 AIzfNzxZTLIFlvtsdO7iCKdrkvUNuBRqeopiuorW5GByHzk9tB6F2Fq96OiBleib
 C1bT+I6nYmPSPTVCsx4D45bGfX/g7D0xq5qQivEQ3sOxSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb6g42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:30:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c09f73873fso98731485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 02:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744277445; x=1744882245;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqtW7bMzYMRTd98Pj3PG0q2gDn33XGbZdcTOcs859xA=;
 b=E7kC73J9OInHcBow6MDUsNjVJiRcQWmvdIYbip4uNDBlLJPdlvcKGLDs+kd5v/3q3P
 LXaAxvRUEYQnxSPl5xezZNMytHyeptu7GhRebBGG+4tenLD6vrJX4e2viRTrAPsEBY3r
 Go1VXfbWM/2Q5KsFwmbUr+kh996N//cBG6OKd3p3MPc0ym5IbQNkJh/wIDTBlHg4fBCy
 +1BfuFGt2fkWmaJRxNGhRJjCgD6Eauiik8Q+O2FceQgzDC0bBrg8lGMQxYIosqVDVOuu
 l4+tec7Hn60wmV0JMvgMZH3z4YuuSUPFUtlWQn7cKc5rtDVmFTYxHnqCxx718tYlkOfW
 Rpiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlboV2s57v+E31cQU23Lt3MPO2C8jggbPt5AagkolQkxslFs1zhBAwZ9Kr9PUVtntn/JuUSTOsu2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/AMZTjpguGLjZKlKeYKcBtWm4ytLdC4TeKfb455Ar5Y1qCxX6
 PEqd3aGCbV+c4d3Cf2KSXCt6KtRx0v9kJDi5rjT6S62lysCbxMdWSrUNpFstlxLPUDQt5FPB3Ti
 whs9PtkFh6uvicK5793aKvTetaEzjelqeCka1asE7JHUxKYOvYaA3kXroFklqMjdarDo=
X-Gm-Gg: ASbGnct0irgi5JlXlPuv8f8gVzG4keFgnzZFfK4hQgmGmOSRZX3GaK5Z3QRS7posEBE
 hFtBSr1ZepJ4DYSSbA3KSpa6cIYX2LpOpCDL82+aqvZJZloCsIND5H5yK/8MpgkC6hmldRBlYGN
 XFE7fSKv+cTeev7BjtTH0KX7k2sIqp0+bqkxj4IuhR2ruXpYso7xqRvon5ITg6GG/dSMN3uOxEo
 8F2BiCBppsjWlJDPFZzSqmNefFK3WjDCo58U+ecf3Ay3etSo57nScQyOXa3qFPdLbDqZKmEy9J5
 tkr5xozdTIufKw9Jxr/xOhOQh1TiQFkFDTsUeH48SHrMXJ+rxoNACebVDIaYS3wZj7+DTsknBO0
 =
X-Received: by 2002:a05:620a:258e:b0:7c5:a230:30ff with SMTP id
 af79cd13be357-7c7a76cf8f5mr251331685a.47.1744277445627; 
 Thu, 10 Apr 2025 02:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVltL3h1Caq1HEBhiLFJIRZ3Hi1sFgkDZeWmfTeKtna2kWsYnZwqyGx+FPDMlvJ3YI1hI9Zw==
X-Received: by 2002:a05:620a:258e:b0:7c5:a230:30ff with SMTP id
 af79cd13be357-7c7a76cf8f5mr251329485a.47.1744277445295; 
 Thu, 10 Apr 2025 02:30:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d23880dsm91875e87.79.2025.04.10.02.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 02:30:44 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:30:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: anx7625: Use devm_pm_runtime_enable()
Message-ID: <wdxowk32hratizv6xr3gqa5nab2zprgtfua2rpyupr7frd7ojh@3q7crhry46wt>
References: <20250409093814.3977025-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409093814.3977025-1-wenst@chromium.org>
X-Proofpoint-GUID: QiWXx0leXtDe7sqNk_SUJRqi0_oneKO9
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f78fc6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Kv9FL6QeMsydgTWXVFcA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: QiWXx0leXtDe7sqNk_SUJRqi0_oneKO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=756 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100071
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

On Wed, Apr 09, 2025 at 05:38:13PM +0800, Chen-Yu Tsai wrote:
> The anx7625 driver is open coding what devm_pm_runtime_enable() does.
> 
> Switch to the common helper instead.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
