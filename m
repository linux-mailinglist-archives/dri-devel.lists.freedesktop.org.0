Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC7599A34
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 12:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFDA10E7F3;
	Fri, 19 Aug 2022 10:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFA010E7F3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 10:56:14 +0000 (UTC)
X-UUID: 5e17bc9058d44490bc53c5764dd02778-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ePRfPrpH4WR7prrT+SaXlzw5Ara2s6DDwopUNxCkEs8=; 
 b=hxMW/uZFE3zqfnM1x12m4XL1JckbeH3Cdom+jCq0Dk0LBkcP89vIq+drCtJaNuQntfXtDIM8f9XSxybI4plhVMlf/yWjuLwhf4BRIIB66Lm4c8d65I9VvoUviWel27eJnnLHhry1dn3T51WET/rnmIfzsarhRcB2NSv21t/KLYY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6849e83e-be75-4431-9672-1d11d667c55b, OB:10,
 LOB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Rele
 ase_Ham,ACTION:release,TS:68
X-CID-INFO: VERSION:1.1.10, REQID:6849e83e-be75-4431-9672-1d11d667c55b, OB:10,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_G
 S981B3D,ACTION:quarantine,TS:68
X-CID-META: VersionHash:84eae18, CLOUDID:309335c9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:29a68d1a1959,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: 5e17bc9058d44490bc53c5764dd02778-20220819
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 737186348; Fri, 19 Aug 2022 18:56:09 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 18:56:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 19 Aug 2022 18:56:07 +0800
Message-ID: <472360928cc6440d05d5e01a5b5d6172a9eea2c9.camel@mediatek.com>
Subject: Re: [PATCH v26 2/7] drm/mediatek: add ETHDR support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
 <nfraprado@collabora.com>
Date: Fri, 19 Aug 2022 18:56:07 +0800
In-Reply-To: <202208191837.iIwHfovs-lkp@intel.com>
References: <20220819061456.8042-3-nancy.lin@mediatek.com>
 <202208191837.iIwHfovs-lkp@intel.com>
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
 David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for testing.
This series need to based on another mmsys series [1].
All the implicit-function-declaration functions are newly added in [2].

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=669098
[2]
https://patchwork.kernel.org/project/linux-mediatek/patch/20220819061011.7672-6-nancy.lin@mediatek.com/

Thanks,
Nancy


On Fri, 2022-08-19 at 18:14 +0800, kernel test robot wrote:
> Hi "Nancy.Lin",
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on drm-misc/drm-misc-next]
> [cannot apply to robh/for-next mbgg-mediatek/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> 
https://urldefense.com/v3/__https://git-scm.com/docs/git-format-patch*_base_tree_information__;Iw!!CTRNKA9wMg0ARbw!wNjl5G7qt3vY_FW8w5Hhk8DfDRqU7QQLd0xm_MUAT7uF23DX0MvmaNio_hpgE9hK$
>  ]
> 
> url:    
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commits/Nancy-Lin/Add-MediaTek-SoC-DRM-vdosys1-support-for-mt8195/20220819-142314__;!!CTRNKA9wMg0ARbw!wNjl5G7qt3vY_FW8w5Hhk8DfDRqU7QQLd0xm_MUAT7uF23DX0MvmaNio_i9pzMeG$
>  
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> config: arm-allyesconfig (
> https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20220819/202208191837.iIwHfovs-lkp@intel.com/config__;!!CTRNKA9wMg0ARbw!wNjl5G7qt3vY_FW8w5Hhk8DfDRqU7QQLd0xm_MUAT7uF23DX0MvmaNio_vxbrlxE$
>  )
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget 
> https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!CTRNKA9wMg0ARbw!wNjl5G7qt3vY_FW8w5Hhk8DfDRqU7QQLd0xm_MUAT7uF23DX0MvmaNio_kKzkkvN$
>   -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commit/ec3724f819412feab6e61118e61e574a86aa4dc0__;!!CTRNKA9wMg0ARbw!wNjl5G7qt3vY_FW8w5Hhk8DfDRqU7QQLd0xm_MUAT7uF23DX0MvmaNio_sBdpge9$
>  
>         git remote add linux-review 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux__;!!CTRNKA9wMg0ARbw!wNjl5G7qt3vY_FW8w5Hhk8DfDRqU7QQLd0xm_MUAT7uF23DX0MvmaNio_iv3Tqqs$
>  
>         git fetch --no-tags linux-review Nancy-Lin/Add-MediaTek-SoC-
> DRM-vdosys1-support-for-mt8195/20220819-142314
>         git checkout ec3724f819412feab6e61118e61e574a86aa4dc0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0
> make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/gpu/drm/mediatek/mtk_ethdr.c: In function
> 'mtk_ethdr_layer_config':
> > > drivers/gpu/drm/mediatek/mtk_ethdr.c:171:9: error: implicit
> > > declaration of function 'mtk_mmsys_mixer_in_config' [-
> > > Werror=implicit-function-declaration]
> 
>      171 |         mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx +
> 1, alpha_con ? false : true,
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/mediatek/mtk_ethdr.c: In function
> 'mtk_ethdr_config':
> > > drivers/gpu/drm/mediatek/mtk_ethdr.c:232:9: error: implicit
> > > declaration of function 'mtk_mmsys_hdr_confing'; did you mean
> > > 'mtk_mmsys_ddp_connect'? [-Werror=implicit-function-declaration]
> 
>      232 |         mtk_mmsys_hdr_confing(priv->mmsys_dev, w / 2, h,
> cmdq_pkt);
>          |         ^~~~~~~~~~~~~~~~~~~~~
>          |         mtk_mmsys_ddp_connect
> > > drivers/gpu/drm/mediatek/mtk_ethdr.c:233:9: error: implicit
> > > declaration of function 'mtk_mmsys_mixer_in_channel_swap' [-
> > > Werror=implicit-function-declaration]
> 
>      233 |         mtk_mmsys_mixer_in_channel_swap(priv->mmsys_dev,
> 4, 0, cmdq_pkt);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +/mtk_mmsys_mixer_in_config +171
> drivers/gpu/drm/mediatek/mtk_ethdr.c
> 
>    146	
>    147	void mtk_ethdr_layer_config(struct device *dev,
> unsigned int idx,
>    148				    struct mtk_plane_state
> *state,
>    149				    struct cmdq_pkt *cmdq_pkt)
>    150	{
>    151		struct mtk_ethdr *priv = dev_get_drvdata(dev);
>    152		struct mtk_ethdr_comp *mixer = &priv-
> >ethdr_comp[ETHDR_MIXER];
>    153		struct mtk_plane_pending_state *pending =
> &state->pending;
>    154		unsigned int offset = (pending->x & 1) << 31 |
> pending->y << 16 | pending->x;
>    155		unsigned int align_width = ALIGN_DOWN(pending-
> >width, 2);
>    156		unsigned int alpha_con = 0;
>    157	
>    158		dev_dbg(dev, "%s+ idx:%d", __func__, idx);
>    159	
>    160		if (idx >= 4)
>    161			return;
>    162	
>    163		if (!pending->enable) {
>    164			mtk_ddp_write(cmdq_pkt, 0, &mixer-
> >cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
>    165			return;
>    166		}
>    167	
>    168		if (state->base.fb && state->base.fb->format-
> >has_alpha)
>    169			alpha_con = MIXER_ALPHA_AEN |
> MIXER_ALPHA;
>    170	
>  > 171		mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx
> + 1, alpha_con ? false : true,
>    172					  DEFAULT_9BIT_ALPHA,
>    173					  pending->x & 1 ?
> MIXER_INX_MODE_EVEN_EXTEND :
>    174					  MIXER_INX_MODE_BYPASS
> , align_width / 2 - 1, cmdq_pkt);
>    175	
>    176		mtk_ddp_write(cmdq_pkt, pending->height << 16 |
> align_width, &mixer->cmdq_base,
>    177			      mixer->regs,
> MIX_L_SRC_SIZE(idx));
>    178		mtk_ddp_write(cmdq_pkt, offset, &mixer-
> >cmdq_base, mixer->regs, MIX_L_SRC_OFFSET(idx));
>    179		mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer-
> >cmdq_base, mixer->regs, MIX_L_SRC_CON(idx),
>    180				   0x1ff);
>    181		mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer-
> >cmdq_base, mixer->regs, MIX_SRC_CON,
>    182				   BIT(idx));
>    183	}
>    184	
>    185	void mtk_ethdr_config(struct device *dev, unsigned int
> w,
>    186			      unsigned int h, unsigned int
> vrefresh,
>    187			      unsigned int bpc, struct cmdq_pkt
> *cmdq_pkt)
>    188	{
>    189		struct mtk_ethdr *priv = dev_get_drvdata(dev);
>    190		struct mtk_ethdr_comp *vdo_fe0 = &priv-
> >ethdr_comp[ETHDR_VDO_FE0];
>    191		struct mtk_ethdr_comp *vdo_fe1 = &priv-
> >ethdr_comp[ETHDR_VDO_FE1];
>    192		struct mtk_ethdr_comp *gfx_fe0 = &priv-
> >ethdr_comp[ETHDR_GFX_FE0];
>    193		struct mtk_ethdr_comp *gfx_fe1 = &priv-
> >ethdr_comp[ETHDR_GFX_FE1];
>    194		struct mtk_ethdr_comp *vdo_be = &priv-
> >ethdr_comp[ETHDR_VDO_BE];
>    195		struct mtk_ethdr_comp *mixer = &priv-
> >ethdr_comp[ETHDR_MIXER];
>    196	
>    197		dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w,
> h);
>    198	
>    199		mtk_ddp_write(cmdq_pkt,
> HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe0->cmdq_base,
>    200			      vdo_fe0->regs,
> HDR_VDO_FE_0804_HDR_DM_FE);
>    201	
>    202		mtk_ddp_write(cmdq_pkt,
> HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe1->cmdq_base,
>    203			      vdo_fe1->regs,
> HDR_VDO_FE_0804_HDR_DM_FE);
>    204	
>    205		mtk_ddp_write(cmdq_pkt,
> HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe0->cmdq_base,
>    206			      gfx_fe0->regs,
> HDR_GFX_FE_0204_GFX_HDR_FE);
>    207	
>    208		mtk_ddp_write(cmdq_pkt,
> HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe1->cmdq_base,
>    209			      gfx_fe1->regs,
> HDR_GFX_FE_0204_GFX_HDR_FE);
>    210	
>    211		mtk_ddp_write(cmdq_pkt,
> HDR_VDO_BE_0204_BYPASS_ALL, &vdo_be->cmdq_base,
>    212			      vdo_be->regs,
> HDR_VDO_BE_0204_VDO_DM_BE);
>    213	
>    214		mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE,
> &mixer->cmdq_base, mixer->regs, MIX_FUNC_DCM0);
>    215		mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE,
> &mixer->cmdq_base, mixer->regs, MIX_FUNC_DCM1);
>    216		mtk_ddp_write(cmdq_pkt, h << 16 | w, &mixer-
> >cmdq_base, mixer->regs, MIX_ROI_SIZE);
>    217		mtk_ddp_write(cmdq_pkt, BGCLR_BLACK, &mixer-
> >cmdq_base, mixer->regs, MIX_ROI_BGCLR);
>    218		mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE,
> &mixer->cmdq_base, mixer->regs,
>    219			      MIX_L_SRC_CON(0));
>    220		mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE,
> &mixer->cmdq_base, mixer->regs,
>    221			      MIX_L_SRC_CON(1));
>    222		mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE,
> &mixer->cmdq_base, mixer->regs,
>    223			      MIX_L_SRC_CON(2));
>    224		mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE,
> &mixer->cmdq_base, mixer->regs,
>    225			      MIX_L_SRC_CON(3));
>    226		mtk_ddp_write(cmdq_pkt, 0x0, &mixer->cmdq_base, 
> mixer->regs, MIX_L_SRC_SIZE(0));
>    227		mtk_ddp_write(cmdq_pkt, OUTPUT_NO_RND |
> SOURCE_RGB_SEL | BACKGROUND_RELAY,
>    228			      &mixer->cmdq_base, mixer->regs,
> MIX_DATAPATH_CON);
>    229		mtk_ddp_write_mask(cmdq_pkt, MIX_SRC_L0_EN,
> &mixer->cmdq_base, mixer->regs,
>    230				   MIX_SRC_CON, MIX_SRC_L0_EN);
>    231	
>  > 232		mtk_mmsys_hdr_confing(priv->mmsys_dev, w / 2,
> h, cmdq_pkt);
>  > 233		mtk_mmsys_mixer_in_channel_swap(priv-
> >mmsys_dev, 4, 0, cmdq_pkt);
>    234	}
>    235	
> 

