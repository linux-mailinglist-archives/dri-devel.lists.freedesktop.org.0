Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE3172A98C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 08:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ECF10E15E;
	Sat, 10 Jun 2023 06:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC9410E15E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 06:58:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so25938975e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 23:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686380332; x=1688972332;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e9bI4TpfYTuixB7ED0KYBY4FcJI9PZZMgv8pSr2aH3M=;
 b=ktk+OOiFo7y2oE6/na7khsO5gkmjLhvfQyA0EZMqfbo4CV74/0m+h+R1SGNRxs9CTE
 2yvTMkh86LdEZQuRdF6t15kC2lNOXA2N9E5BCk/3HNELis0QmvHpX4KX0OIopAnHH1d2
 eT0J/NpU8rMruJQW2OGotX63X0vwFeFga3lPuTNP3jje/0Zs8n7VVArsTQHK7Ou8ZKrb
 3MGacSRmLXPf6gIcrQ6YFikrzaCSA/86Y7nLnwqXU3hNZwAcnAW0nLPCO/92VgkAKGln
 kYAixt0rqWx0EaoCwFvvTA/ou4yxeGUDa0YIZeBhoFZTikTjAN12CYgtUqY0NaAhPkQl
 J8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686380332; x=1688972332;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9bI4TpfYTuixB7ED0KYBY4FcJI9PZZMgv8pSr2aH3M=;
 b=js2da7OdBpJkLzyIckNfYAad/UAD5u0KzS6olTIBfeTuh99940xaEktdpWxQVDD2ZJ
 mcfeVrEUQGtgkzik6MOSGEzLNVsczpCH0hA3P2WzAiMFI4Wz9S1myC8lno5C/mqoIAtU
 VGY1HzLMA08FGqPCmupULaWni60IbbIOcZ6096C7ZpUHuEfi4CrErM4ubosINVrfY/3G
 5HIrjL/EByZl/JDY24r3IRAJ7eLHWKQrPHObUr+GnZu3sPB5WUyPSV235oPdfqVeRYKu
 VAsdhEVHHdXJYNSgrQXlRZXkTPIgfFeuNiGwqCyDck3YPZeDqnQ0lzZYS2V5LHFF2l2n
 nzkg==
X-Gm-Message-State: AC+VfDwOOFijcxMJRoStQzLXwNa2zRIVy+I0B1lClCw+ONXfZnWWxt6a
 CfkaGfZjLrWAEHC8VzRyxrxXWQ==
X-Google-Smtp-Source: ACHHUZ5CFVVyWp0cl9cTLVvzZxbKBRL/XTzzDb/STeOX/4dCnVkLgxjoBwzkievraVyTqF2fUIrnMA==
X-Received: by 2002:a7b:c84c:0:b0:3f7:371a:ec8f with SMTP id
 c12-20020a7bc84c000000b003f7371aec8fmr2775426wml.15.1686380331895; 
 Fri, 09 Jun 2023 23:58:51 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f3-20020a7bc8c3000000b003f1958eeadcsm4702848wml.17.2023.06.09.23.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 23:58:50 -0700 (PDT)
Date: Sat, 10 Jun 2023 09:58:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Subject: Re: [PATCH v5 11/11] drm/mediatek: gamma: Program gamma LUT type for
 descending or rising
Message-ID: <cbe9008e-aebc-4dcc-9116-123b541c6574@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601121022.2401844-12-angelogioacchino.delregno@collabora.com>
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
Cc: lkp@intel.com, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 wenst@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230601-222357
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230601121022.2401844-12-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v5 11/11] drm/mediatek: gamma: Program gamma LUT type for descending or rising
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101458.lRXHEE0Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306101458.lRXHEE0Z-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mediatek/mtk_disp_gamma.c:192 mtk_gamma_set_common() error: we previously assumed 'gamma->data' could be null (see line 120)

vim +192 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

4873468a82b553 Jason-JH.Lin               2023-06-01  103  void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
69a4237ab1d13a Yongqiang Niu              2021-01-29  104  {
4873468a82b553 Jason-JH.Lin               2023-06-01  105  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  106  	void __iomem *lut0_base = regs + DISP_GAMMA_LUT;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  107  	void __iomem *lut1_base = regs + DISP_GAMMA_LUT1;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  108  	u32 cfg_val, data_mode, lbank_val, word[2];
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  109  	int cur_bank, num_lut_banks;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  110  	u16 lut_bank_size, lut_size;
69a4237ab1d13a Yongqiang Niu              2021-01-29  111  	struct drm_color_lut *lut;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  112  	unsigned int i;
4873468a82b553 Jason-JH.Lin               2023-06-01  113  	bool lut_diff;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  114  	u8 lut_bits;
69a4237ab1d13a Yongqiang Niu              2021-01-29  115  
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  116  	/* If there's no gamma lut there's nothing to do here. */
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  117  	if (!state->gamma_lut)
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  118  		return;
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  119  
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01 @120  	if (gamma && gamma->data) {
                                                                             ^^^^^^^^^^^
This code assumes "gamma->data" can be NULL

4873468a82b553 Jason-JH.Lin               2023-06-01  121  		lut_diff = gamma->data->lut_diff;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  122  		lut_bank_size = gamma->data->lut_bank_size;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  123  		lut_bits = gamma->data->lut_bits;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  124  		lut_size = gamma->data->lut_size;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  125  	} else {
4873468a82b553 Jason-JH.Lin               2023-06-01  126  		lut_diff = false;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  127  		lut_bank_size = LUT_SIZE_DEFAULT;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  128  		lut_bits = LUT_BITS_DEFAULT;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  129  		lut_size = LUT_SIZE_DEFAULT;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  130  	}
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  131  	num_lut_banks = lut_size / lut_bank_size;
4873468a82b553 Jason-JH.Lin               2023-06-01  132  
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  133  	cfg_val = readl(regs + DISP_GAMMA_CFG);
69a4237ab1d13a Yongqiang Niu              2021-01-29  134  	lut = (struct drm_color_lut *)state->gamma_lut->data;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  135  
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  136  	/* Switch to 12 bits data mode if supported */
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  137  	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  138  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  139  	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  140  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  141  		/* Switch gamma bank and set data mode before writing LUT */
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  142  		if (num_lut_banks > 1) {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  143  			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  144  			lbank_val |= data_mode;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  145  			writel(lbank_val, regs + DISP_GAMMA_BANK);
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  146  		}
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  147  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  148  		for (i = 0; i < lut_bank_size; i++) {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  149  			int n = (cur_bank * lut_bank_size) + i;
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  150  			struct drm_color_lut diff, hwlut;
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  151  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  152  			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  153  			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  154  			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  155  
ba99d08da6adec Yongqiang Niu              2022-04-28  156  			if (!lut_diff || (i % 2 == 0)) {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  157  				if (lut_bits == 12) {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  158  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  159  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  160  					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  161  				} else {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  162  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  163  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  164  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  165  				}
ba99d08da6adec Yongqiang Niu              2022-04-28  166  			} else {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  167  				diff.red = lut[n].red - lut[n - 1].red;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  168  				diff.red = drm_color_lut_extract(diff.red, lut_bits);
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  169  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  170  				diff.green = lut[n].green - lut[n - 1].green;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  171  				diff.green = drm_color_lut_extract(diff.green, lut_bits);
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  172  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  173  				diff.blue = lut[n].blue - lut[n - 1].blue;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  174  				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
ba99d08da6adec Yongqiang Niu              2022-04-28  175  
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  176  				if (lut_bits == 12) {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  177  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  178  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  179  					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  180  				} else {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  181  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  182  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  183  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  184  				}
ba99d08da6adec Yongqiang Niu              2022-04-28  185  			}
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  186  			writel(word[0], (lut0_base + i * 4));
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  187  			if (lut_bits == 12)
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  188  				writel(word[1], (lut1_base + i * 4));
69a4237ab1d13a Yongqiang Niu              2021-01-29  189  		}
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  190  	}
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  191  
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01 @192  	if (gamma && !gamma->data->has_dither) {
                                                                              ^^^^^^^^^^^^^
"gamma->data" is derefrenced without being checked.

3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  193  		/* Descending or Rising LUT */
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  194  		if (mtk_gamma_lut_is_descending(lut, lut_size))
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  195  			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  196  		else
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  197  			cfg_val &= ~GAMMA_LUT_TYPE;
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  198  	}
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  199  
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  200  	/* Enable the gamma table */
2979ceb320a4ed AngeloGioacchino Del Regno 2023-06-01  201  	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  202  
e21d98027e50c8 AngeloGioacchino Del Regno 2023-06-01  203  	/* Disable RELAY mode to pass the processed image */
e21d98027e50c8 AngeloGioacchino Del Regno 2023-06-01  204  	cfg_val &= ~GAMMA_RELAY_MODE;
e21d98027e50c8 AngeloGioacchino Del Regno 2023-06-01  205  
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  206  	writel(cfg_val, regs + DISP_GAMMA_CFG);
69a4237ab1d13a Yongqiang Niu              2021-01-29  207  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

