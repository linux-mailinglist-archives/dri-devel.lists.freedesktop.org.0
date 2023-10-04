Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60787B862D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 19:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0010E13E;
	Wed,  4 Oct 2023 17:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7719D10E13E;
 Wed,  4 Oct 2023 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439624; x=1727975624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gixIu0V0MiL3BRnYSNPZmtpwbbVrgOBb3fs/pZ9aVno=;
 b=eUIo4bGppHqunxjrKFrHrd5JarlaRiCYBZ1QvfqjnuLka6c/3nLOJMlp
 foEWMbTXDqHtr0IcAAXhJwOu67K/DJFDoLfOdsRaoVtB7hFW/EBu2OITd
 cRfky2jtDQ6MMhARQ1wZ+jzFit5u3Gq/QJb3Rd2O5uSdNHBBTOzq+GaQi
 /4MN0NyAjx9Oh7pXhAsP5PoJicF9adFe4QsjvMGEJC51nPOiEH/o4uBOG
 QPg+SpsQIb4W8d8brlRnsqcAXZ/9JnQkV+mK7MvDZwioVaDyjV4z/QVwY
 NFgtFvPc53vzo4+h3NRsnY9l9IOOWlVhZamlUv9xBYv5U7dyS28Wgb9FF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380516318"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="380516318"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728096283"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="728096283"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga006.jf.intel.com with SMTP; 04 Oct 2023 10:13:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 04 Oct 2023 20:13:39 +0300
Date: Wed, 4 Oct 2023 20:13:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/dp: switch drm_dp_downstream_*() helpers
 to struct drm_edid
Message-ID: <ZR2dQ0YZ-1pcn5p6@intel.com>
References: <20231004162149.2802113-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004162149.2802113-1-jani.nikula@intel.com>
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

On Wed, Oct 04, 2023 at 07:21:49PM +0300, Jani Nikula wrote:
> Prefer struct drm_edid where possible. With limited users for the
> drm_dp_downstream_*() helpers, this is fairly straightforward.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 39 ++++++++++---------
>  .../drm/i915/display/intel_display_debugfs.c  |  3 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 10 ++---
>  include/drm/display/drm_dp_helper.h           | 12 +++---
>  4 files changed, 31 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 8a1b64c57dfd..f3680f4e6970 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -746,8 +746,11 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
>  
> -static bool is_edid_digital_input_dp(const struct edid *edid)
> +static bool is_edid_digital_input_dp(const struct drm_edid *drm_edid)
>  {
> +	/* FIXME: get rid of drm_edid_raw() */
> +	const struct edid *edid = drm_edid_raw(drm_edid);
> +
>  	return edid && edid->revision >= 4 &&
>  		edid->input & DRM_EDID_INPUT_DIGITAL &&
>  		(edid->input & DRM_EDID_DIGITAL_TYPE_MASK) == DRM_EDID_DIGITAL_TYPE_DP;
> @@ -779,13 +782,13 @@ EXPORT_SYMBOL(drm_dp_downstream_is_type);
>   * drm_dp_downstream_is_tmds() - is the downstream facing port TMDS?
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
> - * @edid: EDID
> + * @drm_edid: EDID
>   *
>   * Returns: whether the downstream facing port is TMDS (HDMI/DVI).
>   */
>  bool drm_dp_downstream_is_tmds(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			       const u8 port_cap[4],
> -			       const struct edid *edid)
> +			       const struct drm_edid *drm_edid)
>  {
>  	if (dpcd[DP_DPCD_REV] < 0x11) {
>  		switch (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK) {
> @@ -798,7 +801,7 @@ bool drm_dp_downstream_is_tmds(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  
>  	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
> -		if (is_edid_digital_input_dp(edid))
> +		if (is_edid_digital_input_dp(drm_edid))
>  			return false;
>  		fallthrough;
>  	case DP_DS_PORT_TYPE_DVI:
> @@ -1036,14 +1039,14 @@ EXPORT_SYMBOL(drm_dp_downstream_max_dotclock);
>   * drm_dp_downstream_max_tmds_clock() - extract downstream facing port max TMDS clock
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
> - * @edid: EDID
> + * @drm_edid: EDID
>   *
>   * Returns: HDMI/DVI downstream facing port max TMDS clock in kHz on success,
>   * or 0 if max TMDS clock not defined
>   */
>  int drm_dp_downstream_max_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				     const u8 port_cap[4],
> -				     const struct edid *edid)
> +				     const struct drm_edid *drm_edid)
>  {
>  	if (!drm_dp_is_branch(dpcd))
>  		return 0;
> @@ -1059,7 +1062,7 @@ int drm_dp_downstream_max_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  
>  	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
> -		if (is_edid_digital_input_dp(edid))
> +		if (is_edid_digital_input_dp(drm_edid))
>  			return 0;
>  		/*
>  		 * It's left up to the driver to check the
> @@ -1101,14 +1104,14 @@ EXPORT_SYMBOL(drm_dp_downstream_max_tmds_clock);
>   * drm_dp_downstream_min_tmds_clock() - extract downstream facing port min TMDS clock
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
> - * @edid: EDID
> + * @drm_edid: EDID
>   *
>   * Returns: HDMI/DVI downstream facing port min TMDS clock in kHz on success,
>   * or 0 if max TMDS clock not defined
>   */
>  int drm_dp_downstream_min_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				     const u8 port_cap[4],
> -				     const struct edid *edid)
> +				     const struct drm_edid *drm_edid)
>  {
>  	if (!drm_dp_is_branch(dpcd))
>  		return 0;
> @@ -1124,7 +1127,7 @@ int drm_dp_downstream_min_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  
>  	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
> -		if (is_edid_digital_input_dp(edid))
> +		if (is_edid_digital_input_dp(drm_edid))
>  			return 0;
>  		fallthrough;
>  	case DP_DS_PORT_TYPE_DVI:
> @@ -1145,13 +1148,13 @@ EXPORT_SYMBOL(drm_dp_downstream_min_tmds_clock);
>   *                               bits per component
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: downstream facing port capabilities
> - * @edid: EDID
> + * @drm_edid: EDID
>   *
>   * Returns: Max bpc on success or 0 if max bpc not defined
>   */
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			      const u8 port_cap[4],
> -			      const struct edid *edid)
> +			      const struct drm_edid *drm_edid)
>  {
>  	if (!drm_dp_is_branch(dpcd))
>  		return 0;
> @@ -1169,7 +1172,7 @@ int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  	case DP_DS_PORT_TYPE_DP:
>  		return 0;
>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
> -		if (is_edid_digital_input_dp(edid))
> +		if (is_edid_digital_input_dp(drm_edid))
>  			return 0;
>  		fallthrough;
>  	case DP_DS_PORT_TYPE_HDMI:
> @@ -1362,14 +1365,14 @@ EXPORT_SYMBOL(drm_dp_downstream_id);
>   * @m: pointer for debugfs file
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
> - * @edid: EDID
> + * @drm_edid: EDID
>   * @aux: DisplayPort AUX channel
>   *
>   */
>  void drm_dp_downstream_debug(struct seq_file *m,
>  			     const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			     const u8 port_cap[4],
> -			     const struct edid *edid,
> +			     const struct drm_edid *drm_edid,
>  			     struct drm_dp_aux *aux)
>  {
>  	bool detailed_cap_info = dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> @@ -1432,15 +1435,15 @@ void drm_dp_downstream_debug(struct seq_file *m,
>  		if (clk > 0)
>  			seq_printf(m, "\t\tMax dot clock: %d kHz\n", clk);
>  
> -		clk = drm_dp_downstream_max_tmds_clock(dpcd, port_cap, edid);
> +		clk = drm_dp_downstream_max_tmds_clock(dpcd, port_cap, drm_edid);
>  		if (clk > 0)
>  			seq_printf(m, "\t\tMax TMDS clock: %d kHz\n", clk);
>  
> -		clk = drm_dp_downstream_min_tmds_clock(dpcd, port_cap, edid);
> +		clk = drm_dp_downstream_min_tmds_clock(dpcd, port_cap, drm_edid);
>  		if (clk > 0)
>  			seq_printf(m, "\t\tMin TMDS clock: %d kHz\n", clk);
>  
> -		bpc = drm_dp_downstream_max_bpc(dpcd, port_cap, edid);
> +		bpc = drm_dp_downstream_max_bpc(dpcd, port_cap, drm_edid);
>  
>  		if (bpc > 0)
>  			seq_printf(m, "\t\tMax bpc: %d\n", bpc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index f6d7c4d45fae..fbe75d47a165 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -237,14 +237,13 @@ static void intel_dp_info(struct seq_file *m, struct intel_connector *connector)
>  {
>  	struct intel_encoder *intel_encoder = intel_attached_encoder(connector);
>  	struct intel_dp *intel_dp = enc_to_intel_dp(intel_encoder);
> -	const struct edid *edid = drm_edid_raw(connector->detect_edid);
>  
>  	seq_printf(m, "\tDPCD rev: %x\n", intel_dp->dpcd[DP_DPCD_REV]);
>  	seq_printf(m, "\taudio support: %s\n",
>  		   str_yes_no(connector->base.display_info.has_audio));
>  
>  	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
> -				edid, &intel_dp->aux);
> +				connector->detect_edid, &intel_dp->aux);
>  }
>  
>  static void intel_dp_mst_info(struct seq_file *m,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index f0f43aeabd21..0ef7cb8134b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5207,14 +5207,10 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_connector *connector = intel_dp->attached_connector;
> -	const struct edid *edid;
> -
> -	/* FIXME: Get rid of drm_edid_raw() */
> -	edid = drm_edid_raw(drm_edid);
>  
>  	intel_dp->dfp.max_bpc =
>  		drm_dp_downstream_max_bpc(intel_dp->dpcd,
> -					  intel_dp->downstream_ports, edid);
> +					  intel_dp->downstream_ports, drm_edid);
>  
>  	intel_dp->dfp.max_dotclock =
>  		drm_dp_downstream_max_dotclock(intel_dp->dpcd,
> @@ -5223,11 +5219,11 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>  	intel_dp->dfp.min_tmds_clock =
>  		drm_dp_downstream_min_tmds_clock(intel_dp->dpcd,
>  						 intel_dp->downstream_ports,
> -						 edid);
> +						 drm_edid);
>  	intel_dp->dfp.max_tmds_clock =
>  		drm_dp_downstream_max_tmds_clock(intel_dp->dpcd,
>  						 intel_dp->downstream_ports,
> -						 edid);
> +						 drm_edid);
>  
>  	intel_dp->dfp.pcon_max_frl_bw =
>  		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 3369104e2d25..3d74b2cec72f 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -272,8 +272,8 @@ struct drm_dp_aux_msg {
>  };
>  
>  struct cec_adapter;
> -struct edid;
>  struct drm_connector;
> +struct drm_edid;
>  
>  /**
>   * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
> @@ -507,18 +507,18 @@ bool drm_dp_downstream_is_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			       const u8 port_cap[4], u8 type);
>  bool drm_dp_downstream_is_tmds(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			       const u8 port_cap[4],
> -			       const struct edid *edid);
> +			       const struct drm_edid *drm_edid);
>  int drm_dp_downstream_max_dotclock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				   const u8 port_cap[4]);
>  int drm_dp_downstream_max_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				     const u8 port_cap[4],
> -				     const struct edid *edid);
> +				     const struct drm_edid *drm_edid);
>  int drm_dp_downstream_min_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				     const u8 port_cap[4],
> -				     const struct edid *edid);
> +				     const struct drm_edid *drm_edid);
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			      const u8 port_cap[4],
> -			      const struct edid *edid);
> +			      const struct drm_edid *drm_edid);
>  bool drm_dp_downstream_420_passthrough(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				       const u8 port_cap[4]);
>  bool drm_dp_downstream_444_to_420_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> @@ -530,7 +530,7 @@ int drm_dp_downstream_id(struct drm_dp_aux *aux, char id[6]);
>  void drm_dp_downstream_debug(struct seq_file *m,
>  			     const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			     const u8 port_cap[4],
> -			     const struct edid *edid,
> +			     const struct drm_edid *drm_edid,
>  			     struct drm_dp_aux *aux);
>  enum drm_mode_subconnector
>  drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
