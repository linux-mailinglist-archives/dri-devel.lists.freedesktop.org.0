Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68961426BB2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336E06F4F6;
	Fri,  8 Oct 2021 13:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561D26F4F6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 13:30:48 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id t4so11948924oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=iXolLam5reRhmNIVaRCegXLkdbifxlwWmRm5uSwhVQU=;
 b=jKp7QOcx7bDU6jbdZb/iJFYBK6H2cdc47fdDCp/UTRod3yA1LqRnkGZaPe6nMJfZj8
 +ZHAd8O2renHB1k9o+Z2dRgl51vijdHPpVqzczqAjr0+XoTrWjgcRspZPovYzyOdyy3K
 KD6QBP93a1yByqbi1+8GJxfbDXErPWPKWwmaU1pGaPsx4GEBSAc92ocCAhKq5/gu335e
 AtNBzk8CPppmKks9IFqUCt+JlYbDtzMdosRv2EsusPkapGMwf0qIvnFlhRMrGsF8Gdz9
 5YHnIsFp9v04Fb2Zqe0jjn7X4bUrW90LJRMzcE8dGx9tolmAiEN7czGfGiTSjNxoTsFE
 DVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=iXolLam5reRhmNIVaRCegXLkdbifxlwWmRm5uSwhVQU=;
 b=H3mpq/bh1trGB4XgxWZHQ7C/m/IeOCQ64cfgHYjxHc7QHF+AFBJJhQ09Ek0LxqHIhz
 Mn924bH9nsXEinI4/Cz2lFsKH/P3hMizim7Uu3sjh76XokwOi9zSEzJZrSt0cUAc70iU
 reUjOjz242SH12EYAhZHSSRsjFsZFRXHflSIuNYxJpudoafTW+3Y692mauhMD0HWF2v7
 Aicnpo6iQMNcHfCvSiTtcHvm81TOOcs+QNErVtjWjB54YSxBVy9TirsvQFTS2S4lpJNb
 m6sFmwOTRELrcKdQO0mHpnGTo28hPPK2mz71SS6ZTbL6GJNksQa1XGgfTjA8IPHqU8k8
 1vCQ==
X-Gm-Message-State: AOAM533qMn4JfgoEWuBHkGy4s6tbHkQtHKLURDiXw3UaLjvHiC7SLSJ7
 puYpGOthlaCeI/uzZH+bHSn5n4PmLw5bksPbgtW5ig==
X-Google-Smtp-Source: ABdhPJyxdZw7bK0LE5aNlR+dWJe1orCUCkWCVsJvVCgBJnj6rTj7Yp6C+UCgXDnqi/YYuxhSfznk0SPmJUUXaE7UGWA=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1910:: with SMTP id
 bf16mr7799246oib.43.1633699847216; 
 Fri, 08 Oct 2021 06:30:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Oct 2021 06:30:46 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 8 Oct 2021 06:30:46 -0700
Message-ID: <CABnWg9vqh2J6=Ku1bSTzAkJ=r1woRcYj7He=hecdZdefAvU4MA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/mediatek: add mt8195 hdmi TX support
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Quoting Guillaume Ranquet (2021-09-30 17:30:16)
> Hi Chun-Kuang.
>
> Thank you for your input.
> I have tried to find commonalities between the two drivers but I didn't
> find enough shared code to warrant that architecture.
> I'll have another look, especially now that I'm more familiar with the
> driver.
>
> Regarding 2, I have removed as much functionalities as I could from the
> original vendor tree (like hdcp, hdr, cec...) to keep only HDMI audio and
> video TX.
>
> There might be some more things to remove, but I'm no expert in the domai=
n
> and I'm working without access to mediatek datasheets and documentation.
>
> Though, at this stage I could split the patch in two with video first and
> then audio.
>
> I will try to work something out for a V2.
>
> Thx,
> Guillaume.
>
> Quoting Chun-Kuang Hu (2021-09-30 15:36:42)
> > Hi, Guillaume:
> >
> > This is a big patch, and I'm not familiar with this driver, so the
> > review process would be long. So I tell you about how I review this
> > patch, and if you could process according to my way, the process would
> > be more short.
> >
> > 1. Find the common part of all hdmi driver.
> > Even though mt8195 hdmi has many difference with other mediatek soc
> > hdmi driver, I would like to find the common part and have just one
> > copy of the common part. I expect there would three file finally:
> >
> > mtk_hdmi.c               (the common part)
> > mtk_hdmi_mt8173.c (each soc special part)
> > mtk_hdmi_mt8195.c (each soc special part)
> >
> > But this would be difficult in this stage, so you could temporarily
> > have these three file:
> >
> > mtk_hdmi_common.c (the common part)
> > mtk_hdmi.c                 (each soc special part)
> > mtk_hdmi_mt8195.c   (each soc special part)
> >
> > When review is almost done, then change the file name as I wish.
> >
> > 2. The first patch has only basic function, separate advance function
> > to another patch.
> > When comparing mt8195 hdmi driver with other hdmi driver, if mt8195
> > hdmi driver has some function that other hdmi does not have, I would
> > think that function is advance function and should be separate to
> > another patch.
> >
> > If you follow this way, I think the review process would be short.
> > Because this patch is big, I would just review partial part each time.
> >
> > Regards,
> > Chun-Kuang.
> >
> >
> > Guillaume Ranquet <granquet@baylibre.com> =EF=BF=BD=EF=BF=BD=EF=BF=BD 2=
021=EF=BF=BD=EF=BF=BD=EF=BF=BD9=EF=BF=BD=EF=BF=BD=EF=BF=BD29=EF=BF=BD=EF=BF=
=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD5:47=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD
> > >
> > > Add basic hdmi TX support for the mediatek mt8195 SoCs
> > >
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/Kconfig              |   10 +
> > >  drivers/gpu/drm/mediatek/Makefile             |    4 +-
> > >  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 2293 +++++++++++++++=
++
> > >  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |  128 +
> > >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 ++++
> > >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
> > >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
> > >  7 files changed, 3313 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
> > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
> > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
> > >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/media=
tek/Kconfig
> > > index 2976d21e9a34a..517d065f0511b 100644
> > > --- a/drivers/gpu/drm/mediatek/Kconfig
> > > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > > @@ -28,3 +28,13 @@ config DRM_MEDIATEK_HDMI
> > >         select PHY_MTK_HDMI
> > >         help
> > >           DRM/KMS HDMI driver for Mediatek SoCs
> > > +
> > > +config DRM_MEDIATEK_HDMI_MT8195_SUSPEND_LOW_POWER
> > > +       tristate "DRM HDMI SUSPEND LOW POWER Support for Mediatek mt8=
195 SoCs"
> > > +       depends on DRM_MEDIATEK_HDMI
> > > +       help
> > > +         DRM/KMS HDMI SUSPEND_LOW_POWER for Mediatek SoCs.
> > > +         Choose this option if you want to disable/enable
> > > +         clock and power domain when platform enter suspend,
> > > +         and this config depends on DRM_MEDIATEK_HDMI.
> > > +
> > > diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/medi=
atek/Makefile
> > > index 29098d7c8307c..736f0816083d0 100644
> > > --- a/drivers/gpu/drm/mediatek/Makefile
> > > +++ b/drivers/gpu/drm/mediatek/Makefile
> > > @@ -18,6 +18,8 @@ obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
> > >
> > >  mediatek-drm-hdmi-objs :=3D mtk_cec.o \
> > >                           mtk_hdmi.o \
> > > -                         mtk_hdmi_ddc.o
> > > +                         mtk_hdmi_ddc.o \
> > > +                         mtk_mt8195_hdmi.o \
> > > +                         mtk_mt8195_hdmi_ddc.o \
> > >
> > >  obj-$(CONFIG_DRM_MEDIATEK_HDMI) +=3D mediatek-drm-hdmi.o
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu=
/drm/mediatek/mtk_mt8195_hdmi.c
> > > new file mode 100644
> > > index 0000000000000..46c7c8af524ac
> > > --- /dev/null
> > >

Hi Chun-Kuang.

I have removed audio from mtk_mt8195_hdmi, which drops the line count
by approximately a thousand lines.
I couldn't find anything else to remove as _to me_, everything seems
relevant... but I'm no drm/hdmi expert.

I have also tried to find the commonalities between the mtk_hdmi
"legacy" driver and the mt8195 driver.
I have found around 200 lines of codes that could be shared between
the two drivers with some tweaks here and there.

I'm showing a rough draft of what the common code would be down below.
Do you think it's worth the effort to pursue that goal?

Thx,
Guillaume.

Note that it won't apply as I'm not providing the audio removal patch
and it is based on a 5.10 branch I'm testing on right now.
This is just for discussion. I'll rebase and rework things if you
think pursuing this idea is worth the effort.

commit 715b7f7c058f987a583033c885be491e756d9357
Author: Guillaume Ranquet <granquet@baylibre.com>
Date:   Fri Oct 8 11:25:55 2021 +0200

    Draft: HDMI: find common stuff betweem legacy and mt8195

    Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
    Change-Id: I8a2fb31ceecf467a560abc3201c97e66fb5e9602

diff --git a/drivers/gpu/drm/mediatek/Makefile
b/drivers/gpu/drm/mediatek/Makefile
index 87b3506981fd..477c0648643c 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
 mediatek-drm-hdmi-objs :=3D mtk_cec.o \
 			  mtk_hdmi.o \
 			  mtk_hdmi_ddc.o \
+			  mtk_hdmi_common.o \
 			  mtk_mt8195_hdmi.o \
 			  mtk_mt8195_hdmi_ddc.o \

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
new file mode 100644
index 000000000000..72ae33019415
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -0,0 +1,265 @@
+#include "mtk_hdmi_common.h"
+
+struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
+{
+	return container_of(b, struct mtk_hdmi, bridge);
+}
+
+u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
+{
+	return readl(hdmi->regs + offset);
+}
+
+void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
+{
+	writel(val, hdmi->regs + offset);
+}
+
+inline void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset,
+				       u32 bits)
+{
+	void __iomem *reg =3D hdmi->regs + offset;
+	u32 tmp;
+
+	tmp =3D readl(reg);
+	tmp &=3D ~bits;
+	writel(tmp, reg);
+}
+
+inline void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset,
+				     u32 bits)
+{
+	void __iomem *reg =3D hdmi->regs + offset;
+	u32 tmp;
+
+	tmp =3D readl(reg);
+	tmp |=3D bits;
+	writel(tmp, reg);
+}
+
+void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask)
+{
+	void __iomem *reg =3D hdmi->regs + offset;
+	u32 tmp;
+
+	tmp =3D readl(reg);
+	tmp =3D (tmp & ~mask) | (val & mask);
+	writel(tmp, reg);
+}
+
+//TODO: ~common!
+int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi, u8 *buffer,
size_t bufsz,
+					const char *vendor, const char *product)
+{
+	struct hdmi_spd_infoframe frame;
+	ssize_t err;
+
+	err =3D hdmi_spd_infoframe_init(&frame, vendor, product);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
+			err);
+		return err;
+	}
+
+	err =3D hdmi_spd_infoframe_pack(&frame, buffer, bufsz);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack SDP infoframe: %zd\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+//TODO: common
+int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+	const char *const *mtk_hdmi_clk_names, size_t num_clocks)
+{
+	int i;
+
+	for (i =3D 0; i < num_clocks; i++) {
+		hdmi->clk[i] =3D of_clk_get_by_name(np, mtk_hdmi_clk_names[i]);
+
+		if (IS_ERR(hdmi->clk[i]))
+			return PTR_ERR(hdmi->clk[i]);
+	}
+
+	return 0;
+}
+
+//TODO: common
+struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
+	struct edid *edid;
+
+	if (!hdmi->ddc_adpt)
+		return NULL;
+	edid =3D drm_get_edid(connector, hdmi->ddc_adpt);
+	if (!edid)
+		return NULL;
+	return edid;
+}
+
+//TODO: common with mt8183
+bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+//TODO: common
+void
+mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			 const struct drm_display_mode *mode,
+			 const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
+
+	drm_mode_copy(&hdmi->mode, adjusted_mode);
+}
+
+//TODO: partly common
+int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer,
size_t bufsz,
+					struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	ssize_t err;
+	bool is_hdmi2x_sink =3D false;
+
+	if (hdmi->conn.display_info.hdmi.scdc.supported)
+		is_hdmi2x_sink =3D
+			true; //if support scdc, then the sink support HDMI2.0
+
+	err =3D drm_hdmi_avi_infoframe_from_display_mode(&frame, &hdmi->conn,
+						       mode);
+
+	if (err < 0) {
+		dev_err(hdmi->dev,
+			"Failed to get AVI infoframe from mode: %zd\n", err);
+		return err;
+	}
+
+	frame.colorimetry =3D hdmi->colorimtery;
+	//no need, since we cannot support other extended colorimetry?
+	if (frame.colorimetry =3D=3D HDMI_COLORIMETRY_EXTENDED)
+		frame.extended_colorimetry =3D hdmi->extended_colorimetry;
+
+	/* quantiation range:limited or full */
+	if (frame.colorspace =3D=3D HDMI_COLORSPACE_RGB)
+		frame.quantization_range =3D hdmi->quantization_range;
+	else
+		frame.ycc_quantization_range =3D hdmi->ycc_quantization_range;
+	err =3D hdmi_avi_infoframe_pack(&frame, buffer, bufsz);
+
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %zd\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+//TODO: partly common?
+void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd,
size_t bufsz_spd, u8 *buffer_avi, size_t bufsz_avi,
+				    struct drm_display_mode *mode)
+{
+	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
+	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd,
"mediatek", "On-chip HDMI");
+}
+
+static struct mtk_hdmi_ddc *hdmi_ddc_ctx_from_mtk_hdmi(struct mtk_hdmi *hd=
mi)
+{
+	return container_of(hdmi->ddc_adpt, struct mtk_hdmi_ddc, adap);
+}
+
+//TODO: mostly common, can work
+int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
+				   struct platform_device *pdev, const char *const *clk_names,
size_t num_clocks)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	struct device_node *i2c_np;
+	struct resource *mem;
+	int ret;
+	struct mtk_hdmi_ddc *ddc;
+
+	ret =3D mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
+	if (ret) {
+		dev_err(dev, "Failed to get all clks\n");
+		return ret;
+	}
+
+	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem)
+		return -ENOMEM;
+
+	hdmi->regs =3D devm_ioremap_resource(dev, mem);
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
+
+	i2c_np =3D of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
+	if (!i2c_np) {
+		of_node_put(pdev->dev.of_node);
+		dev_err(dev, "Failed to find ddc-i2c-bus \n");
+		return -EINVAL;
+	}
+
+	hdmi->ddc_adpt =3D of_find_i2c_adapter_by_node(i2c_np);
+	if (!hdmi->ddc_adpt)
+		return -EPROBE_DEFER;
+
+	//TODO: rework this... this is ugly
+	ddc =3D hdmi_ddc_ctx_from_mtk_hdmi(hdmi);
+	ddc->regs =3D hdmi->regs;
+
+	return 0;
+}
+
+int mtk_drm_hdmi_probe(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi;
+	struct device *dev =3D &pdev->dev;
+	int ret;
+
+	hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->dev =3D dev;
+
+	hdmi->phy =3D devm_phy_get(dev, "hdmi");
+	if (IS_ERR(hdmi->phy)) {
+		ret =3D PTR_ERR(hdmi->phy);
+		dev_err(dev, "Failed to get HDMI PHY: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names,
ARRAY_SIZE(mtk_hdmi_clk_names));
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi);
+
+	//TODO
+	mtk_hdmi_output_init(hdmi);
+
+	hdmi->bridge.funcs =3D &mtk_mt8195_hdmi_bridge_funcs;
+	hdmi->bridge.of_node =3D pdev->dev.of_node;
+	drm_bridge_add(&hdmi->bridge);
+
+	return 0;
+}
+
+int mtk_drm_hdmi_remove(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi =3D platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&hdmi->bridge);
+//	TODO:
+	mtk_hdmi_clk_disable(hdmi);
+	i2c_put_adapter(hdmi->ddc_adpt);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
new file mode 100644
index 000000000000..2e0b15d8abf4
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre, SAS
+ */
+
+#ifndef _MTK_HDMI_COMMON_H
+#define _MTK_HDMI_COMMON_H
+#include <linux/hdmi.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <linux/platform_device.h>
+#include <linux/i2c.h>
+#include <sound/hdmi-codec.h>
+#include <linux/clk.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+
+#include "mtk_mt8195_hdmi_ddc.h"
+
+enum hdmi_color_depth { HDMI_8_BIT, HDMI_10_BIT, HDMI_12_BIT, HDMI_16_BIT =
};
+
+enum mtk_hdmi_clk_id {
+	MTK_HDMI_CLK_UNIVPLL_D6D4,
+	MTK_HDMI_CLK_MSDCPLL_D2,
+	MTK_HDMI_CLK_HDMI_APB_SEL,
+	MTK_HDMI_UNIVPLL_D4D8,
+	MTK_HDIM_HDCP_SEL,
+	MTK_HDMI_HDCP_24M_SEL,
+	MTK_HDMI_VPP_SPLIT_HDMI,
+	MTK_HDMI_CLK_COUNT,
+};
+
+enum hdmi_hpd_state {
+	HDMI_PLUG_OUT =3D 0,
+	HDMI_PLUG_IN_AND_SINK_POWER_ON,
+	HDMI_PLUG_IN_ONLY,
+};
+
+struct mtk_hdmi {
+	struct drm_bridge bridge;
+	struct drm_connector conn;
+	struct device *dev;
+	struct phy *phy;
+	struct i2c_adapter *ddc_adpt;
+	struct clk *clk[MTK_HDMI_CLK_COUNT];
+	struct drm_display_mode mode;
+	bool dvi_mode;
+	void __iomem *regs;
+	spinlock_t property_lock;
+	struct drm_property *csp_depth_prop;
+	u64 support_csp_depth;
+	u64 set_csp_depth;
+	enum hdmi_colorspace csp;
+	enum hdmi_color_depth color_depth;
+	enum hdmi_colorimetry colorimtery;
+	enum hdmi_extended_colorimetry extended_colorimetry;
+	enum hdmi_quantization_range quantization_range;
+	enum hdmi_ycc_quantization_range ycc_quantization_range;
+
+	bool powered;
+	bool enabled;
+	unsigned int hdmi_irq;
+	enum hdmi_hpd_state hpd;
+
+	bool hdmi_enabled;
+	bool power_clk_enabled;
+	bool irq_registered;
+};
+
+struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b);
+u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset);
+void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val);
+inline void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset,
+				       u32 bits);
+inline void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset,
+				     u32 bits);
+void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask);
+int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi, u8 *buffer,
size_t bufsz,
+					const char *vendor, const char *product);
+void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd,
size_t bufsz_spd, u8 *buffer_avi, size_t bufsz_avi,
+				    struct drm_display_mode *mode);
+int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+	const char *const *clk_names, size_t num_clocks);
+struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+					     struct drm_connector *connector);
+bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       struct drm_display_mode *adjusted_mode);
+void
+mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			 const struct drm_display_mode *mode,
+			 const struct drm_display_mode *adjusted_mode);
+int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
+				   struct platform_device *pdev, const char *const *clk_names,
size_t num_clocks);
+int mtk_drm_hdmi_probe(struct platform_device *pdev);
+int mtk_drm_hdmi_remove(struct platform_device *pdev);
+
+//TODO: do better than this
+extern const struct drm_bridge_funcs mtk_mt8195_hdmi_bridge_funcs;
+extern const char *const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT];
+extern void mtk_hdmi_output_init(struct mtk_hdmi *hdmi);
+extern void mtk_hdmi_clk_disable(struct mtk_hdmi *hdmi);
+#endif //_MTK_HDMI_COMMON_H
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
index f9bcef24c1d2..72840ef2b0a6 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
@@ -17,7 +17,6 @@
 #include <linux/of_irq.h>
 #include <linux/of_gpio.h>
 #include <linux/of_graph.h>
-#include <linux/phy/phy.h>
 #include <linux/pm_wakeup.h>
 #include <linux/timer.h>

@@ -28,15 +27,37 @@
 #include <drm/drm_scdc_helper.h>

 #include "mtk_drm_crtc.h"
-#include "mtk_mt8195_hdmi_ddc.h"
 #include "mtk_mt8195_hdmi.h"
+#include "mtk_hdmi_common.h"
+#include "mtk_mt8195_hdmi_ddc.h"
 #include "mtk_mt8195_hdmi_regs.h"

+#define RGB444_8bit BIT(0)
+#define RGB444_10bit BIT(1)
+#define RGB444_12bit BIT(2)
+#define RGB444_16bit BIT(3)
+
+#define YCBCR444_8bit BIT(4)
+#define YCBCR444_10bit BIT(5)
+#define YCBCR444_12bit BIT(6)
+#define YCBCR444_16bit BIT(7)
+
+#define YCBCR422_8bit_NO_SUPPORT BIT(8)
+#define YCBCR422_10bit_NO_SUPPORT BIT(9)
+#define YCBCR422_12bit BIT(10)
+#define YCBCR422_16bit_NO_SUPPORT BIT(11)
+
+#define YCBCR420_8bit BIT(12)
+#define YCBCR420_10bit BIT(13)
+#define YCBCR420_12bit BIT(14)
+#define YCBCR420_16bit BIT(15)
+
+
 #define BYTES_TO_UINT32(msb, b1, b2, lsb)
         \
 	(((msb & 0xff) << 24) + ((b1 & 0xff) << 16) + ((b2 & 0xff) << 8) +     \
 	 ((lsb & 0xff)))

-static const char *const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] =3D {
+const char *const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] =3D {
 	[MTK_HDMI_CLK_UNIVPLL_D6D4] =3D "univpll_d6_d4",
 	[MTK_HDMI_CLK_MSDCPLL_D2] =3D "msdcpll_d2",
 	[MTK_HDMI_CLK_HDMI_APB_SEL] =3D "hdmi_apb_sel",
@@ -46,63 +67,11 @@ static const char *const
mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] =3D {
 	[MTK_HDMI_VPP_SPLIT_HDMI] =3D "split_hdmi",
 };

-static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
-{
-	return container_of(b, struct mtk_hdmi, bridge);
-}
-
 static inline struct mtk_hdmi *hdmi_ctx_from_conn(struct drm_connector *c)
 {
 	return container_of(c, struct mtk_hdmi, conn);
 }

-static struct mtk_hdmi_ddc *hdmi_ddc_ctx_from_mtk_hdmi(struct mtk_hdmi *hd=
mi)
-{
-	return container_of(hdmi->ddc_adpt, struct mtk_hdmi_ddc, adap);
-}
-
-static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
-{
-	return readl(hdmi->regs + offset);
-}
-
-static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
-{
-	writel(val, hdmi->regs + offset);
-}
-
-static inline void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset,
-				       u32 bits)
-{
-	void __iomem *reg =3D hdmi->regs + offset;
-	u32 tmp;
-
-	tmp =3D readl(reg);
-	tmp &=3D ~bits;
-	writel(tmp, reg);
-}
-
-static inline void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset,
-				     u32 bits)
-{
-	void __iomem *reg =3D hdmi->regs + offset;
-	u32 tmp;
-
-	tmp =3D readl(reg);
-	tmp |=3D bits;
-	writel(tmp, reg);
-}
-
-static void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 =
mask)
-{
-	void __iomem *reg =3D hdmi->regs + offset;
-	u32 tmp;
-
-	tmp =3D readl(reg);
-	tmp =3D (tmp & ~mask) | (val & mask);
-	writel(tmp, reg);
-}
-
 static inline void mtk_hdmi_clr_all_int_status(struct mtk_hdmi *hdmi)
 {
 	/*clear all tx irq*/
@@ -251,6 +220,7 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi
*hdmi, bool black)
 		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
 }

+//TODO: not compatible
 static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
 {
 	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0 << HDMITX_SW_RSTB_SHIFT,
@@ -276,6 +246,7 @@ static bool mtk_hdmi_sink_is_hdmi_device(struct
mtk_hdmi *hdmi)
 		return true;
 }

+//TODO: not compatible
 static void mtk_hdmi_set_deep_color(struct mtk_hdmi *hdmi, bool is_hdmi_si=
nk)
 {
 	unsigned int deep_color =3D 0;
@@ -345,6 +316,7 @@ static void mtk_hdmi_hw_avi_infoframe(struct
mtk_hdmi *hdmi, u8 *buffer, u8 len)
 		      AVI_EN_WR | AVI_EN);
 }

+//TODO: not common
 static void mtk_hdmi_hw_spd_infoframe(struct mtk_hdmi *hdmi, u8
*buffer, u8 len)
 {
 	mtk_hdmi_mask(hdmi, TOP_INFO_EN, SPD_DIS_WR | SPD_DIS,
@@ -387,6 +359,7 @@ static void mtk_hdmi_hw_spd_infoframe(struct
mtk_hdmi *hdmi, u8 *buffer, u8 len)
 		      SPD_EN_WR | SPD_EN);
 }

+//TODO: not compatible
 static inline void mtk_hdmi_hw_send_av_mute(struct mtk_hdmi *hdmi)
 {
 	/*GCP packet */
@@ -401,6 +374,7 @@ static inline void mtk_hdmi_hw_send_av_mute(struct
mtk_hdmi *hdmi)
 	mtk_hdmi_mask(hdmi, TOP_INFO_EN, CP_EN | CP_EN_WR, CP_EN | CP_EN_WR);
 }

+//TODO: not compatible
 static inline void mtk_hdmi_hw_send_av_unmute(struct mtk_hdmi *hdmi)
 {
 	/*GCP packet */
@@ -415,73 +389,9 @@ static inline void
mtk_hdmi_hw_send_av_unmute(struct mtk_hdmi *hdmi)
 	mtk_hdmi_mask(hdmi, TOP_INFO_EN, CP_EN | CP_EN_WR, CP_EN | CP_EN_WR);
 }

-static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
-					struct drm_display_mode *mode)
-{
-	struct hdmi_avi_infoframe frame;
-	u8 buffer[17];
-	ssize_t err;
-	bool is_hdmi2x_sink =3D false;
-
-	if (hdmi->conn.display_info.hdmi.scdc.supported)
-		is_hdmi2x_sink =3D
-			true; //if support scdc, then the sink support HDMI2.0
-
-	err =3D drm_hdmi_avi_infoframe_from_display_mode(&frame, &hdmi->conn,
-						       mode);
-
-	if (err < 0) {
-		dev_err(hdmi->dev,
-			"Failed to get AVI infoframe from mode: %zd\n", err);
-		return err;
-	}
-
-	frame.colorimetry =3D hdmi->colorimtery;
-	//no need, since we cannot support other extended colorimetry?
-	if (frame.colorimetry =3D=3D HDMI_COLORIMETRY_EXTENDED)
-		frame.extended_colorimetry =3D hdmi->extended_colorimetry;
-
-	/* quantiation range:limited or full */
-	if (frame.colorspace =3D=3D HDMI_COLORSPACE_RGB)
-		frame.quantization_range =3D hdmi->quantization_range;
-	else
-		frame.ycc_quantization_range =3D hdmi->ycc_quantization_range;
-	err =3D hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
-
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %zd\n", err);
-		return err;
-	}

-	mtk_hdmi_hw_avi_infoframe(hdmi, buffer, sizeof(buffer));
-	return 0;
-}
-
-static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi,
-					const char *vendor, const char *product)
-{
-	struct hdmi_spd_infoframe frame;
-	u8 buffer[29];
-	ssize_t err;
-
-	err =3D hdmi_spd_infoframe_init(&frame, vendor, product);
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
-			err);
-		return err;
-	}
-
-	err =3D hdmi_spd_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to pack SDP infoframe: %zd\n", err);
-		return err;
-	}
-
-	mtk_hdmi_hw_spd_infoframe(hdmi, buffer, sizeof(buffer));
-	return 0;
-}
-
-static void mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
+//TODO: not common
+void mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
 {
 	hdmi->hpd =3D HDMI_PLUG_OUT;
 	hdmi->set_csp_depth =3D RGB444_8bit;
@@ -538,26 +448,13 @@ static void
mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
 		mtk_hdmi_yuv420_downsample(hdmi, false);
 }

+//TODO: not common
 static void mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
 					     struct drm_display_mode *mode)
 {
 	mtk_hdmi_change_video_resolution(hdmi);
 }

-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node =
*np)
-{
-	int i;
-
-	for (i =3D 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
-		hdmi->clk[i] =3D of_clk_get_by_name(np, mtk_hdmi_clk_names[i]);
-
-		if (IS_ERR(hdmi->clk[i]))
-			return PTR_ERR(hdmi->clk[i]);
-	}
-
-	return 0;
-}
-
 static void mtk_hdmi_clk_enable(struct mtk_hdmi *hdmi)
 {
 	int i;
@@ -576,7 +473,7 @@ static void mtk_hdmi_clk_enable(struct mtk_hdmi *hdmi)
 	}
 }

-static void mtk_hdmi_clk_disable(struct mtk_hdmi *hdmi)
+void mtk_hdmi_clk_disable(struct mtk_hdmi *hdmi)
 {
 	int i;

@@ -844,8 +741,6 @@ static void mtk_hdmi_connetor_init_property(struct
drm_device *drm_dev,
 	if (!prop)
 		return;

-	hdmi->hdmi_info_blob =3D prop;
-	hdmi->hdmi_info_blob_ptr =3D NULL;
 	drm_object_attach_property(&conn->base, prop, 0);
 }

@@ -953,6 +848,7 @@ static struct drm_encoder
*mtk_hdmi_conn_best_enc(struct drm_connector *conn)
 	return hdmi->bridge.encoder;
 }

+//TODO: no connector in orig driver
 static const struct drm_connector_funcs mtk_hdmi_connector_funcs =3D {
 	.detect =3D hdmi_conn_detect,
 	.fill_modes =3D drm_helper_probe_single_connector_modes,
@@ -974,6 +870,7 @@ static const struct drm_connector_helper_funcs
mtk_hdmi_connector_helper_funcs =3D
  * Bridge callbacks
  */

+//TODO: not common
 static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 				  enum drm_bridge_attach_flags flags)
 {
@@ -1005,27 +902,8 @@ static int mtk_hdmi_bridge_attach(struct
drm_bridge *bridge,
 	return 0;
 }

-static struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
-					     struct drm_connector *connector)
-{
-	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
-	struct edid *edid;
-
-	if (!hdmi->ddc_adpt)
-		return NULL;
-	edid =3D drm_get_edid(connector, hdmi->ddc_adpt);
-	if (!edid)
-		return NULL;
-	return edid;
-}
-
-static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}

+//TODO: not common
 static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
@@ -1042,6 +920,7 @@ static void mtk_hdmi_bridge_disable(struct
drm_bridge *bridge)
 	hdmi->enabled =3D false;
 }

+//TODO: not common
 static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
@@ -1056,26 +935,12 @@ static void mtk_hdmi_bridge_post_disable(struct
drm_bridge *bridge)
 	mtk_hdmi_reset_colorspace_setting(hdmi);
 }

-static void
-mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-			 const struct drm_display_mode *mode,
-			 const struct drm_display_mode *adjusted_mode)
-{
-	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
-
-	drm_mode_copy(&hdmi->mode, adjusted_mode);
-}
-
-static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
-				    struct drm_display_mode *mode)
-{
-	mtk_hdmi_setup_avi_infoframe(hdmi, mode);
-	mtk_hdmi_setup_spd_infoframe(hdmi, "mediatek", "On-chip HDMI");
-}
-
+//TODO:not common
 static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
+	u8 buffer_spd[HDMI_INFOFRAME_HEADER_SIZE + HDMI_SPD_INFOFRAME_SIZE];
+	u8 buffer_avi[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
 	union phy_configure_opts opts =3D {
 		.dp =3D { .link_rate =3D hdmi->mode.clock * 1000 }
 	};
@@ -1084,11 +949,14 @@ static void mtk_hdmi_bridge_pre_enable(struct
drm_bridge *bridge)
 	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
 	phy_configure(hdmi->phy, &opts);
 	phy_power_on(hdmi->phy);
-	mtk_hdmi_send_infoframe(hdmi, &hdmi->mode);
+	mtk_hdmi_send_infoframe(hdmi, buffer_spd, sizeof(buffer_spd),
buffer_avi, sizeof(buffer_avi), &hdmi->mode);
+	mtk_hdmi_hw_spd_infoframe(hdmi, buffer_spd, sizeof(buffer_avi));
+	mtk_hdmi_hw_avi_infoframe(hdmi, buffer_avi, sizeof(buffer_spd));

 	hdmi->powered =3D true;
 }

+//TODO:not common
 static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
@@ -1099,7 +967,7 @@ static void mtk_hdmi_bridge_enable(struct
drm_bridge *bridge)
 	hdmi->enabled =3D true;
 }

-static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs =3D {
+const struct drm_bridge_funcs mtk_mt8195_hdmi_bridge_funcs =3D {
 	.attach =3D mtk_hdmi_bridge_attach,
 	.mode_fixup =3D mtk_hdmi_bridge_mode_fixup,
 	.disable =3D mtk_hdmi_bridge_disable,
@@ -1110,88 +978,6 @@ static const struct drm_bridge_funcs
mtk_hdmi_bridge_funcs =3D {
 	.get_edid =3D mtk_hdmi_bridge_get_edid,
 };

-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-				   struct platform_device *pdev)
-{
-	struct device *dev =3D &pdev->dev;
-	struct device_node *np =3D dev->of_node;
-	struct device_node *i2c_np;
-	struct resource *mem;
-	int ret;
-	struct mtk_hdmi_ddc *ddc;
-
-	ret =3D mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret)
-		return ret;
-
-	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem)
-		return -ENOMEM;
-
-	hdmi->regs =3D devm_ioremap_resource(dev, mem);
-	if (IS_ERR(hdmi->regs))
-		return PTR_ERR(hdmi->regs);
-
-	i2c_np =3D of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
-	if (!i2c_np) {
-		of_node_put(pdev->dev.of_node);
-		return -EINVAL;
-	}
-
-	hdmi->ddc_adpt =3D of_find_i2c_adapter_by_node(i2c_np);
-	if (!hdmi->ddc_adpt)
-		return -EPROBE_DEFER;
-
-	ddc =3D hdmi_ddc_ctx_from_mtk_hdmi(hdmi);
-	ddc->regs =3D hdmi->regs;
-
-	return 0;
-}
-
-static int mtk_drm_hdmi_probe(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi;
-	struct device *dev =3D &pdev->dev;
-	int ret;
-
-	hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
-
-	hdmi->dev =3D dev;
-
-	hdmi->phy =3D devm_phy_get(dev, "hdmi");
-	if (IS_ERR(hdmi->phy)) {
-		ret =3D PTR_ERR(hdmi->phy);
-		return ret;
-	}
-
-	ret =3D mtk_hdmi_dt_parse_pdata(hdmi, pdev);
-	if (ret)
-		return ret;
-
-	platform_set_drvdata(pdev, hdmi);
-
-	mtk_hdmi_output_init(hdmi);
-
-	hdmi->bridge.funcs =3D &mtk_hdmi_bridge_funcs;
-	hdmi->bridge.of_node =3D pdev->dev.of_node;
-	drm_bridge_add(&hdmi->bridge);
-
-	return 0;
-}
-
-static int mtk_drm_hdmi_remove(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi =3D platform_get_drvdata(pdev);
-
-	drm_bridge_remove(&hdmi->bridge);
-	mtk_hdmi_clk_disable(hdmi);
-	i2c_put_adapter(hdmi->ddc_adpt);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
index 5eaa1485cc0c..fbbfa6164292 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
@@ -9,97 +9,6 @@

 #include <linux/hdmi.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_edid.h>
-#include <linux/platform_device.h>
-#include <linux/i2c.h>
-#include <sound/hdmi-codec.h>
-#include <linux/clk.h>
-#include <linux/mutex.h>
-
-//#include "../../../phy/mediatek/phy-mtk-hdmi-mt8195.h"
-
-#define RGB444_8bit BIT(0)
-#define RGB444_10bit BIT(1)
-#define RGB444_12bit BIT(2)
-#define RGB444_16bit BIT(3)
-
-#define YCBCR444_8bit BIT(4)
-#define YCBCR444_10bit BIT(5)
-#define YCBCR444_12bit BIT(6)
-#define YCBCR444_16bit BIT(7)
-
-#define YCBCR422_8bit_NO_SUPPORT BIT(8)
-#define YCBCR422_10bit_NO_SUPPORT BIT(9)
-#define YCBCR422_12bit BIT(10)
-#define YCBCR422_16bit_NO_SUPPORT BIT(11)
-
-#define YCBCR420_8bit BIT(12)
-#define YCBCR420_10bit BIT(13)
-#define YCBCR420_12bit BIT(14)
-#define YCBCR420_16bit BIT(15)
-
-enum hdmi_color_depth { HDMI_8_BIT, HDMI_10_BIT, HDMI_12_BIT, HDMI_16_BIT =
};
-
-enum mtk_hdmi_clk_id {
-	MTK_HDMI_CLK_UNIVPLL_D6D4,
-	MTK_HDMI_CLK_MSDCPLL_D2,
-	MTK_HDMI_CLK_HDMI_APB_SEL,
-	MTK_HDMI_UNIVPLL_D4D8,
-	MTK_HDIM_HDCP_SEL,
-	MTK_HDMI_HDCP_24M_SEL,
-	MTK_HDMI_VPP_SPLIT_HDMI,
-	MTK_HDMI_CLK_COUNT,
-};
-
-enum hdmi_hpd_state {
-	HDMI_PLUG_OUT =3D 0,
-	HDMI_PLUG_IN_AND_SINK_POWER_ON,
-	HDMI_PLUG_IN_ONLY,
-};
-
-struct mtk_hdmi {
-	struct drm_bridge bridge;
-	struct drm_connector conn;
-	struct device *dev;
-	struct phy *phy;
-	struct cec_notifier *notifier;
-	struct i2c_adapter *ddc_adpt;
-	struct clk *clk[MTK_HDMI_CLK_COUNT];
-	struct drm_display_mode mode;
-	struct mtk_edid_params *edid_params;
-	struct mtk_hdmi_sink_av_cap *sink_avcap;
-	bool dvi_mode;
-	u32 max_hdisplay;
-	u32 max_vdisplay;
-	void __iomem *regs;
-	spinlock_t property_lock;
-	struct drm_property *hdmi_info_blob;
-	struct drm_property_blob *hdmi_info_blob_ptr;
-	struct drm_property *csp_depth_prop;
-	u64 support_csp_depth;
-	u64 set_csp_depth;
-	enum hdmi_colorspace csp;
-	enum hdmi_color_depth color_depth;
-	enum hdmi_colorimetry colorimtery;
-	enum hdmi_extended_colorimetry extended_colorimetry;
-	enum hdmi_quantization_range quantization_range;
-	enum hdmi_ycc_quantization_range ycc_quantization_range;
-
-	struct device *codec_dev;
-	hdmi_codec_plugged_cb plugged_cb;
-
-	bool powered;
-	bool enabled;
-	unsigned int hdmi_irq;
-	enum hdmi_hpd_state hpd;
-
-	bool hdmi_enabled;
-	bool power_clk_enabled;
-	bool irq_registered;
-};

 #if defined(CONFIG_DRM_MEDIATEK_HDMI) ||
         \
 	defined(CONFIG_DRM_MEDIATEK_HDMI_MODULE)
