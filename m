Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D23C14CD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 16:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EDF6E8BE;
	Thu,  8 Jul 2021 14:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406146E890
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625752868;
 bh=wJLSJn1hGsIV0cT50m36a3Mvxx5NqHn/rVaA7yriqQ4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hh7sgOhe6tpcP0zZFu9hYFPRWLbZXF5z6Z4O+MLvpwrmPfUKDH9ZbQWHC0xBijdUU
 MluClb3UbtUj+nMzx7ZUe4ULV01FCu6hEF50FV+6HqJS6s2mjB5eNO2NxFBBwdIrxj
 pGzu6/+TmmEcF0qqJlMjXWFEBmiBQ4KWNFXGlT0o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.159] ([217.61.147.159]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Thu, 8 Jul 2021
 16:01:08 +0200
MIME-Version: 1.0
Message-ID: <trinity-4ed3af00-b67c-468b-be4c-1e4b2379eca6-1625752868027@3c-app-gmx-bap19>
From: Frank Wunderlich <frank-w@public-files.de>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Aw: Re:  Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 8 Jul 2021 16:01:08 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <df431199-0c65-fb9a-02b4-9f84899f37ee@collabora.com>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <df431199-0c65-fb9a-02b4-9f84899f37ee@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:8e+4dnkz5HdUeEwQAIbBhX/zyuSBFGQIIRaR0vNHkeVSovxQzS8gZ42XihYzt8dz1/lDa
 S934zUN3XxKxF8jj1GqmJudA8mCZHQghn2OkR/0ufVP5AAYXhKUbvWhVSKsnPVzHNc3aDZ1XBF51
 X6/HOGeSxxcB7LJ5IwugC+QmRsa1/stBj68AkaXAf3muG7aTiQEnVH9YnAIa+moqX5Y05aTqDQKC
 V58CpzCUoNoLbNBrZWNgZqiRSHJpeOmrL0IlPO/6kR2MfJPx0d7ZLGF7Y3VVeDAafVai5sDXq76z
 tM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z90GzCAze48=:gvRIenqr4jAzeeWVhzfOQP
 BtPbImyxhCbmc1PxyGIEepLj6KQJsnUfElejdvg0ZzrONhM/pSdfLy+zGVYCiWVeYUapXGVAp
 eSPBsqcZluzjWtS3VxncB7VF7HFbonk1mrJ8+sI4dPepWRedXEX5eCBasCZ6j1y16Q08+aFOr
 pC81vY32oqpUlCyPFQT//U5Lv5JBYw2tLYHlUaOS2zt3nMvdfRyt28z0g68U3DjoCg/r32x5Y
 oj1br4ye4uCkdXjz+A3/Dv+4rrrmwFsPf5Joe2sy2a0Vjb8uhDoDou80sRBORhqhMtGTWW7y0
 r8YJcJ+OrIE7I0fAqHUTWEpWAYFbf5+ojD4MBtC8vNIeCdhX26Joh2kKSL2oBBrcEH1da7fwk
 Z/svvyHUHdeAnAUPZ7KMnrY3LIBwIHoBBdsq3oJyL/J8tSv2cIwtOzPIk+ecFCzW57KLdit2w
 ZH50xC30cXHKRAJkxnxJHHbN6BSvQSclNz8JVkOA4n2vSWRPKAvIL1PukrBHRmSrYCTiGw2Nw
 do5BDKCVAyS11uAvVA4wqVQUvnOT1QzAS3j5cWrua544yC4js4fhKcw+JevcCfrREA/HaY1U0
 6cZMWlfsdbjE87FiNDWYNcWMK3M/z5UnUn8b6RA4d8ojZ5LQF2irFza1F/RHgSKGypExfCGws
 1DLwNXO5QfmHPZY5Gca/F0GfPM+ofgZHJlkM7fUhwTXZP6Pp4qIxkjeGN3HP0ypGny1CwuUaB
 Lzs1EmXkN/fVykD3yc22kNgj9b17cBbPCuKwkKuS0znpyAQprWR70YfDgWwekVNEolmiPHTh0
 LBa/d5xKhbeybEIky5X0wyZ67rbtQj0tVs7Nh/otjmR24mAHhE=
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Donnerstag, 08. Juli 2021 um 14:30 Uhr
> Von: "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>
> > i see both messages, but mtk_crtc_ddp_irq is never called and so the o=
ther 2 not.
>
> Yes, In my case the irq isr is also not called after resume which cause =
the warning
> even though "enable_vblank" do get called. Don't know why is that.


> > comp->funcs->enable_vblank should be mtk_drm_crtc_enable_vblank, right=
?
>
> No, this is a bit confusing , there are also the funcs of the components=
, see in file mtk_drm_ddp_comp.c
> so for mt7623  it is mtk_ovl_enable_vblank.

thanks for pointing to this. in this function another struct is filled wit=
h the callback+data, and this callback seems to be called mtk_disp_ovl_irq=
_handler which name suggests also a irq as trigger

412     ret =3D devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
413                    IRQF_TRIGGER_NONE, dev_name(dev), priv);
414     if (ret < 0) {
415         dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
416         return ret;
417     }

as i don't see this error in dmesg, i guess the registration was successfu=
l. added again some debug and it looks like the interrupt callback (mtk_di=
sp_ovl_irq_handler) is not called

[    5.125002] DEBUG: Passed mtk_disp_ovl_probe 416 int reg:0
[    6.344029] DEBUG: Passed mtk_drm_crtc_enable_vblank 510
[    6.344051] DEBUG: Passed mtk_ddp_comp_enable_vblank 117
[    6.344057] DEBUG: Passed mtk_ovl_enable_vblank 107
[    6.344062] DEBUG: Passed mtk_ovl_enable_vblank 112
[    6.344066] DEBUG: Passed mtk_ddp_comp_enable_vblank 121

=2D-- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -86,6 +86,7 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, voi=
d *dev_id)
 {
        struct mtk_disp_ovl *priv =3D dev_id;

+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
        /* Clear frame completion interrupt */
        writel(0x0, priv->regs + DISP_REG_OVL_INTSTA);

@@ -93,6 +94,7 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, voi=
d *dev_id)
                return IRQ_NONE;

        priv->vblank_cb(priv->vblank_cb_data);
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);

        return IRQ_HANDLED;
 }
@@ -102,11 +104,12 @@ void mtk_ovl_enable_vblank(struct device *dev,
                           void *vblank_cb_data)
 {
        struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
-
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
        ovl->vblank_cb =3D vblank_cb;
        ovl->vblank_cb_data =3D vblank_cb_data;
        writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
        writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
+printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);
 }

 void mtk_ovl_disable_vblank(struct device *dev)
@@ -410,6 +413,7 @@ static int mtk_disp_ovl_probe(struct platform_device *=
pdev)

        ret =3D devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
                               IRQF_TRIGGER_NONE, dev_name(dev), priv);
+printk(KERN_ALERT "DEBUG: Passed %s %d int reg:%d\n",__FUNCTION__,__LINE_=
_,ret);
        if (ret < 0) {
                dev_err(dev, "Failed to request irq %d: %d\n", irq, ret);
                return ret;


how can we trace this further? maybe watchdog related?

> >
> > "watchdog: watchdog0: watchdog did not stop!"
> >
> > i see this with my 5.13, 5.12-drm (5.12.0+mtk/core drm-patches) and 5.=
12.14 too (hdmi is working there), but not 5.12.0!
> > that means something in drm-patches (mtk/core) breaks watchdog. maybe =
the recursion mentioned above?

