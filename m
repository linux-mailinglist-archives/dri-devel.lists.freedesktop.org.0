Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080CEA6CF0D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 12:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE4B10E168;
	Sun, 23 Mar 2025 11:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AiWfrKb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3AF10E168
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 11:56:15 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N9i32H031953
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 11:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nKaIoOJgUOqFHM43prnMCY7L
 31hLWRx+UXYn0c9TanU=; b=AiWfrKb67DejDlG79c1n4r1AVhY7UzOcTsJtcOJ3
 l2E6gL+05oMxmn5ghCEqrr282z0y8ksHhsDSmA3EEPx1nV0CEXXO8II8nHnKMjvW
 GYR9HBUSUuDc/FoTPF0xfTzjIge+smpKQ1lXIi/hUWUcSbicb6aAzbRZALgzE2yK
 d8+JQBAnOpoiBTmH5IKGRtKxHJQ7rAXhrOSCfpPT0oQlzj4B/kCw5eKh+d9I5fts
 PCbY4xFcc0y68Dkkyazts+0wM7CpgyArhpoLuJ1Po42bP1Q/UjOZsjEPlt3u9y0H
 iHfyzCLk8sElh7B4lDnkcoP4X+PQqEHORkKFOVzeLcpcng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnyj9w4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 11:56:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eb1e240eddso59500086d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 04:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742730974; x=1743335774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nKaIoOJgUOqFHM43prnMCY7L31hLWRx+UXYn0c9TanU=;
 b=bYUbSpOIc8VTQLwtwhdqPXcFrrTmuI3/2Pf4N7847hBbG0M+MAJ1xWW8AoMu2dFqJW
 Pe9fyjc2zdIoSq/Fb7du6zWbbkyTA6QkkFgIm0yNFL88YvmrRr61rAxm0LgCd8zGK7+P
 esK/xPfoxUqinAPclyXwiSHzGrF3joYSSIWNGcl/hT2Bry60tc2nhfnpXiUYdhaTM/vM
 HiZPiyrvX6w7ZSzZIDSZWlo0mOP4aOVXspkRiO76y43NfQBcZtmj7HuZ9VqZuN0EyodU
 /p6c1REMVXjMuZs0TAfBVNxyT/HOgNzPAhnT+qA3RidwMuAI/jm7j6FBC+EPAvMPLccw
 zC8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3wTK6RV5XuEyw74kmH8llXItDk9vUVQ+1n/7rfk+NlrBDA8hyihsBa/hUP2hFVOy++SkK08sao2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXaNdOJiqVGUkOe6hJk333HcTB1+jzEGUEf5i0j6Ya3X6aHAB0
 QU4KN8aq7fnTUlO2lRaawZF6Q3hRmIBNd58kjm2x8Zwhg3miUWzME4zFgWPopU7xw0Ubu4mgxNd
 S7uj5Of1HQnIbAmEgYXCpa2U/dXL9y5cn8yTNfhM3qaWgoxEINjqnKZWNNCQvrizTPVM=
X-Gm-Gg: ASbGncu6QCySIGkfRccE/+3cM49tvB/NU/YgjFZ/a7+v4UMDDWMwf+0tep9EGOTyDN+
 mb/yN0zRWlMdNMupzHNVVlOnxHECUWT1XhE37K4ApPcK7Vt0fZAmcrxpKzyVnASlhksmu/Nr0WZ
 ZYKKBD48GHV/BMnMPYQXV/toKm2aGsx+b4i6XoAUz4pVMiISOXnwZm153pkgMhNj4ucKg/6UdD1
 /paLDjYPpWqb1xZfqbyvE5AiC+2STz7pRH52pewKBL4xULSI80gG8k4w8R8eWG3NJbmldlEOqx/
 TpyfepNZVTdPewcGxXNX/s150t9Xi7KwK0AMLcZ+8ReoqdQ3uk45eW2ifDFhmEOa47IlGusKMQC
 GYMM=
X-Received: by 2002:a05:6214:2245:b0:6e6:65a6:79a4 with SMTP id
 6a1803df08f44-6eb3f36a59dmr173614116d6.44.1742730974012; 
 Sun, 23 Mar 2025 04:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAAiKi3aiC5wUmJTjj3X1TJwxYZnFKUNEvU/LzEMV0zcnUdHAGkgX2ulK6zhWQkYHOe3qQ/Q==
X-Received: by 2002:a05:6214:2245:b0:6e6:65a6:79a4 with SMTP id
 6a1803df08f44-6eb3f36a59dmr173613826d6.44.1742730973595; 
 Sun, 23 Mar 2025 04:56:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad646d2a5sm747971e87.52.2025.03.23.04.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 04:56:11 -0700 (PDT)
Date: Sun, 23 Mar 2025 13:56:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, megi@xff.cz, javierm@redhat.com,
 quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com
Subject: Re: [PATCH] drm/panel: himax-hx8394: transition to mipi_dsi wrapped
 functions
Message-ID: <xflxj7nn5fs3d25fdhatnxnem24eixjppbj54xbokisipjscr2@ogdvnmgwn23g>
References: <20250323053007.681346-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323053007.681346-1-tejasvipin76@gmail.com>
X-Authority-Analysis: v=2.4 cv=Ybu95xRf c=1 sm=1 tr=0 ts=67dff6df cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Ut_GpTIo2zxuSFPkNb0A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: g115rz6ywsm9BO4KpqscrpHf4HhQi4ub
X-Proofpoint-ORIG-GUID: g115rz6ywsm9BO4KpqscrpHf4HhQi4ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=809 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230089
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

On Sun, Mar 23, 2025 at 11:00:07AM +0530, Tejas Vipin wrote:
> Changes the himax-hx8394 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx8394.c | 444 ++++++++++-----------
>  1 file changed, 210 insertions(+), 234 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
