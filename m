Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7E7B9FF5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 16:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8F110E410;
	Thu,  5 Oct 2023 14:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DBD10E079;
 Thu,  5 Oct 2023 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696516374; x=1728052374;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4jks0ZIE9Zt2GP39+4tdQfhubYVQ9Bp00u732sa/8Sw=;
 b=aRcA9D8k6xihz9koHn/s9wLKFlHZwr2eXtU/FVlvksaBCrjhAkm7EDg1
 5YTDuW0n4WGBCvyP1/yuj7n5D5m4R7Yd0Mal8TF8f+TxWhx9hK8DpAbP9
 KHi8ZO04MytV3SMBdwv4oehi+9vj8wLOqini2w5KA/qfX2HEo/j/Lppnc
 ZXBMWzgMtNRZBTC40sgnADEMDIgzi7/27l/EAVnzuuIxnk8Ce7C+3Z65Y
 ze0+ii0B2IbVQLrJ38/OJDUUnsXOy+CLAsmJBG3a9n8y3Qao/a+tXaGU4
 TR3U+SvMhV6ggyiEgr20/4cI6KiMHMcwOt8PXmP1Ujwqhh0lU/+oDHscS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="368592749"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="368592749"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728476483"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="728476483"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:30:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/dp: switch drm_dp_downstream_*()
 helpers to struct drm_edid
In-Reply-To: <ZR2dQ0YZ-1pcn5p6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231004162149.2802113-1-jani.nikula@intel.com>
 <ZR2dQ0YZ-1pcn5p6@intel.com>
Date: Thu, 05 Oct 2023 17:30:41 +0300
Message-ID: <8734ypcfam.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 04 Oct 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Oct 04, 2023 at 07:21:49PM +0300, Jani Nikula wrote:
>> Prefer struct drm_edid where possible. With limited users for the
>> drm_dp_downstream_*() helpers, this is fairly straightforward.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/display/drm_dp_helper.c       | 39 ++++++++++---------
>>  .../drm/i915/display/intel_display_debugfs.c  |  3 +-
>>  drivers/gpu/drm/i915/display/intel_dp.c       | 10 ++---
>>  include/drm/display/drm_dp_helper.h           | 12 +++---
>>  4 files changed, 31 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/d=
isplay/drm_dp_helper.c
>> index 8a1b64c57dfd..f3680f4e6970 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -746,8 +746,11 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_=
aux *aux,
>>  }
>>  EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
>>=20=20
>> -static bool is_edid_digital_input_dp(const struct edid *edid)
>> +static bool is_edid_digital_input_dp(const struct drm_edid *drm_edid)
>>  {
>> +	/* FIXME: get rid of drm_edid_raw() */
>> +	const struct edid *edid =3D drm_edid_raw(drm_edid);
>> +
>>  	return edid && edid->revision >=3D 4 &&
>>  		edid->input & DRM_EDID_INPUT_DIGITAL &&
>>  		(edid->input & DRM_EDID_DIGITAL_TYPE_MASK) =3D=3D DRM_EDID_DIGITAL_TY=
PE_DP;
>> @@ -779,13 +782,13 @@ EXPORT_SYMBOL(drm_dp_downstream_is_type);
>>   * drm_dp_downstream_is_tmds() - is the downstream facing port TMDS?
>>   * @dpcd: DisplayPort configuration data
>>   * @port_cap: port capabilities
>> - * @edid: EDID
>> + * @drm_edid: EDID
>>   *
>>   * Returns: whether the downstream facing port is TMDS (HDMI/DVI).
>>   */
>>  bool drm_dp_downstream_is_tmds(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>  			       const u8 port_cap[4],
>> -			       const struct edid *edid)
>> +			       const struct drm_edid *drm_edid)
>>  {
>>  	if (dpcd[DP_DPCD_REV] < 0x11) {
>>  		switch (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK)=
 {
>> @@ -798,7 +801,7 @@ bool drm_dp_downstream_is_tmds(const u8 dpcd[DP_RECE=
IVER_CAP_SIZE],
>>=20=20
>>  	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
>>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
>> -		if (is_edid_digital_input_dp(edid))
>> +		if (is_edid_digital_input_dp(drm_edid))
>>  			return false;
>>  		fallthrough;
>>  	case DP_DS_PORT_TYPE_DVI:
>> @@ -1036,14 +1039,14 @@ EXPORT_SYMBOL(drm_dp_downstream_max_dotclock);
>>   * drm_dp_downstream_max_tmds_clock() - extract downstream facing port =
max TMDS clock
>>   * @dpcd: DisplayPort configuration data
>>   * @port_cap: port capabilities
>> - * @edid: EDID
>> + * @drm_edid: EDID
>>   *
>>   * Returns: HDMI/DVI downstream facing port max TMDS clock in kHz on su=
ccess,
>>   * or 0 if max TMDS clock not defined
>>   */
>>  int drm_dp_downstream_max_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE=
],
>>  				     const u8 port_cap[4],
>> -				     const struct edid *edid)
>> +				     const struct drm_edid *drm_edid)
>>  {
>>  	if (!drm_dp_is_branch(dpcd))
>>  		return 0;
>> @@ -1059,7 +1062,7 @@ int drm_dp_downstream_max_tmds_clock(const u8 dpcd=
[DP_RECEIVER_CAP_SIZE],
>>=20=20
>>  	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
>>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
>> -		if (is_edid_digital_input_dp(edid))
>> +		if (is_edid_digital_input_dp(drm_edid))
>>  			return 0;
>>  		/*
>>  		 * It's left up to the driver to check the
>> @@ -1101,14 +1104,14 @@ EXPORT_SYMBOL(drm_dp_downstream_max_tmds_clock);
>>   * drm_dp_downstream_min_tmds_clock() - extract downstream facing port =
min TMDS clock
>>   * @dpcd: DisplayPort configuration data
>>   * @port_cap: port capabilities
>> - * @edid: EDID
>> + * @drm_edid: EDID
>>   *
>>   * Returns: HDMI/DVI downstream facing port min TMDS clock in kHz on su=
ccess,
>>   * or 0 if max TMDS clock not defined
>>   */
>>  int drm_dp_downstream_min_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE=
],
>>  				     const u8 port_cap[4],
>> -				     const struct edid *edid)
>> +				     const struct drm_edid *drm_edid)
>>  {
>>  	if (!drm_dp_is_branch(dpcd))
>>  		return 0;
>> @@ -1124,7 +1127,7 @@ int drm_dp_downstream_min_tmds_clock(const u8 dpcd=
[DP_RECEIVER_CAP_SIZE],
>>=20=20
>>  	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
>>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
>> -		if (is_edid_digital_input_dp(edid))
>> +		if (is_edid_digital_input_dp(drm_edid))
>>  			return 0;
>>  		fallthrough;
>>  	case DP_DS_PORT_TYPE_DVI:
>> @@ -1145,13 +1148,13 @@ EXPORT_SYMBOL(drm_dp_downstream_min_tmds_clock);
>>   *                               bits per component
>>   * @dpcd: DisplayPort configuration data
>>   * @port_cap: downstream facing port capabilities
>> - * @edid: EDID
>> + * @drm_edid: EDID
>>   *
>>   * Returns: Max bpc on success or 0 if max bpc not defined
>>   */
>>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>  			      const u8 port_cap[4],
>> -			      const struct edid *edid)
>> +			      const struct drm_edid *drm_edid)
>>  {
>>  	if (!drm_dp_is_branch(dpcd))
>>  		return 0;
>> @@ -1169,7 +1172,7 @@ int drm_dp_downstream_max_bpc(const u8 dpcd[DP_REC=
EIVER_CAP_SIZE],
>>  	case DP_DS_PORT_TYPE_DP:
>>  		return 0;
>>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
>> -		if (is_edid_digital_input_dp(edid))
>> +		if (is_edid_digital_input_dp(drm_edid))
>>  			return 0;
>>  		fallthrough;
>>  	case DP_DS_PORT_TYPE_HDMI:
>> @@ -1362,14 +1365,14 @@ EXPORT_SYMBOL(drm_dp_downstream_id);
>>   * @m: pointer for debugfs file
>>   * @dpcd: DisplayPort configuration data
>>   * @port_cap: port capabilities
>> - * @edid: EDID
>> + * @drm_edid: EDID
>>   * @aux: DisplayPort AUX channel
>>   *
>>   */
>>  void drm_dp_downstream_debug(struct seq_file *m,
>>  			     const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>  			     const u8 port_cap[4],
>> -			     const struct edid *edid,
>> +			     const struct drm_edid *drm_edid,
>>  			     struct drm_dp_aux *aux)
>>  {
>>  	bool detailed_cap_info =3D dpcd[DP_DOWNSTREAMPORT_PRESENT] &
>> @@ -1432,15 +1435,15 @@ void drm_dp_downstream_debug(struct seq_file *m,
>>  		if (clk > 0)
>>  			seq_printf(m, "\t\tMax dot clock: %d kHz\n", clk);
>>=20=20
>> -		clk =3D drm_dp_downstream_max_tmds_clock(dpcd, port_cap, edid);
>> +		clk =3D drm_dp_downstream_max_tmds_clock(dpcd, port_cap, drm_edid);
>>  		if (clk > 0)
>>  			seq_printf(m, "\t\tMax TMDS clock: %d kHz\n", clk);
>>=20=20
>> -		clk =3D drm_dp_downstream_min_tmds_clock(dpcd, port_cap, edid);
>> +		clk =3D drm_dp_downstream_min_tmds_clock(dpcd, port_cap, drm_edid);
>>  		if (clk > 0)
>>  			seq_printf(m, "\t\tMin TMDS clock: %d kHz\n", clk);
>>=20=20
>> -		bpc =3D drm_dp_downstream_max_bpc(dpcd, port_cap, edid);
>> +		bpc =3D drm_dp_downstream_max_bpc(dpcd, port_cap, drm_edid);
>>=20=20
>>  		if (bpc > 0)
>>  			seq_printf(m, "\t\tMax bpc: %d\n", bpc);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/driv=
ers/gpu/drm/i915/display/intel_display_debugfs.c
>> index f6d7c4d45fae..fbe75d47a165 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> @@ -237,14 +237,13 @@ static void intel_dp_info(struct seq_file *m, stru=
ct intel_connector *connector)
>>  {
>>  	struct intel_encoder *intel_encoder =3D intel_attached_encoder(connect=
or);
>>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(intel_encoder);
>> -	const struct edid *edid =3D drm_edid_raw(connector->detect_edid);
>>=20=20
>>  	seq_printf(m, "\tDPCD rev: %x\n", intel_dp->dpcd[DP_DPCD_REV]);
>>  	seq_printf(m, "\taudio support: %s\n",
>>  		   str_yes_no(connector->base.display_info.has_audio));
>>=20=20
>>  	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
>> -				edid, &intel_dp->aux);
>> +				connector->detect_edid, &intel_dp->aux);
>>  }
>>=20=20
>>  static void intel_dp_mst_info(struct seq_file *m,
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i=
915/display/intel_dp.c
>> index f0f43aeabd21..0ef7cb8134b6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -5207,14 +5207,10 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>>  {
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>>  	struct intel_connector *connector =3D intel_dp->attached_connector;
>> -	const struct edid *edid;
>> -
>> -	/* FIXME: Get rid of drm_edid_raw() */
>> -	edid =3D drm_edid_raw(drm_edid);
>>=20=20
>>  	intel_dp->dfp.max_bpc =3D
>>  		drm_dp_downstream_max_bpc(intel_dp->dpcd,
>> -					  intel_dp->downstream_ports, edid);
>> +					  intel_dp->downstream_ports, drm_edid);
>>=20=20
>>  	intel_dp->dfp.max_dotclock =3D
>>  		drm_dp_downstream_max_dotclock(intel_dp->dpcd,
>> @@ -5223,11 +5219,11 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>>  	intel_dp->dfp.min_tmds_clock =3D
>>  		drm_dp_downstream_min_tmds_clock(intel_dp->dpcd,
>>  						 intel_dp->downstream_ports,
>> -						 edid);
>> +						 drm_edid);
>>  	intel_dp->dfp.max_tmds_clock =3D
>>  		drm_dp_downstream_max_tmds_clock(intel_dp->dpcd,
>>  						 intel_dp->downstream_ports,
>> -						 edid);
>> +						 drm_edid);
>>=20=20
>>  	intel_dp->dfp.pcon_max_frl_bw =3D
>>  		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/d=
rm_dp_helper.h
>> index 3369104e2d25..3d74b2cec72f 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -272,8 +272,8 @@ struct drm_dp_aux_msg {
>>  };
>>=20=20
>>  struct cec_adapter;
>> -struct edid;
>>  struct drm_connector;
>> +struct drm_edid;
>>=20=20
>>  /**
>>   * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
>> @@ -507,18 +507,18 @@ bool drm_dp_downstream_is_type(const u8 dpcd[DP_RE=
CEIVER_CAP_SIZE],
>>  			       const u8 port_cap[4], u8 type);
>>  bool drm_dp_downstream_is_tmds(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>  			       const u8 port_cap[4],
>> -			       const struct edid *edid);
>> +			       const struct drm_edid *drm_edid);
>>  int drm_dp_downstream_max_dotclock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>  				   const u8 port_cap[4]);
>>  int drm_dp_downstream_max_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE=
],
>>  				     const u8 port_cap[4],
>> -				     const struct edid *edid);
>> +				     const struct drm_edid *drm_edid);
>>  int drm_dp_downstream_min_tmds_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE=
],
>>  				     const u8 port_cap[4],
>> -				     const struct edid *edid);
>> +				     const struct drm_edid *drm_edid);
>>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>  			      const u8 port_cap[4],
>> -			      const struct edid *edid);
>> +			      const struct drm_edid *drm_edid);
>>  bool drm_dp_downstream_420_passthrough(const u8 dpcd[DP_RECEIVER_CAP_SI=
ZE],
>>  				       const u8 port_cap[4]);
>>  bool drm_dp_downstream_444_to_420_conversion(const u8 dpcd[DP_RECEIVER_=
CAP_SIZE],
>> @@ -530,7 +530,7 @@ int drm_dp_downstream_id(struct drm_dp_aux *aux, cha=
r id[6]);
>>  void drm_dp_downstream_debug(struct seq_file *m,
>>  			     const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>  			     const u8 port_cap[4],
>> -			     const struct edid *edid,
>> +			     const struct drm_edid *drm_edid,
>>  			     struct drm_dp_aux *aux);
>>  enum drm_mode_subconnector
>>  drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
