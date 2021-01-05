Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9402EAB48
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 13:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B1E88635;
	Tue,  5 Jan 2021 12:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4677588635
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 12:55:51 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105CsOBW016575;
 Tue, 5 Jan 2021 12:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=GLHtRmN6hFIBpTUVlf/k2GwQRMBl3Op1cINYVzdqx70=;
 b=WBzxtZtG2KXdU8gZb5Fmf0P3nBPYqMk1+U/GZxjd3XP7LqxBelirwCpQ34pqSH6sai/m
 PL6GQULUZ+nsNdtmo1I/7l2rJWP3K5sRkQrj/IlfvsObq1cTko+F5rc16ksPeIxIp1Tw
 DLVlDQisZjLPVHKM+AMnanPxSicylhzWwRPI9CmxcKZLdi25zFUM5gqNpSR5cO0JnYpY
 YL1JS2xMB7j0pPXuw56qfGfpaY1kqidInD2TBXCb1LrVwg1h4AgEPTPOPgkFEHQ/vHx5
 tBVFcr8Zik2vS1fOMf+dpuwasqU4tbyPotxyFqnQZ2XEHR+og1viUpxrHGlyDGANL+ma oA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35tg8r0mtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 12:55:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105CskTG149692;
 Tue, 5 Jan 2021 12:55:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 35v1f8j9k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 12:55:42 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105CtYuR028656;
 Tue, 5 Jan 2021 12:55:34 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 12:54:03 +0000
Date: Tue, 5 Jan 2021 15:51:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Zhan Liu <zhan.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, Nikola.Cornij@amd.com,
 Stylon.Wang@amd.com, Chao-kai.Wang@amd.com,
 dri-devel@lists.freedesktop.org, Nicholas.Kazlauskas@amd.com,
 bas@basnieuwenhuizen.nl
Subject: Re: [PATCH v2] drm/amdgpu: Do not change amdgpu framebuffer format
 during page flip
Message-ID: <20210105125154.GD2809@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="FfX2iGK5t5ehHnsE"
Content-Disposition: inline
In-Reply-To: <20201229211044.109020-1-zhan.liu@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050080
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
Cc: kbuild-all@lists.01.org, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FfX2iGK5t5ehHnsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhan,

url:    https://github.com/0day-ci/linux/commits/Zhan-Liu/drm-amdgpu-Do-not-change-amdgpu-framebuffer-format-during-page-flip/20201230-051134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dea8dcf2a9fa8cc540136a6cd885c3beece16ec3
config: x86_64-randconfig-m031-20201229 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:831 convert_tiling_flags_to_modifier() warn: variable dereferenced before check 'afb->base.format' (see line 826)

vim +831 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  678  static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  679  {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  680  	struct amdgpu_device *adev = drm_to_adev(afb->base.dev);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  681  	uint64_t modifier = 0;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  682  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  683  	if (!afb->tiling_flags || !AMDGPU_TILING_GET(afb->tiling_flags, SWIZZLE_MODE)) {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  684  		modifier = DRM_FORMAT_MOD_LINEAR;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  685  	} else {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  686  		int swizzle = AMDGPU_TILING_GET(afb->tiling_flags, SWIZZLE_MODE);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  687  		bool has_xor = swizzle >= 16;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  688  		int block_size_bits;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  689  		int version;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  690  		int pipe_xor_bits = 0;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  691  		int bank_xor_bits = 0;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  692  		int packers = 0;
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  693  		int rb = 0;
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  694  		int pipes = ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  695  		uint32_t dcc_offset = AMDGPU_TILING_GET(afb->tiling_flags, DCC_OFFSET_256B);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  696  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  697  		switch (swizzle >> 2) {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  698  		case 0: /* 256B */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  699  			block_size_bits = 8;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  700  			break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  701  		case 1: /* 4KiB */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  702  		case 5: /* 4KiB _X */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  703  			block_size_bits = 12;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  704  			break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  705  		case 2: /* 64KiB */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  706  		case 4: /* 64 KiB _T */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  707  		case 6: /* 64 KiB _X */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  708  			block_size_bits = 16;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  709  			break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  710  		default:
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  711  			/* RESERVED or VAR */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  712  			return -EINVAL;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  713  		}
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  714  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  715  		if (adev->asic_type >= CHIP_SIENNA_CICHLID)
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  716  			version = AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  717  		else if (adev->family == AMDGPU_FAMILY_NV)
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  718  			version = AMD_FMT_MOD_TILE_VER_GFX10;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  719  		else
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  720  			version = AMD_FMT_MOD_TILE_VER_GFX9;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  721  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  722  		switch (swizzle & 3) {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  723  		case 0: /* Z microtiling */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  724  			return -EINVAL;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  725  		case 1: /* S microtiling */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  726  			if (!has_xor)
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  727  				version = AMD_FMT_MOD_TILE_VER_GFX9;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  728  			break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  729  		case 2:
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  730  			if (!has_xor && afb->base.format->cpp[0] != 4)
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  731  				version = AMD_FMT_MOD_TILE_VER_GFX9;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  732  			break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  733  		case 3:
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  734  			break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  735  		}
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  736  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  737  		if (has_xor) {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  738  			switch (version) {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  739  			case AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS:
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  740  				pipe_xor_bits = min(block_size_bits - 8, pipes);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  741  				packers = min(block_size_bits - 8 - pipe_xor_bits,
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  742  					      ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs));
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  743  				break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  744  			case AMD_FMT_MOD_TILE_VER_GFX10:
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  745  				pipe_xor_bits = min(block_size_bits - 8, pipes);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  746  				break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  747  			case AMD_FMT_MOD_TILE_VER_GFX9:
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  748  				rb = ilog2(adev->gfx.config.gb_addr_config_fields.num_se) +
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  749  				     ilog2(adev->gfx.config.gb_addr_config_fields.num_rb_per_se);
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  750  				pipe_xor_bits = min(block_size_bits - 8, pipes +
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  751  						    ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  752  				bank_xor_bits = min(block_size_bits - 8 - pipe_xor_bits,
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  753  						    ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  754  				break;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  755  			}
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  756  		}
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  757  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  758  		modifier = AMD_FMT_MOD |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  759  			   AMD_FMT_MOD_SET(TILE, AMDGPU_TILING_GET(afb->tiling_flags, SWIZZLE_MODE)) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  760  			   AMD_FMT_MOD_SET(TILE_VERSION, version) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  761  			   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  762  			   AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  763  			   AMD_FMT_MOD_SET(PACKERS, packers);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  764  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  765  		if (dcc_offset != 0) {
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  766  			bool dcc_i64b = AMDGPU_TILING_GET(afb->tiling_flags, DCC_INDEPENDENT_64B) != 0;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  767  			bool dcc_i128b = version >= AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS;
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  768  			const struct drm_format_info *format_info;
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  769  			u64 render_dcc_offset;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  770  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  771  			/* Enable constant encode on RAVEN2 and later. */
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  772  			bool dcc_constant_encode = adev->asic_type > CHIP_RAVEN ||
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  773  						   (adev->asic_type == CHIP_RAVEN &&
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  774  						    adev->external_rev_id >= 0x81);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  775  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  776  			int max_cblock_size = dcc_i64b ? AMD_FMT_MOD_DCC_BLOCK_64B :
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  777  					      dcc_i128b ? AMD_FMT_MOD_DCC_BLOCK_128B :
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  778  					      AMD_FMT_MOD_DCC_BLOCK_256B;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  779  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  780  			modifier |= AMD_FMT_MOD_SET(DCC, 1) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  781  				    AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, dcc_constant_encode) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  782  				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, dcc_i64b) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  783  				    AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, dcc_i128b) |
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  784  				    AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, max_cblock_size);
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  785  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  786  			afb->base.offsets[1] = dcc_offset * 256 + afb->base.offsets[0];
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  787  			afb->base.pitches[1] =
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  788  				AMDGPU_TILING_GET(afb->tiling_flags, DCC_PITCH_MAX) + 1;
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  789  
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  790  			/*
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  791  			 * If the userspace driver uses retiling the tiling flags do not contain
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  792  			 * info on the renderable DCC buffer. Luckily the opaque metadata contains
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  793  			 * the info so we can try to extract it. The kernel does not use this info
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  794  			 * but we should convert it to a modifier plane for getfb2, so the
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  795  			 * userspace driver that gets it doesn't have to juggle around another DCC
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  796  			 * plane internally.
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  797  			 */
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  798  			if (extract_render_dcc_offset(adev, afb->base.obj[0],
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  799  						      &render_dcc_offset) == 0 &&
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  800  			    render_dcc_offset != 0 &&
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  801  			    render_dcc_offset != afb->base.offsets[1] &&
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  802  			    render_dcc_offset < UINT_MAX) {
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  803  				uint32_t dcc_block_bits;  /* of base surface data */
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  804  
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  805  				modifier |= AMD_FMT_MOD_SET(DCC_RETILE, 1);
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  806  				afb->base.offsets[2] = render_dcc_offset;
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  807  
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  808  				if (adev->family >= AMDGPU_FAMILY_NV) {
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  809  					int extra_pipe = 0;
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  810  
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  811  					if (adev->asic_type >= CHIP_SIENNA_CICHLID &&
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  812  					    pipes == packers && pipes > 1)
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  813  						extra_pipe = 1;
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  814  
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  815  					dcc_block_bits = max(20, 16 + pipes + extra_pipe);
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  816  				} else {
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  817  					modifier |= AMD_FMT_MOD_SET(RB, rb) |
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  818  						    AMD_FMT_MOD_SET(PIPE, pipes);
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  819  					dcc_block_bits = max(20, 18 + rb);
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  820  				}
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  821  
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  822  				dcc_block_bits -= ilog2(afb->base.format->cpp[0]);
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  823  				afb->base.pitches[2] = ALIGN(afb->base.width,
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  824  							     1u << ((dcc_block_bits + 1) / 2));
1331e6304f5d924a Bas Nieuwenhuizen 2020-11-11  825  			}
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11 @826  			format_info = amdgpu_lookup_format_info(afb->base.format->format,
                                                                                                                ^^^^^^^^^^^^^^^^^^
Dereferenced here

816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  827  								modifier);
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  828  			if (!format_info)
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  829  				return -EINVAL;
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  830  
0a6703fd10d106b3 Zhan Liu          2020-12-29 @831  			if (!afb->base.format)
                                                                            ^^^^^^^^^^^^^^^^^
New NULL check is too late.

816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  832  				afb->base.format = format_info;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  833  		}
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  834  	}
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  835  
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  836  	afb->base.modifier = modifier;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  837  	afb->base.flags |= DRM_MODE_FB_MODIFIERS;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  838  	return 0;
08d769151dc9690a Bas Nieuwenhuizen 2020-09-02  839  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--FfX2iGK5t5ehHnsE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--FfX2iGK5t5ehHnsE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--FfX2iGK5t5ehHnsE--
