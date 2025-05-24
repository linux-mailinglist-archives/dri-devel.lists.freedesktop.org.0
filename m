Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D812AC2CC4
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 02:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7690610E1CC;
	Sat, 24 May 2025 00:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8yqTAM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCEA10E1CC
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:39:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBNpJm020593
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vK52ezr41m56pzYTcI0iDmKN
 jEm58wnfieVUi6ZhcI4=; b=Y8yqTAM+LBpDePLDPuK6Kgbu3VpZeikBlUDj3fpD
 R9msi4z1eaQ/jgr+TALv8uoYjGKArQtAIzTFc+wXHwpUNWE1WPlhMoFBWDupC/Mg
 HusLeg+QB221wtPcxdp4Q8KQDzRxBm7TjTJvcgOmNS6jpAwRjC3eFjLTsGMQZI8e
 j3KGXVP9+daGUfrj6zMGD+wW8Fyx6uORNC3f+q+Mzd8vmyQd4VdQGrkDs/MXeKfT
 nZouNLmj+Lttlka+kZ+lcf5cMLHCgUNpDI3y1K6gey1LeRJJLhKcDROk9MBj88eB
 JsGhsfn1SqP/VDIhZOh42iZ6DuVD7I9K+bKLOCKT69SAWw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb9uyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:39:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fa9e48d4d9so4468486d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 17:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748047140; x=1748651940;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vK52ezr41m56pzYTcI0iDmKNjEm58wnfieVUi6ZhcI4=;
 b=SuSJIJUaIGFKUokNCkS97ju/2+P/rkVHxjV6FK53fz941okhCipRjPCVMiRpm6RsnF
 RoVeYJu9U8+vt9BmdplxYEHqtkVbf8grlUIDurbWdf6GMyQ/MeQXBlcKnsNWfORWf6UP
 rtgFp8VRYC9LkHgBhqyNN+mNf7sd08jjLKJP23xnjFpliJ4Xg7SnsMcDJjAakIxUT+Px
 kd830cdu4Qii6y197o36VUs9n7R+PwC4K+p6u5ds8r8YLH1M61hiFaDKbsuwEkd9PlPZ
 Bc+02JrpHS888GNwzACISPRqZ6fj86LstdOHu3nkzAtu1RRFBqSTH7kxuilaGGsj+xMw
 1MIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkAOuwvUCDnGF3D3L/B5HWQkOLpIJ92nXlzorgjZ8F4HoMN19cL1+fDmQgoqyMMWm6Eaa5VbpAOv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqS12XXfvCtcH4Hr4isBpXmSaHUtl6km/ypDCslnwlIKBekaIQ
 gxRsrvyzO2x2HcaCqJTK791i7+BnH9jN3baibRpkrbuyKiDOdRwwd8fKUyE8KRNC0ri2G1meV1o
 NGVpJNnhdMLawF0FVfrMlLy/0mleNQs+ZNWfOW3LhJ1E0zR9xUb0UXUMjA2gGvFuOESqZPpE=
X-Gm-Gg: ASbGncuwklAM/YXoZ8fw7GqXHQY8/Sz1nOgifxP1RgO4Og0Q1cyxegHSGwtr4s+JFVz
 dZrqG0y4z4fO08SNL2ePYZNCjqFHvAMfgskg+YlTmWJLD2TcoB1dz8z0//LblSgRTxyWyqNNe5e
 jhGAzX9bRCCf87RU5R6dI0nh6JehU3nbfZRgi7WOTCuDOJG4429aIhK4nzfs+++IFzpuBwzrmHI
 0qm82+mmJzWbqeqFevb2KiF2EydCtlPCl4ALR5bY4Z77QOqhKjgHezo/mqRrV8ImLeHsGa/qknS
 KhM3g5M/cUR9wLCsSYiEbGP1yWMt2GRpKpRIh6moucmfTbZDgjq9qSEAUvgYPXhRfhMjXvIP7g8
 =
X-Received: by 2002:a05:6214:234e:b0:6f5:10b5:cd2d with SMTP id
 6a1803df08f44-6fa9cfff184mr25328986d6.7.1748047139929; 
 Fri, 23 May 2025 17:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGySTqWoJN9ojniz47O1K1FNUlMzOMDATGsvhq/eKMLX8kRbKGpceDFLEaIhr005Dc3Vh1DEQ==
X-Received: by 2002:a05:6214:234e:b0:6f5:10b5:cd2d with SMTP id
 6a1803df08f44-6fa9cfff184mr25328686d6.7.1748047139612; 
 Fri, 23 May 2025 17:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8787sm38943541fa.77.2025.05.23.17.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 17:38:58 -0700 (PDT)
Date: Sat, 24 May 2025 03:38:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 1/3] drm/bridge: fsl-ldb: make use of driver_private
Message-ID: <ghhu3fypfqls5wazqy6snttfi7eemsjwvgx3z2b4qt5ov2na2e@gp7qlz4gevgp>
References: <20250514222453.440915-1-m.felsch@pengutronix.de>
 <20250514222453.440915-2-m.felsch@pengutronix.de>
 <20250514224515.GM23592@pendragon.ideasonboard.com>
 <20250514230452.622hktklws6kka2y@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514230452.622hktklws6kka2y@pengutronix.de>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=68311525 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=I8cxGwhVmaP2LlvBdBMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rLkg5oRS0dVA2dTtjsJ-vrMtRmQ1o3RH
X-Proofpoint-GUID: rLkg5oRS0dVA2dTtjsJ-vrMtRmQ1o3RH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDAwNCBTYWx0ZWRfX5d5020Omkuj3
 oOP6SN13Y8azuMnpe+y3Pwr1rYyXYe8e/I2u90wdNV3vvrgOhL0ey5t3EluNw0TUlbgwlVSoNwD
 MhgA816t0Mv6Qn0E1dBbHS6r3VInpC/KbI8LlmsRCEasRquYExSRzJpNUz4TRBHb1Y7Gd1glMax
 9E/+yjc4ir4k+Mf+soxNQe0c8P0+vziayysCu2PKj6fgDdbz2i9LtXYTdl8XdKjDPvq+D+kARuX
 fX2CszQrlyAxuWClPJ6fC0CnP9Yc1grsAfn3szuI0T79CXcSfE6CS481jSt07BwpTZ/Oour/AIl
 fRvc/IAMZ78s7pUZZ6Z1m5jGj6s5/oEqchyf6OI2zyr/SJZIWPbhrLU8zjqrdj55IPTlQm8Xxgb
 rNIayFfrMeJlXJQA4jZqp2f/hZlYfdatH26G5WxMYm4tIYaqgr5BtqZjB2l/p0j+i2ASbj7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=716 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240004
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

On Thu, May 15, 2025 at 01:04:52AM +0200, Marco Felsch wrote:
> Hi Laurent,
> 
> On 25-05-15, Laurent Pinchart wrote:
> > Hi Marco,
> > 
> > Thank you for the patch.
> > 
> > On Thu, May 15, 2025 at 12:24:51AM +0200, Marco Felsch wrote:
> > > Make use of the drm_bridge::driver_private data instead of
> > > container_of() wrapper.
> > 
> > I suppose this is a personal preference, but I like usage of
> > container_of() better. In my opinion it conveys better that struct
> > fsl_ldb "unherits" from struct drm_bridge.
> 
> Yes, we can drop this patch if container_of() or to_fsl_ldb() is
> preferred. I just saw the driver_private field and why not making use of
> it since we do that a lot, same is true for container_of :)

container_of() generally is a more preferred form, because it provides
type safety. It doesn't perform blind casts. Using driver_data involves
using void pointer, which can be cast to any structure pointer. It is
easy to make hard-to-notice mistakes.

-- 
With best wishes
Dmitry
