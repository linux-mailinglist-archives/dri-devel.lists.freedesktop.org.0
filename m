Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85684A6087F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 06:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3C110E2E7;
	Fri, 14 Mar 2025 05:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T31Yy0kD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF9610E2E7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:52:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DLkH72030549
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1cNpwk/Ksw5C0BipKd9Tu9iu
 kqUWNo8O8iKtDbBKhzQ=; b=T31Yy0kDczjgjtEl8CQh4ZEK9GURYdSPqLJSRAuI
 qGgqKeATUpxncA/yquWdS5x51VAKCEW0JSvIVGhmaL3iHlPJcRkl6jeb5ZXltfoG
 UawPbvurvIgNXHNtCXuw0mBv8t3Vo8JL7je+XDshFxCX2bJvZbJE4QD4d24DEADH
 VT90FJy+1ZhWBSW+4hlJGAR3ky0xSuhjHh69kONFB4JjjVKPebUsIkN8/+30jplg
 aWayP23WVchxFRpSYt32TkQeKcvefPq9zUz4vInaSFQV64lhpd7SRKhpWmXv3nKs
 Alo7MmX1GJfQFvYYXS8Z1Q9hQPet9hVA/y3QHiIElJvQkQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qr5m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:52:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f99a9524so58153276d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741931560; x=1742536360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cNpwk/Ksw5C0BipKd9Tu9iukqUWNo8O8iKtDbBKhzQ=;
 b=Qws3BwLUTGtGzO3wq2ZSA3PU4d3LMbUfEznRvBnlxVgXw2vnmU311gmaKJ1R6iFCPt
 TmFZ2E7fSkTExFGuIOVGHB/q6p6MsxNPBmbN9SmS2ua6zFWNt6IVOcurvRsrStse11B5
 NJ3UC39YsW4eyeoam7OM3ABvKnIYiXLP4iu+DYLVaq8hFrlNzBlXOyhvMJl3EojVjtB4
 FoNrvuG7WAeSTbQcqmVxVmNO7uRI/lQalmqkBObyHoCiM14yIeZiIEPPa46UiqGWQEcA
 ngnOL76BcwsjmElUSujO9iIv6YjFKUsC1ZMt4wfFRQtrVNlnAK7W/X6tZsVPDFT3QH5W
 keNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ6gBuFiv9MW4wpeNNzGnBItb+sOnKnQAzpqw/BGStj5zbpScw692eaoc6tRhEPEUVmLKVXVsLM0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAk73B4ah6j7iVDHVMH6z0BjZI13WL2e6lJgUi8E3al6wL5eC/
 qKodk8ZU7rul4vhER9dGgun9LfbWylbUIt1QU/o3NxBiTeyW6og6UbuRPnCJa5f2intKM9NR1qf
 wk4yYryTzkfx/YjA1+ep3scaMcF/mNd7NjZ6lxfjD3PLWs+h4Lphm9oJWp/q8uJz/K1w=
X-Gm-Gg: ASbGnct0jSa0G+cBCiGeOXr4u2CAP2HgtN+teH+yad1hRUy5eBv13t2IhnpMC1vUqVc
 2ZreY8MnfZUJabCiRu0ZUke9A8+8JbUqKd/0jjucaBTBY+oOgmSWjX7UquJkuiSL7IjyXDESHg6
 V5cZ6rnEUN/Xyr4Q1flcwU7Yn7YxBfHA6ooeR8MuFIF0qyweI0uKu23z1gzJNbTryXjFNGOkiRR
 FVcMK2OYPvb+Re+3iehQvbGyZ5vye0NLAHQHx43tPuojcfMpuUIn+DiyDubOqiEpEDYc4vdVcmk
 8G6iCFnIvsP6pbeD2pxDJ/6Nepb5s1KjaXwEWSHXhSm9Qh1R+AqVmyjYWq9mPz/LeVc21Hejx3K
 V1H8=
X-Received: by 2002:a05:6214:27ec:b0:6d4:e0a:230e with SMTP id
 6a1803df08f44-6eaeaa22d6bmr16629106d6.16.1741931560375; 
 Thu, 13 Mar 2025 22:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6JIZDtIiUDzzApJ2OLwKhY5swWfQi7q7VayTguJ9VKXMBtO7IrTo2v29quzlBQ3O/AvIByg==
X-Received: by 2002:a05:6214:27ec:b0:6d4:e0a:230e with SMTP id
 6a1803df08f44-6eaeaa22d6bmr16628896d6.16.1741931560043; 
 Thu, 13 Mar 2025 22:52:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864e90sm415119e87.158.2025.03.13.22.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 22:52:37 -0700 (PDT)
Date: Fri, 14 Mar 2025 07:52:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, lumag@kernel.org
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
 <20250313-dazzling-deer-of-ampleness-21db67@houat>
 <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
X-Proofpoint-ORIG-GUID: SluntND9dV677T-Hh-iiP2uq-yNtZNH_
X-Proofpoint-GUID: SluntND9dV677T-Hh-iiP2uq-yNtZNH_
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d3c42d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=KKAkSRfTAAAA:8 a=bOAHaQNG5j-GgIvUF5gA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140045
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

On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrote:
> 
> Hi Maxime and Simona,
> 
> 
> At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kernel.org> wrote:
> >Hi,
> >
> >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wrote:
> >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> >> >>With the bridges switching over to drm_bridge_connector, the direct
> >> >>association between a bridge driver and its connector was lost.
> >> >>
> >> >>This is mitigated for atomic bridge drivers by the fact you can access
> >> >>the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> >> >>drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> >> >>
> >> >>This was also made easier by providing drm_atomic_state directly to all
> >> >>atomic hooks bridges can implement.
> >> >>
> >> >>However, bridge drivers don't have a way to access drm_atomic_state
> >> >>outside of the modeset path, like from the hotplug interrupt path or any
> >> >>interrupt handler.
> >> >>
> >> >>Let's introduce a function to retrieve the connector currently assigned
> >> >>to an encoder, without using drm_atomic_state, to make these drivers'
> >> >>life easier.
> >> >>
> >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >> >>---
> >> >> drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> >> >> include/drm/drm_atomic.h     |  3 +++
> >> >> 2 files changed, 48 insertions(+)
> >> >>
> >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> >> >>--- a/drivers/gpu/drm/drm_atomic.c
> >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
> >> >> 
> >> >> 	return NULL;
> >> >> }
> >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> >> >> 
> >> >>+/**
> >> >>+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> >> >>+ * @encoder: The encoder to find the connector of
> >> >>+ * @ctx: Modeset locking context
> >> >>+ *
> >> >>+ * This function finds and returns the connector currently assigned to
> >> >>+ * an @encoder.
> >> >>+ *
> >> >>+ * Returns:
> >> >>+ * The connector connected to @encoder, or an error pointer otherwise.
> >> >>+ * When the error is EDEADLK, a deadlock has been detected and the
> >> >>+ * sequence must be restarted.
> >> >>+ */
> >> >>+struct drm_connector *
> >> >>+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> >> >>+{
> >> >>+	struct drm_connector_list_iter conn_iter;
> >> >>+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> >> >>+	struct drm_connector *connector;
> >> >>+	struct drm_device *dev = encoder->dev;
> >> >>+	int ret;
> >> >>+
> >> >>+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> >> >>+	if (ret)
> >> >>+		return ERR_PTR(ret);
> >> >
> >> >It seems that this will cause a deadlock when called from a  hotplug handling path,
> >> >I have a WIP DP diver[0],  which suggested by Dmitry to use this API from a 
> >> >&drm_bridge_funcs.detect callback to get the connector,  as detect is called by drm_helper_probe_detect,
> >> >which will hold connection_mutex first, so the deaklock happens:
> >> >
> >> >
> >> >drm_helper_probe_detect(struct drm_connector *connector,
> >> >                        struct drm_modeset_acquire_ctx *ctx,
> >> >                        bool force)
> >> >{
> >> >        const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> >> >        struct drm_device *dev = connector->dev;
> >> >        int ret;
> >> >
> >> >        if (!ctx)
> >> >                return drm_helper_probe_detect_ctx(connector, force);
> >> >
> >> >        ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> >> >        if (ret)
> >> >                return ret;
> >> >
> >> >        if (funcs->detect_ctx)
> >> >                ret = funcs->detect_ctx(connector, ctx, force);
> >> >        else if (connector->funcs->detect)
> >> >                ret = connector->funcs->detect(connector, force);
> >> >        else
> >> >                ret = connector_status_connected;
> >> >
> >> >        if (ret != connector->status)
> >> >                connector->epoch_counter += 1;
> >> >
> >> >So I wonder can we let drm_bridge_funcs.detect pass a connector for this case ?
> >> >
> >> >
> >> >
> >> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f094
> >> >>+
> >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> >> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> >> >>+		if (!connector->state)
> >> >>+			continue;
> >> >>+
> >> >>+		if (encoder == connector->state->best_encoder) {
> >> >>+			out_connector = connector;
> >> 
> >> 
> >> When try to use this patch in my bridge driver,  I found that the connector->state->best_encoder 
> >>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge_funcs.detect_ctx is  called:
> >> 
> >> [   52.713030] Invalid return value -22 for connector detection
> >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/drm/drm_probe_helper.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> >> 0x63c
> >> [   52.714568] Modules linked in:
> >> 
> >> [   52.724546] Call trace:
> >> [   52.724762]  drm_helper_probe_single_connector_modes+0x5e0/0x63c (P)
> >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> >> [   52.726057]  drm_ioctl+0x22c/0x544
> >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> >> [   52.726706]  invoke_syscall+0x44/0x100
> >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
> >> 
> >> This is because  best_encoder is set by set_best_encoder, which is called from
> >> drm_atomic_helper_check_modeset. When we call drm_mode_getconnector 
> >> for the first time, the functions mentioned above have not been called yet,
> >> then we can't match the encoder from connector->state->best_encoder for this case.
> >
> >As far as I'm concerned, it's by design. Encoders and connectors have
> >1:N relationship, and only once a connector has been enabled it has an
> >encoder.
> >
> >If the connector is disabled, there's no associated encoder.
> 
> Does this prove that this API is not suitable for my application scenario: 
> Get the connector in the bridge's .detect callback, so this means that I may
> still need to modify the bridge's connector callback so that it can pass the connector ?

I'd say, yes, please.

-- 
With best wishes
Dmitry
