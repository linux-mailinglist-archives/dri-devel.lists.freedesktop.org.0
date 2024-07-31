Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB949942941
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 10:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE4E10E291;
	Wed, 31 Jul 2024 08:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hf1quhHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5957910E291
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 08:33:58 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-66108213e88so40363807b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722414837; x=1723019637; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fFpDFM/rQtiSJZcgQRX5riVBkU/qwsFJN/YZd9MDQUo=;
 b=hf1quhHdov1CcUMuPRNpKaL9aWqc/ED6N9cUpR8gijvySD+uqFWPWuGcSXMFEIQjRf
 8rEXiS/XmvknCwZ8ueK1N4zNeeePYt+YkqQpo3VxSKuPusu0dfhCk4BBUSGok1uT7GqQ
 dYFQq2qHHzpkrZjLIu2SZDzIYe6wAghHoIU4Lxv9zKBqILs0orBS9eSfI3oCY03YIN01
 yB+a3SErlYTMLSKIhiD+DALbxSMPXzrjMdFcKXoEtc8VJ6rrTsuj4Fg6GsoxYWRtOEcv
 ejdcOGLR14tw9Gmja8R3TPTaAoKyAb9/ZFGcWM+ol5mqY+E7Wy0IdvLoRUD53f8omWbz
 AuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722414837; x=1723019637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fFpDFM/rQtiSJZcgQRX5riVBkU/qwsFJN/YZd9MDQUo=;
 b=XxENwlMYELg7kcqPsUO+YnPBbnXWaC3ZUI+GqxQncri9W6D3E8Fjy8XRZa4p6vS6sn
 PLw2eoQZnr3c4uaAoYVCyz9HlY/7Q1aqxadFypVhexzKqiO/bjrRtciOWr1fPDlN8W22
 DpIk7wjCpndnPYiNQvT4raYMjQgcZYLj62FOKm9oC9QlSzf1kxqFQXVmds5lUYuwSaTD
 bpTqqKK0VGc0Leav70Z2+KibhJ4cyEPm+yrZTK/MtUUz4TY/szIrjpvHkUkfp8tSPriG
 tdCjEeaOuq4LzolY6ECe6lj9PJgvqykI1AW7b9jmqhhZI6plvIiXeVgpeWCq3k2QbjEJ
 vRgA==
X-Gm-Message-State: AOJu0Yw20aLh1zVaEbdfDZ3essSnmpZDcp5v0urRtEY8+HUCptTH21NK
 QT91T40jy5bDqHm3nyP8k8ZgyPr5G9c00tyaLFHpt6I/wQTDXfeV+yLirzElRYEC1uhFTz5Vzb7
 /2UoWxjjKkqTrhtxJBxCUwXdD1coYJHfkpnHZgw==
X-Google-Smtp-Source: AGHT+IH3VSVF+0YmI4a1hpduUzVedsq0LlhzEKNQcpbcDiSixWJ3jKgertZqesDKwOhsZ6KO+Ec/JKiqDW+chlQYBu4=
X-Received: by 2002:a81:8245:0:b0:627:7e65:979 with SMTP id
 00721157ae682-67a079864eemr161604087b3.24.1722414837062; Wed, 31 Jul 2024
 01:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240709074656.1389387-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307E4F207A125F53A23342BBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
 <jsrh2xyopzcmsi7uardklw2gfzmseq4pldj6bt6ozezhx5qqbs@epk6y7hg6ihv>
 <CH3PR11MB7300ABE65A3E3DCD3CE90DDCBAB02@CH3PR11MB7300.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB7300ABE65A3E3DCD3CE90DDCBAB02@CH3PR11MB7300.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jul 2024 11:33:45 +0300
Message-ID: <CAA8EJppU9GaS8Npy+M5v00BJ4NrZt+BpYG5uAGPgdmZnb1TXnQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 30 Jul 2024 at 07:07, Murthy, Arun R <arun.r.murthy@intel.com> wrote:
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Tuesday, July 30, 2024 4:21 AM
> > To: Murthy, Arun R <arun.r.murthy@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Subject: Re: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
> > interoperability

Please fix your email client.

> >
> > On Mon, Jul 29, 2024 at 04:59:14AM GMT, Murthy, Arun R wrote:
> > > Gentle Reminder!
> > > Any comments?
> >
> > First of all, the format is underdocumented. Second, there is a usual
> > requirement for new uAPI: please provide a pointer to IGT patch and to the
> > userspace utilising the property.
> There are some discussions on using this in UMD. https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123

It should be a MR rather than "some discussion". And IGT patchset too, please.

Regarding the patch itself. It is completely underdocumented. There is
no way for me to understand which of these caps should e.g. be set for
the drm/msm planes.

>
> Thanks and Regards,
> Arun R Murthy
> --------------------
> >
> > >
> > > Thanks and Regards,
> > > Arun R Murthy
> > > --------------------
> > >
> > > > -----Original Message-----
> > > > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > > > Sent: Tuesday, July 9, 2024 1:17 PM
> > > > To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > > > Subject: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
> > > > interoperability
> > > >
> > > > Each plane has its own capability or interoperability based on the
> > > > harware restrictions. If this is exposed to the user, then user can
> > > > read it once on boot and store this. Later can be used as a lookup
> > > > table to check a corresponding capability is supported by plane then
> > > > only go ahead with the framebuffer creation/calling atomic_ioctl.
> > > >
> > > > For Ex: There are few restiction as to async flip doesnt support all
> > > > the formats/modifiers. Similar restrictions on scaling. With the
> > > > availabililty of this info to user, failures in atomic_check can be
> > > > avoided as these are more the hardware capabilities.
> > > >
> > > > There are two options on how this can be acheived.
> > > > Option 1:
> > > >
> > > > Add a new element to struct drm_mode_get_plane that holds the addr
> > > > to the array of a new struct. This new struct consists of the
> > > > formats supported and the corresponding plane capabilities.
> > > >
> > > > Option 2:
> > > >
> > > > These can be exposed to user as a plane property so that the user
> > > > can get to know the limitation ahead and avoid failures in atomic_check.
> > > >
> > > > Usually atomic_get_property is controlled over the state struct for
> > > > the parameters/elements that can change. But here these capabilities
> > > > or the interoperabilities are rather hardware restrictions and wont change
> > over flips.
> > > > Hence having as a plane_property may not make much sense.
> > > > On the other hand, Option 1 include changes in the uapi struct
> > > > drm_mode_get_plane. Shouldnt have impact on backward compatibility,
> > > > but if userspace has some implementation so as to check the size of
> > > > the struct, then it might a challenge.
> > > >
> > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
> > > >  include/drm/drm_plane.h           |  8 ++++++++
> > > >  include/uapi/drm/drm_mode.h       | 20 ++++++++++++++++++++
> > > >  3 files changed, 31 insertions(+)
> > > >
> > > > =============Option 2========================
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > index 22bbb2d83e30..b46177d5fc8c 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > > @@ -631,6 +631,9 @@ drm_atomic_plane_get_property(struct drm_plane
> > > > *plane,
> > > >           *val = state->hotspot_x;
> > > >   } else if (property == plane->hotspot_y_property) {
> > > >           *val = state->hotspot_y;
> > > > + } else if (property == config->prop_plane_caps) {
> > > > +         *val = (state->plane_caps) ?
> > > > +                 state->plane_caps->base.id : 0;
> > > >   } else {
> > > >           drm_dbg_atomic(dev,
> > > >                          "[PLANE:%d:%s] unknown property
> > [PROP:%d:%s]\n", diff
> > > > --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
> > > > dd718c62ac31..dfe931677d0a 100644
> > > > --- a/include/drm/drm_plane.h
> > > > +++ b/include/drm/drm_plane.h
> > > > @@ -260,6 +260,14 @@ struct drm_plane_state {
> > > >    * flow.
> > > >    */
> > > >   bool color_mgmt_changed : 1;
> > > > +
> > > > + /**
> > > > +  * @plane_caps:
> > > > +  *
> > > > +  * Blob representing plane capcabilites and interoperability.
> > > > +  * This element is a pointer to the array of struct drm_format_blob.
> > > > +  */
> > > > + struct drm_property_blob *plane_caps;
> > > >  };
> > > >
> > > >  static inline struct drm_rect
> > > >
> > > > =============Option 1========================
> > > >
> > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > b/include/uapi/drm/drm_mode.h index d390011b89b4..0b5c1b65ef63
> > > > 100644
> > > > --- a/include/uapi/drm/drm_mode.h
> > > > +++ b/include/uapi/drm/drm_mode.h
> > > > @@ -312,6 +312,20 @@ struct drm_mode_set_plane {
> > > >   __u32 src_w;
> > > >  };
> > > >
> > > > +#define DRM_FORMAT_PLANE_CAP_LINEAR_TILE BIT(0)
> > > > +#define DRM_FORMAT_PLANE_CAP_X_TILE              BIT(1)
> > > > +#define DRM_FORMAT_PLANE_CAP_Y_TILE              BIT(2)
> > > > +#define DRM_FORMAT_PLANE_CAP_Yf_TILE             BIT(3)
> > > > +#define DRM_FORMAT_PLANE_CAP_ASYNC_FLIP          BIT(4)
> > > > +#define DRM_FORMAT_PLANE_CAP_FBC         BIT(5)
> > > > +#define DRM_FORMAT_PLANE_CAP_RC                  BIT(6)
> > > > +
> > > > +struct drm_format_blob {
> > > > + __u64 modifier;
> > > > + __u32 plane_caps;
> > > > +
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct drm_mode_get_plane - Get plane metadata.
> > > >   *
> > > > @@ -355,6 +369,12 @@ struct drm_mode_get_plane {
> > > >    * supported by the plane. These formats do not require modifiers.
> > > >    */
> > > >   __u64 format_type_ptr;
> > > > + /**
> > > > +  * @ format_blob_ptr: Pointer to the array of struct drm_format_blob.
> > > > +  * Specify the plane capabilites/restrictions w.r.t tiling/sync-async
> > > > +  * flips etc
> > > > +  */
> > > > + __u64 format_blob_ptr;
> > > >  };
> > > >
> > > >  struct drm_mode_get_plane_res {
> > > > --
> > > > 2.25.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
