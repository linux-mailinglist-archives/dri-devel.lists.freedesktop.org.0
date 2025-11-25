Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42771C83812
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC6C10E16E;
	Tue, 25 Nov 2025 06:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oiCWSWb8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+VtxBxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6110E296
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:37:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gkd92148816
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=; b=oiCWSWb8VF2dOwPO
 mR1QLGw3v/dqeQ3Dl+rEGA7UD/jL1l9LVyR/HRPsGmFz1e6vC4rK/rfcW3JsInQx
 ZIo0BndnpiWoQcZbRRxtxQKk2dkrq7Y+KKn5a/Y1MHUmodi96/lcdrp7D1Jh49q7
 cfAqpKadKK99k2siT4fvSftV/4Kn9WTTz2ZJ+OmrboKa3bl4ApQT6VX0k4prDUx2
 0UBQByU0Wj7ZfOGON0CGa4h9/jbewy1P0pC70Yig//u649OyzQmRbjb4GB8cOZd3
 8cdQ7bDX43BpoeBZOH/xXvF+DK/p8c1v1AL8omMTQL+Q9cw2G65X+Z3XaPd0J2Za
 ag1ugQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8samhv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:37:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so130993491cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764052677; x=1764657477;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=;
 b=A+VtxBxcX8/iH/pvAf0SAfY+nn3T3gC1GW4YiMBR7lmxc48655AUsUGo4UVhBS7B85
 ReRG/ASy1qYn4PV0JXFVTvo28oG8LgoMbgkEAbNqhZBVT7W3OM6pbY1E+5YCUeQckJQI
 +omTn1eV29QxPMDXu4W8QfpYw1WUVBoRnSOXQeFLsjlooZYuvPBNtqo8ANs4dkznF/Uq
 wiqveBQEamJaCyGV6SNpao3P1HI/Qq/QA8Yhkw3VbO4753Z4XExrcTK25wbXJuaRd7kN
 8Ydigvb80ucdHV6a4jdIWHMDEaLXAyGAP8UYlV+2CFLtYb4csW/Qp2uEdLgK1pc9bs+Q
 tthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764052677; x=1764657477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=;
 b=VClR/B0S+aR5L8F+RxALgE8AjtZ2JrGZp71ux7tEQmbgvdU8nvk//JkqaYGl9pWc82
 OP+TE00dxYOSXYm78z/YK8U+oUzmjhsgK1QJ6gy0Ltsk+bezIAXME8HAaQeFDkkePQX0
 Pb57/cM7SnumFgF4CwwziBB0/5s4byucs3Q+ybLpVBKlJGio+gwrmZI21iR6JWdi8bek
 ZyzcZUPjgyqVZLi5L9wrDLJhnyUOd+D1WMLLEUdjg8slClS3pW7aa5GJnTLDxr4mqrOC
 jEa7eif1eAyXLYEnsXPBiZ1weClAxVo5lro6xNKdPxad/nVmFIW9UtYW+RIiEuRz0obh
 m+ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqH1Hi+C9FW4AE9poez7P1ov+bOXb1qUEdv07FR9aWmfcQTv2+FNWskLTkRxDECV5XPxCbZg4E2Eo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz5GyKGcNhBWwCj5N/JmNWATfLD0wSDm44wDDVZpwuHK9+6qmY
 e3Jb2f5qT4xvARzwk2mXqSgKkfbjbtx8pQgiDDwjE2Q1et6nG+DsHZKMKHgkAVWYJSj5t/W358D
 jtsoPruloE+IVeYS0nnYM0fJo5Hn5JcQLErUoHcalOR8CZm0gHNeyHCUkLJ/6FWS+6/ruCCQ=
X-Gm-Gg: ASbGncv50lUNws5FCVeTPcmtK4GJCYBno0f7MCOVilhASk4dHQfyq53IyVWM60+MO1N
 bXgDRteQe88F9c0HyuwStGRJfDWLZ5XJT6uqXNadryjvCqV6F0KbP+bN7VR0yWD8OeDi/E2bX/2
 6nmG3xb6/b2BCv4WMr1q7TGJXVIHMUbb6nVQLOuZbXpjeSPaVn6b3tB3eZ3ZklZ6zCpcOSSvlZ+
 NK8xPTinPkXL3GdlguYZmest73pv+hurkowWK5APyFPNQuJ4s2I/jM61QDbgc6tHviOoxeqdLTB
 l2dsJqpP2LAQSH+IB1LMtytUqA8hzWrGUYSENfcFBNmX2NEvxRS+G8cgFOy1KGnmwxXFfsSBCfJ
 sqErzr/KeC6P6yR8l9dXYMxg2le4N8fOz2Q==
X-Received: by 2002:a05:622a:148c:b0:4ed:67bc:50de with SMTP id
 d75a77b69052e-4ee5885402bmr185785601cf.24.1764052677008; 
 Mon, 24 Nov 2025 22:37:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3IEAKR3Cy+9eYJq5upmyvN0y0HD6s2YnTjLvISf6qEEcoow8UYxypFBvz2esF8/bKVX5elg==
X-Received: by 2002:a05:622a:148c:b0:4ed:67bc:50de with SMTP id
 d75a77b69052e-4ee5885402bmr185785451cf.24.1764052676589; 
 Mon, 24 Nov 2025 22:37:56 -0800 (PST)
Received: from [10.64.68.30] ([114.94.8.21]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48b45ccesm100522231cf.0.2025.11.24.22.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:37:56 -0800 (PST)
Message-ID: <e6aff9d8-a6ae-497f-8c8c-91d60959eadc@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 14:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g6hDaRroJ9uorB3MGGOoichIOHDrYE1y
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69254ec5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UzQ1Ta3AV69qgWW9qvUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfX1RCCVgcRoQ6y
 Jqn/9Ye/tuWYERkTEbaw0K/Tx3HJXUFAntaGQYlIAMnxpb65zq1GPBXL4NwH4jk9sqI5/ZwNgyJ
 ziFy3LmcstNzlzbxzgsi2VYKdNWIsuoOvZHlZlxZ8SFwGbQkFe1LjVgy1tsYZZotdjk6/+SNyAM
 wbHgExXNt2boW3Ed0qP79VbYiZdLZlzZE3W3jZnuqV2jbnbfR6YDj5BTfVIrHypcRwwxAoNXVDm
 Wz0xGYyjxEZDO4nlDZ/bu6ej/h9GVtP698gk89o9ZpZAsEVoZ0wvCbQ3cFXFY3lTvadBtU/XgA7
 afORgm3jIdZSLuUgbzOVTgfue4cu6csnF/dgd9x4Df7PGngGMyLf5GYxud84p2Yqc2TZdQRCknv
 nAcJ4KITBeE6+4trxPeJb4IqKVn9Ug==
X-Proofpoint-GUID: g6hDaRroJ9uorB3MGGOoichIOHDrYE1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053
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



On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>> state management complexity. This change removes the drm_edid member from
> 
> Please see Documentation/process/submitting-patches.rst on how to write
> commit messages. Please use imperative language instead of describing
> the changes.
> 
> THe patch LGTM.
> 
How about this:
"The cached drm_edid seems unnecessary here. Use the drm_edid pointer
directly in the plug stage instead of caching it. Remove the cached
drm_edid and the corresponding oneliner to simplify the code."

>> the panel structure and refactors related functions to use locally read
>> EDID data instead.
>>
>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>> - Cleans up unused drm_edid_free() calls
>>
>> This simplifies EDID handling and avoids stale data issues.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>   3 files changed, 26 insertions(+), 58 deletions(-)
>>
> 


