Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7CBCD617
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5264B10E29E;
	Fri, 10 Oct 2025 14:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtCKZR/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4921F10E29E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:02:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Y5ru009339
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7wkzrxKudGSviXsY/mtwV95A
 pO2/F8bqxrMw6rKRUQs=; b=YtCKZR/MKHgtOZi6vcOxpQ3qKxJqn0UgdFTNCXsI
 sJVqDaRakSag7bU65LgFJK+ZEtLghWpshoZQpGdcZbfU69ysSXSVY6nMYoup7qmn
 /S69nHAvpHOe+A8qTrFDRHds8Q2JVhmmPdI4LK7R7iLVuFXUhxD0dtlC2opfsn6f
 CiCfBvQ5lcF+SNXOiycOUAV0cDzWQGeUdCd1qpJ6PjWBMQVSLtJ1NZBmDu+ihbeB
 2JvToGRINChtwlpNekLtlqubx4oYd1oDeBN5FvHJ02rIK8AadmMX7M1YJz9aigBp
 U9tuzgu13YAiJua6n3sRGlt4YTW02NVsgH9Hf0qjdcTaJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4spmaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:02:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7810e5a22f3so6825009b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 07:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760104967; x=1760709767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wkzrxKudGSviXsY/mtwV95ApO2/F8bqxrMw6rKRUQs=;
 b=NflruGT/s9EVTN+z2aDj31SxoSpQQ/7T7RwaCSj450FTANaLrErxa7TXcRggyo3EAj
 Sxv9oaf+bRuOrG+red2uyfZMljYRzbHdQ9QOaQO6uk/RXsDOHn+GX1aB01Gym+uBlDg4
 qWMpQOyO1ltLOi43D0A/HVNbAvev6safn9UoXVYgAsVeCsVtllEdfmhXfw8yUzflpovW
 P7gZO/d6gQS3eHd18WagbJjpknrmKxCOGIDRLiXhWEdqEqkCEp50yBnCm2zuUXgIMQEZ
 jI+NekJB/SPuri80Hayg1OPT+PzT6yNKPG0WvdkwSU/QB32esqaFSQA+nPrOO4ClSoMo
 7FaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUEGltZPWP3IT5/cIQvuJj7e5iZADxj2qYs9/NN5FMDLJMrEqJhTfLlnjcmdPJoZ5FKGv0cGpQXwo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziuLDBm/PmMUCVfjp5SeB0cDn18TqB8WYHWFqdBwsy+qfaFsNp
 5Qz9x1YpOcTvToSvE/qYuapzBYjobFM722aDYefNYVjMCx19BOKvqrty9i8vDEZPxrYYyuYbBNl
 AtdII8unMEg3MNuEDJrhOB7uJrJYvm0WF/JMq4prPqpofDczvXFGcaYWAHtjTJa0haWNkJlE=
X-Gm-Gg: ASbGncs9MpRq2Myy4/5xyDE9OW+9lDM42JJVb4AfgRy0SNSiki+sZyYTy3LKtFnxcHZ
 exsXdZ/Ub5iOUZrQx43QIBktMsyBnMzwYVXyQlYcSv+dvOSIAFSEd5Uf8Uv4hXwOsaI3S3AMuef
 I7qnILdETVGwuWXrrrQrAfEQnnkYmQ60xQQ4wPOXCkngkGNoWhK8bKVzPvuUAWogp21JXI73boJ
 KcsSO2FR9KRSx3ecUGgl/3xJcUkQWQx5Cbrm2+fWL0OChSPBwZ92i6TnAft2M19Kqi1VPv9zNii
 p04Tlr0QvkI5WUQNoT4am4lHGjA0vg9rfxLUgAhlSbpLRhfyArhJibb/q3vKlSHqmyte/2FCw2w
 +TYnUSy3LmrNoOPXN8GVq8r7wDKUWl/Ysn4MfkN1CMKxS5rswTMwA
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id
 adf61e73a8af0-32da845f843mr16839561637.45.1760104966499; 
 Fri, 10 Oct 2025 07:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx6lmwhdGB5tiz/Bc58mePgSBZ2wqdgFCoifjtltdKT0RsIy6in4D98ACg4FIrT0oC09J4cw==
X-Received: by 2002:a05:6a20:12cc:b0:2ff:3752:8375 with SMTP id
 adf61e73a8af0-32da845f843mr16839190637.45.1760104964177; 
 Fri, 10 Oct 2025 07:02:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4de3sm909304e87.1.2025.10.10.07.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 07:02:41 -0700 (PDT)
Date: Fri, 10 Oct 2025 17:02:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <dkblceiweall37j4anpgkumizxc5zni3axnxb5hyokv2jlsta5@immpjaczktnh>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
 <20251001180922.6bbe42ac@booty>
 <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42ebdca-1cbc-498c-b859-336557823f26@rock-chips.com>
X-Proofpoint-GUID: TqDpjZsz6wtJfSjCtxMedG7CLZBkyD2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxf5KA825kCvl
 lhf8yhcyB/F65pekllspnq7MTOYk+toqOXf9MozLVSbihT4r/YQ1Ce8sWv8+aiWlCguQ8IdKH2j
 a5OWgBdvX2I007iynF/G9UnYmEIhgck/n05nHnvR1AX5pRXPeJnDN8yabjejVBwr3lP7WNzENkf
 VA3f9DKNBk1E9mIkILDUgJvRJ3p9tnU/jjtFOuIUUvjKKPRtF0SNxiSMM6Z6/RXOc0fl24I1hEV
 +DsKjc9I8tzHNRngwnNZn5H9ahFUBhdqd3CsV2/EMP+gu9EMpUuhGlzJ3KgKo+OACAwAYva9zdQ
 dbqckGSeOY4KMKWxsl9L/fngk7gMTIjtb1UmMjG8NtnI2F4676sPC3Hp2YDgqCKgR1J9fLBI57v
 vEPdwE8c86ZCpZ931Dxu9cj9LZSipQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e91208 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=s8YR1HE3AAAA:8
 a=Y6CNJq9B8L7KKZcxe68A:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: TqDpjZsz6wtJfSjCtxMedG7CLZBkyD2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
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

On Thu, Oct 09, 2025 at 12:10:42PM +0800, Damon Ding wrote:
> Hi Luca,
> 
> On 10/2/2025 12:09 AM, Luca Ceresoli wrote:
> > Hello Damon,
> > 
> > On Tue, 30 Sep 2025 17:09:13 +0800
> > Damon Ding <damon.ding@rock-chips.com> wrote:
> > 
> > > When multiple bridges are present, EDID detection capability
> > > (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> > > determined by the last bridge in the chain, we handle three cases:
> > > 
> > > Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > >   - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > >     &drm_bridge_connector.bridge_edid to NULL and set
> > >     &drm_bridge_connector.bridge_modes to the later bridge.
> > >   - Ensure modes detection capability of the later bridge will not
> > >     be ignored.
> > > 
> > > Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > >   - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > >     &drm_bridge_connector.bridge_modes to NULL and set
> > >     &drm_bridge_connector.bridge_edid to the later bridge.
> > >   - Although EDID detection capability has higher priority, this
> > >     operation is for balance and makes sense.
> > > 
> > > Case 3: the later bridge declares both of them
> > >   - Assign later bridge as &drm_bridge_connector.bridge_edid and
> > >     and &drm_bridge_connector.bridge_modes to this bridge.
> > >   - Just leave transfer of these two capabilities as before.
> > 
> > I think the whole explanation can be more concisely rewritten as:
> > 
> > If the later bridge declares OP_EDID, OP_MODES or both, then both
> > .bridge_modes and .bridge_edid should be set to NULL (if any was set
> > from a previous bridge), and then .bridge_modes and/or .bridge_edid be
> > set to the later bridge as is done already.
> > 
> > Does this look correct (i.e. does it convey the same meaning)?
> > 
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	struct drm_connector *connector;
> > >   	struct i2c_adapter *ddc = NULL;
> > >   	struct drm_bridge *bridge, *panel_bridge = NULL;
> > > +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
> > >   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
> > >   	unsigned int max_bpc = 8;
> > >   	bool support_hdcp = false;
> > > @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   	 */
> > >   	connector_type = DRM_MODE_CONNECTOR_Unknown;
> > >   	drm_for_each_bridge_in_chain(encoder, bridge) {
> > > +		pre_bridge_edid = bridge_connector->bridge_edid;
> > > +		pre_bridge_modes = bridge_connector->bridge_modes;
> > > +
> > >   		if (!bridge->interlace_allowed)
> > >   			connector->interlace_allowed = false;
> > >   		if (!bridge->ycbcr_420_allowed)
> > > @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >   			bridge_connector->bridge_detect = bridge;
> > >   		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > >   			bridge_connector->bridge_modes = bridge;
> > > +
> > > +		/*
> > > +		 * When multiple bridges are present, EDID detection capability
> > > +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> > > +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
> > > +		 * are determined by the last bridge in the chain, we handle
> > > +		 * three cases:
> > > +		 *
> > > +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> > > +		 *    &drm_bridge_connector.bridge_edid to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
> > > +		 *  - Ensure modes detection capability of the later bridge
> > > +		 *    will not be ignored.
> > > +		 *
> > > +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> > > +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> > > +		 *    &drm_bridge_connector.bridge_modes to NULL and set
> > > +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
> > > +		 *  - Although EDID detection capability has higher priority,
> > > +		 *    this operation is for balance and makes sense.
> > > +		 *
> > > +		 * Case 3: the later bridge declares both of them
> > > +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
> > > +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
> > > +		 *  - Just leave transfer of these two capabilities as before.
> > > +		 */
> > > +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
> > > +			if (pre_bridge_modes)
> > > +				bridge_connector->bridge_modes = NULL;
> > > +		}
> > > +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
> > > +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
> > > +			if (pre_bridge_edid)
> > > +				bridge_connector->bridge_edid = NULL;
> > > +		}
> > > +
> > 
> > If the above rewrite is correct, then I think this patch can be
> > rewritten in a simple way (build tested only):
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index a5bdd6c10643..bd5dbafe88bc 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >                  if (!bridge->ycbcr_420_allowed)
> >                          connector->ycbcr_420_allowed = false;
> > -               if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > -                       bridge_connector->bridge_edid = bridge;
> > +               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
> > +                       bridge_connector->bridge_edid = NULL;
> > +                       bridge_connector->bridge_modes = NULL;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
> > +                               bridge_connector->bridge_edid = bridge;
> > +                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > +                               bridge_connector->bridge_modes = bridge;
> > +               }
> >                  if (bridge->ops & DRM_BRIDGE_OP_HPD)
> >                          bridge_connector->bridge_hpd = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> >                          bridge_connector->bridge_detect = bridge;
> > -               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > -                       bridge_connector->bridge_modes = bridge;
> >                  if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> >                          if (bridge_connector->bridge_hdmi)
> >                                  return ERR_PTR(-EBUSY);
> > 
> 
> Yes, this is correct and maintains functional equivalence with the previous
> implementation.
> 
> I previously attempted to implement this feature by modifying the logic in
> this section. However, that approach would obscure the explicit propagation
> semantics of the bridge chain flags (OP_EDID/OP_HPD/OP_DETECT/OP_MODES).
> Therefore, I finally decided to implemented it as a specific check after
> this code block.
> 
> Dmitry, what's your take on this?

I think I prefer Luca's code, it is simpler and easier to understand. It
doesn't need a huge comment, something like "leave the last bridge which
provides either OP_EDID or OP_MODES" should be enough.

> 
> > Another thing to note is that this patch conflicts with [0], which I
> > plan to apply in the next few days. The two patches are orthogonal but
> > they insist on the same lines (those assigning
> > bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
> > comes later will be easily adapted. Just wanted to ensure you are aware.
> > 
> > [0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> > 
> 
> This is indeed a clever approach to the managing bridge resource cleanup in
> drm_bridge_connector. Thanks a lot for the heads-up! I'll resolve this
> conflict and rebase the patch series.
> 
> Apologies for the delayed reply as I was on vacation. ;-)
> 
> Best regards,
> Damon
> 

-- 
With best wishes
Dmitry
