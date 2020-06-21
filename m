Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C047D2029A0
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 10:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB42C6E1D7;
	Sun, 21 Jun 2020 08:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D246E1D7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 08:27:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C1FD020028;
 Sun, 21 Jun 2020 10:27:47 +0200 (CEST)
Date: Sun, 21 Jun 2020 10:27:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 09/27] drm: edid: Constify connector argument to
 infoframe functions
Message-ID: <20200621082746.GL74146@ravnborg.org>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-10-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526011505.31884-10-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=7bcR2ZnlydvOFXS2xQoA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 04:14:47AM +0300, Laurent Pinchart wrote:
> The drm_hdmi_avi_infoframe_from_display_mode(),
> drm_hdmi_vendor_infoframe_from_display_mode() and
> drm_hdmi_avi_infoframe_quant_range() functions take a drm_connector that
> they don't modify. Mark it as const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 12 ++++++------
>  include/drm/drm_edid.h     |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3bd95c4b02eb..e6b26f16c21f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5365,7 +5365,7 @@ void drm_set_preferred_mode(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_set_preferred_mode);
>  
> -static bool is_hdmi2_sink(struct drm_connector *connector)
> +static bool is_hdmi2_sink(const struct drm_connector *connector)
>  {
>  	/*
>  	 * FIXME: sil-sii8620 doesn't have a connector around when
> @@ -5450,7 +5450,7 @@ drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
>  }
>  EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>  
> -static u8 drm_mode_hdmi_vic(struct drm_connector *connector,
> +static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
>  			    const struct drm_display_mode *mode)
>  {
>  	bool has_hdmi_infoframe = connector ?
> @@ -5466,7 +5466,7 @@ static u8 drm_mode_hdmi_vic(struct drm_connector *connector,
>  	return drm_match_hdmi_mode(mode);
>  }
>  
> -static u8 drm_mode_cea_vic(struct drm_connector *connector,
> +static u8 drm_mode_cea_vic(const struct drm_connector *connector,
>  			   const struct drm_display_mode *mode)
>  {
>  	u8 vic;
> @@ -5504,7 +5504,7 @@ static u8 drm_mode_cea_vic(struct drm_connector *connector,
>   */
>  int
>  drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
> -					 struct drm_connector *connector,
> +					 const struct drm_connector *connector,
>  					 const struct drm_display_mode *mode)
>  {
>  	enum hdmi_picture_aspect picture_aspect;
> @@ -5651,7 +5651,7 @@ EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorspace);
>   */
>  void
>  drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
> -				   struct drm_connector *connector,
> +				   const struct drm_connector *connector,
>  				   const struct drm_display_mode *mode,
>  				   enum hdmi_quantization_range rgb_quant_range)
>  {
> @@ -5755,7 +5755,7 @@ s3d_structure_from_display_mode(const struct drm_display_mode *mode)
>   */
>  int
>  drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
> -					    struct drm_connector *connector,
> +					    const struct drm_connector *connector,
>  					    const struct drm_display_mode *mode)
>  {
>  	/*
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 34b15e3d070c..43254319ab19 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -361,11 +361,11 @@ drm_load_edid_firmware(struct drm_connector *connector)
>  
>  int
>  drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
> -					 struct drm_connector *connector,
> +					 const struct drm_connector *connector,
>  					 const struct drm_display_mode *mode);
>  int
>  drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
> -					    struct drm_connector *connector,
> +					    const struct drm_connector *connector,
>  					    const struct drm_display_mode *mode);
>  
>  void
> @@ -378,7 +378,7 @@ drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
>  
>  void
>  drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
> -				   struct drm_connector *connector,
> +				   const struct drm_connector *connector,
>  				   const struct drm_display_mode *mode,
>  				   enum hdmi_quantization_range rgb_quant_range);
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
