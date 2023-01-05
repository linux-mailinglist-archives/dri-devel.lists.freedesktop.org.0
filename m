Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED7D65EA92
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF3C10E108;
	Thu,  5 Jan 2023 12:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FE210E108
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:19:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so1149649wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eG/qbWTCC0NajUUTN/y+oldh/EoADNM+ee29mCLOeZk=;
 b=L6Z40+4652VHB0CfcMkON8DxYuJ8aSe1IR7YQF7qkDiMGZ128JRq54PrYRZ580D692
 YDb6tAwhvBPDNJis8xMKf0K6dTTJr3fPKTSKdx/gN0g8SdYevyu7HGAPxTjnx620MEVB
 3F7Y4h9YCbuZi3cSL5ieL5O/i0TudxqjEHx4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eG/qbWTCC0NajUUTN/y+oldh/EoADNM+ee29mCLOeZk=;
 b=QNYLEe9lXw08lbZ4ZfiDXjWFu3UQ9XzHWJwvaKQcwDTJRnbAm+YHxBVfx8bm34jmia
 GM8H8S6GYbA9Euu9bx15jA4xGUNU/2Su1RX0MsKQiNuIbJKn+HIXbGyaOfIsPQu30T1r
 cx8eZewoO+8d1M6W6qo9jIjiZc9HpE/3SXxRPBdn1p0M54lbDzjA9WNkU2d6GgSH8ue3
 +iqBuu6MUK7kcHACobEy2o1yhqvwSCuZWfRlPhdqDUIeKdWa34xL2k/yKodgyFl3Uf6B
 WfAeSYXF3FbhMh8IWZi87Nj0q1Tl/J0r76SazboQRFLEFNsuXNuIVfhCTFWL9cEPIe7R
 oVOg==
X-Gm-Message-State: AFqh2kqqyiUKYlqSykfivcPbugoORvw3Xgq0dxZKHLCyfoOxCjjP9md/
 oM0Abnuc26qbLorYlH2KQ4MnNA==
X-Google-Smtp-Source: AMrXdXvv8VWeWviFEpfPjQDi/yaYR9zXJT5tIJ+i6RtNrjstlHL3yibsTHPMFGCRIkE9Umr/ynUEEw==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr39232437wmq.33.1672921142893; 
 Thu, 05 Jan 2023 04:19:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003d237d60318sm2533526wmq.2.2023.01.05.04.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:19:02 -0800 (PST)
Date: Thu, 5 Jan 2023 13:19:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [PATCH] drm/fourcc: Document open source user waiver
Message-ID: <Y7bANF64eZ+ZuWAd@phenom.ffwll.local>
References: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
 <Y4h85n6krZ3CVkQp@phenom.ffwll.local>
 <CAKMK7uErF0THyGHcke=AizGhJkaoQpN6PzjykbFFCX6eJ6DoJQ@mail.gmail.com>
 <CAOFGe96bgSSSrW-KXBBtmgB+4j9D55x1KMW3k-vrFxQ7P-to-g@mail.gmail.com>
 <CAP+8YyHHB_NTMTeOWSxVTjncj1iWD-uJKiPWW=jtpXug4yp9tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+8YyHHB_NTMTeOWSxVTjncj1iWD-uJKiPWW=jtpXug4yp9tw@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Neil Trevett <ntrevett@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for all the acks, added them all and applied the patch.
-Daniel

On Fri, Dec 02, 2022 at 02:14:03AM +0100, Bas Nieuwenhuizen wrote:
> Acked-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> 
> On Thu, Dec 1, 2022 at 8:47 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > Acked-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> >
> > On Thu, Dec 1, 2022 at 4:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >>
> >> On Thu, 1 Dec 2022 at 11:07, Daniel Vetter <daniel@ffwll.ch> wrote:
> >> >
> >> > On Wed, Nov 23, 2022 at 08:24:37PM +0100, Daniel Vetter wrote:
> >> > > It's a bit a FAQ, and we really can't claim to be the authoritative
> >> > > source for allocating these numbers used in many standard extensions
> >> > > if we tell closed source or vendor stacks in general to go away.
> >> > >
> >> > > Iirc this was already clarified in some vulkan discussions, but I
> >> > > can't find that anywhere anymore. At least not in a public link.
> >> > >
> >> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> > > Cc: Maxime Ripard <mripard@kernel.org>
> >> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> > > Cc: David Airlie <airlied@gmail.com>
> >> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> >> > > Cc: Alex Deucher <alexdeucher@gmail.com>
> >> > > Cc: Daniel Stone <daniel@fooishbar.org>
> >> > > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> >> > > Cc: Neil Trevett <ntrevett@nvidia.com>
> >> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >> >
> >> > From irc:
> >> >
> >> > <airlied> danvet: ack from me
> >>
> >> Also from irc:
> >>
> >> <mareko> danvet: Acked
> >>
> >> -Daniel
> >>
> >> > > ---
> >> > >  include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
> >> > >  1 file changed, 12 insertions(+)
> >> > >
> >> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> > > index bc056f2d537d..de703c6be969 100644
> >> > > --- a/include/uapi/drm/drm_fourcc.h
> >> > > +++ b/include/uapi/drm/drm_fourcc.h
> >> > > @@ -88,6 +88,18 @@ extern "C" {
> >> > >   *
> >> > >   * The authoritative list of format modifier codes is found in
> >> > >   * `include/uapi/drm/drm_fourcc.h`
> >> > > + *
> >> > > + * Open Source User Waiver
> >> > > + * -----------------------
> >> > > + *
> >> > > + * Because this is the authoritative source for pixel formats and modifiers
> >> > > + * referenced by GL, Vulkan extensions and other standards and hence used both
> >> > > + * by open source and closed source driver stacks, the usual requirement for an
> >> > > + * upstream in-kernel or open source userspace user does not apply.
> >> > > + *
> >> > > + * To ensure, as much as feasible, compatibility across stacks and avoid
> >> > > + * confusion with incompatible enumerations stakeholders for all relevant driver
> >> > > + * stacks should approve additions.
> >> > >   */
> >> > >
> >> > >  #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
> >> > > --
> >> > > 2.37.2
> >> > >
> >> >
> >> > --
> >> > Daniel Vetter
> >> > Software Engineer, Intel Corporation
> >> > http://blog.ffwll.ch
> >>
> >>
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
