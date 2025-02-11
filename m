Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEAA309E6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD49898C4;
	Tue, 11 Feb 2025 11:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AQdgLb6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8169898C4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:27:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5de5bf41652so5337558a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739273276; x=1739878076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0yMHczjz8M9kD6dwWyu3+PHY3YM20OwKcyo4SL8AFQ=;
 b=AQdgLb6Fyc7T96gnywT1X5AaI44fggXczVJ4M0HiAWLRpPxMgZcIz0ehO/xiS/k2wX
 MNgQ/DevfVW/aENxBEZsnv5gFpjof5CoFKGT9/0iTi3qJy/FzJbd3Znibkz6B7b33AqL
 eXMbLHEEPxaDC++628qe/iy2t4U/atNeAF4oEGEhgPE0a4tYepB1x107YOZzkRaJVmgf
 Am2S3AQIOw7ti5tX7wH42dullvi/TyIDg6h34czNd2l0oZqfN+1rvYK7HwtpQ3BHJ8bS
 ArBt69DTppwp9tcKYjnn7w9qhKqg4Z8bXqjbxAnPibgVceMCdeY48r0lO6DrymA5G7bW
 R/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739273276; x=1739878076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0yMHczjz8M9kD6dwWyu3+PHY3YM20OwKcyo4SL8AFQ=;
 b=ANCguf7nkrj+haro0uYMrHbCtZNdQdsR6hAMUNNXKqiJO02fX9tmVIXLGlis1UQalx
 kBDYv2w8N0NW3SC4K7qZHlDfgsmOkM/KHQSmPuosfaRBe32j5U3i5Lbthoqv8GD/JByn
 htdSlvbG22ctMDjQQhl/i8X+m0ei0JkKUjfsajVmTc3CkQyoW33/BNRzQ9WqDm+UEzW+
 90nJGljvvNrsgCuJHP23+XmSbbCNbBRh6wepykgtkaSkr2ZUbWIsLjMPFmLkYPPdtDIu
 cG9ComdbiwAxjyl7MiqwA0LtQnYDcojgUkGgfZLLJLwFdH/cMvYefpkE07f/1VZ0SUtb
 psyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoVt1sRYikb191pRynDwcGo0x/Z9SwoeZzNMBjXZ/USj1OIgg1JCgxxXanWHqhq4wEOyfcDJCugmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNXFZAt4z8j9VcypEwTATqY2BTG2s+NFtjPAI7NAiZmjsI+OrB
 ZZHFegrLrVtZmarIa1o09BWWQ8Abp6LtNZbrGT/IcAmKfTG2jpaRAly6OCjUT/g7Bks6SV5X03N
 +FTlTPW/mTYloxqwYU8S5NBiXS0Q=
X-Gm-Gg: ASbGnctjt9FHVEtpwUeI6R43jJI6SB5IzuIHE2cSE6lyk+sjlsCoNfDKbwig3y6sRBo
 ELlROmmy9IYvKaYBlzADTQi+vDWCfFC5++xq223hUGm2HXEQ+0oFk0OIwg2ZI8xXaljGsSgVwWP
 4=
X-Google-Smtp-Source: AGHT+IF/SQVLZlgYt2+kB9r9R4LA1zqr/LChdnFtMSz0wxkL0L5rvVMAk3aiu3/dSl4kO9IZg3mx5jZig4rDe7Du2GU=
X-Received: by 2002:a05:6402:26cf:b0:5dc:7f96:6244 with SMTP id
 4fb4d7f45d1cf-5de45089cddmr17334738a12.23.1739273275913; Tue, 11 Feb 2025
 03:27:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <b0ac8b81fbb8955ed8ada27aba423cff45aad9f6.1735550269.git.zhoubinbin@loongson.cn>
 <f365c722-c294-4834-8c84-fd6dcd4a9ee9@suse.de>
In-Reply-To: <f365c722-c294-4834-8c84-fd6dcd4a9ee9@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 11 Feb 2025 17:27:40 +0600
X-Gm-Features: AWEUYZnb3dscGNJT9s6G1vg-Vy1f7oqZw8j1Zx2LxLMDaKaNlEv-csOyPVmBwJ8
Message-ID: <CAMpQs4JXKu4GDD79Mdkq9vASSDE_5SQsjsg4htfaZ5yGm3=k5g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/ls2kbmc: Add Loongson-2K BMC reset function
 support
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huacai Chen <chenhuacai@kernel.org>, 
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 dri-devel@lists.freedesktop.org, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, Chong Qiao <qiaochong@loongson.cn>
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

Hi Thomas:

Sorry for my late reply and thanks for your advice.

On Wed, Jan 15, 2025 at 2:57=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
>
> Am 30.12.24 um 10:31 schrieb Binbin Zhou:
> > Since the display is a sub-function of the Loongson-2K BMC, when the
> > BMC reset, the entire BMC PCIe is disconnected, including the display
> > which is interrupted.
>
> To me, that's a strong indicator to set up the entire thing from scratch.
>
> >
> > Not only do you need to save/restore the relevant PCIe registers
> > throughout the reset process, but you also need to re-push the display
> > to the monitor at the end.
> >
> > Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >   drivers/gpu/drm/tiny/ls2kbmc.c | 284 ++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 283 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/tiny/ls2kbmc.c b/drivers/gpu/drm/tiny/ls2k=
bmc.c
> > index 909d6c687193..4b440f20cb4d 100644
> > --- a/drivers/gpu/drm/tiny/ls2kbmc.c
> > +++ b/drivers/gpu/drm/tiny/ls2kbmc.c
>
> Move all the reset detection into the BMC core driver. When you see a
> reset, remove the display's platform device via
> platform_device_unregister(). This will release the device  and the DRM
> driver on top. We do this for simpledrm/efifb/etc. Hence user-space code
> is able to deal with it. Then set up a new platform device when the new
> framebuffer is available. Your DRM driver will bind to it and user-space
> code will continue with the new DRM device.

I tried to refactor the bmc restart part according to your scheme. I'm
not quite sure if the experimental results are exactly right.

Key part:

New solution:
1. platform_device_unregister(simpledrm)
2. wait and detect if the BMC reboot is complete;
3. platform_device_register_resndata(simpledrm)

Original solution:
1. wait and detect if the BMC reboot is complete;
2. ls2kbmc_push_drm_mode() pushes display data such as crtc.

When the BMC reboot is completed, the display in the new solution will
lose all the information of the previous desktop and redisplay the
system login interface, while the original solution will keep the
desktop information.

Is this normal for our new solution, or is there something wrong with
my implementation?

>
> Best regards
> Thomas
>
> > @@ -8,10 +8,12 @@
> >    */
> >
> >   #include <linux/aperture.h>
> > +#include <linux/delay.h>
> >   #include <linux/minmax.h>
> >   #include <linux/pci.h>
> >   #include <linux/platform_data/simplefb.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/stop_machine.h>
> >
> >   #include <drm/drm_atomic.h>
> >   #include <drm/drm_atomic_state_helper.h>
> > @@ -32,9 +34,27 @@
> >   #include <drm/drm_panic.h>
> >   #include <drm/drm_probe_helper.h>
> >
> > +#define BMC_RESET_DELAY      (60 * HZ)
> > +#define BMC_RESET_WAIT       10000
> > +
> > +static const u32 index[] =3D { 0x4, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24=
,
> > +                          0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80 };
> > +static const u32 cindex[] =3D { 0x4, 0x10, 0x3c };
> > +
> > +struct ls2kbmc_pci_data {
> > +     u32 d80c;
> > +     u32 d71c;
> > +     u32 data[14];
> > +     u32 cdata[3];
> > +};
> > +
> >   struct ls2kbmc_pdata {
> >       struct pci_dev *pdev;
> > +     struct drm_device *ddev;
> > +     struct work_struct bmc_work;
> > +     unsigned long reset_time;
> >       struct simplefb_platform_data pd;
> > +     struct ls2kbmc_pci_data pci_data;
> >   };
> >
> >   /*
> > @@ -583,6 +603,265 @@ static struct ls2kbmc_device *ls2kbmc_device_crea=
te(struct drm_driver *drv,
> >       return sdev;
> >   }
> >
> > +static bool ls2kbmc_bar0_addr_is_set(struct pci_dev *ppdev)
> > +{
> > +     u32 addr;
> > +
> > +     pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
> > +     addr &=3D PCI_BASE_ADDRESS_MEM_MASK;
> > +
> > +     return addr ? true : false;
> > +}
> > +
> > +static void ls2kbmc_save_pci_data(struct ls2kbmc_pdata *priv)
> > +{
> > +     struct pci_dev *pdev =3D priv->pdev;
> > +     struct pci_dev *parent =3D pdev->bus->self;
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(index); i++)
> > +             pci_read_config_dword(parent, index[i], &priv->pci_data.d=
ata[i]);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(cindex); i++)
> > +             pci_read_config_dword(pdev, cindex[i], &priv->pci_data.cd=
ata[i]);
> > +
> > +     pci_read_config_dword(parent, 0x80c, &priv->pci_data.d80c);
> > +     priv->pci_data.d80c =3D (priv->pci_data.d80c & ~(3 << 17)) | (1 <=
< 17);
> > +
> > +     pci_read_config_dword(parent, 0x71c, &priv->pci_data.d71c);
> > +     priv->pci_data.d71c |=3D 1 << 26;
> > +}
> > +
> > +static bool ls2kbmc_check_pcie_connected(struct pci_dev *parent, struc=
t drm_device *dev)
> > +{
> > +     void __iomem *mmio;
> > +     int sts, timeout =3D 10000;
> > +
> > +     mmio =3D pci_iomap(parent, 0, 0x100);
> > +     if (!mmio)
> > +             return false;
> > +
> > +     writel(readl(mmio) | 0x8, mmio);
> > +     while (timeout) {
> > +             sts =3D readl(mmio + 0xc);
> > +             if ((sts & 0x11) =3D=3D 0x11)
> > +                     break;
> > +             mdelay(1);
> > +             timeout--;
> > +     }
> > +
> > +     pci_iounmap(parent, mmio);
> > +
> > +     if (!timeout) {
> > +             drm_err(dev, "pcie train failed status=3D0x%x\n", sts);
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +static int ls2kbmc_recove_pci_data(void *data)
> > +{
> > +     struct ls2kbmc_pdata *priv =3D data;
> > +     struct pci_dev *pdev =3D priv->pdev;
> > +     struct drm_device *dev =3D priv->ddev;
> > +     struct pci_dev *parent =3D pdev->bus->self;
> > +     u32 i, timeout, retry =3D 0;
> > +     bool ready;
> > +
> > +     pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
> > +     pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
> > +     pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);
> > +
> > +     timeout =3D 10000;
> > +     while (timeout) {
> > +             ready =3D ls2kbmc_bar0_addr_is_set(parent);
> > +             if (!ready)
> > +                     break;
> > +             mdelay(1);
> > +             timeout--;
> > +     };
> > +
> > +     if (!timeout)
> > +             drm_warn(dev, "bar not clear 0\n");
> > +
> > +retrain:
> > +     for (i =3D 0; i < ARRAY_SIZE(index); i++)
> > +             pci_write_config_dword(parent, index[i], priv->pci_data.d=
ata[i]);
> > +
> > +     pci_write_config_dword(parent, 0x80c, priv->pci_data.d80c);
> > +     pci_write_config_dword(parent, 0x71c, priv->pci_data.d71c);
> > +
> > +     /* Check if the pcie is connected */
> > +     ready =3D ls2kbmc_check_pcie_connected(parent, dev);
> > +     if (!ready)
> > +             return ready;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(cindex); i++)
> > +             pci_write_config_dword(pdev, cindex[i], priv->pci_data.cd=
ata[i]);
> > +
> > +     drm_info(dev, "pcie recovered done\n");
> > +
> > +     if (!retry) {
> > +             /*wait u-boot ddr config */
> > +             mdelay(BMC_RESET_WAIT);
> > +             ready =3D ls2kbmc_bar0_addr_is_set(parent);
> > +             if (!ready) {
> > +                     retry =3D 1;
> > +                     goto retrain;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ls2kbmc_push_drm_mode(struct drm_device *dev)
> > +{
> > +     struct ls2kbmc_device *sdev =3D ls2kbmc_device_of_dev(dev);
> > +     struct drm_crtc *crtc =3D &sdev->crtc;
> > +     struct drm_plane *plane =3D crtc->primary;
> > +     struct drm_connector *connector =3D &sdev->connector;
> > +     struct drm_framebuffer *fb =3D NULL;
> > +     struct drm_mode_set set;
> > +     struct drm_modeset_acquire_ctx ctx;
> > +     int ret;
> > +
> > +     mutex_lock(&dev->mode_config.mutex);
> > +     connector->funcs->fill_modes(connector, 4096, 4096);
> > +     mutex_unlock(&dev->mode_config.mutex);
> > +
> > +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
> > +                                DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret=
);
> > +
> > +     if (plane->state)
> > +             fb =3D plane->state->fb;
> > +     else
> > +             fb =3D plane->fb;
> > +
> > +     if (!fb) {
> > +             drm_dbg(dev, "CRTC doesn't have current FB\n");
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     drm_framebuffer_get(fb);
> > +
> > +     set.crtc =3D crtc;
> > +     set.x =3D 0;
> > +     set.y =3D 0;
> > +     set.mode =3D &sdev->mode;
> > +     set.connectors =3D &connector;
> > +     set.num_connectors =3D 1;
> > +     set.fb =3D fb;
> > +
> > +     ret =3D crtc->funcs->set_config(&set, &ctx);
> > +
> > +out:
> > +     DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static void ls2kbmc_events_fn(struct work_struct *work)
> > +{
> > +     struct ls2kbmc_pdata *priv =3D container_of(work, struct ls2kbmc_=
pdata, bmc_work);
> > +
> > +     /*
> > +      * The pcie is lost when the BMC resets,
> > +      * at which point access to the pcie from other CPUs
> > +      * is suspended to prevent a crash.
> > +      */
> > +     stop_machine(ls2kbmc_recove_pci_data, priv, NULL);
> > +
> > +     drm_info(priv->ddev, "redraw console\n");
> > +
> > +     /* We need to re-push the display due to previous pcie loss. */
> > +     ls2kbmc_push_drm_mode(priv->ddev);
> > +}
> > +
> > +static irqreturn_t ls2kbmc_interrupt(int irq, void *arg)
> > +{
> > +     struct ls2kbmc_pdata *priv =3D arg;
> > +
> > +     if (system_state !=3D SYSTEM_RUNNING)
> > +             return IRQ_HANDLED;
> > +
> > +     /* skip interrupt in BMC_RESET_DELAY */
> > +     if (time_after(jiffies, priv->reset_time + BMC_RESET_DELAY))
> > +             schedule_work(&priv->bmc_work);
> > +
> > +     priv->reset_time =3D jiffies;
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +#define BMC_RESET_GPIO                       14
> > +#define LOONGSON_GPIO_REG_BASE               0x1fe00500
> > +#define LOONGSON_GPIO_REG_SIZE               0x18
> > +#define LOONGSON_GPIO_OEN            0x0
> > +#define LOONGSON_GPIO_FUNC           0x4
> > +#define LOONGSON_GPIO_INTPOL         0x10
> > +#define LOONGSON_GPIO_INTEN          0x14
> > +
> > +/* The gpio interrupt is a watchdog interrupt that is triggered when t=
he BMC resets. */
> > +static int ls2kbmc_gpio_reset_handler(struct ls2kbmc_pdata *priv)
> > +{
> > +     int irq, ret =3D 0;
> > +     int gsi =3D 16 + (BMC_RESET_GPIO & 7);
> > +     void __iomem *gpio_base;
> > +
> > +     /* Since Loongson-3A hardware does not support GPIO interrupt cas=
cade,
> > +      * chip->gpio_to_irq() cannot be implemented,
> > +      * here acpi_register_gsi() is used to get gpio irq.
> > +      */
> > +     irq =3D acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_AC=
TIVE_LOW);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     gpio_base =3D ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_S=
IZE);
> > +     if (!gpio_base) {
> > +             acpi_unregister_gsi(gsi);
> > +             return PTR_ERR(gpio_base);
> > +     }
> > +
> > +     writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(BMC_RESET_GPIO)=
,
> > +            gpio_base + LOONGSON_GPIO_OEN);
> > +     writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(BMC_RESET_GPI=
O),
> > +            gpio_base + LOONGSON_GPIO_FUNC);
> > +     writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(BMC_RESET_G=
PIO),
> > +            gpio_base + LOONGSON_GPIO_INTPOL);
> > +     writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(BMC_RESET_GPI=
O),
> > +            gpio_base + LOONGSON_GPIO_INTEN);
> > +
> > +     ret =3D request_irq(irq, ls2kbmc_interrupt, IRQF_SHARED | IRQF_TR=
IGGER_FALLING,
> > +                       "ls2kbmc gpio", priv);
> > +
> > +     acpi_unregister_gsi(gsi);
> > +     iounmap(gpio_base);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ls2kbmc_pdata_initial(struct platform_device *pdev, struct =
ls2kbmc_pdata *priv)
> > +{
> > +     int ret;
> > +
> > +     priv->pdev =3D *(struct pci_dev **)dev_get_platdata(&pdev->dev);
> > +
> > +     ls2kbmc_save_pci_data(priv);
> > +
> > +     INIT_WORK(&priv->bmc_work, ls2kbmc_events_fn);
> > +
> > +     ret =3D request_irq(priv->pdev->irq, ls2kbmc_interrupt,
> > +                       IRQF_SHARED | IRQF_TRIGGER_RISING, "ls2kbmc pci=
e", priv);
> > +     if (ret) {
> > +             pr_err("request_irq(%d) failed\n", priv->pdev->irq);
> > +             return ret;
> > +     }
> > +
> > +     return ls2kbmc_gpio_reset_handler(priv);
> > +}
> > +
> >   /*
> >    * Platform driver
> >    */
> > @@ -598,12 +877,15 @@ static int ls2kbmc_probe(struct platform_device *=
pdev)
> >       if (IS_ERR(priv))
> >               return -ENOMEM;
> >
> > -     priv->pdev =3D *(struct pci_dev **)dev_get_platdata(&pdev->dev);
> > +     ret =3D ls2kbmc_pdata_initial(pdev, priv);
> > +     if (ret)
> > +             return ret;
> >
> >       sdev =3D ls2kbmc_device_create(&ls2kbmc_driver, pdev, priv);
> >       if (IS_ERR(sdev))
> >               return PTR_ERR(sdev);
> >       dev =3D &sdev->dev;
> > +     priv->ddev =3D &sdev->dev;
> >
> >       ret =3D drm_dev_register(dev, 0);
> >       if (ret)
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


--
Thanks.
Binbin
