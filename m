Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9054B45A99
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 16:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2296210EBB7;
	Fri,  5 Sep 2025 14:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jf5ezg7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303E310EBB7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 14:32:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585DZGvG018505
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 14:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2blvhr/dbGiJffwZJCFo7AuxYx4MvDnwJkLcFgb+E/0=; b=Jf5ezg7jKEfuSLmE
 QhCA82MK47MA9tyOYEr6pErZQJDBB9hqgJV3BXDGqFBUtr9wj8fUkXfhuA1GcCZk
 I0MG4jRnI9Rt5sQtPjDckWFld5fAO+fUz8Jn2rOBGZ5G96+/4rOIRBJm+nFDwWJz
 utB639Q7kiEX6cUXa/lU+H0T2gkAFIcN9NvDlMwhfv3tzX6FMndKm5274MYzOFW2
 PzHifR6r/UtYAvFZlBRiBUr2giahmfACP+xQAvndYO+eU+zRennNQpvYxzG7f348
 9AbCFZSw2/Mgned8c2b6YeY7a/vVhW471QRi18AihrW5VJK+Q3cB71HEGpojLe7y
 tkQT1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebuu9s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 14:32:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b35083d560so48317811cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 07:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757082766; x=1757687566;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2blvhr/dbGiJffwZJCFo7AuxYx4MvDnwJkLcFgb+E/0=;
 b=sbkgfTPC3IOZaBZZBpfEA8oUqKa056CST+Ydg1WEoPCmkZZx0IFevGE5e9/XJY7b5U
 m5AIXfZBJUiEKg296KKu4Ucxkn3QpVpIHug1+A/1c9R6NIQs57fr1PzLFP8V8d/X0M+U
 iBUgVuGJMDDimT/d99zKdLulMkCBI5KjotnsKG/oBwFVkK0f7r1Erpxck9AUMTCpWZzz
 GwmgivLQqyH5Bbsg1ojzVPZvN8MpEWcIk2gs6nSznkI4037NgpnB3dx2RdonBtpLhggM
 ZHtZ+s1tCGNlMzBmOA/WDJI7x3JRB0AYm9p4xe4aBJgeukB2OaZbet8QHtVtVEuuVFgk
 bXmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4mUV1kX5jTrHl/Bcm+JfstZeRHSn+P8NVLmleyQKOnjz1qdtKwIiCJi3itoYy5Onshzt2k6ucXPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxt4exD3MPVBlEwATigBJwTX2ong7bKv/s5A460fm473z8smny
 fFBiEvsuO067McgelYFM+l14S09xZJMXIR5tj/GMK2tgBJMwHBVWtJYdpGDDnDJL1W5GNtRpJXS
 zpsGgr0tcDQhuIXQDWSRaEect7bDZi+qgmZSAm0qGYnmM1PuuEAvbySPBVNK81h7nZmTS8gQ=
X-Gm-Gg: ASbGncu7jeyFljn+YV3J5GXLst9smlGs/ejplOm7YH93LvSsfqXoYC6aWCslP2dR480
 1q+eGDkMoecdg6yZIACtQrN1SZBZC7MdZpQpZAsBQNNX86JgseUgAFo7hCjSKaATq/doVq6LcHX
 eK0hqnEXz/x2L785MYPe2OquJCft0AhXmxX0WWGUdqf3uHK42H25E0rGgTNw6HQhaglLvuZmlDr
 LE7/TlVpGwf59CsUFFw9P4C727MmT4vkyOXaS3Ek63agLYP99hKbE2gBpYMAxuBWRxTuzC53NT0
 EiXJC3v+wp5Vk+C11xrXmUNZczI6jC2mOFD9fc/yR17aYmA/d+PY+uT3zTlW7jE7bgt/u3sANtc
 bDUy9lhohiLyOEnCJVqnsf7Xqbwi18lEd1fh76Y3QkY7V/i7i+G6M
X-Received: by 2002:ac8:7fc8:0:b0:4b4:9773:5870 with SMTP id
 d75a77b69052e-4b49782a0abmr117944741cf.21.1757082766270; 
 Fri, 05 Sep 2025 07:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgurbO0eCRsGdU/aokL+NeCbcf/yjmx/Jn5Y5VhJVqbPt0y1YnlOogs/MWAp71DHWK7oEdoQ==
X-Received: by 2002:ac8:7fc8:0:b0:4b4:9773:5870 with SMTP id
 d75a77b69052e-4b49782a0abmr117944111cf.21.1757082765691; 
 Fri, 05 Sep 2025 07:32:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad523b3sm1776126e87.151.2025.09.05.07.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 07:32:44 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:32:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, mripard@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <6qouaxhcwr4rxva7vgq7yy274imiufdtp3ae4mmirzt7hycxc6@4g26bzmhc37h>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <u72vkfojufgvuqwuqpvgvnip3wogpgdcuc7bn46zo3bp7ogbu5@fmqotgyahrsn>
 <786c050a.6d2.1991751593e.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <786c050a.6d2.1991751593e.Coremail.andyshrk@163.com>
X-Proofpoint-GUID: i4K42IflpUu_soqwvt7BQkWvDhhIYfwj
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68baf48f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=s8YR1HE3AAAA:8 a=5KrWf_2bJ-0ShaoMUpsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX4zcAqS9v/Bje
 1yjtbs7CHwey1Dvucnc8zVNbLyLRBA/Ia4W2UVe1nGxJOOD5EhqT2ZiKjeWmwEEgU6wHMZppqad
 KUkCQfdzT6W/FG3YdWNknQM9jMQQ3Lr1LtbFHiG56enX3W4UgtIuZFCMK7glREnUcYNyfoLWOFy
 b9wAdtyK+mbnbAsAbgqrhEDeW7VjZb/lPEIUemc/ZlCieIZetTiq5kODskAwPEwuIdffe4xqJBt
 prup4KL3mLc02RfdWkMRaM4cgKVHA1Pla/F4qAzIjKZBZoNtHHaGf3YjSNeHFwNpLEvpYC8gRdk
 K5jfaMvuT2T5uk6Gh0fhh/YZDq3dIdsJaeJu9MuI2ngfPr5zPEwJJcDA4zLhaHYkOVHuKDQBWH/
 Hj2svVCi
X-Proofpoint-ORIG-GUID: i4K42IflpUu_soqwvt7BQkWvDhhIYfwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
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

On Fri, Sep 05, 2025 at 08:40:31AM +0800, Andy Yan wrote:
> 
> Hello Dmitry，
> 
> At 2025-09-05 08:05:06, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >On Wed, Sep 03, 2025 at 07:07:38PM +0800, Andy Yan wrote:
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> Convert it to drm bridge driver, it will be convenient for us to
> >> migrate the connector part to the display driver later.
> >> 
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >> 
> >> ---
> >> 
> >> Changes in v7:
> >> - Rebase on latest drm-misc-next
> >> 
> >> Changes in v6:
> >> - Rebase on latest drm-misc-next
> >> - Link to V5: https://lore.kernel.org/linux-rockchip/20250512124615.2848731-1-andyshrk@163.com/
> >> 
> >> Changes in v5:
> >> - Split cleanup code to seperate patch
> >> - Switch to devm_drm_bridge_alloc() API
> >> - Link to V4: https://lore.kernel.org/linux-rockchip/20250422070455.432666-1-andyshrk@163.com/
> >> 
> >> Changes in v4:
> >> - Do not store colorimetry within inno_hdmi struct
> >> - Link to V3: https://lore.kernel.org/linux-rockchip/20250402123150.238234-1-andyshrk@163.com/
> >> 
> >> Changes in v3:
> >> - First included in v3
> >> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> >> 
> >>  drivers/gpu/drm/bridge/Kconfig                |   7 +
> >>  drivers/gpu/drm/bridge/Makefile               |   1 +
> >>  .../inno_hdmi.c => bridge/inno-hdmi.c}        | 502 +++++-------------
> >>  drivers/gpu/drm/rockchip/Kconfig              |   1 +
> >>  drivers/gpu/drm/rockchip/Makefile             |   2 +-
> >>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 188 +++++++
> >>  include/drm/bridge/inno_hdmi.h                |  33 ++
> >>  7 files changed, 366 insertions(+), 368 deletions(-)
> >>  rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (69%)
> >>  create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
> >>  create mode 100644 include/drm/bridge/inno_hdmi.h
> >> 
> >> @@ -637,14 +584,13 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
> >>  	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
> >>  }
> >>  
> >> -static int inno_hdmi_disable_frame(struct drm_connector *connector,
> >> -				   enum hdmi_infoframe_type type)
> >> +static int inno_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
> >> +					    enum hdmi_infoframe_type type)
> >>  {
> >> -	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
> >> +	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
> >>  
> >>  	if (type != HDMI_INFOFRAME_TYPE_AVI) {
> >> -		drm_err(connector->dev,
> >> -			"Unsupported infoframe type: %u\n", type);
> >> +		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
> >>  		return 0;
> >>  	}
> >>  
> >> @@ -653,20 +599,19 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
> >>  	return 0;
> >>  }
> >>  
> >> -static int inno_hdmi_upload_frame(struct drm_connector *connector,
> >> -				  enum hdmi_infoframe_type type,
> >> -				  const u8 *buffer, size_t len)
> >> +static int inno_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
> >> +					    enum hdmi_infoframe_type type,
> >> +					    const u8 *buffer, size_t len)
> >>  {
> >> -	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
> >> +	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
> >>  	ssize_t i;
> >>  
> >>  	if (type != HDMI_INFOFRAME_TYPE_AVI) {
> >> -		drm_err(connector->dev,
> >> -			"Unsupported infoframe type: %u\n", type);
> >> +		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
> >>  		return 0;
> >>  	}
> >>  
> >> -	inno_hdmi_disable_frame(connector, type);
> >> +	inno_hdmi_bridge_clear_infoframe(bridge, type);
> >>  
> >>  	for (i = 0; i < len; i++)
> >>  		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);
> >
> >It's not an issue for this patch (and I think it can be fixed after this
> >series is merged). I took a quick glance at frame programming. It feels
> >like the clear_infoframe should be poking at registers 0x9c / 0x9d. And
> >write_infoframe then can support HDMI, SPD and Audio infoframes in
> >addition to the AVI. I don't have hardware to experiment (nor time :-)),
> >but would there be a chance to improve this?
> 
> Okay, I'll keep your suggestions in mind and look for an opportunity to try them out later. 
> The hardware for this board is indeed very scarce at the moment—I put in a lot of effort just
> to get my hands on one. The main reason I'm modifying this code is to convert all of Rockchip's
> display interface drivers into bridge mode, which will make it easier to separate the connector
> part into the display driver side in the future.

No worries, it was just a quick observation from some TRM excerpts that
I found.

-- 
With best wishes
Dmitry
