Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004754DD035
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DB610E7EF;
	Thu, 17 Mar 2022 21:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346D610E112
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 21:30:01 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id bx5so5953263pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=646Ri6lYIUUSPXSrji5qDVJ0g7e+Cw3720ChmY8iz60=;
 b=Y/2mZsJUGj9JOfKw1DRMS7WtJ4Ipsz9OVufXbjYudavx7yvEOaJH9wTUS+f0HM8ywJ
 Xz9dgHrxzRxxKH16loIveMR4JSl6pzzZCZAZSvS7wTVLxKz1XE4pY0XXl4+ryOxdTMgV
 C+QNcVB4b7Rj4g/42eJJl9Kaxv2i2ZuFhdkb7Lixt/7o5yaRaOtzrLPkDgRxSTkbUzFq
 4HCMrnyUKZejEwqm1a8tawkb/7CJfHz4nAK184cd87nUqAd9y3Hl5oR9KjevVeFziYG6
 /R9Ass9XzjC5QpKq8oLOhw9oJbs75FYr4zXES4kIXSozX7DWutdiNk63udmFIZc97Zl1
 YQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=646Ri6lYIUUSPXSrji5qDVJ0g7e+Cw3720ChmY8iz60=;
 b=uTEfp2kF8+02rn8LnHfNkh2iUtTogICn9KW+M3ar69CF3NFyr0NL3iw7VXysm009s4
 kqXs3GWZd7jTy1nGIMuhyPhLQrX0kU8mTI3W+N9v7cZgAjDPlcaNlrv1VcwEucussRDf
 ybpG0h5LZRUnFjLZK/7N28XCRrf1VO4jdM1ryo4teK0rlMpXR1JI5Q28L2mEwS+x9yJ3
 +zAk0yJh3oA6RKCG38BKrULeaRdkvReF2Jt0v+AG8Gra7ACTYZTqiwYecVCZNgfB1d7Q
 BIWFpyp53WEeYiqTiR3AhzvKIdOYV+tHfP+itzcAqZvFFJr3b35hFCYePkKj6ObMwBV1
 9Q/g==
X-Gm-Message-State: AOAM531Vn04/tuQVzJwyVpmUXHIBuMoJcojhTZxzDxQi3NmU7Aye1UJf
 Njo+pTL+MFpVmunAIZJ+U3+TiebIi38z4qU1HTc=
X-Google-Smtp-Source: ABdhPJxNmFhzYq9ThyIYYfefgmRaWQ67LGTS6f0Q/7O2gBahKBFL1W0vdDPpwm78FDXmougRLOgocsSYf3t3EmKNTTQ=
X-Received: by 2002:a17:90a:8d08:b0:1c6:5ada:9919 with SMTP id
 c8-20020a17090a8d0800b001c65ada9919mr7577622pjo.90.1647552600664; Thu, 17 Mar
 2022 14:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
 <32e6bdeb-afc6-6b82-ec18-5471bb27ed76@suse.de>
In-Reply-To: <32e6bdeb-afc6-6b82-ec18-5471bb27ed76@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 17 Mar 2022 22:29:49 +0100
Message-ID: <CAMeQTsa73+qfn-bC4jAbbawg9PEnuZZuU3W6SkH61uf3N-dv-A@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/gma500: Remove unused declarations and other cruft
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 8:44 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi Patrik

Hi Thomas and Sam,
I have already pushed this series with Daniels ack so I'll address any
issues in follow-up patches.

Thanks for the extra eyes

>
> Am 17.03.22 um 10:25 schrieb Patrik Jakobsson:
> > Most of these are old leftovers from one of the driver merges. This is
> > all dead code.
> >
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> >   drivers/gpu/drm/gma500/psb_drv.h | 75 +------------------------------=
-
> >   1 file changed, 1 insertion(+), 74 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/=
psb_drv.h
> > index 553d03190ce1..66f61909a8c8 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.h
> > +++ b/drivers/gpu/drm/gma500/psb_drv.h
> > @@ -36,12 +36,6 @@
> >   /* Append new drm mode definition here, align with libdrm definition =
*/
> >   #define DRM_MODE_SCALE_NO_SCALE     2
> >
> > -enum {
> > -     CHIP_PSB_8108 =3D 0,              /* Poulsbo */
> > -     CHIP_PSB_8109 =3D 1,              /* Poulsbo */
> > -     CHIP_MRST_4100 =3D 2,             /* Moorestown/Oaktrail */
> > -};
> > -
> >   #define IS_PSB(drm) ((to_pci_dev((drm)->dev)->device & 0xfffe) =3D=3D=
 0x8108)
> >   #define IS_MRST(drm) ((to_pci_dev((drm)->dev)->device & 0xfff0) =3D=
=3D 0x4100)
> >   #define IS_CDV(drm) ((to_pci_dev((drm)->dev)->device & 0xfff0) =3D=3D=
 0x0be0)
> > @@ -617,15 +611,7 @@ struct psb_ops {
> >       int i2c_bus;            /* I2C bus identifier for Moorestown */
> >   };
> >
> > -
> > -
> > -extern int drm_crtc_probe_output_modes(struct drm_device *dev, int, in=
t);
> > -extern int drm_pick_crtcs(struct drm_device *dev);
> > -
> >   /* psb_irq.c */
> > -extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_i=
slands);
> > -extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequ=
ence);
> > -extern int psb_vblank_wait(struct drm_device *dev, unsigned int *seque=
nce);
> >   extern int psb_enable_vblank(struct drm_crtc *crtc);
> >   extern void psb_disable_vblank(struct drm_crtc *crtc);
>
> The vblank enable/disable functions are also declared in psb_irq.h. The
> declarations here could be removed as well.

They get removed in patch 4/4 in this series.

>
> >   void
> > @@ -636,17 +622,9 @@ psb_disable_pipestat(struct drm_psb_private *dev_p=
riv, int pipe, u32 mask);
> >
> >   extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
> >
> > -/* framebuffer.c */
> > -extern int psbfb_probed(struct drm_device *dev);
> > -extern int psbfb_remove(struct drm_device *dev,
> > -                     struct drm_framebuffer *fb);
> > -/* psb_drv.c */
> > -extern void psb_spank(struct drm_psb_private *dev_priv);
>
> This function is still around in psb_drv.c. It should now be declared
> static.

Yes it should be static. I have a patch that renames this function
(psb_spank is a really bad name). I'll make it static in that patch.

>
> Best regards
> Thomas
>
> > -
> > -/* psb_reset.c */
> > +/* psb_lid.c */
> >   extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
> >   extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
> > -extern void psb_print_pagefault(struct drm_psb_private *dev_priv);
> >
> >   /* modesetting */
> >   extern void psb_modeset_init(struct drm_device *dev);
> > @@ -689,43 +667,7 @@ extern const struct psb_ops oaktrail_chip_ops;
> >   /* cdv_device.c */
> >   extern const struct psb_ops cdv_chip_ops;
> >
> > -/* Debug print bits setting */
> > -#define PSB_D_GENERAL (1 << 0)
> > -#define PSB_D_INIT    (1 << 1)
> > -#define PSB_D_IRQ     (1 << 2)
> > -#define PSB_D_ENTRY   (1 << 3)
> > -/* debug the get H/V BP/FP count */
> > -#define PSB_D_HV      (1 << 4)
> > -#define PSB_D_DBI_BF  (1 << 5)
> > -#define PSB_D_PM      (1 << 6)
> > -#define PSB_D_RENDER  (1 << 7)
> > -#define PSB_D_REG     (1 << 8)
> > -#define PSB_D_MSVDX   (1 << 9)
> > -#define PSB_D_TOPAZ   (1 << 10)
> > -
> > -extern int drm_idle_check_interval;
> > -
> >   /* Utilities */
> > -static inline u32 MRST_MSG_READ32(int domain, uint port, uint offset)
> > -{
> > -     int mcr =3D (0xD0<<24) | (port << 16) | (offset << 8);
> > -     uint32_t ret_val =3D 0;
> > -     struct pci_dev *pci_root =3D pci_get_domain_bus_and_slot(domain, =
0, 0);
> > -     pci_write_config_dword(pci_root, 0xD0, mcr);
> > -     pci_read_config_dword(pci_root, 0xD4, &ret_val);
> > -     pci_dev_put(pci_root);
> > -     return ret_val;
> > -}
> > -static inline void MRST_MSG_WRITE32(int domain, uint port, uint offset=
,
> > -                                 u32 value)
> > -{
> > -     int mcr =3D (0xE0<<24) | (port << 16) | (offset << 8) | 0xF0;
> > -     struct pci_dev *pci_root =3D pci_get_domain_bus_and_slot(domain, =
0, 0);
> > -     pci_write_config_dword(pci_root, 0xD4, value);
> > -     pci_write_config_dword(pci_root, 0xD0, mcr);
> > -     pci_dev_put(pci_root);
> > -}
> > -
> >   static inline uint32_t REGISTER_READ(struct drm_device *dev, uint32_t=
 reg)
> >   {
> >       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > @@ -806,24 +748,9 @@ static inline void REGISTER_WRITE8(struct drm_devi=
ce *dev,
> >   #define PSB_WVDC32(_val, _offs)             iowrite32(_val, dev_priv-=
>vdc_reg + (_offs))
> >   #define PSB_RVDC32(_offs)           ioread32(dev_priv->vdc_reg + (_of=
fs))
> >
> > -/* #define TRAP_SGX_PM_FAULT 1 */
> > -#ifdef TRAP_SGX_PM_FAULT
> > -#define PSB_RSGX32(_offs)                                            \
> > -({                                                                   \
> > -     if (inl(dev_priv->apm_base + PSB_APM_STS) & 0x3) {              \
> > -             pr_err("access sgx when it's off!! (READ) %s, %d\n",    \
> > -                    __FILE__, __LINE__);                             \
> > -             melay(1000);                                            \
> > -     }                                                               \
> > -     ioread32(dev_priv->sgx_reg + (_offs));                          \
> > -})
> > -#else
> >   #define PSB_RSGX32(_offs)           ioread32(dev_priv->sgx_reg + (_of=
fs))
> > -#endif
> >   #define PSB_WSGX32(_val, _offs)             iowrite32(_val, dev_priv-=
>sgx_reg + (_offs))
> >
> > -#define MSVDX_REG_DUMP 0
> > -
> >   #define PSB_WMSVDX32(_val, _offs)   iowrite32(_val, dev_priv->msvdx_r=
eg + (_offs))
> >   #define PSB_RMSVDX32(_offs)         ioread32(dev_priv->msvdx_reg + (_=
offs))
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
