Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7833A90F33
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3072B10E9E2;
	Wed, 16 Apr 2025 23:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJoIoySF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F35E10E9E2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GN2L5I026233
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 98niqdlXLK9J+3bRG9oA4bu8nQ0nZNhuz/jgIqf5jH8=; b=gJoIoySFnGjo7i2b
 7sd60WduwzJ6/N6ONq3aMlXMFfxjlJ9gHnNZImNWA2QmaHHzEKeHxtWHFk5xfoek
 fud5nae1xxnCQyr6LWwrawoR/gOSovQ3gxlJ0P5LNRpPpbKRVe+eN8xnSGxH8LVl
 rHBDsZ+xs74EN7CQVMzN42Tf4pyyIP17kaBIakFkBE3P+vN134oUi+34QIW4tIGl
 qX5Ge4N59CLcEcPbIVkxMsY0cB/o8V/jrMZmQZA6xITMlaQmQeegvGQVzabGYxPl
 tmpfceqMJBi0mPjwJUZIhh2GOvD/nke116OCXp9UOXoSXK7BaD5Ni+y5RfrLEtaT
 Usy2DA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1cxe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8feea216aso20448596d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845079; x=1745449879;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98niqdlXLK9J+3bRG9oA4bu8nQ0nZNhuz/jgIqf5jH8=;
 b=W33FqFY+4hazjTC/ITjjgHUxIUwqtQ1w7fy9XPu5WnxFPk+idqXra/GKyAjBOYRJd1
 lV1y2fHQ9Gay1wYlDr2RipdgnQZCM5CV06qY591j08eX5hfCf8XRL79bpd3Jvntg2YYe
 tdPFMi/ao7nSGCzTlGcTQmq8dPYo1Q0GbSN/nH4FzYANbpnaibDtC1uG/Vh5rLeFmgaD
 4FJGwa6V5xmA6ant1r5Ar4OZMeS3818JJFN5II1DH0mZP3VnTr1gg0JqWWfTF6J+J3QN
 OSDlqoTFs0tLvgN5ZiFiTbzIc3tEYQg252ecntbRrSSaiAbHmpab/YY92jTATKvCSl++
 ggnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7QsB8K5Op3HtgEmtrjnuE8ZVlqWcufdq43zo+8R/ZezbiJKFqNzLRn4RKizC/00Cu/kAfFyY4B2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSu1hLqkzJN77sPKygAgkFdrsN3+k4JyZRgbc8kRvCK67Oha2w
 TbJ5Fv4Cl3TS6DqmkZTzo1pZc54elySn630afpmsQPI7ABbjKORJZhSgjbkDC05c5mzKnZvozTu
 BdgFwJ6BgcsRhlTXTujTpu2p4YcRK/3RGf+Valwkil/qqmw/L9KjoZafCr8lORm/VStM=
X-Gm-Gg: ASbGnctmNpaDzaY/Wl+EDU6A6UMqUF91b+R2lqlXIf2B9EURDfitZU/S/3zuJthMxoD
 RJ2sPgO+dHCp+/duXsT6vvCe3JM38fGvXHDG/qmZqgY1uxDMCLO19/CmrM6yKIw/Jq3vZPGzeoG
 2un2dPva+KklyzfIHpKa8gM81TuhlUSwWptK2P4ZYbeIxofM3BE8QZlU9bF5wa4o9WBepgzaPFx
 E6zHcuYTEPaVzIxWj729eZkx+5Nepe9N3eBtas5LRKk6xL4p2Y7p2gRD9DH9/+7fOH6AhVECP8o
 3lsq+maEwJKEJ2t3kyQ1b08ggQGPG7TPlzXN9+pBRiL85/aTKcV9i1A755nwj88uP+/k2l36bWM
 =
X-Received: by 2002:ad4:5d61:0:b0:6e4:5a38:dd0f with SMTP id
 6a1803df08f44-6f2ba6368cdmr14108996d6.4.1744845079520; 
 Wed, 16 Apr 2025 16:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5OXDnohbl8oeAzsRqeqnMfuWC8/Rpk1ZK4IPEy4zY5pYR3a7jLV2D9p0jr1tIe8cERst8zw==
X-Received: by 2002:ad4:5d61:0:b0:6e4:5a38:dd0f with SMTP id
 6a1803df08f44-6f2ba6368cdmr14108726d6.4.1744845079206; 
 Wed, 16 Apr 2025 16:11:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbbb0sm25320081fa.30.2025.04.16.16.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:11:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: lumag@kernel.org, Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 dianders@chromium.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 heiko@sntech.de, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250411115941.318558-1-andyshrk@163.com>
References: <20250411115941.318558-1-andyshrk@163.com>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Avoid including uapi headers
Message-Id: <174484507750.205743.4528979929062374879.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:11:17 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=68003918 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=3vWo_mccuV0xSmgm2PwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: xhSa0CS5_FQdpKaX9sAU1r9fzKxrMaH2
X-Proofpoint-ORIG-GUID: xhSa0CS5_FQdpKaX9sAU1r9fzKxrMaH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=850 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

On Fri, 11 Apr 2025 19:59:37 +0800, Andy Yan wrote:
> It is not recommended for drivers to include UAPI header
> directly.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: dw-hdmi: Avoid including uapi headers
      commit: 4890d68db651562ea80250f2c93205a5c0327a6a

Best regards,
-- 
With best wishes
Dmitry


