Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B8A6CDAB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 03:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CB510E1C8;
	Sun, 23 Mar 2025 02:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztdn9Jrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912D610E1C8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 02:22:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N2K1B1030566
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 02:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=81suZB/MZ5E5A4/J04a0w+BM
 YOEb5yY768zu5SV2FoY=; b=Ztdn9Jrf597JIG2qCkBG0lfqSgPpg55dD/uNA2sQ
 xe5cx/hTB5H4wWLnsDZZrsniXKQJfZR7IA8ORVF91eh7CQm8F+/AZRxGn+RpAyR3
 RYF7mtpbMo/JC0eLxXQrATum2gisqr7/UaBOUm8apcqKLwX61xtZY8sbEJITXJXG
 zR/ZyVObp7KlUSUUyWWkbK1uTBU/79MQqbP8r2CV3XBKZVf5pUWC+G/f9ow7hKXE
 GRulKlFXipeA4lgdB8eKuDOdTliQGJbmZv9lKfjrJG/PmbhZJbo32+EE/oKxImN9
 jD3G1Tf3QrMgipOU4Lzf6qrDskVJOdra2gH0Ks/HAXCYKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9w9ec0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 02:22:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767261982eso61078181cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 19:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742696552; x=1743301352;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81suZB/MZ5E5A4/J04a0w+BMYOEb5yY768zu5SV2FoY=;
 b=mJmyqOPYOXYervkxhfRgToZjr8xsouplSvq+7JU43RtqPcl7eppz3d5n38GwLEZxLO
 WEzuXBvqylabSKZpEmkkY49nwvtk9qnRxEg0Y1P7G/SO94zc2n+CbwGBiSr685IHlrWw
 eY+X9WomKNuVMoa5D28EG1K3eSptaej6uS/zhs69MrEyyyWrKGaOF4CD2Q3cDH1z9hps
 0bnpzM3pIAiPSdpzfP4nr6RU92dJ6ahl3sAxWkWBT4MzgBotsetvAqCEzuRCvVke/IgN
 suoLD+AHNQEV60oSQNpgrXQDi17A26HDOnl1E4jYCW7VCuPcfZY90Pt1Opxfg8MLCIZP
 tk3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaviay2sszvQqM68N+YvugP9snuLQRQ5pB7f7XRVPnpth4ETeivxMd+196u9M5HjhNSCxF5QtXB5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyweGNlLMuOErgEnS4/3M0/4SrGOeJ4MnflwaeKNOZ8qwTP8apS
 uefoHwogmxSPtPUgITNsQz1SkkgsXL0LDRjBcvlXTfkgo+zFWJpmZCa+jaKXtmmr9wAfnRFMRDw
 AYZCfo0zjwwYAhAkqEktTnaWjJ5LrkH3f7nH4J+Mo3ho5phjGC2mjg5SMPT9AC7PNiaw=
X-Gm-Gg: ASbGnctSIdZA283XKEPCNkHT9RbrK+NXaR61Meuu5PDMvbNcv1eWk3VxLnKtjCI0alz
 s7BjBfufHXYuol4RFX5znhIgD6MfurV0YhxnH78f8P1DbP9Ax4X69ssKeBxUfVFyWgsxKMLKFoN
 qfxgqs4f/Da8LBb5cfQndZJrzIiqEGdxGIJxvlHPcAXYFE1NIfwxel8O0rK05WPXdtK+ivP7Xp9
 SKaeza43jRacWUtaDXbUPF4UJOVLDupxTICcprqcAk+ya0wA3eXlCGlmUHhi3ySbRi/CWJ8V+MQ
 PC6FGDKeWYHKcuwJRBU+eMZrR2poq68pgHJ7aXXc3FJPqbJ+j6RYSYBXxxOXBbn6NodT43++zge
 iS2I=
X-Received: by 2002:a05:620a:1a20:b0:7c5:5394:7e9c with SMTP id
 af79cd13be357-7c5ba1820b3mr1111230985a.32.1742696551805; 
 Sat, 22 Mar 2025 19:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAE6mCp9eWYSK2vsvmZ4Zf4j6kewjGyIH8Ci06kp4FzGYh2gdWAXSHVQdjhR2Np13RuI0f4A==
X-Received: by 2002:a05:620a:1a20:b0:7c5:5394:7e9c with SMTP id
 af79cd13be357-7c5ba1820b3mr1111227985a.32.1742696551307; 
 Sat, 22 Mar 2025 19:22:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad63eedf2sm646162e87.0.2025.03.22.19.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Mar 2025 19:22:30 -0700 (PDT)
Date: Sun, 23 Mar 2025 04:22:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andy Yan <andyshrk@163.com>,
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
Message-ID: <vw2ncdomx3rwltb2xlo6nf3rapgcdtcjcodofgmecrzzabf7ji@pybsfv27jkq2>
References: <20250313-dazzling-deer-of-ampleness-21db67@houat>
 <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
 <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
 <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
 <20250318-active-giraffe-of-memory-e0c66d@houat>
 <lsbzit4765y6jrw7jmbpfb6rixidenpndjwgw2yx57rz2espux@hbfco2ht6vwi>
 <20250321-majestic-cicada-of-argument-15b2d0@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-majestic-cicada-of-argument-15b2d0@houat>
X-Proofpoint-GUID: _FfZ5_3ySHV6U7Fg-_0oxfzM0zaEppK3
X-Proofpoint-ORIG-GUID: _FfZ5_3ySHV6U7Fg-_0oxfzM0zaEppK3
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67df7068 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=KKAkSRfTAAAA:8 a=hEbZjNMtiwb5NNjIx78A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_01,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230017
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

On Fri, Mar 21, 2025 at 10:46:56AM +0100, Maxime Ripard wrote:
> On Tue, Mar 18, 2025 at 09:00:29PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 18, 2025 at 04:51:19PM +0100, Maxime Ripard wrote:
> > > On Fri, Mar 14, 2025 at 08:28:22PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Mar 14, 2025 at 06:40:24PM +0100, Maxime Ripard wrote:
> > > > > On Fri, Mar 14, 2025 at 09:59:36AM +0200, Dmitry Baryshkov wrote:
> > > > > > On Fri, Mar 14, 2025 at 08:45:17AM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Mar 14, 2025 at 07:52:35AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrote:
> > > > > > > > > At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kernel.org> wrote:
> > > > > > > > > >Hi,
> > > > > > > > > >
> > > > > > > > > >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> > > > > > > > > >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wrote:
> > > > > > > > > >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> > > > > > > > > >> >>With the bridges switching over to drm_bridge_connector, the direct
> > > > > > > > > >> >>association between a bridge driver and its connector was lost.
> > > > > > > > > >> >>
> > > > > > > > > >> >>This is mitigated for atomic bridge drivers by the fact you can access
> > > > > > > > > >> >>the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> > > > > > > > > >> >>drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> > > > > > > > > >> >>
> > > > > > > > > >> >>This was also made easier by providing drm_atomic_state directly to all
> > > > > > > > > >> >>atomic hooks bridges can implement.
> > > > > > > > > >> >>
> > > > > > > > > >> >>However, bridge drivers don't have a way to access drm_atomic_state
> > > > > > > > > >> >>outside of the modeset path, like from the hotplug interrupt path or any
> > > > > > > > > >> >>interrupt handler.
> > > > > > > > > >> >>
> > > > > > > > > >> >>Let's introduce a function to retrieve the connector currently assigned
> > > > > > > > > >> >>to an encoder, without using drm_atomic_state, to make these drivers'
> > > > > > > > > >> >>life easier.
> > > > > > > > > >> >>
> > > > > > > > > >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > > >> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > > > > >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > > > >> >>---
> > > > > > > > > >> >> drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > > > >> >> include/drm/drm_atomic.h     |  3 +++
> > > > > > > > > >> >> 2 files changed, 48 insertions(+)
> > > > > > > > > >> >>
> > > > > > > > > >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > > > > > > > >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> > > > > > > > > >> >>--- a/drivers/gpu/drm/drm_atomic.c
> > > > > > > > > >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> > > > > > > > > >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
> > > > > > > > > >> >> 
> > > > > > > > > >> >> 	return NULL;
> > > > > > > > > >> >> }
> > > > > > > > > >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > > > > > > > > >> >> 
> > > > > > > > > >> >>+/**
> > > > > > > > > >> >>+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
> > > > > > > > > >> >>+ * @encoder: The encoder to find the connector of
> > > > > > > > > >> >>+ * @ctx: Modeset locking context
> > > > > > > > > >> >>+ *
> > > > > > > > > >> >>+ * This function finds and returns the connector currently assigned to
> > > > > > > > > >> >>+ * an @encoder.
> > > > > > > > > >> >>+ *
> > > > > > > > > >> >>+ * Returns:
> > > > > > > > > >> >>+ * The connector connected to @encoder, or an error pointer otherwise.
> > > > > > > > > >> >>+ * When the error is EDEADLK, a deadlock has been detected and the
> > > > > > > > > >> >>+ * sequence must be restarted.
> > > > > > > > > >> >>+ */
> > > > > > > > > >> >>+struct drm_connector *
> > > > > > > > > >> >>+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> > > > > > > > > >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> > > > > > > > > >> >>+{
> > > > > > > > > >> >>+	struct drm_connector_list_iter conn_iter;
> > > > > > > > > >> >>+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
> > > > > > > > > >> >>+	struct drm_connector *connector;
> > > > > > > > > >> >>+	struct drm_device *dev = encoder->dev;
> > > > > > > > > >> >>+	int ret;
> > > > > > > > > >> >>+
> > > > > > > > > >> >>+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > > > > > > > > >> >>+	if (ret)
> > > > > > > > > >> >>+		return ERR_PTR(ret);
> > > > > > > > > >> >
> > > > > > > > > >> >It seems that this will cause a deadlock when called from a  hotplug handling path,
> > > > > > > > > >> >I have a WIP DP diver[0],  which suggested by Dmitry to use this API from a 
> > > > > > > > > >> >&drm_bridge_funcs.detect callback to get the connector,  as detect is called by drm_helper_probe_detect,
> > > > > > > > > >> >which will hold connection_mutex first, so the deaklock happens:
> > > > > > > > > >> >
> > > > > > > > > >> >
> > > > > > > > > >> >drm_helper_probe_detect(struct drm_connector *connector,
> > > > > > > > > >> >                        struct drm_modeset_acquire_ctx *ctx,
> > > > > > > > > >> >                        bool force)
> > > > > > > > > >> >{
> > > > > > > > > >> >        const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > > > > > > > > >> >        struct drm_device *dev = connector->dev;
> > > > > > > > > >> >        int ret;
> > > > > > > > > >> >
> > > > > > > > > >> >        if (!ctx)
> > > > > > > > > >> >                return drm_helper_probe_detect_ctx(connector, force);
> > > > > > > > > >> >
> > > > > > > > > >> >        ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> > > > > > > > > >> >        if (ret)
> > > > > > > > > >> >                return ret;
> > > > > > > > > >> >
> > > > > > > > > >> >        if (funcs->detect_ctx)
> > > > > > > > > >> >                ret = funcs->detect_ctx(connector, ctx, force);
> > > > > > > > > >> >        else if (connector->funcs->detect)
> > > > > > > > > >> >                ret = connector->funcs->detect(connector, force);
> > > > > > > > > >> >        else
> > > > > > > > > >> >                ret = connector_status_connected;
> > > > > > > > > >> >
> > > > > > > > > >> >        if (ret != connector->status)
> > > > > > > > > >> >                connector->epoch_counter += 1;
> > > > > > > > > >> >
> > > > > > > > > >> >So I wonder can we let drm_bridge_funcs.detect pass a connector for this case ?
> > > > > > > > > >> >
> > > > > > > > > >> >
> > > > > > > > > >> >
> > > > > > > > > >> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f094
> > > > > > > > > >> >>+
> > > > > > > > > >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > > > > > >> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> > > > > > > > > >> >>+		if (!connector->state)
> > > > > > > > > >> >>+			continue;
> > > > > > > > > >> >>+
> > > > > > > > > >> >>+		if (encoder == connector->state->best_encoder) {
> > > > > > > > > >> >>+			out_connector = connector;
> > > > > > > > > >> 
> > > > > > > > > >> 
> > > > > > > > > >> When try to use this patch in my bridge driver,  I found that the connector->state->best_encoder 
> > > > > > > > > >>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge_funcs.detect_ctx is  called:
> > > > > > > > > >> 
> > > > > > > > > >> [   52.713030] Invalid return value -22 for connector detection
> > > > > > > > > >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/drm/drm_probe_helper.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> > > > > > > > > >> 0x63c
> > > > > > > > > >> [   52.714568] Modules linked in:
> > > > > > > > > >> 
> > > > > > > > > >> [   52.724546] Call trace:
> > > > > > > > > >> [   52.724762]  drm_helper_probe_single_connector_modes+0x5e0/0x63c (P)
> > > > > > > > > >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> > > > > > > > > >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> > > > > > > > > >> [   52.726057]  drm_ioctl+0x22c/0x544
> > > > > > > > > >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> > > > > > > > > >> [   52.726706]  invoke_syscall+0x44/0x100
> > > > > > > > > >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
> > > > > > > > > >> 
> > > > > > > > > >> This is because  best_encoder is set by set_best_encoder, which is called from
> > > > > > > > > >> drm_atomic_helper_check_modeset. When we call drm_mode_getconnector 
> > > > > > > > > >> for the first time, the functions mentioned above have not been called yet,
> > > > > > > > > >> then we can't match the encoder from connector->state->best_encoder for this case.
> > > > > > > > > >
> > > > > > > > > >As far as I'm concerned, it's by design. Encoders and connectors have
> > > > > > > > > >1:N relationship, and only once a connector has been enabled it has an
> > > > > > > > > >encoder.
> > > > > > > > > >
> > > > > > > > > >If the connector is disabled, there's no associated encoder.
> > > > > > > > > 
> > > > > > > > > Does this prove that this API is not suitable for my application scenario: 
> > > > > > > > > Get the connector in the bridge's .detect callback, so this means that I may
> > > > > > > > > still need to modify the bridge's connector callback so that it can pass the connector ?
> > > > > > > > 
> > > > > > > > I'd say, yes, please.
> > > > > > > 
> > > > > > > And I'd say no :)
> > > > > > 
> > > > > > Fair enough :-)
> > > > > > 
> > > > > > > There's no reason to deviate from the API other entities have here. It's
> > > > > > > just that the switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR hasn't been
> > > > > > > completely thought through and it's one of the part where it shows.
> > > > > > > 
> > > > > > > We have two alternative solutions: Either the driver creates the
> > > > > > > connector itself, since it doesn't seem to use any downstream bridge
> > > > > > > anyway, or we need a new bridge helper to find the connector on a bridge
> > > > > > > chain.
> > > > > > > 
> > > > > > > We have the iterator already, we just need a new accessor to retrieve
> > > > > > > the (optional) connector of a bridge, and if there's none, go to the
> > > > > > > next bridge and try again.
> > > > > > 
> > > > > > The problem is that there is no guarantee that the the created connector
> > > > > > is created for or linked to any bridge. For example, for msm driver I'm
> > > > > > waiting for several series to go in, but after that I plan to work on
> > > > > > moving connector creation to the generic code within the msm driver.
> > > > > > 
> > > > > > In other words, with DRM_BRIDGE_ATTACH_NO_CONNECTOR in place it is
> > > > > > perfectly legit not to have a bridge which has "connector of a bridge".
> > > > > > It is possible to create drm_bridge_connector on the drm_encoder's side
> > > > > > after the drm_bridge_attach() succeeds.
> > > > > 
> > > > > Sure, but then I'd expect detect and get_modes to only be called *after*
> > > > > that connector has been created, right?
> > > > 
> > > > Yes. But you can not get the connector by following bridge chain. Well,
> > > > unless you include encoder into the chain. If that's what you have had
> > > > in mind, then please excuse me, I didn't understand that from the
> > > > beginning.
> > > 
> > > You can't include the encoder either, because the encoder doesn't have a
> > > connector assigned yet at that time.
> > > 
> > > However, you can:
> > > 
> > >   - Store the bridge attach flags in drm_bridge
> > > 
> > >   - Create a hook that returns the connector a bridge creates, depending
> > >     on the attach flags.
> > > 
> > >   - Create a helper that iterates over the next bridges until the
> > >     previous hook returns !NULL. If it doesn't find anything, return
> > >     NULL.
> > > 
> > > AFAIK, it solves all the problems being discussed here, while dealing
> > > with legacy and new-style bridge drivers.
> > 
> > I'm still fail to understand how does that solve the issue for new-style
> > bridges. How do we find the created drm_bridge_connector for them?
> 
> Sigh, for some reason I was remembering that drm_bridge_connector was a
> bridge itself, which it isn't. My bad. But I guess it still applies. If
> we make drm_bridge_connector a bridge, then it works, doesn't it?

I'd rather not. This would complicate other bridges using
drm_bridge_connector (e.g. ite-it6263, ti-sn65dsi86)

> > > > But frankly speaking, I think it might be easier to pass down the
> > > > connector to the detect callback (as drm_connector_funcs.detect already
> > > > gets the connecor) rather than making bridge drivers go through the
> > > > chain to get the value that is already present in the caller function.
> > > > 
> > > > (For some other usecases I'd totally agree with you, especially if the
> > > > connector isn't already available on the caller side).
> > > 
> > > Still, we've tried to converge to the same API for all entities, it
> > > feels like a step backward to me.
> > 
> > I'd argue here a bit. The drm_connector interface has connector here.
> > drm_bridge is an extension/subpart of the drm_connector, so it would be
> > logical to extend that interface.
> 
> The drm_connector interface has the connector because it's a connector.
> Just like CRTC atomic_check has a crtc, but you wouldn't pass the crtc
> pointer to drm_bridge atomic_check.
> 
> I still think it goes against the trend and work we've been doing over
> the years. And we should at least *try* something different instead of
> just taking the easy way out. Or accepting to duplicate the helpers that
> started the discussion, or to create a connector directyl instead of
> using drm_bridge_connector for that driver.

I think passing drm_connector and drm_bridge matches the pattern started
by edid_read() and several hdmi_audio_*() callbacks. They are receiving
both the bridge and the connector for exactly the same reason - the
callbacks needs both _and_ the connector is well known in the calling
code.

-- 
With best wishes
Dmitry
