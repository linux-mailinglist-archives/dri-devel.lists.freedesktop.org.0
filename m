Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE31F8122
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 07:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE146E392;
	Sat, 13 Jun 2020 05:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C376E231;
 Sat, 13 Jun 2020 05:41:16 +0000 (UTC)
IronPort-SDR: gcZE66T6csMONa6c5rRoVh28k2/VYtOuo6sJly53nUo6lxd1sQ2h5ZrXm6TwIwRyXCGKT/q88F
 68KPey4qc1Ww==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 22:41:15 -0700
IronPort-SDR: lfkMPM6XWJUcDf0oFbf1/6q18XPUbevU9rWGy1gLZU4JOmrwce/E1r80mpbm+xAUlUF00Zmx2o
 GJog2IVCgiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,506,1583222400"; 
 d="gz'50?scan'50,208,50";a="272125127"
Received: from lkp-server02.sh.intel.com (HELO de5642daf266) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 22:41:12 -0700
Received: from kbuild by de5642daf266 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jjyum-0000Ej-7r; Sat, 13 Jun 2020 05:41:12 +0000
Date: Sat, 13 Jun 2020 13:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v6 3/3] drm/i915/dp: Expose connector VRR
 monitor range via debugfs
Message-ID: <202006131356.BmeTo4Rt%lkp@intel.com>
References: <20200612230444.10121-4-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20200612230444.10121-4-manasi.d.navare@intel.com>
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
Cc: kbuild-all@lists.01.org, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manasi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next linus/master next-20200612]
[cannot apply to tegra-drm/drm/tegra/for-next drm/drm-next v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Manasi-Navare/VRR-capable-attach-prop-in-i915-DPCD-helper-VRR-debugfs/20200613-070517
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a014-20200613 (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # save the attached .config to linux build tree
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/gpu/drm/i915/display/intel_display_debugfs.c: In function 'intel_connector_debugfs_add':
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2235:2: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
if (INTEL_GEN(dev_priv) >= 10 &&
^~
drivers/gpu/drm/i915/display/intel_display_debugfs.c:2241:3: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
if (INTEL_GEN(dev_priv) >= 12)
^~
drivers/gpu/drm/i915/display/intel_display_debugfs.c: At top level:
drivers/gpu/drm/i915/display/intel_display_debugfs.c:2247:2: error: expected identifier or '(' before 'if'
if ((INTEL_GEN(dev_priv) >= 9 || IS_HASWELL(dev_priv) ||
^~
drivers/gpu/drm/i915/display/intel_display_debugfs.c:2257:2: error: expected identifier or '(' before 'return'
return 0;
^~~~~~
drivers/gpu/drm/i915/display/intel_display_debugfs.c:2258:1: error: expected identifier or '(' before '}' token
}
^
drivers/gpu/drm/i915/display/intel_display_debugfs.c: In function 'intel_connector_debugfs_add':
drivers/gpu/drm/i915/display/intel_display_debugfs.c:2244:2: error: control reaches end of non-void function [-Werror=return-type]
}
^
In file included from include/drm/drm_debugfs.h:36:0,
from drivers/gpu/drm/i915/display/intel_display_debugfs.c:6:
At top level:
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2081:23: error: 'i915_lpsp_capability_fops' defined but not used [-Werror=unused-const-variable=]
DEFINE_SHOW_ATTRIBUTE(i915_lpsp_capability);
^
include/linux/seq_file.h:154:37: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
static const struct file_operations __name ## _fops = {                                           ^~~~~~
cc1: all warnings being treated as errors

vim +/if +2235 drivers/gpu/drm/i915/display/intel_display_debugfs.c

926b005cd8c4e3 Jani Nikula        2020-02-11  2040  
8806211fe7b306 Anshuman Gupta     2020-04-15  2041  #define LPSP_CAPABLE(COND) (COND ? seq_puts(m, "LPSP: capable\n") : \
8806211fe7b306 Anshuman Gupta     2020-04-15  2042  				seq_puts(m, "LPSP: incapable\n"))
8806211fe7b306 Anshuman Gupta     2020-04-15  2043  
8806211fe7b306 Anshuman Gupta     2020-04-15  2044  static int i915_lpsp_capability_show(struct seq_file *m, void *data)
8806211fe7b306 Anshuman Gupta     2020-04-15  2045  {
8806211fe7b306 Anshuman Gupta     2020-04-15  2046  	struct drm_connector *connector = m->private;
8806211fe7b306 Anshuman Gupta     2020-04-15  2047  	struct intel_encoder *encoder =
8806211fe7b306 Anshuman Gupta     2020-04-15  2048  			intel_attached_encoder(to_intel_connector(connector));
8806211fe7b306 Anshuman Gupta     2020-04-15  2049  	struct drm_i915_private *i915 = to_i915(connector->dev);
8806211fe7b306 Anshuman Gupta     2020-04-15  2050  
8806211fe7b306 Anshuman Gupta     2020-04-15  2051  	if (connector->status != connector_status_connected)
8806211fe7b306 Anshuman Gupta     2020-04-15  2052  		return -ENODEV;
8806211fe7b306 Anshuman Gupta     2020-04-15  2053  
8806211fe7b306 Anshuman Gupta     2020-04-15  2054  	switch (INTEL_GEN(i915)) {
8806211fe7b306 Anshuman Gupta     2020-04-15  2055  	case 12:
8806211fe7b306 Anshuman Gupta     2020-04-15  2056  		/*
8806211fe7b306 Anshuman Gupta     2020-04-15  2057  		 * Actually TGL can drive LPSP on port till DDI_C
8806211fe7b306 Anshuman Gupta     2020-04-15  2058  		 * but there is no physical connected DDI_C on TGL sku's,
8806211fe7b306 Anshuman Gupta     2020-04-15  2059  		 * even driver is not initilizing DDI_C port for gen12.
8806211fe7b306 Anshuman Gupta     2020-04-15  2060  		 */
8806211fe7b306 Anshuman Gupta     2020-04-15  2061  		LPSP_CAPABLE(encoder->port <= PORT_B);
8806211fe7b306 Anshuman Gupta     2020-04-15  2062  		break;
8806211fe7b306 Anshuman Gupta     2020-04-15  2063  	case 11:
8806211fe7b306 Anshuman Gupta     2020-04-15  2064  		LPSP_CAPABLE(connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2065  			     connector->connector_type == DRM_MODE_CONNECTOR_eDP);
8806211fe7b306 Anshuman Gupta     2020-04-15  2066  		break;
8806211fe7b306 Anshuman Gupta     2020-04-15  2067  	case 10:
8806211fe7b306 Anshuman Gupta     2020-04-15  2068  	case 9:
8806211fe7b306 Anshuman Gupta     2020-04-15  2069  		LPSP_CAPABLE(encoder->port == PORT_A &&
8806211fe7b306 Anshuman Gupta     2020-04-15  2070  			     (connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2071  			     connector->connector_type == DRM_MODE_CONNECTOR_eDP  ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2072  			     connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort));
8806211fe7b306 Anshuman Gupta     2020-04-15  2073  		break;
8806211fe7b306 Anshuman Gupta     2020-04-15  2074  	default:
8806211fe7b306 Anshuman Gupta     2020-04-15  2075  		if (IS_HASWELL(i915) || IS_BROADWELL(i915))
8806211fe7b306 Anshuman Gupta     2020-04-15  2076  			LPSP_CAPABLE(connector->connector_type == DRM_MODE_CONNECTOR_eDP);
8806211fe7b306 Anshuman Gupta     2020-04-15  2077  	}
8806211fe7b306 Anshuman Gupta     2020-04-15  2078  
8806211fe7b306 Anshuman Gupta     2020-04-15  2079  	return 0;
8806211fe7b306 Anshuman Gupta     2020-04-15  2080  }
8806211fe7b306 Anshuman Gupta     2020-04-15 @2081  DEFINE_SHOW_ATTRIBUTE(i915_lpsp_capability);
8806211fe7b306 Anshuman Gupta     2020-04-15  2082  
926b005cd8c4e3 Jani Nikula        2020-02-11  2083  static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
926b005cd8c4e3 Jani Nikula        2020-02-11  2084  {
926b005cd8c4e3 Jani Nikula        2020-02-11  2085  	struct drm_connector *connector = m->private;
926b005cd8c4e3 Jani Nikula        2020-02-11  2086  	struct drm_device *dev = connector->dev;
926b005cd8c4e3 Jani Nikula        2020-02-11  2087  	struct drm_crtc *crtc;
926b005cd8c4e3 Jani Nikula        2020-02-11  2088  	struct intel_dp *intel_dp;
926b005cd8c4e3 Jani Nikula        2020-02-11  2089  	struct drm_modeset_acquire_ctx ctx;
926b005cd8c4e3 Jani Nikula        2020-02-11  2090  	struct intel_crtc_state *crtc_state = NULL;
926b005cd8c4e3 Jani Nikula        2020-02-11  2091  	int ret = 0;
926b005cd8c4e3 Jani Nikula        2020-02-11  2092  	bool try_again = false;
926b005cd8c4e3 Jani Nikula        2020-02-11  2093  
926b005cd8c4e3 Jani Nikula        2020-02-11  2094  	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
926b005cd8c4e3 Jani Nikula        2020-02-11  2095  
926b005cd8c4e3 Jani Nikula        2020-02-11  2096  	do {
926b005cd8c4e3 Jani Nikula        2020-02-11  2097  		try_again = false;
926b005cd8c4e3 Jani Nikula        2020-02-11  2098  		ret = drm_modeset_lock(&dev->mode_config.connection_mutex,
926b005cd8c4e3 Jani Nikula        2020-02-11  2099  				       &ctx);
926b005cd8c4e3 Jani Nikula        2020-02-11  2100  		if (ret) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2101  			if (ret == -EDEADLK && !drm_modeset_backoff(&ctx)) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2102  				try_again = true;
926b005cd8c4e3 Jani Nikula        2020-02-11  2103  				continue;
926b005cd8c4e3 Jani Nikula        2020-02-11  2104  			}
926b005cd8c4e3 Jani Nikula        2020-02-11  2105  			break;
926b005cd8c4e3 Jani Nikula        2020-02-11  2106  		}
926b005cd8c4e3 Jani Nikula        2020-02-11  2107  		crtc = connector->state->crtc;
926b005cd8c4e3 Jani Nikula        2020-02-11  2108  		if (connector->status != connector_status_connected || !crtc) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2109  			ret = -ENODEV;
926b005cd8c4e3 Jani Nikula        2020-02-11  2110  			break;
926b005cd8c4e3 Jani Nikula        2020-02-11  2111  		}
926b005cd8c4e3 Jani Nikula        2020-02-11  2112  		ret = drm_modeset_lock(&crtc->mutex, &ctx);
926b005cd8c4e3 Jani Nikula        2020-02-11  2113  		if (ret == -EDEADLK) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2114  			ret = drm_modeset_backoff(&ctx);
926b005cd8c4e3 Jani Nikula        2020-02-11  2115  			if (!ret) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2116  				try_again = true;
926b005cd8c4e3 Jani Nikula        2020-02-11  2117  				continue;
926b005cd8c4e3 Jani Nikula        2020-02-11  2118  			}
926b005cd8c4e3 Jani Nikula        2020-02-11  2119  			break;
926b005cd8c4e3 Jani Nikula        2020-02-11  2120  		} else if (ret) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2121  			break;
926b005cd8c4e3 Jani Nikula        2020-02-11  2122  		}
926b005cd8c4e3 Jani Nikula        2020-02-11  2123  		intel_dp = intel_attached_dp(to_intel_connector(connector));
926b005cd8c4e3 Jani Nikula        2020-02-11  2124  		crtc_state = to_intel_crtc_state(crtc->state);
926b005cd8c4e3 Jani Nikula        2020-02-11  2125  		seq_printf(m, "DSC_Enabled: %s\n",
926b005cd8c4e3 Jani Nikula        2020-02-11  2126  			   yesno(crtc_state->dsc.compression_enable));
926b005cd8c4e3 Jani Nikula        2020-02-11  2127  		seq_printf(m, "DSC_Sink_Support: %s\n",
926b005cd8c4e3 Jani Nikula        2020-02-11  2128  			   yesno(drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)));
926b005cd8c4e3 Jani Nikula        2020-02-11  2129  		seq_printf(m, "Force_DSC_Enable: %s\n",
926b005cd8c4e3 Jani Nikula        2020-02-11  2130  			   yesno(intel_dp->force_dsc_en));
926b005cd8c4e3 Jani Nikula        2020-02-11  2131  		if (!intel_dp_is_edp(intel_dp))
926b005cd8c4e3 Jani Nikula        2020-02-11  2132  			seq_printf(m, "FEC_Sink_Support: %s\n",
926b005cd8c4e3 Jani Nikula        2020-02-11  2133  				   yesno(drm_dp_sink_supports_fec(intel_dp->fec_capable)));
926b005cd8c4e3 Jani Nikula        2020-02-11  2134  	} while (try_again);
926b005cd8c4e3 Jani Nikula        2020-02-11  2135  
926b005cd8c4e3 Jani Nikula        2020-02-11  2136  	drm_modeset_drop_locks(&ctx);
926b005cd8c4e3 Jani Nikula        2020-02-11  2137  	drm_modeset_acquire_fini(&ctx);
926b005cd8c4e3 Jani Nikula        2020-02-11  2138  
926b005cd8c4e3 Jani Nikula        2020-02-11  2139  	return ret;
926b005cd8c4e3 Jani Nikula        2020-02-11  2140  }
926b005cd8c4e3 Jani Nikula        2020-02-11  2141  
926b005cd8c4e3 Jani Nikula        2020-02-11  2142  static ssize_t i915_dsc_fec_support_write(struct file *file,
926b005cd8c4e3 Jani Nikula        2020-02-11  2143  					  const char __user *ubuf,
926b005cd8c4e3 Jani Nikula        2020-02-11  2144  					  size_t len, loff_t *offp)
926b005cd8c4e3 Jani Nikula        2020-02-11  2145  {
926b005cd8c4e3 Jani Nikula        2020-02-11  2146  	bool dsc_enable = false;
926b005cd8c4e3 Jani Nikula        2020-02-11  2147  	int ret;
926b005cd8c4e3 Jani Nikula        2020-02-11  2148  	struct drm_connector *connector =
926b005cd8c4e3 Jani Nikula        2020-02-11  2149  		((struct seq_file *)file->private_data)->private;
926b005cd8c4e3 Jani Nikula        2020-02-11  2150  	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
926b005cd8c4e3 Jani Nikula        2020-02-11  2151  	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
926b005cd8c4e3 Jani Nikula        2020-02-11  2152  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
926b005cd8c4e3 Jani Nikula        2020-02-11  2153  
926b005cd8c4e3 Jani Nikula        2020-02-11  2154  	if (len == 0)
926b005cd8c4e3 Jani Nikula        2020-02-11  2155  		return 0;
926b005cd8c4e3 Jani Nikula        2020-02-11  2156  
926b005cd8c4e3 Jani Nikula        2020-02-11  2157  	drm_dbg(&i915->drm,
926b005cd8c4e3 Jani Nikula        2020-02-11  2158  		"Copied %zu bytes from user to force DSC\n", len);
926b005cd8c4e3 Jani Nikula        2020-02-11  2159  
926b005cd8c4e3 Jani Nikula        2020-02-11  2160  	ret = kstrtobool_from_user(ubuf, len, &dsc_enable);
926b005cd8c4e3 Jani Nikula        2020-02-11  2161  	if (ret < 0)
926b005cd8c4e3 Jani Nikula        2020-02-11  2162  		return ret;
926b005cd8c4e3 Jani Nikula        2020-02-11  2163  
926b005cd8c4e3 Jani Nikula        2020-02-11  2164  	drm_dbg(&i915->drm, "Got %s for DSC Enable\n",
926b005cd8c4e3 Jani Nikula        2020-02-11  2165  		(dsc_enable) ? "true" : "false");
926b005cd8c4e3 Jani Nikula        2020-02-11  2166  	intel_dp->force_dsc_en = dsc_enable;
926b005cd8c4e3 Jani Nikula        2020-02-11  2167  
926b005cd8c4e3 Jani Nikula        2020-02-11  2168  	*offp += len;
926b005cd8c4e3 Jani Nikula        2020-02-11  2169  	return len;
926b005cd8c4e3 Jani Nikula        2020-02-11  2170  }
926b005cd8c4e3 Jani Nikula        2020-02-11  2171  
926b005cd8c4e3 Jani Nikula        2020-02-11  2172  static int i915_dsc_fec_support_open(struct inode *inode,
926b005cd8c4e3 Jani Nikula        2020-02-11  2173  				     struct file *file)
926b005cd8c4e3 Jani Nikula        2020-02-11  2174  {
926b005cd8c4e3 Jani Nikula        2020-02-11  2175  	return single_open(file, i915_dsc_fec_support_show,
926b005cd8c4e3 Jani Nikula        2020-02-11  2176  			   inode->i_private);
926b005cd8c4e3 Jani Nikula        2020-02-11  2177  }
926b005cd8c4e3 Jani Nikula        2020-02-11  2178  
926b005cd8c4e3 Jani Nikula        2020-02-11  2179  static const struct file_operations i915_dsc_fec_support_fops = {
926b005cd8c4e3 Jani Nikula        2020-02-11  2180  	.owner = THIS_MODULE,
926b005cd8c4e3 Jani Nikula        2020-02-11  2181  	.open = i915_dsc_fec_support_open,
926b005cd8c4e3 Jani Nikula        2020-02-11  2182  	.read = seq_read,
926b005cd8c4e3 Jani Nikula        2020-02-11  2183  	.llseek = seq_lseek,
926b005cd8c4e3 Jani Nikula        2020-02-11  2184  	.release = single_release,
926b005cd8c4e3 Jani Nikula        2020-02-11  2185  	.write = i915_dsc_fec_support_write
926b005cd8c4e3 Jani Nikula        2020-02-11  2186  };
926b005cd8c4e3 Jani Nikula        2020-02-11  2187  
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2188  static int vrr_range_show(struct seq_file *m, void *data)
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2189  {
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2190  	struct drm_connector *connector = m->private;
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2191  
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2192  	if (connector->status != connector_status_connected)
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2193  		return -ENODEV;
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2194  
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2195  	seq_printf(m, "Vrr_capable: %s\n", yesno(intel_dp_is_vrr_capable(connector)));
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2196  	seq_printf(m, "Min: %u\n", (u8)connector->display_info.monitor_range.min_vfreq);
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2197  	seq_printf(m, "Max: %u\n", (u8)connector->display_info.monitor_range.max_vfreq);
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2198  
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2199  	return 0;
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2200  }
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2201  DEFINE_SHOW_ATTRIBUTE(vrr_range);
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2202  
926b005cd8c4e3 Jani Nikula        2020-02-11  2203  /**
926b005cd8c4e3 Jani Nikula        2020-02-11  2204   * intel_connector_debugfs_add - add i915 specific connector debugfs files
926b005cd8c4e3 Jani Nikula        2020-02-11  2205   * @connector: pointer to a registered drm_connector
926b005cd8c4e3 Jani Nikula        2020-02-11  2206   *
926b005cd8c4e3 Jani Nikula        2020-02-11  2207   * Cleanup will be done by drm_connector_unregister() through a call to
926b005cd8c4e3 Jani Nikula        2020-02-11  2208   * drm_debugfs_connector_remove().
926b005cd8c4e3 Jani Nikula        2020-02-11  2209   *
926b005cd8c4e3 Jani Nikula        2020-02-11  2210   * Returns 0 on success, negative error codes on error.
926b005cd8c4e3 Jani Nikula        2020-02-11  2211   */
926b005cd8c4e3 Jani Nikula        2020-02-11  2212  int intel_connector_debugfs_add(struct drm_connector *connector)
926b005cd8c4e3 Jani Nikula        2020-02-11  2213  {
926b005cd8c4e3 Jani Nikula        2020-02-11  2214  	struct dentry *root = connector->debugfs_entry;
926b005cd8c4e3 Jani Nikula        2020-02-11  2215  	struct drm_i915_private *dev_priv = to_i915(connector->dev);
926b005cd8c4e3 Jani Nikula        2020-02-11  2216  
926b005cd8c4e3 Jani Nikula        2020-02-11  2217  	/* The connector must have been registered beforehands. */
926b005cd8c4e3 Jani Nikula        2020-02-11  2218  	if (!root)
926b005cd8c4e3 Jani Nikula        2020-02-11  2219  		return -ENODEV;
926b005cd8c4e3 Jani Nikula        2020-02-11  2220  
926b005cd8c4e3 Jani Nikula        2020-02-11  2221  	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2222  		debugfs_create_file("i915_panel_timings", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2223  				    connector, &i915_panel_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2224  		debugfs_create_file("i915_psr_sink_status", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2225  				    connector, &i915_psr_sink_status_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2226  	}
926b005cd8c4e3 Jani Nikula        2020-02-11  2227  
926b005cd8c4e3 Jani Nikula        2020-02-11  2228  	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2229  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2230  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2231  		debugfs_create_file("i915_hdcp_sink_capability", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2232  				    connector, &i915_hdcp_sink_capability_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2233  	}
926b005cd8c4e3 Jani Nikula        2020-02-11  2234  
926b005cd8c4e3 Jani Nikula        2020-02-11 @2235  	if (INTEL_GEN(dev_priv) >= 10 &&

:::::: The code at line 2235 was first introduced by commit
:::::: 926b005cd8c4e325ab918edea0fbdd1d25d1ba28 drm/i915: split out display debugfs to a separate file

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ibTvN161/egqYuK8
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
6LniuIkLa4X/B7mWVWvE5QEA

--ibTvN161/egqYuK8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--ibTvN161/egqYuK8--
