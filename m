Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA17515F3C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 18:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E984A10E43C;
	Sat, 30 Apr 2022 16:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B2610E43C;
 Sat, 30 Apr 2022 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651336265; x=1682872265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ez7eBwyJ3k2dkbhy4K0VxB+rg3DuUI9jbpe46EDuQFc=;
 b=EWFkUr2sQ+K01F7OLYL5YmSAYQi+L8mw6Xoidqyzv/bUc91fz2YAazSY
 NaiT9V1aTuRourHa4SqHDCDWYZKuEg6ju33ptuR8gPugir9+hHg07i2z/
 PgAUmXqzl/DwZT1agRVzWfWqzYiWULvS+RyJ6y2gGE7HeO7jccmHrGExK
 RRZwPE+OevyQbfunu4+CCbVGawRAMmbwH5gVFoj3OrsW2bwFvUkyMYugj
 waianlUH5uT+7oTRTp8yJEr2Q0yormUpCDH1NJWCBDmd2i1tqjHlBPoZe
 KyPZ6K6F8F4OGPjQ/UdE+ED56rRprj4M8gOjtTAcBu3rrjvZH00xupv0O Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="267062827"
X-IronPort-AV: E=Sophos;i="5.91,188,1647327600"; d="scan'208";a="267062827"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2022 09:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,188,1647327600"; d="scan'208";a="662823184"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2022 09:31:00 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nkpzo-0007PD-8I;
 Sat, 30 Apr 2022 16:31:00 +0000
Date: Sun, 1 May 2022 00:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v3 2/2] ALSA: hda - identify when audio is provided by a
 video driver
Message-ID: <202205010035.FAx0YtE1-lkp@intel.com>
References: <6b5f1e2cec0137d5aab089a7e7497972ff5addb1.1651326000.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b5f1e2cec0137d5aab089a7e7497972ff5addb1.1651326000.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 mauro.chehab@linux.intel.com, David Airlie <airlied@linux.ie>,
 Greg KH <greg@kroah.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@intel.com>, linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

I love your patch! Yet something to improve:

[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on linus/master v5.18-rc4 next-20220429]
[cannot apply to tiwai-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/Let-userspace-know-when-snd-hda-intel-needs-i915/20220430-214332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
config: ia64-randconfig-r023-20220428 (https://download.01.org/0day-ci/archive/20220501/202205010035.FAx0YtE1-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/32f6557b5cc77c3cc2fcf6e68f11d989e31c954d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/Let-userspace-know-when-snd-hda-intel-needs-i915/20220430-214332
        git checkout 32f6557b5cc77c3cc2fcf6e68f11d989e31c954d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash sound/hda/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:153,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from arch/ia64/include/asm/sections.h:11,
                    from include/linux/interrupt.h:21,
                    from include/linux/pci.h:38,
                    from sound/hda/hdac_component.c:6:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:127:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     127 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   sound/hda/hdac_component.c: In function 'hdac_component_master_bind':
>> sound/hda/hdac_component.c:202:14: error: implicit declaration of function '__try_module_get'; did you mean 'try_module_get'? [-Werror=implicit-function-declaration]
     202 |         if (!__try_module_get(acomp->ops->owner, dev->driver->owner)) {
         |              ^~~~~~~~~~~~~~~~
         |              try_module_get
   cc1: some warnings being treated as errors


vim +202 sound/hda/hdac_component.c

     3	
     4	#include <linux/init.h>
     5	#include <linux/module.h>
   > 6	#include <linux/pci.h>
     7	#include <linux/component.h>
     8	#include <sound/core.h>
     9	#include <sound/hdaudio.h>
    10	#include <sound/hda_component.h>
    11	#include <sound/hda_register.h>
    12	
    13	static void hdac_acomp_release(struct device *dev, void *res)
    14	{
    15	}
    16	
    17	static struct drm_audio_component *hdac_get_acomp(struct device *dev)
    18	{
    19		return devres_find(dev, hdac_acomp_release, NULL, NULL);
    20	}
    21	
    22	/**
    23	 * snd_hdac_set_codec_wakeup - Enable / disable HDMI/DP codec wakeup
    24	 * @bus: HDA core bus
    25	 * @enable: enable or disable the wakeup
    26	 *
    27	 * This function is supposed to be used only by a HD-audio controller
    28	 * driver that needs the interaction with graphics driver.
    29	 *
    30	 * This function should be called during the chip reset, also called at
    31	 * resume for updating STATESTS register read.
    32	 *
    33	 * Returns zero for success or a negative error code.
    34	 */
    35	int snd_hdac_set_codec_wakeup(struct hdac_bus *bus, bool enable)
    36	{
    37		struct drm_audio_component *acomp = bus->audio_component;
    38	
    39		if (!acomp || !acomp->ops)
    40			return -ENODEV;
    41	
    42		if (!acomp->ops->codec_wake_override)
    43			return 0;
    44	
    45		dev_dbg(bus->dev, "%s codec wakeup\n",
    46			enable ? "enable" : "disable");
    47	
    48		acomp->ops->codec_wake_override(acomp->dev, enable);
    49	
    50		return 0;
    51	}
    52	EXPORT_SYMBOL_GPL(snd_hdac_set_codec_wakeup);
    53	
    54	/**
    55	 * snd_hdac_display_power - Power up / down the power refcount
    56	 * @bus: HDA core bus
    57	 * @idx: HDA codec address, pass HDA_CODEC_IDX_CONTROLLER for controller
    58	 * @enable: power up or down
    59	 *
    60	 * This function is used by either HD-audio controller or codec driver that
    61	 * needs the interaction with graphics driver.
    62	 *
    63	 * This function updates the power status, and calls the get_power() and
    64	 * put_power() ops accordingly, toggling the codec wakeup, too.
    65	 */
    66	void snd_hdac_display_power(struct hdac_bus *bus, unsigned int idx, bool enable)
    67	{
    68		struct drm_audio_component *acomp = bus->audio_component;
    69	
    70		dev_dbg(bus->dev, "display power %s\n",
    71			enable ? "enable" : "disable");
    72	
    73		mutex_lock(&bus->lock);
    74		if (enable)
    75			set_bit(idx, &bus->display_power_status);
    76		else
    77			clear_bit(idx, &bus->display_power_status);
    78	
    79		if (!acomp || !acomp->ops)
    80			goto unlock;
    81	
    82		if (bus->display_power_status) {
    83			if (!bus->display_power_active) {
    84				unsigned long cookie = -1;
    85	
    86				if (acomp->ops->get_power)
    87					cookie = acomp->ops->get_power(acomp->dev);
    88	
    89				snd_hdac_set_codec_wakeup(bus, true);
    90				snd_hdac_set_codec_wakeup(bus, false);
    91				bus->display_power_active = cookie;
    92			}
    93		} else {
    94			if (bus->display_power_active) {
    95				unsigned long cookie = bus->display_power_active;
    96	
    97				if (acomp->ops->put_power)
    98					acomp->ops->put_power(acomp->dev, cookie);
    99	
   100				bus->display_power_active = 0;
   101			}
   102		}
   103	 unlock:
   104		mutex_unlock(&bus->lock);
   105	}
   106	EXPORT_SYMBOL_GPL(snd_hdac_display_power);
   107	
   108	/**
   109	 * snd_hdac_sync_audio_rate - Set N/CTS based on the sample rate
   110	 * @codec: HDA codec
   111	 * @nid: the pin widget NID
   112	 * @dev_id: device identifier
   113	 * @rate: the sample rate to set
   114	 *
   115	 * This function is supposed to be used only by a HD-audio controller
   116	 * driver that needs the interaction with graphics driver.
   117	 *
   118	 * This function sets N/CTS value based on the given sample rate.
   119	 * Returns zero for success, or a negative error code.
   120	 */
   121	int snd_hdac_sync_audio_rate(struct hdac_device *codec, hda_nid_t nid,
   122				     int dev_id, int rate)
   123	{
   124		struct hdac_bus *bus = codec->bus;
   125		struct drm_audio_component *acomp = bus->audio_component;
   126		int port, pipe;
   127	
   128		if (!acomp || !acomp->ops || !acomp->ops->sync_audio_rate)
   129			return -ENODEV;
   130		port = nid;
   131		if (acomp->audio_ops && acomp->audio_ops->pin2port) {
   132			port = acomp->audio_ops->pin2port(codec, nid);
   133			if (port < 0)
   134				return -EINVAL;
   135		}
   136		pipe = dev_id;
   137		return acomp->ops->sync_audio_rate(acomp->dev, port, pipe, rate);
   138	}
   139	EXPORT_SYMBOL_GPL(snd_hdac_sync_audio_rate);
   140	
   141	/**
   142	 * snd_hdac_acomp_get_eld - Get the audio state and ELD via component
   143	 * @codec: HDA codec
   144	 * @nid: the pin widget NID
   145	 * @dev_id: device identifier
   146	 * @audio_enabled: the pointer to store the current audio state
   147	 * @buffer: the buffer pointer to store ELD bytes
   148	 * @max_bytes: the max bytes to be stored on @buffer
   149	 *
   150	 * This function is supposed to be used only by a HD-audio controller
   151	 * driver that needs the interaction with graphics driver.
   152	 *
   153	 * This function queries the current state of the audio on the given
   154	 * digital port and fetches the ELD bytes onto the given buffer.
   155	 * It returns the number of bytes for the total ELD data, zero for
   156	 * invalid ELD, or a negative error code.
   157	 *
   158	 * The return size is the total bytes required for the whole ELD bytes,
   159	 * thus it may be over @max_bytes.  If it's over @max_bytes, it implies
   160	 * that only a part of ELD bytes have been fetched.
   161	 */
   162	int snd_hdac_acomp_get_eld(struct hdac_device *codec, hda_nid_t nid, int dev_id,
   163				   bool *audio_enabled, char *buffer, int max_bytes)
   164	{
   165		struct hdac_bus *bus = codec->bus;
   166		struct drm_audio_component *acomp = bus->audio_component;
   167		int port, pipe;
   168	
   169		if (!acomp || !acomp->ops || !acomp->ops->get_eld)
   170			return -ENODEV;
   171	
   172		port = nid;
   173		if (acomp->audio_ops && acomp->audio_ops->pin2port) {
   174			port = acomp->audio_ops->pin2port(codec, nid);
   175			if (port < 0)
   176				return -EINVAL;
   177		}
   178		pipe = dev_id;
   179		return acomp->ops->get_eld(acomp->dev, port, pipe, audio_enabled,
   180					   buffer, max_bytes);
   181	}
   182	EXPORT_SYMBOL_GPL(snd_hdac_acomp_get_eld);
   183	
   184	static int hdac_component_master_bind(struct device *dev)
   185	{
   186		struct drm_audio_component *acomp = hdac_get_acomp(dev);
   187		int ret;
   188	
   189		if (WARN_ON(!acomp))
   190			return -EINVAL;
   191	
   192		ret = component_bind_all(dev, acomp);
   193		if (ret < 0)
   194			return ret;
   195	
   196		if (WARN_ON(!(acomp->dev && acomp->ops))) {
   197			ret = -EINVAL;
   198			goto out_unbind;
   199		}
   200	
   201		/* pin the module to avoid dynamic unbinding, but only if given */
 > 202		if (!__try_module_get(acomp->ops->owner, dev->driver->owner)) {
   203			ret = -ENODEV;
   204			goto out_unbind;
   205		}
   206	
   207		if (acomp->audio_ops && acomp->audio_ops->master_bind) {
   208			ret = acomp->audio_ops->master_bind(dev, acomp);
   209			if (ret < 0)
   210				goto module_put;
   211		}
   212	
   213		complete_all(&acomp->master_bind_complete);
   214		return 0;
   215	
   216	 module_put:
   217		module_put(acomp->ops->owner);
   218	out_unbind:
   219		component_unbind_all(dev, acomp);
   220		complete_all(&acomp->master_bind_complete);
   221	
   222		return ret;
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
