Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B5249179
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 01:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122DD89BAB;
	Tue, 18 Aug 2020 23:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D1889BAB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 23:37:25 +0000 (UTC)
IronPort-SDR: +k1KV6WpuCsRH1lsQtBgpuq1fnGusHpk0NFz57KLzSrKW2h8T87emU5ABmWF5/flIAeBcRH2xm
 r32FHSHJS0dA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="142650960"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
 d="gz'50?scan'50,208,50";a="142650960"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 16:37:24 -0700
IronPort-SDR: IO511sRUCjR+et0fen5vVUsDRTcC7aKFpNrpVyZR2U6cwtqcrPlNmj28RbL44yZho0+eS4BIE0
 eeDlwi5Emrcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
 d="gz'50?scan'50,208,50";a="400649538"
Received: from lkp-server02.sh.intel.com (HELO 2f0d8b563e65) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2020 16:37:21 -0700
Received: from kbuild by 2f0d8b563e65 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k8BAO-0001Rg-Lk; Tue, 18 Aug 2020 23:37:20 +0000
Date: Wed, 19 Aug 2020 07:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm: ast: fix double __iomem sparse warning
Message-ID: <202008190730.GmD3pGzZ%lkp@intel.com>
References: <a8185578-a69a-16b0-6fdf-f4e46bc4f61f@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <a8185578-a69a-16b0-6fdf-f4e46bc4f61f@infradead.org>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Randy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v5.9-rc1 next-20200818]
[cannot apply to linux/master drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Randy-Dunlap/drm-ast-fix-double-__iomem-sparse-warning/20200819-043022
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-s002-20200818 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-183-gaa6ede3b-dirty
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/ast/ast_cursor.c:42:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *vaddr @@     got void [noderef] __iomem * @@
>> drivers/gpu/drm/ast/ast_cursor.c:42:59: sparse:     expected void *vaddr
>> drivers/gpu/drm/ast/ast_cursor.c:42:59: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/ast/ast_cursor.c:80:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
>> drivers/gpu/drm/ast/ast_cursor.c:80:23: sparse:     expected void [noderef] __iomem *vaddr
>> drivers/gpu/drm/ast/ast_cursor.c:80:23: sparse:     got void *
   drivers/gpu/drm/ast/ast_cursor.c:98:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *vaddr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/ast/ast_cursor.c:98:59: sparse:     expected void *vaddr
   drivers/gpu/drm/ast/ast_cursor.c:98:59: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/ast/ast_cursor.c:126:19: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/ast/ast_cursor.c:126:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *dstxor @@     got unsigned char [usertype] * @@
>> drivers/gpu/drm/ast/ast_cursor.c:126:16: sparse:     expected unsigned char [noderef] [usertype] __iomem *dstxor
>> drivers/gpu/drm/ast/ast_cursor.c:126:16: sparse:     got unsigned char [usertype] *

# https://github.com/0day-ci/linux/commit/7e1ff39fdb33febec4c542a6be21c28b352eb588
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Randy-Dunlap/drm-ast-fix-double-__iomem-sparse-warning/20200819-043022
git checkout 7e1ff39fdb33febec4c542a6be21c28b352eb588
vim +42 drivers/gpu/drm/ast/ast_cursor.c

2ccebf561e4a902 Thomas Zimmermann 2020-07-02   34  
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   35  static void ast_cursor_fini(struct ast_private *ast)
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   36  {
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   37  	size_t i;
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   38  	struct drm_gem_vram_object *gbo;
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   39  
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   40  	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   41  		gbo = ast->cursor.gbo[i];
3e9d787371eaa84 Thomas Zimmermann 2020-07-02  @42  		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   43  		drm_gem_vram_unpin(gbo);
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   44  		drm_gem_vram_put(gbo);
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   45  	}
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   46  }
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   47  
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   48  static void ast_cursor_release(struct drm_device *dev, void *ptr)
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   49  {
365c0e70da83a52 Thomas Zimmermann 2020-07-30   50  	struct ast_private *ast = to_ast_private(dev);
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   51  
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   52  	ast_cursor_fini(ast);
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   53  }
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   54  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   55  /*
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   56   * Allocate cursor BOs and pins them at the end of VRAM.
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   57   */
beb2355eecbf67d Thomas Zimmermann 2020-07-02   58  int ast_cursor_init(struct ast_private *ast)
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   59  {
e0f5a738cfe572b Thomas Zimmermann 2020-07-30   60  	struct drm_device *dev = &ast->base;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   61  	size_t size, i;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   62  	struct drm_gem_vram_object *gbo;
0d384eec10ea723 Thomas Zimmermann 2020-07-02   63  	void __iomem *vaddr;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   64  	int ret;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   65  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   66  	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   67  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   68  	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   69  		gbo = drm_gem_vram_create(dev, size, 0);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   70  		if (IS_ERR(gbo)) {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   71  			ret = PTR_ERR(gbo);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   72  			goto err_drm_gem_vram_put;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   73  		}
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   74  		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   75  					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   76  		if (ret) {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   77  			drm_gem_vram_put(gbo);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   78  			goto err_drm_gem_vram_put;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   79  		}
0d384eec10ea723 Thomas Zimmermann 2020-07-02  @80  		vaddr = drm_gem_vram_vmap(gbo);
0d384eec10ea723 Thomas Zimmermann 2020-07-02   81  		if (IS_ERR(vaddr)) {
0d384eec10ea723 Thomas Zimmermann 2020-07-02   82  			ret = PTR_ERR(vaddr);
0d384eec10ea723 Thomas Zimmermann 2020-07-02   83  			drm_gem_vram_unpin(gbo);
0d384eec10ea723 Thomas Zimmermann 2020-07-02   84  			drm_gem_vram_put(gbo);
0d384eec10ea723 Thomas Zimmermann 2020-07-02   85  			goto err_drm_gem_vram_put;
0d384eec10ea723 Thomas Zimmermann 2020-07-02   86  		}
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   87  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   88  		ast->cursor.gbo[i] = gbo;
0d384eec10ea723 Thomas Zimmermann 2020-07-02   89  		ast->cursor.vaddr[i] = vaddr;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   90  	}
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   91  
3e9d787371eaa84 Thomas Zimmermann 2020-07-02   92  	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   93  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   94  err_drm_gem_vram_put:
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   95  	while (i) {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   96  		--i;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   97  		gbo = ast->cursor.gbo[i];
0d384eec10ea723 Thomas Zimmermann 2020-07-02   98  		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02   99  		drm_gem_vram_unpin(gbo);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  100  		drm_gem_vram_put(gbo);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  101  	}
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  102  	return ret;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  103  }
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  104  
932a62aa3bfd96e Thomas Zimmermann 2020-07-02  105  static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int height)
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  106  {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  107  	union {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  108  		u32 ul;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  109  		u8 b[4];
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  110  	} srcdata32[2], data32;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  111  	union {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  112  		u16 us;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  113  		u8 b[2];
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  114  	} data16;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  115  	u32 csum = 0;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  116  	s32 alpha_dst_delta, last_alpha_dst_delta;
932a62aa3bfd96e Thomas Zimmermann 2020-07-02  117  	u8 __iomem *dstxor;
932a62aa3bfd96e Thomas Zimmermann 2020-07-02  118  	const u8 *srcxor;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  119  	int i, j;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  120  	u32 per_pixel_copy, two_pixel_copy;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  121  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  122  	alpha_dst_delta = AST_MAX_HWC_WIDTH << 1;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  123  	last_alpha_dst_delta = alpha_dst_delta - (width << 1);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  124  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  125  	srcxor = src;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02 @126  	dstxor = (u8 *)dst + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  127  	per_pixel_copy = width & 1;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  128  	two_pixel_copy = width >> 1;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  129  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  130  	for (j = 0; j < height; j++) {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  131  		for (i = 0; i < two_pixel_copy; i++) {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  132  			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  133  			srcdata32[1].ul = *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  134  			data32.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  135  			data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  136  			data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  137  			data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  138  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  139  			writel(data32.ul, dstxor);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  140  			csum += data32.ul;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  141  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  142  			dstxor += 4;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  143  			srcxor += 8;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  144  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  145  		}
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  146  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  147  		for (i = 0; i < per_pixel_copy; i++) {
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  148  			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  149  			data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  150  			data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  151  			writew(data16.us, dstxor);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  152  			csum += (u32)data16.us;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  153  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  154  			dstxor += 2;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  155  			srcxor += 4;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  156  		}
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  157  		dstxor += last_alpha_dst_delta;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  158  	}
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  159  
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  160  	/* write checksum + signature */
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  161  	dst += AST_HWC_SIZE;
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  162  	writel(csum, dst);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  163  	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  164  	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  165  	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  166  	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  167  }
2ccebf561e4a902 Thomas Zimmermann 2020-07-02  168  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--7AUc2qLy4jB3hD7Z
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
6pB1uNfNaSEd3ElXUUL/Bw/cwfGEIQIA

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--7AUc2qLy4jB3hD7Z--
