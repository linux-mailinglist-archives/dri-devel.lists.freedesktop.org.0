Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEE142AE1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 13:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604116FAA6;
	Mon, 20 Jan 2020 12:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE26FAA4;
 Mon, 20 Jan 2020 12:32:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r14so23939608lfm.5;
 Mon, 20 Jan 2020 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AbIDR9pNoiwS2RYYFY1ApWhKRrU6bjvfq6mIUb/01Bw=;
 b=EpIR8NSfxP5x2csxJaulklUlER55UqNeAKkfCrMVT+CrjYdjSbqgcL3/DEfC8DEz5g
 SqqGk83CgCetygy8cP7HzJLNg1nvDf8IuJjahfiBa6E8L28BmB+/ATssPM8Huxxebn2V
 YT+kLovTB1PwUGUnIpRExyXz6QoV8kZppdlaBFEBBkyv7REr2n52a4Ior0K+XAMKxVdQ
 fnlzPC3cHkH+6kyZ9ZPkYOLnl/8gwp3vS+DGJzY3mIgBlhkJGmSCaYasAoLRsgqDNOyx
 +Z0xfrAukB2oyzp+kWoAGrSSJg3OsckY6SQYttd0Z7zja6LA46V9pAcyPv827xYjWn3Q
 2eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AbIDR9pNoiwS2RYYFY1ApWhKRrU6bjvfq6mIUb/01Bw=;
 b=VaKb9wR012c5FIzHvB5Oo7sbnAiYoxH9ng0lLYTSV1wOK5g531njygWRojmRrpstTv
 WA+qISAYj2UfrcJPDxgxKyaiTIG0xSNQOmz37epKqHIJM/cHJW9G2b7ri/Ww9/VdpfTx
 GJXbHGXsMN0cCd2OJSHIOZqPU9VPTTmi1CUNt8D8W2ZqRBIH34bLsQOmG4ImQdDKy+Dq
 QEo1OA2xCf9bScw/YZqaAime+dDq1ZMoWMDqPjmj88JFefk6M6yQJoCT4+JIE1fp4Wq0
 H2pldUJO4aVmf84oZdjft+3pN9n+EAuqOJ9psF33aAnL+xbMQ48Y0cqAz1tizzHkj96O
 cEZQ==
X-Gm-Message-State: APjAAAUoWoIaAzC0Cz2cwKr15TDc7uem0ypDOI1Zonhl9ab3XVt6qS6q
 defZ4kRKV/HmY3T7st5OpPL6J8Ctt2D7b2fTJVo=
X-Google-Smtp-Source: APXvYqwntAlqjr+2aFaQ6gaY6Ui2SgQ0xx2PBNZex/DNDmgaejFFzmYMRIqgIfSQZ60PmUpyUFAuKlEJCo+PJf7Dbys=
X-Received: by 2002:a19:228c:: with SMTP id i134mr13301617lfi.2.1579523551378; 
 Mon, 20 Jan 2020 04:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20200120082314.14756-1-tzimmermann@suse.de>
 <20200120082314.14756-7-tzimmermann@suse.de>
In-Reply-To: <20200120082314.14756-7-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 20 Jan 2020 13:32:20 +0100
Message-ID: <CAMeQTsYkvo9Pm=TNW95jH=Ffzo36bSbwf5+6p27T7T5L0aPMAQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/22] drm/gma500: Convert to CRTC VBLANK callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 alexandre.torgue@st.com, Thomas Hellstrom <thellstrom@vmware.com>,
 Sean Paul <sean@poorly.run>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, mcoquelin.stm32@gmail.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, vincent.abriou@st.com,
 rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 9:23 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert gma500 over.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks good. For this patch:

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/cdv_intel_display.c |  3 +++
>  drivers/gpu/drm/gma500/psb_drv.c           |  4 ----
>  drivers/gpu/drm/gma500/psb_drv.h           |  6 +++---
>  drivers/gpu/drm/gma500/psb_intel_display.c |  3 +++
>  drivers/gpu/drm/gma500/psb_irq.c           | 12 +++++++++---
>  drivers/gpu/drm/gma500/psb_irq.h           |  7 ++++---
>  6 files changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
> index 1ed854f498b7..686385a66167 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_display.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
> @@ -977,6 +977,9 @@ const struct drm_crtc_funcs cdv_intel_crtc_funcs = {
>         .set_config = gma_crtc_set_config,
>         .destroy = gma_crtc_destroy,
>         .page_flip = gma_crtc_page_flip,
> +       .enable_vblank = psb_enable_vblank,
> +       .disable_vblank = psb_disable_vblank,
> +       .get_vblank_counter = psb_get_vblank_counter,
>  };
>
>  const struct gma_clock_funcs cdv_clock_funcs = {
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 52591416f8fe..36cb292fdebe 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -363,7 +363,6 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>         drm_irq_install(dev, dev->pdev->irq);
>
>         dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
> -       dev->driver->get_vblank_counter = psb_get_vblank_counter;
>
>         psb_modeset_init(dev);
>         psb_fbdev_init(dev);
> @@ -507,9 +506,6 @@ static struct drm_driver driver = {
>         .irq_postinstall = psb_irq_postinstall,
>         .irq_uninstall = psb_irq_uninstall,
>         .irq_handler = psb_irq_handler,
> -       .enable_vblank = psb_enable_vblank,
> -       .disable_vblank = psb_disable_vblank,
> -       .get_vblank_counter = psb_get_vblank_counter,
>
>         .gem_free_object = psb_gem_free_object,
>         .gem_vm_ops = &psb_gem_vm_ops,
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index 3d4ef3071d45..956926341316 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -681,15 +681,15 @@ extern void psb_irq_turn_off_dpst(struct drm_device *dev);
>  extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
>  extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
>  extern int psb_vblank_wait(struct drm_device *dev, unsigned int *sequence);
> -extern int psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
> -extern void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
> +extern int psb_enable_vblank(struct drm_crtc *crtc);
> +extern void psb_disable_vblank(struct drm_crtc *crtc);
>  void
>  psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
>
>  void
>  psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
>
> -extern u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
> +extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
>
>  /* framebuffer.c */
>  extern int psbfb_probed(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
> index fed3b563e62e..531c5485be17 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -433,6 +433,9 @@ const struct drm_crtc_funcs psb_intel_crtc_funcs = {
>         .set_config = gma_crtc_set_config,
>         .destroy = gma_crtc_destroy,
>         .page_flip = gma_crtc_page_flip,
> +       .enable_vblank = psb_enable_vblank,
> +       .disable_vblank = psb_disable_vblank,
> +       .get_vblank_counter = psb_get_vblank_counter,
>  };
>
>  const struct gma_clock_funcs psb_clock_funcs = {
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> index 91f90016dba9..15eb3770d817 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -506,8 +506,10 @@ int psb_irq_disable_dpst(struct drm_device *dev)
>  /*
>   * It is used to enable VBLANK interrupt
>   */
> -int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
> +int psb_enable_vblank(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct drm_psb_private *dev_priv = dev->dev_private;
>         unsigned long irqflags;
>         uint32_t reg_val = 0;
> @@ -545,8 +547,10 @@ int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
>  /*
>   * It is used to disable VBLANK interrupt
>   */
> -void psb_disable_vblank(struct drm_device *dev, unsigned int pipe)
> +void psb_disable_vblank(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct drm_psb_private *dev_priv = dev->dev_private;
>         unsigned long irqflags;
>
> @@ -618,8 +622,10 @@ void mdfld_disable_te(struct drm_device *dev, int pipe)
>  /* Called from drm generic code, passed a 'crtc', which
>   * we use as a pipe index
>   */
> -u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
> +u32 psb_get_vblank_counter(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         uint32_t high_frame = PIPEAFRAMEHIGH;
>         uint32_t low_frame = PIPEAFRAMEPIXEL;
>         uint32_t pipeconf_reg = PIPEACONF;
> diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
> index 58fd502e3b9d..4f73998848d1 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.h
> +++ b/drivers/gpu/drm/gma500/psb_irq.h
> @@ -12,6 +12,7 @@
>  #ifndef _PSB_IRQ_H_
>  #define _PSB_IRQ_H_
>
> +struct drm_crtc;
>  struct drm_device;
>
>  bool sysirq_init(struct drm_device *dev);
> @@ -26,9 +27,9 @@ int psb_irq_enable_dpst(struct drm_device *dev);
>  int psb_irq_disable_dpst(struct drm_device *dev);
>  void psb_irq_turn_on_dpst(struct drm_device *dev);
>  void psb_irq_turn_off_dpst(struct drm_device *dev);
> -int  psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
> -void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
> -u32  psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
> +int  psb_enable_vblank(struct drm_crtc *crtc);
> +void psb_disable_vblank(struct drm_crtc *crtc);
> +u32  psb_get_vblank_counter(struct drm_crtc *crtc);
>
>  int mdfld_enable_te(struct drm_device *dev, int pipe);
>  void mdfld_disable_te(struct drm_device *dev, int pipe);
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
