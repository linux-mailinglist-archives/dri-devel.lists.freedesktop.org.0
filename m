Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E1B0A8B0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E710EA15;
	Fri, 18 Jul 2025 16:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxgOpYEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858EC10EA15
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFfAdG000598
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4iHjg0yMyuWIDVvOC/k5MiWC
 uaawwe3vjDf9NJDxgHQ=; b=gxgOpYEsJYpO9xyIh070IoNezkQWveY4BEIRAFJS
 SKY1qpz/GK9FIX0ij1xXOb5aHrk43dO3wE9cHErPkaKXomnXlXc/Sjom0U4ZV5iV
 BC03Bg5OPedKjVL0zRy+D9nVnIXJcC9IV3xoMvN1c0RowrJSbJ4mYr+ph+cyPJIM
 pZedL2iKWu+7idJBtbwDQ2uNwX3pcqU/+6UA9Mby3asjSSDVkucPxZqMjqqw9cBY
 duNJKHdAtmeeTdNRvz5SG7GT52t72Wehuv/S+hVLDRA8g6o6yVfYMVQKLbHSSdSl
 HixbEhScTMZuhcqdlI/afn7nxeG0ESf4yG9A6g6jKFoh5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drybq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ab68cc66d8so42702721cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752856999; x=1753461799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4iHjg0yMyuWIDVvOC/k5MiWCuaawwe3vjDf9NJDxgHQ=;
 b=S28MEiNy09vcFqPiFaqgdlphiim42QKfibD/w29jMFwJ+f4Fptn2dS1dRETefo2Sdf
 Btk8OlK0v/FSDvoN7IwvJc5ocNijfiROtaAfOBIbYJaFoqvLoF8ahai/hDJWCvoSng3m
 WJX9Pw30Y35IcX1tkBe8QJN+NkTWiLKo6n5SRSyqpKq69iau6NMgg/gMH0imtcbMti/O
 6qZwZ8hfME4VByyNkt2M1SQdLXIEC0zstsZpuG/NNa5/KIeDI+qugFUbcPU5izpsaqaq
 ZkyGP+H6dSWyygn9onAgz+zCLXL116PSBb5194hQi98pA+chVNwOrRu3X8DlKJuuBl5t
 SLdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFARv2d/MUEauEkkU0j+b8PEY4zW+Tfw03xu3E9lWRMnHh4b/WcA07s1Y+014w7cKOdNyWp39l47A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+PRkqLOckOLNe5B28b4DUtDD6qy6ptaw/ypoMyCnaTvZsrVUw
 u9P431vuAdtuAElINz31n1pvaEBO6hVYJgjRdiNmb2/7UzIXUXpiAyh2Pjs5ImniZc5UIgSuGuv
 QWEJXR0clfxvMv79hhsONHg4efWdI/CiOYRDM6m3GsgKgOOhFxBAPLXgqi+fDk6B3Xv6vApM=
X-Gm-Gg: ASbGncvi+NXgjj6ta+Bbmukm7kcSuFfAlq9okLgmq1iZUlWk6UcgMwk9vvbqDhd5DKg
 HrpotZxsGAnBXvcOUwamN77N7n2IIpBq6ifbfsML1cpYgkZksRlOher8ABQE8lmtomunArDbJ99
 aiekxNsK9H+BcE7WSCCloS0S+5ZJpmogBj6nFIORwfpY9Sz1J7w6v6DSGFK9DjY9BMzs9v3Ogi/
 vJn5RJPZMsHWN6CClB4qOYu16uCDVWbL14RlDTo0/4DpOjbW68KYpZ+yFkE44uLr183TDzrnFlR
 XCA7+ThcYjs2Cb4x9ZBPjLWeui/56Dt74WTc6JdHTGLsMEWxZQ2bKmcnXJWWdD1CDSwn4o+1fmC
 Btx/4rNeWCjsOX3HDukHaQ8EHa2SRc6qOKGkKJY+n2A7zQ7jwPSHN
X-Received: by 2002:a05:622a:993:b0:4ab:5c1b:4d29 with SMTP id
 d75a77b69052e-4abb08bcc18mr71425981cf.20.1752856999172; 
 Fri, 18 Jul 2025 09:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbZvzJ33XKh1GRS/821AX0SMZRPFuMmQBKRQJilQygxHg6c2UTUUaFHGWmAdQFkyffdOw24Q==
X-Received: by 2002:a05:622a:993:b0:4ab:5c1b:4d29 with SMTP id
 d75a77b69052e-4abb08bcc18mr71424721cf.20.1752856997985; 
 Fri, 18 Jul 2025 09:43:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31aac8besm319491e87.71.2025.07.18.09.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 09:43:16 -0700 (PDT)
Date: Fri, 18 Jul 2025 19:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 08/10] drm/display: bridge-connector: hook in CEC
 notifier support
Message-ID: <yybl66iajdrdkkfwerx4wmw5tvosp77l2ase2yaidam2h6n6er@nyhdlmak7xtt>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <20250517-drm-hdmi-connector-cec-v6-8-35651db6f19b@oss.qualcomm.com>
 <20250718164156.194702d9@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718164156.194702d9@booty>
X-Proofpoint-ORIG-GUID: mNPcVC0TOXn0JIlGs9_pLHGmOnPMNjeO
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a79a8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=eeht8Fw2wJzQMlc42zYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mNPcVC0TOXn0JIlGs9_pLHGmOnPMNjeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMSBTYWx0ZWRfXwCAA1umQq/Gq
 FsAp6d+0Tvuv9jMXr7cq7E0DOZyCHpSpgqkxQQuv6Tg4W9+r+VHnxW0ANywz2lJaN0kd0RTBKpI
 U49P+SfyeQqwVJ6SdmfMkvKDvEP8KnFGX8Ijh0GZgwJ6sgpIcd5eau4q3QlufJ6Wz8/OswnoCua
 K0fW07u1Dy9y9dojCkHQv7YY0hcGee6AfF+eNRCQoyrOTkXqKdeKlxKvLtAgg69vEAS/KIblBSp
 8nkgBoqMWXWgkFIBqBpfWXdB96U4CD4x0/EUC4NlJU5t+BrlgoIbyOWmhfOdCjul6brAOCRWgDr
 i2+zPRN3cSKfiaXO5FCiAerGj2FeuMKZFks9A7GJelZWl7cekYZvHAwg9uaeHARpT9OVUMEROyL
 o2ZJ1929MWjOmYS8TmaN93yB5mS3030sRJy8zgsRku5KEx4JHqN+96vJ5SYVKIIkx98GnQhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180131
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

On Fri, Jul 18, 2025 at 04:41:56PM +0200, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Sat, 17 May 2025 04:59:44 +0300
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > Allow HDMI DRM bridges to create CEC notifier. Physical address is
> > handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
> > being called from .detect() path.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> While working on drm_bridge_connector_init() for unrelated changes I
> stumbled upon something in this patch (now committed) which at a
> cursory look appears wrong to me.  Even though I still haven't analyzed
> in depth I'm reporting it ASAP so you are aware and can either correct
> me or confirm there is a bug.
> 
> > @@ -662,6 +670,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  			bridge_connector->bridge_dp_audio = bridge;
> >  		}
> >  
> > +		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> > +			if (bridge_connector->bridge_hdmi_cec)
> > +				return ERR_PTR(-EBUSY);
> > +
> > +			bridge_connector->bridge_hdmi_cec = bridge;
> > +		}
> > +
> >  		if (!drm_bridge_get_next_bridge(bridge))
> >  			connector_type = bridge->type;
> >  
> > @@ -724,6 +739,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  			return ERR_PTR(ret);
> >  	}
> >  
> > +	if (bridge_connector->bridge_hdmi_cec &&
> > +	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {

You are right, here it should be:

bridge = bridge_connector->bridge_hdmi_cec;

(and a similar change in the next if).

I'll send a patch.


> > +		ret = drmm_connector_hdmi_cec_notifier_register(connector,
> > +								NULL,
> > +								bridge->hdmi_cec_dev);
> 
> Here you are using the 'bridge' pointer, which is the variable used by
> the long drm_for_each_bridge_in_chain() loop at the function top. The
> same happens in the following patch. I am not sure this is what was
> intended, but I don't understand all the details of your series.
> 
> In an older patch [0] you had added a similar change, dereferencing the
> same 'bridge' variable after the drm_for_each_bridge_in_chain() loop.
> That was a bug fixed by a later patch [1].
> 
> Superficially this change (as well as patch 9) appears equally wrong.
> 
> Basically the value of 'bridge' here could be NULL or
> bridge_connector->bridge_hdmi, depending on the
> bridge_connector->bridge_hdmi value.
> 
> Is this the what you'd expect?
> 
> And if it is, what is the correct fix? Maybe:
> 
> 	ret = drmm_connector_hdmi_cec_notifier_register(connector,
> 						NULL,
> -						bridge->hdmi_cec_dev);
> +						bridge_connector->bridge_hdmi_cec->hdmi_cec_dev);
> 
> ?
> 

[skipped]

> 
> [0] https://cgit.freedesktop.org/drm-misc/commit/?id=231adeda9f67
>     -> hunk @@ -641,11 +705,16 @@
> [1] https://cgit.freedesktop.org/drm-misc/commit/?id=10357824151262636fda879845f8b64553541106
> 
> Best regards,
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
