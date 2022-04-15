Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5B650258D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 08:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845E710EF6C;
	Fri, 15 Apr 2022 06:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24B910EF6A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 06:27:51 +0000 (UTC)
X-UUID: 037575d748144b85a8b83871af7e718a-20220415
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3eab5806-633f-4f1d-9991-14a74b903715, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:27,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:27
X-CID-INFO: VERSION:1.1.4, REQID:3eab5806-633f-4f1d-9991-14a74b903715, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:27,FILE:0,RULE:Release_UHam,ACTI
 ON:release,TS:27
X-CID-META: VersionHash:faefae9, CLOUDID:6a1a3ba9-d103-4e36-82b9-b0e86991b3df,
 C
 OID:IGNORED,Recheck:0,SF:13|15|28|100|16|18|48|101,TC:nil,Content:0,EDM:-3
 ,File:nil,QS:0,BEC:nil
X-UUID: 037575d748144b85a8b83871af7e718a-20220415
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 297101346; Fri, 15 Apr 2022 14:27:46 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 14:27:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Apr 2022 14:27:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 14:27:44 +0800
Message-ID: <48380a5b06ce48c4538e6c89bc6399ba1f425718.camel@mediatek.com>
Subject: Re: [PATCH v18 07/10] drm/mediatek: add mediatek-drm of vdosys0
 support for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 15 Apr 2022 14:27:44 +0800
In-Reply-To: <202204142333.qXgcGMI1-lkp@intel.com>
References: <20220412103114.19922-8-jason-jh.lin@mediatek.com>
 <202204142333.qXgcGMI1-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, llvm@lists.linux.dev, roy-cw.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, hsinyi@chromium.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "kernel test robot",

Thanks for the reviews.

On Thu, 2022-04-14 at 23:31 +0800, kernel test robot wrote:
> Hi "jason-jh.lin",
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on drm/drm-next]
> [also build test WARNING on robh/for-next krzk/for-next linus/master
> v5.18-rc2 next-20220414]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> 
https://urldefense.com/v3/__https://git-scm.com/docs/git-format-patch__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaGS9DHJM$
>  ]
> 
> url:    
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commits/jason-jh-lin/Add-Mediatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaP5NY9rw$
>  
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: arm64-buildonly-randconfig-r001-20220413 (
> https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20220414/202204142333.qXgcGMI1-lkp@intel.com/config__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaMatHhNq$
>  )
> compiler: clang version 15.0.0 (
> https://urldefense.com/v3/__https://github.com/llvm/llvm-project__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaED4pz5K$
> $  6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
> reproduce (this is a W=1 build):
>         wget 
> https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaGF0WqUy$
>   -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commit/7c175317aa80bbc885609a730214448147a46b47__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaN_w7rr0$
>  
>         git remote add linux-review 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaMen_Lno$
>  
>         git fetch --no-tags linux-review jason-jh-lin/Add-Mediatek-
> Soc-DRM-vdosys0-support-for-mt8195/20220412-183359
>         git checkout 7c175317aa80bbc885609a730214448147a46b47
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/mediatek/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/mediatek/mtk_drm_drv.c:707:15: warning: cast to
> smaller integer type 'enum mtk_ddp_comp_type' from 'const void *' [-
> Wvoid-pointer-to-enum-cast]
>                    comp_type = (enum mtk_ddp_comp_type)of_id->data;
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I can't reproduce this build warning in my platform, but I'd found the 
same warning fixed patch: 20210928154620.11181-4-cgzones@googlemail.com

It should not be fixed at this series. So I'll fixed this warning in
another fixed patch.

> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:203:42: warning: unused
> > > variable 'mt2701_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt2701_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:218:42: warning: unused
> > > variable 'mt7623_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt7623_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:234:42: warning: unused
> > > variable 'mt2712_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt2712_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:246:42: warning: unused
> > > variable 'mt8167_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8167_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:260:42: warning: unused
> > > variable 'mt8173_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8173_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:274:42: warning: unused
> > > variable 'mt8183_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8183_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:288:42: warning: unused
> > > variable 'mt8192_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8192_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:305:42: warning: unused
> > > variable 'mt8195_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8195_mmsys_match_data =
> {

Oh, I forgot to replace the driver_data to match_data in mtk_drm_of_ids
table. I'll fix them at the next version.

Regards,
Jason-JH.Lin


