Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F753253599
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 18:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE989E9B;
	Wed, 26 Aug 2020 16:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3C89E9B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 16:59:04 +0000 (UTC)
IronPort-SDR: fiogLaxFx866rEOe9RA1B3dh90HiszVafhskbb0yHmajdTeEaSDttKK9vhKQRcTfbd3kvLG/Dj
 dTdZNIYKI+pQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="155595343"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
 d="gz'50?scan'50,208,50";a="155595343"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 09:59:04 -0700
IronPort-SDR: XbV2HGsdCJYCpk5/LGSxLky7jIrfcUvisfguhSMkjt96X6ZbLLPylQAFCl8iakQqWDlHSiF1G4
 6GANGQv0me/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
 d="gz'50?scan'50,208,50";a="403123092"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2020 09:59:01 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kAylJ-0001XI-2M; Wed, 26 Aug 2020 16:59:01 +0000
Date: Thu, 27 Aug 2020 00:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/plane: add drmm_universal_plane_alloc()
Message-ID: <202008270018.Tz1BOgNZ%lkp@intel.com>
References: <20200826123506.19560-3-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <20200826123506.19560-3-p.zabel@pengutronix.de>
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
Cc: kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philipp,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master drm-exynos/exynos-drm-next v5.9-rc2 next-20200826]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Philipp-Zabel/drm-add-drmm_encoder_alloc/20200826-203629
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: arm-randconfig-r001-20200826 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_plane.c:156:5: warning: no previous prototype for '__drm_universal_plane_init' [-Wmissing-prototypes]
     156 | int __drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_plane.c: In function '__drm_universal_plane_init':
>> drivers/gpu/drm/drm_plane.c:223:3: warning: function '__drm_universal_plane_init' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     223 |   plane->name = kvasprintf(GFP_KERNEL, name, ap);
         |   ^~~~~

# https://github.com/0day-ci/linux/commit/d809a51da3d2939a84ecf6b4ada8f5be6c3ecb35
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Philipp-Zabel/drm-add-drmm_encoder_alloc/20200826-203629
git checkout d809a51da3d2939a84ecf6b4ada8f5be6c3ecb35
vim +/__drm_universal_plane_init +156 drivers/gpu/drm/drm_plane.c

   155	
 > 156	int __drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
   157				       uint32_t possible_crtcs,
   158				       const struct drm_plane_funcs *funcs,
   159				       const uint32_t *formats, unsigned int format_count,
   160				       const uint64_t *format_modifiers,
   161				       enum drm_plane_type type,
   162				       const char *name, va_list ap)
   163	{
   164		struct drm_mode_config *config = &dev->mode_config;
   165		unsigned int format_modifier_count = 0;
   166		int ret;
   167	
   168		/* plane index is used with 32bit bitmasks */
   169		if (WARN_ON(config->num_total_plane >= 32))
   170			return -EINVAL;
   171	
   172		WARN_ON(drm_drv_uses_atomic_modeset(dev) &&
   173			(!funcs->atomic_destroy_state ||
   174			 !funcs->atomic_duplicate_state));
   175	
   176		ret = drm_mode_object_add(dev, &plane->base, DRM_MODE_OBJECT_PLANE);
   177		if (ret)
   178			return ret;
   179	
   180		drm_modeset_lock_init(&plane->mutex);
   181	
   182		plane->base.properties = &plane->properties;
   183		plane->dev = dev;
   184		plane->funcs = funcs;
   185		plane->format_types = kmalloc_array(format_count, sizeof(uint32_t),
   186						    GFP_KERNEL);
   187		if (!plane->format_types) {
   188			DRM_DEBUG_KMS("out of memory when allocating plane\n");
   189			drm_mode_object_unregister(dev, &plane->base);
   190			return -ENOMEM;
   191		}
   192	
   193		/*
   194		 * First driver to need more than 64 formats needs to fix this. Each
   195		 * format is encoded as a bit and the current code only supports a u64.
   196		 */
   197		if (WARN_ON(format_count > 64))
   198			return -EINVAL;
   199	
   200		if (format_modifiers) {
   201			const uint64_t *temp_modifiers = format_modifiers;
   202	
   203			while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
   204				format_modifier_count++;
   205		}
   206	
   207		if (format_modifier_count)
   208			config->allow_fb_modifiers = true;
   209	
   210		plane->modifier_count = format_modifier_count;
   211		plane->modifiers = kmalloc_array(format_modifier_count,
   212						 sizeof(format_modifiers[0]),
   213						 GFP_KERNEL);
   214	
   215		if (format_modifier_count && !plane->modifiers) {
   216			DRM_DEBUG_KMS("out of memory when allocating plane\n");
   217			kfree(plane->format_types);
   218			drm_mode_object_unregister(dev, &plane->base);
   219			return -ENOMEM;
   220		}
   221	
   222		if (name) {
 > 223			plane->name = kvasprintf(GFP_KERNEL, name, ap);
   224		} else {
   225			plane->name = kasprintf(GFP_KERNEL, "plane-%d",
   226						drm_num_planes(dev));
   227		}
   228		if (!plane->name) {
   229			kfree(plane->format_types);
   230			kfree(plane->modifiers);
   231			drm_mode_object_unregister(dev, &plane->base);
   232			return -ENOMEM;
   233		}
   234	
   235		memcpy(plane->format_types, formats, format_count * sizeof(uint32_t));
   236		plane->format_count = format_count;
   237		memcpy(plane->modifiers, format_modifiers,
   238		       format_modifier_count * sizeof(format_modifiers[0]));
   239		plane->possible_crtcs = possible_crtcs;
   240		plane->type = type;
   241	
   242		list_add_tail(&plane->head, &config->plane_list);
   243		plane->index = config->num_total_plane++;
   244	
   245		drm_object_attach_property(&plane->base,
   246					   config->plane_type_property,
   247					   plane->type);
   248	
   249		if (drm_core_check_feature(dev, DRIVER_ATOMIC)) {
   250			drm_object_attach_property(&plane->base, config->prop_fb_id, 0);
   251			drm_object_attach_property(&plane->base, config->prop_in_fence_fd, -1);
   252			drm_object_attach_property(&plane->base, config->prop_crtc_id, 0);
   253			drm_object_attach_property(&plane->base, config->prop_crtc_x, 0);
   254			drm_object_attach_property(&plane->base, config->prop_crtc_y, 0);
   255			drm_object_attach_property(&plane->base, config->prop_crtc_w, 0);
   256			drm_object_attach_property(&plane->base, config->prop_crtc_h, 0);
   257			drm_object_attach_property(&plane->base, config->prop_src_x, 0);
   258			drm_object_attach_property(&plane->base, config->prop_src_y, 0);
   259			drm_object_attach_property(&plane->base, config->prop_src_w, 0);
   260			drm_object_attach_property(&plane->base, config->prop_src_h, 0);
   261		}
   262	
   263		if (config->allow_fb_modifiers)
   264			create_in_format_blob(dev, plane);
   265	
   266		return 0;
   267	}
   268	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--LQksG6bCIzRHxTLp
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICEyFRl8AAy5jb25maWcAlFxbc+O2kn7Pr1BNXpKH5Pgy453slh9AEpQQkQSHACXLLyyN
RzNxxba8spxk/v12A7wAYFPOnqpzzqi7cWs0ur9ugP7xhx9n7PW4f9we7++2Dw/fZ992T7vD
9rj7Mvt6/7D7n1kiZ4XUM54I/SsIZ/dPr//8Z3t4nH349eOvZ7Pl7vC0e5jF+6ev999eoeH9
/umHH3+IZZGKeRPHzYpXSsii0fxGX7+Dhr88YBe/fHt63W0/3//y7e5u9tM8jn+e/fbr5a9n
75ymQjXAuP7ekeZDd9e/nV2enXWMLOnpF5fvz8x/+n4yVsx79pnT/YKphqm8mUsth0Echigy
UfCBJapPzVpWy4ES1SJLtMh5o1mU8UbJSgMXFPDjbG4U+TB72R1fnweVRJVc8qIBjai8dPou
hG54sWpYBesRudDXlxfQSzcrmZcCBtBc6dn9y+xpf8SOewXImGXdGt+9o8gNq91lmpk3imXa
kV+wFW+WvCp41sxvhTM9l5Pd5ozm3NxOtZBTjPfA6FfpDO0uMuTjBAgluJMYN5Gne3xPdJjw
lNWZNnvjaKkjL6TSBcv59bufnvZPu597AbVmjurURq1EGY8I+P+xztzJllKJmyb/VPOak9Nd
Mx0vmml+XEmlmpznsto0TGsWL4h11YpnInIHZjUcb1fSWDDY++zl9fPL95fj7nGw4DkveCVi
cxzKSkbOCXFZaiHX05wm4yue0XxR/M5jjabsGE2VAEuBbpuKK14kdNN44VotUhKZM+H1VCRw
kCwZJXzxVFYxTxq9qDhLRDF3teQOlPConqfK34Xd05fZ/mugt3CaMZzKJSy+0KpzFfr+cXd4
oXStRbwEX8FBZdpZw21TQl8yEbE7v0IiR8DyiE2H/0MX3OiKxUu7sAmO1cHAN906g4v5Aveg
Qb9XKTOBduGjdTimXXGelxo6K6jZdeyVzOpCs2rjHQvLPNEsltCq02Zc1v/R25c/Z0eYzmwL
U3s5bo8vs+3d3f716Xj/9G3Q70pU0LqsGxabPoIdN+r32cQsiE5wt33DMlGCHiVSCR6kmMPZ
BQlNHm3N1FJpphWlBiU8fSnRO6lEKIxMCWmo/0JTRqNVXM8UZZzFpgGeOzb8bPgNWCe1XcoK
u80DEi7S9NGeFoI1ItUJp+hozryfXrtifyX9/iztP5wdW/YWJmOXvAC3YK2+j7EYTFNwaiLV
1xdng2mKQi8hwqY8kDm/DF2Cihfgc4xj6IxY3f2x+/L6sDvMvu62x9fD7sWQ22UQ3P40zytZ
l8rdE4gHMWW3UbZsxR1nYH7bGQ3UlImqITlxqpoIXOpaJHoxkOFA+OJDiLL0UiSUJbfcKjEQ
I2yUwnG/5dV0u4SvhOu6WjLYOZ4rahq8SulIavlReZJtogBl6DJe9jJMe2tByKBKsE1y/Qse
L0sJpoMuVsvKWYy1EoRx3Z71fQKUgH1IOPjDmGn/tHc7wjO2cfAf7D1oy2CbytlP85vl0JuS
NYaBAfdUSQAKgRAB4cKj+OgQCC4oNHwZ/PYgYCQlunP8N634uJEl+FJxyzFOmQ2UVc6KmAx6
gbSCf3hAzAIwF5nWIjm/cvRUpsMP69iG34FsDg5XALiqvK2Zc52DQzKjsSwjV2X3j5Dozp9F
LcNQFin2EdjzOeHvpsiFC/wdNxcxBYqpM0cJaQ1gIPgJp9VRQildeSXmBctSx4TMrFyCATsu
QS3AJXn4U0hi1UI2dRXESpasBMy5VRV1hKDriFWVMNvQwXyU3eRqTGmYu5ieahSDR0aLFfes
oRvasQLYcRNs3SWyCoA6JpLDdKBlAfDPO9OV4p/c5RmHYqjEyqAnniSu9zUWi0eg6QFlt/VI
hJk1qxwmKz2cWMbnZ+9HaL/N5Mvd4ev+8Lh9utvN+F+7J4ADDIJOjIAAwN0Q/f1hgxWEw5Pw
41+O2MOs3A5n0Z5n+JgeMw259dI7ehmL6OOW1RHltTMZhe1h/6o57+AU3duiTlNIKUoGgma1
DBw31f9GaZ6bgIAFCZEKkPTSHEAbqcg8dG5gjIkIHtT2qwuD1eWee2tUXZay0mDmJWgPHBQL
8yo0IMA4GCOdppA5Li2AantwAU+8hEgzZlh5wLppxuZqzE/BY3FWZRv43VgHEOCgxZpDcqHH
DDhwIqogssFGeGHMHLN+kbVJR5XLzmFbMGcuF6ANBOpOXsMhnOaQIncJ82I8sOcty7mt8pjU
VV1ftEjNYMmZ/v68Gw5HntfBJPOcAa4pIGQKmGkOKenHU3x2c31+5bg9I4LxpYQtxIhHmqIR
45Fi5+dnJwTK3y5vbggDNdwUInBUiWTOPb+LLCHLy4ub6Y7FTfn+5gQ/kSu6bmG45Q2bZlZl
PM006z2xYHUZX5ycmATln488YrrfHz8f7r98283E4/PD7hF8kylwOl7QNIdjrEbKAheoJITG
BsLDyget4/26+PgBQlsiirfFsOw0tXcF12tRJC0CaV3FiWX0R9Pd8xHNDNklJuVhf7d7edkf
AovH/Nfsg+OVgXR58dd7n8IiSA74KqCWhpzxOYs3PieGEwpx5P06IulipQO6LDeEuM4iqpPy
/MOY4h9fpGIosyUjNVZEOmRoThNhJ9gm4F7uAdzE4xL7abzTErFFs+BZ6YW7CTJ6u+y8VYzN
NT90PBuWwY3Oi6aSfU7S5ZOODzOLi16xjPP8vD8ch1XBXJ1EQbEmyccEiDTC7drtycUZqZvW
9hFelZnQzSVZZemZiOldfXacCzpl6NjnVK8maMs0VVxfn/0TnfmXB/ZQQepbCjncHSxuMZYB
DjsbBgHalAsC1oXPchgfztyVAOVyupcP0ywYmx7hGkbwE8hFhVUtz11xFgmqNYID68vSolmB
8bjQEyJ1gOKRVOqJyjS6h3VXdi1ZMeXC1gwQngm/4DoXNWRPWeSbeC6TGuFW5uJdU7PEsNnc
yoLLCn3g+XnfDO0+R+wIIMXJYLEsgFW3tdAGBcSlV3hUPEZkSZpNxXw00VHIQp8PeHvTt0cN
3PNs/9zFlX5wdDkypdSkAV75kLvL+80scoBvVR1TQeLWpNeVzO113NmYHil1feZqm5Ulh4iS
NIkO9gHngdQWfZ9kNnGe4GVak5pBYLRMssTPlE81g9nCLKgM3wpgmaLv6EaU7cXOxJ3PDafB
RFwxBSilJrccCy/NLeaESeKkljwVoO868ije7uTCH6xzjO6+d4XrWbn/e3eY5dun7TcTqIHR
89LD7n9fd09332cvd9sHr46Nxyut+Cc/aiGlmcsVXgVB+sn1BBuUnbtZQc/EgnMYuQyjKy9j
64kSzBuN5BpiF5vAg2QTDHqmcEaZAdVAgt3CtJI3VwA8BGkm2T/VebBast/JxVGC/ZImNsZZ
Ab1vw7yvh9uP2dfQUGZfDvd/2ezdLf4TFtX3Ib48BOhOeBWojtJlJYBlKrHqLoRCIZwtHpwJ
HOzJgZ+uJxTXy2juVBETbRlorbzHZ+BO+oXMkn79jrMBbrumXil0I1dlVi8uZXRkbfLwsN/i
DcrseX//dJztHl8fuscRdnrH2cNu+wIu4Gk3cGePr0D6vIOFP+zujrsvbkRIS94Ua/hfUofI
TZnSI36XBkxNyKJZs4jHfhFURCpzyi3ShQWD6XNXtZMjWHXdHx7/3h7cnRpWJqp8zSqOERoS
Nao+um7itC2jOpjAofaBwr3PlXIOZtN1P8r/wJHPfuL/HHdPL/efwR76OQosTH3d3u1+nqke
JPfdYkRYsYqqTSKLKxc2IMUEbWVDY5oEzAphBCCKdYWR2IX7yO1vkGwE8uYAtoxkE05ttJ2Y
kdtJeyHQB94+TDvyMSsVIrBxCEfuxBMVvLXX9k3CssmFFvPOYrzWbULUlLHAbIK05P/Pvtj7
9d23w3b2tROzztD1hRMC/dEJjdPzItWm9B4Qmd+Qf7Fzvx43MC4+XLUsB3p0zA/nF8icAChG
inH1lki8gCyQXZxBHinpokIrWMpsc3559iHs0HvDtD3c/XF/BIcEsPWXL7tn0IvvI9o+pS1g
OmHC5BAOeUBhtlZHWMrvgL8gWETu8xB07WChS441TZ6laGQOjB/X/SCTQACNz5wAhQOs9d7k
2DdIYStLrbgmGZB0knTvdmVImUw1dCHlMmBiigy/wf5rWTt99YcQFm+imX2CMhYwTLyDQUDn
Xt32Vw6AT7RIN90N3lhgyXkZXvz1TDymtiBKLsvMqs0wmvVCaJ4JpYN+Li8iSLghrW500EnF
52C7RWJLzE2bf7Ey1GF7MeKSzJ0CtqfopiJi+0T8Tk2dsqsh5cQXWeCI8cqifUfnd2H6BgPQ
PNbScYjte0GfbZ65eJmkx57KtePJNzqG/eY7EyNFPzZxJSCBbuuiJY/xFmLg29xambMDxwyv
wAgTMRzYRJl796mDqr1idiDAb8A0QuMmWn0c71GH2bUsE7kubIOMbWQdmpkpAra2qjNnClil
iurA4uIMtquJQOmAAxJHWuIbSTFXtcIk+HLEYMEztTZrteaPm+ADokJCjAN9C6xEpGnosPCq
2lSM21eJ1fqGOp8avIAmZU6wwuZtEcXKOGYaMKeqNNiTuVKBCBK81cD7IfeiTo2jSixXv3ze
vuy+zP60FZHnw/7rfZvRDvAMxIg8PpyGEWsDTHubO9ySnRjJsxd8Wlxm9dzWd/sJuERnXh25
iTex2fMMjXpDhllHGjAyagX+W4F5EmtyZPF4WSc7MfQgMJ2AB3eFb0TxHqmBAeCtvxvpzH24
wrvcoTrU+gp3fq3h2GIcwkNSJa1UXYQSA7/1wVTnqor7J80Tzyk6yYk3JC0bNw5QqTolg9e5
a4CrSqGz7Z/uNCI3N45k07oA7wnuYZNHMqNF4JjlndwSHxzQWjCuWFccdSmXbqyP2rdi/c9l
A27fXD4HfgdZKlaQSPBPtYeauidAkZqTxOCN8PBiSPN5FZh7IIM12IRqDC5Zap3R7yjNe7Q2
7zChuPLntY6C2bcvrIQ0JyveTHBje33lTQb6avJP5ObYueJ1Sfi+11Up7JwsGW1/KGA/HoDD
bnC28EG4Tbm3h+O9Sfrx3sXPtBkgOG1MPFnhuSaPiUqkGkRHOWVPHlLwYERXW/knzLl8DQIN
MYeQI3L7QM8+E5fDe0QnFwApIe2VQwJh2P+UwmEuN5G70R05Sr2HMfCz6fbTCNAvr72p9KFC
FedOslC0W6MAAxsn5J4k/0EB0wBx4qbK10QkBYzXSHBFGSTm6B2wLoxgtivo2RrCP7u71+MW
01T8nmZmXrocHTVFokhzjZDKUXJPa9KkdPEZkPwHRK2oiitRhigcJ9ny08wv5Dpk6iAOXPwe
ZVXilyml+WYFcSzREXjIiZI6zDYsqA+J/IRyjOby3eP+8N2pq43TTZyg95DEzLiQiSkVNTkL
syNMfMyLLH/T2/cfQsmwjGVvDkttQA1AOHX9m/lP0DJCz+u2awkWEFIgMaCZa8iKo9V5eD0X
8yqsrJnkseledXUDAtRyc708R7gJaaDwKzRLRRXxOmBtAHUuCmPL1+/PfrvqJMx1NAANg2OX
fuki4+Ci8NKZqsxVMF0/+Y7dW2P4YZ0tQXIBMhIZwHl1/V/DyLfYMWl2t6WUtG++jWoaldyq
8VO1IPU2r5fAAVXcmlbf1ubkuIdd6kaqAuADZJdt/jg4e16Z29GJx/1zfIYMYWSRs/Z5W3t6
pg/IsGnecyf8kmmOLsqx72Vk79Y6tGWOXrE7/r0//InFYqoMDCvklNsAz+pkHPgL/JJnKoaW
CEapx6ZpA0TKVPucm0ZQGeYelMXdpG7RDX9hIQKhZkBl2VwGpNrDHIaEcKdKmX/bYziqjrAO
I2Ia+BsZe37pJdhOsLCltIiprbfTXAQzAgjq7+qSe7fWLenk2Cqn7PwmKc3Tde4/Z3LIU5sn
PFMTpb0VipnyqR2aaSCSa98xATcVESJjPnkUun7xtsk8xVNBD6bbVobpBbn0XgxCdyQVZUK9
SJwxQP6Jt4ayKMPfTbKIy2AqSMZ7buq6omVXrAp2UpRiRIETCwchr29CRqProuBZuPWmxdTK
c7Mu8m0qBiu5FG7WZ7tbaeGT6sQZ26Gnsg4nA6RhpuSWopRr4obgmXhHcY7xsKSWB6c0piOB
sIuYeMdhuOFaDBENPSDBEB3Z7x4VcuJgwEavqf6QBFsLWbx0UhccBf457w+L5xU7ZiRovNUL
xHUgEgqsYeC1lAkx8kLHJUVW2jfzgbOJMuqT3F5gxedMEV0WK4KI7+vbN3MhK6PmteKFJKe1
4Yz2Ab2EyCAVkIKyzF4miWl1xMmc3pqIKvD2Xw0HOuzoRkPkZAeJgv6IuRPodvSkkFnNSQlY
10l+FcwjYHd6uH73x/Hu+Z2voDz5EFRlet+0unLd6uqqjRH4jWdKceAMpTJg2I99MJw2ydhR
XDUT5mCZ4EZOcMcuxPGrMHQuyqtpriCPh+157MZNE3C7E3pqlNAjcaA1VxVVJzDsIoEMzaRG
elPyQG0jB4jEeRWKWf/uLXoUjb0p1REWr9RoruMoFKyFz6+abG2n9YYYwGLaE1pLKbPTHeXl
1HHAt9SywkpPjMibfKKLqWHZooTU8eFd23KxMeU4ADR56SV2IJGKLMBAPZEs+1gMvj/sEJ9D
vnzcHab+7sbQ0QjxDyz4Fzi/JcVKWS4g0wmfhI/a4petDjvFg1+YFMhbVmq+gIU2AOgpPTrt
zMcobuLnMc3t3RQz1eUER1TxBCeqAFD4MNXjw5wjIVVTTA2qRDCodvRKbGynuHlWA7yksijo
pGD+fOD3aHVIC9eFtHBCSKt4IioejzvNmfpU84olPNgve55pm29XctOfeWOYN6aO8zK72z9+
vn/afZk97rEM90IZ5Q2OXC3Dpsft4dvu6OWaXhvNqjkcObClNybWKvBkLwV+lklBQlI49Q2d
ECF0TEh5Cj8hB04pVyPdPm6Pd3/sphWUm0+dsHaDTv6ttVlp98ROS9k8d1KnVsi8vyMLfSe9
lpegKLKyAIyVF13g5wgyIC0oJVkiGKq9Uj5vP9mClmp2PGyfXvCNEN4JHvd3+4fZw377ZfZ5
+7B9usPax8v4bZftEC/yZRMEDkIC8oJwLpbBFkGK4/AsgxxxCr44Iir2M85hvS9dYdz5oMM0
rKpwIusxKYtHQlk8nmdKI1TLlCvqOXvbfzQeAWmjiSSLkKJGlHwsw5OQVHzqjpdRj1pMa0gt
Bhv66LTJT7TJbRv8GuvGN7zt8/PD/Z197vnH7uF53LZIY03YAN5oUpv73/8CEKSIzytmYNF7
Lw7Yys6Yjq+dbjZjeoJ3MJYYRnhWTUApy8ZWdMCrOP7Fn2AsWDWwRDnGlkjv0ZNH7Z3x73yk
QhvzaAsEXs6Kuf9EzdIheafvmk7ovd2Yv67+3dYMW3AVxuF+E+jkYtiPq7c0G3bd7gjVDlKZ
KdVfWVWhu8fG9s+h+Eq7GrZnuu9e2z4ZlO2WuE+rkDTuK89YXaTnY9n200aQ4dG4lthygYUQ
cSpZcaQ0sWJajrZBR+Tj2UVzOZooclgug78c5PAqKho5AqKcaDmVuDoi5g/SvSUUZkmUTLnU
ITShxJSmHYkjssoY/a7V10nFy4yuzztySbAnU6tr3ti5MQZ01+Shele5LrR06AHojMpxwgge
KomnYAhCAVcYfzdJNG9k9HtcTPwtAyPTFYJMPdhk2Fi4oarGU+L4+nk8NiE48ffAjHww/qCK
Ebcdrls7JuZ2xKBaWyUT73FESdVKmXZukuAHZPr+Kepo+LJPxPRnYyACpsrDZnkpqZIQsqLq
4urje39kS4NtDeNedvF/nF1Zk9s4kv4r9bQxEzEzraMkUY8QCEqweBVBSSy/MNx2dXfFeO0O
lz3r+feLBAgKCSak2X3woczESRyZicQH3zCEX9PDU0M9L/0qGJKkKmw4wgdzUn4Je3RoMQUK
GAaw3Bd6BJZVVUdifawYzOJh5QxB0axAQS5rNvAaXOj+leQYoYdLhXpVnaOIEp/Jmu1yOad2
UE9o1/BiclUuFIhzwJFZC3wbzZfZqwv5PXyZaOtElFO0R5pxVO9jVam4yCvSN+EJPfFIifqT
bpezJc1U7wAjYEUz9U4tc39wm+HhvtyE1u/PDZqOHqs4R3TRVPCStDFz3wDRPxb+BGS514sQ
yMbqOhcD2Qt2qeljyzQNbDpNgNAw0gHRLVZoprKaAqupDxU6c13n1aVm5YQwXQ0cozxwkmiO
pPwa+DxQs+AiNdm3vuChotrmS4Q6qc8rqp3MYyG1viAoZ8EKQ8ppU/xGdfZaAgLvD2kDFZ92
y95mQTNg5aeb4ueb0veiKFHoZLooJ2F0UjSkhBAw8lekhWX2QwvEZ0yTpx8vP15ev/z+yxAt
h+4SD9I9303WSyAfWhpUaeRnitpLHRvtqY5YN7KiyjLnCxQUlhNofLveEVW2ozJT2a2cWvGU
T7NqdxmVFd/ReoTji5bydIyZsqG9AX1PtiZVg680oOt/BdGVqe+7GfvxiS5RHXc0gx+qo5iS
n7InQrZKw0gAIGdPMQ5nVN4ZPdoONADjOHJkxM9puflpT+UqIqHbYydO4b6sF/Dzh7e3198G
7w2eMjwPIic0AeLm/fBNR2659QtNGGZeP4ZVBk52ibQTmKflAu1DlnQD3XIQiJpsY33UOXo6
NgpEXBOu4nr5ulH1EIB07DkfeNHPSzRTunFIuLsfHk8Yxs3qMfoQxg1KmaGFKeXUXpyWCu63
VoC17unGeqljJoIb6bUj1f2XOhLzpXIWSZ/SnoSrQMmp2vQFPvDycwx1hZBHcoJr1x4HXC/o
2LPSGvBZK7r6q3ga3TXmLKAEUTMjOdd2xQ6dWdg4dSorzKAUeHMgh0sq6nA2A0Xr6Gg0GBqh
gXjJSt87fVDh2mx6QuuTmJwv4aAIzlYsayzwqWlpD5MpiisqYmC4BmEOq9Fa7zEmcW4maqmD
m3LPPcb73D2hWQaImO8I7PghhPTh+8vb9+Bel6nJsd0L2n9jDIKmqrUOWMrgsuToGJxkHzD8
0NWr0Vg0LDU9MNy/+PjPl+8PzYdPr1/HMyAfIsIq4t4vPeMKBrCQZxGsNE1FhVU3lRovArDu
H4vVw5eh3p9e/vX68QXBcrgxdZSRK0lrCLyl3VT1kzbYSXdrqgcSRwc1+ie5ajzrmQFYdX2W
dv5kHumHtMMLkeHUjCp2YIraW9mfGcKDuNkh4xj1LRr9Y3QQe6Qdp/oeOPsLTvxuvl1u3QfR
hIfUljpBBwHhsy0bFXXueMTrCFyVcxLXihsr7IzrwlnO4UQJApaw5wO4WS7Covx2NZN+OZ4Z
fKOaS5GlYW6t7A+C/OymJtNeNqTeQU2G2Q1cLqM9wflmQ+GRAU8aBInSB8sFcjGtRRHWYsJr
9V+P3aoLa1gLdhz6IlIL3YNNmApotmqRROC8mM1muCaiUMPNKfwFk/l6RrmU8NfCebl6R9sT
+4Z13k1zG6qLcft8RuwDt0r/Hau7qrLhjso4jVSth4LD3gim0UEu5/Mu+Hi8Xqzmnb8aENmM
2Z/ULpp9As4YLTD9JpaI2iVUCuRFdNzuTbLbH21SWMF3bEo1n2xCPblFxWt20DxcI3sR0V6E
oF8bIdYxb5EmoUIzvbc3NdoVHC12JHjlm8dZtAamFJk+BonfdEd04T/rj763VLWNYMXk2idc
CWhO6AzyIhuRo5A2RwHviEcFXwm+LGdI+EUHQ1L180RI+ut1tgffinfEUOaGYMBuisqP5nGy
8M1EXsGVqQtrSj1jMDKWE+MCwDoGJOi+Kk/kswBOGi7x6tYa1HW4RiH26Y4oG+AbHAoAiBjg
FLJ4dyZT0zqHJ0e8dzNpS5Myd3nytiR0MuWDlbugox1lND+uihLjhkNk41gQkQS3IA8GGNKA
/8+ugwYwlv+Nfg6zzT5NlHjHRtlRkrj8oKtuA+N1W18vzSKldmvftYgqvVviPQlvLZCUS4mL
+tDbi9oBBY4b2vY5vFvnuAbQFputXnAAHVFbKwZQB9EGyIzyxbjwW++bDhRs46eqtdC1V5I2
UHSN89AUM69rFAoH5MF8w+GsGZN5hSxyrSS3VZVPI18tMMlgy7idLaYcWtAZf7O1eAeIFP6Y
PhsA2zlMlJ2PAgRE5ld5IAzLLqb3gvsBoEZU1Wg3dzTKoxWKjKiFZAaGC5P7BmzjVfgOJKSp
fRqB9DbMuqWUesPaXYIK6rFAGb7AgdXyqEL52B5lvhPC8gRKAO4NJFlRThvg6I0Dp66ZNazH
9IeqBbdkqD9bk1TTPn798v3b18/wuA9hHkKWWav/jqENgwDgdbtLq/Eu7uClAQrhBbI4L7XN
V8hgwDE4qGXXCfL2+vuXCwCjQcVNkKcKQaPtp74EGaUXbRvijsrZsx5anNXCskYF51Yx9qb4
1191P71+BvZLWI3rddm4lO3gD59e4AkKw75+hDcqDNS0gbNUlDDv4dJ5iMp+Q1TQl+Hvlz/C
ONCjZBxB4ssng/GIPkIvytQ8I4F73VGHN3eyyVAXelEMIf1QTcbSxvLf/uf1+8c/6IHsz7TL
4P9qBfe/9+0srjloay3FtS24pGIqQNCuskMV//7xw7dPDxYT36vUsyjxU02G0FcLIk/L0vOr
8vx7luhfl7QUPRPhjo2YSFbqIHfM/yLQhPBVxYbVMvU9dwNB22lys5hP6eauD9w7AWCspYdS
7gREaUAWm65vtd0YRbIZ8yugDXtZ0qv5KBZT/cdST0V4IuJ4cL29nJINzE7PrffEvkX34c/X
T4DzYUfIZGR5fbPaIMfAWFStevL5Cz/pOokl1esqbUA6oaYzQktyxkSqf0VbfP04aBwPVQh3
cbKoWhb3/9pXiAzPnRzQY6XntqjxtHa0vgB8Lir6qmVlyvIAw04rlKagEY7VvCE72cNGsEyI
pvdjm7PLBE10JBnwhBQeyfO0ta5t2Fia16ZrKu8dBCpTj621wTzHRwZXOYcE5a9CYTNGQ8EC
0Z1HZBPPpjVgUTQvoHrfwtj3Bjo5Eq8yOACa0P5HArBED9lonb6IPbRixJh5iGoQNmsNMQbG
p3cAb/DUVsGapHXwHmmu2s5EeCv2dy8XfEJTPvbeQCsKtMANif3XWV1izj39DFYmddDDw4yd
DNsxwMzMvmvAOMn5GJlz4yMY1i/t4/U0vFDtrt9LtetZg3xMRdW1glYDzqIzQ+zW23bFQUKf
kvX06+JZhZW2oyKIkvvS95HAL/DiS5YHxAJeqXSMMWcrL5ts4JEVNkKnXXdLpmgpb2raesOi
QjEWVQYwIW0ERlhzAeQH7pX6GQzQLCTrWO3eIUL6XLJCogo48CZEQ8NP/0bxVvp3gTblKjMY
x80ZXpXyIzMsA6xsRLPQUeFbVgU8gOVMTHCH4Te0YoQee/Mc9cZ3uSY0h9z3ZIzhR77S54RY
lySb7ZqqxnyRUGFJjl1WQ/0d3UfYMPAaZokr9PfRu4T/AE94ZCcVQ4kH2Dm/Tg6JrjzlOfyg
9MW0qYqgHTKlFkmXGSj5Sunv3kp4IaujCjzpQXEjCzjSnlTcUA0gk33hOAn5FsR5SDspMm12
1OQbu2CXTktUXTIlNqwgiUO15muKZ/xtBkPqul5Bz8LhL0/PNEwBvI0HMwN8NUTVh9P8HY67
HEu92dxGmQ9jj6fPhZjaqkANXMZjX519UEUjOMLMIN8ZcA6XoqLO7gwzYzu9r6ogswa9pWQF
eUBAMBSWYq47kcRgQPkcoqyBk/FJW0YO5Bdr0/XWqq9CoU62lvrr28fplqpEqapG9blUy/w8
WyCrjqWrxarrtZVKbQdanSqe8UJdH7SGVnnjtZVZ4b7qVREC4qbr5uQo1N9nu1yoR/IAT2sU
eaVO4IXXqz2cy3iORK205Mjzy+pUbZPZgkWgQKXKF9vZbEkUZFkL77zR9VSrOasVwdgd5psN
QTe12M48h/eh4OvlygtyTtV8nXi/YSvVjesFr5eD1uLli1YE+NXDqzoR3wJGa7d+p16lmZ8A
EAR7bYiitbM+16yU5KHnYtgHLcqiqCECg/DUWI5eVhbUDnTlopDrgWxfo4snK1i3TjZejMhA
3y55tyaoXfe4JoqRadsn20MtFGWUDkJCzGezR392BW0eO2a3mc8mw91SYwa6x9XGgdImSuvD
wbUvPz+8Pcgvb9+//fhv8z7r2x/aMvrkXaH+/Prl5eGTnt2vf8J//S/Qgk+V1Gn/H/lSSwa2
JxAHWR/WeQnGbZ27psGLEZ8ftDL48F8P314+f/iuSydG0VnvwjHN/FYW3rfmB1rHMuOe5bxq
ohEV49QIJSb84Mz7wHasZD2jszWPn5FNQsv0uGAYcHn/qNP+sLoYvGUDr9a8PKRfP/4Yn5j8
5fXTC/z5x7e37wDvaS48//L65bevD1+/PIBSZTwgvgqXir7ThlyPj1WBbENlFCZqhaEOYGsN
SrFmKfvKoSe8x5hAhgI5UIvvyKxROMaoW4n8KKlN3qsBJzGQDcOhz/WiaaomjjM8JNC1IIHq
oFfgcXFZoZfMgW5e9c3GSQx9/fGP1z91ajc8f/n1x++/vf5E1q1TaCdBN15lKBUb6MYYz7Kr
n1X6pRIPSvp5+udl9jeMdoDqt4/5ER1ZZdmuYiTmkRMZvBhkar3IrRfUBh80KYjHcVwm+HpB
+hFHiVzOV92SSsyLdP14K23bSIgBm/bzoW6X6zWV5zu9BjWRx17G7yol/Qzu2OY2mW8oh7cn
sJgvie8PdKK+pUo2j/4jq2NVUr6Y6Q6EtxRucEtxmXLV+YJP9UaGlIW2EW/UX+XJgqMbaFcO
387Eej3ltE2hFTGqvLNkOrvu5jBoebLms9k8NmfcfAGUdhcHOZkqBsK98NH6GiZT87CfD+eq
pfAv/EaroQQLgyl2KO/h+7//fHn4i95w//m3h+8f/nz52wNP/67VjL9OJ63CYYaHxlLJkHSX
xH83xSXYk9lEovZNA0YFnHJdg4D+P7iw26Bn4Kb1HoWjGyoEu1mfKOqS1ikhb8FX0OrG2O+4
Yhm3jFi9pPmb+GZ6q1JRei53ik0LA5Y56FXkvWMr09ReVd1jv0Hrgnzz6mICYOL9nx5IrYEa
v8iwp5Ub2g8wWJSgx5L87KQoTH24BvcwX24fH/6SvX57ueg/f51Opkw2AoLGrp3tKH11wKv9
yFC7mloWR751Dk7TlZV6pvXGW1UdrWuDmYZtzEKiGpZEN7k+bzjyWdrf/XwxQ5fzHXm2onbD
gRsEXg9UHsHfduyq2M5+/oznOgj4flRXntSWEVViVSxm2iiOeI8K9wzlZGikr9rOeP31B+jn
w+kb8x5EmZ4k7lb+NrcydsaQO6YX5vCTYsCBBcXQBvOOZgit7AThTnA7escLrVotwu8OrNAv
MxXQK6F8unu/vGg3q+VsWnRxThKxnq0pFigc/ADP7ar315s1kxogue3jZnOrGr5sstkSV8Un
ItgCxBXvuu4Gq9/n1Y7li1siNYbRcAJ3MQOuV90naQcWZH0jgyfOkhBG0DAaAbbsUa/8lDk4
FlJoszB6Gd/nYjuZlMBnHU7kLFuh4Mk0xTdL7PaOiPQmyDta51AaRai7eKD/cCKPHhS4GlOG
UPhnUaba5l5y7OoX+ZKcTEu+mq9IzrlqWkEr1e1zfahoT/C1BixltYuAccuYJYGrooGN5E4G
e4GdPaKdL+eURuonyhlvdGdz5L1WueSViuA+XpO2As9zxkXgpbuyrNOlJXHW/UwL9j7E1RhZ
2CFcpMl8Pg8PCLwwIJ12Se3Vfp5PJ1gVGV1gw2k6DKQKh723OR0Mohm0axkYtEoDnFgn3vua
p6ZqUOiSpfTlLklm1E0cL7HFQMXTYPf4SNZE70NgUkfQksoucrUiNjpaua/CQBkvM3pWqWfV
iiIaY64Txm70XhvMA8jTXUn5gLw0QwQfOS44O8tTQbMOIlc4FHwg9S09PkY23S0jm/4+VzaJ
tejXTDbNCd8JUMn2552xwrUJg1oTTnwiiXnTBg3OvShkKceFmQ5r0YphJMQ1LUkAF6/MFK+n
wGlPeVT9calC2N40X9AXLtWpTMPg5ml+8Cy2wGfBYnG37uI9qDaojw2lL2u46F7q5b6wzwje
yyljjd5JEGpr1haMx0KHs3Y/5U6ztc9mk8P9IJWELQTtDgfZrQ7pot/HkLohVZ+JOLuePUaX
+0OpQHOgcQ6AGV2uNJM6dfObc2IXIcmWymSxCjVLxypbDOcu6C4Vw11CJDeLwKLvadAVTT/T
TZddLIlmRAp5jJZOf5l3xZ0ZULDmLDAsQ3EGVZKeVcc9Xb46Pt/ZzwtdCisrNNmKvNPDhvaH
at4q7lzQXHW5yY6icbj6aBMFD4KjSpIVveRbls6W9rmAkZM8xg5/gkKryeJR8kXybk3PeM3s
Fo+aS7N1l24el3d0D1PqcFfg2kWK8wFGbAjyvpPJc4PT69/zWWQ4ZNr8IS8ueBmWrA3rNJBo
W1kly2RxZ+HT/4UYKLS4qUVkMJ870g2Ns2uqsiropbTEdZd9B2h4/5flP1lin/UQoBXxFSxi
u61mHaNHk6e8bWi/3iVNZj/vrK/lWaYSaQbmJlVKx/54Casj6h0tT77b5qWwj5YNUexI7Tlo
00NPGrIRzwJCejPynM/PXJQKnsMmP+RTXu3xCdRTzpbBkYHHiyrLOs9OlH2M/UQ+EupX5ATH
zAXS858428BN8MAqn/BPLKJtPxmYh9jW3RR3R2mTor5p1rPHO9Nw8H74qZL5cht5xgNYbUXP
0SaZr7f3CtPDhSnyyzYAKYNOJi3ldo6KFVp9RKceCrbkSMSbn1KIJ7Ii8G5lk+k/+M35yDVO
TYdoeH7PMaFVOYyAofh2MYu6vMZU+KhCqm1kYdGs+fbOtwYfFMqu4Nv5lrZ9DI+eVaKWUa3X
JIukg+JvMx/vbRqq4nrLQDfTfW5rtk/UxLYASNv7o+GEtWxW18+FiET7wojD4adXsw+gf8rI
tihPdyrxXFa1wnfL0wvvuzzU9qdpW3E4tWgdt5Q7qXAKCXdyLuahHRU5s2pzEkjFy/OMNyH9
s28OsdtOwIWb/Zx+AtvL9iLfB6dCltJfVrHBOAos71lhNorOz3yIq2OdjC/Ig0ye676OyWRp
Sn0DrVeiexsVSxu4xt1QNK06NvCiLY7XMZe3dxhCxR6emDOugIiul1gKh1fTpa54yJDtjqF3
c4cMevtu4lWv9Oj9viYD2pEM3EtpRCTn8f2rzu8FIwF5B6SrmTupkayfHmfzLfk5nEAyW9Pr
nhEwCnchJT3Hrcg5wDbB7K4m3yDVMwvflTcE7wqOumiKOznXNXjQP2/gW6mMRMlOZdnbfByl
SAPC4LINqFap3WGqHigbc3QTEJMNQbSAZEGrnFN0kPYdoKvH+eMM6DEPafKYJPOoAJecpSxk
O6Z1luE6pkzPjmlV0hpslkW0IOC3PJlPquKnf0yCsoC43pBlrbeRnDLZieBrSV7nepIE2RjX
SN9d2HMkpxzCO9r5bD7nOL+8azFhcC3QRG06Bgxjj09p9hgxQm7nBAdMyLBZpQFvYXmkUWWn
84ITv3DwPXmZuSV0ONoLiEYJDYsFbdPVP6qhROqkWjGfdfg1T9EwPRUkV5E07nAO1W3YUfZ6
5i+afRCbMHT7USXb7aqgXOx1gKhf17Qar2jvrV7RBsBAc+jv5wQszlpKCQHWkV0QyD3QaniD
0991gNi0eTJfzcKsLZk+7wA++E4SMi4MuPoPOpF07YDlbI6vLWPWtp9vEqojnRhPufGrU1lo
Xi/IW0i+ROnjMjmGdYXG+cAodrKgik2LLQ2F5gRUs934OoFHT0i6Htcb5H71OdtVR3bgPl8v
ZrSzwomUsPYklOblJGBV203LLbjaJEuiqg08vGnitOg+U6edMn4J/ODtVATzWC77YrXGsL+G
US42keAYYO8mUcs4dVPo2XyKjVpRq6pcJEkSlnrkC9qUc+14z05NOLFM+7pksZzPhvcmJt/j
yPJC3v5kT3oFvVwiqIxOSO87q3kXG4LQySGcPtBlfZgsEUqKBs5VsV4PnHMec6OOjT1o+/lW
L7EnPvfBry6BAT4CnV1SSlUD8WtUQWF9JBTPb5T+EUL7AsncmDa3dxRirCb4hJq4PlLgWBep
J9x8hhtgSL1U5lwwYgJZmQE7OJ6xh1Z8TYyaWUQsQl/KKXp3+nNy8MlkQzuV/FRG3/mPpBol
yT70xK6HKU4nkjvRtDg01NEiOIYjG0VM/S9jV9Lltg2k/4qPM4e8cCd1yIEiKYluLmgCkth9
4evYPRO/cWw/25lJ/v2gAC5YCuwcvKi+IvalANSyUi0nayvSVhS7j2jv9anW3zhnkrCJxU8b
M4PrNKLVuSrrnA/kNxmHHE4pb7TgdnOIgarqtAqoS7dKZw7+56cyN5a653LWuUTYxbGm6jpF
F+WRdSftkDsTRJu69hhzsQBT2QmaWm0UcRK7f2rz8R0onH5+/fHj3fH715ePv798+ahYZiqz
Efzi1UHkea3dY7NG1psJKumhdzG3dgSlHa1qkbnIdkIXltbYVIVmUPy9bQcOWjoMcZVbiRs/
WhkWxQvNNpmbzca+/fXTqatfd+SqBx8EwtRU6KotwdMJnAbofi0lAu63Ne/BkkyFq8wHzeeG
RNqcDfU4I6K41x+v3z9Df2BeVOeP+iutDFN5HQH3f6hkYLBRLvJX3TT+5ntBtM/z9FuaZGZ+
7/snI0y0wVDd8DDSC2osYZKck1Z4sHN0pcvXn/z4oXoShkZbSy8Uvs+SOFZNdHUky5zIAUPY
wxHL5ZGLpfoRRINQX8sKR+AnWAnL2fH9kGQxmnbz8HDE1fNXFscdmoaLIVyVaBasyJPIxzzO
qixZ5GMNKUc6AjRtFgYhXicOhbhulZLumIYx9jK0sRQUTb4lg48ala0cXXVnqqbjCkBsBNA5
oAhGWX/P77ouzwZeuzf7ibIWtSDccufrRYTkzIqQj9UR77w2mFh/LS6csp/9yB5Q3wwrQ5ET
uB+x1jJYMTTpAgh8KcL0QSRmOrmRVBmvC8pqInCjd0gjk1w85SQ3iRXs25qytE6fMaO0K0rb
I+reV7LxGmuuXeaCs3ps7DThUfnouOyVTcSPEh7JsUaXDDc6jmOe20m7rsVl6z51ORF3RGhV
NxiXP9clnnImRRBbKPz8mmtRLzcg1BaQjV7iT1crQ9EfB+zCZGU4nwKsJOdBv5nSgAm1udpY
rjVf8dqeIekKaT8vMIjWZXWHyEADmjFrS+w2a0tZaE9gWUoHtYZ1uAkHIX6btfLd82GoHae2
lQnMLxv8xW2rJ+GHy344Yk0A0FFzlLth4HdefWnZWuZel/wHWrvnS9VdrrsjoDwesAGQt1Wh
a/tsGV6HY38e8hMmEG1jk8ae76MJgJRzbfG7zpVpxOev0iHNAx9LfP/3kfITCt/PJz078Q3m
wud+Ocg47A68E63zRBtbcp6LuMq43sjMAAuyFAbdgmVNC3NbyDLSZok3Tn3HdxAUdYF5mfrR
aJdV0mFV2ynvzITbsMwscOsA25mx2Uj02Oa+6rdlllnD0ZuOV6bJBXPtCz9Ms3Ai98HB0HLp
SJcNJSAkr2NVEYdjQYWrrCBSGxqte2O61ccht1qT1cLdIKsCuwTgdJ5AXA3B4Ez9YWTvD2bC
Qljn8l1lAk9VbqppS6BofQ8T2SQ6VOzqbsR8JAEfMES9G5DI1XGYI3nTwovMkqIzY1KcYi8J
eQ+2V6uSxSmL08hOfXjIwDrsPhiCld0rQ8/y4QkUOXszELtgKvODFwdyKjhTEkzxOl+QJJLw
jSTuXKz2YcrZdbRPqHk5NiE+CQXw5iyUXHvTsBZRWa52FvUjDZID6vFjHkZ5aOhla4BZNj3x
ssrFotrw/x3zwax4OdwCWLYuUkhC2hoYknhhcPeY4EuVhPTxA75aKMEG/NDWkeHjTJB0R51A
0d10Ckp7NCgn1bRwoQgRvDfoQTm75jH51QvvmRKYlFDrj5mGa0NIMN4FNUM+cQtwefn+UXh7
rX/t35lG/3ptEDeNBof4OdWZFwUmkf+tC/mSTPJBO/jP1KLmBx2T2tRHSd3eRgV9yO9onSU6
2+HhB6c5OxqAPoudMq/x7oc5wUskz/7U9Ubq8CcJYpfeRgtl6mgcZwi9iRBi1V5978FHkBOX
DqRUNt9fYr2/uXdCrvrkDekfL99fPvwE3+SmRzvGtHX0hunAXrt6PGQTYU9qpHbhcsxJnP0t
BvHqcLERvr7BQS/4Ml4u/Ojr908vn22Tdnk2ls5SC3VVmIEs0J3KrUQuIpChKvh+XArHOdI7
GMKn+QZSAT+JYy+fbjkndXpEBZXtBMcj7B5fZeIk2qvPpVoJihoHqlFdkFWkG4SCM/0twtCB
N3ndVisLWu5qZBU/uOG3MCpjTknFG/FmalRjbUEbVzOV7rm+FpsFWebQXJVs/Wm1r7YWxO7r
l18gGU4RQ0l4h0E8oxkjCl6QReAIZzyE+YM2H0OnRq7KsluDwA8y3Cp7ZoBWbmpU+Jw59K1Q
ISqjzEz1PcVvXmaY1qfa4X974SiKbnQouiwcflLT1GElMDMdizYJ91nmdf89y89OHX6d9S22
+jQmo8OeaGaZdYIIfTOxfHDoqEt4IPjmMcN8gkwNeSsPwVV34E7rLdYCNLWFg/f6XBd8ScWP
TksfgSt1o/yLLxx9ATaGV1uwoVlURM1UO+m8qDQcm21PU9PZMfy6/rl32TeBt2PG8Fta8dbP
R22HP7NebsVUotEj5xLDi46mrKvQRU15xvOOvuXJNzMy8MUeW+sFoJ9mGrLMR7SMhLjejGaP
wcjHi8RM2ppLcl3ZqFdLgirCtZS6F0FBB6ekk4iGgCKUDUZMTwFKLWd5AXjKUethwac+REsC
X1EM0h0CW5e9nYk4OPcnzPobPLyqT1Xd3TwcLBR+XD72vf76ej81OaoDcLlz2bMrVZe7K0lE
IeFynuYQfUPtQGkbVvCh0+GO8kuG+u2GO/66UMvBW1zLmf9+0AhcaLb88MCDt6BXNypErS3f
6ma6HViGc8H/ELwFVLLgq6ntjljSXSnX1LzGU8hTMcTYA+DCAi8P4lYK+148WnBKVzk8B6qM
3fXWsx0+t8YNoG9mc2MQOmzoR+yaYa0wC8NnEkR2my6I+TJh4fi9Ad+0midtGVsoS4CCJVCT
Jfdvo0n2+HDlWwNMoDXeiXxqDgpEWUA9d0Mji/cw3lbatAAAopTkjttUgC/8O/xhnKPSDkLq
6P/1+eenb59f/+Y1gCIVf3z6hpYLwlvIQxxPu2mq7lzpRV2MKDCqzNAgN6yIQi+xAVLkhzjy
zSpv0N/OegPPUGF6YgvaNmNBmlLtw902UL+fo8fAAUsvtXjL00l5c+6PNbOJpDhhxFwdGOsZ
FCJ9bL0xe1J9x7Pj9D++/vi5G1dLJl77cRibOXJiEiJE3UGpILdlGuN2wjMMDngcDV5n6mOE
oFDtHpxTwAtpZObaiVco7JZBoMJUmI+rq/kdrWkcH2LHdxxNVL3cmXZIjNF5U30BzQQy9NrU
/efHz9c/3/0OkVhku7/7jz95h3z+593rn7+/fvz4+vHdrzPXL/z4BH5v/1M9K4lZCuuJ44UV
8LKC0K4ivJK5RxiwCEP/dipYjGeTBXUsAEz25BbLgQwZK0NSqhd6wPBQtUR16Aq0flFr0ErA
JwB6/tR6qjVcYwHVDlwoncD/zdfkL1zq5jy/yvny8vHl20/XPCnrHh7mr+YCXDZdYJVVhipx
zomhP/bsdH1+nnpaOxxycDaW95TLjbj4Lhjq7sl8OheV63/+IZequWbKKNRrVTXVg9Up0NQy
Cvh2r+Vac4zZxa4ONyIAmkPQGGHgT97pRWNjgdXwDRan83VlS10rHCodWkCQW07hUh1lqpRX
3lGy7kue1KZuNJDWb7ajG1Ar+xYFJI325QcMwWJbtUvEKg58yorzN37gBHiUrmftQHwKk2UI
KYhcpucnjuZJJ1surWR1l2XBrB9vsBI14ZlB/d5N0uaoXno6TYdeJXMIDKXgmG51gr4OAaVp
U29qGmKmDod9XL4DtJczzPyIjDnuyRvAxcpKz58Wfsa3Fi8wyOLqxxguoxprCijj7IZBJS3m
vArt+al7bMl0fjRkfzEaWjvynhhtimCDXddBea722gmfLvGU5hFrjU/+x3XIFj3S9wQC7FnR
QhUe1lRJMHpmZdzrCCWoi8uLekTmPzShWT7oUDVG6o9FkhLkz58g2IQS0BlcRl/Uy2FC9Dio
hDpjZ3SMzOxSVCN0ycCWqSGdoqnBfcuDOBibmcyguNR33HOsTMiWZDPNE2ct2n9DuLuXn1+/
2zImI7zgXz/8D1JsXkU/zjKeaK8qbYFRaCJNYbWKaOwT+FvB62LwlSwLiEM10+YtWnRDsKuh
JFJ3cB2F3RzAm554zSv40Y0f4YSYo0it8FuzD54JXBSiDGJATU3dctE/9oOFoz8Zy9byST08
mk6a5CbnEAtFWegTPVE9LSW4gUoVyqvedtp7/fPr93/e/fny7RuXT0UWiFW2+DKNRmnwjnaB
YNnZo+RBUe4prlqU95xoekKCCg8zri9ODP7xfA+vOxKoQsKD3fbTpbmXVubCO88Nu92UrXnM
EqobZEo6KTLc7b/srrzN4zLgQ64/Xo1iQCR4Xa1MkG2pVsefq9tuz7TldDK95i+nXfcYWE83
gvr697eXLx81mVImbuqyq1Q9/NaMqM+Aske4hNDYzS9HK3Z9tcEB0vySDlm7m0TcHKDuy2YY
tG9Go5yM1EWQzWZripRptI+cW6fSbjejW6R9gKsM+VA/96rpj9TaKg9x6rf3m1Vvqc7jrrLU
5NnBceHrwvjBAZkx5mFOzhiSpaHdJVIjyjkhQP/cbGpbtXzuAprEXobfQGwcWeLsWoEfVD0S
SX5sxyyx8pO6S/jMsXt4jW2zO2OOLBvNoQUxbUSEaN8ugwgTL0A0UJnU9SqLUMZY0WKlY+UD
ee6NkclXez9x5iUeXw++WQU5XX17PhZhmGX4o6CsX0176lzlxyH3Iy9Ua4bUQNoy8cMxUrP5
KwQ1J+T5PFTnnDme9mRtuIxxxRS87/6yrfq//N+n+eC8icsr13xEFAYqvdKGG1LSIDp4LkSN
w6ci/l27x9kgU3RAWOi5Roc4UhO1hvTzy/8aJoG+FNgncDOAX2WsLBQPerriUFk1Fo8OZEZl
VQiMOUs4b7yVvB+6U8GXGI0nwAVSlSfz8BVXSyfE9gCdw3e0Q+iuQRhOheMJXefL3sg99kY8
9zTzXICjvFnlRS7ET9U5rg8xRVCHN8wpv6H+iAQGkZa150mFPOU0TAN8k1TZIJL3Q486/jbZ
KFNEfxU03/BNDP7LXEoHKnPDiuAQY3uzyjWnhpcFHKDkrFb1olR4FTud2Pp2vDHJd+AlFt92
LJf8CoqdjOHt1UhBy5teCVEvpVSqbYquoa4IuwQ8KwHjlmoOj4ozaZscUl0Z1g98oZe49R3c
bUyWIekMHnO4Z3tarRPUD+F+4QyDmsuDXoL7AV6+zwuWHaIYP2YtTMU98Hzs1WNhgCmqmn2q
9EwPZqYiaEA8lSGwk6RH5Wi61FQjSse1BnH5/PgYpKMRNFuHHErXJtelfETqy0XiEGsHIUqj
dM1EY6Fz0cdPvciNBFgFBBag0TiWhlKGi4EstgPYQKopgUx30uVZZwdVP3sBQIAPUptuLmYr
PwsTNDSUkpMfxSmSZFkx8UYkWZI4sVl450V+jE4WAaF+ZVSOIE5dH6chNkMUDn7+8JCh2x7D
KLU7+pxfz5VcqvW36oVhYLEXYk6Pl5QHxid2jBa3PBwOMdafYq1Trjvh53SrtbO0JM4vLhfd
VZbU53z5yQ/8qEO+JUR0mYY+lr/CEPnas62GZOhytbG0vocaRuscMZ4+QJiRuM5xcH4c4iuu
yuOjYakUjkMQacrRC8DSUfdyo0Khjw1flSNyfxyhr+waRxI4P0a9AugcMVIfLjxh1aRFmgQ+
mtlYT6e8AxU7ftrBrle3RED3GUmcjQRNuqSJw5nVxuHjQVxXBmkAlZeFna+8LbHpdfww5aqt
ywKcUp8L+yccyILTGUPiMI0pVrvFti9HzXoXrnMT+xlt7ZQ5EHgowPf9HCUHCFU+6Hc2cqkv
iR8iY6E+tnnVYjXiCHHEwlpZWLY3z94XEVJILnENfhAgZWnqrsrPFVYYuU671MNVntRpcGby
OZ4WVa4DVkpW8D3Ox4HARxc9AQW41Y3CESHjVwCJoxxBgk412KBxrR6VI/EStLACcziw1XgS
7CCqchxSu9jiMoof6Rw5cyzcXyU4U7K/TAiOEN1ABBS5FNEVnvhfFOKwN/hlXbAB1BYk9AJk
ALEiiSNkRS0L9fpx7f82CdGx1qb7ZecMmFijwNgwbNPUkdu+sNC0qA9GBXbUwmkMsjLsNX/T
onOXb/wo1VEGfooP98QowRGhc1BCmMi6LoRFloYJKjAAFAV79etYIe/saqppCK14wfj8RKsF
UJrulYxz8GMl0lIdEc6YbaAviolkugKsguF1PGXxAZvHpDUsEOYPcDLIe0GKrmRHcBN8clnv
rNvcVJxOBA30vPB0lFz5MY1Qgm7+9RDGQbAvlnIe0+u3xUFoHHnoaKppk2RcwnhjSgT8iInf
g2rbWrq3cHOOMPORJWDeM9BTg9wPvP0m4EyB9y+Wd86EHlH1pTXDixhGESbawwE60Z2druNq
rPh+t18qRmjkRY6LSIUpDpMUc1ywsFyL8mBYpKtQ4LSikzxjSSp/V454bnhVkPrTC8P6lJOx
nYiTw7+xQnKg2O9ktwrvKqm3Fd/kEdGg4kL08nJkQwE/+e2kyjmSu+aYcS1RS4sobXcQbFOQ
2DHEZBjKGE0xEZC2bYILVXwT94OszN48WtM0C/amp+BI8cMbb4LsrWWoywPUtYbKgK3wnB4G
+KGRFeneusYubREjQ5K1xMc2GUEPHXR0BnMkQp1SqwyOsrck9vfG1a3OkyxBjmA35gc+MgZu
DNwg2/R7FqZpiJwqAcj8EisdQAcf8xukcQTIOVwA6FwSyL5wxVkavsCyvU1R8iQdXqMkSC/I
2VoiFQqJa/qNLqSbXDd0kiSIpcxq6nCqsTBVbTWcqw6M7eenkKmsmvxpaulvnp2m9QphcfS4
LvgC34da+Eia2FCj0sTCWFZS5/7c38B1P5nute4XD2M85fXAV9/coYCNfQJeGaQPrp3C6Glb
rW8VEoFBSXnSNZVVeCuGWseyup2G6nHh3O3HayNiMtjJmyrJiyElNmohJEBPaX00rMBR13bH
os1VdoWs/xLe4IUyCJa4xuHKRuC0L6wPpS3j3qdUmHG6PoSoTVPR4oNaY3QpHEgm1Guu0E3+
r7++fPj56esXO0TMnEB7Kg2jfKAsb2IGlYapup4utEDZIkhbF7abVsGZsyBLPcvQRmDCjRco
o+O+wTeeS1Ood4sACJeSnrojCqqi1aWmInxPYTTLxeIJXJOWFerOUFa9LkKj5uL5a0SI6tsX
fDxflBq65gqCv8GtDDH2WYL66VzA0CqB9vImaIYxDtDOOavu/fBApzN1FQnuVkezB2aibuSh
AliDkyAJMOEHwEudcBlBtKn6HajTEdEZ6BQBmOdEGmyTbggHVYM5IEgLOq1c9SNNHAHSAX6f
d898Ivcl7suTc5i6fUCTnvM8jBgjxMQct8pDoDFqxzR1XeVvDI4LtI3BoRO4MRwwsWyFsyi0
ypsdPKy42SHAxZ0VP+AH6w3HpXaBsyR0eNBY4L3Uq+4U+McWG/rV87h4XNO+KYDoTPFWk2oQ
JhSO1gPveXrLKU/Ty8KyOLrTnlpWqvm4LBJpHTrUIs9V21EligdWM52hiFmcuboenOllRjJd
zBLfINKqQDYeWkdpMmJAG3s+QkJrSh+eMj4zXKvhHOZypuTHMfbsbSk/gsccy6BOTWZWspUq
oKz99OH719fPrx9+fv/65dOHH++kE+h6cQKPGqIBi2Opl9iyQSx6mv8+G62olhI8UBkYNoVh
PE6MFsazmMbYkPAQ4aurhLM0w07EcyZNaw5nobysCdSEJr4X4yus1FBGn3YllBrjdlFptios
6Af3WiAYAh+71l3qYqljK0CcuFexOWlnM8061miRD2jdFdjatBf6jhixslj7M0f4thRqp3F2
byIvtOeDygDBhHfiuPOU740fpOHepGraMA6NfWPTXFeJi3a5urKOmS0YNX1x6fIzavQixDjT
KEAhGt7HFcBqtIJGaRNEZu73NvY9/FJygR0XmxI2dz4TNFZVTotMicI8tm80u3ozHRFLAYkt
f5x2abF7JrEJ9JeWC+Wpn43WIF8wLve6t/EtgR0mykA6xC6a5hX7ZGV+L8pDGGH74uLXc90a
VHcWrpPVlvhQneFc3GMDbzA3vwGMoxUrnqYe9PMmOQmaUO3Ex9NQLK6FcQtAgYNPJOzqo7C2
Y6B0PYPoQaq7HggRJLChwKigMWo4nxKx/q4NrTLgQIsmQvzldUcvednfTTYtEyQDDZhONVjN
7Xx/LIf/p+zJttzGcf0VP82kz8yc1i75YR5oSbbV1laSrLLz4uNOnKTOrVTlVlXmTt+vH4CS
bC6gquchiwFwEQmCAAkCPQ8x0qZ5yiPDj0/3Pj+cp9l8++OHGGFy/D5WYMi2Ww8k7BBL/9T1
JgKMctaxfIaiYfgkxYBsk8aEmp7lmfDcj1YcuOtLNe2ThaH49PxCpNvpsyTlKYS12a+4Q5IU
1yvpV/rq0SvnjfYPny/PXv7w9PPfi+cfuLRe1VZ7LxfM6BtMtSQFDE53CtNNepIMdCzp1bgD
A2JItFpkJc94VW7EXCEDRbeXMjLzFou0cNAVWxoijlnfl5JfNq9jtV/j80oC2hcsz8dTp3Hs
qDGSZuwa9eA2gsoyuU0Tzo5xmQhkTXq3RwZifFMYHmQ9Xs6vFyzJOefb+Q3+ukAvz78/Xj7r
vWku//vz8vq2GKchPYAFlIFlBctBfE9k/ApOlDx8fXg7Py66nvo6ZLWiYJR7OaKkdIOclh1g
5lmNyeD+aQciKjmWDM9t+MzLydYRm2KUIzBf8MQTtIu2xVetpFhD8n2e6gd01y8mvkkURtpp
HZ8bnhnxupqHJGOX3z+dv1MpxXiyRM6scc5aemdAmk0LRisxeFx63wuyfgSoS2YCC1mj1NUS
1xlz5BIfGzfw9ASibbe7T1cgbw0dah2HK3r8Q9nT+fH5Kw4hvkfTogMPbdd9A1hNeoxg9cG3
jIRpNKJwELI1IX22CdAYZQ58oG0HqC0XkruxhJU/8NfPN16RP1Rpme0t+oJynIWD40q5fyTw
qSG+ZcLRAmMUhUWgXJuLcLWouqANH8QXkCFx4Yg79bQ2hOiu41lY98nGkBfjRpQYNJO24Ml1
MAS8sYaVEzvj4XU9213WKraAsHb/jsPw4SxN9S9zHA3bTKRP4wCddkplLkakMhc0kfzObTjj
eP7yxgMYfb58eXgCOf9y/vzwTPeR57fNmrY+qmt7y+JdQ1/UIbpoM8c3OFmM2k6cTeKPVNoT
/hB8lOxC46N2lXmhIczxjcCmDzt4/5poJvFs0q7ol65D3bDpZPx/c+1vWUOHhhXw5kzYuzQt
aQN8ULIxPUhJt88/jy0NPkJD613K/DAwxPsf+sdYGFrBdraSdRAFBiuGUwwHBTSXevlIlLXT
BRll0dxEl2dry6Tr07RuxOClk9rlKGbQDU5onxwOyl5Vq5sHxyTFoEhlqmo51HfV73S1tavF
IvDFVxX/lntd/s5reClVdg+IUwzrqqH5Xifs5giHdwUzBErIIwWrR94QPvOqPNNfedOteVjf
XL2yBhmrDhR1sgqW1Mx4Qje4wURkuR9nKCNvAybk8FhIB6JZSyNQF+XxbwOPaMuhX31PeLT4
dVm9fni5YIrYxYcsTdOF7S69XxZsCNCnbbHrrEmTTtngZBtRDGAygM5Pnx4eH88vf5jUVNZ1
jN+kDVFPGh7YY6BdnH++Pf/jlR9jwz7y+x+LvzKADAC95r+qe1/WjCbfoB/9xG3o8+XTM4Yg
+Pvix8sz7EWvGHYJ07B+f/i38s2TDGB7+sJuxCcs9FxiGwXEMvLoTWCkSDHPpm/mEk4g3pCP
/N3WrkdpUXHrutaMTtf6rvg04QbNXYdpwi/vXcdiWey4K72pfcJs16PuTgb8fRGFodYWQmWH
/pE/aydsi5pc74OuW5XH06pbn4BINHX/3KTyWW2S9kqocgrsRoE/epWONUvkt6MHsQpV4iU9
PkWak4mcwrBhXSk8Q4aIG0Vg0VvrjSIyvI0YKFZdZHgXcsUbYs1e8QH18m/A7lrLFp+yjkyb
RwH0PNAQqAnYtsbkA/hArCs85w8NF03Tmq19mzysFfC+1iSAQ8vSrL/u3onE6AkTdLmUfVwF
+NzgIYHhMH9aDAfXke/lBf5Dtj5LXK9zIh+70Pz9oO74kSeFU1KYW2jw8mRcMyExzxwcaSuf
s36oDfkAJqldjxhdjljOr6ClGy3NFijbRRGh6W3byLGIEbl+vTAiD99BzPzr8v3y9LbAgMLE
DOzrJPAs16bOSkSKyNWb1Ku/7V+/DiSfnoEG5BzeLEw90ARa6DvbVhOWxhoG4y1pFm8/n2Dv
VapFbQhd+u3xhcZ006zQDzv/w+unC2zNT5dnjI99efwh1Keuhm0butbchBa+ExouY8dt3nDZ
NJ2SnIqszhL1em1SXMx9HTp7/n55OUOZJ9hUzKcp28yflZhZAUM3J7Q5wZxMRgKfvtK6EYTv
NTE/kAXGl3qHwKeeBAzoqncCj1BLEO7P1YsEsxsnJ6Bvza8E4ayuVfV+8D7BfBNAQN2yTmh8
bEh9vB8YHvIJBHOD6gdLn6o3dMjXNVd06GhiDqCBpwlhhOqiGWugZzNStAMFvTQwwdLkSzYR
2G40y+F9GwTOHIcX3bKwDAcTAoUhp/KNQnlzq1PUpuAFV4rOIh8y3PC2rSkaAO6V3MQCwjUr
24i3RZ/bUfQ1lmvVsUvMRllVpWVz5KzoLarcfGrS/OZ7JdHd1t8FjI6UIxDMyXwg8NJ4M6cH
A4m/YvQJ4XhE2UXpbo6fWj8O3ULpx5RQhJT7XPDnANOt2Un78COHGG+2C91wTrok98twdoMA
gsgKT70hxq7UqcG2fzy/fjMdC7OktgOfULDQsyag/Iiu6MALRA1AbuYa6HB+19+0dqCe7Akx
BvVteDhMQBx1OhEfEieKrCGUuXoEL51QSDUo19/jLe1Q8c/Xt+fvD/9/wfN2ruBoBxecHrMh
1OLTAhHXgY0sZ29UsJGznENKDmtavaFtxC6jKDQg+cGsqSRHGkoWbWZZhoJF51iKv46CJVlK
I3KN1TtBYMTZsg+aiL3rbNojUCQ6xI7lRHT1h9i3LMMcHWJPucuSOnbIoahPX6XqhCF1SyGR
xZ7XRrLFKeFROTd5FmrMY3i+KBKuY5hv0kdKJXJMfeJY0gVY75BDD3LqGcd/HYNCbMAVUdS0
eKWoe7kMje7Z0rKMfNNmju2THnUCUdYtbdfI9Q3sA/R1ojL5rmUbLrokTi7sxIbhNJzraKQr
+HaP3tkI0SbKvNfLAq/+1i/PT29Q5Bqmn/uzvb6dnz6fXz4vPrye38Bueni7/LL4IpBKJ8Zt
t7KiJa35j/jAlHB0wPfW0qLTTF3xhrOUER/Y9nwFgUnZ4+4fsDYNuTw5OoqS1lXeM1OD9Qk9
XhZ/W8C2A0b3G+ahnBm2pDnQV3v8InoU/rGT0Lcr/Lsyoyzg/S6jyAvNN+IDXv8qwP2j/XNT
Hx8cz+SzesUb4rjyLnSube7gxxzYxqUN7ht+hvH8re0Znr5MjOVEtIycGNd6h3GdWcbnjPkO
45vxqB5YhoPkiUksU7TuqQLHEPIS8X3a2gfDORsvP0rAxJ4bhoFqYIXZzkJfzKsMZPWslBjq
N3/rgKff7txYcWYyYDHNCIGuBfXBXBoExNwQYS4DNtP5YSZDm1yL3eLDn5MobQ0a4cwXItr8
hTBATjg/AYA3r1a+2gxG9yjvzKIsDzwlACoxPp658+Whm12qIGgMwfsnQeL6Zt5NshVOb2H2
5pko6DPKkSJEivcI6LdiI8HSIhM2CEMkRVzgfkbrpTWzLNP4va3ZDeYWFZhkjkW7uVwJPDs1
UzRd7kSG84kb3jx3Ix6Prg0jw7dJbVw+JjboZOjBWZnZcjQ5yWUZjxv+zIJE+RrNSI1hzgwx
QAQC8/QNW1CodZB1LfSvfH55+7Zg3y8vD5/OT7/unl8u56dFdxMmv8ZcZUm6fuYrYG05lsFN
CvFV42NsjVm8PTODq7hwfdJ+45Jhk3SuK4d0FuDUkaqADpheDrjB1BiXYdZSW0P7yHeck+YW
oZP0HhUc4Vq1fc1ikLXJfyPZlzNMAnIhenfzcaxWYxLeB1nT+8t/2bEuxgfq7+iYnpwJRvL3
FJpZPD89/jHaKr/Wea62BaB3dBAYCdhF39NUONVSX9RtGk/+5tNJ1+LL88ugDxPau7s8HH8z
72jlamt4yHxFm1VHQNczU87R5lHH+GOeITXCFT9T/YA3Sx080jJj800bbfKZT0f8jKrFuhWY
XDNbAkjFIPDN9l52cHzLN69VfmzgzC0Z3DQN+dAQva2afevSZ9+Db29cdQ7tecnLp7nimDmw
1/P3789PwvPdD2npW45j/0JnHta2KmvOGKnpk1jTeQCvv3t+fnxdvKHLwL8uj88/Fk+X/5ux
aPdFcTypEfykk1ndUYxXsnk5//iGD5iJxIn9hmE6bEqsisnH4Ae/Aj4lq4yCttIrRoQnNUjt
w0z2bk7EA3sXhVaYw9s0XxuSLiLRrmjHNNZyjxC+Xt1QRM3QuaLtTl1VV3m1OZ6adE1d0WCB
NX/VRATeuSGrPm0GB1NQJ3R0nrId5hJsedYYuQJMpH5KkyxBz8BiTE8qj6Lky4iwrlMq6RtW
kCMBlCR8kxYnHm7HMHomHJZrt+gWSmF7pVttvOVBsa+p2EY/kAVIfeVqQyg1pHwHXT1Qp25I
nJzTyZ0mAky1iqf3y+hAlb+i1WtUISOaqZuD6tcUkgfD5BYigMUuNSxJVaYZYDwWVN0pY8iK
ZEgFrsFO+hIbEXFmOOm6kYxtvUe2YU03rJC1rs+wuF58GHwF4+d68hH8BRMAf3n4+vPljI+q
5LnE3H1QTPKf+VO1jErM64/H8x+L9Onrw9NFa0f9gJMaVuH68GumGrG3ZbXvUyblYR9BsIQ3
LD6e4u4w8x5iIh6ea/kkeApK9k+XRhcF2f6ArPct7esv9J6nfsmzzdYkNfuNKoN6WPIyZJ/k
Gq8ZxXCxYRtHvF/gPB6zBhMlb5MiIzB5nyhNdtkYbkpq9e5AKvyAWVXxtlXJ+6zpMCVjvTeU
qlmZ5pNImhijPj9dHhUpxAlhYyyk7ENSYyNJu29PHy0LNpPCr/1T2bm+v6RcO25lVlV62mYY
TMcJl4k8DjeKrrct+34PM5sHFI0+hgP8eptK9DbNs4Sddonrd7ZJA7sSr9PskJWnHXTjlBXO
ilmU94REf8Twd+sjWAmOl2ROwFwroXuS5VmX7uCfpUvGcCUos2UU2TH1yVlZVjkoG7UVLj/G
jCL5LclOeQcdK1JLvo680eyycpNkbY2BEXeJtQwTy6N7D1t6gp3Kux3UtnVtL7h/ZzSFItD+
NrEjk4Fym0lWtHsY0DxZWga/K6F+oFtZrn/3ziwh3cbzQ5f+shJjEeSR5UXb3HTqcCOueobf
xJnedBRPUS8te36JVHlWpIcTyAT8b7kHRqzoDldN1mIynu2p6jDG15JyFxXI2wT/AE93jh+F
J9/tNDEyUMLfrK3KLD71/cG21pbrlSaj5lqoYW29SpvmiEnBqz3IqLhJUyqjl1jmmGSwzpsi
CO2lTXGmQBJpsnYkqcpVdWpWwOKJ7K2kM1QbJHaQkMc0BG3qbsXHxCRJ4P5mHSwDT0l0xXtD
KFBHEbNga28930nXpC8YXYwxcojaNNtVJ8+979f2hiQAY6U+5XfAHY3dHixyLkai1vLczs5T
A1HWwYRkoC50YSjfkZuIqDt+A2207A014hMPFh88x2M78oG+RuoHPtsV1Dd0NT7AsZyog+Vl
+AROU29s+oDxRtbs8+O4N4an+7vDhtH19VkLRlZ1QE5fGm//ruQgFuoUJv1Q15bvx456H6uo
gONOL+kRTZZsUnIPnjCSsnA7Pli9PHz+qjyihsJxUmL2nszY83gLE9lBA2jlzGzC004EoJLn
GjOMMOoBJ/40TTHMUWfdZjWG6E7qA4aB3KSnVeRbvXta38vEaBfVXel6gbZy0Fw51W0UyHlK
FKRnYgCw2OBPBsWVmgG4tBzNSkOwkmhCwaN6M86OkarbZiUmco0DF8bHtsjkw5ywarfZio0v
YgJP7qOCDdXOKnjq2dig3J66da0kxBoRbRn4wC6me+axdJ3YTqvkRZT1cx4TB+QDKw+Ba3DC
VgnDiIxSOBnL+FDEtxX5JiD0owlS4x+BI7W2KPUVJRZOu5L1mSbuRjAVMln+2iauNyZrIM6a
BrT3u7RQLO5NYTt7V/ZB7bLyiLjtIXL9kAooOVGgpuo4wnscEeHKGVJElBdROtFEUWQgid27
Tq+2SWumnHRNKNgsfANnCSSh65uES9enjkVpE+umMluEcaLZH12WtKYjtsG6VlZestZEQ2OT
wTZGI1QxajMF0LKe0YIeNEiMj8ODzNzts2bXTkJ//XL+fln8/vPLl8vLIlG9gNerU1wkmKjr
VivAeCSvowgS/j8e8vEjP6lUIgYXhd88uWyftkQQLGx3jU+J87wZomrJiLiqj9AG0xBgcm7S
FZhTEqY9tnRdiCDrQoRY13WSsFdVk2ab8pSWScYovXdqUXrIjwOQrkFvTpMTDzIqEPcblmcr
eXCmMw4JivHaxoNJuWq03rGrwPIbcmq/nV8+D+E29NN/HDsuJ8hVBNi6oK+KsOARbAHjVcga
rzJg4bOSWkh8vtpO/sR0nUm/K9B+MIhCq8xCayc88DNdb9lnSSZP6QBSo3vdEERcJY1m7uQJ
qJqsZ0rlCDLEzZywWrrkCUG2JlJlIamTIKNM2etF8gEIYjbP0xJsrbmip+LYdtndPqXroGLu
37D6GA8HwnQh1h1t0bH6CjIsAkCqv0+xRoJx0NIGTFswsJXOcKyBcRBHN9u6Kge6KNJMczMI
Y4N0yDRuztqTS7rmTEgxnQ8yZFqBeMpkibo7NpVSsQubjKmLfVUlVUXZnIjsQJ91ZSEDCils
I/JINzvpd13IZWLWFOr2McJgf2Kg5vRy0g8JGe/brqI9nnBcMGazYciKNt6v1QWwT2g1CpfS
CnSiQ+f5pknAg9e93FVk+BRt1qqg1fT14DvhmKSUfo6JwBYdiyivcv5d4ehHP72rofZvLtxX
50//8/jw9dvb4i8LWANTZEYtBiMeQPFobmNAT7E7iMu9tQXGhdMZnt9ymqIFzW2zJr1pOEHX
u751J0RxQ+igRh50oKKYIrhLKsejRBYi+83G8VyHeXJVU1wWGcqK1g2W640VyHD4COCn3Vo+
40HMoBAbv77qChe0YepU7ipKjEN8oxgFFtnMjWqIaTzblJo3Qsb4Dt38XVwVp/s8pfT+G5Ua
//eGueXpICoHZBSRXlMKjfjA9IbSUxbccHo4e6HKIU0I3Sd8pOZS6SGE8kqSEmGylEjxQrU9
jEKYU0dTN6JVEthy8gKh0SY+xCW1Wd5oxmjChh6oAZVGWfGORJhaAW0UMy6pYato3VO2hcHs
lkYFf5/44fbJGChMoIGWDT7OAlGc7ztHfd87fqHmBjJ1rK32pZxyq5TGiEvMbZbo4nGrZGvP
kmvK+LZr0nLTbYmZArKG3YsF91g7STgt/Elvb39cPqE3GxYgtHUswTy8DjBUx+Jmf1D7zIGn
9dpUplY2Ig7cg1lE3U7yQUjzXSbmtseYVFu8F1BhGfw6qnWDSt+yjL6uH/B7Osr6loe4ilme
qw3xx01aO8cabAfaskE8TNOmKvGCxdBWiq42a7kpDPUshnvjsI+7VPvKTVqsMjI1B8eum0Ir
kYOtXu2pcwREQxv8zkVue3fU5u6e5V1FySBE9ll6z+99tNaPDT8kMA5XhoHdzNjONIq/sVXD
5E5391m5ZQoH7dKyBRO2qxR4HvOsbgpQTEg/AMqqrxRYtclwsaifOsHxR037zF9J1vTDO8Q3
+2KVpzVLnDmqzdKz6MWH2PttmuY6l3H9vgBeSFV4jkqn+kEFO/L8YIYZaNKB1bViWdxUbbWm
jUxOgWf5TXo0LcZ93mUTU0oFy46Kk42YqunSnUpesxLPOmEBmBZMnXYsP5YHeTxqEDCDkacD
paMpEU7YeCJaMRolVJqYxclEFGcm2QU6acnvueJWa6FBjwlDOZCWw5hJMH4hqAAxoCJslSpt
lzJN2gAQOA82n9T8SdBCnRsFUiNu/1yE4GUwa8XDlytIY/G2YE33W3XEBm4YEToUkTrUZf1/
GHuy5sZxHv+Kq5++r2p6O5aPJLs1DzoomxNdESXbyYvKnXjSrknHvbZT32R//RKkDh6gMy+d
NgBSPEASAEEAi7MnUHnBiLkrwEXJIjVhJVctUy7oqJuKCrXaWsOJ3hS6GUBstZSmuXPn29As
NbakR1LmbY/7ijqY+4h+fIj4IW5ujDKdZrOsA2tuJUaq0O0v1+mfFFoEKEwCESIIROfVpaRB
voFovE4Rp6C9m2RXR3DgZMXxcD48gb+8LeiIALQBVqOILdtujH2jP6nXJNPSBYCBDpX+4Cqo
kwAV/0mNtkNotSotzZchbcA2m5DWZjxMoR59XQGasbwBVicFbbSk6JIyyzp1RAFzLYKfbT5r
lurWyDE6WRFSo1yWcVk5JE1G1l2Kj27q9ChYMJJWbgUZ/lpmJQVNgTKjY1Y8fHWkqkWzXvJ9
LpHFNFYAZJCIbZtVwPAOxhDJOGq+C2aRzAD7u6fzTaZx4uF0BofJzjk+MgO2iCGeX2+urqyR
bDYws0v9qOjhUbAI0QwCPYUce7skxKTmmgVhPrbrDmSWdQNQZGiTCS3hwoUPXFNZgyvwVQWT
LnyaHd8ljmYLeMwwXUFtk9pkfW43tTe+WhZA5KiDsmI8nm/srsWcMXhhGyGyw3tjG5GjQ5T3
jTSXRI40X12WaHUsuRmPMeboEbxL2DkmImvfwAOV22u7Wiin56XtoCLMcCpzgvTsLS2Co/B1
ezq59ljfjBWkbg+liI3saOY6MoaiSnstNuNH4n+PZP6FvART+PPuFzz6GB3eRixkdPT9/TwK
kjvYZBoWjX5uP7oYEtvX02H0fTd62+2ed8//wz+702pa7l5/iZdVPyHxy/7tz4PZp47SVPFh
TOjP7cv+7QUPM59GoZZFU8BARDYEVg6nhSv3mNgzooxN9HoEqFn4kEHA5AqJW+I3zqIRYp4j
PaPCgPikIP5RgYpqH1zrEnuwitftmY/yz9Hi9X03SrYfu2Mf5UMwV+rzGXjeKSGPBM/QvMkz
VT0Xn1mHExsizjSzWQJh9simkH1y9FpQ9F37/QPrkdzrR8w89Ic2+AWz2uwhzfWs5spXSdvn
l935W/S+ff3Kz5edGK3Rcfe/7/vjTh6gkqSTG+Cl1Pc+9Y3J1OJDkOymWMJrHHfPPa3nSB1o
jumhsHkh2WNWkGuUuTMCCKKq5Ic0XzSMES6F5uizI/1bolN5RC3eBucuGhFXKhk4E67nxmqV
wDGX163qWnqZg9tkeYROchg6jh2Je/XA7Io5dWy7NWPXjqfdYgfjQ6LPcV+rLoY5qicpdSRF
aLEe5oojzoOoruqNcZqRFSMWTyRkkVdgl3HUlJinV2uN43+vw7m5Oz4ITydjMqNBzlfP/Cqi
DZftMCO56AKYM1vvQrWsgDdpzIUVruTBwz2Hg53oM+ViZLBauLgvMTrH+Z7LzSsalJCnz2KY
fO2XnMtdYwXHty1WMc5+4mCP6aaqnYcNZWDKUD0eAfrAC1jZkMijGMCNmzdAQuR/vdl445Kx
l4xL8Pw/k9mVMYsdZjpXY2GL4aLZXcPnQ0SQs/vKJyNnd6iVScxoZXCGMHMYtlBRzwZM3YaE
RvxFQqwqNvwfCeyXVvHj47R/4qqvOO3s8I3ifFsqR1sms/Q0m5DoLnxtMlxO7MziIw5mOC1X
gcP3pvKXq9wsb+xCE9U9u27VRERxBKOvmbPvQpfV8r30YMHws6LFfXZaqFWAf5bDCGWTuk6U
7rt8OBtx/+Ih2FY0bLI65cp0HMN1lqdwwO64//Vjd+QDMqiFOgPEwPmmkNipIcixsygB+omo
b6jlG1+L6yiktVVbuQGbmJpHVlgJqDs4r0BoMS5ZEZpiZFULeBH5XV2EYrgNCMjd8oWfRrPZ
ZG71IyOV511bolULhtw3TtYQNI6w0GL08zvMO1bshQvvCmdrmVfGkpeFRnl1YTblC/ZO61NX
GcpW+v4YhHla5IyqV69i+TYEjkaD3yAbJTNXZczbyFjH4yYuZiZkSU1tulP5LCMT/2/MzBHp
4Ii4gtNdUjZ7ojwguNOSRpX9k6pI6Er7p5IMY4nXUmZcmPgHHyP/oEXFMs+caktPZUwjXlXc
JOAv9Fld9sQrKON+28DWKxenK0QDx/S7aKvW/DruIIPA4bR7hggUw6tkS1wF+7dbWq3wR8Fi
wV7kA7mcY/fcxXUmcm9eIFGn4kIzPlkBC8yWYpgAIGtyuwNc6m9+R93b4QKWWJNeOErljd0F
vGHGN7BRsMCvSyXaTrWpEcAdiq24a1vl57yjCEgPBZreWXyKa2UNW9NKv5lM0XxbKUlZRUPl
0qyD9CJOG2H65+H4wc77p78wzasvVGfMj0nDtZ06RdPTs6LMmyDJQ82slDIJs/Q+9buf2qz7
VlQ0Bl5AOvWHMGplzeRmg2BLKQXY3QKHEHjgioukcGUA16NDjfBLur5hsEZcWBuYoARdJgM1
cbkGtSBbDDE2wLUJGXZRsHMSw27ZAe9nkytvdqu5iEgEm8ynM3xJSYK15wqBJ5scpvOJI5H8
QDDDXnbIwSivriC219RqGknGM+/KGRpS0AiPwM/w2IvpATsx5kDEb/cQ4K3+mq2HX42dw16E
/u1Mz3ymwoUG5G78ZWxSTG6n2Lu3HjuzelHMZpvNcL9mVjibeZhP8YCdoIXm7gEubmaqitYB
b1TD1TAiM3uAW/gnYwFU8wkuNwkC6brZgG8fep0viEzf0R5oDWTkh2Nvyq5uZlaDg4gL5O4B
qSazW3sUW/9RV6k0HE+ub0xG9RkN7aqq0J/PUBdqiU7C2a2WtbhfCbO/DeBdFXnzW5t7KZuM
42QyvnXyfUvhie8Ym5e4vPj+un/7619jmZe3XASj1m/z/Q1C8yB38KN/De4M/1YcuMWQg3kl
NRrPHliIMHmabEqCveAQWAikY9YD984Pqloix5HyMaudSwm2C+ccANa7tjc8tkgn46kdWw/G
pjruX16wnb/iR8bCSM85GGLCkJ8lNIAgG5h1ifJ/Mxr4un/oABUDwoVA7GLSpJLfctRDNkUX
ZQcsI0wcl3Wbxf6TirWoWgqSn+ARSeF/hb+gqiuQQuRHUSmsk+wTNKrmKZRptQzxY5Kz1FSh
RGnUZoelS6VXqFbyIWGxMolbUgA35UZhSwFhdI32kxa5+sjOxDQhPsQSaSSox/F8T6x8lIiV
hWNMKXOoBApNWZUgMcEbzn9EyqtcoUZ5wjftxq9ycMBgYVkrwyFQlisKQNWGC6qWiUWae7Q9
gsp6T9fNURU28rVjTw8gIRCitfE5bf1QrF2Bo4I6tr1Q2EMWCoui+hW2FnBcNWlrcnyfo5o0
X5H25eslsi6in7MvQLQkfmEQdE/G9R4p21i9aS800IoLeOeLKUL6MwX+swmpI2E6xxVRuQJ/
dFre45XxHpC0pVBsCpAlXX0pDwDOhWGu3YHDB0Kq+LsriIxUG4O0rFW1AUBpPPe0M2MVO3Lu
lmrKZQWqukm1sbRSkmkRyVowbsRskQEEQ9QPvRZDs6LGV2n3udQhxa2iAs0DKW4rrUYKaGaq
0Rp2xQxN0sCD4y9rXdLaRW3rnfun4+F0+PM8Wn782h2/rkYv77vTWfMA7HMkXiYdPr8oyYPr
yoOLp3CQobhFnkQxdUSIS+NI9Kgh+BKHoCQp6X14XBl3ksSH4CwdGV6VkHj4loWP7nLNBaYM
VePD1wNX4Nnh/fi0s2+XeIWsDBt6482UZcOhZFUh0CCJeujQA9Dr4d68KWg1nwboLoM2Q6nD
p0mQY5It5T2vG1/32ZBAJGqg6HK5+3k47yDjMqa5lwR8ZwveZLShSGFZ6a+fpxd7AMsiZdpt
lACICK3YSSSQ/a4wfFSrXGFNeES0pqV9188X2uhf7ON03v0c5W+j8Mf+179HJ5Dg/9w/KfYZ
GWXy5+vhhYPZIdRGpAsfiaBlOV7h7tlZzMbKZ6DHw/b56fDTKNd3KWyCMkxZFagjgBaSbl2b
4lt83O1OT9vX3ej+cKT3Vovauu9rGoZ8e+HLGY/o+1ldorL9f6UbV58tnEDev29fedvNHvel
ULw6IBXtNLbNnutof+NDJ6+ImlVYqyOHlejdqv8Rl3T1FxDJdxWX5L5rTftztDhwwreD2pgW
xXfIVRc+KM+kZqAuB5WsICVscOCzgKwNjRJcPJi/Iq6qQEVhhf95RVzEoyti9seyXw5db8hK
e3FONlU4OPCSv89Ph7fOyTGyWVCSNzHzb6c3mGmhJTBfc7bg1N+Mp7NrTIkdKCaT2cxsIMCv
r2/01NQtqvCTFHXs7fBV1mYdN0uW1c3t9QSTEVoCls5mamLyFtz5GRgW3bzERUmKilRZpSgL
/EdDI+2+DEDS2F6hFnnA81NxUeSqlgrQKs8THQKsadYtFFRHWNoVP9elX7yYfP6zDbRksxaQ
VoyO9TwnAI39O3tjF1UdIDkXUhOFYtc3VzP1w25mLNapVT/I2RB6GXl5UN7DKa620k+4ToOf
k1Y9fTUFOOMF+mOTIPfLqKm4hOs5DMvyMgt027BCPQ1LAq5J/EdV5kmih2aSuPZYgV+h415M
ElIRKm6xdn4FQoh1lizpg7B8GLH37yexlQ5D1kX80Bx0FGAbyF1DB2Ha3OWZLzye2pLDjPEy
8OARnkNUeVka+jdCpVeuYhglZem7amd+gj5qApqYJZBS+ya9h0bqtad0w8cO6Rcgi43feDdZ
KpyyHCjottmo1C/EJXWTRul87uAQIMxDkuQVMEtEsB0NaERYAekZZn5HQVFsywCaLuZl204F
U3HQ2GsDzrXLQGeMnhrOr9AvFMtMxA9Imv0h40ENm2IYWCu02B3B3WX79gTuu2/78+GIPX+C
OMphiD+cBVyR1ujCvVR9vwp8/fp+2q0D/+35eNhrfsL8wC9z8/62ExFbcuUQR58bZivN3Ch+
SmuPtsplCIKGgPRu72zL9eh83D6Bo721tzHVE4//4Kp+XoFSzXQX4AEF8bSwtQcUwudGr49L
6iVfVRzCDN9dBbskflkFBHWGUshi8GdWbIxyu6qWNkR/OdJDF5V2/9zDGRo5oEdzvkeLFY67
+54ACWTVvVCz56T7bFyo4eXgkrf0+dg3tPclc6GEqjzgoaImXZQ9obg+cOPDVYEgW+EaL0lD
Mr1y4FI/XG5yD8GaYVDb73MpkzwSC9s2gHczImFeF4l6KSLqK8lCS5aRxzhcAKM4sSFNnBIc
Cl1xYPqG9hOvoeXXEb7qqfy4Rksb9q6BgGF2MOFDwkdlM/j9iGSmv153f2OOs2m9afxocX3r
KWzWAtl4enWjQ/X3jAABs5m61WNfU/SHvNBEJ0ZRcwZLaGrIRgCSJ1NYlZjkI5x4QhmxVjHH
5LXuNRfzHeS+9qOIaFtaaj1r6Qy/utwoI/jtuV4sDzM9O7oPQe4rvjcxCFDLUFs/x9E8VU89
rg54jb6Jt6Bm41cVemGwqSZ2kYn4cM4gxGqIjVFHw0hYl1SN18YxU80drQUM1dkopRa1FVPn
FcMfQaQJNfDbSQzOdkHItw31HonAtQw4tzEEyEl1r50eA3YsuI3BDbxKrfaAD40VBEhDN0Z7
4Pd9nas3Tht8IAFcapIOQPIMAnvKeyC0JUC09ktcqAGka0gXMTMZrQU1YBXlWmATJZhfZh72
JQ1Ik3uhdmfUI3rjA0QGYi4Hu54c3B+w0ZUEbYoSn90l+cL+3AX/86Ay+aWDYDPS4wQviT1l
YbJ4T1PWXLX3M45urJsljdZyxpdgn/EhwqSc4QskhjtpLahrRhN7GmPP4s4e98hVBhfvuhY4
KPT6biAh0guu0SOoUi60t/yjnA1c4oX3Ng8OPLjlZmH5UOiprTQwlwUWejeZGA7UXyBmZvjb
yARQCehcKYZqffv+sEV1C1mxnnIAXPCIdzPi0IlxC5vwK23pYblq3Zdg4/ZaAisu+SiwOK2a
1dgEeEapsNJCIMJj+5hNXSwh0Q6W4KOjrZfQeOjV3pehhSEfGUSO17aKHgbBbigE+234H20V
IyR+svZFtN4kyTEbhFKGZhHZoB9MCR+avHjoZKFw+/RDC6TMuhNG4TEBsjcki2JJWZUvSh8N
2NrS2EFkW0QegJbbQNAE/C4LqJDHN91NkeyI7FT0lWt636JVJCQTRDChLL+dz68cL3SiuNtN
usrxCqVxOGffYr/6Rjbwb1a5PpkyTunivxUv68KJivGWZpWxlQuANcQCWq7RcbvYfGlYOO3e
nw+jP7Vu9UuayxFqAwQAjGBVYgALeMuU5vx0yEsDFS5pEpVE2fXuSJmp1XZKffuzSgt9uxcA
XNIzaFwCZErkvSzRAgrKP8Ygcy5c+aXBIsgo9VVTJp08eC8qkmoNz0twG3ZtPX5kfLoF8MnU
NrfYVQERJ4cpGHdA3mnGrFvslmppfJr/lnF/VMmBmKIEQU93Z/O64sMq57sHSsq4jsKWGk+0
EHmeWtuWjpZ7KG5C7ghBgU6LBuK6Jfi7BpPUeqBwiQ5uC0I1oWBPJXgSgT9qwdZ7cPI4RTua
PGKW2eErj2ipR1ZhHoM9fioCX0D8C0YfCdIckgaEa48RNjOlv0gJP/TbEwQq6LPtrTbW7KcU
0urgB2lq8mNhAO6zzdQGza2PtEB3GPWy/RZuToYHNph0wxf3Sn+/ZDRG/m7WpXw3N7gzXVBQ
SJlb7e9gnxbq+couelEn7ohQdbZDPlL8cQ0XBNd5eafud9jBlaiHVsL6XIxf9qfDzc3s9uv4
i1JnIrPqiCNkOsGuOTWS68m1XvuAuZ45MDf6TaaBw3zEDZLZheKftljzsTcwYyfGc39yjkVe
NkimzoqdgzSfOzG3DsztZO5sppH6FS/uuSqeuj55o/trA44LfMBWDfa0RSs79i4wAkdiby6A
xmchpXp7um+OcbA1ex3CNXUdforXN8PB1uh3CDxOuEqBxZzWOjZxdNjRwrHRxLuc3jQlAqvN
Nqd+CNuyj5t4OoqQ8GMWvdPvCbh6Wuu5B3pcmfsVnielJ3koaZKoV5QdZuGTRL8S6jFcecW9
7zoKGkKAEOwM7imyWk/uog3J5TZXdXlH1bdrgKirWLFjR0mq/UBiJWQU1gDqZ9es71U5WDMF
S5+z3dP7cX/+sL2f78iDcgzAL67t3tcQRsQS59oYfSBMcMKSy2iOSBQQGZOIAMSoxCltKS2B
+gH+u4mWkMZFhhZGhdD2RATnYiZu/auS6lezHYnDW0EicTtDXgpjjLzOU6QpyIcUChsNRE0z
032jaK5tVcvfv3w7fd+/fXs/7Y4Q0OmrTKH9pZ/qNvzh0CtfYe2Epb9/AffL58N/3n772P7c
/vZ62D7/2r/9dtr+ueMN3z//tn87715gcr/Iub7bHd92ryKJz+4Nru+GOVdeh472b/vzfvu6
/z8jUTUX/yDuBXiCZHmmzf8ihIAQNVdWIJx5zfVLSOVeux4l4OTBQ0lwn/IL9I2f4AqlaK0w
yiV52I+mIyh1RwzXeE7a7soIH6UO7R7k3oHPXHK9gT0vpcVSNWfBgsh7g9Dx49f5MHqCgHV9
1nXF81cQgx3SVy8uNbBnw4kfoUCblN2FImyYE2EXWWpvcxWgTVqqJscBhhL2MqnVcGdLfFfj
74rCpr4rCrsG0BdtUr7Nc/nDrreFa6JEizKXBloQMlv6AdePhb3eqn4Rj70brrxaiKxOcCDW
EvEHO9+6PtfVku/LSElole3o8v79df/09a/dx+hJMOsLJFP4sHi0ZL7VxMhmFBKGCCxaIs0h
YRkx/DVY19W6XBFvNhvfWs32388/dm/n/dP2vHsekTfRdr44R//Zn3+M/NPp8LQXqGh73qqG
w65qNEBIN1Hqm7CuwJKfob53VeTJw3hyNUMW4IIyLaNVt9TIPV0hg7L0+S626naKQPjmw8Fy
ssY+DLDpDGPsMX6HrGz2DhGeJGFgwRLdHtZC80ufK2QTdeCmYkg9XDJYl2iE3I7xl+4xhjcr
VW3PDjz17IdyuT396EfSGjUuxrm/vUx9bKg3vHvuQitZSNqv9y+709mewTKcePYICbA9bht0
Dw4S/454AdI8icGkoOE71fgqorG9J6GfUibA/FYaYQ/ve6Q9ZynlnC68Fe3+l2mErRgAz6+Q
j3OEN8MCGA74iZqNt1uBS3+MAXldGHg2xvZdjsBjQXT4FNM0OyTcugW5fVxWi3J8a7PAupCN
kAwsQkjZ24JP7PXMYfIhgwHO6oAi1GU4RfkpX5sPrgyG8uHJFLWPhNAHdcOIYq7gbP4AqD0N
EdK3WPy1D/6l/4gIRMxP2P9XdmxLjevIX6HmaR92OcAyDGerePBFSXxwbOMLAV5cmZBlqBlg
KiRVs/v1292SbF1aZvbh1By624osS62+d8RsBs3IuU8s2BLYA7aurKyE4cOf+59V+EvTrspZ
xhw2BR9XTX70t5efu+37uyXRD4szy23HimLcD6UHuzz3d5c0eXuwBcf6XIO2zMNavz6+vRwV
h5ev293RfPu63Tm6x7DvmqxPKk5QTOt4rvMbGUyAE0sc3+/EJOHuP0R4wL8y7OokMKC9uvew
Mr2fkc01QovLnLxIeC1oT7GOgbgOZEC6dCjsT1xiMCUKR3K0kB/PX3dr0IR2b4f98ysjZ+RZ
zDIVgvOsAlEfXj9IJI+dkQTMjSSJppaAqFix0KfjeAjC9e0GMi26UP6cIpmeryb7cMaO8Dg9
7+FmcodacIEKUXO/xH6UWUJGFyyNNb61gay6OFc0TRfbZHefT/7sE4EWkyzBCEMZXjgSVNdJ
c4khJ7eIxTE4ii/KBco//0WWtHX6ZTXZvBDY40d6FikcCefghLPKfbzd7TFpDgT7d6ql8v78
9LreH0C53nzbbr6D9m4WA0B3iWnBqq0QGR/fXH0y3CQKL+5aDFce14Y3ZJVFGtX3zK+54429
LBQNH3/xG2+qfz3OCvxpigea6SOfB896HWXpRV8Zafwa0segNwLfNXu7Yh6RtWxxBqIMJtgb
20cn24CUUyTVfT+rKcPD3AAmSS6KALYQbd+1menOSsraqRCO/ZKojmvs1H4ZXgc3T5T7w2MV
Aic4lvqlYEhSsqzuksWcIslqYQnKCWiLWWtd/Mmpcz6TXgrY7MlO+qztenuAfzoyJgCGIhIB
dkIkcIZFfM8XHbNIeDGdCKJ6FdleU4mAb8s/dOGw/iQwuOEoxLqmntKTGLL+oOWMnuKoSMtl
YB0UDYgzVC2xFmaRCITK4AAbji5/vAltaelBXg4OFIQnZmSEciODuMRSgxDFw/n5gXDFkBOY
o7976J3Acgnp7y45rUghKRGq4h7LootzdicpfFRzVpIR2S7gFLrT6xvg/okHjZO/PJiqCK6A
4xv384esYhExIM5YTP5gtkcxEBSpwdGXAbghHGvOQUbpyIq1otjM2yh3AiqjpimTDFjQrYAV
qiOzXWVEsflmkpUEYfBrb7ElhKfm+xSgmiAEyXqnT+vQ8wnxFBCBeyq2+m8jCl4yj2pELkji
ZUZoRNtVRGzF4A540GvqtFwVPgkCqP6KBy3KQv9iv7Tekgo5CQ8k+9xIc8r23+vDjz1WAt0/
Px2w8cGLNOevd9s13Ir/3f7LEGOpDNSDoNgg+Dksont6YjAujW/QHoGlzVih1aQyRvpPaKCM
91HYRGzKHZJEOUhAGNZzdTk+i8uAgn4oKKWZ53JPGit3Y954eRnbfw1M1dhTuR0pNWx2qhRl
BjQk+UPfRmYVrfoGhV/jF5dVZsVXpdnS+hv+mKXGj5fUnHIOgpDZOrZLmjOUEexY7hJ2jlej
iqCXv04vHBA1AsNWrQZtg9mgZro5beii7GWVELOhLfnLUlGV5uNwMcpdOkpzNMfAja2EOE8G
s516Wl4l6M/d8+v++xHo1UePL9v3J9+9S/Id1nZd2p5cCcbOuLyHQiZDYsfRHOS2fPDDfAlS
3HSZaK/Ohy+rZHpvhHMjJhF7jKmpUPc19kToJnDhYDGLItRnCXSauERdRtQ1kJtcjh6D/1QP
givDlR5c4cHc8vxj+4/984sSsd+JdCPhO/97yN9SarYHw0DzLhFOGY4Bq28bt2W3T9lUOSuV
GSTpKqpn5qWVxpjek1WmvV8U5JladmifU5lM+tjUsIiUQwDc8uzc3uQV3GiYBhyonFSLKKWB
gYolWAAByOkwUzhZORchJ98EdCjKyVhmzTJqzfYeLoZm6rSaovO8iuD4y5epSrqeG/clFdz/
KrMSk35X6KZGh39S8Xnbv71NZCMoNIw9b/SRT7dfD0/Ugyx7fd/vDi/b172ZK4mNf1FNNEus
GcDBzy0/5dXJr1OOStZw4EdQ9R0aDAspEoH6rr0KZkRoRBIMrOs1bChzxfBvLtA/biKrNBoB
sIIH2w6RkDHWVjKjOgmKId7+QMNFyUeqoG2BCNkP91ufwl4MjJoXub9VcHaeaUIFGQzjGnwb
eae4a7HFtV06TjXBAjxd5VyODz4L4pa9YwkKOxl7eQcMhuPQfShGQ5LUJRav9FzDFs3qzp+1
zC9h2wPjvlErCLIuRn64DPIjOKYP0IUtY5xPL05OTtwJDLSTUx+ohhgRu7GwQ4WyA7DOQGCc
YlQUUNM1obYA1EhTUWEzUmK2wQneLv3p3C7JpYgxWxPP9XXsrh8AqzmotXNOdFckIKJ3JnuY
BMtyQRRt46IW2XxhqTJJQj9zHeFZ9Wo9KiwGM6PcVJSU2YjSMdahtZRcOQIt4NWpF8YznjDv
wyyc8pVKgwD6o/Lt5/vfj/K3zffDT8mxF+vXJ7tOD0wowZiisqy4fW3hMRe7AxZsI1E2K7v2
ytis2GIdTUqoVYkWjkzJewIksl9g0ZM2argNs7qBGw7uv9ROUSXGJ3+CT0maXAAZUwg32eOB
egr4/EvuZy+IkcBMEpuOmWKGdD8YLte1EJXDxKT9EqMhRi79t/efz68YIQEv8XLYb39t4X+2
+83x8bFZErvUfRvmJJwPKoMhLWM5V5UtyqwxjYBv5W53VNC7VtyZLgW17VTRR+/s8OSrlcT0
TV6uKK7QO//1quHj/CWa5ugofwgDpcUfSyGCg+mqwLkIPY0rSY4srsKtuWywtbFXnWPUGd93
1D9HDen/+MqWguYUZyGJEJYE+28IkcJ+lbZEhtXLiyvAJr5L6eBxvV8foViwQYu7J/PnWePt
j8rtXa02x9T1TFnBGW/Epju2oMrSqAbVnU5kds51YMb25BJQRkBuAtFvKJZWJx132PlvCMRU
nM3r4IcI8xFeRUCi2klitrDihk0g0nU5rak6p+lGSe41yez+B5AJ5SB+YdoVPz80AxfJfVty
pwQb/dHkDTsJSTi6g9AH2DlIvwueRuu6bqUhBtmvsnaB5hJXPlfoJdUhAQL0ljgkmD6KR4Mo
Sf9xB0nUg3KUESnHTmzmRmYP2UDPUC6xXCPRW4Yb+KfFpZcFAr1VMIYifrYCQtMW6I2nDVTu
QIqQsRHppbUMFXjv6Ge4yPHQlw19VM96MQtv92EMuInQ4cmZbKTs6A8P4g2IEzOFmRA+JwgW
K9juUwRqR6ldE8oKwMf7poiqZlGyJSawKepCv6QXfq7hUQE8MEKHqXyAtcfqZuFZ2TsnpYNx
YiF3n5k2W808mP40LtwZwfDWFnDiJDy8Bmrjy5JyzNTHM2f5VkfmZ5yAgWDy56KcPAC4epOf
r41qtOSHmbLxyx8SV7UQS7iAyAaBpQ+ClE2ERWjZ5OtRD6HCclkjz7yV6Ur5H4rC2vmljfOu
7/XuhbvOqARfm3ZLr5zZiKB7wsosLVZY8aH+yGQUCAlXMoKnS6XJ2enZ5efeFUm1/alsZY0v
tA2eTkgNWSLShK91ri1pywwLvU/bBlBYgs/eX5595is92mRVzvd6GqiyIsm7VFx9esTP8Mfj
ht72uPk0LuvgYhtoX9abb38cXjcq1u34mxF/IaI6V1EN/JHAL0oNkFmpwd4RpuW93b7vUdpE
JSjBmsrrp62pCF53Rcbvbi2woeG5rNWxzwIpKtLewNK4R+I6Kc0AcakqgxIMYHXwbe8t0nOB
D3B709Um6ON7zQPy67TljbRSh8SglMYptWuTLLOCmliEKYLPx1pqJ0VggjHF6E+dwAtqL5+X
WIo/SGU5ZycYG9UQCJmQtB/MVl3Mt12IO+QhE8sh3UQyjYxji5qqSap7b/hrQLRsBTtCDxE/
JtB3VWkw7NycdzdI22kX6P9I2DvyZYfxWBRn5lTSsSlqDPdo0XIdpnEDO21slvKhgXL3Xk9s
bXj70u28YuJvl54F1lkcjLzESj8Tv1HxdlaJxKivBXrZ4ALj2QXcOTjPj+QA2RW+ph5JE/uO
asZMvE/YSad2JKVBummfNpFlOpxgGmKZgMzJaVf6t9DKkPnHC57MCtb7BRjXljDJ3b1kP+l8
/R8AhzPiTRECAA==

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--LQksG6bCIzRHxTLp--
