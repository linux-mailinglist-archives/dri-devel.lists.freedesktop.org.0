Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791774E9DB4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A5310E746;
	Mon, 28 Mar 2022 17:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B706710E742;
 Mon, 28 Mar 2022 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648489270; x=1680025270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q1QL/b70nS2EGKrCbWjDxZu5WPq40/49whRR+jSV0kg=;
 b=EXhCa2qaL3JfI+faRzsYvH7EWzanMuoMi/c27ajNZ49RCZ280WR/440y
 hCpPnrRflTVELj8Ya0+i+MX+WDvpo+5dhfADh+7PnTE/YqqhK3ZwfRJcp
 n8RJfguMZV+bRhrqh66VN5G5j2HVIQ01vdd8HQY2rfvtvHZwjgnGe6kJ+
 VUPqJwu7gr/wtZ6BpDeCsEuiiEReyGEBBdposxt8LcHr52sPUp6SEavy1
 WZ8W4apGcerRY1yD8P12hoj6XbRyctrOCTWG0psGbbW7gK8TsFBVDFIYk
 87YRhpBXzZBhPioo3zgmelP9KhE9NCGNcFDJ3isL132PqUwJffhC7ob7L g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="256641057"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="256641057"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="694443617"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga001.fm.intel.com with SMTP; 28 Mar 2022 10:41:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:41:06 +0300
Date: Mon, 28 Mar 2022 20:41:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 11/12] drm/edid: add more general struct edid
 constness in the interfaces
Message-ID: <YkHzMoSxLhsEWnvY@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <c7156f22494b585c55a00a6732462bde0cc19dbf.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7156f22494b585c55a00a6732462bde0cc19dbf.1648477901.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 05:34:32PM +0300, Jani Nikula wrote:
> With this, the remaining non-const parts are the ones that actually
> modify the EDID, for example to fix corrupt EDID.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 21 +++++++++++----------
>  include/drm/drm_edid.h     | 10 +++++-----
>  2 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 625fa6a4a93a..d1abaa517867 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2150,7 +2150,7 @@ static u32 edid_extract_panel_id(const struct edid *edid)
>  
>  u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
>  {
> -	struct edid *edid;
> +	const struct edid *edid;
>  	u32 panel_id;
>  
>  	edid = drm_do_get_edid_base_block(NULL, drm_do_probe_ddc_edid, adapter);
> @@ -3664,7 +3664,7 @@ static bool drm_valid_hdmi_vic(u8 vic)
>  }
>  
>  static int
> -add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
> +add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *mode, *tmp;
> @@ -4345,7 +4345,7 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>  }
>  
>  static int
> -add_cea_modes(struct drm_connector *connector, struct edid *edid)
> +add_cea_modes(struct drm_connector *connector, const struct edid *edid)
>  {
>  	const u8 *cea = drm_find_cea_extension(edid);
>  	const u8 *db, *hdmi = NULL, *video = NULL;
> @@ -4551,7 +4551,7 @@ static int get_monitor_name(const struct edid *edid, char name[13])
>   * @bufsize: The size of the name buffer (should be at least 14 chars.)
>   *
>   */
> -void drm_edid_get_monitor_name(struct edid *edid, char *name, int bufsize)
> +void drm_edid_get_monitor_name(const struct edid *edid, char *name, int bufsize)
>  {
>  	int name_length;
>  	char buf[13];
> @@ -4585,7 +4585,8 @@ static void clear_eld(struct drm_connector *connector)
>   * Fill the ELD (EDID-Like Data) buffer for passing to the audio driver. The
>   * HDCP and Port_ID ELD fields are left for the graphics driver to fill in.
>   */
> -static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
> +static void drm_edid_to_eld(struct drm_connector *connector,
> +			    const struct edid *edid)
>  {
>  	uint8_t *eld = connector->eld;
>  	const u8 *cea;
> @@ -4681,7 +4682,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
>   *
>   * Return: The number of found SADs or negative number on error.
>   */
> -int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
> +int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
>  {
>  	int count = 0;
>  	int i, start, end, dbl;
> @@ -4743,7 +4744,7 @@ EXPORT_SYMBOL(drm_edid_to_sad);
>   * Return: The number of found Speaker Allocation Blocks or negative number on
>   * error.
>   */
> -int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
> +int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
>  {
>  	int count = 0;
>  	int i, start, end, dbl;
> @@ -4838,7 +4839,7 @@ EXPORT_SYMBOL(drm_av_sync_delay);
>   *
>   * Return: True if the monitor is HDMI, false if not or unknown.
>   */
> -bool drm_detect_hdmi_monitor(struct edid *edid)
> +bool drm_detect_hdmi_monitor(const struct edid *edid)
>  {
>  	const u8 *edid_ext;
>  	int i;
> @@ -4876,7 +4877,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
>   *
>   * Return: True if the monitor supports audio, false otherwise.
>   */
> -bool drm_detect_monitor_audio(struct edid *edid)
> +bool drm_detect_monitor_audio(const struct edid *edid)
>  {
>  	const u8 *edid_ext;
>  	int i, j;
> @@ -5543,7 +5544,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>  }
>  
>  static int add_displayid_detailed_modes(struct drm_connector *connector,
> -					struct edid *edid)
> +					const struct edid *edid)
>  {
>  	const struct displayid_block *block;
>  	struct displayid_iter iter;
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..48b1bf9c315a 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -372,8 +372,8 @@ struct drm_connector;
>  struct drm_connector_state;
>  struct drm_display_mode;
>  
> -int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
> -int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> +int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads);
> +int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
>  int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);
>  
> @@ -569,8 +569,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
>  int drm_add_override_edid_modes(struct drm_connector *connector);
>  
>  u8 drm_match_cea_mode(const struct drm_display_mode *to_match);
> -bool drm_detect_hdmi_monitor(struct edid *edid);
> -bool drm_detect_monitor_audio(struct edid *edid);
> +bool drm_detect_hdmi_monitor(const struct edid *edid);
> +bool drm_detect_monitor_audio(const struct edid *edid);
>  enum hdmi_quantization_range
>  drm_default_rgb_quant_range(const struct drm_display_mode *mode);
>  int drm_add_modes_noedid(struct drm_connector *connector,
> @@ -582,7 +582,7 @@ int drm_edid_header_is_valid(const u8 *raw_edid);
>  bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
>  			  bool *edid_corrupt);
>  bool drm_edid_is_valid(struct edid *edid);
> -void drm_edid_get_monitor_name(struct edid *edid, char *name,
> +void drm_edid_get_monitor_name(const struct edid *edid, char *name,
>  			       int buflen);
>  struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>  					   int hsize, int vsize, int fresh,
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
