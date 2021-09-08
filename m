Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F94032AA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 04:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA20B6E0F5;
	Wed,  8 Sep 2021 02:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604296E0F5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 02:33:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="281379346"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
 d="gz'50?scan'50,208,50";a="281379346"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 19:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; 
 d="gz'50?scan'50,208,50";a="605578498"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2021 19:33:17 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mNnOm-0001br-JU; Wed, 08 Sep 2021 02:33:16 +0000
Date: Wed, 8 Sep 2021 10:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Subject: [drm:i915-vtable-cleanup 12/12]
 drivers/gpu/drm/i915/display/intel_audio.c:852:24: error: member reference
 type 'const struct drm_i915_display_audio_funcs *' is a pointer; did you
 mean to use '->'?
Message-ID: <202109081053.fpMPlxFL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
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


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://people.freedesktop.org/~airlied/linux.git i915-vtable-cleanup
head:   b0d0061aeef594fc572295c0e3c02ba91596cbf6
commit: b0d0061aeef594fc572295c0e3c02ba91596cbf6 [12/12] drm/i915/display: constify the audio functions
config: x86_64-randconfig-a016-20210906 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9c476172b93367d2cb88d7d3f4b1b5b456fa6020)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm git://people.freedesktop.org/~airlied/linux.git
        git fetch --no-tags drm i915-vtable-cleanup
        git checkout b0d0061aeef594fc572295c0e3c02ba91596cbf6
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_audio.c:852:24: error: member reference type 'const struct drm_i915_display_audio_funcs *' is a pointer; did you mean to use '->'?
                   dev_priv->audio_funcs.audio_codec_enable(encoder,
                   ~~~~~~~~~~~~~~~~~~~~~^
                                        ->
   drivers/gpu/drm/i915/display/intel_audio.c:897:24: error: member reference type 'const struct drm_i915_display_audio_funcs *' is a pointer; did you mean to use '->'?
                   dev_priv->audio_funcs.audio_codec_disable(encoder,
                   ~~~~~~~~~~~~~~~~~~~~~^
                                        ->
>> drivers/gpu/drm/i915/display/intel_audio.c:919:46: error: expected '}'
           .audio_codec_enable = g4x_audio_codec_enable;
                                                       ^
   drivers/gpu/drm/i915/display/intel_audio.c:918:68: note: to match this '{'
   static const struct drm_i915_display_audio_funcs g4x_audio_funcs = {
                                                                      ^
>> drivers/gpu/drm/i915/display/intel_audio.c:920:2: error: expected identifier or '('
           .audio_codec_disable = g4x_audio_codec_disable;
           ^
>> drivers/gpu/drm/i915/display/intel_audio.c:921:1: error: extraneous closing brace ('}')
   };
   ^
   drivers/gpu/drm/i915/display/intel_audio.c:924:46: error: expected '}'
           .audio_codec_enable = ilk_audio_codec_enable;
                                                       ^
   drivers/gpu/drm/i915/display/intel_audio.c:923:68: note: to match this '{'
   static const struct drm_i915_display_audio_funcs ilk_audio_funcs = {
                                                                      ^
   drivers/gpu/drm/i915/display/intel_audio.c:925:2: error: expected identifier or '('
           .audio_codec_disable = ilk_audio_codec_disable;
           ^
   drivers/gpu/drm/i915/display/intel_audio.c:926:1: error: extraneous closing brace ('}')
   };
   ^
   drivers/gpu/drm/i915/display/intel_audio.c:929:46: error: expected '}'
           .audio_codec_enable = hsw_audio_codec_enable;
                                                       ^
   drivers/gpu/drm/i915/display/intel_audio.c:928:68: note: to match this '{'
   static const struct drm_i915_display_audio_funcs hsw_audio_funcs = {
                                                                      ^
   drivers/gpu/drm/i915/display/intel_audio.c:930:2: error: expected identifier or '('
           .audio_codec_disable = hsw_audio_codec_disable;
           ^
   drivers/gpu/drm/i915/display/intel_audio.c:931:1: error: extraneous closing brace ('}')
   };
   ^
   11 errors generated.


vim +852 drivers/gpu/drm/i915/display/intel_audio.c

7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  814  
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  815  /**
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  816   * intel_audio_codec_enable - Enable the audio codec for HD audio
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  817   * @encoder: encoder on which to enable audio
bbf35e9defb9a6 drivers/gpu/drm/i915/intel_audio.c         Maarten Lankhorst    2016-11-08  818   * @crtc_state: pointer to the current crtc state.
bbf35e9defb9a6 drivers/gpu/drm/i915/intel_audio.c         Maarten Lankhorst    2016-11-08  819   * @conn_state: pointer to the current connector state.
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  820   *
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  821   * The enable sequences may only be performed after enabling the transcoder and
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  822   * port, and after completed link training.
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  823   */
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  824  void intel_audio_codec_enable(struct intel_encoder *encoder,
bbf35e9defb9a6 drivers/gpu/drm/i915/intel_audio.c         Maarten Lankhorst    2016-11-08  825  			      const struct intel_crtc_state *crtc_state,
bbf35e9defb9a6 drivers/gpu/drm/i915/intel_audio.c         Maarten Lankhorst    2016-11-08  826  			      const struct drm_connector_state *conn_state)
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  827  {
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  828  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
51e1d83cab9988 drivers/gpu/drm/i915/intel_audio.c         David Henningsson    2015-08-19  829  	struct i915_audio_component *acomp = dev_priv->audio_component;
2225f3c6f1d793 drivers/gpu/drm/i915/display/intel_audio.c Maarten Lankhorst    2019-10-31  830  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  831  	struct drm_connector *connector = conn_state->connector;
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  832  	const struct drm_display_mode *adjusted_mode =
1326a92c346641 drivers/gpu/drm/i915/display/intel_audio.c Maarten Lankhorst    2019-10-31  833  		&crtc_state->hw.adjusted_mode;
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  834  	enum port port = encoder->port;
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  835  	enum pipe pipe = crtc->pipe;
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  836  
abf4b8ed42e9dc drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2019-04-30  837  	/* FIXME precompute the ELD in .compute_config() */
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  838  	if (!connector->eld[0])
6385514932d5fc drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga        2020-01-21  839  		drm_dbg_kms(&dev_priv->drm,
6385514932d5fc drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga        2020-01-21  840  			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
abf4b8ed42e9dc drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2019-04-30  841  			    connector->base.id, connector->name);
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  842  
6385514932d5fc drivers/gpu/drm/i915/display/intel_audio.c Wambui Karuga        2020-01-21  843  	drm_dbg(&dev_priv->drm, "ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  844  		connector->base.id,
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  845  		connector->name,
79003e61b1fbfd drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä        2019-12-04  846  		encoder->base.base.id,
79003e61b1fbfd drivers/gpu/drm/i915/display/intel_audio.c Ville Syrjälä        2019-12-04  847  		encoder->base.name);
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  848  
124abe076fd8b3 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2015-09-08  849  	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  850  
b0d0061aeef594 drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08  851  	if (dev_priv->audio_funcs)
9c1ce0dbf2c66b drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08 @852  		dev_priv->audio_funcs.audio_codec_enable(encoder,
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  853  						     crtc_state,
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  854  						     conn_state);
51e1d83cab9988 drivers/gpu/drm/i915/intel_audio.c         David Henningsson    2015-08-19  855  
cae666ceb8c3f1 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2015-11-12  856  	mutex_lock(&dev_priv->av_mutex);
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  857  	encoder->audio_connector = connector;
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  858  
9dfbffcf4ac070 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2016-02-24  859  	/* referred in audio callbacks */
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  860  	dev_priv->av_enc_map[pipe] = encoder;
cae666ceb8c3f1 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2015-11-12  861  	mutex_unlock(&dev_priv->av_mutex);
cae666ceb8c3f1 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2015-11-12  862  
ae891abe7c2ccf drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2018-07-11  863  	if (acomp && acomp->base.audio_ops &&
ae891abe7c2ccf drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2018-07-11  864  	    acomp->base.audio_ops->pin_eld_notify) {
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  865  		/* audio drivers expect pipe = -1 to indicate Non-MST cases */
9f846643c788bb drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  866  		if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST))
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  867  			pipe = -1;
ae891abe7c2ccf drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2018-07-11  868  		acomp->base.audio_ops->pin_eld_notify(acomp->base.audio_ops->audio_ptr,
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  869  						 (int) port, (int) pipe);
9c9191f3de5926 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2017-01-31  870  	}
9c9191f3de5926 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2017-01-31  871  
20be551e6d0a59 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-04-27  872  	intel_lpe_audio_notify(dev_priv, pipe, port, connector->eld,
b5f2be9ae5bf88 drivers/gpu/drm/i915/intel_audio.c         Pierre-Louis Bossart 2017-01-31  873  			       crtc_state->port_clock,
9f846643c788bb drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  874  			       intel_crtc_has_dp_encoder(crtc_state));
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  875  }
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  876  
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  877  /**
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  878   * intel_audio_codec_disable - Disable the audio codec for HD audio
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  879   * @encoder: encoder on which to disable audio
764b9f2c4d252f drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-11-14  880   * @old_crtc_state: pointer to the old crtc state.
764b9f2c4d252f drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-11-14  881   * @old_conn_state: pointer to the old connector state.
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  882   *
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  883   * The disable sequences must be performed before disabling the transcoder or
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  884   * port.
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  885   */
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  886  void intel_audio_codec_disable(struct intel_encoder *encoder,
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  887  			       const struct intel_crtc_state *old_crtc_state,
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  888  			       const struct drm_connector_state *old_conn_state)
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  889  {
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  890  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
51e1d83cab9988 drivers/gpu/drm/i915/intel_audio.c         David Henningsson    2015-08-19  891  	struct i915_audio_component *acomp = dev_priv->audio_component;
2225f3c6f1d793 drivers/gpu/drm/i915/display/intel_audio.c Maarten Lankhorst    2019-10-31  892  	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  893  	enum port port = encoder->port;
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  894  	enum pipe pipe = crtc->pipe;
69bfe1a9b4dffc drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  895  
b0d0061aeef594 drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08  896  	if (dev_priv->audio_funcs)
9c1ce0dbf2c66b drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08  897  		dev_priv->audio_funcs.audio_codec_disable(encoder,
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  898  						      old_crtc_state,
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  899  						      old_conn_state);
51e1d83cab9988 drivers/gpu/drm/i915/intel_audio.c         David Henningsson    2015-08-19  900  
cae666ceb8c3f1 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2015-11-12  901  	mutex_lock(&dev_priv->av_mutex);
8ec47de21bfab9 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  902  	encoder->audio_connector = NULL;
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  903  	dev_priv->av_enc_map[pipe] = NULL;
cae666ceb8c3f1 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2015-11-12  904  	mutex_unlock(&dev_priv->av_mutex);
cae666ceb8c3f1 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2015-11-12  905  
ae891abe7c2ccf drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2018-07-11  906  	if (acomp && acomp->base.audio_ops &&
ae891abe7c2ccf drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2018-07-11  907  	    acomp->base.audio_ops->pin_eld_notify) {
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  908  		/* audio drivers expect pipe = -1 to indicate Non-MST cases */
9f846643c788bb drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-10-30  909  		if (!intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_DP_MST))
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  910  			pipe = -1;
ae891abe7c2ccf drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2018-07-11  911  		acomp->base.audio_ops->pin_eld_notify(acomp->base.audio_ops->audio_ptr,
f931894194b939 drivers/gpu/drm/i915/intel_audio.c         Pandiyan, Dhinakaran 2016-09-21  912  						 (int) port, (int) pipe);
9c9191f3de5926 drivers/gpu/drm/i915/intel_audio.c         Takashi Iwai         2017-01-31  913  	}
46d196ec460b9c drivers/gpu/drm/i915/intel_audio.c         Jerome Anand         2017-01-25  914  
20be551e6d0a59 drivers/gpu/drm/i915/intel_audio.c         Ville Syrjälä        2017-04-27  915  	intel_lpe_audio_notify(dev_priv, pipe, port, NULL, 0, false);
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  916  }
7c10a2b5876e01 drivers/gpu/drm/i915/intel_audio.c         Jani Nikula          2014-10-27  917  
b0d0061aeef594 drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08  918  static const struct drm_i915_display_audio_funcs g4x_audio_funcs = {
b0d0061aeef594 drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08 @919  	.audio_codec_enable = g4x_audio_codec_enable;
b0d0061aeef594 drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08 @920  	.audio_codec_disable = g4x_audio_codec_disable;
b0d0061aeef594 drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08 @921  };
b0d0061aeef594 drivers/gpu/drm/i915/display/intel_audio.c Dave Airlie          2021-09-08  922  

:::::: The code at line 852 was first introduced by commit
:::::: 9c1ce0dbf2c66b4038b09b712764ccdb272c03f6 drm/i915/display: split out display related audio funcs.

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ew6BAiZeqk4r7MaW
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ew6BAiZeqk4r7MaW--
