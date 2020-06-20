Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE6A201EF6
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 02:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC486ECF0;
	Sat, 20 Jun 2020 00:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582E96ECEF;
 Sat, 20 Jun 2020 00:08:41 +0000 (UTC)
IronPort-SDR: BS6aRNLondaAK857ybmwexBeRyHLxqk+82ydo2QDsAzCpPrzEmXmYPZBFcO4Kn6qU+iMCEi66A
 lJL1M43WTPNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="144629929"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
 d="gz'50?scan'50,208,50";a="144629929"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 17:08:40 -0700
IronPort-SDR: D/7Mxty5+FDelM3b4TC0hr8Xuu00J798FjmXjz1okL/7vy83S94WyxmEUh7DzEBYJJHx3n0TJm
 hq8iLsiwJ+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
 d="gz'50?scan'50,208,50";a="352879973"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 19 Jun 2020 17:08:37 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jmR3k-0000Ph-JC; Sat, 20 Jun 2020 00:08:36 +0000
Date: Sat, 20 Jun 2020 08:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [drm-intel:topic/core-for-CI 17/21]
 drivers/staging/media/soc_camera/soc_mediabus.c:19:4: error: 'struct
 soc_mbus_pixelfmt' has no member named 'name'
Message-ID: <202006200836.ATsXJORs%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joonas,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
head:   7baab4e528ef38546a32f0a368285289aa2c981f
commit: 11be607ccb68a1604ce6768a3cfb1fb528cc401a [17/21] Revert "drm/i915: Don't select BROKEN"
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=1 build):
        git checkout 11be607ccb68a1604ce6768a3cfb1fb528cc401a
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/staging/media/soc_camera/soc_mediabus.c:19:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      19 |   .name   = "YUYV",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:19:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      19 |   .name   = "YUYV",
         |             ^~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:29:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      29 |   .name   = "YVYU",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:29:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      29 |   .name   = "YVYU",
         |             ^~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:39:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      39 |   .name   = "UYVY",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:39:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      39 |   .name   = "UYVY",
         |             ^~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:49:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      49 |   .name   = "VYUY",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:49:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      49 |   .name   = "VYUY",
         |             ^~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:59:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      59 |   .name   = "RGB555",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:59:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      59 |   .name   = "RGB555",
         |             ^~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:69:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      69 |   .name   = "RGB555X",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:69:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      69 |   .name   = "RGB555X",
         |             ^~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:79:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      79 |   .name   = "RGB565",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:79:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      79 |   .name   = "RGB565",
         |             ^~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:89:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      89 |   .name   = "RGB565X",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:89:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      89 |   .name   = "RGB565X",
         |             ^~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:99:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
      99 |   .name   = "RGB666/32bpp",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:99:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
      99 |   .name   = "RGB666/32bpp",
         |             ^~~~~~~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:108:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     108 |   .name   = "RGB888/32bpp",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:108:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     108 |   .name   = "RGB888/32bpp",
         |             ^~~~~~~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:117:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     117 |   .name   = "RGB888/32bpp",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:117:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     117 |   .name   = "RGB888/32bpp",
         |             ^~~~~~~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:126:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     126 |   .name   = "RGB888/32bpp",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:126:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     126 |   .name   = "RGB888/32bpp",
         |             ^~~~~~~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:135:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     135 |   .name   = "Bayer 8 BGGR",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:135:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     135 |   .name   = "Bayer 8 BGGR",
         |             ^~~~~~~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:145:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     145 |   .name   = "Bayer 10 BGGR",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:145:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     145 |   .name   = "Bayer 10 BGGR",
         |             ^~~~~~~~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:155:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     155 |   .name   = "Grey",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:155:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     155 |   .name   = "Grey",
         |             ^~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:165:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     165 |   .name   = "Grey 10bit",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:165:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     165 |   .name   = "Grey 10bit",
         |             ^~~~~~~~~~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:175:4: error: 'struct soc_mbus_pixelfmt' has no member named 'name'
     175 |   .name   = "Bayer 10 BGGR",
         |    ^~~~
   drivers/staging/media/soc_camera/soc_mediabus.c:175:13: error: incompatible types when initializing type 'enum soc_mbus_packing' using type 'char *'
     175 |   .name   = "Bayer 10 BGGR",

vim +19 drivers/staging/media/soc_camera/soc_mediabus.c

9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   13  
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   14  static const struct soc_mbus_lookup mbus_fmt[] = {
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   15  {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   16  	.code = MEDIA_BUS_FMT_YUYV8_2X8,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   17  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   18  		.fourcc			= V4L2_PIX_FMT_YUYV,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  @19  		.name			= "YUYV",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   20  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   21  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   22  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   23  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   24  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   25  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   26  	.code = MEDIA_BUS_FMT_YVYU8_2X8,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   27  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   28  		.fourcc			= V4L2_PIX_FMT_YVYU,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   29  		.name			= "YVYU",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   30  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   31  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   32  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   33  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   34  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   35  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   36  	.code = MEDIA_BUS_FMT_UYVY8_2X8,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   37  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   38  		.fourcc			= V4L2_PIX_FMT_UYVY,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   39  		.name			= "UYVY",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   40  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   41  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   42  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   43  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   44  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   45  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   46  	.code = MEDIA_BUS_FMT_VYUY8_2X8,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   47  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   48  		.fourcc			= V4L2_PIX_FMT_VYUY,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   49  		.name			= "VYUY",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   50  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   51  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   52  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   53  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   54  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   55  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   56  	.code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   57  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   58  		.fourcc			= V4L2_PIX_FMT_RGB555,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   59  		.name			= "RGB555",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   60  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   61  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   62  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   63  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   64  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   65  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   66  	.code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   67  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   68  		.fourcc			= V4L2_PIX_FMT_RGB555X,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   69  		.name			= "RGB555X",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   70  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   71  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
abcb6b99f5e5d2c drivers/media/platform/soc_camera/soc_mediabus.c Guennadi Liakhovetski 2013-03-08   72  		.order			= SOC_MBUS_ORDER_BE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   73  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   74  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   75  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   76  	.code = MEDIA_BUS_FMT_RGB565_2X8_LE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   77  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   78  		.fourcc			= V4L2_PIX_FMT_RGB565,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   79  		.name			= "RGB565",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   80  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   81  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   82  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   83  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   84  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   85  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   86  	.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13   87  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   88  		.fourcc			= V4L2_PIX_FMT_RGB565X,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   89  		.name			= "RGB565X",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   90  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11   91  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
abcb6b99f5e5d2c drivers/media/platform/soc_camera/soc_mediabus.c Guennadi Liakhovetski 2013-03-08   92  		.order			= SOC_MBUS_ORDER_BE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21   93  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24   94  	},
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18   95  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10   96  	.code = MEDIA_BUS_FMT_RGB666_1X18,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18   97  	.fmt = {
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18   98  		.fourcc			= V4L2_PIX_FMT_RGB32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18   99  		.name			= "RGB666/32bpp",
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  100  		.bits_per_sample	= 18,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  101  		.packing		= SOC_MBUS_PACKING_EXTEND32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  102  		.order			= SOC_MBUS_ORDER_LE,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  103  	},
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  104  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  105  	.code = MEDIA_BUS_FMT_RGB888_1X24,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  106  	.fmt = {
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  107  		.fourcc			= V4L2_PIX_FMT_RGB32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  108  		.name			= "RGB888/32bpp",
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  109  		.bits_per_sample	= 24,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  110  		.packing		= SOC_MBUS_PACKING_EXTEND32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  111  		.order			= SOC_MBUS_ORDER_LE,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  112  	},
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  113  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  114  	.code = MEDIA_BUS_FMT_RGB888_2X12_BE,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  115  	.fmt = {
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  116  		.fourcc			= V4L2_PIX_FMT_RGB32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  117  		.name			= "RGB888/32bpp",
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  118  		.bits_per_sample	= 12,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  119  		.packing		= SOC_MBUS_PACKING_EXTEND32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  120  		.order			= SOC_MBUS_ORDER_BE,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  121  	},
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  122  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  123  	.code = MEDIA_BUS_FMT_RGB888_2X12_LE,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  124  	.fmt = {
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  125  		.fourcc			= V4L2_PIX_FMT_RGB32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  126  		.name			= "RGB888/32bpp",
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  127  		.bits_per_sample	= 12,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  128  		.packing		= SOC_MBUS_PACKING_EXTEND32,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  129  		.order			= SOC_MBUS_ORDER_LE,
7b88fc086a217be drivers/media/platform/soc_camera/soc_mediabus.c Phil Edworthy         2013-03-18  130  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  131  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  132  	.code = MEDIA_BUS_FMT_SBGGR8_1X8,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  133  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  134  		.fourcc			= V4L2_PIX_FMT_SBGGR8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  135  		.name			= "Bayer 8 BGGR",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  136  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  137  		.packing		= SOC_MBUS_PACKING_NONE,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  138  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  139  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24  140  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  141  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  142  	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  143  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  144  		.fourcc			= V4L2_PIX_FMT_SBGGR10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  145  		.name			= "Bayer 10 BGGR",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  146  		.bits_per_sample	= 10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  147  		.packing		= SOC_MBUS_PACKING_EXTEND16,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  148  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  149  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24  150  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  151  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  152  	.code = MEDIA_BUS_FMT_Y8_1X8,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  153  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  154  		.fourcc			= V4L2_PIX_FMT_GREY,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  155  		.name			= "Grey",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  156  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  157  		.packing		= SOC_MBUS_PACKING_NONE,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  158  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  159  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24  160  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  161  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  162  	.code = MEDIA_BUS_FMT_Y10_1X10,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  163  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  164  		.fourcc			= V4L2_PIX_FMT_Y10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  165  		.name			= "Grey 10bit",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  166  		.bits_per_sample	= 10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  167  		.packing		= SOC_MBUS_PACKING_EXTEND16,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  168  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  169  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24  170  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  171  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  172  	.code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  173  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  174  		.fourcc			= V4L2_PIX_FMT_SBGGR10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  175  		.name			= "Bayer 10 BGGR",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  176  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  177  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  178  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  179  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24  180  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  181  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  182  	.code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  183  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  184  		.fourcc			= V4L2_PIX_FMT_SBGGR10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  185  		.name			= "Bayer 10 BGGR",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  186  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  187  		.packing		= SOC_MBUS_PACKING_2X8_PADLO,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  188  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  189  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24  190  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  191  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  192  	.code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  193  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  194  		.fourcc			= V4L2_PIX_FMT_SBGGR10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  195  		.name			= "Bayer 10 BGGR",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  196  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  197  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  198  		.order			= SOC_MBUS_ORDER_BE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  199  		.layout			= SOC_MBUS_LAYOUT_PACKED,
81355e40826acea drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-24  200  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  201  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  202  	.code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  203  	.fmt = {
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  204  		.fourcc			= V4L2_PIX_FMT_SBGGR10,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  205  		.name			= "Bayer 10 BGGR",
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  206  		.bits_per_sample	= 8,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  207  		.packing		= SOC_MBUS_PACKING_2X8_PADLO,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  208  		.order			= SOC_MBUS_ORDER_BE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  209  		.layout			= SOC_MBUS_LAYOUT_PACKED,
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  210  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  211  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  212  	.code = MEDIA_BUS_FMT_JPEG_1X8,
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  213  	.fmt = {
64149deb6a9ec35 drivers/media/video/soc_mediabus.c               Kassey Li             2011-05-20  214  		.fourcc                 = V4L2_PIX_FMT_JPEG,
64149deb6a9ec35 drivers/media/video/soc_mediabus.c               Kassey Li             2011-05-20  215  		.name                   = "JPEG",
64149deb6a9ec35 drivers/media/video/soc_mediabus.c               Kassey Li             2011-05-20  216  		.bits_per_sample        = 8,
64149deb6a9ec35 drivers/media/video/soc_mediabus.c               Kassey Li             2011-05-20  217  		.packing                = SOC_MBUS_PACKING_VARIABLE,
64149deb6a9ec35 drivers/media/video/soc_mediabus.c               Kassey Li             2011-05-20  218  		.order                  = SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  219  		.layout			= SOC_MBUS_LAYOUT_PACKED,
64149deb6a9ec35 drivers/media/video/soc_mediabus.c               Kassey Li             2011-05-20  220  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  221  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  222  	.code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  223  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  224  		.fourcc			= V4L2_PIX_FMT_RGB444,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  225  		.name			= "RGB444",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  226  		.bits_per_sample	= 8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  227  		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  228  		.order			= SOC_MBUS_ORDER_BE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  229  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  230  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  231  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  232  	.code = MEDIA_BUS_FMT_YUYV8_1_5X8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  233  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  234  		.fourcc			= V4L2_PIX_FMT_YUV420,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  235  		.name			= "YUYV 4:2:0",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  236  		.bits_per_sample	= 8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  237  		.packing		= SOC_MBUS_PACKING_1_5X8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  238  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  239  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  240  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  241  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  242  	.code = MEDIA_BUS_FMT_YVYU8_1_5X8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  243  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  244  		.fourcc			= V4L2_PIX_FMT_YVU420,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  245  		.name			= "YVYU 4:2:0",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  246  		.bits_per_sample	= 8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  247  		.packing		= SOC_MBUS_PACKING_1_5X8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  248  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  249  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  250  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  251  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  252  	.code = MEDIA_BUS_FMT_UYVY8_1X16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  253  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  254  		.fourcc			= V4L2_PIX_FMT_UYVY,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  255  		.name			= "UYVY 16bit",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  256  		.bits_per_sample	= 16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  257  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  258  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  259  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  260  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  261  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  262  	.code = MEDIA_BUS_FMT_VYUY8_1X16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  263  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  264  		.fourcc			= V4L2_PIX_FMT_VYUY,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  265  		.name			= "VYUY 16bit",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  266  		.bits_per_sample	= 16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  267  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  268  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  269  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  270  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  271  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  272  	.code = MEDIA_BUS_FMT_YUYV8_1X16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  273  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  274  		.fourcc			= V4L2_PIX_FMT_YUYV,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  275  		.name			= "YUYV 16bit",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  276  		.bits_per_sample	= 16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  277  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  278  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  279  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  280  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  281  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  282  	.code = MEDIA_BUS_FMT_YVYU8_1X16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  283  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  284  		.fourcc			= V4L2_PIX_FMT_YVYU,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  285  		.name			= "YVYU 16bit",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  286  		.bits_per_sample	= 16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  287  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  288  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  289  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  290  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  291  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  292  	.code = MEDIA_BUS_FMT_SGRBG8_1X8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  293  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  294  		.fourcc			= V4L2_PIX_FMT_SGRBG8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  295  		.name			= "Bayer 8 GRBG",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  296  		.bits_per_sample	= 8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  297  		.packing		= SOC_MBUS_PACKING_NONE,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  298  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  299  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  300  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  301  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  302  	.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  303  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  304  		.fourcc			= V4L2_PIX_FMT_SGRBG10DPCM8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  305  		.name			= "Bayer 10 BGGR DPCM 8",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  306  		.bits_per_sample	= 8,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  307  		.packing		= SOC_MBUS_PACKING_NONE,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  308  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  309  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  310  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  311  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  312  	.code = MEDIA_BUS_FMT_SGBRG10_1X10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  313  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  314  		.fourcc			= V4L2_PIX_FMT_SGBRG10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  315  		.name			= "Bayer 10 GBRG",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  316  		.bits_per_sample	= 10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  317  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  318  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  319  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  320  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  321  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  322  	.code = MEDIA_BUS_FMT_SGRBG10_1X10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  323  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  324  		.fourcc			= V4L2_PIX_FMT_SGRBG10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  325  		.name			= "Bayer 10 GRBG",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  326  		.bits_per_sample	= 10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  327  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  328  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  329  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  330  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  331  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  332  	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  333  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  334  		.fourcc			= V4L2_PIX_FMT_SRGGB10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  335  		.name			= "Bayer 10 RGGB",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  336  		.bits_per_sample	= 10,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  337  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  338  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  339  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  340  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  341  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  342  	.code = MEDIA_BUS_FMT_SBGGR12_1X12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  343  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  344  		.fourcc			= V4L2_PIX_FMT_SBGGR12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  345  		.name			= "Bayer 12 BGGR",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  346  		.bits_per_sample	= 12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  347  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  348  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  349  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  350  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  351  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  352  	.code = MEDIA_BUS_FMT_SGBRG12_1X12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  353  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  354  		.fourcc			= V4L2_PIX_FMT_SGBRG12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  355  		.name			= "Bayer 12 GBRG",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  356  		.bits_per_sample	= 12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  357  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  358  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  359  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  360  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  361  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  362  	.code = MEDIA_BUS_FMT_SGRBG12_1X12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  363  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  364  		.fourcc			= V4L2_PIX_FMT_SGRBG12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  365  		.name			= "Bayer 12 GRBG",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  366  		.bits_per_sample	= 12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  367  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  368  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  369  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  370  	},
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  371  }, {
27ffaeb0ab16085 drivers/media/platform/soc_camera/soc_mediabus.c Boris Brezillon       2014-11-10  372  	.code = MEDIA_BUS_FMT_SRGGB12_1X12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  373  	.fmt = {
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  374  		.fourcc			= V4L2_PIX_FMT_SRGGB12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  375  		.name			= "Bayer 12 RGGB",
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  376  		.bits_per_sample	= 12,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  377  		.packing		= SOC_MBUS_PACKING_EXTEND16,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  378  		.order			= SOC_MBUS_ORDER_LE,
ad3b81faa1db60b drivers/media/video/soc_mediabus.c               Laurent Pinchart      2012-03-21  379  		.layout			= SOC_MBUS_LAYOUT_PACKED,
e23b961dd1206ac drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-17  380  	},
93f116d595e9aa7 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2011-05-13  381  },
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  382  };
9a74251d8bee7a2 drivers/media/video/soc_mediabus.c               Guennadi Liakhovetski 2009-12-11  383  

:::::: The code at line 19 was first introduced by commit
:::::: 9a74251d8bee7a25fee89a0be3ccea73e01c1a05 V4L/DVB (13658): v4l: add a media-bus API for configuring v4l2 subdev pixel and frame formats

:::::: TO: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--sdtB3X0nJg68CQEu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
6hvkuS81OfNlLgWaOhDX+NgWOeHWM6XUXDDL+fa2hHBeMJOX+8ZDysA215KHLZhbLVztuoFb
znJ5m6kPV/IWu3FfmRo2Xi5luJirARDf1o7Glt0HvJnC7OMFmrkdzr/BzWSnT3Hmy3S+hvax
kpHmai8Mawkq7DM11Jyj7Wy3k8L3VjPdVTRbL5jpkrWaYOdapM2ChWerXqK+lXuJp6poOVMJ
mt+p0izRQsDMJfYk8+1JnyvuX1++vKlPxteK2hTktze1jXx8/Xj392+Pb0pIfn57+sfdb1bQ
Phta/afZLcKtJQr24NrRtoaHQ9vFnwxINb4UuFYbezfoGi32Wt1J9XV7FtBYGCYyMG7auUJ9
gOesd//PnZqP1e7m7fUZdHpnipfULVGcHybC2E+IQhp0jTXR4sqLMFxufA4cs6egn+RfqWu1
R1866nEatO3y6BSawCOJvs9UiwRrDqSttzp66ORvaCjfVrUc2nnBtbPv9gjdpFyPWDj1Gy7C
wK30BbIiNAT1qSr7JZVeu6Xf9+Mz8ZzsGspUrZuqir+l4SO3b5vP1xy44ZqLVoTqObQXN1Kt
GySc6tZO/vNduI5o0qa+9Go9drHm7u9/pcfLKkSGSEesdQriO09jDOgz/SmgKo91S4ZPpnZz
IX0aoMuxJEkXbeN2O9XlV0yXD1akUYe3RTsejh14AzCLVg66dbuXKQEZOPqlCMlYGrNTZrB2
epCSN/0FNe8A6NKjap76hQZ9G2JAnwXhEIeZ1mj+4alEtydan+ZxB7yrL0nbmhdIzge96Gz3
0rifn2f7J4zvkA4MU8s+23vo3Gjmp82QaNRIlWbx8vr2x12kdk/PHx6//Hx6eX16/HLXTOPl
51ivGklzmc2Z6pb+gr7jKuuV59NVC0CPNsAuVvscOkVmh6QJAhppj65Y1DYXZ2AfvZ8ch+SC
zNHROVz5Pod1zh1cj1+WGROxN847QiZ/feLZ0vZTAyrk5zt/IVESePn8n/+f0m1isPvLLdHL
YHxAMrxwtCK8e/ny6T+9bPVzlWU4VnTyN60z8KBwQadXi9qOg0Gm8WAzY9jT3v2mNvVaWnCE
lGDbPrwj7V7sjj7tIoBtHayiNa8xUiVg4ndJ+5wG6dcGJMMONp4B7ZkyPGROL1YgXQyjZqek
OjqPqfG9Xq+ImChatftdke6qRX7f6Uv6YR7J1LGszzIgYyiScdnQt4jHNDP61kawNgqjk6eK
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

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--sdtB3X0nJg68CQEu--
