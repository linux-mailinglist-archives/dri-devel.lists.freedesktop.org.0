Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3F423467
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 01:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AE06E487;
	Tue,  5 Oct 2021 23:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A196E487
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 23:18:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="225773995"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; 
 d="gz'50?scan'50,208,50";a="225773995"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 16:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; 
 d="gz'50?scan'50,208,50";a="589560206"
Received: from lkp-server01.sh.intel.com (HELO 72c3bd3cf19c) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 05 Oct 2021 16:18:46 -0700
Received: from kbuild by 72c3bd3cf19c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mXtht-0006Ga-Rc; Tue, 05 Oct 2021 23:18:45 +0000
Date: Wed, 6 Oct 2021 07:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm: vkms: Refactor the plane composer to accept new
 formats
Message-ID: <202110060718.s10ZYLp1-lkp@intel.com>
References: <20211005201637.58563-7-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20211005201637.58563-7-igormtorrente@gmail.com>
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


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Igor,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.15-rc3 next-20210922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Igor-Matheus-Andrade-Torrente/Refactor-the-vkms-to-accept-new-formats/20211006-042037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 02d5e016800d082058b3d3b7c3ede136cdc6ddcb
config: x86_64-randconfig-a003-20211004 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c0039de2953d15815448b4b3c3bafb45607781e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9cd34ac9858091dc06086b2024e8f5f111657d48
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Igor-Matheus-Andrade-Torrente/Refactor-the-vkms-to-accept-new-formats/20211006-042037
        git checkout 9cd34ac9858091dc06086b2024e8f5f111657d48
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vkms/vkms_composer.c:12:
>> drivers/gpu/drm/vkms/vkms_formats.h:24:7: warning: no previous prototype for function 'packed_pixels_addr' [-Wmissing-prototypes]
   void *packed_pixels_addr(struct vkms_composer *composer, int x, int y)
         ^
   drivers/gpu/drm/vkms/vkms_formats.h:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *packed_pixels_addr(struct vkms_composer *composer, int x, int y)
   ^
   static 
>> drivers/gpu/drm/vkms/vkms_formats.h:31:5: warning: no previous prototype for function 'ARGB8888_to_ARGB16161616' [-Wmissing-prototypes]
   u64 ARGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
       ^
   drivers/gpu/drm/vkms/vkms_formats.h:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 ARGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
   ^
   static 
>> drivers/gpu/drm/vkms/vkms_formats.h:49:5: warning: no previous prototype for function 'XRGB8888_to_ARGB16161616' [-Wmissing-prototypes]
   u64 XRGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
       ^
   drivers/gpu/drm/vkms/vkms_formats.h:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 XRGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
   ^
   static 
>> drivers/gpu/drm/vkms/vkms_formats.h:63:5: warning: no previous prototype for function 'get_ARGB16161616' [-Wmissing-prototypes]
   u64 get_ARGB16161616(struct vkms_composer *composer, int x, int y)
       ^
   drivers/gpu/drm/vkms/vkms_formats.h:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 get_ARGB16161616(struct vkms_composer *composer, int x, int y)
   ^
   static 
>> drivers/gpu/drm/vkms/vkms_formats.h:85:6: warning: no previous prototype for function 'convert_to_ARGB8888' [-Wmissing-prototypes]
   void convert_to_ARGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
        ^
   drivers/gpu/drm/vkms/vkms_formats.h:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void convert_to_ARGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
   ^
   static 
>> drivers/gpu/drm/vkms/vkms_formats.h:106:6: warning: no previous prototype for function 'convert_to_XRGB8888' [-Wmissing-prototypes]
   void convert_to_XRGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
        ^
   drivers/gpu/drm/vkms/vkms_formats.h:106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void convert_to_XRGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
   ^
   static 
>> drivers/gpu/drm/vkms/vkms_formats.h:117:6: warning: no previous prototype for function 'convert_to_ARGB16161616' [-Wmissing-prototypes]
   void convert_to_ARGB16161616(u64 argb_src1, u64 argb_src2, int x, int y,
        ^
   drivers/gpu/drm/vkms/vkms_formats.h:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void convert_to_ARGB16161616(u64 argb_src1, u64 argb_src2, int x, int y,
   ^
   static 
   7 warnings generated.


vim +/packed_pixels_addr +24 drivers/gpu/drm/vkms/vkms_formats.h

     7	
     8	#define pixel_offset(composer, x, y) \
     9		((composer)->offset + ((y) * (composer)->pitch) + ((x) * (composer)->cpp))
    10	
    11	/*
    12	 * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
    13	 *
    14	 * @composer: Buffer metadata
    15	 * @x: The x(width) coordinate of the 2D buffer
    16	 * @y: The y(Heigth) coordinate of the 2D buffer
    17	 *
    18	 * Takes the information stored in the composer, a pair of coordinates, and
    19	 * returns the address of the first color channel.
    20	 * This function assumes the channels are packed together, i.e. a color channel
    21	 * comes immediately after another. And therefore, this function doesn't work
    22	 * for YUV with chroma subsampling (e.g. YUV420 and NV21).
    23	 */
  > 24	void *packed_pixels_addr(struct vkms_composer *composer, int x, int y)
    25	{
    26		int offset = pixel_offset(composer, x, y);
    27	
    28		return (u8 *)composer->map[0].vaddr + offset;
    29	}
    30	
  > 31	u64 ARGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
    32	{
    33		u8 *pixel_addr = packed_pixels_addr(composer, x, y);
    34	
    35		/*
    36		 * Organizes the channels in their respective positions and converts
    37		 * the 8 bits channel to 16.
    38		 * The 257 is the "conversion ratio". This number is obtained by the
    39		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
    40		 * the best color value in a color space with more possibilities.
    41		 * And a similar idea applies to others RGB color conversions.
    42		 */
    43		return ((u64)pixel_addr[3] * 257) << 48 |
    44		       ((u64)pixel_addr[2] * 257) << 32 |
    45		       ((u64)pixel_addr[1] * 257) << 16 |
    46		       ((u64)pixel_addr[0] * 257);
    47	}
    48	
  > 49	u64 XRGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, int y)
    50	{
    51		u8 *pixel_addr = packed_pixels_addr(composer, x, y);
    52	
    53		/*
    54		 * The same as the ARGB8888 but with the alpha channel as the
    55		 * maximum value as possible.
    56		 */
    57		return 0xffffllu << 48 |
    58		       ((u64)pixel_addr[2] * 257) << 32 |
    59		       ((u64)pixel_addr[1] * 257) << 16 |
    60		       ((u64)pixel_addr[0] * 257);
    61	}
    62	
  > 63	u64 get_ARGB16161616(struct vkms_composer *composer, int x, int y)
    64	{
    65		__le64 *pixel_addr = packed_pixels_addr(composer, x, y);
    66	
    67		/*
    68		 * Because the format byte order is in little-endian and this code
    69		 * needs to run on big-endian machines too, we need modify
    70		 * the byte order from little-endian to the CPU native byte order.
    71		 */
    72		return le64_to_cpu(*pixel_addr);
    73	}
    74	
    75	/*
    76	 * The following functions are used as blend operations. But unlike the
    77	 * `alpha_blend`, these functions take an ARGB16161616 pixel from the
    78	 * source, convert it to a specific format, and store it in the destination.
    79	 *
    80	 * They are used in the `compose_active_planes` and `write_wb_buffer` to
    81	 * copy and convert one pixel from/to the output buffer to/from
    82	 * another buffer (e.g. writeback buffer, primary plane buffer).
    83	 */
    84	
  > 85	void convert_to_ARGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
    86				 struct vkms_composer *dst_composer)
    87	{
    88		u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
    89	
    90		/*
    91		 * This sequence below is important because the format's byte order is
    92		 * in little-endian. In the case of the ARGB8888 the memory is
    93		 * organized this way:
    94		 *
    95		 * | Addr     | = blue channel
    96		 * | Addr + 1 | = green channel
    97		 * | Addr + 2 | = Red channel
    98		 * | Addr + 3 | = Alpha channel
    99		 */
   100		pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
   101		pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
   102		pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
   103		pixel_addr[3] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 48)) >> 48, 257);
   104	}
   105	
 > 106	void convert_to_XRGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
   107				 struct vkms_composer *dst_composer)
   108	{
   109		u8 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
   110	
   111		pixel_addr[0] = DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
   112		pixel_addr[1] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16, 257);
   113		pixel_addr[2] = DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32, 257);
   114		pixel_addr[3] = 0xff;
   115	}
   116	
 > 117	void convert_to_ARGB16161616(u64 argb_src1, u64 argb_src2, int x, int y,
   118				     struct vkms_composer *dst_composer)
   119	{
   120		__le64 *pixel_addr = packed_pixels_addr(dst_composer, x, y);
   121	
   122		*pixel_addr = cpu_to_le64(argb_src1);
   123	}
   124	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--VbJkn9YxBvnuCH5J
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICOrRXGEAAy5jb25maWcAnDzLltu2kvt8hY6zyV3EVj+vM3N6AZGgiIgkGIBUPzY8crfs
9KS75VGrE/vvpwrgAwCLSu54YVtVhXe9UeCPP/w4Y2+H3fPm8Hi/eXr6PvuyfdnuN4ftw+zz
49P2v2exnBWymvFYVO+BOHt8efv24dvHy+byfHbx/uTi/fzn/f3ZbLXdv2yfZtHu5fPjlzfo
4HH38sOPP0SySMSyiaJmzZUWsmgqflNdvbt/2rx8mf253b8C3ezk/P38/Xz205fHw399+AB/
Pz/u97v9h6enP5+br/vd/2zvD7P7+fzsl4ft6S8XZw8nFx9PLs7PP346/3R2f/Zp8/nT+cXl
/N///niynf/rXTfqchj2au5MRegmylixvPreA/FnT3tyPoc/HY5pbJBl63ygBxhNnMXjEQFm
OoiH9plD53cA04tY0WSiWDnTG4CNrlglIg+XwnSYzpulrOQkopF1VdbVgK+kzHSj67KUqmoU
zxTZVhQwLB+hCtmUSiYi401SNKyqnNZC/dZcS+UsYFGLLK5EzpuKLaCJhiGdmaSKM9ikIpHw
F5BobArc8+Nsabjxafa6Pbx9HfhJFKJqeLFumILNFLmors5Ogbybo8xLnFnFdTV7fJ297A7Y
w0BwzZWSykV1ByMjlnUn8+4dBW5Y7W6zWVqjWVY59Clb82bFVcGzZnknyoHcxSwAc0qjsruc
0Zibu6kWcgpxTiPudOWwpD/bfqfcqZJb6Uz4GP7m7nhreRx9fgyNCyHOMuYJq7PKMItzNh04
lboqWM6v3v30snvZgtro+9W3ei3KiByzlFrcNPlvNa85zVusitJmGh8pqXWT81yqWxQcFqUk
Xa15JhbEulgNujg4UqZgTIOAuQOvZo6u8qFGrEBCZ69vn16/vx62z4NYLXnBlYiMAIN0Lxyx
d1E6ldc0hicJjyqBE0qSJreCHNCVvIhFYbQE3Ukulgp0HAigs0YVAwrU1TVoKg090E2j1JU1
hMQyZ6LwYVrkFFGTCq5wI28n5sUqBUcP2wjaoJKKpsLpqbWZf5PLmPsjJVJFPG41nnBNkC6Z
0rzdlZ4J3J5jvqiXifaZZfvyMNt9Dg50MGsyWmlZw5iWLWPpjGh4xiUxgvKdarxmmYhZxZuM
6aqJbqOMYA2j39cj/uvQpj++5kWljyKbhZIsjmCg42Q5nBiLf61Julzqpi5xyoGgWPGNytpM
V2ljbQJr9U9ozGJXNdohtDKdYFWPz+DTULIFRnvVyIKD8DgTBjOa3qG9yg279+cOwBJWImNB
ayHbTsQZJxSERSa1ewrwD3peTaVYtPIYL8RYHnUnY/ojxknFMkV+b7fJNGn5cbQPvbksk+BE
OICaX13OM4x5zYqq19UDidll+EltMVIN7NdPv21MLAAxdVEqse5HkokzP1DBCmW4iYGEOwKP
DUtwmYBRSWBT57G7Hf6Eez5TnOdlBftbePvdwdcyq4uKqVvaEFkqYlld+0hCc7djHaWgfCKp
PK4xWwrc/qHavP4xO8DJzTYw7dfD5vA629zf795eDo8vX4Z9XgtwGFE8WGSG8NiJQKJY+mrQ
SA/V2nCEnSZbL0NtuNAx2qWIgwGF1rRvh8KKTrKmd00LUoH+g/X3AgOLE1pmnY0y+6eieqYJ
qYejaAA3rBB+NPwGhNtheO1RmDYBCNdkmrYajkCNQHXMKTjKOTEn2LIsGzSRgyk4nIbmy2iR
CVfZIi5hBcQVV5fnY2CTcZZcnVwOe29xuppUKGY0GS1wi91zDybemHAhX5AH6R9Ez3Qr+x+H
DVe9tMjIBafQudVmvfOPXj6ollQk1dXp3IUjL+TsxsGfnA5iKIoKAjaW8KCPkzNXjA2VKGJ+
Q+lYFIi60G3cZAUYrWDHePr+9+3D29N2P/u83Rze9ttXA253g8B6WrYN/yCeq3PWLBjEwZEn
kIMuXqADAaPXRc7KpsoWTZLVOh1FhrCck9OPQQ/9OCF2alwf3qtnXuA+OEo3WipZl9rlFnCt
oyXtehtiu4vHCEoR09qjxat4Ithp8QlI8B1Xx0jSeslhD2mSEgzPhP5qm8d8LaKJ+MJSQCeT
KrJbJlfJMTxarSPoXGjaOennCP4q5Z5A0AXeLmhxx9IiCzq/jYEovGNFYwwgWquLOEB1Y/HK
6xdOPlqVErgQHRdw4vnYPmJ8b1ZADgUORqJhbWBkIQrgVOAJPgBzYohFtsLzMu61cljX/GY5
9Ga9bCdGVfEoEAfQdBAOyDAAHzBuxsAQyuD3eTDORDy9kBJ9Cl+NgtDLEk5L3HF0HA1PSZWD
2Ho7G5Jp+A+VfokbqcqUFaBylGOG0KurHG/WakURn1yGNGBbI16a6MvYi9D9j3S5glmC8cZp
DtjeJA/8ht0Tc8xBDwlkRo9zQJox3O38zyOsQ1C0+AQWHruRlQ1Eeu/asxhuBso5D54lxsFz
yKeWvGAQb/pRQlJDKBD8BOFyui+lS6/FsmBZEvuCq1yAidZcgE5BQbt7xwSd/BGyqWGplAph
8VrA5NutdPYGul4wpYTrrK+Q5DbXY0jjBaoDdAHeHSwdmdl6IiGF2ToUc8x1hErKWKqEkiBj
CtFGDtOENRRRcGKrKHeyGEpzJ1FilGoAg854HLtW0fI6TKXpA+5BV0Yncy+dZvyFNn9fbvef
d/vnzcv9dsb/3L6AB8zAk4jQB4aAbnBsJzq30zNI2IpmnZtsCemo/cMRh77XuR3QxjUgEsQO
66xe2Em4AW5eMvBfTPg+CGPGqOQaduCTSZqMLeAU1ZJ3rknYt3EC0GFuFEi1zGmN4BFilgvc
e4pzdFonCTiAJYMRiQyUWTc6oyVTlWBe/Gvz9LQgGR1p7KEXvvtp94748nzhhuk35hLI++0a
N12pOjKKOOYRBNHObO1VRGMMRXX1bvv0+fL8528fL3++PHdT7iuwsp3n6Cy1YtHKxgIjXJ47
0mqkLUdnVRVgPIXNGV2dfjxGwG7wJoEk6Pio62iiH48MuoMIqKXrslMedzrAXqM05kQ8pd9n
tlgmFgpTcbHvZfS6BbkAO7ohcMAH0G1TLoEnwhQyuJzWJ7TRO8RYjjeOIWCHMuoGulKYCkxr
96LKozO8SpLZ+YgFV4VNlIKh02Lhmj5DUqhmWQp5dTI/PfcQutaYRp5qZ+IVs2Ms6zxthwQT
4oYw5OVGu4rXD1xqkxB3TiQB08yZym4jzPRyx7CWSxutZaCuwDhdBAGSZgW3XIynwCMryEYL
l/vd/fb1dbefHb5/tWkIJ6rrBMCdJE484ayqFbeOtSv5iLw5ZaWfRHSQeWmyzm6bpcziRGj6
TkLxChwAUVC+G/bHbyo4FuSBkbeB6LWduje/o+MhAUpCBgJHR2wDRVZqOjhAEpYPcyKCp97j
0EmTL4Q7xw42DmeCsEHmwFUJOPS9+FLh/C1IB/gu4AIva+5mU+AgGObOxpDQnvVwXYrCJOn9
XU7XqCWyBTBYs+7Ya9gNXhDzWoFxDSZkrwfKGpPMwLdZ1bp+g11Zp0RP/ewmc3w9RZfHaOG/
MpGlEt2GbiaDixipwkLJA8hXH2l4ORGh5uhw0aEUWCTfWIcK2HUIO+5TBWaJIwaMMEoDIU12
4iEvXVylI79D8P5uonQZmFa801j7EDBCIq9zo2wTlovs1knEIYFhHAiKcu0Y3zaBikEYz4A9
vDANegKNZyVqKjdhKECgjuLT26UsjlJE4MqxeiJJ0tLcpUzeCIph05JbFnNWZmAc4jM0j6py
tjXOPZkGswyaiEoXGMul0WUD27XgS/QXaCTeQV6cjJCdNzgcRItxIFZf6Nx1agwoDzjBlB00
qL8DlpMEUHElMWjB8Hqh5IoXNmLHe9NQ6ebR+AbAdcSfdy+Ph93eZv17r3CCwtfwNiRrj8G7
xLUzLzP8i7umQXxcBYzt8qvhfVRDPujCWFcfFgsFDN0sF+h66LALZmtndCUiB4eJRk/VgKVA
2ISFAyeBRaUYNTP5Slg0eR0Xcx1KvnUujPUF36HNa4a+R48eYgwPb+S3KyXAiypnP0SW8SVw
T2uL8Aq35lfzbw/bzcPc+eMzhsmPge8qNcakqjaZFCoJUinPquBvdGxEJe5Iw4edg1scrACU
vQZ3qakLox7jAG0jp5B5NXjak4a+zgWN5Img1MhdczKfuyMA5PRiTnYBqLP5JAr6mZMjgPs6
9+U8VXgb7AT8/IZH7iQMAL31qRISptMmrkkdVqa3WqDeAG4Hd2L+7aQ96N6HM9Gjz292pzE7
h6kNX3KMU29auUmobhSIR5YFjHLqDRLfgjMK1rLlTYhUpFt7NgxnCaYxw0Ali03FxPxbP0oq
qzKrl75NRqWHLkbuoudhBoXGtbHbOtZOjhTlKLoNVZvnNIckN7LI6FvbkBLvfukzzmN0tHE5
tCUGeRcJbG1cHUkpmsgug5CyxNsbN8Q/FmqM4kbY+ibQqTboTUs8Jwx9bRCEJxbqMvTobCbN
aknjKxl1bu3O7q/tfgZWZfNl+7x9OZipoI6d7b5iFam9z+rkxwZ+FNt7eqLMJ68fABVljvBd
/wY68ho0JE8SEQk+lB04GTbw/ZYjFesHiDhlBzf61R29kTwNtl2u6jDazMUyrdqKLmxSxlHQ
CRx1BQbBzhjtGddOGsRxmMs2YlmS6tj2VUaq6RSB3zQpY6qywK6j9Io1EKT4upFrrpSIuRuU
+52CSiNqmFwKFi53wSowXrchtK4q17MwwDWMLQNYworxrkDQMTW+8aQVB47QOuhqcJsjs+2T
aOGl8H3kaDKizCmzZHC+dvPbDcOx5VIBY1VkOauhrVLwtlgWzCmqNQQ6TaxBf6ChcW6fBrE3
zU0uoy6XisXhwkIcwX+k7rJriASmVyf5DP5fMVCBKhi02xchWyfY71Yv6DSAbTtx8etuSc6r
VB4hUzyusYgP07XXTPEmVPYu8ci9NLOAIHNKWVs5KLmjPXx4U/jBTI+YnnFcVvRNbrfP8P+w
sLDXlgKv7oDFaEfQ+HV5H4l1tUSzZL/937fty/332ev95skrH+qELAw8jeChbBHD9PiuEGAp
15N3jSQtKkwNGzkZb46a4F2Ouaf+501kEXOYz3RoPGoBuLZe9D+ZmnEj60pQJr9vMN4ikqLb
mAl8vwvkFv/zRf9ni51cZM9gn0MGmz3sH/+0d1REdrA0SnsybCgjk9nBsadziK2FOEoE7gmP
wUTb/IYShZwSmnOb/wKfopOb1983++2D4/aQ/WZi4fpxtLD12yQenra+6Pn2qYOYHc/Az/Pv
tT10zgsqvvVoKtcGexgqhdjBujzjVGleu4zed/1bl9GWib69doDZT2BtZtvD/ft/OXeYYIBs
ysBzHQGa5/YHrRKBICoWp3NY2G+1UCuSSmgGfgqtVBEXgycM9otc8cTE7aIeXzb77zP+/Pa0
CfhEsLNTL/HiXwScnVKHZyOeM+cdigWNgiLMK9WY/sCAD1ihcrlwPCsz2eRx//wXMPUs7mXT
wJnKZ9pU6OGLscN+92SOMB9OVODt7+fN/RYDlcPufvfkZqL+X+17Zz52yxMgsrE1v/1mJULl
xq7byIbYtDgXbjoKftrajgCEb7ZyFqUYxkGchykI8EhtZt65R7puomQZduBCu1jQSRcC2L+m
RgA+bCgzntBVZUsplxnvVzdSqtX2y34z+9ydmNWm7qZPEHTo0Vl77svKfT6H2f8a+OhuxKhA
RnlS4Iquby5OHCbFe7SUnTSFCGGnF5chtCpZbbIa3puyzf7+98fD9h5j3p8ftl9hHcg5I/Vr
sy1BiYZJ0Piwzi/1ErvdtQEag1tvpfY+kTyqX+sc9DxbcMq+2weA5ooHM4BJ5d3a2JL6PpKt
CyOuWNUWYcAwzr+ZB2yVKJqFvmbhQzUBC8TgnrguXoX3oRaKN4QUQpY0vO0G0wcJVbCV1IUt
IjAv9sCY/8qj8G0QkFmfuIXY4gChfksyttTjKoHhxZShTCESD5ConDH8EMta1sQtvIbzMYbN
PuQJdtXctMOImJ5pS/vGBJpXo+SXh2yT2fnoUOzM7ZtJW2TRXKei4n51dn8RrvtknHnGYluQ
dIW0ZRvheDrHzEf7/DE8QIgMQDqL2N5ot2yGli2k80qW/LPFV5yTDdPrZgFrtVWbAS4XN8Da
A1qb6QREpnAU+LJWBSwRTsWrDgtLpXxWsjOAQA9dNVPTai/sTQuqE2L8rhpKtVuEeVvqSAep
P451C89asjyvmyXDQL8NybGmiERj+TxF0rKeFSVbs97eQ4aTafVJy3mYFQwo2nb29moCF8t6
omyj9TZEGTX2RVz3GpeglVns0FO7pnmEBEdQbU2MZ0wtZjJCN63xKDPgu6DrUV3H0KuHmaoO
7NOJWSXDV+oTBKALhKcPycYICh8aDV1gGSidr/ZGObol1wJJWiY3hRChJKBKpR+hkWh0zExv
Ad3fPjGytutv3xnlEqWzDusmLTgPwZ3BKPBaDm0rFhYR7D9JRwxlpQ7wWCkZJoMNixskTAY9
G0UOpWVijEV1O1pH3N0j8gi0niMggKoxCY32HyuGUaMQ28dvRIWW2TyaJQ4Ch0YckMjrIiTp
rZkZobvXoZbg1eCFvgzOgTSzfquhrI/o16nJm+rEJSG6atGGHK/Iwmlarm/fyY79E9hgYV/w
9NWLA0UbKvq2D3WbFsv2wuNsFI61eBZ4Q308txC2PoLab2S2/rSc+toOelTMhxu6lV00Sikn
L/c8golLbOPuVOBUVd1zfnXtlC4eQYXNLVOTzSnUsCJ8tAmRc3sx6vs4aPfdsuOQf9pqbvDv
I3VbjmoqB199GjP6xIb1GtpHnK3zRumGqdcSvp1oS7JBAZm6YVo+MZIZBf49AV6nFlLETXYS
96++bCwVyfXPnzav24fZH7ae++t+9/nxqasc6fxmIGvP8FhZvCHrPivSveLtSpKPjORtHH71
BeMwUZAlzX8T9fVMDEyDrx9cQTdV/xpL2oePu7Sa1JWjltnMM+oGXwNPXd8iVV0co+h87mM9
aBX1XyaZMOIdpaDuQ1skHr5CDzx0EkI8Pkw6NkpPOPHJj5AsfG0UEiLXXuNjM412vn881ojc
8De9IhNVYsFJevXuw+unx5cPz7sHYJhPW+czH6AbcjgAMIIxqKrbfKIvYynNo9z+zrbvYpHR
t4klAzPgmFSmi5PhV11YkTcVnIYFRnZzuFauJMZuKnc+uWE40za2ptcNaNS1Bn00gTTqbALX
ZwTMt0tiqrx0GhM2Vtd00xG8F37MkOEdcsbKEk+axbHhj+7yYaT1u4czzYIn+E/3Wp+ktdUW
1wo6Hy6q+Lft/dth8+lpaz52NTPVbQcn9bMQRZJXqCBHFpZCtYrUZRAzQYz4hies4A21b4yp
R3a2Wx0p4VqTFoxPLt2Z4FVkW1LdqrmpJZn15tvn3f67myYdJbuO1pQNBWk5K2pGYShi8OkV
dz2RAbVuq0fCmpERRZg6wGfkS7d+op2x+zDf5QI7QEfVpuo8NedhqLxbmYFLVVZGhExF5zk1
QkuG9eaVL9ftCAtUaO78WoBlLMqdC2AmllAc1YMX0xDfzXEn1ochBF1kcl1N4CBg6ZURw6YK
3/7YCm+JbqufZnASLEOqU1NJ3U4ezPnbj7nE6up8/sulq6HHYdSUA2FzWFUKPqxNZA4yCHG6
LTCkLkDcD23Bj9HrsQ6UeEYewSY5T3dp3s/oq5NfPAZzYjXS4t2VQbFXB9d5dzQDbQubujHv
E8/4RKVL5A7Lgt3nSvl5nOADQBaEWU7MozrhStw9RBvH8cMrJFPubo2cF/UNTqV5w0TEvYi8
AyfEZGG9yKKDjiHu/VWag34SmC52+NVksRPvrqGtSZv+Vgjol9En5KhVmPja1YYrHK1LfxnN
G28Omxm7x4q7We4XV3cHwvKwYL5V6VNtO/y0Vu/mU7ib6GbZAGE+Kgg+lfbL+/6WQK8W9rlP
lxQ2iym2h792+z/wOn5kWkCRrbh/1WogIBCMUrjgJTnhGv4Cs+h+hDGxQCkXARl2+H+cfcly
6ziy6K847qp7Ua9FUqSoF1ELiqQkHHMyQUm0NwrXsV+V454pjl19q//+IgEOSCBBVbxFnbIy
E0nMyARy0L/TFdQy7ffIP0n8Ak0Vx/SR0KQ41AZo8P82QbMKNT+9Ak6aYO9dpiSShJ92V/Ct
SumtQdKonXuJyWTg7mjvNTka1RbS9AyBcAn3OXqnGkDUtw02opEpdu/KxF4MAbtIKZ2hWcka
5Vg/xP2an8obcPYG+xUhO4J/A3VzKoiaqkHMxO9rdkxtoDQPNr4A8DZpSY+QHO6WmdFHrDmA
WJeXp95EXLtTVeWF2YWyBF31Uvlt2EHAJhztdfYIIkN9zxyPiOqr546yLwTcKXPVdV+fnBwF
bm6ka1jRLJMANMtGiL3cRow1lZhqjeNaXmLttkiwubnMm0LagNxzmOYXwXiiSU87/Q5mlF1G
/K//9fnP394+/5dersxCjgIONecIj+45GqY0XPbsyckhSFTcDFjU4oww+iqyejqyuzpy93Xk
7OxoobehViVrIty2K9PvkBWPaUx0OjElrX7gZHw2iSJ5HPS7cFUh2D2aYogwyw2s2F1BgzfB
anmRwBsMG1ZyoZz4dkvyQ3QtLqrWtPXPRHYsE9o/Uc2NpvgbjFidlPQH51U7PirOsmgjhty1
xiHQIbyBlUlLXW3Aomq6Bl6FOGf7R7QByrJCb5BXz+I0Khsc1Snv7Oe2CUiuRCUjff/5CrKF
UGk/Xn9aUaYJVuKzcHtA13+gGYQbonqDO+V117JMf+CxCMShQWFHsanQ421WEJmlqqTQjKAQ
HEzoEk5iae2N1Q+ElsNLNlWn2neNgz1rUweGCMWJ8KKd0ldMvzFHBBwHMQLcJFTSFa4S/LEK
TM+MqgPMrDTAOLPphI4zmvhhRJnwh1OOjdoFylztE8gQWGa4AAs9BjezA8PvQ057wAI6pfY7
iVDBTUx2YnI4Cqjw1wY5NM75bdklDm5G93fW9guwevdJHFgY9nCq9QtP9Z1PRsePMKsvO0Jy
BqhQsSgnc0Dt2Q5zEACC7yDlI65KKHXwBTul/hENdCYUQXqUZ4yzt/eXjCAx6j1xt7vKQk27
TG/NVRM196rcJXt5Mfh+9/n719/evr2+3H39DsEBNR1N53CFA8As+vH88/fXD1eJLmkPeWds
ezpBZQwxUbiCSFoOUdwm3ru/NZAQGwBBRe4GBJ04N0vOzV75+vzx+Y+FfoSI4HC91T02ubP9
imzaO2/1gCJXKuMNnoTt+2hbvXSwajoKN3Q1ab2W9L/6YWRAdwyG78pMHQvhDLmHpDJd2gYs
7AhXRsulOsEweR3FgflNFvKGtbHarWGrfKGKi42UNKXu76YjKoizMrKn8a7vClRF7m0E/wUe
zHlbMRDKiFXc9aUzkpfFz1H9QTDjqlUBxc6lrDA8fwhW35z53cfP52/vP77//IBnX2nPfffl
+/PL3W/PX56/fYb7pvc/fwBeFwcVQ7C5qq+GwEtQCIXYrItCJEdDqdJwCkF+MaFj2ugkPO0a
S9iV7X0fA7dq5v2yYNuaFbnYoCK1K3UpHNPxDNaqJof6vLdZFLsFHoC0KpIdTQi3IOXR/hIn
1XGFqx6sKXOppy1Z9p4QGpwdKOb3NMVirUy5UKZUZWSQXjwvn3/8+PL2We6Xd3+8fvlhl632
aWfNnXyQVQdG/3dBudHEkHzfJlLtQxE7BUYJNBJDS9VKqBmL2qKtAZ/lNAsBEo8NlbKXgznW
kfYkB6kDmYQAswjJioleFSjW2Ko6wCeVE0En8QALqQqJxGBEjwQFfdZWkPCiOpAR+RW6TS6/
ak+1S8M+zIt/R39vZszjH+ERmIY9cgx75Br2iBz2iBz2iBrfyDFskTF3h1GOHJtlpI8sKcMs
dxO5fsjesJT9fTfAwCUYR3uZUapht5Rvk/dQWNDku2nSzlYlCitQoIG7LoA1qm6Y47fpqoQO
oaURxSv/GlCmCTMJvFUdrNZITNs4WuKwGkIUVLxdjWBUdW3MIO3ZiOa+M4VuDcs7SijQCM4F
jiCAW9rmjSPMh0aXVeT7rFH5K90uW3nRa492Kb2fanpwRm1prmZjz5t5y8rSdDqj4O+7NGXZ
u/v2bShyBTLfGX9DpwqMPXRG3Cze7dvU9IV1VnJuwhB19vj8+b+NB9iRMRG1QGdvMNCl6xQ/
LMHva7Y7wHVJWlFzQFEMbwnqLUfeCcPbgc2JoAMXOPpxyFXCjDej09+qwd/6cptRN5Ed8s+A
X2JPzVgyCN3zowxgpCUt5TctscPj7gBKOhxLuoPoLo6tBpBiPZMWJAK1a/0oXiPWA0yMrilD
FL5+Jwm/NCsRHXoODAAzy+WdJhJzna3j1GCHUsy2qq7x5fqAhS1rOA4odNlaH7ime3xFBs9m
nIqAJnmL88FDwRtm6PVwbum+12hKF02Wp7TqWmB9RvykYzcmXVJQ9ya9jyZzkTRUTOfmWCOF
OyrqS4O3/wFEp+IyaKojqSvleQ7dECIRfoZeq2L4Q0akZ+BonVDPOloRJf1p8uqMmtsw4MTa
tT8PA+5OipGlVG9lFTjb8brAiZHEoknAlAvdlM7Q8U/qLlSnKhJH+cwlv8wkFdXvGr40bQx0
9s6QNRoRiHR0OO26yaszv7BOjy18HmwgbIixl03gQixt7CR+Vh7p5zJlFD/Wdqy+jbDS+4zv
VLgeZVPgS2UJuR5kUDTtDVHAQDqlu0Jl3tC64cjNV7+r6inHzTjcMQWgbsFVJroBf2g7xAp+
wzsFwUWiyiPDzalSrkPEr2udl+Bmf1UqHtpuEP4+zxt44CTnSAP2ZJDqo8339InfNlrPtnuZ
xgpZ2IJxadsra2nw/cVbfI8z3QyJVuSLbOvIoqDRqBdb6mIFsC1kMeKPV5zhYfdQ4L7bgzX+
KIjrNl93H6/vH4ZMJWt23zkfwuCgaevmKiYlM5wiJ6nLYm8gdFuzmfUxKYWO7uqThK7PjjT1
E8pr3zY40NQAsxRXCy/91cWC5pws75Jy2/4e+bvtISmELiW0eVIqB1lt9y1TXXoA5bw9ofuQ
i1AmihzXJd0f4ERA0pwawxHx7fX15f3u4/vdb6+i7+HF4wXsyu+Gs8SbryJGCLw4jFfcvTIA
neNP7u+ZPsPU72uRZ6haA5hVzYne8QcCCBDvmNFbw2pr2wwborkPbUmpf5osjLLNSfPmOOgf
BgSseYTSadoRj1hwkqAPz2qP9509CLsHRp//gK1ShkoD4HpK8MU+wI8ps4a3en3+ebd/e/0C
yTa+fv3z23iN+Q9R4p93L6//fvuMnrQEnyFwx/Bh9Il9Rr7ZCUxThUFgkkug6AtKtJjxzE9x
A8v2XNgQ4ENBEz3qwwS2mEJGOrMnFWygRTWv+gZQjnrzYH9pq9BgpoATt2kD+1sjoJ0vPIEA
L25zvz2ZVOlim8aNMDPH1yjcQc4GsOCe2yGOETGHC1MykAdWybWJvk9YUaN5LRQcSDau2dso
fVy2TwsNNG3d4PbLuGZNYP8SCgUsNHEO6eejxEB8pqHA1F5VZJi9bV3TW4qkkh5mRJ8M+aO0
eWL+GPIIG9l2mPTUcIWCAnzCGzo9DCCvTedEio6n5iFgZGAqsybumKgQirE77XBzEl2UBAD4
s8DxMWcBQ9xZTQlygBEDhTk1CdcjKEnmOPKFbDt4RYuJmpshmibkcMXh7j0ggmgWyxRamLxb
hHnrwz/UBBni/zR4c9TAMoQc+QGdKG3S20T8iPOTq1C6ouBnFQ8LUj6+4KBb2ev72+/fLhCi
CQjl0z/XHk3HW64FMuVF9v03wfftC6BfnWwWqJR08fzyCoHkJXqu9Dt6xx2tFG7STpHh6B6Y
eif/9vLj+9u3DxwELq+yMboMmtAjnAyRqdM1+zELNC4v4FVH5ylFtZnq9/4/bx+f/6AHEbHm
l0F76nI6vdYyN0286QszTt30mTRp0SIV2meC2wgQ6eN8TZkjYaXgYfAfWvvL5+efL3e//Xx7
+V2XMx7hxkP/igRcayp6nUK1LK2PdomOXkUDsuZHtqOzeDZZtPG31J1L7K+2vt4j0Dq4U1Xu
/JpQmzQsY7UFEAIdV5nSIR56sDLRg6+e0MW6XlrAYJl4ZAK5BqoDnYdnIsLy5/yFUwme7Dhy
7ohNj6VDNxoppNf1NTWUdpUD+fnH24uQxrmadi/mwT6y6DgLN71dtbTh176nqgUlonihsVBU
aJk+VbjtJS4gl4mjznOguLfPg4RyV9vhyE8qMsQxLxrySBC91JUNNt0dYULpPVX0ySVmU5Ul
hSs0vNAv5GenQIUQws02mp4C8oGhjG6XsL/IJYtEtL5rk4khxIKevjZRKw8nu60E5ejcT3a5
Wa9JOVUZ38/Yr3nUgGUUAB3ruEKGYBcqXTs5HhKdn9vcGBOAwxY+lBXaGYQBonbF8vpQ8+v9
qYIAK8amLzkk0jN94CMDEVA1GdA55jQK23OyIZmOVnKh0edTAXnOdqxgHdN1/TY/IN9K9Rtr
PwNMyJ/MAl48C1SWaEsbGLYPNsM01WRJ6ccJ4YsyyIG9x8bNgNznQvBSwfjIGeNYiFOQV0tX
LY9scE2erysVyCkCj3g4XOck6ygkq62Qif9VVjivCXuoHBnJSkfEi5rSxczEACowGo5o6AJc
8bXVCBXrmJGXCnMxsRfoRmEagp/gXYLGTSKCgUr6ON5sIxvh+fqL2wit6qHmI1x37pOefXK9
ak6pY/Y8aRmo+5xWzZCJQd15nMucElYRXAm5b++f7XnF84rXLQfjx6A4r/wMbVFZ6If9VYiM
1DWi2LLKx2GxzO8+uxLCK5KPUWI3rLUrv47tSyPgqARt+l5bqCzl28Dn65WHtN8qLWoOKQIh
/DZLaf1WLOUCXY0lTca38cpPaEc/Xvjb1Qo/4UuYT+fIGTuvE0ShI8XOSLM7epvNMoms3XbV
U00p0ygIkTCQcS+KKRFyeFmZozLMH2oTMm7B5dpDcBepFDo1BoffeA+JWPsrz/a5Ho4NhEIh
6yHZJ/VNI2UVsyQXh0GpaUnjGEu40Nl9bUENQJV5xAKXSR/Fm9CCb4O0jywoy7prvD02Oe8t
XJ57q9Va3y+Nak63oLuNtzKmsYKZ16UzUKwQLs77Tvcz717/en6/Y9/eP37++VUmDR6Cp892
wl/evr3evYhl/PYD/tTFtg5uO8iT5v+DL7U34FM2gbd4mX2s0f0YVV5LPdHDBLrq0VJmaNeT
4GOm+zlrT4VIYrg85ObvOSWmiq7b5inc3D3Ol/V5esSPfjBTkyKFCKjkHeg0lfHt2AxWV7Xa
O80uqZJrQvE6weOYtvGfm6TCassAkoIJtYkO6PFGZrya0Pd2OS94ytkAsVcWIK8qTP/Egiqg
CcInbmTLUPaceZ7fecF2ffcPIQO/XsR//6TM1oUYnsNLDdGiESWOSP6oV2iR9zQK8G4Nmu8g
fmIBKUkheHwJGTh3HfWYqjyR4PjAd8BmzKNdXWXGo/C8D8MxSGKgWYeT0Kfpq9kHGTDcoXlI
/+88oS9KRcPA+oTEscaJOvcuDIiHjgQWO7H0Thmtmxw6R9y0JOXmJc7cLvEXr113/t3oOUar
7Kw27GnmHfBEN03Ar2c5pm3NxV5Gf/ecd5RX3mBtAEY0X7VKFlZgE03kdlVQSL20LRBYZRGz
V4KdcwuwLo/nwSosceTP6SC2oxsHC1K9xjpJnhLHDT4gxfYEefqceHHqbjZ+6LJ3Egd+uRPn
Y5I5dBAgOdYte3KMgfwGfQ0mmwd5clcrehpI3m6UmLY1JTjmEIga+2mKCXcWopM4VYIUJ3zM
i4D8wHD1GKThZn2DIN7Sk1hIV3lPr4LH5liT6Y60miZZ0nQ4beMAkpkX9/QGrjM45HjfzDsv
8Ch5Vi9UJGnLxEfQhScvWFq7vN3nol1eG/nQxNSmd55BZun4rUaUyZNhUTSjsHpUZrHneVdj
79AGTJQN6Ik+DGZVpq49GdK29gfyqkWvkjhFqg5fYicPjhynejnkbK7BYSrXxkZUuBZrQVvM
AsK1igrPNTw35ony3Mdrabeml8ouBVd1x0a8q3q6Palr6nTsUJu3rRozesmpvIamxqMXJH0s
UINTwylnV1E2rFoZKGAkDxOHMWmSoBc6sxPq1+54quDWU4qadKI1neR8m2R3cGxMGk3roCnY
w4llTqOYsRXHvODYEmYAXTt6mk5oemgnND3HZvSZuuTSa8ba9sTJ5ZYKLQJV2dy+iCIySiJa
8Gkv1BqHGWlGCx0awwxv+SryUEE6JOulBsOH+UOFT+eN4mKEzXdomx9kecrRdcEu92/WPX9K
j2YoqwG1P31iHUeJJodNd1+eP3nxje1GJRciOR9PySVnJIrFftj3NAq0WzTUHpleGcArk84h
r7ADnRlJwB1rkvWuIuZZM2PWzq/fmKolA6G73qMXhU/ljZlQCGGA7sIyac85zrdWnkuXTSS/
PzjijN0/Uvdm+ofEV5KqRtOxLPr11WH2KXChVBpdWH5ZRO8vtzsST557Hsdr+hgDVOgJtnSM
pXv+JIr2jtsOc/SG5TXvxUm1WQc31o4a97yk10j52CJzEvjtrRxjtc+TorrxuSrpho/Nm5gC
0Tomj4PYp5aezjMHbxPj+tR3zLRzTwZxxezauqpLekOpcN2ZkPvAVLoS8jR4S1xNUcbmEAfb
FbHTJb1LCKpy/96cAmbpxqGw6jU/i4MZnUUySHxGq9NawfoetRkS1N7YTIbQmspKAAmox0Tm
pCOb8pjDM+ueTPSiM88rDkke0NV/ffMsfijqA76/eyiSoO9pOeahcEqYgmefV1cX+oEMHqBX
5ARXmCUS4h5SuMd2BWRry5uD22bYoiJarW+smjYHLQuJBYnjjij2gq3j/gJQXU0vtTb2IsqQ
BVVCzI+ElrdacBtpSRRPSiGpIBNADmeiqd4RJXM9EZiOqAuhNov/kEDO9/SIcLA5hmG8MVc5
M1x4ebr1V4F3qxRaM+LnduV4jmLc294YaF7ylNhveJluPVEbkm/esNRzfVPw23qeQ5MC5PrW
js3rFG4He/oWhnfyUEJd0JXyhvjm8J4qvNs0zWOZJ/TpClMopy/HUvBVcVy8VYzKQ6tX4rGq
G6FSIon7kl774kBH5dHKdvnxhCNUKsiNUrgEWHEKKQYiIXJH9MbOuMqweZ7xWSF+XtsjcxgF
AfYMGWxYRyUj19he2JMRP0hBrpfQNeEmgoAUwjXm6oFTZz48ecLWCrIqyX+gSXrm3oIHmqIQ
43FzEHvWGpcfw5oDhN/QZhn7LHMY3rLGYbcrTeB3oHLQosHxsWBIg1DGBRD2xzJ/n0U8Zb4H
Ly1W0Sbl47uTbhk6GX1aWK0yLr/opqHhnFZrT3w3eG5Zt/CAEqo1PYCAvBe6oOP+D9BNfki4
w1Ie8G1XxJ7DdGDG0xsq4EEejx3yBuDFfy4RENBHTh+zgGPNkd4bL4Xufwu/5hvkUh3/FK47
YrnguOCiJLChJZ+STEvdxF5HafeFBHa8eCFQo6LuQLXi/EXnQQ3P4DfqOWuuFBLiBjj7TVfD
CHSb4IivCDeJYxRS9xjVEbrZng7vHPRPj5kubekoeTmdVxVlY90mjym9Li7kMaL5gBPrVMPu
k/u8cFxyzFRJZ7hqUUTHC2eltWPBU/QXyF0gKqrvcpeLeZU/bGKogHbAlaCe0ZePw+3V1R0K
XWynRuW0HXxyWdKeLRnPiBf8bz/+/HAaCkhfRd1AQ/wc/RoRbL+HbCAFysesMCrvzT0y3FSY
Mula1g8YWZnT++vPL5D2/G3Mdf5u1OUqH/OR7zSGg0eZHsLewPK0zYWe1f/qrfz1Ms3jr5so
xiSf6kcjYqqC52fa43vEKjsgrb9djmKqwH3+uKuRo8IIERtsSkKbMPTRBQDGxTE5iwwiSq+a
Sbr7XUZ+4aHzViElRCGKzYqo+EPnexGFyAYn/jaKQ/Kjxb2oztI3wYuWYAxg6RCe043p0iRa
e5QHtE4Sr72YYK5mNIEoyjjwAwcCu5JqzPpNEC6OSZlyumjTej6lD04UVX7pjDz1IwoiPsBd
JfX2OhHNyrKF6epLckkeKdSpcs0h9sAjn7rmm3u99K9dfUqPRjaPmeBSrFfB4jzsnXO47IS0
UZLXPdrugG4tASB2G+omWeGUTbJdRuiPRS6b4iy6S8twu1nbZdPHpKFtGxQ+h8OX+bS4qkjO
vO/7ZImJ6YBuoIUqmjSQkeXGh2Y62il62lMhE4QmpIyQa1IlRnSvGRVQi39G45srDU4JlBM6
rXdtQlTksPep+h1aXShD4GtJYk5MbDxl3ZGVk8JlQkbem2g4y/ILBO1sSRZdmVFTeP6EvJ0l
aqYQ2OvcRPqBT370krQtI/N/TyRlcpAvKgRzmQyxbncka4ncuZKAzmQQsYV0j5l75sIy8YP8
ytMxr44n6mV9Isl2W2o8kzJP8TY6f/DU7upDm+ypXW2ekDxceR7JAISNE5muZCLpGz2kBgJf
sXsxxoEEt8T3khT3YiqKM9sj2Dd9S6+uhwtz3F9PJHvOksghdsvtQIaOJEMwKzRsm0pAm2um
AcUK38Sb7RLOjICAKRwGIDoNqJzXsneYIeqUJyFqsD4lUxPohLuT7628gK61RPpbV5VBM4SU
cSyt4nAV3vhS+hinXZl465WTn6Q4eB51kmLCruON6cBhEyDDcRu/vslh7WYBqaQbfKuro49J
2fAjbbam0+W5rtsizCEpIN7LeJRTJH0aGC/2OnpQ5G5OlkNdZ8xhI6M3SRwAOX25hcgeBVD8
u44cd0M6MSuYmGJ/i67LqWh0OhGP+OMm8lzdcThVTzeH477b+56/cfS38fqBcWSQRY3iksCr
2CVe6VubTeCccUIq97x45WyfEMlD190poiu559GGRYgsL/aQj501VBhsRMkPfhTEznpZAic9
xFXek4ZWiNf9xvNdHxLag+UGTI1UBklwwn4V0f0s/27BR3ABLyQhB5ZdkzIIwv7accdAqo3Z
MQeyLt70vXsWyFvhumxqzjrH3lWmXrCJA1c3AQe1udzoKHmJnFSfcEYckyKgn5xMMuaw27Zq
JqWXv0VqLWgnZVamMBw3DxZZ0VZClposNkJ5u/n3agn+r0lx/XurQJaou/r2PguUnyCg3225
Qfbrzf1JUvlsqeFPj2BLQuqq9jhCfpd1iOR6k0gu+cV5mvBHl75qrUnW+S5JRgy+PElrJ9pf
rfoFeUBRrF11VejNjVq25VWPAoTOLlbkukSNcXxJcuSd5ztMvTFZuSdzhyKiPo7CtaMLGh6F
Kz3WhI59yrvI9x3d/2Qof6hT6mM5SJqO0uyBI8tGxBnSLDP71hXldlcwIYN7a4tSQc3+HXBd
6kdiWtTVfU77wii6nRBryWvI4RY26FeihV2n2/YrVJPy5r61vww3cJtoG8CTf+fQbCbKeLvd
/A1CdSpcm0ur6rJEWybxeqFFiTgWzPSgAJdXnDshJTpcyzSqTKiv2W2yM9u19IXROESFEFJ2
XUWnT1UkTEag6HLf7H4xrELPrwa0he27T1trxOpL3paJTf2YG89hCpyW3spiAs55RdKBQa8c
NrsnW3EO0kOFlVJ18zhTml8aCWQ/EkgwrJqQRh1OVrxIY+7u4xDfFA6IS0lMAouErJIc9Lbu
kvYRPO1r47pJEWXJxo9XQ9+5Bz5LtqsoUKvXXvZ9EVC7gQRj8UuhWAnxLE4W+IH70dZqh7xV
johOTcskcEnpQ1EhXcBVCS/EXzuHO9vwwlWnw8ZyTdo2WdqjsvYs97KbnQZ0UTjSEZ0vCTYL
jNqSmaq1BBl7rITxkrqflaj9KjAYCIh5iku4nw0O4ya951kQ34QEKwuytiCJVfF9SKtQAxLd
hsjnt+PzzxcZqYf9q76Dt04UCgM1iohSYlDIn1cWr9a+CRT/4vAlCpx2sZ9uvJUJb5JWvUxg
aMoabrEu2I6Ajpl4EHBweaMfKYZvcB/SAhNl23SxoHpI0ytyMroHbkdxJ4yQa8XDEKmqE6ag
9NwJm5cnb3XvkSX3pVDLyed3atAnL3Pq/Vs96v/x/PP5M6TfsYKmdB26SD5T2/OpYv02vjbd
o54/QYatcAJVqlQ9BWEho6tBwKQh1bVy7n/9+fb8xQ5Hpq6phLzeFnD/g+eIQMR+uCKBQhBo
WnAhyjOZnbvW09/qdCpuDZoqI8qLwnCVXM+JAFUdbbag0+/hvYO6TdKJUuUr7qh0mThqqQdq
0BF5n7Su+juMUXSSUur11F6pU1WtjNPLf11T2FaMMCvziYT8UN53eZWRRt+oAy5juhgSebM9
befHpB+UTlQ03DEZSjbNyOr7t18AJpjIqSnjihCBIIbi0HjTdBJT4JNLA2pTwuT6idO3GwO6
AEdZOofwQMHTtOodloMjhRcxvukXOm2XllGga0oYvlD/Ybv+1CUQNcIRSA+RmmQGke7jO8Oc
iwpwYvKqII2egWwb3yogYPNsD3wDu+eizxszeLeFHKuz1FxJzap9kfe3egbW6JMXhIuj2Jgx
OcYgKHhjNRpUpl1bjIYlJk8VMrPKXOE+quuBDItV1U81cpQ6gT0wPmCGT4BxkivqsigBMYmr
jtpRJQLL8EVD9ftI3xhmTkMcDHcJ1pRMiElVVuC0hAKawX9SzzQQEKoHsp9g+VxiZIwbGRLS
9S1lTKzezCGxq8Fbt21UAM72BugCmYSz+mBWC3RLIzqzQOysTxJVO16EIFZlutHpBJIxUoWA
VObIinvGS7vTJaZD/AELvEvWgUfzPDPqWVvHD9kDLEwP5r+6aghmK0zZ0w5222DGeffZLSZB
1Ehpx4U1GIgwC4ln1ivS9H5G40dKnrb+mn6kYs2YBoJc1c6aahYrl4SMjSnGXI3XuDrPbYKG
TxA4XfyPDfmSLZbJIT3mYCMAM0K7UkvFfw09d3SwpGPcvChVUJtMaHzXtNUlPx0zWlDPO4mG
FFsuq3LHLZVOWJ3ONX1FAlQVdhYCkPysky31XQ2dYnMRAJ1FD11lblBHGagp74LgqdHDyZkY
48knL1KIED9DelYUjxBUU2ae0SsxYojPS5QRJWwc1/YEiQkayvsHkezquptC3M5hxIkpLbBg
l2Xb8qIAbmkjU0EIab/NDwxdWQmoNIoTg4D9IWEe1WVDJn+UyKMohUxzBbCU1rjKSeTPLx9v
P768/iXqC1VM/3j7QSa5VsVciVBGdNGl62AVmVUEVJMm23BNR33ANH8tfED0DMW8LPq0KWgB
YrGJmJUKOyx1O0cdeKkivk5jmnz5/fvPt48/vr6jYRXS4KHe6XlER2CT7ilgos8hg/H0sUlr
hkCx8ygNe/+dqJyA//H9/YOO7Y4+yrwwCM2aCGAUEMDeBJbZJowo2JWv49i3MBCUxxw4iKZT
NvQDjdzpjMsDHcXxQ6SCla5V0DDWr3GdKvny4ptMBrBoxTam5VVJJV2sxWKg9gg5TRgPw63R
vQIY6ZdqA2wb9Rh21oPbDgBlUSMHWqZ3IAL2S3ZpaefgkVvPf94/Xr/e/QYBhlXRu398FRPl
y3/uXr/+9vry8vpy96+B6hehOH4Wi+SfJvcUdtmFHSDLOTtUMjCkGa3PQPOCPtsNsjFy5AKn
XfLYtQkjkxcazPQbCMDlZX42Ziq2UB8hV5XhVKXZqluzNvd5aew9GrKWdtuYp1jtetPQdCg7
PWYrwCZnRxWZ9S9xtHwTCpFA/Ust+OeX5x8froWesRrsj0++wTUrKqPtaeNHnjFlrZDPAGzr
Xd3tT09P1xpL8ALXJTUXWoLRrI5Vj4Mhq2xE/fGH2oyHFmjTEtd+2NfNHlciMrnbO7dJY6F0
J9L+GVAwN41hKWS2IBltlsJAHF4IsG7PU4gs64wyMpPAGXCDxNIytQabIThZoI12CnnABGTI
cogk5YuGoC4tzqmjZMlAWAmspF+zatBQZt04BjyXGirjLIh0V5SjrimKH0j0UU8GXE/AMuWe
keAvbxBRV0v0JBiAFDSzbHB+Q/HT9npUR2rDR36UTAQFhTIF0UDupdpAqu0Tjbw3Nj884IZ1
RvakRmbuvVMtf4fY9c8f33/aYkHXiDZ8//zfZAu65uqFcXyVIjVVfUQw3ENLq0u1Gck8fXeD
AzJ4iVV5d6nbe+mTDn3Cu6SE7JKQ2O/99fVOLHyxX728QWx9sYnJmr3/H+RdbFV4qgyr4LZH
G0hWlbpjGRCIv7THjSGFwYzQlERYVANLut8VDsSURbx8TaUeZUaCUuysAV/FWNw3sTaG9164
Ql7uI4Y69Cwioc+27eOZ5fSl80hWPFa9jCa+3AmFUHOK5N6RK2Ssl1D2XAYUU7WSqqqrm6zS
PEsgXRZtSzb1fV6d8/bWJ/Pi/gi327e+mZcl6/ju1NIO0CPZIS9ZxW5yY2l+k+ZTwpu/0a9A
sGe5qeCYVPmF3a49P1Ut4/ntIe/Ywa6aSsEjdpv35/e7H2/fPn/8/ELFCHCRTCtT7GQor+UA
EKIW7xpwRFfZX0PP1ymuQ54FoxBrH7A3tlrdWJqT5fkj15OnS1iKFOQJdD17BnTO2KF059ev
33/+5+7r848fQnqWezMhlqtql1lD97ay+bkYycIxGp7IqCdYrU6EPCnRTM8RLSHlLo64bqym
oHn1hMy7VW+x2iQ893EYGjBQ5PaDQjYq3e6+UceS2Nh/GbDwBGz0ns59v/HiGG2DqmVdvHF3
GSctI0dU4Hlmuy6sgojiJpR7UbqO9ZYt1nzStyT09a8f4ky0WzT4/1pNGuAwnd0tkz6o5C3t
jPat4VVQnEZHmQvAlUtg0g9QF70urQ1QMHkyuXQNS/3YW5lXG0bnqMW0z/5Gp/nmh7EaI0Gf
kurp2nWFAVZamgEsmmC7Dqxqgz1nHFnjIxFbj76xUBQPZR9TnsoKq2zOzM8pYzNz5pVxEBLA
7RZlwCC6bUrzZ3WntSfBrYy7MbsuJh9V1YwSBxzOhzdMBKEWQGQZ7K9tEeWKyidNS6SpW5YG
vtejlWe3SYUo4DuqrUMpAivR57efH38KEXRh50kOhzY/JJ1uP6UaL4ThU2PujHPW5+HT5CfG
MjLzlayJ98v/vA3Kavn8/mGM1cUb09ODK3tNDchMknF/vdVmDcbo93I6xruUFAIfnzOcH1Ci
C6L6erP4l+d/v5otGtRmIaFS768TAUcPPRMY2rIKXYjYiYDgK9ku0R8PEIWHXENwYWpRIwrd
SFtHxKvQyTVwBMJCNPQKxTTBrdoFjl5RCgaB2MQrF8JzNDRfrV0Yb0PMmGFmaJInPPNCynLy
jU5h+alpCvQSr8PduYd1ouOl1F9XmixReFtxTLJUKFtdB+lq5qbJrdksIrPyjbD5YVUoHgd4
UhCn1yqirrMH9tf04q88NFVGDHR6RM8UnSSmZAJEoA0cgvs2nO841QwBJuuhAqO68SPb3YO/
6clDZaQAZ74NOg4NDFFZifF1kW7EjFbepRF9YMS3feiKQ64azHgDH12kkZ4GK1fAckXjjoQx
UhRNvNEF8BFu2rbMX5VdvvjVoguikJp0M0G69iK/sD8LfboON0SFRhcMulLS6WLhi2IGrL2w
t9lKhH526Qg/JCoCiI3+hqUhQtc3wtjxjXAbOxARThc7rYVyF6xpFWQadSlJbpfX7iE5HXIY
CX/reB6dKOsi2zNOaTbThO7CVRDY7Wi77Tqkuirbbre6Y5OxN8qfQrRBV/AKOFxuH3H4PmV6
+PwhhB1KG57y6u1YdzqcWtoJ26KiF9dElm3WHiVJIgLtBJzhpbfyPRcidCEiF2LrQGBbIB3l
begppNFsfTLG70zRbXpsvz4j1t6K/jKgqJ0BUUS+g+vG9bkN1WfHjqzewwn8upuTFEJDHCZ2
IuIB+S2ebiJy4Hp23ScVmMUJYbmg2n4fQw6QpaZDMCBepmTHyTicyyPGm9xhJjwQdH1DzodU
/JOw9po2LfXEapI1/GR3QMYjn+gwyExJ9VeWF4XYyUobw8J7SPtkI+A+ZhXuqQbIqxp/Twlg
M0kYbEJusx3d8FA4takUT49lRsA7oZGcuqTLCY6HIvRiXlIVFSh/5TRNHmiE0EV72GkUtDOG
Qh/ZMfICYjDYrkxyqst3ZZP3BFxol+O+bFWChSF5G6TNlhwmPMG2izc29FO69qnvCNG29fwb
WVcLVuUJGXh/opDnXEh9QaE2ZggrimpL7moKtTQkUt4JiXUACN8jNi+J8Il9UCLWrhIRMewK
Qa58kLb85YMASKJVREWTQSQecQZJRBS7vkwKbBpB4G2oaQyZXclNRSKCreNzUbReGiJJEbo+
tyVmrKohPSXKtAlWPi1WTTRF3+YHODYWqtWlyP97AjfcD+KI6oS82vverkxNkWoiaDdiEwqI
eVJGJHRDQ+m1VG6WBlWgCXGoKGN6XQmFd5FZ7KhDvFyHLbVIhLhDM9su12Eb+sHaUTL010uy
jqIg29Ck8SaIlvZXoFj7G6pw1aXqjotxV/b2iTTtxAJdFnOBZrNZ2gAExSZekf0HqK1DkZ1o
mrR0+dEMFE99d71vk/u8IrZE+QqwRRtcU7q8I8ZCfNdxhwnJRNGWpDHJiBfyJbEPCzC1OQlw
8BcJXv9FdZxApEuTxzL1m0SrMhf7JjkxciHsrFdL81lQ+B61OQhEBDdFRAtKnq43JXm+jDhH
GghMtgsWDwQhioFKDHbH5L4m8fSCkKiAukqdKLqOb0JHG8po8fgTkqPnx1lMa3p8E/vkCZiI
Ho3J0KyToFQl/oo8zgDjiOalkQT+jROoSzdL6mt3LNOQ3Jm7shFa51JRICCmkYQT/STg6xXZ
/YC51YyyCb2lWQ3pI1JQ+ChxVCCjOEoIROf5HjHhz13sBwT8EgebTXCgEbFHqBGA2DoRvgtB
9KuEkyeJwoCUYVoc2YTFJg477uAikJEj77VGJVbgkU43h4nyI5UpcaIZXyEXLY+nlQQeDPIK
fFlB7u5XjliGcFiioH4KAPHTzdyGI4oL7Y9xR8SFkSgv8/aQV+DSPbiSgeabPF5LPqehH4kt
VWtEXFomY2Feu5Y5snuMpFmubIYP9VnUMG+uF0YmuaXo96Dc82OCLagpSnDvVwFZF1hbLAn8
VEUavUuqg/yHRs/VoCoMFOr5JSmKOk06Mi5tlp/3bf7gngKQjDLplFvMELb94/ULGBT+/Pr8
hTSIB+c9GQok6/jIx7qrlJNakAbrVX+DG5BQfKaHrUVeZsWa9EgxQzRdCv49tZj72O1FIoWG
UdQXsiJ034y89dctq79tF8wRYji3TeCqviSPtZ6UYEIp91PpKXXNK1g7GUEF4c2ltSgwWWlv
nCOBtNqin0GnL7XSBPfatPnAyRrpy/PH5z9evv9+1/x8/Xj7+vr9z4+7w3fRM9++60//E8uZ
Fcxhot6YQOxvxa9fbxFVdd3cZtWAt60+4hShvhMAW+oN+Eax8Tu4f1ypECBtqD4/5p1dRziG
YCIeog+N5NReIC1qyS/NWvVCeTBmW0VbksElSzoIJkl1lnrXtRfAkBTKRjwx1sIbN1nToje/
M78PqZTQZBvmfros48e3zaWOSHoZ38CuuQyjZYOT9OHE2hwqrgGzM6SMEduVAk81SApWgheZ
oz8BvfFWHuaW78SWFsRrk5m8Vo5zBy/eQNowsR/qsX4Epz3rmpSeKvmprcdaUxvsbiMYoqrB
vSxv8bLbiz3FwSAKVquc78yGsBy0I0cZ0QCLHmBTXrvG9AOYqOKN5++NCgsghhwbsi+OjaC6
VqPbP6uo2aIs5MzqcaFUqY6izCrg8sMLzDLVGUaKoI9Wqmt0YqEQWDNo/noJASqVxaZragiS
YLPbTF0xrxBpjefkDdqICzdK0EsE8WZj4WfsdsCiPSFJj0/utor5nDdCsV7cHMezn1mdzrar
wL3niI1+s/JiR4UhREfij0t1NCH85bfn99eX+WBIn3++aOcBBMNKCXkh65Sv3Widd4ONoKDY
cIiyW3POdiguih42FUg4dsqSpVIGGcDo0iPWBEI8ArPUPDSIhJqEEExXpsAC/jIoDv11TETi
sN3dLi0TgheADSJV+5SRLUAUlAHBhBcCs1VwrjVtoAA0fF8ktG2CxgEyY17TsnJ9weFdqkhy
LWmT9Or+f39++wyeRHaywnFa7zNDagUIPCrrFwqQZca2L5aUSefHmxXBQ6aDWWHLEAnPtuHG
Ky9nsqMkz77xV707Ucse8gxluSO6p6wrCEgBfe0ExQEd+otfkCTUZdqI1J/+J1hgtlZA6QCv
Eolss2W7Ug8yMZNA7B0lEY0f4SQLxw5cUjlL6YtyQAsuViAAjafaPR9OSXs/ufcS1S+aFLtO
AMD0OZ/USzNLkYPkmh67y98lBNWMWqdzI4YgYETzACMvY26WH5yiCR6NELF3PXlUaDQdHjGV
MgrDpDl+Wgqho8aIySAffT2OmzJ2WFjMeNo1f8JHK+oRQ60s06xtgFombRM8XlNXmgM63q42
RKl467sW12AiRxba0jnhJL6L6HeoEbk12zRqSuaXzqzJW+lS6+AGuoFZqEn3oVj/rp6YrfV1
YLeOseGTgoKFmrOdbRp2oeMhDPCcrTdRb/lU6xRluLK+KoELWbSA5P4xFnODTB4G6Eee6s8d
AEM5DZDhCmAn5xL0GbDzxLn/MMOitDs/KYRiQl3xNTzyViE6hJTNoedIdzGEKnd9fvZ8saD4
fX2srGjMwkEkS8bRDYIteResoX2iPgJqnxgCI/YO/U1gVJLtA3zEJCe0M42hn+0Cl8LzNwGB
KMog1G0uJXepemDY6DqHpYGWPdVVsnhYX8p4vbAlwr2FZwkU/8vYlfU6jivnv2Lch9wESDCy
bMtygnmgJVrWWFuLkmzPi+Dpdvcc5CydswR38uvDIiWLS9HnAtOY4/pKxb1Y3KoMhpVh2Qyb
HVYV3p4YqXmU7t5R4s15septx2WXTbsPg5tvdUNi9Pw9mnkWsEtPlNdimTUkoRgDvMBphU/K
grW5fhF/4oLdarFZfeNDqm1i5xNKEqouWiaIRE0YBisUileLTYgi0qREIcMuVZBbCyAFGk1R
tIMo9Wq9U8eZfIfuMJjwo0CltUixWqxW+Ew9sTkMsIkhZdlm4aGVzCG+SJ8TvFr4sAwWmKZT
WLiGXqMVLhAfR8K172gJwD4tcdZECzywq84TrAM8ldGG+SQdYFuhjxE1njBYbrByCihA+ylA
oXr6qUOGSWSA6ARr8Ki2jAaNVhqOherFbAUbFhiG53UNl2GBUCjcoP0gr8Jwhdcct8Z0b1cG
hpmGOouP54YjK1SpCMSZmY2jPeAtLx7NQuHpwtALPIcAANF3RwbPBu1HlfrucCJ/gWhfuqcY
A4QIOJ10xIbkqias2oLviyo1ogSCH6K7mQWT1XM0nTRnP/k8mONDhiPaZVEV+eLPNc/6CpR3
vkPcl2C9QvslyxLYKkc/4/bRah4s0O8UWxLF/IWrF0j70MfWBibT2qE4R8PzE5V29z2NwTZ3
hP4x2FzPuTU2YVR+xma/8EK4pNn1ORO3we5WpxgGGdmmW2U7VPiR1m8N1OC8CXefnaU1ZjDW
0RiCRvVaVvcFvQEanS/YHPQApf/WqXKmHRDec8vijIW/UThIcS5dX+9JXd2PngP6nPaHbXw/
lVNeoTlP5asnLPE6yvM7QkWddmlEmdE2UwgeV45pgfrJk7kxciEyWJMj/gEvu+HwFD5puBmc
OuvLDgigom4Ps1AlNK5Js9BqkDU1JfnvpDJyMTjfMHOiZDMp6yprE6QASUsKzKEyx5qG86sB
BXmNZ2VZDU/Atd4j3Hk7ep0h4rQtT33cxVrRmlJ5IRzRyLA2gFKUTbpLDT9qFBxJAooOxgke
TgaNNPbrha9d9xWsFD17E1EL24zRELgmQUCvSVrwARSXRx2T6Vtpa2TeSTLTO9yAb+O6E95U
Gc1oZN/IyK/fHi7jIvH9r5+qp+qh6CQHp/qOHMho5H3TKQxGJuI0SRuIMtjdOVyVrDUBlxSu
wsa1O5HR+Q6WhMEqnomjbDfPOVadjDnp0piC+uvMzPEf8NpNOnofvFt8u74ss4fnj3/MXn7C
WlypWimnW2aKITDR9D0BhQ7tSXl7qh6YJEzizly2S0Au2fO0EGZZkegKUEgVp0YQ/lr6b0Za
R7IdC81dvSAScGeu7j5gxVZ6muIVd6oUo+YRHrWv3k6YBHG4IjP7/vD4fn29fptd3njOH69f
3+Hv99nfdwKYPakf/129ViYbEMbg530HzvbcnVh2XxKTqtHmbklvKFmtNetO9vZ0uVZ3dkRG
RtqkIIVrUqA60wVYDTI5ClJp0zAxgFG+KSCvQ9WQFRFL2bY2C8EXf6n4yyodtwkOKFFTmiD3
QI2ZVkNrArN04VKrOdmoN/KVGg+WDnJ/aoj2PHXIHCHrtRdgx6jj57sgVA/nJFluThrDb9vu
fGMemujI8Bf0nBe0YhgS51LTpOYwl/Jycb1T2wvUhowyii7PXx8eHy+vfyEntlKxNw3RT9uk
PoEJX9/mlHc4P749vHCd+fUF/Pv8++zn68vX69sbuMMEp5RPD//Q0pCyms7Y+h3IMVkvF5Zm
5ORNqLqlGMiUBMv5KrKzKhAfWxtLPGfVYulZAiO2WKgX80fqaqEuHydqtvAJknjWLXyPpJG/
wNzcSqY2JnzhaZWUrz7WaystoC42JrWr/DXLq5NJF6b8ttn1EpsuyP5TDSWdDMbsxqgqzCEB
QoJVGKIzqPblNBuq0szZC+6e2bUoAfwsauIIPGypNuGhXcUDebC1DJnbJpxju4M3VHW8fiMG
gS3pwDzjVaneA7Mw4NkP1vaXoIbmjn1glQObD4YeCJuca/34S0eg9O7Pu2qlBaVVyCt7FHbV
2vPsMXv0Q9Un0UjdbDxTVUoqUodAv1sRXXVaGM+ilT4HvfqidXqz94mK1PdFhtF98lfh0kO7
uNGhlQSvz3eSUf3LKGT9+abS99f3Ci458N3uiWOx/Gz8LDafcawchw0jx2YRbtxqjhzCcG73
pD0LfU9zTWhUoFKpD09cUf3v9en6/D4Dz/hW7bZVHCy9xZyYyUhgiDmvpWPLnKayXyTL1xfO
w9UjnKSNySJ6cL3y97hv8PvCZNzCuJ69fzxzG9VKAZY83LTyrUYeI3MZn8oJ/uHt65XP7c/X
F4hFcX38qYg2W2C9sAdivvLXG2uEGyFSh8I3wg957Pn4SsqdFVnMy9P19cK/eeYTkB0qaeg9
VZMWsMLLrNk3Yhh5n65WiB5J85Pv4dc7JgbUiY0CW/MvUPWonRNdf1KIMGzcxgmHF2hqixWi
K8rO8wl6iD/ifmCbTkBdWWkANUR5MS3F6WtTRRoMq2DpngIFjNRf2YEPgk/k3tWOggE76Jng
jWVkld3aV71T3Khr31JgnIpW6lrzpT9JwHhDxJYAaoBW9SZA/RBN8AqxoTidzwF3K2q+CFf3
RkbHgsC/JyJvNrmHxopR8IVvZw6AOeoG6YZX2nWSG7nxPJQ8n+PJdN7dOUxwOA4sJg6Xt9ZB
G9bewqsi1Mmc5CjKsvDmgsfWunmZmas+0P4bfz3vjZCmEqxjEuV3FjgSt2qp/m21LCwqWx0C
gixkBB07WbrBSxoliPXEkdWWYG9bb9rb/og2IT3giwp8shDzSMZp9kJ2NE5WoY8tLQ7rxR31
EB8367lluQI1QLQVp4feuu+iHM26lj+R493j5e1P54wXV/NgZc3LcMspQEoC1yyWAZqwnow0
N6rUNAome8LE9D2Bpi2m/c3o4+395enh/66zppNGiLWHIPghok6l3ptXMb6mn+vxlw009Df3
QNXhtS1XvVhioJtQ9bykgWJ3SL++aMHYfKZy5Y1v3kw3UPwmqcm0wPPIMV9fbhroHD0mV5m+
NHNv7qjaU+R7uqcGHV3hMSp1pqXnec4cnjIuY4VtNdtsa+skYECj5ZKFnquKwGxWb4bZ3WPu
LOIu8lyzhcWG3lY1mRyZHPLh4yhdapcIdKHc6HRgeRjWLOCfOuqtacnG85wdnKX+fIXfbFLZ
0mYzd907VdhqrnvvHsaMDb3w5jU2V2h9Np/Hc16duns0i2PLy77EpxBMZ+l7pfbGqNB2yevl
558PX9EoRCTBHv7KC/pJox1WdQnpSY0HmgCMHdMGosaU2D53rMaW4D9kCKhYjdUE1LjqSXuy
404KTHgMzXOMymi2g7MxHTvkbAjKqJZj+oqnlvNVYFNWZVYm576mjnfi8MlOHF/d/Ag4+SCm
Z8+bNe53aZ1D7Di8OiB17bQUaE1jFA+i005l0DlRekLznu1ziqOMN9AtxDvshQ/7FTNuleCr
bfhKhgJde16gS5MHL9k8WJr1K8IcnioxW23QgPQW18oK9ODKm9zpqHPFBJn2LBSynqWaxHj8
WQBJHidVa5ZCUnuHgymFI0qx8FcKA9warpqb/UGiavavcjc7eqnGXex/4z+evz/8+Hi9wMmh
OkwHUfAsB9+q+acEykPHh7efj5e/ZvT5x8Pz1UrSSDA2Oqik8f8KpLIA2cdmFm0ehj0tGnFG
o7amfZyyKiNntU/czfkoZs/IEFVbS7ko244SLOCm6Igb1QXYSOlFNE+IQbylv/7tbxYckaqB
rNK6Li0NIznKvKopY5LFWS2Cd+gid3LYJ93tee2316dfHjhtFl//+PjB6+OHMWSB/+jOmcvT
vc7Ata16xGWACc3vYX1ZqFHcbww8U3DtAv+6qeFqfaJHVDfRBjvAvjGxY78T/hFkTsotxN1k
qLwbq4zeHZN/okqSNkLyrUxAdjJZeewz2oFHFiiACJ7lnmiUtLptRopDTzuuuz7PWd0W4Dmj
r3J11CA9Re9BXF18f3i8zpKPB4jjWv58f3h6eEP0gUiqpl9auIQyOlzxucHi2SNH1OrIM0d5
oMNLXyLijk/LKlrEv/IFlcW5p6RutpQ0wjCpO5IBm83HxxrNqylvwdLm4bb1rQzblp2PJG1+
DbH8MW4XqEWw+ypEKMxS6GltLZ0LzZF6v1e/2lRvjYiOGzBmh+ryY7JzTahJTlb6ygWobYxd
TRP61rSY8oQkvmq4A/HLKdMJFSnoLYrjqJWry/P18c2ctASr6041OpUZ8tR0t3UaJxTJy4Ro
WQI/Rq/fL1+vs+3rw7cfVyt38gZYeuJ/nNah+QbGyJAtTc0HbQrSpYbJOhAVN0la8tsy2mPr
SMCitK5b1n+heavLTPK53y58o43kRoVlZXfb8iQ2WgwZbawTMpqQ6KzTmnh30in13A+t/mIk
mBoERjpithk9yZt/cO+Zj0OGtWhZQ8xSMap68CpzMLggcF9Nilh4b5DbUq+Xp+vsj4/v37ml
GJu7U7ttH+UxeJie5HCauFV5VknK34P9Lqx57atYNYv4b+GhqqMMuWoI6fJ/uzTLaj4PWUBU
VmeeBrGANOf1ts1S/RN2ZrgsAFBZAOCyeP3TNCl6rnZTUhgFavYT/dZpAeH/kwA6gXEOnkyT
UYTJKIV2Twgqle64iqBxr5ocwMwXl1qwR8gFiQ5Zmuz1AuVlTIdljy66STNR/EZ6QrO7y59j
zGdrIxZaQwxFTWCV++Zv3iy7EsxWTi1k66i1Ep25AvTxzScOkzoyPiB8ZcUrEN+AEP2DNU6Q
V9kce7sFEO+mRlIFHsyBI/vE5AVvayIouaNl5/HopEFLoYOQ9/gnddqZiQDJ8SJ1RMcLo9Zn
t67hrLg1ehAFPZeG3kp1bQ3tRmo+3ErQNapHB+htIqCakQVJ7HP+DS3SFo8RoPCdWZNyY+QT
NswsnVDjdBsqwlrraj2rOXNF7uiHzdnsh825j5yVCWiCb6UN6KftwbADGqCPM4fGLIjuvjHg
JIpopmuRlJm/+4VuK41U9IUdjJxU16yduCAOmhjWiNGOWahwc1zxSWzLx3KjTTN9QUuulVOz
6Q5nNHoHRxbafDwQkJIKst0nurKMy9IxzrsmDPyF8UXDjSpaYGstobAOBnuV4zdx5CDKU/Qp
CtT54HFBpbCoNQrLjVjtd7rlZsypWa5Ua1VUu3jFbQ5LykdKUeaOLEBUW/+kJzjQxLXpxJjv
R0y76w4ZZ1z7eWujMOvhVHc818LsFDElbS9f//vx4cef77N/mWVRPF7jn7ZtB6kck9fdh3dB
U3qA2LF8b0PQ8dWEH5rYX2n9YMKkowK0iZUEVHWJVPbEKZ9vIiJEAJ27n4rna0fNG+gE3vyG
WAgje1ITDJm8N2H5iaswRI+8DJ61S4B8s39XgHhu7hFnzQcL7FKnwlKFK/V+vlLPYCTXDsnS
Z8AnberyqjUl3vHKW2cVlvw2Dub6i24l9To6RQW+DPxkLIwJcUMHXDgrnXkf55pTIr7AK9EU
rGOR6RtWtoXm30YMz30a22Nxry4N+I8pBmJT0yJptGvoHMcf2LWWGCNaOPt5/fpweRR5sGxU
4CdL8Fapy+BzQyuW2ya5bk8Iqd/tjMw6x+INS2vrE+YI2SDAli9PMie8pdkhxdYMEoQNGZFH
lZomW1pYZDiIqs9m3qJ9yn+dnekPsbEcGYjKNiFWeXMSkSy7I1Oc8blE8upoUohVu/VW6h0r
AZ7F5rGZIO9CSVnUuEdwYKA5Q5qSZuhqTEI0KnP7A2zUC+T3Az2b3TXfprXZh3fqLCQoGV/X
l61Vpn2ZuV6KAtxxwz6L8WMYIbYJwgW+vw4wz60YBo7iHM5Uz2Ubwa5QZGbySLIG9ZMss0iP
rCzsr5Jz7T4wBIY0MnZ3dbRxNfNvZKvOZkBqjmmx15fssvwF4yvf5k4mssjyvK+i1GhZvrgp
u9JMB2oNtJAzFWHw5rz9XWXKeRXXWgRJQTyLZ346VbwQTizeNKpLcChtkEvYOKaWQsjbrEnv
9Y2iSXVJBbeKE1NMWRu9V8H4/Avbf7zjK3WoEC3VxRfYvIqKxqQ2JDsXht6uuD7jsyNK1Pay
VLq6eaIVY2SA+dbVhDceGmNbACpLZE8O3DaFt6YFHm9h4DizZnTVP1bXRLSrq05zcjL7Bk8k
pmbqfJEWEWw9AyBX/LwRdTmM5KxV4xYIIs0HTk04K1HvIAKCkI5DBAqV3FCSWySawWtyNSKh
ANqiylqDWOuWjtA2sK9OmHPCYTmpm9/Ksy5MpSJTB5+hXFMBV4iMmtqh2XNtY80nzb5uWSOj
wDuktWAe9RVb6PJaf/c7rUudeCRRadTeMU3BGYJOPKV8OJl5AXFQWGc3//0cc5sIvS8g+wAE
I+n37dbqBhKJeFHBD4345TKgssqaCPOo8q14P+MNR8QGHJ0k48YpvC7dG9F3xQDFx/fAzpeH
aPpmMrdLJHraN3FwvUMal1WKCjS/VQJzQJxil1hxOYkzgHBcLipC3rzI4xnbSYAh16HgAsLO
LRn9fAS1xJQqLfdRqu+KTz1UebqtE2/xsbTWgYfuMAFhSwgOt1mV9lt1ZEtRRWG4hQYyX33x
ghLW79UJpFU9ZLfS4bXxXVHw6SmifUGPimMS5P0OdBj1pbwiZAwjAVv1KcP3BoFvx9NIi7QR
Kj2l+IAVAs8FAee3wlsANrmIlmgSs0Y5CXbv4jZqshR1zj1yxSkT4XvoiSuwAiL96KN/5Nvp
kWH11mOi+SB2Nvgtt1pdOQmXIYZ+9VU4n+LXiMH48vYO12BGjwOxHXdGtH+wPnkeNLMjXyfo
oGYvkNR4m0SkQgDD9a9K521VUIa6HJ3YrE0qgCiaEUGt4YiN13jfNAjaNNAbx9ttJmp1YUHd
sQxP3ZG58tT6c29f2RlMWTWfB6cB0Psv7xH8qzuVX6JlLm95sev5hjGG38bUBQyFcXK2A6eb
Yb7w7zKwLJzP7xSxDkkQrDZrrIIgi+Cf3T0hfVJQwIVbFDj9s/ZsYJgMAWmix8sb8tJCDLso
N/PFzcoCN1RaEbTD6BxNftuqKbgJ8p8zUS9NWUM842/Xn3yKeJu9PM9YxNLZHx/vs212AOXZ
s3j2dPlr9AhyeXx7mf1xnT1fr9+u3/6LJ3vVJO2vjz9n319eZ08vr9fZw/P3l/FLKGj6dIH7
PfbTDKE74sh0h5FWhn8HSeuwHjnRe1Bb7NcQAQtuEkVM3ILRQEfYAwlaJ3lCZ8UFu+vTRBRJ
tH+M+j4Sc8IxMlyCAEXMkgh5COsgo1c8Xt55NT/NksePMZSRYi+Yn1oKRgokFbPIvk3RUk4u
335c33+JPy6P/8HV+pW39Lfr7PX6Px8Pr1c5pUqW0dSYvYsec32+/PF4/WZlzkcz55sOd270
Drx7M4ogcHftwOdXxiisdnbMbLNJLkzraRmnroaJ9vDwVr2ooFJ7PcCGBiHq8Iblzon3xjLt
qhrqex14KBFX9gKAaBd1md1uHUHTiAZBwr8JNcrYGn3wJga48CBm2IWCJvwMl3o4DgUdSnRX
7PSMCZNA0joCw+a+CFIfFnySc8iwN24xrmi/QCMpKyzHPV9b7ylpHAmBQy555kkdjozU9Co+
9Z4ckobd1T7HTsIVPppXNEEbZtfEKa/aEgW7lKkOqhUkrcgXHMD5aZxQ21I0wL5J8TyGc3/h
u6DVwnTeNHQqcV7ryP3RUaFp237WAQ70zCpS9FWM7U/YjGgODhmzdMAIlduU9/bok36RR03f
+gvLi9MIw+7RJxJKtl7rB4YmCvdRSX13/lLYQ/ROisp0ak3vcQpakC5Ht/cVnirzNYcJClQ2
aRDqngAU9EtEWuzGqcrSkgxWrKh0VkVVeFo5pDOyc3vOuukvWtfkmNZ82DP3GnDkPufbEj9k
Urga/DhB0xBbWv/GJ71PVNaRWOv0sV4rc+cf4cmLtKCuhgUJkWPfXmE7wUZTn3/S748p22/L
wjURMNbO0ftpakM3rlHTVvE63Hlr9AW5mtXapdrNJwm3WVXfVUAt+P9n7UmWG8eR/RXHnLoj
Xr/mLurQB4qkJJa5maBkuS4Mj612Kdq2HLIc056vf0iACxJMyjUT71IuZSZALAkggdziLPFG
LeNAi7KCEyJ/tKk3xNmwZTGdMHEjLvCrop7Qkwi8Lix0h0x4Nws9W8cJs2C9CUk0pSAR90k4
c0CVpxcT2tjWaYZsvyBosiW/+AasBg+71eSRnzD+Z7vS5LNU61wNRh7xNllUOBmD6EVxG1Rc
BtTA2EdPzNGaxbW8wC2THfjT6OIWaCqWtxh6x+m0oyv+LsZnpx128GTA/1quudMettYsCeE/
tmvY+mh2OIcOzyVGI8mvGz7YcdXojh9S5AwKxo+xSV4K6oxk9vLH5/vh4f75Kr3/5JcOktvL
taJ+zYtSAHdhrNqfAwge/bpQ5y24DtbbApAESMq0i7vudW4s+Nqt763yIjzRXtzZVcDlFPog
rO9KMpIXFAPxuvUr1ccXUKx9C4YXJbLuLKPD4maQ8VvRxnQQLUncnt+yP9n58PAXJdP3hTY5
nGENX+ibbPwCodYy/WCn11kny6zB3h897ptQcuaNTTpW9mSVO7fI8mCCUcfXE6n8RmSIV+DN
F54xB4h41BR2ZRSs6TS3gz3OgBPa17BISQ2JoFtUsPpz2ELXt7Cm8tXgv8opqHkRBYOS8vUT
KGHHZmiNFUCLAtpjoOfolH3WBdwKSJHg2pSXvUDjN3lZO2R9cgigO2pc6RqqyWI7rvEWAq8k
Kd0WlzbV7QnolCcCracBkmXUHAwCQiTnkTMZWb5hjVrVpq5jjkVKHrKnte3Ox4PbGu1NlRrl
5ZCv72EAiQR0aBq6c3M0mqNsIj1XuH/rpEq+NI05xXvdP58Pr3/9Yv4qtsxqtRB43vKPV/Bw
JjR7V78MmtRfFdNPMZZw9ugDn6W7sFSP6A5aqddXAQTPu9FwQoZXf3GBP2R2sVYxNTXqSh4I
JVYMxDGsj6eHH9qaRdPJ+LpyA2K1GaY+MVXtu6Y76gJbZbbpjIMpwkfr0+HpafzVVhuj712d
kkZkhR99p8NyUZqtC0roRmS9++LERwhnFoQPy80EJgjrZIsMyxG63V/oxncaODyXYrwOb2d4
THy/OstBGxg1359lsGoIdP3n4enqFxjb8/3paX/WubQfQy4mMnDmmmyKDNP+1TCWelZ7hOVX
KE1vTdcBxpn51HDiiL64F+oowwMUJMntrPo7E837vz7eYGTe4eH2/W2/f/iBQhTRFKpqe5nk
ySLIKU1KHAWQ8qEALScLq41yKgvUSI1c1WGDHKcAwLdFx/NNf4zRznAArcO6YHc0sLMi/8fp
/GD8QyXgyLpYh7hUC5wupSduk41vrjeg/dUlbMDmWy6qjHiXY64OnaemstqhBD9sltCQpdYj
AQcXDgIsw5CgD3fwZpPEIiAIMVmiR9W2a3hvKgHNG+1/HXGwWLjfY9X6ZcDExfc5Bd/5WmK3
FhMx8EQgd3OVZCLMo0LizSZS3LQk/JD05uThrVCMsnqpqPnlZlbMDe0ZmferpUhYalpq2GuM
wDkuOtyOY8hUWi2+DJe+axFzIRBaNmOEsz0ymZFK4k3V6xOIzDFrNWAShuuJ3Dvs4sa2aIva
njeJ1EQaCeMC8NwIxt9e8pPWNqjvVpwjyWieCoHrm+MqoaDlUlXGmW2Qkaj7olvbsIj5BzjK
V9XDfd8gJ5BFfNX4o10FgstNLl2wc+JbdsPKPm090IPQ8+WSj5itPURjDL/20NKWwjUWisyM
xmQekr0HjKyZmgbPFMHVsCL0Yi/CrGDjmvjmYalZTBW4axIMAHCX4H/YhHy3WQZZkt5N7HWc
4MIgCYL5RNGZ5U8kXVRonJ+g8b9qw8whZiNilqOGGe/hXcp0nUPra3NWBwS3Z45f+x65zXKM
fbkDQOLOL5OwzLOcSxvx4sbxDYrjSjc0iBkHRiQ2tv6qKVjw+Pobl4AvM+Cy5v9DMQH7RutJ
43tEl9qw9+1hMjon/tBoFBQjT7gdXByxVZFGS7BDHA9ZlAWD7dwIpktDCmaL3qg4YhzrAFJt
xPkKxToAWJ/hdh3keZziLwszTZV54PWnAq36KsrIFFnSDpMjcfyvDr6LWu/X6bJFUPPiauEy
3TXRhDUQGGeWNd0Y4RK4hsY02SpDB+KAoqbhFj43znzXwsl2dGXo97M12zSyUy2AcdkSAWTn
UwnrZzF8Puxfz4jlRIKipp4eEQ4HAZNmr5YFIDtXpHxosVmOczqJDy0TNdQpu23a/EgtYCML
o1ESkCYrtnEbSYNuChCNzHxaeBc5iQyEIkn4BbrEzCoKgiDfgFsAI6oVZcStI6ZN3xDdyACt
i/2Cx6tvQahMZ7DZDcHKWhioV7BfRuQ4M98YzHoxfABA1g1VlJW/hc3VH8bf9szXEJqVaLgM
VnDqOsrlboBxXqjjPyxDWawZsFmYJLrTR4vnUEsZ+laj3UcA6sEQsqVF/mFo4KoQnOUqq1wg
5HNuk/GrdLCiN9J2HJtF2hTL5ZcklKCk4DUvoq4Tg16B9HPdLlGaH/6Lb1xZthGaC1PD8C32
ZomMHAU4L0SRidqF0ayWaakDZ5lqftuD+R6yG4MpwtW4NRn9UsKb3izuSvEyH+R8SpQ3XDg6
+JGWbOVb2VDfotitNvQexC/uVcF3oTANtuoxB3XhhykJgUdU2oRkG5X0BrgVGiu9XGuK/nA6
vh//PF+tP9/2p9+2V08f+/cz5VGw5hNZ0T4PX9XS9WlVxXdaSuEW1MSMEpn4RhBH6LyVkMnI
fD1aPtuJHTD5DglJ+YJ2/Atk/JKtUhqjT2YJC7vJpdeYpEtYQJFhImC6gVEwzrdcF/Npiwgi
/s9tUIfrqFjR2AAqNrVA/GMCl3yKIOiwLRtB4FGa3zGdpwqXI7T1VYMtWvExorNNVVIeo1EM
jTFaC8nTE6QwHd5UbhFMNtuR2iFM5Jtq0jqMm5sm1cgO55MthCtuYs4msijpZKQ+aERkE63o
cFTrW5xHzcBWcrx6RnS4rExDwPApprleEJShZXuX8Z59EZ9YlkONXY8mbXJaKv6rjsPJTkQB
A/EjJLeq2qYDWnX4u1xY7JoGyX0rvuusywm37m5rWnq7C+swCUupRSbafbMogiqyUBzyFvmt
ogf0OgYn/7xWT75umIQnFB8Ngr17HNHJFkcaPCKS7FL57GIFmRZtvQfDKIzAedJ4rvpipMLJ
iQKMZ9CqQYWETvA5EKTBogzJcc/FsUGxn8RkBKaqI5fYEplneeORSFSv0KFqLnSEWTTClGEW
JsHkKcanhM+V6TXhGCeXC4HIBUs2M74VTGNhr3Am8HL0QopHcughJHScHv6bTQCe+fCVkvqA
sN+f6G9Uz32TOsVyUc5zDTqCzFB1RNqPIvwSxSJFKJas1Otzi9tm175BnL1cxhivUBA8iA4I
eYTRomW3Jci/aUKliCM2+kubPM0tk5M9wbEUuCo2bWxDjOrCa+q9EvAm3kHjKCtARNbWr4rw
/Na9kt9T3rxS35xbtADPkdoISo0Yv3C9n1unJZwbOXh42D/vT8eX/bl7iOt8cDFGUr/ePx+f
wBXm8fB0ON8/g46VVzcqe4lOralD//Pw2+PhtH84i8R3uM62b0FUz2yTzmHzk7W1CeXe7h84
2Stk7p7sSP/R2Wwib87X9bRBcqEh/I9Es8/X84/9+wEN1ySNdHTbn/91PP0lOvn57/3pf66S
l7f9o/hwqLa6b7M7t1Euw5+soWWIM2cQXnJ/evq8EpMPbJOE6gfima+u/hbQR8PrOWiqKqlC
3r8fn8Fw50t2+oqyd0gn+HyYSxkkzqUEqXadyTwh6g0acid9LyrVRUIBNlGIlXMq7ntle1oK
H40uKTc2vAyNL9XB6+PpeHjES0qCFLuMOm5WUcZFaWrXX7FmWa4CCJmL3l7yhN0xVgaULWAG
t3x4TC7yOFfjBQuEtJ5XIV3I48H2EaB00Mjumg4NqnAUpA41igag4UfhLXW8eqcdgEUJlj/U
B6di8XT4KrgdVzg2xO67JqJjR9hsuEPqRkIdXButcRtv6XfVDr8JJjxfegJGHanLJE4jQGuG
Fzcpaa6+870hMfygUBn2ybBMmtuMvmMEYVytI/pZEXDNRY8ToY7I6EGCayG7XWzqqZhL0hp/
lW1oqRqCqHEhoNTiTWE81bqO3+MquOZS4c7EIU7jOOZC5IWK8XhKgRDemCkbF9DHFk21vE5S
HG9z8y2p2ebSZzqSGhwPJ9ik5MNbhNdx3Swngk2vS+kKSCK70WnWRa3Z4bcUEEKUCyZIdxXF
QRlEl5oudX+82igoacYAo81rqGUc+OTSKAu1EEmesYRoUYssQ6nnETbPSEpvoxdd7ExLcjPx
vFIXbJ0sgmZRt/N8kWo9NSJiFYZZSS8WoSVMLzWzDPJABFe72BfIGn8JL3RBM296WiCYUR1U
lyoBWw/x4MCni9PmdRKQAdqydKeGkVA+0Wc/aKKJbalVjk6MZWsxHW50/SNFQcR+6IY0k8aE
6HKw5gdg3JeiN5Y0DfKC7pw0NoYFV6bkG3ZLoN5h2KZaQlKX/qOIg1uk3VzYSgcicWw2Rcm/
MRVwryNelbTCqcMTfRjRlFVBNazbnIJt3ISpGvOrhUCeEi7n4BeJrMhbainmPx97rxNhQA6J
rar9n/vTHoTjRy6FP+GoOkk4EUYHvshKX1/h3W3h5z40bqlI7+r4+rW6w7LE1Zy9p6jcn6Fy
aDtFhSiMwnhmUO5+KhGD98AmLFGrOaK+TT2D9MFVSiNvh12SJvmu2YYobdj6lpVJnhbYaVSZ
Unb8OD0QeQZ4/fGWy6i+pZpAiZ8NVKcwS3q9SKOeUptJrf5+5QVJusDR6stwQnZp7T44OXVo
CtVngE1FJPBSuA4QliTV1hqNTLV/OZ73b6fjA2HhE0NIN804t4fxWW/FxP5GNqpKfuLt5f2J
NOspM9baiKyESx8H0E8YglBqKsmVhD+hnkubPAJpZNRvVoRXv7DP9/P+5ap4vQp/HN5+BaPw
h8OfhwfFOUxevV6ej08czI7YPKm7hhFoGVT8dLx/fDi+TBUk8fJ+vyt/X572+/eH++f91c3x
lNxMVfIVqXQr+N9sN1XBCCeQsQhqcpUeznuJXXwcnsEPoR8koqqfLyRK3XzcP/PuT44Pie9P
L86CdW/1uTs8H17/nqqIwvaeAT/FCcPZDVedZRXfdF9uf16tjpzw9YhZvEU2q2LbRgJpijyK
M83NgKQv4wpOZXD0/ZoWjl/GDznKkkehA/cjftEPscGVWlHAWLIdr5eul0Scs2FImnhLJy2I
d3U4xE+L/z4/HF+72FAjR0xJzO9xYfMtUHffFrFkAT/88N1KYvRo6Tq+le7y2nbm1GnVkvHT
1XTc2Wz0ZY6wbfyaPWBmM29Oh+gfaHSDe0xQ1rlrqn5+Lbyq/fnMDojPssx1DcrEocV3jsij
KjmCrx7wwFb1OBnf3Cs1VUa5CppoCYFYEiX0a6JWyH+ApcNS1dsNsCZckGBslIfguvWkggU/
1CIHV1/tY9ciAZC0kFPArQNRHJEtlP9VHVKUMiNS8VUGi7InsVQS1gVkxCU5mKxxaJpYM93S
IJ7eu1M82qX2zJp4SVtkgYmXBIc4pIJ4kYWcyfTkJSpUz2ASBZZP31GjwCbTF/FprCJDcZoR
ANVGeLlLmT/3rGBJwXB2D8XsV7bPVvSG1zsWIfNyAZh8Qrvehd+uTcOk3ESy0LZU7+QsC2aO
644AuHUA9DxczHdUn2EOmLuuqZmZtVAdoKb8FtnQXQTwNG0aq699m0wmDphFgFP7/hf6m579
ZsbcrJTGcIg1R+nAOcQzvCaRN7SgCtI0Jh+votl8rmoPQ8hSacKOr3BMmlstZJDwdzOS3ZI8
gJQwGnVah5Yzo+gFxlf6IgCqtzEcAbbqAgA3Lk81ocnC0nYslII9b76bvq83Iystz5oDlGTI
PNjMfHIPF4LxFo5B3XJVYFiZJU2CxmyAb7VGDBiOoFwlaoExfBMVE1DGl8tUkYyfhzs8cfw6
5xi2wUdMg3oAXZUI3N7kdl1z/1Nd4fJ0fD1zsfORUjUqyFaMf3vmQh3O35GFTuv51EvzPdV/
pRs03Ynb/s/pBsMf+xcR00O6RODa6zTgR9B6Ora1pIi/Fy2JusHHnmrsLH/jrSwMma/yeBLc
6Mb5LIxsQ+xkky+0SQWx4tmqJE2fEIWadoOVzNZ/6ifR9rs/pzOFjoZNupYcHjvXEtADhvwu
oWbWVQ4WecprBuIYPZzjQ9hpsn71nM9Y/2ot+9Ir31mYJWiSFYUlwsn7Kiu7L/W9GK4wIyQS
QWqtCTSunelWQS2Zk/PpvVxL9JngGh5S+bq2ymL8t+MgU08Ocec2ybiR66kOa/B77o0kEeY4
FmWTlnmWrXob8u3aNZHbK9+vnZk1sY9FQei6MxRf5+IQ9JP4+PHy8tneKYeBgZGNNll2x4W7
VZxrQy6vgQI/jZFiIbtA0Iu0iHNQg2QYCAhgun99+OxtCP4NMS6iiP1epmn3xCFfsFagl78/
H0+/R4f38+nwz482FbX20jVBJ90Wf9y/739LOdn+8So9Ht+ufuHf+fXqz74d70o71Lr/05JD
VreLPUQc/fR5Or4/HN/2nAO6pdfviCvTQzsk/NYSze0CZnFphYZNiq2ru6pAUmtWbmxDveq1
AHKFytLBLtHZoUWBYqRDD++C9crW7JtHvD0eDLlr7u+fzz+UvamDns5X1f15f5UdXw9n/Wxa
xo5DRuyCW7NhquZZLQSl5iOrV5Bqi2R7Pl4Oj4fz53gig8yycYiSaF2TguM6AtFTzWAShRby
ZUQZJ7IkQhE/1jWzLFP/rXFBvbGQlMySmUF6vwPCQuL6qIty3+Fr7wwha1729+8fp/3Lnks5
H3zIEC8nGi8nBC8XzJ+hHI4tBNNdZztPFQrybZOEmWN5alEVqjExx3Du9gR3o5cDFYH3+Za7
U5Z5EaMP/AujIAPPiAR274QQBQrRIKU0bEH0jc+2bWq3ms2O8yolywSpjZiF/+ZrTvVPKyM2
t9VxEpC5OjUBm9mWKnUt1ubMxXd5Dpm4gYcZL+xTvA0Y9Ujkv21kfZ/Znueirq5KKygNgw46
IZG8e4axpO5gN8zjvB+orq292MFSa25gJwOMI3PiCpSJ4xKobwHpdA6ZlqSsSEXKNxaYlqk6
S5eV4aoruWvdKAxZXSFvj3TLGcBRjXr53uZgk/AWoryG5EVg2gbqV1GCQT81jyVvq2UAEu8i
pmlTjxiAcPQnAtsmw0LwJbbZJsxSbsI9SF+Sdchsx6T2d4GZWePBq/n8uThYhwD5VLsFBr8n
AGhGRh/hGMdVM41umGv6Fna3C/PUoX0kJMpGo7SNM3FDpcgFaqZM6Tb1TFXS/c6nj08SEiDx
BiT94u6fXvdn+fpCHFvX/nymPrBcG/M52hjkG10WrHISqE8Zh/G9jN43lEUCReO6yOI6rriQ
Qp3gWWi7lnpZazdo8VVaMukaNJZMeiueLHR9x5540eyoqsxGsgOG46PmLsiCdcD/MNdGByk5
8HJKPp7Ph7fn/d+aLIrg7bH78Hx4nZo89a6Yh2mS9+NJyhLyqbipij7dmnKwEd9RB1cGbAXN
UP9s3EVYu/oNbF1fH/l95XWP7yPrSgRUo1+jRb6NalPWE4/VYGQJRpM0WnqDE9djulnt8fzK
BT4RqOX+9enjmf//7fh+ENbZo8EVZ4vTlGqkk3HCL6ndgah9MV6HX38JXRHejmcuSxyGN/jh
Smqa+HprzZDVV8T4rkDrgOBC6pDhKOFiKs9GBYA2t7pMdWl5oq1kP/jQq6JhmpVz0zCMS9XJ
IvI6d9q/g3xFilKL0vCMjDbVWWSlpjboRild8+0U7dVRyegTCp3lsRojbV2qAdWTsDS1O0aZ
mqar/9ae7svUxkTMxY+84vdoX+VQm9LjtVuf1lIVOjpVXcegTsN1aRkeovxeBlyco90ORnM0
SMCvYPf+Pn5lGiPb2T7+fXiBKwesl8fDu3yvJOZeCGdT7kdpEoEtX1LHms1JN4ILnBqhRA40
1RI8LHDEUlYtycsl281tdVHy3ygtPZRDciec/TYtzm9T106Nne6y8MWY/P/6LcjtfP/yBu8r
eNmpm6ERQGC+rCT3Q4zI0t3c8EzkpSph5HZUZ/wGgB7tBIRid44wTUVpUvODQBWOxe9WKOtO
hP+r7NmW48Z1fD9f4fLTblVmTuzYibNVflBL7G5N62Zd3G2/qDp2J+ma+FK+1Jns1y8AkhIv
oOx9mHEagEiKAkEABAHmzQatuDWTHbczDFwyx4GgNOFjnAgXDOJFrKj4YHPEyTTXLZsLG/HI
nlVpsihC27LMbAhGbDg0mIDTLR5xmQusFMjp+maUG/wYMiaOwRbrPJimgHDr2CVXDBN4gLIe
f7J7zSpTfmmIexN5hE+EugINJTe2gxUR3K75j6VwvcrSa0WhpPXFwc3P/aOVSULrTS7OkFUV
lk/ipxyksmjpJnZdZpmdcVbi2hQ/Q8wka62WVwfN67dnCh4aV6iqC2Tf+aC89YvcBsKPPo4K
ySaYQ95UrWZx3q/KIqIc+v5z1Sbqj8+KnBLmB1D4pDXv2B98jypwAwTxdFQoE/HbrRoIt0Md
y676MzAYYwK29kcbqtIwwXSIPLeFrTWlxsgxwAkGzipQVi3IXF7b5gmBYYdDmGr3hOn1SJjf
SZcjx1dTZAarRMHaKCce35hXubQqVSR1Gap8qq95aW3JrLlMqVidn26iVQXE498miTzqWrYg
varrg5en7Q0pBm7NtaY1HoUf6F5py34WWfwwIjBTbWsjnFMPBDVlV8eCK7VlYIc8zqwXYyCb
Y6E0qw3Jae2SnVjmZXWjGPpkeQFlZG4F5l3lHX8az/T5otbE8aWxDRNS3gYzHYZEOK+FuBYe
Vh2OV2guxmVXZaZ0oPZktL0DTOaZD+nnueChOOIAxh2QhRz6HuZoQEdzLt3SgC7SUmefB8Hc
F58sd9lAZmUrqPK+rKzQcXlrURb74kV7k9pR1/i71/fu+OPrLM1ngdLUZCPDvwsRB4L9ZfoK
TvBYRfXoQiTJUbOSpbxn6YRUOyGS8jxvj+mrST6aeQfjKF6Kfo1V7WWKbEvjiFAjB20c7PQq
qht2lIgrm3QDzxsMJDaovpjSREP6GQbHw2cxcJhtjGLmnRvqQC2KuL7yijKZFLD7pS13W2ze
yAx3Yz+JC0glQOfX1w9GA93YkYKpaUKlDQsrwrg4HrroytYSBATAe68UsU5MgfFOvCqDhUzV
E+uoLmBSWDpJEVLrJLYFGWGNY563/SXnMJYYYx+mBuLW+KhY63jenPTmZ5UwCzSH2ext/TN2
6iONLCbziM25SSzhy2bRldX2CANJkqQ1rKo+SS31iyOJsnUEq34Oulq5nuwKvk0iNoH2NsAv
9MbTTeQCJq6shjzz8fbmp5ntE9hg3hjZ30erQiIwQSLLz7Ra7QUiF7D3iEfhsYkRYUSjk8rN
8+719uHgOwgLT1bQ7Q3HrEDQKrCvERJVYJOFCFhFmESwLFLr7rO8HbJMs6Q2gx/kE1iUHquf
44uaxZFWoi5M/nBUGLA1vZ+cuJKITdS2FitJMHz0RLC5xZbdAlb0zOxCgegdeSjt22jNqUSB
o3M9RBSo/KC3AJHPkz6uRWSmzBlqxS/SBV56jJ0RyT965Y5qq88Aho6MWedQVsuLmTzDAQ/D
drIK0Wkq88APfgwFrA73zw9nZ6df/zg6NNExfAKal5NPX+wHB8yXMOaLZUZauDM2i4NDchxo
+Ox0qmHO+WGTmAe6DuYoiAkOxj4zc3Ac+zokE+/y+TP/rW2ir2/18dXMqGNjTkNT8fVT6IW/
nnwNTcWXE/ddQN9Dtuq5E2Pr2aPj4FAA5XwWSsQa6orbZU38cehB/izApAh9TY0/tYepwZ95
8JfQQPjs4tY7cm5oi+CE7/PIGeKqTM/6moF1NgzTONdlbpdT1IhYYHmywIgkAWheXV36bcZ1
GbVpoNmrOs2yyYYXkchMc3aAgxhf+eA0xoqQCYMourQNvHFgdG1Xr5yM5RZN1875XJFJxt+b
BBMJWZ5VFiwzQoaY7m5en9DN7aWoxpLA5k59hQrZBaae7T1FBtTpJoXNAhRfIAQFeMHtGrOx
1XGPrjt4LiE4d6VJ2g+KwBpOnyzBDAFLGq0LK/4k7tCk6JNcNOTOa+s0bn0CHzJ3jqxVQ2pP
5LV9lCyUVQPXRhYF6s8ObVVRa2REphvqy6hORAGviGYMKp6g74I1pVLLjPqFS8bpmKCRopUj
PSOmyyVqqcAmmD3AG0uRVabFxKLlUA///fxtf//v1+fd093D7e6Pn7tfj7unQ2aWmtyp3OuT
tGVeXgWMcE0TVWCr5nacu0+Fh/7TFFgishFtIJPQQIZma1KuCww7m/puuN7ta+FoBS4UH1n+
goXsP10UEZZXZa+uaCqsgGWwZmrdkMPc+iJqoI2+imvM8H9+ZKUSj+jUJ3MyYlgExYKlMSia
dCSxO9d664A93N9t/3je/zi0+9B0oK+Cir+M+ONBjvL4lLuRyVGempFbLsH54fPPLVA441rX
eBZZlSDa+bKwSASKd8LQGBTAkXWUNs7kaCjlscJ7T1ZmDhph2pBcWJJ44ITbpeEKgh89GjCg
0Xddap2BESpJpIHDpu1XczGKvsjYzICzzw9/be9vMYr7A/7v9uE/9x9+b++28Gt7+7i///C8
/b6DBve3H7CW1w/cET58e/x+KDeJ1e7pfvfr4Of26XZHx8fjZvGvseTqwf5+j8GZ+//dqgBy
bazEZMqg5d1fRhgrk7Z+ZTiW6lrUpb2+AAjiKl71RVkE2H6kAUGqO2KXoUXI9oV3klEaTxtx
mpTMvpHSNM0Cc6TR4Ske7nu4O/UwcbhDloO34un348vDwc3D0+7g4elAymvjWxAxvNNCppTg
wMc+HBYJC/RJm1WcVksroa+N8B9ZWlUCDKBPWls5NwcYS+hXVdYDD44kCg1+VVU+9aqq/BYw
uZJP6uX3t+F2sleJ6niHrf3gIGR04lGbajE/Oj7Lu8xDFF3GA7mRVPQ3PBb6w/BH1y5FETMN
BmqoaEZJ86F+SvX67df+5o+/d78PboixfzxtH3/+9vi5biKv/8RnKhFzwxFxwuvfI75hs0Fr
dJ00EdNuk7OFCNSkdfWlOD49PfrqjXJEYeIyPRXR68tPjNO62b7sbg/EPc0HxrP9Z//y8yB6
fn642RMq2b5svQmK49znjjhnRh0vQbuPjj/CnniFAcvhV4jEIsWSY4xkkAj4R1OkfdMIRk6I
C7N6+jCXywiE6aV+6RndPELN89l/pVnsT9185sNsr+AAZbM362H4zWT12oOVTHcVN66NkxVY
CRBxta7Z4229Ipf6KzBPj0ia4fe00keXG26FRwlYp23HG5R6TjBHiHeqvcRyw4Hvk0f+RCwl
0G18A5M21fmlUxtKxzzunl/8fuv40zHDGgSWR5A8kuMShMMnzZyqo974N7hfhT/BLItW4thn
Fgn3BbeCq/Xvjak9+piYyTlcjBqxv+KXTnF4zbNvrvWBgzCVol1/TO9ICVs3QCNPvcHkKSx2
keFff/vOE+sqkxYaYFxwghbAsAYawbmzRhqwNiQV1y6YD2EkPBl4hh8N7wIctoWpYeKR36xc
MO2uq1M254P5bXv67phBXPO5VAr3jz/t7GdaUPusB7C+ZVRD0ZjNehKk6GZpoJiNoqjjQE45
zfLl2q3dF6JRXDixu0aYODH1lQKNGPk4gJdbF8jL91Meh0llOmXrormB89cGQad7b1pGNCB0
6rFEcPsQQD/1IhFvTuuc/vqK8DK6ZgwErUlMKBlMj95yEYK7njJg60qm0mHhtDOGJkPTWPPl
dz8QHb85P03ONpGfeOw0LSBOfKYKd9oKn83bdYnrJAQPMaNGBybMRvef1lYJPpvGmlQphB7u
HjFmXV8ud3lwHnBSaf3ruvQ6OzvxFcvs2h84wJb+JnPdtIOhUW/vbx/uDorXu2+7J33VnR9p
VDRpH1d1wVYNU29Tzyg5TOevQMQEtCCJm1QkiERqtD7CA/6Vou9DYJhr5X8qtDDdzJIO6o3R
DGRBq3+gqAtuTzPRIL0u+STALjF6Ht4xKFGQaVzOMMbQKkijdFHcMNNi7vpOfu2/PW2ffh88
Pby+7O8ZzTZLZ/zWKU/tLwVRhHQ7A6ejhpmZMagm1gQQSVFqtBQieWO4EwapjX5j0CPh9LgT
ZgIRPmiaNRbROz86mhy1YR9NNDU1OZMtuMYwSxRQEAnFbgjLNcvmUXOV5wJPq+h8C8tdejZP
jBfgv5MT4JnSB2O6YHm14ubn7ubv/f0PI3aXAjiQjeJVljbD4dw4VI+C1gT+6/zw0Agyekev
uslZWkT1lQyDm+uVlQWXVJYWIqr7GkuT2tFJEQUUsueIoCRjCndjSevwe9Cfi7i66uc1xa2b
EskkyUQRwBai7bs2NQNcNGqeFgn8r4ZpmpmnNnFZJ1ZwfJ3moi+6fGZVd5InlVHmN0x1Q0ur
8KhGOWBifgzQi/NqEy8XdH5Vi7lDgY50LPAkU6dXWWq+6dAGsBtsZoW6jmqtxriPY9g7LNDR
Z5vCN0JhuG3X20+5ZjXa07oEMSsgiCBLYzG7OmMelZiQ/kQkUb0OHYlJCvh6fNe2zhPbv4z4
JFjavpchNhxh0h9gfvsiKXPj1UcU6DCUkd++P4hQDAB34dcoVWDPsk/rQDdi2kAo1wZoQyw1
6Eg8nB8JaE8MOYE5+s01gt3fysMxfCAFpZsfgfIFiiSNWKVYYaM697oCWLuEVcn0h3VwuAAR
hZ7Ff3mt2V9xfON+cZ1WLGJzzYItxdaCG/yn5YEZGqBQFI58GWU6WnjYTZoyTmFpw04Z1bWp
qqN4AMFiXiGRIKo1bQkchFt5Wwswx/pGFjwHKbowwxkIRyXho4qCCtyIRip7nyR134JdYMnQ
Zp2WbWY4yJA0NjtGQCVqEKsaIZ2Au+/b118veJ3yZf/j9eH1+eBOHrVtn3bbA0wL9T+GAkcH
3tcCW8JoIgyqNOvzanSDfqnZFXxjTlCYVEZDv0MNpXz0u00UsSX7cMKydFHkaOSeGdE/dAQd
rl6sv8JMFDFYG7URuNAsMslGhvBaing1hixYb1LBhDcrLAdOR6XcIKuury2uSS7MXS4rZ/Yv
RgoWmYre1W1m1xhWY44Ey2WDHsYlF80rLBg4Pl2mCV1Vga3eYntYCnohXSZN6S+vhWgxY0I5
T8z1Yj7Tt7S5Nw5n4zqp8F6Vdaw6oDp172Cedc1Sh0+5RBT7k8cOhmZ9HZmFLQiUiKpsHZhU
30AdwUTFH/9lXPx21C/7WF+rjQR9fNrfv/wtrz3f7Z5/+JFhpNqtaCIspQeBcZRlTmhRvKIL
Wv2sS7GMglX+k65/Yb2uDBS6bDix/RKkuOhS0Z6fDB9e1rL3WxgoMDxDDy4RWWSF62DB3DyN
ufB6jmIiBeZVPsMYkl7UNTzAZ2THFuA/0FxnZWOlqwjO+eA42f/a/fGyv1P69jOR3kj4k/+F
ZF/KtPVgeLGii4WdjGHENqAv8pedDKJkHdVzug1NJ3Z63oPvPT50EuiWkNwJRBUtkQVwhdDQ
+hnZFUMbiwQESlynFX/toobPQRdxrLLtGBRYwR6J1ybtGjhLESWyPBTwLittGhGjwowB9TmW
UKfW+7LIrvxXm5d0RbEr5CMky3HvC460KlO7HrJc2Ooyl3P57jIH86nboKSf+GByDGsRrSiT
OYhr/ibJe9mMmJJcZPsbLUSS3bfXH1RvMb1/fnl6xcxsBkPm0SKl6yS1UR/ZAA5BM9Jnc/7x
nyOOCiy21DSgfByeK3ew5wm0X+1ZaNy1MG9oH1zj/5kv11BwBRHkeMtvaoZ1S25QkrnzkDRf
AbeafeFv5oFx45g1UQEmTZG2qClEZtgG4czGJHEbOFKOjQZnWCPFtPhMJGmLHgn/4NtPNMt0
3vqjTNJLirjiY5iJpJz9hbe/UEWaoAIBzx/NSrQoAsfaauRauWJmjJ37MXIZI6GJZPqDx41Z
NJQQBCPbKbU2S4dWfZRWE+P0ynjFmYA1LWSAo8VN1LDaYNi3lhScAe6QrDqMaQtY6ZJERHV2
pVes/RLo/QCxCMKR5Flz/vnExne0F4OK16zOzz6yuCE/FaoyFoHES5safYRO380KRDt1fo65
4EJIqwHn7cfcWETKRmJJylqQ0VSCyIGnethL8Gaz256iIj2oK1YFRhyXdboIWAZqqBS4/lbP
sDN0Ah2VxULoTciiA0Owk1XmYHzEMg1VorM9uOq9FwUylkTzx7mSUF+gveQvGrxrd7ClMd4F
NCMzJBQvrWlTT4VQDo0ZGinqgGLTYppxe4eUrSCeTB5WvcB5Wxd2FhCCAu9iFUTWCTk23Fv+
NwmvS9isI8dHMAh1SbPe+ANdsxV8tZuwTbrcunMoIfJZ9hKubFUKUm//U2DTGnOGoykwrvWt
1skeqJtwI+4dCpaojjvSwEJjRXMbzE117T5EpU5+tDEw6BJN1s00qcUmhAjd3CWZrZgUTLwM
FCn/LTUm+IZSj+sax1PQgHRJFFKAfCdTfEojkK1d5n21aG3JqzE+hOKn3Es7A7KeTag21NE8
ixa8NHBH846Rp3XbRd5CD4BldSIKsHZRSpdF5ddj7RX6PtBTljnLT13bbgwKpR/bDgynFY7G
2OMjf48fETj5jrtFbuwS659NmVgsJQRz72FxMWGh8qIc9ZMkqZ0UENTGtHoyJ2V53DLY35jr
B5PQa1fj+ZGxrUoK3PC1nDk+PXWfb8mlKbNY4ppsTLebIuJVDjeCfhT/zvpapvVYnw2JDsqH
x+cPB5hb/vVR2jLL7f0P05MRYY1bsMtKK6GFBZYb7ChDJJK8RF17PkwDHsR0KIpbmALTPduU
89ZHDu8+XB8xCakP7uQrSKxG+XH8wnWi8NK5hwMGKWPvHwaVHhsrvxDVLzHZEylsxjJRl3A0
apiXk7OP3DuOhG+/okPrvuH6QupmiR0sRywm34nlomnOkHciwfi9fUWLl1E1pLwmljO+MQFt
fwvBaEsxPT1c2640xTlcCVE5ioc8SMV46FGd+q/nx/09xkjD29y9vuz+2cE/di83f/75538b
Z6yYsoXaXqDMGFNXaJauy0s2g4tE1NFaNlHA3PLaEKHxZT1FCM8gW7ERnojWdVs9ic+Tr9cS
A1t1ubZvUaqe1o3IvcdoYI74pTt/ovIAeC7YnB+dumDycDUK+9nFyq1buTiJ5OsUCXloJd2J
11EK6k8W1f1FJzrd2rHLHoo6qGhI5R3mSQhrsY9PIxNQ1I5S/DilhyYO5AGeB0g99m5YecOn
YBTHJp5bj3GeiCaRza8jkPd6KY3O6v8Hi+sm5dzCBkCayvhlbXhf5KnLIP4zo8vafC/y8eE1
sa7AiERY7tJ8nNCKVnI/fJsCLAhQHRumACcJq7+lEXW7fdkeoPV0g4EXnreXgjZ8ywfBYZ10
4U4HpUlKrbgFqS33ZNDEJVnFTvbqyWG6I4prmD2s425n8pdReHHHmndSDNmVnwdgH3hFnnnx
gQY0Og7uPDF0hTgw8oznmO6QCNVR8hoP++Dxkd0M8RXLEYgVF81Eqh97dhzxeKFU1JqUYkNf
hCGp4urySFanvTTEH0CL+KotDZFIQXTG4Y23ZxSUGBxQhqpDauXg657GLuqoWvI0+sxlSOwX
RvbrtF3iUV/zDjKVTQqPqN5DHtVeqwqdk/kJ3WLkj0OCKZOIAZBSOb+cRjAe0z2WBEGAhymq
aQcZq65cpBxNbO+iGODllT6lwlJEb4V/ISuITaty4XpfowKzP4fVXl/wr+O1pwBccqy5x/nG
Ok4TmIFlnB59+npCR9fK3ht3FbI/2PIto3VJeS1T5YoXiSnR0ZGmKMxmKUm3gfME0j9nnzmB
5G8r/gKR3lF18tg1xuk0hkUrHy2pu13FPxVoK5ktAg9QgsFNYt4/UxplNqOTZ4ev8jwt3eU9
RsbAKDEaJUFBMOUvxrpn5JD9uGFTvxt4+8xxQEiH73Tjweve6lyVjnnRbghcQqnCufZkC3pV
Og3Ttw3Hq8lZojOgyt6eyJhFXWzidLkr1piwru5LNvpoQLtHg8OWYPOnearf7p5fUH1C2ybG
KuXbH0ZxCDK1DSufBqvciC7YdmJKmNhIh4Cr/Uksyb+AXqkVDDwpp7oZf8nTVEPq5DyR2U8h
WlixPB13tEpWqtnXKJeiNGuyiHeBIVL6eD3vsUFjtc2mZ7EbnKPy/K629OnilNxbxaV5j1a6
h5qoALCSU5Xj6C8veQUE9haMbWmllUfXF0IdY/goyEv38ysQq71M8qWXBkGGpPwfv2ioBItE
AgA=

--VbJkn9YxBvnuCH5J--
