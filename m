Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A6403ABB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9056A6E1B6;
	Wed,  8 Sep 2021 13:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D476E1B6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:33:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220164272"
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; 
 d="gz'50?scan'50,208,50";a="220164272"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 06:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; 
 d="gz'50?scan'50,208,50";a="693377950"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2021 06:32:58 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mNxhC-0002Cb-64; Wed, 08 Sep 2021 13:32:58 +0000
Date: Wed, 8 Sep 2021 21:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Subject: [drm:i915-vtable-cleanup 12/12]
 drivers/gpu/drm/i915/display/intel_audio.c:685:13: error:
 'ilk_audio_codec_disable' defined but not used
Message-ID: <202109082154.tgVDMFjC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://people.freedesktop.org/~airlied/linux.git i915-vtable-cleanup
head:   b0d0061aeef594fc572295c0e3c02ba91596cbf6
commit: b0d0061aeef594fc572295c0e3c02ba91596cbf6 [12/12] drm/i915/display: constify the audio functions
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        git remote add drm git://people.freedesktop.org/~airlied/linux.git
        git fetch --no-tags drm i915-vtable-cleanup
        git checkout b0d0061aeef594fc572295c0e3c02ba91596cbf6
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_audio.c: In function 'intel_audio_codec_enable':
   drivers/gpu/drm/i915/display/intel_audio.c:852:24: error: 'dev_priv->audio_funcs' is a pointer; did you mean to use '->'?
     852 |   dev_priv->audio_funcs.audio_codec_enable(encoder,
         |                        ^
         |                        ->
   drivers/gpu/drm/i915/display/intel_audio.c: In function 'intel_audio_codec_disable':
   drivers/gpu/drm/i915/display/intel_audio.c:897:24: error: 'dev_priv->audio_funcs' is a pointer; did you mean to use '->'?
     897 |   dev_priv->audio_funcs.audio_codec_disable(encoder,
         |                        ^
         |                        ->
   drivers/gpu/drm/i915/display/intel_audio.c: At top level:
   drivers/gpu/drm/i915/display/intel_audio.c:919:46: error: expected '}' before ';' token
     919 |  .audio_codec_enable = g4x_audio_codec_enable;
         |                                              ^
   drivers/gpu/drm/i915/display/intel_audio.c:918:68: note: to match this '{'
     918 | static const struct drm_i915_display_audio_funcs g4x_audio_funcs = {
         |                                                                    ^
   drivers/gpu/drm/i915/display/intel_audio.c:924:46: error: expected '}' before ';' token
     924 |  .audio_codec_enable = ilk_audio_codec_enable;
         |                                              ^
   drivers/gpu/drm/i915/display/intel_audio.c:923:68: note: to match this '{'
     923 | static const struct drm_i915_display_audio_funcs ilk_audio_funcs = {
         |                                                                    ^
   drivers/gpu/drm/i915/display/intel_audio.c:929:46: error: expected '}' before ';' token
     929 |  .audio_codec_enable = hsw_audio_codec_enable;
         |                                              ^
   drivers/gpu/drm/i915/display/intel_audio.c:928:68: note: to match this '{'
     928 | static const struct drm_i915_display_audio_funcs hsw_audio_funcs = {
         |                                                                    ^
>> drivers/gpu/drm/i915/display/intel_audio.c:685:13: error: 'ilk_audio_codec_disable' defined but not used [-Werror=unused-function]
     685 | static void ilk_audio_codec_disable(struct intel_encoder *encoder,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_audio.c:486:13: error: 'hsw_audio_codec_disable' defined but not used [-Werror=unused-function]
     486 | static void hsw_audio_codec_disable(struct intel_encoder *encoder,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_audio.c:323:13: error: 'g4x_audio_codec_disable' defined but not used [-Werror=unused-function]
     323 | static void g4x_audio_codec_disable(struct intel_encoder *encoder,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/ilk_audio_codec_disable +685 drivers/gpu/drm/i915/display/intel_audio.c

12e87f23c6278ed drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2016-10-10  485  
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30 @486  static void hsw_audio_codec_disable(struct intel_encoder *encoder,
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  487  				    const struct intel_crtc_state *old_crtc_state,
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  488  				    const struct drm_connector_state *old_conn_state)
69bfe1a9b4dffca drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  489  {
fac5e23e3c385fd drivers/gpu/drm/i915/intel_audio.c         Chris Wilson      2016-07-04  490  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  491  	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
c25004964c5a8a0 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2018-06-12  492  	u32 tmp;
69bfe1a9b4dffca drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  493  
6385514932d5fc9 drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga     2020-01-21  494  	drm_dbg_kms(&dev_priv->drm, "Disable audio codec on transcoder %s\n",
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  495  		    transcoder_name(cpu_transcoder));
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  496  
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  497  	mutex_lock(&dev_priv->av_mutex);
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  498  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  499  	/* Disable timestamps */
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  500  	tmp = intel_de_read(dev_priv, HSW_AUD_CFG(cpu_transcoder));
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  501  	tmp &= ~AUD_CONFIG_N_VALUE_INDEX;
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  502  	tmp |= AUD_CONFIG_N_PROG_ENABLE;
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  503  	tmp &= ~AUD_CONFIG_UPPER_N_MASK;
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  504  	tmp &= ~AUD_CONFIG_LOWER_N_MASK;
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  505  	if (intel_crtc_has_dp_encoder(old_crtc_state))
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  506  		tmp |= AUD_CONFIG_N_VALUE_INDEX;
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  507  	intel_de_write(dev_priv, HSW_AUD_CFG(cpu_transcoder), tmp);
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  508  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  509  	/* Invalidate ELD */
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  510  	tmp = intel_de_read(dev_priv, HSW_AUD_PIN_ELD_CP_VLD);
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  511  	tmp &= ~AUDIO_ELD_VALID(cpu_transcoder);
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  512  	tmp &= ~AUDIO_OUTPUT_ENABLE(cpu_transcoder);
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  513  	intel_de_write(dev_priv, HSW_AUD_PIN_ELD_CP_VLD, tmp);
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  514  
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  515  	mutex_unlock(&dev_priv->av_mutex);
69bfe1a9b4dffca drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  516  }
69bfe1a9b4dffca drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  517  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  518  static unsigned int calc_hblank_early_prog(struct intel_encoder *encoder,
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  519  					   const struct intel_crtc_state *crtc_state)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  520  {
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  521  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  522  	unsigned int link_clks_available, link_clks_required;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  523  	unsigned int tu_data, tu_line, link_clks_active;
d19b29be653691a drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  524  	unsigned int h_active, h_total, hblank_delta, pixel_clk;
d19b29be653691a drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  525  	unsigned int fec_coeff, cdclk, vdsc_bpp;
41ee86d6ee82060 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  526  	unsigned int link_clk, lanes;
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  527  	unsigned int hblank_rise;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  528  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  529  	h_active = crtc_state->hw.adjusted_mode.crtc_hdisplay;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  530  	h_total = crtc_state->hw.adjusted_mode.crtc_htotal;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  531  	pixel_clk = crtc_state->hw.adjusted_mode.crtc_clock;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  532  	vdsc_bpp = crtc_state->dsc.compressed_bpp;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  533  	cdclk = i915->cdclk.hw.cdclk;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  534  	/* fec= 0.972261, using rounding multiplier of 1000000 */
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  535  	fec_coeff = 972261;
41ee86d6ee82060 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  536  	link_clk = crtc_state->port_clock;
41ee86d6ee82060 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  537  	lanes = crtc_state->lane_count;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  538  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  539  	drm_dbg_kms(&i915->drm, "h_active = %u link_clk = %u :"
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  540  		    "lanes = %u vdsc_bpp = %u cdclk = %u\n",
41ee86d6ee82060 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  541  		    h_active, link_clk, lanes, vdsc_bpp, cdclk);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  542  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  543  	if (WARN_ON(!link_clk || !pixel_clk || !lanes || !vdsc_bpp || !cdclk))
11ebc2321b8ef88 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-04-20  544  		return 0;
11ebc2321b8ef88 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-04-20  545  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  546  	link_clks_available = (h_total - h_active) * link_clk / pixel_clk - 28;
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  547  	link_clks_required = DIV_ROUND_UP(192000 * h_total, 1000 * pixel_clk) * (48 / lanes + 2);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  548  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  549  	if (link_clks_available > link_clks_required)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  550  		hblank_delta = 32;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  551  	else
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  552  		hblank_delta = DIV64_U64_ROUND_UP(mul_u32_u32(5 * (link_clk + cdclk), pixel_clk),
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  553  						  mul_u32_u32(link_clk, cdclk));
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  554  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  555  	tu_data = div64_u64(mul_u32_u32(pixel_clk * vdsc_bpp * 8, 1000000),
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  556  			    mul_u32_u32(link_clk * lanes, fec_coeff));
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  557  	tu_line = div64_u64(h_active * mul_u32_u32(link_clk, fec_coeff),
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  558  			    mul_u32_u32(64 * pixel_clk, 1000000));
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  559  	link_clks_active  = (tu_line - 1) * 64 + tu_data;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  560  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  561  	hblank_rise = (link_clks_active + 6 * DIV_ROUND_UP(link_clks_active, 250) + 4) * pixel_clk / link_clk;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  562  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  563  	return h_active - hblank_rise + hblank_delta;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  564  }
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  565  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  566  static unsigned int calc_samples_room(const struct intel_crtc_state *crtc_state)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  567  {
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  568  	unsigned int h_active, h_total, pixel_clk;
41ee86d6ee82060 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  569  	unsigned int link_clk, lanes;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  570  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  571  	h_active = crtc_state->hw.adjusted_mode.hdisplay;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  572  	h_total = crtc_state->hw.adjusted_mode.htotal;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  573  	pixel_clk = crtc_state->hw.adjusted_mode.clock;
41ee86d6ee82060 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  574  	link_clk = crtc_state->port_clock;
41ee86d6ee82060 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  575  	lanes = crtc_state->lane_count;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  576  
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  577  	return ((h_total - h_active) * link_clk - 12 * pixel_clk) /
2dd43144e824aff drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2020-04-29  578  		(pixel_clk * (48 / lanes + 2));
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  579  }
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  580  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  581  static void enable_audio_dsc_wa(struct intel_encoder *encoder,
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  582  				const struct intel_crtc_state *crtc_state)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  583  {
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  584  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  585  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  586  	enum pipe pipe = crtc->pipe;
11ebc2321b8ef88 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-04-20  587  	unsigned int hblank_early_prog, samples_room;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  588  	unsigned int val;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  589  
005e95377249cb6 drivers/gpu/drm/i915/display/intel_audio.c Matt Roper        2021-03-19  590  	if (DISPLAY_VER(i915) < 11)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  591  		return;
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  592  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  593  	val = intel_de_read(i915, AUD_CONFIG_BE);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  594  
93e7e61eb448318 drivers/gpu/drm/i915/display/intel_audio.c Lucas De Marchi   2021-04-12  595  	if (DISPLAY_VER(i915) == 11)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  596  		val |= HBLANK_EARLY_ENABLE_ICL(pipe);
005e95377249cb6 drivers/gpu/drm/i915/display/intel_audio.c Matt Roper        2021-03-19  597  	else if (DISPLAY_VER(i915) >= 12)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  598  		val |= HBLANK_EARLY_ENABLE_TGL(pipe);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  599  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  600  	if (crtc_state->dsc.compression_enable &&
31824c03faac432 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  601  	    crtc_state->hw.adjusted_mode.hdisplay >= 3840 &&
31824c03faac432 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  602  	    crtc_state->hw.adjusted_mode.vdisplay >= 2160) {
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  603  		/* Get hblank early enable value required */
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  604  		val &= ~HBLANK_START_COUNT_MASK(pipe);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  605  		hblank_early_prog = calc_hblank_early_prog(encoder, crtc_state);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  606  		if (hblank_early_prog < 32)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  607  			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_32);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  608  		else if (hblank_early_prog < 64)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  609  			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_64);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  610  		else if (hblank_early_prog < 96)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  611  			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_96);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  612  		else
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  613  			val |= HBLANK_START_COUNT(pipe, HBLANK_START_COUNT_128);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  614  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  615  		/* Get samples room value required */
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  616  		val &= ~NUMBER_SAMPLES_PER_LINE_MASK(pipe);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  617  		samples_room = calc_samples_room(crtc_state);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  618  		if (samples_room < 3)
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  619  			val |= NUMBER_SAMPLES_PER_LINE(pipe, samples_room);
f4c50deecaed632 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2021-05-04  620  		else /* Program 0 i.e "All Samples available in buffer" */
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  621  			val |= NUMBER_SAMPLES_PER_LINE(pipe, 0x0);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  622  	}
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  623  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  624  	intel_de_write(i915, AUD_CONFIG_BE, val);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  625  }
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  626  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  627  #undef ROUNDING_FACTOR
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  628  
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  629  static void hsw_audio_codec_enable(struct intel_encoder *encoder,
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  630  				   const struct intel_crtc_state *crtc_state,
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  631  				   const struct drm_connector_state *conn_state)
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  632  {
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  633  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  634  	struct drm_connector *connector = conn_state->connector;
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  635  	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
c25004964c5a8a0 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2018-06-12  636  	const u8 *eld = connector->eld;
c25004964c5a8a0 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2018-06-12  637  	u32 tmp;
f9f682ae3530f92 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  638  	int len, i;
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  639  
6385514932d5fc9 drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga     2020-01-21  640  	drm_dbg_kms(&dev_priv->drm,
6385514932d5fc9 drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga     2020-01-21  641  		    "Enable audio codec on transcoder %s, %u bytes ELD\n",
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  642  		     transcoder_name(cpu_transcoder), drm_eld_size(eld));
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  643  
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  644  	mutex_lock(&dev_priv->av_mutex);
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  645  
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  646  	/* Enable Audio WA for 4k DSC usecases */
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  647  	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP))
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  648  		enable_audio_dsc_wa(encoder, crtc_state);
48b8b04c791d1e3 drivers/gpu/drm/i915/display/intel_audio.c Uma Shankar       2020-04-16  649  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  650  	/* Enable audio presence detect, invalidate ELD */
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  651  	tmp = intel_de_read(dev_priv, HSW_AUD_PIN_ELD_CP_VLD);
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  652  	tmp |= AUDIO_OUTPUT_ENABLE(cpu_transcoder);
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  653  	tmp &= ~AUDIO_ELD_VALID(cpu_transcoder);
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  654  	intel_de_write(dev_priv, HSW_AUD_PIN_ELD_CP_VLD, tmp);
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  655  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  656  	/*
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  657  	 * FIXME: We're supposed to wait for vblank here, but we have vblanks
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  658  	 * disabled during the mode set. The proper fix would be to push the
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  659  	 * rest of the setup into a vblank work item, queued here, but the
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  660  	 * infrastructure is not there yet.
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  661  	 */
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  662  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  663  	/* Reset ELD write address */
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  664  	tmp = intel_de_read(dev_priv, HSW_AUD_DIP_ELD_CTRL(cpu_transcoder));
c46f111f5171b63 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  665  	tmp &= ~IBX_ELD_ADDRESS_MASK;
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  666  	intel_de_write(dev_priv, HSW_AUD_DIP_ELD_CTRL(cpu_transcoder), tmp);
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  667  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  668  	/* Up to 84 bytes of hw ELD buffer */
938fd8aaf5d5489 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-28  669  	len = min(drm_eld_size(eld), 84);
938fd8aaf5d5489 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-28  670  	for (i = 0; i < len / 4; i++)
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  671  		intel_de_write(dev_priv, HSW_AUD_EDID_DATA(cpu_transcoder),
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  672  			       *((const u32 *)eld + i));
69bfe1a9b4dffca drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  673  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  674  	/* ELD valid */
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  675  	tmp = intel_de_read(dev_priv, HSW_AUD_PIN_ELD_CP_VLD);
3904fb78a80da64 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2019-04-30  676  	tmp |= AUDIO_ELD_VALID(cpu_transcoder);
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  677  	intel_de_write(dev_priv, HSW_AUD_PIN_ELD_CP_VLD, tmp);
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  678  
5fad84a7530f8e7 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-11-04  679  	/* Enable timestamps */
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  680  	hsw_audio_config_update(encoder, crtc_state);
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  681  
4a21ef7d1d2b19f drivers/gpu/drm/i915/intel_audio.c         Libin Yang        2015-09-02  682  	mutex_unlock(&dev_priv->av_mutex);
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  683  }
7c10a2b5876e014 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  684  
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30 @685  static void ilk_audio_codec_disable(struct intel_encoder *encoder,
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  686  				    const struct intel_crtc_state *old_crtc_state,
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  687  				    const struct drm_connector_state *old_conn_state)
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  688  {
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  689  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
2225f3c6f1d793c drivers/gpu/drm/i915/display/intel_audio.c Maarten Lankhorst 2019-10-31  690  	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  691  	enum pipe pipe = crtc->pipe;
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  692  	enum port port = encoder->port;
c25004964c5a8a0 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2018-06-12  693  	u32 tmp, eldv;
f0f59a00a1c9be1 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2015-11-18  694  	i915_reg_t aud_config, aud_cntrl_st2;
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  695  
6385514932d5fc9 drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga     2020-01-21  696  	drm_dbg_kms(&dev_priv->drm,
6385514932d5fc9 drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga     2020-01-21  697  		    "Disable audio codec on [ENCODER:%d:%s], pipe %c\n",
66a990dd0c49b53 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2019-08-30  698  		     encoder->base.base.id, encoder->base.name,
66a990dd0c49b53 drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä     2019-08-30  699  		     pipe_name(pipe));
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  700  
9a3b466bb8f60ad drivers/gpu/drm/i915/display/intel_audio.c Pankaj Bharadiya  2020-01-28  701  	if (drm_WARN_ON(&dev_priv->drm, port == PORT_A))
d3902c3eba3666f drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2015-05-04  702  		return;
d3902c3eba3666f drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2015-05-04  703  
2d1fe0734087f0d drivers/gpu/drm/i915/intel_audio.c         Joonas Lahtinen   2016-04-07  704  	if (HAS_PCH_IBX(dev_priv)) {
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  705  		aud_config = IBX_AUD_CFG(pipe);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  706  		aud_cntrl_st2 = IBX_AUD_CNTL_ST2;
666a45379e2c29b drivers/gpu/drm/i915/intel_audio.c         Wayne Boyer       2015-12-09  707  	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  708  		aud_config = VLV_AUD_CFG(pipe);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  709  		aud_cntrl_st2 = VLV_AUD_CNTL_ST2;
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  710  	} else {
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  711  		aud_config = CPT_AUD_CFG(pipe);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  712  		aud_cntrl_st2 = CPT_AUD_CNTRL_ST2;
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  713  	}
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  714  
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  715  	/* Disable timestamps */
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  716  	tmp = intel_de_read(dev_priv, aud_config);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  717  	tmp &= ~AUD_CONFIG_N_VALUE_INDEX;
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  718  	tmp |= AUD_CONFIG_N_PROG_ENABLE;
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  719  	tmp &= ~AUD_CONFIG_UPPER_N_MASK;
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  720  	tmp &= ~AUD_CONFIG_LOWER_N_MASK;
8ec47de21bfab96 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä     2017-10-30  721  	if (intel_crtc_has_dp_encoder(old_crtc_state))
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  722  		tmp |= AUD_CONFIG_N_VALUE_INDEX;
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  723  	intel_de_write(dev_priv, aud_config, tmp);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  724  
82910ac6d575d4c drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  725  	eldv = IBX_ELD_VALID(port);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  726  
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  727  	/* Invalidate ELD */
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  728  	tmp = intel_de_read(dev_priv, aud_cntrl_st2);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  729  	tmp &= ~eldv;
49e659bcae79ff8 drivers/gpu/drm/i915/display/intel_audio.c Jani Nikula       2020-01-24  730  	intel_de_write(dev_priv, aud_cntrl_st2, tmp);
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  731  }
495a5bb81d34694 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula       2014-10-27  732  

:::::: The code at line 685 was first introduced by commit
:::::: 8ec47de21bfab96790c4202ae8cdb5092ad7ec33 drm/i915: Pass around crtc and connector states for audio

:::::: TO: Ville Syrjälä <ville.syrjala@linux.intel.com>
:::::: CC: Ville Syrjälä <ville.syrjala@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--Nq2Wo0NMKNjxTN9z
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Nq2Wo0NMKNjxTN9z--
