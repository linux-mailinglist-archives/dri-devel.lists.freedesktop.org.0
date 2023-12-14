Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726A813C13
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4A10E26A;
	Thu, 14 Dec 2023 20:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B7110E26A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702587258; x=1734123258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zunJNe5vX1dRgJ3thSTyIAATEg/2I3q2EUAAAPNGQnc=;
 b=iEGOuruMYud6QFw4j/AVZD484gVeEj8sb7ujvWNTsbhXW5xE2tEpa+4L
 xauLOPzmofi0uVnDRzegeESGzSzhP7jYC9IpFKZ2eP/2IMpKXDfTvoAkd
 XvNEbMlaQFBVICLzd/ed3Yv5jYw9BcOWlOq71rGfaHIdLphqkgu8wglNw
 n2LtTtmYZ0IQs8SGrAYlNhPaMjiKchv0T183TFVuaBrtODLNW/o/YY1nG
 AfV8UK1YX3vg6XO6SkoLw1RK+exokA6IHZr2up1uyAHVcZnLM9Iy4QtFF
 NSCXKSh5Yy+HmqjsK7hdydkL66/cEM16CRyyuDZwKjxoi7mzyHrHOKeOS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="13876915"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="13876915"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 12:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947719024"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="947719024"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 12:54:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rDsih-000Mbj-1c;
 Thu, 14 Dec 2023 20:54:11 +0000
Date: Fri, 15 Dec 2023 04:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <202312150438.cYAajoc9-lkp@intel.com>
References: <20231214092856.4019251-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214092856.4019251-1-jani.nikula@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus drm-tip/drm-tip linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/ASoC-hdmi-codec-drop-drm-drm_edid-h-include/20231214-173047
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231214092856.4019251-1-jani.nikula%40intel.com
patch subject: [PATCH v3] ASoC: hdmi-codec: drop drm/drm_edid.h include
config: arm-randconfig-001-20231215 (https://download.01.org/0day-ci/archive/20231215/202312150438.cYAajoc9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150438.cYAajoc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150438.cYAajoc9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:1772:2: error: call to undeclared function 'drm_hdmi_avi_infoframe_from_display_mode'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
           ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:1775:3: error: call to undeclared function 'drm_hdmi_avi_infoframe_quant_range'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   drm_hdmi_avi_infoframe_quant_range(&frame, connector, mode,
                   ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:1899:8: error: call to undeclared function 'drm_hdmi_vendor_infoframe_from_display_mode'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           err = drm_hdmi_vendor_infoframe_from_display_mode(&frame, connector,
                 ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2249:14: error: call to undeclared function 'drm_match_cea_mode'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           hdmi->vic = drm_match_cea_mode(mode);
                       ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2282:3: error: call to undeclared function 'drm_default_rgb_quant_range'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   drm_default_rgb_quant_range(mode) ==
                   ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2465:9: error: call to undeclared function 'drm_get_edid'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           edid = drm_get_edid(connector, hdmi->ddc);
                  ^
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2465:7: error: incompatible integer to pointer conversion assigning to 'struct edid *' from 'int' [-Wint-conversion]
           edid = drm_get_edid(connector, hdmi->ddc);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2472:7: error: incomplete definition of type 'struct edid'
                   edid->width_cm, edid->height_cm);
                   ~~~~^
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                                  ^~~~~~~~~~~
   include/media/cec.h:311:8: note: forward declaration of 'struct edid'
   struct edid;
          ^
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2472:23: error: incomplete definition of type 'struct edid'
                   edid->width_cm, edid->height_cm);
                                   ~~~~^
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                                  ^~~~~~~~~~~
   include/media/cec.h:311:8: note: forward declaration of 'struct edid'
   struct edid;
          ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2474:23: error: call to undeclared function 'drm_detect_hdmi_monitor'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
                                ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2475:25: error: call to undeclared function 'drm_detect_monitor_audio'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
                                  ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2505:8: error: call to undeclared function 'drm_add_edid_modes'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = drm_add_edid_modes(connector, edid);
                 ^
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2677:35: error: use of undeclared identifier 'DRM_EDID_YCBCR420_DC_48'
                       (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48))
                                                   ^
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2681:35: error: use of undeclared identifier 'DRM_EDID_YCBCR420_DC_36'
                       (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36))
                                                   ^
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2685:35: error: use of undeclared identifier 'DRM_EDID_YCBCR420_DC_30'
                       (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30))
                                                   ^
   15 errors generated.


vim +/drm_hdmi_avi_infoframe_from_display_mode +1772 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1763  
9fbfa320b435e6 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  1764  static void hdmi_config_AVI(struct dw_hdmi *hdmi,
81980037fb275d drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  1765  			    const struct drm_connector *connector,
9fbfa320b435e6 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  1766  			    const struct drm_display_mode *mode)
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1767  {
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1768  	struct hdmi_avi_infoframe frame;
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1769  	u8 val;
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1770  
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1771  	/* Initialise info frame from DRM mode */
81980037fb275d drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26 @1772  	drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1773  
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1774  	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
81980037fb275d drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26 @1775  		drm_hdmi_avi_infoframe_quant_range(&frame, connector, mode,
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1776  						   hdmi->hdmi_data.rgb_limited_range ?
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1777  						   HDMI_QUANTIZATION_RANGE_LIMITED :
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1778  						   HDMI_QUANTIZATION_RANGE_FULL);
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1779  	} else {
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1780  		frame.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1781  		frame.ycc_quantization_range =
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1782  			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1783  	}
86af379ebca2ef drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1784  
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1785  	if (hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1786  		frame.colorspace = HDMI_COLORSPACE_YUV444;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1787  	else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1788  		frame.colorspace = HDMI_COLORSPACE_YUV422;
ba9877e2361c46 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2019-02-01  1789  	else if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
ba9877e2361c46 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2019-02-01  1790  		frame.colorspace = HDMI_COLORSPACE_YUV420;
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1791  	else
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1792  		frame.colorspace = HDMI_COLORSPACE_RGB;
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1793  
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1794  	/* Set up colorimetry */
e8dca30f711846 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1795  	if (!hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1796  		switch (hdmi->hdmi_data.enc_out_encoding) {
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1797  		case V4L2_YCBCR_ENC_601:
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1798  			if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV601)
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1799  				frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1800  			else
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1801  				frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1802  			frame.extended_colorimetry =
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1803  					HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
f40d6560eba65b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Dan Carpenter    2017-04-06  1804  			break;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1805  		case V4L2_YCBCR_ENC_709:
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1806  			if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV709)
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1807  				frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1808  			else
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1809  				frame.colorimetry = HDMI_COLORIMETRY_ITU_709;
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1810  			frame.extended_colorimetry =
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1811  					HDMI_EXTENDED_COLORIMETRY_XV_YCC_709;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1812  			break;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1813  		default: /* Carries no data */
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1814  			frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1815  			frame.extended_colorimetry =
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1816  					HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
def23aa7e9821a drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Neil Armstrong   2017-04-04  1817  			break;
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1818  		}
e8dca30f711846 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1819  	} else {
e8dca30f711846 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1820  		frame.colorimetry = HDMI_COLORIMETRY_NONE;
e8dca30f711846 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1821  		frame.extended_colorimetry =
e8dca30f711846 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1822  			HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
e8dca30f711846 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jernej Skrabec   2020-03-05  1823  	}
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1824  
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1825  	/*
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1826  	 * The Designware IP uses a different byte format from standard
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1827  	 * AVI info frames, though generally the bits are in the correct
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1828  	 * bytes.
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1829  	 */
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1830  
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1831  	/*
b0118e7d936c55 drivers/gpu/drm/bridge/dw-hdmi.c          Jose Abreu       2016-08-29  1832  	 * AVI data byte 1 differences: Colorspace in bits 0,1 rather than 5,6,
b0118e7d936c55 drivers/gpu/drm/bridge/dw-hdmi.c          Jose Abreu       2016-08-29  1833  	 * scan info in bits 4,5 rather than 0,1 and active aspect present in
b0118e7d936c55 drivers/gpu/drm/bridge/dw-hdmi.c          Jose Abreu       2016-08-29  1834  	 * bit 6 rather than 4.
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1835  	 */
b0118e7d936c55 drivers/gpu/drm/bridge/dw-hdmi.c          Jose Abreu       2016-08-29  1836  	val = (frame.scan_mode & 3) << 4 | (frame.colorspace & 3);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1837  	if (frame.active_aspect & 15)
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1838  		val |= HDMI_FC_AVICONF0_ACTIVE_FMT_INFO_PRESENT;
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1839  	if (frame.top_bar || frame.bottom_bar)
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1840  		val |= HDMI_FC_AVICONF0_BAR_DATA_HORIZ_BAR;
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1841  	if (frame.left_bar || frame.right_bar)
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1842  		val |= HDMI_FC_AVICONF0_BAR_DATA_VERT_BAR;
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1843  	hdmi_writeb(hdmi, val, HDMI_FC_AVICONF0);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1844  
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1845  	/* AVI data byte 2 differences: none */
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1846  	val = ((frame.colorimetry & 0x3) << 6) |
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1847  	      ((frame.picture_aspect & 0x3) << 4) |
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1848  	      (frame.active_aspect & 0xf);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1849  	hdmi_writeb(hdmi, val, HDMI_FC_AVICONF1);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1850  
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1851  	/* AVI data byte 3 differences: none */
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1852  	val = ((frame.extended_colorimetry & 0x7) << 4) |
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1853  	      ((frame.quantization_range & 0x3) << 2) |
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1854  	      (frame.nups & 0x3);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1855  	if (frame.itc)
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1856  		val |= HDMI_FC_AVICONF2_IT_CONTENT_VALID;
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1857  	hdmi_writeb(hdmi, val, HDMI_FC_AVICONF2);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1858  
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1859  	/* AVI data byte 4 differences: none */
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1860  	val = frame.video_code & 0x7f;
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1861  	hdmi_writeb(hdmi, val, HDMI_FC_AVIVID);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1862  
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1863  	/* AVI Data Byte 5- set up input and output pixel repetition */
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1864  	val = (((hdmi->hdmi_data.video_mode.mpixelrepetitioninput + 1) <<
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1865  		HDMI_FC_PRCONF_INCOMING_PR_FACTOR_OFFSET) &
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1866  		HDMI_FC_PRCONF_INCOMING_PR_FACTOR_MASK) |
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1867  		((hdmi->hdmi_data.video_mode.mpixelrepetitionoutput <<
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1868  		HDMI_FC_PRCONF_OUTPUT_PR_FACTOR_OFFSET) &
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1869  		HDMI_FC_PRCONF_OUTPUT_PR_FACTOR_MASK);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1870  	hdmi_writeb(hdmi, val, HDMI_FC_PRCONF);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1871  
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1872  	/*
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1873  	 * AVI data byte 5 differences: content type in 0,1 rather than 4,5,
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1874  	 * ycc range in bits 2,3 rather than 6,7
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1875  	 */
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1876  	val = ((frame.ycc_quantization_range & 0x3) << 2) |
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1877  	      (frame.content_type & 0x3);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1878  	hdmi_writeb(hdmi, val, HDMI_FC_AVICONF3);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1879  
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1880  	/* AVI Data Bytes 6-13 */
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1881  	hdmi_writeb(hdmi, frame.top_bar & 0xff, HDMI_FC_AVIETB0);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1882  	hdmi_writeb(hdmi, (frame.top_bar >> 8) & 0xff, HDMI_FC_AVIETB1);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1883  	hdmi_writeb(hdmi, frame.bottom_bar & 0xff, HDMI_FC_AVISBB0);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1884  	hdmi_writeb(hdmi, (frame.bottom_bar >> 8) & 0xff, HDMI_FC_AVISBB1);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1885  	hdmi_writeb(hdmi, frame.left_bar & 0xff, HDMI_FC_AVIELB0);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1886  	hdmi_writeb(hdmi, (frame.left_bar >> 8) & 0xff, HDMI_FC_AVIELB1);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1887  	hdmi_writeb(hdmi, frame.right_bar & 0xff, HDMI_FC_AVISRB0);
d4ac4cb69e79e3 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-03-27  1888  	hdmi_writeb(hdmi, (frame.right_bar >> 8) & 0xff, HDMI_FC_AVISRB1);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1889  }
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  1890  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1891  static void hdmi_config_vendor_specific_infoframe(struct dw_hdmi *hdmi,
81980037fb275d drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  1892  						  const struct drm_connector *connector,
9fbfa320b435e6 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  1893  						  const struct drm_display_mode *mode)
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1894  {
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1895  	struct hdmi_vendor_infoframe frame;
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1896  	u8 buffer[10];
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1897  	ssize_t err;
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1898  
81980037fb275d drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26 @1899  	err = drm_hdmi_vendor_infoframe_from_display_mode(&frame, connector,
f1781e9bb2dd23 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Ville Syrjälä    2017-11-13  1900  							  mode);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1901  	if (err < 0)
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1902  		/*
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1903  		 * Going into that statement does not means vendor infoframe
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1904  		 * fails. It just informed us that vendor infoframe is not
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1905  		 * needed for the selected mode. Only 4k or stereoscopic 3D
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1906  		 * mode requires vendor infoframe. So just simply return.
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1907  		 */
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1908  		return;
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1909  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1910  	err = hdmi_vendor_infoframe_pack(&frame, buffer, sizeof(buffer));
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1911  	if (err < 0) {
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1912  		dev_err(hdmi->dev, "Failed to pack vendor infoframe: %zd\n",
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1913  			err);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1914  		return;
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1915  	}
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1916  	hdmi_mask_writeb(hdmi, 0, HDMI_FC_DATAUTO0, HDMI_FC_DATAUTO0_VSD_OFFSET,
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1917  			HDMI_FC_DATAUTO0_VSD_MASK);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1918  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1919  	/* Set the length of HDMI vendor specific InfoFrame payload */
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1920  	hdmi_writeb(hdmi, buffer[2], HDMI_FC_VSDSIZE);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1921  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1922  	/* Set 24bit IEEE Registration Identifier */
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1923  	hdmi_writeb(hdmi, buffer[4], HDMI_FC_VSDIEEEID0);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1924  	hdmi_writeb(hdmi, buffer[5], HDMI_FC_VSDIEEEID1);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1925  	hdmi_writeb(hdmi, buffer[6], HDMI_FC_VSDIEEEID2);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1926  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1927  	/* Set HDMI_Video_Format and HDMI_VIC/3D_Structure */
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1928  	hdmi_writeb(hdmi, buffer[7], HDMI_FC_VSDPAYLOAD0);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1929  	hdmi_writeb(hdmi, buffer[8], HDMI_FC_VSDPAYLOAD1);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1930  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1931  	if (frame.s3d_struct >= HDMI_3D_STRUCTURE_SIDE_BY_SIDE_HALF)
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1932  		hdmi_writeb(hdmi, buffer[9], HDMI_FC_VSDPAYLOAD2);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1933  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1934  	/* Packet frame interpolation */
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1935  	hdmi_writeb(hdmi, 1, HDMI_FC_DATAUTO1);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1936  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1937  	/* Auto packets per frame and line spacing */
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1938  	hdmi_writeb(hdmi, 0x11, HDMI_FC_DATAUTO2);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1939  
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1940  	/* Configures the Frame Composer On RDRB mode */
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1941  	hdmi_mask_writeb(hdmi, 1, HDMI_FC_DATAUTO0, HDMI_FC_DATAUTO0_VSD_OFFSET,
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1942  			HDMI_FC_DATAUTO0_VSD_MASK);
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1943  }
9aa1eca095579b drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Nickey Yang      2017-03-21  1944  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
