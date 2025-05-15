Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8AAB95A6
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE0210E99E;
	Fri, 16 May 2025 05:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XJkz7Kca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E2810E986;
 Thu, 15 May 2025 23:52:24 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3fb3f4bf97aso867704b6e.2; 
 Thu, 15 May 2025 16:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747353144; x=1747957944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dvu88ev1VdWU5DxXw0FZJRoIRYMo1iE9Ijw3Gfebd28=;
 b=XJkz7KcaOvksuF5Hs1lPzVqppTcr034gqoZLGfedobgakqPhJpPKrUTiEKPg6dGOnv
 9/2fQDVFlLXvmDsDpoe/ff+iYBsmmKsZS7xyrzCuoITi3amXfvFD+Moc/VPPEmBqSoz4
 kBY/rqMXUR0gMoUj5RgPq/NlJvW4czOFy5V/wkcvs9VpXbBQelxkb1C32Kq7MT/XC3bJ
 0TbsVOmhGMrGF/knjFvRW1cxCQUpCFlYRTayTfUvJAkgBOOQdn/ltlBdMQZ3ecQTO5jL
 SkYBcTIPG+bMnLqR9xNmkdB9TL6XS6qBIGnklv53MH38QjNG1ltKBbiQh81NbGoUtbgT
 wcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747353144; x=1747957944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dvu88ev1VdWU5DxXw0FZJRoIRYMo1iE9Ijw3Gfebd28=;
 b=Fl/dzs1eWPpUrQZpa0vDF1E82ITgjQWUlRJah9J8ltTK0ZhjZLje+jBp3MMUVFczn5
 9WkvnO2dDbLKeW7/YckG/7cEo8uoaoLe6VYgk/0gq+kAZ9j762mBZejn+yg897mevE1r
 l5GebG1zz6Xxxhb+ShQRE8tQZU0u+bKRQ9l1tYPzX63JARsb2/pqv3SpT+nxP8r3mY7z
 Ct0TqVEvLz55lIvKRUZLDqaYuERrUocWqfTX16dQ7RGO0UHQXL2g0VGHLFQycGsa77iK
 swKounWM49520IKh2LIszLqBVVrfMFZavsCynITHvDhK/oB5g8iaz8jRg4ry9Z3H76Wv
 tZEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNQWF1zU4LKMtM3rqjuqYmpNWsSYfXYpeeJ83yzb3MlyKWdkunszxdZPMfYda4wu9lLGYf1a8y/Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH8Htd/S/906tF1gssN6Fer+9Msk2cWhywAeAqRcH6R1Wg1156
 rMOpbDfBu6Gs0tIKqCuVVZvgH2fx+Hz3ZuJf+VtjYOJVn8ougqiclpbtW9CuWS0K94XLhr9Z58Z
 5syTaFr+A7OeBEvhRrS/NKglssdkL7OU=
X-Gm-Gg: ASbGncuXirV11Fh/IX4ACdg7zf/A7g/QxhVGECJtcKaBpTWbo+h18ImG8SnqxzrFwg2
 F+tR6tjLsC9FVT6eemhPEYfRUVoAq2hjbjUhhD43rrfuvu9Zi8LGs6NSX45TyUkYAGMVluFCOR2
 feN1Rc8F87stwQg6Aekh4eIc+G0jA0Ufc=
X-Google-Smtp-Source: AGHT+IF7l+OfeWDxmtMQ/n0NGjONLriHzg84x+VxoXL/MEoU+nBi+ArpmI1jmKMqH8iuRgHL5o1427WBgaE5H/loxm8=
X-Received: by 2002:a05:6808:2f18:b0:403:6fd2:d97c with SMTP id
 5614622812f47-404d869dcc3mr1361963b6e.14.1747353144041; Thu, 15 May 2025
 16:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1737644530.git.jani.nikula@intel.com>
 <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
 <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
In-Reply-To: <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
From: Bill Wendling <isanbard@gmail.com>
Date: Thu, 15 May 2025 16:52:12 -0700
X-Gm-Features: AX0GCFsG1lMUbV8e9u6zQamu0DG4uq2UWcnglLtzwznz1X3UhF0PTDEVH-90KBk
Message-ID: <CAEzuVAdfY-KiLF7AArQ2Wkw=qP1hnyuG1UmSsv_ZtgrUpfm-3A@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/print: require struct drm_device for drm_err()
 and friends
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, gustavo.sousa@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org, 
 kees@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 May 2025 05:50:09 +0000
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

On Thu, May 15, 2025 at 1:18=E2=80=AFPM Bill Wendling <isanbard@gmail.com> =
wrote:
> On 1/23/25 7:09 AM, Jani Nikula wrote:
> > The expectation is that the struct drm_device based logging helpers get
> > passed an actual struct drm_device pointer rather than some random
> > struct pointer where you can dereference the ->dev member.
> >
> > Add a static inline helper to convert struct drm_device to struct
> > device, with the main benefit being the type checking of the macro
> > argument.
> >
> > As a side effect, this also reduces macro argument double references.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >   include/drm/drm_print.h | 41 +++++++++++++++++++++++-----------------=
-
> >   1 file changed, 23 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index 9732f514566d..f31eba1c7cab 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const str=
uct device *dev,
> >    * Prefer drm_device based logging over device or prink based logging=
.
> >    */
> >
> > +/* Helper to enforce struct drm_device type */
> > +static inline struct device *__drm_to_dev(const struct drm_device *drm=
)
> > +{
> > +     return drm ? drm->dev : NULL;
> > +}
> > +
> >   /* Helper for struct drm_device based logging. */
> >   #define __drm_printk(drm, level, type, fmt, ...)                    \
> > -     dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA=
_ARGS__)
> > +     dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
> >
> >
> >   #define drm_info(drm, fmt, ...)                                     \
> > @@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const st=
ruct device *dev,
> >
> >
> >   #define drm_dbg_core(drm, fmt, ...)                                 \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_A=
RGS__)
> > -#define drm_dbg_driver(drm, fmt, ...)                                 =
               \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA=
_ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
> > +#define drm_dbg_driver(drm, fmt, ...)                                 =
       \
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_kms(drm, fmt, ...)                                  \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_AR=
GS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_prime(drm, fmt, ...)                                 =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_=
ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_atomic(drm, fmt, ...)                                =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA=
_ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_vbl(drm, fmt, ...)                                  \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_AR=
GS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_state(drm, fmt, ...)                                 =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_=
ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_lease(drm, fmt, ...)                                 =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_=
ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_dp(drm, fmt, ...)                                   \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARG=
S__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_drmres(drm, fmt, ...)                                =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA=
_ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> >
> >   #define drm_dbg(drm, fmt, ...)      drm_dbg_driver(drm, fmt, ##__VA_A=
RGS__)
> >
> > @@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
> >   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)        =
                               \
> >   ({                                                                   =
                       \
> >       static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DE=
FAULT_RATELIMIT_BURST);\
> > -     const struct drm_device *drm_ =3D (drm);                         =
                         \
> >                                                                        =
                       \
> >       if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_)) =
                       \
> > -             drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, =
## __VA_ARGS__);       \
> > +             drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __V=
A_ARGS__);             \
> >   })
> >
> >   #define drm_dbg_ratelimited(drm, fmt, ...) \
> > @@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
> >   /* Helper for struct drm_device based WARNs */
> >   #define drm_WARN(drm, condition, format, arg...)                    \
> >       WARN(condition, "%s %s: [drm] " format,                         \
> > -                     dev_driver_string((drm)->dev),                  \
> > -                     dev_name((drm)->dev), ## arg)
> > +                     dev_driver_string(__drm_to_dev(drm)),           \
> > +                     dev_name(__drm_to_dev(drm)), ## arg)
> >
> >   #define drm_WARN_ONCE(drm, condition, format, arg...)                =
       \
> >       WARN_ONCE(condition, "%s %s: [drm] " format,                    \
> > -                     dev_driver_string((drm)->dev),                  \
> > -                     dev_name((drm)->dev), ## arg)
> > +                     dev_driver_string(__drm_to_dev(drm)),           \
> > +                     dev_name(__drm_to_dev(drm)), ## arg)
> >
> Hi Jani,
>
> These two changes introduce undefined behavior into these macros. The fin=
al
> code generation becomes this (from 'bxt_port_to_phy_channel'):
>
>         __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
>                       dev_driver_string(__drm_to_dev(display->drm)),
>                       dev_name(__drm_to_dev(display->drm)),
>                       (port + 'A'));
>
> The issue lies in 'dev_name(__drm_to_dev(display->drm))'. After inlining,=
 it
> becomes this (pseudo code):
>
>         struct device *device =3D display->drm ? display->drm->dev : NULL=
;
>         const char *name =3D device->init_name ? device->init_name
>                                              : kobject_name(&device->kobj=
);
>
>         __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
>                       dev_driver_string(device), name, (port + 'A'));
>
> The issue, of course, is that the 'device' may be NULL when attempting
> to get
> 'device->init_name'. The compiler sees this as undefined behavior, which =
may
> lead to unexpected outcomes, especially with Clang where paths
> determined to be
> undefined are removed entirely under certain conditions.
>
> (Note, I'm working on making this behavior less draconian by adopting a G=
CC
> pass, but this will take time to filter out to Linux devs.)
>
I potential fix for this would be something like this (untested). I'm
not familiar with how 'dev_name' is used to know whether or not this
could cause issues:

diff --git a/include/linux/device.h b/include/linux/device.h
index 79e49fe494b7..ea20d439fe8e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -778,6 +778,9 @@ static inline bool device_iommu_mapped(struct device *d=
ev)
  */
 static inline const char *dev_name(const struct device *dev)
 {
+       if (!dev)
+               return "default";
+
        /* Use the init name until the kobject becomes available */
        if (dev->init_name)
                return dev->init_name;

-bw
