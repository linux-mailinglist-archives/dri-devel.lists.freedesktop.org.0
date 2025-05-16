Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEAEABA4CB
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 22:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323D710EB8A;
	Fri, 16 May 2025 20:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ByV+43BZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0656B10EB8A;
 Fri, 16 May 2025 20:42:08 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-60402c94319so1784556eaf.1; 
 Fri, 16 May 2025 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747428127; x=1748032927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++pgd4lWtGe5gVbWEu9BXWAu4/0l6ZQAQhVYnZuFWpc=;
 b=ByV+43BZ59Qcm0sQyoGzsv/mnh0slj73iuxBRRZm8a2dvgd725wlE8+qXHfzn6Rfyc
 /51EYH8VOxZCBt+Q4680XuBRS8F7TwdYr9Ton0+wG32msJ32NpoegxDN5eOQKXt7x312
 jLNPUSLjoQzhTF27QARsZ3rMZ6v7kYwMheIwsC9MGZY3g7bF28dy+KpLH+vc6AIlDmCE
 d7R08y4xCemFZ5xq6iFieLN4+39kF1l/i1TsXtkfc/+las3qaBV/wzG/WIrifXU9YriD
 lrgQDYTFmvefoeDJhaZ1vJLbCyb9N3zSg98o45uK2BlAfNj16LiawHsJiExCxGbcnaQA
 XNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747428127; x=1748032927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++pgd4lWtGe5gVbWEu9BXWAu4/0l6ZQAQhVYnZuFWpc=;
 b=dvbRoaQGH2DuSqtMVqPUtL2ofGSm0K7CnkC+8IYMYwT3d/M3zHQp3BQ7YN36VYjkFk
 7u4/Y/z6V8ROP+YkbnWm/aWlBdTtrCXjn/OdC7ThEncixuiX7e9sIgWNugtMDhjpaq19
 waEyQPr8aA8CM3J642X5JAsvNHa34F2+anQ5i5MqtjhpOwao/GgD0STQgPD/FGRhL6TW
 v/mv6R4ZIudSYp4tawJdetm3Nvre766OWmwvBmtvXuXm9KLN97Vf5tbKUYmVi4MBAny4
 SA+sQPmDmG+XvCHUlQ7sfysHC+zAWDx6CWmlBI/JCoECYdOZZT6pHqoN94E9ZSHsny8U
 kIuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeSMoEv829gashmlTQpmvAdWXEPQcd5binB3ORWU7dgD6I0YvSvIzCTKIPyJJI+4GQwwUF6M61tJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE9iDo6s9CGiTc1Q66Q4c1ger8XPdNGUC1iYFQIt+2LzY3tmsc
 WP3xA97RrSysRJlWU2akpcKWU5T66rclIuooDXa/ZMfjFcYTvHSnPpI9z5+JknPW++hRyexM5fO
 7zoZghIStMrHI7QPeqSlZG4JcPBH7dOA=
X-Gm-Gg: ASbGnct9BLJ8jwIdU3Fh0ixAkEiR4g6T2MlHQFMjHzcIAb4TMOZRx+HzLObMRS09eeB
 b1ljKuYf1ZEahmhGrcbh5IADsIInNj3f5mxu9OG/c5sePNBUzTS/CVInbD8dDCcVqgNYAM8sCyq
 Ht0Q0SbQFUkqOg9fjO78xlYhgxtrGMuuU=
X-Google-Smtp-Source: AGHT+IHR+fnGjVQ6LsJ/OmPMbiA6XNjnPLOboi1Mi9DnsD3Les3kYywT0vBHV91Lac+yDiDoypiukbNZKMv0wICzY2A=
X-Received: by 2002:a05:6820:218:b0:606:26bb:db78 with SMTP id
 006d021491bc7-609f37b8c4amr2645416eaf.8.1747428126931; Fri, 16 May 2025
 13:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1737644530.git.jani.nikula@intel.com>
 <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
 <98201050-82eb-453d-a669-036eeefa354e@gmail.com> <87tt5kx4wv.fsf@intel.com>
In-Reply-To: <87tt5kx4wv.fsf@intel.com>
From: Bill Wendling <isanbard@gmail.com>
Date: Fri, 16 May 2025 13:41:56 -0700
X-Gm-Features: AX0GCFvRm5FS98B6TnFQ7HNNXpyCZJsgFZEIq5XNCm3L9LA9ALlSEsiUmJq23w4
Message-ID: <CAEzuVAcTSVSBfOPFcgz4uv4bFyvu618RLfKzB6j=sVF2qbygXA@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/print: require struct drm_device for drm_err()
 and friends
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 gustavo.sousa@intel.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 linux-kernel@vger.kernel.org, kees@kernel.org
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

On Fri, May 16, 2025 at 2:48=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
> On Thu, 15 May 2025, Bill Wendling <isanbard@gmail.com> wrote:
> > On 1/23/25 7:09 AM, Jani Nikula wrote:
> >> The expectation is that the struct drm_device based logging helpers ge=
t
> >> passed an actual struct drm_device pointer rather than some random
> >> struct pointer where you can dereference the ->dev member.
> >>
> >> Add a static inline helper to convert struct drm_device to struct
> >> device, with the main benefit being the type checking of the macro
> >> argument.
> >>
> >> As a side effect, this also reduces macro argument double references.
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>   include/drm/drm_print.h | 41 +++++++++++++++++++++++----------------=
--
> >>   1 file changed, 23 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> >> index 9732f514566d..f31eba1c7cab 100644
> >> --- a/include/drm/drm_print.h
> >> +++ b/include/drm/drm_print.h
> >> @@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const st=
ruct device *dev,
> >>    * Prefer drm_device based logging over device or prink based loggin=
g.
> >>    */
> >>
> >> +/* Helper to enforce struct drm_device type */
> >> +static inline struct device *__drm_to_dev(const struct drm_device *dr=
m)
> >> +{
> >> +    return drm ? drm->dev : NULL;
> >> +}
> >> +
> >>   /* Helper for struct drm_device based logging. */
> >>   #define __drm_printk(drm, level, type, fmt, ...)                   \
> >> -    dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA=
_ARGS__)
> >> +    dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
> >>
> >>
> >>   #define drm_info(drm, fmt, ...)                                    \
> >> @@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const s=
truct device *dev,
> >>
> >>
> >>   #define drm_dbg_core(drm, fmt, ...)                                 =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_A=
RGS__)
> >> -#define drm_dbg_driver(drm, fmt, ...)                                =
               \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA=
_ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
> >> +#define drm_dbg_driver(drm, fmt, ...)                                =
       \
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_kms(drm, fmt, ...)                                 \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_AR=
GS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_prime(drm, fmt, ...)                                =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_=
ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_atomic(drm, fmt, ...)                               =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA=
_ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_vbl(drm, fmt, ...)                                 \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_AR=
GS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_state(drm, fmt, ...)                                =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_=
ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_lease(drm, fmt, ...)                                =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_=
ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_dp(drm, fmt, ...)                                  \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARG=
S__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_drmres(drm, fmt, ...)                               =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA=
_ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> >>
> >>   #define drm_dbg(drm, fmt, ...)     drm_dbg_driver(drm, fmt, ##__VA_A=
RGS__)
> >>
> >> @@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
> >>   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)       =
                               \
> >>   ({                                                                  =
                       \
> >>      static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DE=
FAULT_RATELIMIT_BURST);\
> >> -    const struct drm_device *drm_ =3D (drm);                         =
                         \
> >>                                                                       =
                       \
> >>      if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_)) =
                       \
> >> -            drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, =
## __VA_ARGS__);       \
> >> +            drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __V=
A_ARGS__);             \
> >>   })
> >>
> >>   #define drm_dbg_ratelimited(drm, fmt, ...) \
> >> @@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
> >>   /* Helper for struct drm_device based WARNs */
> >>   #define drm_WARN(drm, condition, format, arg...)                   \
> >>      WARN(condition, "%s %s: [drm] " format,                         \
> >> -                    dev_driver_string((drm)->dev),                  \
> >> -                    dev_name((drm)->dev), ## arg)
> >> +                    dev_driver_string(__drm_to_dev(drm)),           \
> >> +                    dev_name(__drm_to_dev(drm)), ## arg)
> >>
> >>   #define drm_WARN_ONCE(drm, condition, format, arg...)               =
       \
> >>      WARN_ONCE(condition, "%s %s: [drm] " format,                    \
> >> -                    dev_driver_string((drm)->dev),                  \
> >> -                    dev_name((drm)->dev), ## arg)
> >> +                    dev_driver_string(__drm_to_dev(drm)),           \
> >> +                    dev_name(__drm_to_dev(drm)), ## arg)
> >>
> > Hi Jani,
> >
> > These two changes introduce undefined behavior into these macros. The f=
inal
> > code generation becomes this (from 'bxt_port_to_phy_channel'):
> >
> >       __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
> >                     dev_driver_string(__drm_to_dev(display->drm)),
> >                     dev_name(__drm_to_dev(display->drm)),
> >                     (port + 'A'));
> >
> > The issue lies in 'dev_name(__drm_to_dev(display->drm))'. After inlinin=
g, it
> > becomes this (pseudo code):
> >
> >       struct device *device =3D display->drm ? display->drm->dev : NULL=
;
> >       const char *name =3D device->init_name ? device->init_name
> >                                            : kobject_name(&device->kobj=
);
> >
> >       __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
> >                     dev_driver_string(device), name, (port + 'A'));
> >
> > The issue, of course, is that the 'device' may be NULL when attempting
> > to get
> > 'device->init_name'. The compiler sees this as undefined behavior, whic=
h may
> > lead to unexpected outcomes, especially with Clang where paths
> > determined to be
> > undefined are removed entirely under certain conditions.
>
> Would it be better to just revert the drm_WARN() and drm_WARN_ONCE()
> macros to use (drm)->dev directly?
>
> It's not ideal, but as the quick fix.
>
> I don't think adding the check in dev_name() would go down well, as
> there are roughly 5k users of it, and feels like unnecessary code size
> bloat.
>
I did a quick check and vmlinux size changed by only about 0.0078%.
Most modules didn't change size, some did increase, but typically less
than 1%, and a few actually shrank in size (??). The largest change
was 6.5840% : counter.ko.

Reverting the patches would probably work, but that relies upon 'drm'
never being NULL. Indeed, it looks like 'dev_driver_string' is wary of
a NULL 'drm', though it still accesses the argument as if it couldn't
be NULL... This all seems like a disaster waiting to happen, to be
honest. There should either be no way for 'drm' to be NULL or handling
for when it is. What happened with this series of patches is adding
only partial handling for when it is NULL.

-bw
