Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83EB183B5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECFA10E887;
	Fri,  1 Aug 2025 14:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mv0TcpOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D4810E887
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:26:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571CLDLw001180
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 14:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EzvS1jMX5x8+R7F+NrDMwwT/fTPAvaYvo4kcmEWAh8w=; b=Mv0TcpOlW2B6528l
 q1fFdZ1HJ+9on7dRfi5X4/XNaFJsntPIpJbuj0G2513OWO2znFSjc+t6b7uC9o+1
 VgWUXg9WvZZN5zxQjlg0gTcchFScz8cc50Dt+K6fXBUL1DWQe8SaQzTWZTus0YGi
 R1qWeSYfHYHAirPrNlyE6VVp6RxqURJjpo+oKRp/rQI96e9dbpAuX212NleLRLP5
 KXuCWlVaCRpuW7bOfFIIHcqS23A7Ustp4WgBL7ut775P+EUW7F2W4DKjVJkigvXW
 OJMvoAuo1MT8bBv4Kw507RcOT9yjfguAMhUasvajj88LiKLnUvZGs+PziHVdqQCW
 1r5ToA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrraqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 14:26:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-4fc078d2103so2458155137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 07:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754058372; x=1754663172;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EzvS1jMX5x8+R7F+NrDMwwT/fTPAvaYvo4kcmEWAh8w=;
 b=FL2QxQZBcQvJ3vL6OxkLRkiVeYSbtx7O8ys6NMLwf60DHJZ9znvukjnuIpMKt/e100
 p4MhvPxXT1Tpsft/QgiIZgKNjULyS/U9Xh/LeBIBsTkxY2tdfOuh4uxIYmK0ZoAKecMo
 LypizWve/l+1rQakkHN/TkTGTHRnXe5cTGFYX90J4ZTVNAfFaLlE+Nxc/zQPAbDosFH5
 lN/Ig5lYJfdgph0fhP5fODZQ4OEhVAOotCL1mlQOwVsRmlXvj734kQaOzcUpZZEIc1QY
 Yv7sjwdy2gaIWdlaWWEyf+KIxvLLcQN7BWk86qA8901UNYMnN7rekGehs40y2iIYiR0L
 qm8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5mfuRuKEWabB30a5aHXOwxp+v+FirpSdYWMl8noln3PFrcmm/pi7rGVvEz+gQQNqcdjl/0rEu/qY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyha4tbbMYO5SfN8jnX9q2YU6fG20v7lqDz8JYyCbFpa/Heszj9
 p6eDQN19d4hewQNrhtymmYYhNWigVQ1K0bnMs88p+0DrEz8DpXNshTBkaGF5meKZJzkmHUzjlpt
 F4QU9gj5ePxkGi9vw14FW1PJ3ItGsHKl+qmV+Y2nsTvdDBIy5QEDT0goKCDvyVWIdauCcwJw=
X-Gm-Gg: ASbGncs7c/kxsAdeUl/HD84H362z92Uh566K60drzhoYuMGPae1guhMj3WsI4b8AN6H
 7Mj+VvxrALylRZUBJ/mP+y1Vvwub0zi0kSmIhpa0rGja6UnDo+YJ+NNHezUOJ6H1GejzqtF1pEu
 1NBjIkasJ9vAn8rPfvTrjDpMf+Ct340MN4YfDLgSt6w1L9yWeVlFtSAlME/0IsL1XvRNdFl0CEA
 21WLy15nIJPv+MrfSXpBQcdC5/vQEWlitYgEPNyB4YSNdLv288/2pRxB7BHeWcgalbQebvvEvyB
 4VhwzLuqleQw3L/ZAbdkJgUTB4U2iH2DevsSUIAoNGCLtHYvK8tVjoy25j+aja+9lsGQO52iLBc
 sYoMGmtzhdnHNlKTYNauxIQmibThbm3P5ZgOKYdniMOozQNW0014+foUfbxcnmo8uqnqlymc3yc
 3GeIE94pOq7wLOskX3IH3nwg==
X-Received: by 2002:a05:6102:3ca3:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-4fbe7eede93mr8246371137.5.1754058372003; 
 Fri, 01 Aug 2025 07:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtV8DSsj9RYUgiFZC2c162wgAzqi/wUqPBz85jhmoN0PI6WRYnMuJqyzF2EbQRO88PjZQP5g==
X-Received: by 2002:a05:6102:3ca3:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-4fbe7eede93mr8246299137.5.1754058371520; 
 Fri, 01 Aug 2025 07:26:11 -0700 (PDT)
Received: from ?IPV6:2001:14bb:11f:12ba:7035:8684:db73:a472?
 (2001-14bb-11f-12ba-7035-8684-db73-a472.rev.dnainternet.fi.
 [2001:14bb:11f:12ba:7035:8684:db73:a472])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238272f35sm6403761fa.3.2025.08.01.07.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 07:26:10 -0700 (PDT)
Message-ID: <7ea6294d-1958-4586-975b-beb3e5114a4b@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 17:26:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
 <b92e89d2-5bd8-4228-872e-6e5ae9b4b054@bootlin.com>
 <DM3PPF208195D8D03E1F9D3E7EB4D07C1D6E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <DM3PPF208195D8D03E1F9D3E7EB4D07C1D6E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688cce85 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=CdbOqKgfPjM6tkZZvDYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: lgiZw5igPDqq6V2mBsKLae_u7TAwRRad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwOSBTYWx0ZWRfX+sX4Hofv2JiF
 oxd+9yQvKEVrVGsPtpL6fLdgiKSf7CY7s4kC+ps7UVTf0GmCxlt+Q9QOmjxcCLERqTg+78P68ys
 vEFUgDOPO6EjvEY7BID3o82nKQDnl/ln4hwvsiGKAxKvAlMJrIb3DeP1wbnzmz+xXOAZ62Le/sC
 TrJWta/Xe724N0dc/yHrXdgNnQKB+iz5U8J2CZEYoiw/uazUPQ0i/vs6els/5ZdbkcSc2kosERS
 boh+ZrucfJRRWNP9LTkTgH/+hQrraFU450sdWGvOSn6CAbukjmdBxCeBz9/alf29zPWcmpkRtND
 WOMWCsKPTPRN5JciXLTRmuObHKZa8AIgT9bCGY9JQiU5U1hEiTw/46gFfc1mCCcQMVOCijqNYja
 iAWjIcGzITqAdXtIxk8RmdhWy2bS9JCnLZlApMqwV2EiUiF3jEuPR3AIs+MrOqGV6jHrymES
X-Proofpoint-ORIG-GUID: lgiZw5igPDqq6V2mBsKLae_u7TAwRRad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010109
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

On 01/08/2025 17:22, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH 7/8] drm: writeback: drop excess connector initialization
>> functions
> 
> This should be drm/writeback

No:

$ git log --oneline --no-merges next/master 
drivers/gpu/drm/drm_writeback.c
fb721b2c35b1 drm: writeback: Fix drm_writeback_connector_cleanup signature
09cba36cc840 drm: Include <linux/export.h>
ddd147d91d50 drm: writeback: Fix kernel doc name
ff3881cc6a58 drm: writeback: Fix use after free in 
drm_writeback_connector_cleanup()
1914ba2b91ea drm: writeback: Create drmm variants for 
drm_writeback_connector initialization
2f3f4a73631b drm: writeback: Add missing cleanup in case of 
initialization failure
135d8fc7af44 drm: writeback: Create an helper for 
drm_writeback_connector initialization
02c50fa60ca5 drm/writeback: remove pointless enable_signaling implementation
720cf96d8fec drm: Drop drm_framebuffer.h from drm_crtc.h
7933aecffa28 drm: introduce drm_writeback_connector_init_with_encoder() API
57b8280a0a41 drm: allow passing possible_crtcs to 
drm_writeback_connector_init()
38d6fd406aaa drm/writeback: don't set fence->ops to default
b1066a123538 drm: Clear the fence pointer when writeback job signaled
0500c04ea14a drm: drop use of drmP.h in drm/*
9d2230dc1351 drm: writeback: Add job prepare and cleanup operations
e482ae9b5fdc drm: writeback: Fix leak of writeback job
97eb9eaeb95b drm: writeback: Cleanup job ownership handling when queuing job
71a5cb3eb758 drm: writeback: Fix doc that says connector should be 
disconnected
cde4c44d8769 drm: drop _mode_ from drm_mode_connector_attach_encoder
73915b2b1f25 drm/writeback: Fix the "overview" section of the doc
b13cc8dd5884 drm: writeback: Add out-fences for writeback connectors
935774cd71fe drm: Add writeback connector type



-- 
With best wishes
Dmitry
