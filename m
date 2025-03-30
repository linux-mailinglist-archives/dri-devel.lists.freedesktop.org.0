Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D9BA75B9A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6BE10E33B;
	Sun, 30 Mar 2025 17:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKeMWYdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A9E10E33B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:57:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDZmFL024341
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K48pr407NmdXjNjoX6mg329x
 m7rtHyYJTjFsde4INrw=; b=YKeMWYdB5WiByHomr3HUqLzPb0mauf8fzjxrgIas
 AgZ5rhq+gm0EyGwUlqiFWHV45RKMGb4i3VJsjOon6LzmluL+y9YUGjO0xw7PpjBM
 b81X7FpA2TDHsoQcF9lqx0ZTAX23dprZYYcKs9Lz7GT1JIsk8NsAqrE7lmTd2Ofg
 N5JJ3wgpljpARCwWhPD8BF9Myum1HzZyve3AioF9cDpP9w47hZvJYgwX9SixJRFD
 R9U3MGBwKJm+Lx3/wLbHQRkOMkuOhRN0GaEMkxpYa7ZxbcJs32ZAnM7XDdN0n2mB
 r4Mq9/HwCOlwdewUgLWC6byskwKFFSVmLllxIMRIztaPng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9892juf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:57:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso58286246d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743357441; x=1743962241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K48pr407NmdXjNjoX6mg329xm7rtHyYJTjFsde4INrw=;
 b=VoYION59YMSPrcJAk/ky3K16uouQYcOOjcNI1+YknJiDFbRQxZv0OZouN4eZMRRwOQ
 9se64VLZp8QSmmswpxKr5SN2WjlTrLjq9fL5oE7yRnPTWmUAiTWDddyJxcyiX4qYCwm0
 C3S7ItZ0S6pfqg7IH4LpMEUn0g7DSWlKa+MDvWW7NysKD/xvCJG41/DgxBy8BVnFfOiz
 AJu3voHNtW2//wf+xjkm9HfrZ1jcIfomyXGWI2WBxBU1TfB3wELxGs6hz134iF6huNst
 EXAgVpDvsi2kYPaQfJf0HvlPNswhQQAbQSvcoQ3OBnMZwrl8lcPcnYf5zi/zI+Aunqfy
 igIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/mf+ZQuzsbi2yjWF/mHa1l7z4faVapHJ4aGwTHmU6Iq4kHKF6e8c+1BsizGMyCmCHlahbBWOVoj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCV4rhH4piVE+dA0Apnc2TNe1xhmXj1f+irOPPk398FZUV4aUl
 B1dUDDv8IWWxFnypk68d6s5PeJ1kjwOB4urxUQMnIODQroeSRQPj8XjwpVRZWgI+uSyUsqeNlQb
 /m9XlNNAzrFW5QWBWZBUrsP66bmk3gb/J3hNWzdhRwtxVgdIagMK1GaA++FT9UUzJqYs=
X-Gm-Gg: ASbGncsDquRvUkQL5Of0HEwsUUtvhp0BThovM9c8pI3TUWRT8g7vRKeLa4H6y6NFja9
 ip4VVanUNNF2RnyoyAuHAApOhaC40wQyoutFRkpV0O0Jm7YjHGD+J20+tBFIUYmYOEPXYP20BqI
 JmbrXTMxlmLg/fAQfsbwmmvYIxmUIy818/BZOjkNjbcvlqdHCBXrBdafB34ZKSA/6T7Cu4YIlnC
 FLh8DQ3/8xsKkdeAcPiIR+to389yvnU//BT0X3OmhVPT/+jjs09R3IMzPL7/aopyt7OLW0yCTGp
 d3QX91+F/1uIEBvFB5N0eAfMrCdMcsYBCOhdK7dXGY8DdpHX7P3QmfGoT19W1EJBER9yGHIamFP
 IsJ0=
X-Received: by 2002:a05:6214:d47:b0:6e8:f464:c9a0 with SMTP id
 6a1803df08f44-6eed5fd86a1mr108549416d6.13.1743357440631; 
 Sun, 30 Mar 2025 10:57:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVvlmwx6EzG97d8Z/5FF9ujKK/PzZ2pMWAIcuSk6n/X4l9c0W6BiEXwN6oDfaMUgX+SiJCTQ==
X-Received: by 2002:a05:6214:d47:b0:6e8:f464:c9a0 with SMTP id
 6a1803df08f44-6eed5fd86a1mr108549096d6.13.1743357440340; 
 Sun, 30 Mar 2025 10:57:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b4c7a4sm11820341fa.71.2025.03.30.10.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:57:18 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/bridge: sii902x: Set bridge type
Message-ID: <aectka7gnuydp6rvr3gz5ivx2bz3dpkuuatzwryewng5b7nflf@cpvtiddfrzz5>
References: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e98601 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=-avToEXnEOD4PdG-UZUA:9
 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: _uLes2GhJ6xiSNAbDKJ630gpkv_JvH5b
X-Proofpoint-ORIG-GUID: _uLes2GhJ6xiSNAbDKJ630gpkv_JvH5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=990 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300125
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

On Wed, Mar 26, 2025 at 11:11:23AM +0100, Alexander Stein wrote:
> This is a RGB to HDMI bridge, so set the bridge type accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
