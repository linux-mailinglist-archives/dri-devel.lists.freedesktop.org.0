Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A206C54C7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 20:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA0610E02D;
	Wed, 22 Mar 2023 19:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA47710E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679512795; x=1711048795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pg5NNlS4ad+LRq/5c7S6MbLvj8O8FQnKakg+GtVdxl4=;
 b=iFzLDD8BAMF83HMb1g/3T+Ox6IMzgJ4QX0uchiTDUZIg0qyJvZ2lkt8L
 4/LSEZXB/cqfif/+6WAiqxA17RACEhKvn3QTEidYJHKnMF42bDcPAv6TR
 wLl8qPBHwOgiy93BpZ+r4F1kiXqbjuhHJWEn6u7V1MZhSBYN0Y/JsRyy6
 EwoUv8F0xP28dK+XbX613tqgAzxB60/2LmWG2NS2z4VZ7MOkRIFgKU7kH
 8XJKVgSt4nMkW1f5ioY5NVL0P2oLdII0CEAZH6cQAjtn/dhLb9kAmXEwC
 cdkxc6CwTWSXWYoDhrrrb3KC3VJ/2kY0c1DjBoeK/fOOnmLcaNXDx+ii2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336822233"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="336822233"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 12:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="805969540"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="805969540"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 22 Mar 2023 12:19:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pf3zz-000Dc0-1l;
 Wed, 22 Mar 2023 19:19:51 +0000
Date: Thu, 23 Mar 2023 03:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hsia-Jun Li <randy.li@synaptics.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 2/2] Documentation/gpu: Add Synaptics tiling formats
 documentation
Message-ID: <202303230311.mRoFe6oK-lkp@intel.com>
References: <20230322082910.115371-3-randy.li@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322082910.115371-3-randy.li@synaptics.com>
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
Cc: ribalda@chromium.org, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 tfiga@chromium.org, Hsia-Jun Li <randy.li@synaptics.com>,
 laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 oe-kbuild-all@lists.linux.dev, nicolas@ndufresne.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsia-Jun,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hsia-Jun-Li/drm-fourcc-Add-Synaptics-VideoSmart-tiled-modifiers/20230322-163252
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230322082910.115371-3-randy.li%40synaptics.com
patch subject: [PATCH v6 2/2] Documentation/gpu: Add Synaptics tiling formats documentation
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/51642395567738204b07b9c48e27d4a5298f1ca9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hsia-Jun-Li/drm-fourcc-Add-Synaptics-VideoSmart-tiled-modifiers/20230322-163252
        git checkout 51642395567738204b07b9c48e27d4a5298f1ca9
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230311.mRoFe6oK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/synaptics.rst:47: WARNING: Bullet list ends without a blank line; unexpected unindent.
>> Documentation/gpu/synaptics.rst:60: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/gpu/synaptics.rst:38: WARNING: Error parsing content block for the "flat-table" directive: exactly one bullet list expected.

vim +47 Documentation/gpu/synaptics.rst

    37	
  > 38	.. flat-table:: Synpatics Image Format Modifiers
    39	
    40		* - Identifier
    41		  - Fourcc
    42		  - Details
    43	
    44		* - DRM_FORMAT_MOD_SYNA_V4H1
    45		  - DRM_FORMAT_NV12
    46		  - The plain uncompressed 8 bits tile format. It sounds similar to
  > 47		Intel's Y-tile. but it won't take any pixel from the next X direction
    48		in a tile group. The line stride and image height must be aligned to
    49		a multiple of 16. The height of chrominance plane would plus 8.
    50	
    51		* - DRM_FORMAT_MOD_SYNA_V4H3P8
    52		  - DRM_FORMAT_NV15
    53		  - The plain uncompressed 10 bits tile format. It stores pixel in 2D
    54		3x4 tiles with a 8bits padding to each of tile. Then a tile is in a
    55		128 bits cache line.
    56	
    57		* - DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED
    58		  - DRM_FORMAT_NV12
    59		  - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H1``.
  > 60	    A group of tiles would contain 64x4 pixels, where a tile has 1x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
