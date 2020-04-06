Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3119F0F5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EE46E2CC;
	Mon,  6 Apr 2020 07:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1852F6E235
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:17:55 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n10so14689653iom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Db2gy0KwxZU6sZXsS+kywahq01i5euHIqRm2wacWELU=;
 b=bX8Cj6PIjykCfub7TcZYiQOt5ySTtCwdZUbZ633ovn2CvaO5FXWlClGVfqUjQOMlj4
 J+vh7kwySoGNg8ndT3TbkaSRCDeNtJYuK72xM+V8Nywkf+zjJnOENhFbtKuhtKYqGnzk
 Y4eDL7B4vptrlD4wfMFW+tkqcu0SUO7x4fYZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Db2gy0KwxZU6sZXsS+kywahq01i5euHIqRm2wacWELU=;
 b=GHWHYQdAjWwigi940/d0wqPkWpol+GO6I87KcJUTgvzkjWaIRS2LIRMLmP5XQdHqnN
 RHKwAp0kbxqDBYl0z9/ZImAd5SDZuJz6jRUa/gAcFKL7Trj0G+pjLToh3piH/OLXpqhr
 OtLq/yu4rvTWiItA9ReL3j2bSJR3JT8ebOfiU0QTzCfSP1nH++5aN2wqZ+kJ1C4TQrnb
 youBfkN5fJ2ucrCkdEYee5B5if1EYqs62OAF4rITYq8JqKPRKT1ny8Yyw2zbsOD0gnZ0
 Wlq63MQdFQJBJQJRTGz7BbdRHFYuz0rgBaIuOoPSWKcS0bX5Fv4a8N7qK5cjEJw6UfHc
 WxEg==
X-Gm-Message-State: AGi0Pub+0rGQ65m94iF9EgCzu9+h0duxGrEpZdyxgnDvs/c3qSFkM/N+
 rV4aaeaHjbZpTo+uQ4dcHVjsZlBZPxZ4cNuPxyTz+A==
X-Google-Smtp-Source: APiQypLuUn0LSyK8CCfaiS+KVBTl8I/x4LHlAvyF6y60LcZDxFlbQ4ZBQoOkRGvl73rolvlaiznrylL0WtJiMWVcamk=
X-Received: by 2002:a5d:944c:: with SMTP id x12mr18334175ior.100.1586157474266; 
 Mon, 06 Apr 2020 00:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200406051131.225748-1-hsinyi@chromium.org>
 <202004061558.qA9rRKbq%lkp@intel.com>
In-Reply-To: <202004061558.qA9rRKbq%lkp@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Apr 2020 15:17:28 +0800
Message-ID: <CAJMQK-ibjjMx0oNN1M8bg9+MxocdJP4zfcSojWQZJsGvnRh-7g@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: fix device passed to cmdq
To: kbuild test robot <lkp@intel.com>
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 kbuild-all@lists.01.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch depends on
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
branch v5.6-next/soc

On Mon, Apr 6, 2020 at 3:12 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Hsin-Yi,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on clk/clk-next]
> [cannot apply to arm-soc/for-next xlnx/master linus/master v5.6 next-20200405]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Hsin-Yi-Wang/drm-mediatek-fix-device-passed-to-cmdq/20200406-132804
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: arm64-randconfig-a001-20200406 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=9.3.0 make.cross ARCH=arm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c: In function 'mtk_drm_crtc_create':
> >> drivers/gpu/drm/mediatek/mtk_drm_crtc.c:824:29: error: 'struct mtk_drm_crtc' has no member named 'mmsys_dev'
>      824 |    cmdq_mbox_create(mtk_crtc->mmsys_dev,
>          |                             ^~
>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c:832:43: error: 'struct mtk_drm_crtc' has no member named 'mmsys_dev'
>      832 |  ret = of_property_read_u32_index(mtk_crtc->mmsys_dev->of_node,
>          |                                           ^~
>
> vim +824 drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>
>    724
>    725  int mtk_drm_crtc_create(struct drm_device *drm_dev,
>    726                          const enum mtk_ddp_comp_id *path, unsigned int path_len)
>    727  {
>    728          struct mtk_drm_private *priv = drm_dev->dev_private;
>    729          struct device *dev = drm_dev->dev;
>    730          struct mtk_drm_crtc *mtk_crtc;
>    731          unsigned int num_comp_planes = 0;
>    732          int pipe = priv->num_pipes;
>    733          int ret;
>    734          int i;
>    735          bool has_ctm = false;
>    736          uint gamma_lut_size = 0;
>    737
>    738          if (!path)
>    739                  return 0;
>    740
>    741          for (i = 0; i < path_len; i++) {
>    742                  enum mtk_ddp_comp_id comp_id = path[i];
>    743                  struct device_node *node;
>    744
>    745                  node = priv->comp_node[comp_id];
>    746                  if (!node) {
>    747                          dev_info(dev,
>    748                                   "Not creating crtc %d because component %d is disabled or missing\n",
>    749                                   pipe, comp_id);
>    750                          return 0;
>    751                  }
>    752          }
>    753
>    754          mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
>    755          if (!mtk_crtc)
>    756                  return -ENOMEM;
>    757
>    758          mtk_crtc->config_regs = priv->config_regs;
>    759          mtk_crtc->ddp_comp_nr = path_len;
>    760          mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
>    761                                                  sizeof(*mtk_crtc->ddp_comp),
>    762                                                  GFP_KERNEL);
>    763          if (!mtk_crtc->ddp_comp)
>    764                  return -ENOMEM;
>    765
>    766          mtk_crtc->mutex = mtk_disp_mutex_get(priv->mutex_dev, pipe);
>    767          if (IS_ERR(mtk_crtc->mutex)) {
>    768                  ret = PTR_ERR(mtk_crtc->mutex);
>    769                  dev_err(dev, "Failed to get mutex: %d\n", ret);
>    770                  return ret;
>    771          }
>    772
>    773          for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>    774                  enum mtk_ddp_comp_id comp_id = path[i];
>    775                  struct mtk_ddp_comp *comp;
>    776                  struct device_node *node;
>    777
>    778                  node = priv->comp_node[comp_id];
>    779                  comp = priv->ddp_comp[comp_id];
>    780                  if (!comp) {
>    781                          dev_err(dev, "Component %pOF not initialized\n", node);
>    782                          ret = -ENODEV;
>    783                          return ret;
>    784                  }
>    785
>    786                  mtk_crtc->ddp_comp[i] = comp;
>    787
>    788                  if (comp->funcs) {
>    789                          if (comp->funcs->gamma_set)
>    790                                  gamma_lut_size = MTK_LUT_SIZE;
>    791
>    792                          if (comp->funcs->ctm_set)
>    793                                  has_ctm = true;
>    794                  }
>    795          }
>    796
>    797          for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
>    798                  num_comp_planes += mtk_drm_crtc_num_comp_planes(mtk_crtc, i);
>    799
>    800          mtk_crtc->planes = devm_kcalloc(dev, num_comp_planes,
>    801                                          sizeof(struct drm_plane), GFP_KERNEL);
>    802
>    803          for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>    804                  ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, i,
>    805                                                      pipe);
>    806                  if (ret)
>    807                          return ret;
>    808          }
>    809
>    810          ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
>    811                                  mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
>    812                                  NULL, pipe);
>    813          if (ret < 0)
>    814                  return ret;
>    815
>    816          if (gamma_lut_size)
>    817                  drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
>    818          drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
>    819          priv->num_pipes++;
>    820          mutex_init(&mtk_crtc->hw_lock);
>    821
>    822  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>    823          mtk_crtc->cmdq_client =
>  > 824                          cmdq_mbox_create(mtk_crtc->mmsys_dev,
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
