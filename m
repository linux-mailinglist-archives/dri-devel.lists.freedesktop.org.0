Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9133B05986
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094B810E5A1;
	Tue, 15 Jul 2025 12:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMKctzsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E110E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:02:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5w83Q028256
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UyvvQBMgtajbfKdGdnnoGUgR
 +QFHhmOiew9p+7Bprro=; b=KMKctzsZHgfBy/hGall1wlDYbSjiIYkpbOvYiRTg
 00VsLDU+nvAHFg0qvF1CJkKOta8QR0QYEHcVklkMGv7gCohSn8vnZ+plbUuTPZ7l
 ch/plH44WYR4DyFY7Ouah2MCmSDVSoiFvlJEpmiLRMZV6q5VF5wLy3bwilOWPbSd
 ELqOTNV7AX2xfD+JC3i4PKEB0vq07Tp5u6+5X0l6CtHW4YxIcWCKFJVkm+3PMEtf
 aIl2FqElNjAjjkiDf8XtST/iUc2eIrLCTVrgCnlu+XGri5I6ef1nyEAqVbgU3ezL
 5WwaZz9/H5MRgcB/MNvQeuniDNf6iWE9zaDg7I9xAekEiA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drjxgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:02:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-73e47c3b5acso81504a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 05:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752580970; x=1753185770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyvvQBMgtajbfKdGdnnoGUgR+QFHhmOiew9p+7Bprro=;
 b=uBOh+so+FRpsSAHfD/i6kKGwQYSCfH8xFbbslx3jBV8omAcRiauEcLWWru++oJLks3
 QmD/kiHReV7E44wCTsCpZi9LQttC4d5dDlHBJKEhX9me/1PetXNspz+i8a5dDdkVIHpb
 v8byXz48gj7gB5NxCIm9nCD8BEoleMKqzN87BH3tzhYBM6d+yzHWtGVskINT87XOZ5zA
 /wcEjYEg4MPch1k0sI+/2KjXXFLXzuHCRylohEz2jhCeVIHebHNfHcaEBPJoum5897fc
 rfBemL6XtjZIEc8pQWtbyMf9LE2otdnz2x/FghnjPZ3KMSeva6SwGJRGHngh6vJT1P+f
 yfOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC65+hj8qO7Sakglus3qnLsJYt7GB+DYeOUVOXid/AOWxJUam/13e8reagoIY8WIvr21RKgmWz5lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy37OZRaLiveshqn8dqsb52iuZ6Wur+rbZz+5mv/nFcDxzHSTt3
 WtkBmU9Tj6l9iss0w73PY66lPu5mJMAVZk2R3bGjtCSL5mteRbyxHpZWy4VzSzLYWbA5x5QMWyQ
 i7rO55Chtlu6rC8DdI4T3m6byLCMsNIitLuF327cWO49mmk8aInocembahR1Wo5PJIRyQIQo=
X-Gm-Gg: ASbGnctlfcKz9b/8fgPLg8T041m8S214lFcOd8HAd0HMdWIbydC2ZA1gg5XDuIuQcVr
 FO3FCGgXkB8d+5aKFNmm5q9sEJgVsB7M9QrScaxJK1+yladQ/bC5/qfV6TTzFA1a8xKFhf+f5Yf
 peeaHmYlEmctZM3I2yJxdWUWfk296QVcZ/NqdaKw+tK6RB3Brku+LXfS4Y+TT/sGQmXeORUowJg
 sHV1mH9aAx1uIwyU6NIsXibfuWh+VOX1h0isJ713aiF/sNynrdxbdJAzFej5bzkcbl8kXu4hb1p
 wr5oCkdqiIJq/RG8zw1SHnUjs4rpwPs0FbiT1PuLbD+VamDfxbiRZy1ew9WaUmk4dGVwq/2y6to
 poxablc9lMjZBihcDsnojEKRZiDuon56f+REQbgjJl4UIED7aHijB
X-Received: by 2002:a05:6830:3692:b0:73a:99db:aa30 with SMTP id
 46e09a7af769-73cf9df0d64mr11073236a34.11.1752580970546; 
 Tue, 15 Jul 2025 05:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRldZmaGruwEtV93mfPK7DeHfUeVU3CqYU97eA4DGqB+RrTOx1wiarAqLcagJKllyUevLfNQ==
X-Received: by 2002:a05:6830:3692:b0:73a:99db:aa30 with SMTP id
 46e09a7af769-73cf9df0d64mr11073201a34.11.1752580970169; 
 Tue, 15 Jul 2025 05:02:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fab9117fbsm18753031fa.98.2025.07.15.05.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 05:02:49 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:02:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: simona@ffwll.ch, andrzej.hajda@intel.com, airlied@gmail.com,
 ian.ray@ge.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 martyn.welch@collabora.co.uk, mripard@kernel.org,
 neil.armstrong@linaro.org, peter.senna@gmail.com, rfoss@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dixit Ashutosh <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Fix a
 compile error due to bridge->detect parameter changes
Message-ID: <nrtzmsohsvdux5wsd5g76f27ironu3nnc2s74soo43zl3tvu5t@bald3bp5mldc>
References: <20250715054754.800765-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715054754.800765-1-andyshrk@163.com>
X-Proofpoint-ORIG-GUID: rzLSGFx7dn2WlELpJAVsBQu9s6m9FeIk
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6876436b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=Byx-y9mGAAAA:8 a=8aKB3WWJpCxwycPcSpwA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: rzLSGFx7dn2WlELpJAVsBQu9s6m9FeIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMCBTYWx0ZWRfX5ZRjtOGPwWS0
 OKWwieIyv3Y9n9qunl01PKczI356eonmxXRn2wfVEPJ+H0X9Gd8nZsI1VS6MjJ8dyuvOeuLU0X2
 HSTJozV/R34f73ebWEk86pzw6CzZQyDsJfeM8zTXdJeu1otmiaY1/JlAR69FnxX3axnCHaMMsm3
 0MsPmbQDWgOP3Fz2mb92DyvrcnAX3sapU6utCrkMREA2tTMFFgUh2rBSnzky3r/APVrlzosYXpy
 dwGfdBSzORb+9W3m4d5HxfmV2lsOBaKJ4AYojggqt5XCfT3xdRTJ806DMDXS4xodYXVcsG59BWH
 J0X3cM9RWHEODWgv+V4pKIXYgqqT+QlaAPGusCxbUB56Yg9OVqC1Z4RE6lsLyXPHro3FrPqvRdx
 UCHgMrsIGCaBJJqsq6W4q2JpIiOeb2183VXcy6tVjwWV4BwBih77/hhVik8L40XuMCHC3Ecr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=803 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150110
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

On Tue, Jul 15, 2025 at 01:47:52PM +0800, Andy Yan wrote:
> Fix the compile error due to bridge->detect parameter changes.
> 
> Reported-by: Dixit Ashutosh <ashutosh.dixit@intel.com>
> Closes: https://lore.kernel.org/dri-devel/175250667117.3567548.8371527247937906463.b4-ty@oss.qualcomm.com/T/#m8ecd00a05a330bc9c76f11c981daafcb30a7c2e0
> Fixes: 5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
> Signed-off-by: Andy Yan <andyshrk@163.com>
> ---
> 
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
