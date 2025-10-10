Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1894BCCE8E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2F310EBDC;
	Fri, 10 Oct 2025 12:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPemSx+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ED910EBDC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:32:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6XI2C026135
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3FGswqZmb7o87pLL8dC6h4cU
 9CHmuuEKgRSZOOsTPV0=; b=UPemSx+stLLvTAMPbelFSkpNIdlZyfRbmoEetfLo
 AZnWLvARtetXEHFPcTlOJv+KLejfy5MhalbQe+tIUAdKCtqDjG2bQ4x5JtqjUKLe
 Qt2tLOf2xT5tSjObxqk/monVnGFEdLT5Tv86jlxQLnaP8Ndq9e8Rc+rmCQSr4FCY
 jO7xr95LIQDRjSzvNwDS7OlI9f44W4Eyt4Kq8YNuiUNb6nA8BUsf5/uWcW4BE+7o
 KjfCoMn3XEZUGZ9MVmWrp1uDloXlAjPkAmaw4zoc5ecAW6SRlsKpzUJb02PzbWJL
 0cQ4G+Hc68dR0/YJQiEoCChseGFRFrDfz+MixWI2W4uReA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nedpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:32:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4df10fb4a4cso115182061cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 05:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760099558; x=1760704358;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FGswqZmb7o87pLL8dC6h4cU9CHmuuEKgRSZOOsTPV0=;
 b=ZqYz85ISgwdkRC+G9cWi8HuLg4OI+5cr1uqnqUJqYdYSiYHyXFkdVh3BLHN0Vm1sah
 UkmhAuHB7w/gSHcVefnM7KRMDVxgqPf4YdMJmZ+4DE8aNtWuAecIV75aU6cchuPZPACw
 17ph/wJU8Mv78qYIYv/ZDqvnflE5DFashDU6vJ06aLVwkHS4/OkpvTC3sGoQP/5yaWJH
 zXYf0+xbdBdnPK5LAgIAPWPoiUQZi1+AtBUlHziiuhm7RP1SJwZHBBL2qiiEFGzm+mzh
 aUvEBqv3VrNk3PsCeACnRRnRRt2xts+R0WIeE6+CwpyIIb5Qz791CSl9snNQwhe9ZO+Q
 L8Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWPqyVqVc/ytK5gmiQPOWpESoSAZ4RouapR3jaqCAmGIo9JeVZmiOxhLfVMK8yNGiaOgU5bvv44xE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA0P74jCuTQ2Dl806MyfBtZYPsJ7pUCfJDrMySO2uQuF/WG37/
 yAY6fGPWAfFxD9R7DxG+E861+r46is8XZ78IHKot3l6Yty5iRcEy7B53geiLvYq4ptPfwbCxKwy
 5zvH199EyMRg3ubSa+KkTYQfh6u4iQn0cR6tjp3F1sk9R4B8WDBB4PjthM2tU9LzkbmMILfw=
X-Gm-Gg: ASbGncutchKgatPtgl9L1IZmUoJp03m7CuD+Tho637MyPRw+uQd02FW8tqNUinOzb4Z
 G6YW1OJ5VSKWlZLS3Op71BTAji/MG7zBabfX3ueoYW3/zkn5YXb/RwU1Oap+O2fbmGK8iHxAf9e
 MPDT5XxY3/dWpMt2o1xYu0S3Mg1xA0iKP6qyITY760xiOU7qrfMKV++S57GlAGiY2GXlU1of6gw
 leGpd+lEN78oI2+IJNb50zBMjKKNCUQWJxhCkRlBvEOQSGY5WK62fIfR+QxRniyycTeTO1KwG3F
 l+PM14W61IVTp1GzVTfv93rREFPAz4eseQHhlScRyoCbNJVERiGaPh7ZPCzwVtRB78ytdivraRC
 xb+AQDKagJ2hevu5Pt/+Kq37J83cSoixTf3YylNQNH2u6eHitL/DP
X-Received: by 2002:ac8:584c:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4e6ead859f5mr149626981cf.64.1760099558310; 
 Fri, 10 Oct 2025 05:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8GKqXID6v9hnF8T8Cy7rBeFnt2STh9JPsXFF8UUnC7ioTi8qpCFti2jz2aTU4mL9cnzn72A==
X-Received: by 2002:ac8:584c:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4e6ead859f5mr149626551cf.64.1760099557749; 
 Fri, 10 Oct 2025 05:32:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762ea14d46sm5982581fa.34.2025.10.10.05.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 05:32:35 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:32:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, aradhya.bhatia@linux.dev, javierm@redhat.com,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, lyude@redhat.com, luca.ceresoli@bootlin.com
Subject: Re: [PATCH v7 3/6] drm/bridge: cadence: cdns-mhdp8546-core: Set the
 mhdp connector earlier in atomic_enable()
Message-ID: <5nzkzfl33tw27pjqjxt6ao5pbkd6akvjehzveoarpz5lczq6zm@2fe63bzzmqyr>
References: <20250929083936.1575685-1-h-shenoy@ti.com>
 <20250929083936.1575685-4-h-shenoy@ti.com>
 <gtj43rfr2dgegutffma34w5bhvdmvx44jhwxgxb3ficqh5tm53@2iyr6ho3qfdh>
 <429400d3-e369-cf6a-3e9c-3d00622d7f29@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429400d3-e369-cf6a-3e9c-3d00622d7f29@ti.com>
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e8fce7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=sozttTNsAAAA:8 a=991EO4SM7AfkRsUnTd0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Sz__oZ4xyNOy3SffFV_GRZzIHuvCJA2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6PvAhgiavC4B
 A5uUuQUvYTM/ltBZur8M4n3zBWRmTq6FONooqn2WJsgNeli+1wmBA5y0gFKOPEQxaBZ2vBvy6yT
 Mr9evKma25Ngb9reZeJX6CpNKpiz21SrcDWZ14HYEE/Y4Va5mba/cyxbgJSge8SKrcSlMDh/JFL
 Rrq96aYS/mmI8rO1/G3ugPxSEubBPIGBW5GgcFPcfRb+Iwsc6ghF+eQdHbcUxRKE18mh43mZwcr
 7NSImMrxbRZaqTtl6rgl5t5aobE4CqjFyMq3W05xrIpMZCkrfctDDfawLsZ4KfN7FBHqSlThp4I
 P8luG7WjTV07QS/5csiLnWvscktoVx5z0IHFGAK22WtKFnEYr/ek0HqitJVoj4GLPSM73bHqfwz
 BIHy9DH283FndDO0nQUvlPEeokcSpA==
X-Proofpoint-GUID: Sz__oZ4xyNOy3SffFV_GRZzIHuvCJA2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Fri, Oct 10, 2025 at 02:48:10PM +0530, Harikrishna shenoy wrote:
> 
> 
> On 06/10/25 04:42, Dmitry Baryshkov wrote:
> > On Mon, Sep 29, 2025 at 02:09:33PM +0530, Harikrishna Shenoy wrote:
> > > From: Jayesh Choudhary <j-choudhary@ti.com>
> > > 
> > > In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
> > > in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
> > > NULL pointer while trying to access the mutex. We need the connector to
> > > be set before that. Unlike in legacy !(DBANC) cases, we do not have
> > > connector initialised in bridge_attach(). Now that we have the connector
> > > pointer in mhdp bridge structure, so set the mhdp->connector in
> > > atomic_enable() earlier to avoid possible NULL pointer dereference
> > > in recovery paths like modeset_retry_fn() with the DBANC flag set.
> > > 
> > > Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
> > 
> > This Fixes tag means that this patch can be attempted to be backported
> > back to v6.5 (even w/o cc:stable, etc). I know that it is a pain, but
> > please move all Fixes to the top of the series. Yes, you want to drop
> > non-DBANC case first and then fix everything. It doesn't look like it is
> > a correct approach for the sake of maintaing the -stable branches.
> > 
> Hi Dmitry,
> 
> The patch which drops non-DBANC case can be moved after fixes, but for
> making fixes i need the pointer structure so adding fixes tag to PATCH 2/6
> "drm/bridge: cadence: cdns-mhdp8546*: Change
>  drm_connector from structure to pointer"
> Let me know your thoughts on this, will re-spin accordingly.

You still can have a pointer to drm_connector. Just make sure that it
points to the internally-created one if the driver did create it and to
the external one if DBANC flag has been passed.

The easiest way to ensure correctness is by reordering patches: move the
fixes to the top of the series and make sure that they are correct
first. Then drop the old code dropping drm_connector creation.

> 
> Regards.
> 
> > > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > > Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> > > ---
> > >   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++----------
> > >   1 file changed, 10 insertions(+), 10 deletions(-)
> > > 
> > 

-- 
With best wishes
Dmitry
