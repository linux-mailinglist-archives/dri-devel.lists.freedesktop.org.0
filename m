Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4F4FD362
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC410E4BB;
	Tue, 12 Apr 2022 09:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D6210E282
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:45:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412094556euoutp01db368cb5fc5341ee23a0e65593e65259~lHQeAoKX51735617356euoutp01k
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:45:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220412094556euoutp01db368cb5fc5341ee23a0e65593e65259~lHQeAoKX51735617356euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649756756;
 bh=jnFrSejFs3YMvvH9ioE0ovWXGxMCacxv79d5R9nBf3M=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=YiS7c7fUCrOZql7TlAup0qLPsDRC1IBRw4l0fZYN2OMFyKJLlGBHGzdHINXSz9fg+
 dGHTcBpkhqNbOnN5c48z0PuXNlarE+dY3Juf/jIqt3KQdctrsG9ZqPsot838XboZqU
 J/HM7mkJ2B9Yi270ioI6lUhwBmJoxJhOu8FEpxjE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220412094556eucas1p2034e9a58e648b7917a0a3554abec5506~lHQdkNaqt0984809848eucas1p2c;
 Tue, 12 Apr 2022 09:45:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EA.15.10009.35A45526; Tue, 12
 Apr 2022 10:45:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220412094555eucas1p1843edd72d420037735ccd8c7f481904d~lHQcvggdq1408314083eucas1p1L;
 Tue, 12 Apr 2022 09:45:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220412094555eusmtrp1fd13cc4a431144d661c6d0ba728a6ef1~lHQctn1760906409064eusmtrp1I;
 Tue, 12 Apr 2022 09:45:55 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-d8-62554a53fc8b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 4B.56.09522.25A45526; Tue, 12
 Apr 2022 10:45:55 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220412094553eusmtip10a6aa4e78f9d57d3224595fc4bc8a5e8~lHQbEwVT60994309943eusmtip1i;
 Tue, 12 Apr 2022 09:45:53 +0000 (GMT)
Message-ID: <0146abe6-c588-820c-09f4-b12de2e734ac@samsung.com>
Date: Tue, 12 Apr 2022 11:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 01/11] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Herring
 <robh+dt@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220408162108.184583-2-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxbVRjGd+69vb2tK7kUCCdz09mIZiOUoSw5Zh8Zi+J1M8bpMEaNs4wr
 EKBsLcisRvkQ3NpRYM1G6dJ1ykg3BmyUr4JARocrUldhQZyMUZfVhYEFaaGR8qGUi8p/v/M8
 z3ve9z05FC5Wk5uodHkOq5DLMiWkkGi9Ne+MeftAUvIO7Xe70eg9B45c1T4CTd67TCJTr5OH
 huamSVRas0JnXOUEmrWUk2h8bJBAtwv/4KNTFZf4yFzeTSLLw2EeUgeu4Ej/UzeG+guKCWTT
 vo+8hgc4Ku7q5SO97jGJBvu8+L4Ipn7GxWOm7xbzGefp+yTTbrjPZ86frOIx1Z2PMcZSe4pk
 en+u5jGjw50k49LYMabp0pdM45QVY7TNtYDxWZ56M+Q94e4UNjP9E1YRu/cjYVr1o/hjtcyJ
 Nu04yAdX9qgBRUE6Hn4beEYNBJSYvgzgb+ZojmcB7Gl9RQ2EK+wDcLamgx80gvmbmhGSM8wA
 Wv3zGHeYAdA3UIcFUyJ6L9R/tbBaQdBR8JtfO9b0UPhDlZsIcgSdDK+2XSWDHEYnwmV1Jwgy
 TkfCEbdp9dJwepGAC4ExkjMeAfijazVE0nFQ7VGv6gI6ARpuTvG4zNOwqOU8HiyGdEAAZ5Z+
 Ibm5X4bL1qo1DoMT9ua1fTZDh+40wb1FNlzSv8jJJ+DwZB3O8S446gyQwQhOb4PXOmI5OQFO
 1zzgcZUh8K4nlJsgBJ5prcQ5WQRPloi59HPQYG/4r2fPwB28HEgM6x7FsG55w7pdDP/3vQiI
 WhDJ5iqzUlllnJzNkyplWcpcear0aHaWBax8V8ey3WsFxokZqQ1gFLABSOGScFHZ80nJYlGK
 7FMVq8g+osjNZJU28CRFSCJFR9Ovy8R0qiyHzWDZY6ziXxejBJvysS3srm22PbdIz6ttvkaz
 dvD7ycayObClT2fL+TO63fTxxqjE16bdY7+Pv2BMlNo/qEjP8GsKk4bObTWyFx32nZIA65uH
 KlelMS20PlmwYC5N2Be546UUPOpdz+2vIza4Nxd9OHwk4nhDTElV98bSfoF8yH34ICyZizlY
 EEJH71+KDXvLFD0gmMj7+5qwX1fELJ5VSexhOk0XVd/vaO/Oz81qWLAY8abjrhueC+p6zYEb
 i69Dnr9Cde6QVV54+Fm/Ph5rLvGHP2y5I3aWmfb3NBUX8JMyK73b5VPX/9qpMo181pVXx6gM
 PZ9LQwc3eFVM31ZTS/sTQ9ov8t55Q5ghIZRpsrjtuEIp+wfXP0y9HQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsVy+t/xu7rBXqFJBh9/MlvcuX2a2eL+4s8s
 Fq9vr2CzmH/kHKvFla/v2Sx6lwJZk+5PYLH4smkCm8WLexdZLM42vWG36Jy4hN1i+YR9bBab
 Hl9jtej6tZLZYsb5fUwWpxpbWSwO9UVbfJr1kNmide8RdosZk1+yWVw88YnZQdRj7cf7rB7v
 b7Sye5zrucvmsXPWXXaP2R0zWT0W73nJ5LFpVSebx5Gri1k97lzbw+Zxv/s4k8fmJfUeG9/t
 YPLo27KK0ePzJrkAvig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
 nMyy1CJ9uwS9jMXPTApWeVRs73vB2MC40raLkZNDQsBE4nD3LbYuRi4OIYGljBL9Wy4zQiRk
 JE5Oa2CFsIUl/lzrgip6zyjx8mI/E0iCV8BOYkbLb3YQm0VAVWLhzV1QcUGJkzOfsIDYogJJ
 Epe62sGGCgu4Sfzr2gNmMwuIS9x6Mh+sXkSggVXi0EUuiPgzRom7v9Iglp1mlLjX/oIZJMEm
 YCjR9RbkCk4OTgFHiVmH37FCNJhJdG3tghoqL9G8dTbzBEahWUjumIVk3ywkLbOQtCxgZFnF
 KJJaWpybnltsqFecmFtcmpeul5yfu4kRmFa2Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuHtVw9N
 EuJNSaysSi3Kjy8qzUktPsRoCgyMicxSosn5wMSWVxJvaGZgamhiZmlgamlmrCTO61nQkSgk
 kJ5YkpqdmlqQWgTTx8TBKdXAtEfnsbVH1Xx9HaNNvRPrWA6zvHm70dpv17306toqAxeWIK1Z
 PBvnLt9ULPxpxtaWtA+7+O9X3jtR+kIt6V9qxiam3N2VV3pi2i/11XvWv9e9v/dBg7XHTZaK
 rfpWku4fea+8nT834cGb9bMNblfE77XVmHtIZ+vST4tFp5QL/eh6My/FeJJrjt9rHSZDtpol
 shMWHBWc9lqsqLp+i+g2wc0r9AvYI3cmpBhNOuRrz+p9ssPmfsmd8EPtKpYhew2LS1VSzpwK
 3TlHmu2IlXF0u6zgLy6nhW3f9eZ+tr/0LzLSe9O9UyFh3ULb3CTitFb6zMzaNe0E409Rngnc
 MQITmepOPfmSKM74Xu2kR993JZbijERDLeai4kQAr0ltt7QDAAA=
X-CMS-MailID: 20220412094555eucas1p1843edd72d420037735ccd8c7f481904d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <CGME20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16@eucas1p2.samsung.com>
 <20220408162108.184583-2-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 08.04.2022 18:20, Jagan Teki wrote:
> Samsung MIPI DSIM controller is common DSI IP that can be used in various
> SoCs like Exynos, i.MX8M Mini/Nano.
>
> In order to access this DSI controller between various platform SoCs, the
> ideal way to incorporate this in the drm stack is via the drm bridge driver.
>
> This patch is trying to differentiate platform-specific and bridge driver
> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> glue code and samsung-dsim.c as a common bridge driver code.
>
> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>    detach code along with conventional component_ops.
>
> - Samsung DSIM is a bridge driver which is common across all platforms and
>    the respective platform-specific glue will initialize at the end of the
>    probe. The platform-specific operations and other glue calls will invoke
>    on associate code areas.
>
> Updated MAINTAINERS file for this bridge with exynos drm maintainers along
> with Andrzej as he is the original author.
>
> Tomasz Figa has been not included in MAINTAINERS as he is not available via
> samsung.com.
>
> v1:
> * Don't maintain component_ops in bridge driver
> * Don't maintain platform glue code in bridge driver
> * Add platform-specific glue code and make a common bridge
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Well, it took me a while to make this working on Exynos. I'm not really 
happy of the design, although I didn't spent much time thinking how to 
improve it and clarify some ambiguities. It doesn't even look that one 
has compiled the Exynos code after this conversion.

The following changes are needed to get it to the same working state as 
before this patch (the next patches however break it even further):

commit e358ee6239305744062713c5aa2e8d44f740b81a (HEAD)
Author: Marek Szyprowski <m.szyprowski@samsung.com>
Date:   Tue Apr 12 11:30:26 2022 +0200

     drm: exynos: dsi: fixup driver after conversion

     Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c
index ee5d7e5518a6..8e0064282ce6 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -17,7 +17,6 @@

  #include <linux/clk.h>
  #include <linux/delay.h>
-#include <linux/gpio/consumer.h>
  #include <linux/irq.h>
  #include <linux/of_device.h>
  #include <linux/phy/phy.h>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c 
b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 97167c5ffc78..bbfacb22d99d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -8,6 +8,7 @@
   */

  #include <linux/component.h>
+#include <linux/gpio/consumer.h>

  #include <drm/bridge/samsung-dsim.h>
  #include <drm/drm_probe_helper.h>
@@ -25,17 +26,19 @@ struct exynos_dsi {
         struct samsung_dsim_plat_data pdata;
  };

-static void exynos_dsi_enable_irq(void *priv)
+static void exynos_dsi_enable_irq(struct samsung_dsim *priv)
  {
-       struct exynos_dsi *dsi = priv;
+       const struct samsung_dsim_plat_data *pdata = priv->plat_data;
+       struct exynos_dsi *dsi = container_of(pdata, struct exynos_dsi, 
pdata);

         if (dsi->te_gpio)
                 enable_irq(gpiod_to_irq(dsi->te_gpio));
  }

-static void exynos_dsi_disable_irq(void *priv)
+static void exynos_dsi_disable_irq(struct samsung_dsim *priv)
  {
-       struct exynos_dsi *dsi = priv;
+       const struct samsung_dsim_plat_data *pdata = priv->plat_data;
+       struct exynos_dsi *dsi = container_of(pdata, struct exynos_dsi, 
pdata);

         if (dsi->te_gpio)
                 disable_irq(gpiod_to_irq(dsi->te_gpio));
@@ -92,15 +95,15 @@ static void exynos_dsi_unregister_te_irq(struct 
exynos_dsi *dsi)
         }
  }

-static int exynos_dsi_host_attach(void *priv, struct mipi_dsi_device 
*device)
+static int exynos_dsi_host_attach(struct samsung_dsim *priv, struct 
mipi_dsi_device *device)
  {
-       struct exynos_dsi *dsi = priv;
-       struct samsung_dsim *_priv = dsi->priv;
+       const struct samsung_dsim_plat_data *pdata = priv->plat_data;
+       struct exynos_dsi *dsi = container_of(pdata, struct exynos_dsi, 
pdata);
         struct drm_encoder *encoder = &dsi->encoder;
         struct drm_device *drm = encoder->dev;
         int ret;

-       drm_bridge_attach(encoder, &_priv->bridge, NULL, 0);
+       drm_bridge_attach(encoder, &priv->bridge, NULL, 0);

         /*
          * This is a temporary solution and should be made by more 
generic way.
@@ -116,11 +119,11 @@ static int exynos_dsi_host_attach(void *priv, 
struct mipi_dsi_device *device)

         mutex_lock(&drm->mode_config.mutex);

-       _priv->lanes = device->lanes;
-       _priv->format = device->format;
-       _priv->mode_flags = device->mode_flags;
+       priv->lanes = device->lanes;
+       priv->format = device->format;
+       priv->mode_flags = device->mode_flags;
         exynos_drm_crtc_get_by_type(drm, 
EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
-                       !(_priv->mode_flags & MIPI_DSI_MODE_VIDEO);
+                       !(priv->mode_flags & MIPI_DSI_MODE_VIDEO);

         mutex_unlock(&drm->mode_config.mutex);

@@ -130,9 +133,10 @@ static int exynos_dsi_host_attach(void *priv, 
struct mipi_dsi_device *device)
         return 0;
  }

-static int exynos_dsi_host_detach(void *priv, struct mipi_dsi_device 
*device)
+static int exynos_dsi_host_detach(struct samsung_dsim *priv, struct 
mipi_dsi_device *device)
  {
-       struct exynos_dsi *dsi = priv;
+       const struct samsung_dsim_plat_data *pdata = priv->plat_data;
+       struct exynos_dsi *dsi = container_of(pdata, struct exynos_dsi, 
pdata);
         struct drm_device *drm = dsi->encoder.dev;

         if (drm->mode_config.poll_enabled)
@@ -150,8 +154,9 @@ static const struct samsung_dsim_host_ops 
samsung_dsim_exynos_host_ops = {

  static int exynos_dsi_bind(struct device *dev, struct device *master, 
void *data)
  {
-       struct exynos_dsi *dsi = dev_get_drvdata(dev);
-       struct samsung_dsim *priv = dsi->priv;
+       struct samsung_dsim *priv = dev_get_drvdata(dev);
+       const struct samsung_dsim_plat_data *pdata = priv->plat_data;
+       struct exynos_dsi *dsi = container_of(pdata, struct exynos_dsi, 
pdata);
         struct drm_encoder *encoder = &dsi->encoder;
         struct drm_device *drm_dev = data;
         int ret;
@@ -167,8 +172,7 @@ static int exynos_dsi_bind(struct device *dev, 
struct device *master, void *data

  static void exynos_dsi_unbind(struct device *dev, struct device 
*master, void *data)
  {
-       struct exynos_dsi *dsi = dev_get_drvdata(dev);
-       struct samsung_dsim *priv = dsi->priv;
+       struct samsung_dsim *priv = dev_get_drvdata(dev);

priv->bridge.funcs->atomic_disable(&priv->bridge, NULL);

diff --git a/include/drm/bridge/samsung-dsim.h 
b/include/drm/bridge/samsung-dsim.h
index 59a43f9c4477..9f579a798635 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -41,14 +41,18 @@ struct samsung_dsim_driver_data {
         const unsigned int *reg_values;
  };

+struct samsung_dsim;
+
  struct samsung_dsim_host_ops {
-       int (*attach)(void *priv, struct mipi_dsi_device *device);
-       int (*detach)(void *priv, struct mipi_dsi_device *device);
+       int (*attach)(struct samsung_dsim *priv,
+                     struct mipi_dsi_device *device);
+       int (*detach)(struct samsung_dsim *priv,
+                     struct mipi_dsi_device *device);
  };

  struct samsung_dsim_irq_ops {
-       void (*enable)(void *priv);
-       void (*disable)(void *priv);
+       void (*enable)(struct samsung_dsim *priv);
+       void (*disable)(struct samsung_dsim *priv);
  };

  struct samsung_dsim_plat_data {


> ---
>   MAINTAINERS                             |   12 +
>   drivers/gpu/drm/bridge/Kconfig          |   12 +
>   drivers/gpu/drm/bridge/Makefile         |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c   | 1676 ++++++++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig          |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1704 +----------------------
>   include/drm/bridge/samsung-dsim.h       |   95 ++
>   7 files changed, 1852 insertions(+), 1649 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
>
> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

