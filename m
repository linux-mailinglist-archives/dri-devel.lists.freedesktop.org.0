Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE+KGkpUnGktDwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:21:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB9176B4E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E8310E2EA;
	Mon, 23 Feb 2026 13:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tudLUDhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7A510E2EA;
 Mon, 23 Feb 2026 13:21:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB93D42A81;
 Mon, 23 Feb 2026 13:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EEFC116C6;
 Mon, 23 Feb 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771852870;
 bh=esYROmLayN67zd4/klQySKts+dfakkGdQsAAyJD7Ai0=;
 h=Date:From:To:Cc:Subject:From;
 b=tudLUDhCSftVvc50ZkidF3a5fB85wRyISmRU2GWzP3awrpUQR8NdrTgPZ4lh++xNN
 ONtJc/gaWrCMHRLr1kNNyrHqhiLAkdHQB8zg5ppdb8A6bahA4WsuJl9OAL0hx/kgiK
 M+nowu6uJ9Xk0+yTHlthcEtezHuMg3kPocRkDDrH5TDJ6QQTW8W2lkp/2mRB7GU6TX
 FpMtCLFYm3QUg4Iz5IElzPKwBSeshNG8mTKTxIuxzd4/N39E4+0rJO+acuMhMAaEbp
 FyauhPYwGcMiJEpnhicADQGQtpqvr0E3LOPt2KwK5XoJiSVhiLNx6oYIYyZsr5VgNv
 0+v7A6M8itvtg==
Date: Mon, 23 Feb 2026 13:21:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Imre Deak <imre.deak@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the origin tree
Message-ID: <aZxUQTisi4qLAVRB@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oLsdrSVh99ZEKIbX"
Content-Disposition: inline
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EDFB9176B4E
X-Rspamd-Action: no action


--oLsdrSVh99ZEKIbX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp.c

between commit:

  fe26ae6ac8b88 ("drm/i915/dp: Fix pipe BPP clamping due to HDR")

=66rom the origin tree and commits:

  08b7ef16b6a03 ("drm/i915/dp: Fix pipe BPP clamping due to HDR")
  7229474d41548 ("drm/i915/dp: Verify valid pipe BPP range")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/i915/display/intel_dp.c
index 559cf3bb23fdf,025e906b63a97..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@@ -107,20 -107,6 +107,6 @@@
  /* Constants for DP DSC configurations */
  static const u8 valid_dsc_bpp[] =3D {6, 8, 10, 12, 15};
 =20
- /*
-  * With Single pipe configuration, HW is capable of supporting maximum of:
-  * 2 slices per line for ICL, BMG
-  * 4 slices per line for other platforms.
-  * For now consider a max of 2 slices per line, which works for all platf=
orms.
-  * With this we can have max of 4 DSC Slices per pipe.
-  *
-  * For higher resolutions where 12 slice support is required with
-  * ultrajoiner, only then each pipe can support 3 slices.
-  *
-  * #TODO Split this better to use 4 slices/dsc engine where supported.
-  */
- static const u8 valid_dsc_slicecount[] =3D {1, 2, 3, 4};
-=20
  /**
   * intel_dp_is_edp - is the given port attached to an eDP panel (either C=
PU or PCH)
   * @intel_dp: DP struct
@@@ -508,11 -494,16 +494,16 @@@ bool intel_dp_has_joiner(struct intel_d
  	struct intel_display *display =3D to_intel_display(intel_dp);
  	struct intel_digital_port *intel_dig_port =3D dp_to_dig_port(intel_dp);
  	struct intel_encoder *encoder =3D &intel_dig_port->base;
+ 	struct intel_connector *connector =3D intel_dp->attached_connector;
 =20
  	/* eDP MSO is not compatible with joiner */
  	if (intel_dp->mso_link_count)
  		return false;
 =20
+ 	if (intel_dp_is_edp(intel_dp) &&
+ 	    !connector->panel.vbt.edp.pipe_joiner_enable)
+ 		return false;
+=20
  	return DISPLAY_VER(display) >=3D 12 ||
  		(DISPLAY_VER(display) =3D=3D 11 &&
  		 encoder->port !=3D PORT_A);
@@@ -959,18 -950,24 +950,24 @@@ u32 get_max_compressed_bpp_with_joiner(
  	return max_bpp;
  }
 =20
- u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
- 				int mode_clock, int mode_hdisplay,
- 				int num_joined_pipes)
+ static int intel_dp_dsc_min_slice_count(const struct intel_connector *con=
nector,
+ 					int mode_clock, int mode_hdisplay)
  {
  	struct intel_display *display =3D to_intel_display(connector);
- 	u32 sink_slice_count_mask =3D
- 		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, false);
- 	u8 min_slice_count, i;
+ 	bool is_edp =3D
+ 		connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP;
+ 	int min_slice_count;
  	int max_slice_width;
  	int tp_rgb_yuv444;
  	int tp_yuv422_420;
 =20
+ 	/*
+ 	 * TODO: allow using less than the maximum number of slices
+ 	 * supported by the eDP sink, to allow using fewer DSC engines.
+ 	 */
+ 	if (is_edp)
+ 		return drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, true);
+=20
  	/*
  	 * TODO: Use the throughput value specific to the actual RGB/YUV
  	 * format of the output.
@@@ -1011,7 -1008,7 +1008,7 @@@
  	 * slice and VDSC engine, whenever we approach close enough to max CDCLK
  	 */
  	if (mode_clock >=3D ((display->cdclk.max_cdclk_freq * 85) / 100))
- 		min_slice_count =3D max_t(u8, min_slice_count, 2);
+ 		min_slice_count =3D max(min_slice_count, 2);
 =20
  	max_slice_width =3D drm_dp_dsc_sink_max_slice_width(connector->dp.dsc_dp=
cd);
  	if (max_slice_width < DP_DSC_MIN_SLICE_WIDTH_VALUE) {
@@@ -1021,39 -1018,64 +1018,64 @@@
  		return 0;
  	}
  	/* Also take into account max slice width */
- 	min_slice_count =3D max_t(u8, min_slice_count,
- 				DIV_ROUND_UP(mode_hdisplay,
- 					     max_slice_width));
+ 	min_slice_count =3D max(min_slice_count,
+ 			      DIV_ROUND_UP(mode_hdisplay, max_slice_width));
 =20
- 	/* Find the closest match to the valid slice count values */
- 	for (i =3D 0; i < ARRAY_SIZE(valid_dsc_slicecount); i++) {
- 		u8 test_slice_count =3D valid_dsc_slicecount[i] * num_joined_pipes;
+ 	return min_slice_count;
+ }
 =20
- 		/*
- 		 * 3 DSC Slices per pipe need 3 DSC engines, which is supported only
- 		 * with Ultrajoiner only for some platforms.
- 		 */
- 		if (valid_dsc_slicecount[i] =3D=3D 3 &&
- 		    (!HAS_DSC_3ENGINES(display) || num_joined_pipes !=3D 4))
+ static bool
+ intel_dp_dsc_get_slice_config(const struct intel_connector *connector,
+ 			      int mode_clock, int mode_hdisplay,
+ 			      int num_joined_pipes,
+ 			      struct intel_dsc_slice_config *config_ret)
+ {
+ 	struct intel_display *display =3D to_intel_display(connector);
+ 	int min_slice_count =3D
+ 		intel_dp_dsc_min_slice_count(connector, mode_clock, mode_hdisplay);
+ 	bool is_edp =3D
+ 		connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP;
+ 	u32 sink_slice_count_mask =3D
+ 		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, is_edp);
+ 	int slices_per_pipe;
+=20
+ 	/*
+ 	 * Find the closest match to the valid slice count values
+ 	 *
+ 	 * Max HW DSC-per-pipe x slice-per-DSC (=3D slice-per-pipe) capability:
+ 	 * ICL:  2x2
+ 	 * BMG:  2x2, or for ultrajoined 4 pipes: 3x1
+ 	 * TGL+: 2x4 (TODO: Add support for this)
+ 	 *
+ 	 * TODO: Explore if it's worth increasing the number of slices (from 1
+ 	 * to 2 or 3), so that multiple VDSC engines can be used, thus
+ 	 * reducing the minimum CDCLK requirement, which in turn is determined
+ 	 * by the 1 pixel per clock VDSC engine throughput in
+ 	 * intel_vdsc_min_cdclk().
+ 	 */
+ 	for (slices_per_pipe =3D 1; slices_per_pipe <=3D 4; slices_per_pipe++) {
+ 		struct intel_dsc_slice_config config;
+ 		int slices_per_line;
+=20
+ 		if (!intel_dsc_get_slice_config(display,
+ 						num_joined_pipes, slices_per_pipe,
+ 						&config))
  			continue;
 =20
- 		if (!(drm_dp_dsc_slice_count_to_mask(test_slice_count) &
+ 		slices_per_line =3D intel_dsc_line_slice_count(&config);
+=20
+ 		if (!(drm_dp_dsc_slice_count_to_mask(slices_per_line) &
  		      sink_slice_count_mask))
  			continue;
 =20
- 		 /*
- 		  * Bigjoiner needs small joiner to be enabled.
- 		  * So there should be at least 2 dsc slices per pipe,
- 		  * whenever bigjoiner is enabled.
- 		  */
- 		if (num_joined_pipes > 1 && valid_dsc_slicecount[i] < 2)
+ 		if (mode_hdisplay % slices_per_line)
  			continue;
 =20
- 		if (mode_hdisplay % test_slice_count)
- 			continue;
+ 		if (min_slice_count <=3D slices_per_line) {
+ 			*config_ret =3D config;
 =20
- 		if (min_slice_count <=3D test_slice_count)
- 			return test_slice_count;
+ 			return true;
+ 		}
  	}
 =20
  	/* Print slice count 1,2,4,..24 if bit#0,1,3,..23 is set in the mask. */
@@@ -1064,7 -1086,21 +1086,21 @@@
  		    min_slice_count,
  		    (int)BITS_PER_TYPE(sink_slice_count_mask), &sink_slice_count_mask);
 =20
- 	return 0;
+ 	return false;
+ }
+=20
+ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
+ 				int mode_clock, int mode_hdisplay,
+ 				int num_joined_pipes)
+ {
+ 	struct intel_dsc_slice_config config;
+=20
+ 	if (!intel_dp_dsc_get_slice_config(connector,
+ 					   mode_clock, mode_hdisplay,
+ 					   num_joined_pipes, &config))
+ 		return 0;
+=20
+ 	return intel_dsc_line_slice_count(&config);
  }
 =20
  static bool source_can_output(struct intel_dp *intel_dp,
@@@ -1335,44 -1371,9 +1371,9 @@@ intel_dp_mode_valid_downstream(struct i
  	return MODE_OK;
  }
 =20
- static
- bool intel_dp_needs_joiner(struct intel_dp *intel_dp,
- 			   struct intel_connector *connector,
- 			   int hdisplay, int clock,
- 			   int num_joined_pipes)
+ int intel_dp_max_hdisplay_per_pipe(struct intel_display *display)
  {
- 	struct intel_display *display =3D to_intel_display(intel_dp);
- 	int hdisplay_limit;
-=20
- 	if (!intel_dp_has_joiner(intel_dp))
- 		return false;
-=20
- 	num_joined_pipes /=3D 2;
-=20
- 	hdisplay_limit =3D DISPLAY_VER(display) >=3D 30 ? 6144 : 5120;
-=20
- 	return clock > num_joined_pipes * display->cdclk.max_dotclk_freq ||
- 	       hdisplay > num_joined_pipes * hdisplay_limit;
- }
-=20
- int intel_dp_num_joined_pipes(struct intel_dp *intel_dp,
- 			      struct intel_connector *connector,
- 			      int hdisplay, int clock)
- {
- 	struct intel_display *display =3D to_intel_display(intel_dp);
-=20
- 	if (connector->force_joined_pipes)
- 		return connector->force_joined_pipes;
-=20
- 	if (HAS_ULTRAJOINER(display) &&
- 	    intel_dp_needs_joiner(intel_dp, connector, hdisplay, clock, 4))
- 		return 4;
-=20
- 	if ((HAS_BIGJOINER(display) || HAS_UNCOMPRESSED_JOINER(display)) &&
- 	    intel_dp_needs_joiner(intel_dp, connector, hdisplay, clock, 2))
- 		return 2;
-=20
- 	return 1;
+ 	return DISPLAY_VER(display) >=3D 30 ? 6144 : 5120;
  }
 =20
  bool intel_dp_has_dsc(const struct intel_connector *connector)
@@@ -1395,6 -1396,51 +1396,51 @@@
  	return true;
  }
 =20
+ static
+ bool intel_dp_can_join(struct intel_dp *intel_dp,
+ 		       int num_joined_pipes)
+ {
+ 	struct intel_display *display =3D to_intel_display(intel_dp);
+=20
+ 	if (num_joined_pipes > 1 && !intel_dp_has_joiner(intel_dp))
+ 		return false;
+=20
+ 	switch (num_joined_pipes) {
+ 	case 1:
+ 		return true;
+ 	case 2:
+ 		return HAS_BIGJOINER(display) ||
+ 		       HAS_UNCOMPRESSED_JOINER(display);
+ 	case 4:
+ 		return HAS_ULTRAJOINER(display);
+ 	default:
+ 		return false;
+ 	}
+ }
+=20
+ bool intel_dp_dotclk_valid(struct intel_display *display,
+ 			   int target_clock,
+ 			   int htotal,
+ 			   int dsc_slice_count,
+ 			   int num_joined_pipes)
+ {
+ 	int max_dotclk =3D display->cdclk.max_dotclk_freq;
+ 	int effective_dotclk_limit;
+=20
+ 	effective_dotclk_limit =3D max_dotclk * num_joined_pipes;
+=20
+ 	if (dsc_slice_count)
+ 		target_clock =3D intel_dsc_get_pixel_rate_with_dsc_bubbles(display,
+ 									 target_clock,
+ 									 htotal,
+ 									 dsc_slice_count);
+ 	else
+ 		effective_dotclk_limit =3D
+ 			intel_max_uncompressed_dotclock(display) * num_joined_pipes;
+=20
+ 	return target_clock <=3D effective_dotclk_limit;
+ }
+=20
  static enum drm_mode_status
  intel_dp_mode_valid(struct drm_connector *_connector,
  		    const struct drm_display_mode *mode)
@@@ -1406,9 -1452,7 +1452,7 @@@
  	const struct drm_display_mode *fixed_mode;
  	int target_clock =3D mode->clock;
  	int max_rate, mode_rate, max_lanes, max_link_clock;
- 	int max_dotclk =3D display->cdclk.max_dotclk_freq;
  	u16 dsc_max_compressed_bpp =3D 0;
- 	u8 dsc_slice_count =3D 0;
  	enum drm_mode_status status;
  	bool dsc =3D false;
  	int num_joined_pipes;
@@@ -1424,6 -1468,9 +1468,9 @@@
  	if (mode->clock < 10000)
  		return MODE_CLOCK_LOW;
 =20
+ 	if (intel_dp_hdisplay_bad(display, mode->hdisplay))
+ 		return MODE_H_ILLEGAL;
+=20
  	fixed_mode =3D intel_panel_fixed_mode(connector, mode);
  	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
  		status =3D intel_panel_mode_valid(connector, mode);
@@@ -1433,23 -1480,9 +1480,9 @@@
  		target_clock =3D fixed_mode->clock;
  	}
 =20
- 	num_joined_pipes =3D intel_dp_num_joined_pipes(intel_dp, connector,
- 						     mode->hdisplay, target_clock);
- 	max_dotclk *=3D num_joined_pipes;
-=20
  	sink_format =3D intel_dp_sink_format(connector, mode);
  	output_format =3D intel_dp_output_format(connector, sink_format);
 =20
- 	status =3D intel_pfit_mode_valid(display, mode, output_format, num_joine=
d_pipes);
- 	if (status !=3D MODE_OK)
- 		return status;
-=20
- 	if (target_clock > max_dotclk)
- 		return MODE_CLOCK_HIGH;
-=20
- 	if (intel_dp_hdisplay_bad(display, mode->hdisplay))
- 		return MODE_H_ILLEGAL;
-=20
  	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
  	max_lanes =3D intel_dp_max_lane_count(intel_dp);
 =20
@@@ -1460,52 -1493,92 +1493,92 @@@
  					   target_clock, mode->hdisplay,
  					   link_bpp_x16, 0);
 =20
- 	if (intel_dp_has_dsc(connector)) {
- 		int pipe_bpp;
+ 	/*
+ 	 * We cannot determine the required pipe=E2=80=91join count before knowi=
ng whether
+ 	 * DSC is needed, nor can we determine DSC need without knowing the pipe
+ 	 * count.
+ 	 * Because of this dependency cycle, the only correct approach is to ite=
rate
+ 	 * over candidate pipe counts and evaluate each combination.
+ 	 */
+ 	status =3D MODE_CLOCK_HIGH;
+ 	for_each_joiner_candidate(connector, mode, num_joined_pipes) {
+ 		int dsc_slice_count =3D 0;
 =20
- 		/*
- 		 * TBD pass the connector BPC,
- 		 * for now U8_MAX so that max BPC on that platform would be picked
- 		 */
- 		pipe_bpp =3D intel_dp_dsc_compute_max_bpp(connector, U8_MAX);
+ 		status =3D intel_pfit_mode_valid(display, mode, output_format, num_join=
ed_pipes);
+ 		if (status !=3D MODE_OK)
+ 			continue;
 =20
- 		/*
- 		 * Output bpp is stored in 6.4 format so right shift by 4 to get the
- 		 * integer value since we support only integer values of bpp.
- 		 */
- 		if (intel_dp_is_edp(intel_dp)) {
- 			dsc_max_compressed_bpp =3D
- 				drm_edp_dsc_sink_output_bpp(connector->dp.dsc_dpcd) >> 4;
- 			dsc_slice_count =3D
- 				drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd,
- 								true);
- 			dsc =3D dsc_max_compressed_bpp && dsc_slice_count;
- 		} else if (drm_dp_sink_supports_fec(connector->dp.fec_capability)) {
- 			unsigned long bw_overhead_flags =3D 0;
+ 		if (intel_dp_has_dsc(connector)) {
+ 			int pipe_bpp;
 =20
- 			if (!drm_dp_is_uhbr_rate(max_link_clock))
- 				bw_overhead_flags |=3D DRM_DP_BW_OVERHEAD_FEC;
+ 			dsc_slice_count =3D intel_dp_dsc_get_slice_count(connector,
+ 								       target_clock,
+ 								       mode->hdisplay,
+ 								       num_joined_pipes);
 =20
- 			dsc =3D intel_dp_mode_valid_with_dsc(connector,
- 							   max_link_clock, max_lanes,
- 							   target_clock, mode->hdisplay,
- 							   num_joined_pipes,
- 							   output_format, pipe_bpp,
- 							   bw_overhead_flags);
+ 			/*
+ 			 * TBD pass the connector BPC,
+ 			 * for now U8_MAX so that max BPC on that platform would be picked
+ 			 */
+ 			pipe_bpp =3D intel_dp_dsc_compute_max_bpp(connector, U8_MAX);
+=20
+ 			/*
+ 			 * Output bpp is stored in 6.4 format so right shift by 4 to get the
+ 			 * integer value since we support only integer values of bpp.
+ 			 */
+ 			if (intel_dp_is_edp(intel_dp)) {
+ 				dsc_max_compressed_bpp =3D
+ 					drm_edp_dsc_sink_output_bpp(connector->dp.dsc_dpcd) >> 4;
+=20
+ 				dsc =3D dsc_max_compressed_bpp && dsc_slice_count;
+ 			} else if (drm_dp_sink_supports_fec(connector->dp.fec_capability)) {
+ 				unsigned long bw_overhead_flags =3D 0;
+=20
+ 				if (!drm_dp_is_uhbr_rate(max_link_clock))
+ 					bw_overhead_flags |=3D DRM_DP_BW_OVERHEAD_FEC;
+=20
+ 				dsc =3D intel_dp_mode_valid_with_dsc(connector,
+ 								   max_link_clock, max_lanes,
+ 								   target_clock, mode->hdisplay,
+ 								   num_joined_pipes,
+ 								   output_format, pipe_bpp,
+ 								   bw_overhead_flags);
+ 			}
  		}
+=20
+ 		if (intel_dp_joiner_needs_dsc(display, num_joined_pipes) && !dsc) {
+ 			status =3D MODE_CLOCK_HIGH;
+ 			continue;
+ 		}
+=20
+ 		if (mode_rate > max_rate && !dsc) {
+ 			status =3D MODE_CLOCK_HIGH;
+ 			continue;
+ 		}
+=20
+ 		status =3D intel_mode_valid_max_plane_size(display, mode, num_joined_pi=
pes);
+ 		if (status !=3D MODE_OK)
+ 			continue;
+=20
+ 		if (!dsc)
+ 			dsc_slice_count =3D 0;
+=20
+ 		if (!intel_dp_dotclk_valid(display,
+ 					   target_clock,
+ 					   mode->htotal,
+ 					   dsc_slice_count,
+ 					   num_joined_pipes)) {
+ 			status =3D MODE_CLOCK_HIGH;
+ 			continue;
+ 		}
+=20
+ 		break;
  	}
 =20
- 	if (intel_dp_joiner_needs_dsc(display, num_joined_pipes) && !dsc)
- 		return MODE_CLOCK_HIGH;
-=20
- 	if (mode_rate > max_rate && !dsc)
- 		return MODE_CLOCK_HIGH;
-=20
- 	status =3D intel_dp_mode_valid_downstream(connector, mode, target_clock);
  	if (status !=3D MODE_OK)
  		return status;
 =20
- 	return intel_mode_valid_max_plane_size(display, mode, num_joined_pipes);
+ 	return intel_dp_mode_valid_downstream(connector, mode, target_clock);
  }
 =20
  bool intel_dp_source_supports_tps3(struct intel_display *display)
@@@ -1696,7 -1769,7 +1769,7 @@@ static int intel_dp_max_bpp(struct inte
  	struct intel_connector *connector =3D intel_dp->attached_connector;
  	int bpp, bpc;
 =20
- 	bpc =3D crtc_state->pipe_bpp / 3;
+ 	bpc =3D crtc_state->max_pipe_bpp / 3;
 =20
  	if (intel_dp->dfp.max_bpc)
  		bpc =3D min_t(int, bpc, intel_dp->dfp.max_bpc);
@@@ -2032,12 -2105,14 +2105,14 @@@ static int dsc_compute_link_config(stru
  			} else {
  				unsigned long bw_overhead_flags =3D
  					pipe_config->fec_enable ? DRM_DP_BW_OVERHEAD_FEC : 0;
+ 				int line_slice_count =3D
+ 					intel_dsc_line_slice_count(&pipe_config->dsc.slice_config);
 =20
  				if (!is_bw_sufficient_for_dsc_config(intel_dp,
  								     link_rate, lane_count,
  								     adjusted_mode->crtc_clock,
  								     adjusted_mode->hdisplay,
- 								     pipe_config->dsc.slice_count,
+ 								     line_slice_count,
  								     dsc_bpp_x16,
  								     bw_overhead_flags))
  					continue;
@@@ -2382,47 -2457,10 +2457,10 @@@ int intel_dp_dsc_compute_config(struct=
=20
  		}
  	}
 =20
- 	/* Calculate Slice count */
- 	if (intel_dp_is_edp(intel_dp)) {
- 		pipe_config->dsc.slice_count =3D
- 			drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd,
- 							true);
- 		if (!pipe_config->dsc.slice_count) {
- 			drm_dbg_kms(display->drm,
- 				    "Unsupported Slice Count %d\n",
- 				    pipe_config->dsc.slice_count);
- 			return -EINVAL;
- 		}
- 	} else {
- 		u8 dsc_dp_slice_count;
-=20
- 		dsc_dp_slice_count =3D
- 			intel_dp_dsc_get_slice_count(connector,
- 						     adjusted_mode->crtc_clock,
- 						     adjusted_mode->crtc_hdisplay,
- 						     num_joined_pipes);
- 		if (!dsc_dp_slice_count) {
- 			drm_dbg_kms(display->drm,
- 				    "Compressed Slice Count not supported\n");
- 			return -EINVAL;
- 		}
-=20
- 		pipe_config->dsc.slice_count =3D dsc_dp_slice_count;
- 	}
- 	/*
- 	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
- 	 * is greater than the maximum Cdclock and if slice count is even
- 	 * then we need to use 2 VDSC instances.
- 	 * In case of Ultrajoiner along with 12 slices we need to use 3
- 	 * VDSC instances.
- 	 */
- 	if (pipe_config->joiner_pipes && num_joined_pipes =3D=3D 4 &&
- 	    pipe_config->dsc.slice_count =3D=3D 12)
- 		pipe_config->dsc.num_streams =3D 3;
- 	else if (pipe_config->joiner_pipes || pipe_config->dsc.slice_count > 1)
- 		pipe_config->dsc.num_streams =3D 2;
- 	else
- 		pipe_config->dsc.num_streams =3D 1;
+ 	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
+ 					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
+ 					   &pipe_config->dsc.slice_config))
+ 		return -EINVAL;
 =20
  	ret =3D intel_dp_dsc_compute_params(connector, pipe_config);
  	if (ret < 0) {
@@@ -2440,7 -2478,7 +2478,7 @@@
  		    "Compressed Bpp =3D " FXP_Q4_FMT " Slice Count =3D %d\n",
  		    pipe_config->pipe_bpp,
  		    FXP_Q4_ARGS(pipe_config->dsc.compressed_bpp_x16),
- 		    pipe_config->dsc.slice_count);
+ 		    intel_dsc_line_slice_count(&pipe_config->dsc.slice_config));
 =20
  	return 0;
  }
@@@ -2476,8 -2514,8 +2514,8 @@@ dsc_throughput_quirk_max_bpp_x16(const=20
  	return fxp_q4_from_int(12);
  }
 =20
- static int compute_min_compressed_bpp_x16(struct intel_connector *connect=
or,
- 					  enum intel_output_format output_format)
+ int intel_dp_compute_min_compressed_bpp_x16(struct intel_connector *conne=
ctor,
+ 					    enum intel_output_format output_format)
  {
  	int dsc_src_min_bpp, dsc_sink_min_bpp, dsc_min_bpp;
  	int min_bpp_x16;
@@@ -2543,7 -2581,8 +2581,8 @@@ bool intel_dp_mode_valid_with_dsc(struc
  				  int pipe_bpp, unsigned long bw_overhead_flags)
  {
  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
- 	int min_bpp_x16 =3D compute_min_compressed_bpp_x16(connector, output_for=
mat);
+ 	int min_bpp_x16 =3D intel_dp_compute_min_compressed_bpp_x16(connector,
+ 								  output_format);
  	int max_bpp_x16 =3D compute_max_compressed_bpp_x16(connector,
  							 mode_clock, mode_hdisplay,
  							 num_joined_pipes,
@@@ -2597,7 -2636,8 +2636,8 @@@ intel_dp_compute_config_link_bpp_limits
  		limits->link.min_bpp_x16 =3D fxp_q4_from_int(limits->pipe.min_bpp);
  	} else {
  		limits->link.min_bpp_x16 =3D
- 			compute_min_compressed_bpp_x16(connector, crtc_state->output_format);
+ 			intel_dp_compute_min_compressed_bpp_x16(connector,
+ 								crtc_state->output_format);
 =20
  		max_link_bpp_x16 =3D
  			compute_max_compressed_bpp_x16(connector,
@@@ -2691,7 -2731,7 +2731,7 @@@ intel_dp_compute_config_limits(struct i
  		 * previously. This hack should be removed once we have the
  		 * proper retry logic in place.
  		 */
- 		limits->pipe.max_bpp =3D min(crtc_state->pipe_bpp, 24);
+ 		limits->pipe.max_bpp =3D min(crtc_state->max_pipe_bpp, 24);
  	} else {
  		limits->pipe.max_bpp =3D intel_dp_max_bpp(intel_dp, crtc_state,
  							respect_downstream_limits);
@@@ -2710,9 -2750,39 +2750,39 @@@
  								     crtc_state)));
  	}
 =20
+ 	if (limits->pipe.min_bpp <=3D 0 ||
+ 	    limits->pipe.min_bpp > limits->pipe.max_bpp) {
+ 		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Invalid pipe bpp range: %d=
-%d\n",
+ 			    connector->base.base.id, connector->base.name,
+ 			    limits->pipe.min_bpp, limits->pipe.max_bpp);
+=20
+ 		return false;
+ 	}
+=20
  	if (dsc && !intel_dp_dsc_compute_pipe_bpp_limits(connector, limits))
  		return false;
 =20
+ 	/*
+ 	 * crtc_state->pipe_bpp is the non-DP specific baseline (platform /
+ 	 * EDID) maximum pipe BPP limited by the max-BPC connector property
+ 	 * request. Since by now pipe.max_bpp is <=3D the above baseline
+ 	 * maximum BPP, the only remaining reason for adjusting pipe.max_bpp
+ 	 * is the max-BPC connector property request. Adjust pipe.max_bpp to
+ 	 * this request within the current valid pipe.min_bpp .. pipe.max_bpp
+ 	 * range.
+ 	 */
+ 	limits->pipe.max_bpp =3D clamp(crtc_state->pipe_bpp, limits->pipe.min_bp=
p,
+ 				     limits->pipe.max_bpp);
+ 	if (dsc)
+ 		limits->pipe.max_bpp =3D align_max_sink_dsc_input_bpp(connector,
+ 								    limits->pipe.max_bpp);
+=20
+ 	if (limits->pipe.max_bpp !=3D crtc_state->pipe_bpp)
+ 		drm_dbg_kms(display->drm,
+ 			    "[CONNECTOR:%d:%s] Adjusting requested max pipe bpp %d -> %d\n",
+ 			    connector->base.base.id, connector->base.name,
+ 			    crtc_state->pipe_bpp, limits->pipe.max_bpp);
+=20
  	if (is_mst || intel_dp->use_max_params) {
  		/*
  		 * For MST we always configure max link bw - the spec doesn't
@@@ -2764,13 -2834,13 +2834,13 @@@ bool intel_dp_joiner_needs_dsc(struct i
  }
 =20
  static int
- intel_dp_compute_link_config(struct intel_encoder *encoder,
- 			     struct intel_crtc_state *pipe_config,
- 			     struct drm_connector_state *conn_state,
- 			     bool respect_downstream_limits)
+ intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
+ 				       struct intel_crtc_state *pipe_config,
+ 				       struct drm_connector_state *conn_state,
+ 				       bool respect_downstream_limits)
  {
  	struct intel_display *display =3D to_intel_display(encoder);
- 	struct intel_crtc *crtc =3D to_intel_crtc(pipe_config->uapi.crtc);
+ 	int num_joined_pipes =3D intel_crtc_num_joined_pipes(pipe_config);
  	struct intel_connector *connector =3D
  		to_intel_connector(conn_state->connector);
  	const struct drm_display_mode *adjusted_mode =3D
@@@ -2778,19 -2848,8 +2848,8 @@@
  	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
  	struct link_config_limits limits;
  	bool dsc_needed, joiner_needs_dsc;
- 	int num_joined_pipes;
  	int ret =3D 0;
 =20
- 	if (pipe_config->fec_enable &&
- 	    !intel_dp_supports_fec(intel_dp, connector, pipe_config))
- 		return -EINVAL;
-=20
- 	num_joined_pipes =3D intel_dp_num_joined_pipes(intel_dp, connector,
- 						     adjusted_mode->crtc_hdisplay,
- 						     adjusted_mode->crtc_clock);
- 	if (num_joined_pipes > 1)
- 		pipe_config->joiner_pipes =3D GENMASK(crtc->pipe + num_joined_pipes - 1=
, crtc->pipe);
-=20
  	joiner_needs_dsc =3D intel_dp_joiner_needs_dsc(display, num_joined_pipes=
);
 =20
  	dsc_needed =3D joiner_needs_dsc || intel_dp->force_dsc_en ||
@@@ -2813,7 -2872,13 +2872,13 @@@
  							     fxp_q4_from_int(pipe_config->pipe_bpp),
  							     fxp_q4_from_int(pipe_config->pipe_bpp),
  							     0, false);
- 		if (ret)
+=20
+ 		if (ret ||
+ 		    !intel_dp_dotclk_valid(display,
+ 					   adjusted_mode->crtc_clock,
+ 					   adjusted_mode->crtc_htotal,
+ 					   0,
+ 					   num_joined_pipes))
  			dsc_needed =3D true;
  	}
 =20
@@@ -2823,6 -2888,8 +2888,8 @@@
  	}
 =20
  	if (dsc_needed) {
+ 		int dsc_slice_count;
+=20
  		drm_dbg_kms(display->drm,
  			    "Try DSC (fallback=3D%s, joiner=3D%s, force=3D%s)\n",
  			    str_yes_no(ret), str_yes_no(joiner_needs_dsc),
@@@ -2838,6 -2905,15 +2905,15 @@@
  						  conn_state, &limits, 64);
  		if (ret < 0)
  			return ret;
+=20
+ 		dsc_slice_count =3D intel_dsc_line_slice_count(&pipe_config->dsc.slice_=
config);
+=20
+ 		if (!intel_dp_dotclk_valid(display,
+ 					   adjusted_mode->crtc_clock,
+ 					   adjusted_mode->crtc_htotal,
+ 					   dsc_slice_count,
+ 					   num_joined_pipes))
+ 			return -EINVAL;
  	}
 =20
  	drm_dbg_kms(display->drm,
@@@ -2854,6 -2930,55 +2930,55 @@@
  	return 0;
  }
 =20
+ static int
+ intel_dp_compute_link_config(struct intel_encoder *encoder,
+ 			     struct intel_crtc_state *crtc_state,
+ 			     struct drm_connector_state *conn_state,
+ 			     bool respect_downstream_limits)
+ {
+ 	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
+ 	struct intel_connector *connector =3D
+ 		to_intel_connector(conn_state->connector);
+ 	const struct drm_display_mode *adjusted_mode =3D
+ 		&crtc_state->hw.adjusted_mode;
+ 	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
+ 	int num_joined_pipes;
+ 	int ret =3D -EINVAL;
+=20
+ 	if (crtc_state->fec_enable &&
+ 	    !intel_dp_supports_fec(intel_dp, connector, crtc_state))
+ 		return -EINVAL;
+=20
+ 	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
+ 		/*
+ 		 * NOTE:
+ 		 * The crtc_state->joiner_pipes should have been set at the end
+ 		 * only if all the conditions are met. However that would mean
+ 		 * that num_joined_pipes is passed around to all helpers and
+ 		 * make them use it instead of using crtc_state->joiner_pipes
+ 		 * directly or indirectly (via intel_crtc_num_joined_pipes()).
+ 		 *
+ 		 * For now, setting crtc_state->joiner_pipes to the candidate
+ 		 * value to avoid the above churn and resetting it to 0, in case
+ 		 * no joiner candidate is found to be suitable for the given
+ 		 * configuration.
+ 		 */
+ 		if (num_joined_pipes > 1)
+ 			crtc_state->joiner_pipes =3D GENMASK(crtc->pipe + num_joined_pipes - 1,
+ 							   crtc->pipe);
+=20
+ 		ret =3D intel_dp_compute_link_for_joined_pipes(encoder, crtc_state, con=
n_state,
+ 							     respect_downstream_limits);
+ 		if (ret =3D=3D 0 || ret =3D=3D -EDEADLK)
+ 			break;
+ 	}
+=20
+ 	if (ret < 0)
+ 		crtc_state->joiner_pipes =3D 0;
+=20
+ 	return ret;
+ }
+=20
  bool intel_dp_limited_color_range(const struct intel_crtc_state *crtc_sta=
te,
  				  const struct drm_connector_state *conn_state)
  {
@@@ -4293,20 -4418,24 +4418,24 @@@ static bool intel_dp_get_colorimetry_st
  	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
  }
 =20
- static void intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
- 				   u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
+ static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
+ 				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
  {
- 	if (drm_dp_dpcd_read(aux, DP_DSC_SUPPORT, dsc_dpcd,
- 			     DP_DSC_RECEIVER_CAP_SIZE) < 0) {
- 		drm_err(aux->drm_dev,
- 			"Failed to read DPCD register 0x%x\n",
- 			DP_DSC_SUPPORT);
- 		return;
+ 	int ret;
+=20
+ 	ret =3D drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
+ 				    DP_DSC_RECEIVER_CAP_SIZE);
+ 	if (ret) {
+ 		drm_dbg_kms(aux->drm_dev,
+ 			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
+ 			    DP_DSC_SUPPORT, ERR_PTR(ret));
+ 		return ret;
  	}
 =20
  	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
  		    DP_DSC_RECEIVER_CAP_SIZE,
  		    dsc_dpcd);
+ 	return 0;
  }
 =20
  static void init_dsc_overall_throughput_limits(struct intel_connector *co=
nnector, bool is_branch)
@@@ -4357,8 -4486,9 +4486,9 @@@ void intel_dp_get_dsc_sink_cap(u8 dpcd_
  	if (dpcd_rev < DP_DPCD_REV_14)
  		return;
 =20
- 	intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
- 			       connector->dp.dsc_dpcd);
+ 	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+ 				   connector->dp.dsc_dpcd) < 0)
+ 		return;
 =20
  	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux, DP_FEC_CAPABI=
LITY,
  			      &connector->dp.fec_capability) < 0) {
@@@ -4388,7 -4518,9 +4518,9 @@@ static void intel_edp_get_dsc_sink_cap(
  	if (edp_dpcd_rev < DP_EDP_14)
  		return;
 =20
- 	intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux, connector->d=
p.dsc_dpcd);
+ 	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+ 				   connector->dp.dsc_dpcd) < 0)
+ 		return;
 =20
  	if (connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
  		init_dsc_overall_throughput_limits(connector, false);
@@@ -7086,6 -7218,8 +7218,8 @@@ int intel_dp_compute_config_late(struc
  	if (ret)
  		return ret;
 =20
+ 	intel_alpm_lobf_compute_config_late(intel_dp, crtc_state);
+=20
  	return 0;
  }
 =20
@@@ -7134,3 -7268,22 +7268,22 @@@ int intel_dp_sdp_min_guardband(const st
 =20
  	return sdp_guardband;
  }
+=20
+ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
+ 				     int hdisplay,
+ 				     int num_joined_pipes)
+ {
+ 	struct intel_display *display =3D to_intel_display(connector);
+ 	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
+=20
+ 	if (!intel_dp_can_join(intel_dp, num_joined_pipes))
+ 		return false;
+=20
+ 	if (hdisplay > num_joined_pipes * intel_dp_max_hdisplay_per_pipe(display=
))
+ 		return false;
+=20
+ 	if (connector->force_joined_pipes && connector->force_joined_pipes !=3D =
num_joined_pipes)
+ 		return false;
+=20
+ 	return true;
+ }

--oLsdrSVh99ZEKIbX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcVEEACgkQJNaLcl1U
h9Cg0Qf/QnMgZbktRQy7f7/LPFa7iOsNJ8dm9uLUQ3lkmHQJCcrR4VALmWZ8p0ut
ZYYA3lgKHEuAaSKz+ZX2Q9dkpLaP1oHq50458jGBpxxVMFjNENbiLOLeElkgIK63
dxOdjk1Q7UKdygRyk5XnWBFaQ9Y1vZrWew1MAooimzM8BYSBw47N7UmM1M1SdGnn
sOw4k91q7L9atTb5OLGVM40PXdAAAx7LNEsGMTx+6btI6o8csQBvqrKSsSwrptIA
L/qEJSklEWekogNJUF6YdOJg10oQSZKl6ruPlK+SB0lE0nfHZiLiGGW3zx9o5e6G
Tx78u5OeJOh8TqoNokZAUO0d9GhZaA==
=0VB2
-----END PGP SIGNATURE-----

--oLsdrSVh99ZEKIbX--
