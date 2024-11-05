Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E138A9BC5CE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 07:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB66010E27A;
	Tue,  5 Nov 2024 06:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="DS1U727c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Tue, 05 Nov 2024 06:42:40 UTC
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F203410E117;
 Tue,  5 Nov 2024 06:42:40 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1730788434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTAKhxSFE8FvW11nxBit6CA7OkWpY8iwgm9r8H8Xrpg=;
 b=DS1U727cQQMKiGKjgi2ySybSh4sSk1DLW74/mB4SFQndpIqZSVN9n2j3+nXkmTPOuBRegb
 aA5s0UDKAOW3aMIUF2+0upqJriMxm2OMYgf4bfFIIe/IPGnUJlG7nJlsJHkzxI/rWNpVDU
 EfN5SJha5Nr6CjWfQIjbQYpVToL8XtrOAT6bIrMeKjRy4wBXxi8+uETESOSHISskujzuLC
 f1NWpEGJe3wnaTf6M9QZ9ZIurGL82YDS9nEj25ywbtKmQWwvVg91CtFjgtZ/lWovt0YqKM
 Heqy5jDSjKvF/hrql62SqOniX0/mTOU4GuHVWnlSxmMkVd1w9CGi6HClfE2OAQ==
Date: Tue, 05 Nov 2024 07:33:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm: Use of_property_present() for non-boolean properties
In-Reply-To: <20241104190636.274926-1-robh@kernel.org>
References: <20241104190636.274926-1-robh@kernel.org>
Message-ID: <16acf71de2a7d23f979ce286b2d8f606@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Hello Rob,

On 2024-11-04 20:06, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Looking good to me, thanks for the patch!

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  drivers/gpu/drm/bridge/sii902x.c     | 2 +-
>  drivers/gpu/drm/drm_panel.c          | 2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c
> b/drivers/gpu/drm/bridge/ite-it66121.c
> index 925e42f46cd8..0eae7c01b975 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1480,7 +1480,7 @@ static int it66121_audio_codec_init(struct
> it66121_ctx *ctx, struct device *dev)
> 
>  	dev_dbg(dev, "%s\n", __func__);
> 
> -	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
>  		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/bridge/sii902x.c 
> b/drivers/gpu/drm/bridge/sii902x.c
> index 7f91b0db161e..f73e1174a5ad 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -850,7 +850,7 @@ static int sii902x_audio_codec_init(struct sii902x 
> *sii902x,
>  	u8 lanes[4];
>  	int num_lanes, i;
> 
> -	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
>  		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
>  			__func__);
>  		return 0;
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 19ab0a794add..46d61cc871ca 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -413,7 +413,7 @@ bool drm_is_panel_follower(struct device *dev)
>  	 * don't bother trying to parse it here. We just need to know if the
>  	 * property is there.
>  	 */
> -	return of_property_read_bool(dev->of_node, "panel");
> +	return of_property_present(dev->of_node, "panel");
>  }
>  EXPORT_SYMBOL(drm_is_panel_follower);
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf37..78cac4ecc58f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1831,7 +1831,7 @@ static int dsi_host_parse_dt(struct msm_dsi_host
> *msm_host)
>  		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
>  	ret = 0;
> 
> -	if (of_property_read_bool(np, "syscon-sfpb")) {
> +	if (of_property_present(np, "syscon-sfpb")) {
>  		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
>  					"syscon-sfpb");
>  		if (IS_ERR(msm_host->sfpb)) {
