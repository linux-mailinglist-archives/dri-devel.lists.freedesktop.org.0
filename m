Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D61E666632
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6A810E173;
	Wed, 11 Jan 2023 22:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14DA10E173
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:29:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id az7so16447734wrb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IHwRisxgQPZpkwVZSG2QqoWnIdDVOf2MJKLw99C/gnQ=;
 b=W1SbpRbr9Cjys6tLNA7NgezBXuMOxkrnzy8fN4tg0ALuWGnFggaE2tniodv1zRhLLl
 GOkrK6X27A6TXO9m4vMynXqILkxmXX+94T81SaPO9YK1e5PbLJqO0emFrQ0hgA/ZOxtk
 vLyRNZ/0nzPnsVLSRi1Jwwr7vmt4gp1tw2oVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHwRisxgQPZpkwVZSG2QqoWnIdDVOf2MJKLw99C/gnQ=;
 b=ZmuqJaduEeA3ktJj5JeOa0TjdMnuZp2WUFCe0i4uUcjq5//gzpI1UQhO5FZ14uGNq+
 LkxYimoXy8GKqMwfrjgrxCBayu1JaBNu1t9S8pwBQc599CkgrodlmQ7uW2XOaqF/FZpw
 SlERLQvY1Xvv+vZbXKpkwC7WeZFMIYQhO9dxTJ/UyKA42QO/o7orEBUPDBpjx1JMUeX8
 gcbnTCG5MYMWCgDVzqaGlRpMTAcARZbHKY2WfWPz4LA0Bj11/FJyHXDolFWFTx6B1DHn
 ZS2GVcdiMcNmU8JW12yz1UZKgg4rZKiYwbPhtKWHfh4v9ploRrpDTPYKqDphcoy/I9Vv
 gB3g==
X-Gm-Message-State: AFqh2krGRDDG6H6Fam+FydKe63/BGKe+qoqjqJIqoisrWPudVvmTkg33
 DmD/iJxrfgp4GqhNoSe3Tga/4g==
X-Google-Smtp-Source: AMrXdXviW0BOVWo6Ls5+fq+5ELO9dJPAp1ySt02zFZkRjmcw5ol5ZSB4Sr4TMuwYjwukr2MfaqKoqQ==
X-Received: by 2002:adf:edce:0:b0:27e:eb6f:a733 with SMTP id
 v14-20020adfedce000000b0027eeb6fa733mr38046907wro.60.1673476175337; 
 Wed, 11 Jan 2023 14:29:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056000118100b002755e301eeasm14485589wrx.100.2023.01.11.14.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:29:34 -0800 (PST)
Date: Wed, 11 Jan 2023 23:29:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <Y784TJ5D1m0zsMDv@phenom.ffwll.local>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <60eea42e-07d6-3dc3-25ab-8fabc76c2473@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60eea42e-07d6-3dc3-25ab-8fabc76c2473@quicinc.com>
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 04:33:04PM -0800, Abhinav Kumar wrote:
> Hi Daniel
> 
> Thanks for looking into this series.
> 
> On 1/6/2023 1:49 PM, Dmitry Baryshkov wrote:
> > On Fri, 6 Jan 2023 at 20:41, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > 
> > > On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > > > > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> > > > > > > Introduce and add support for a solid_fill property. When the solid_fill
> > > > > > > property is set, and the framebuffer is set to NULL, memory fetch will be
> > > > > > > disabled.
> > > > > > > 
> > > > > > > In addition, loosen the NULL FB checks within the atomic commit callstack
> > > > > > > to allow a NULL FB when the solid_fill property is set and add FB checks
> > > > > > > in methods where the FB was previously assumed to be non-NULL.
> > > > > > > 
> > > > > > > Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> > > > > > > dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> > > > > > > callstack to account for a NULL FB in cases where solid_fill is set.
> > > > > > > 
> > > > > > > Some drivers support hardware that have optimizations for solid fill
> > > > > > > planes. This series aims to expose these capabilities to userspace as
> > > > > > > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > > > > > > hardware composer HAL) that can be set by apps like the Android Gears
> > > > > > > app.
> > > > > > > 
> > > > > > > Userspace can set the solid_fill property to a blob containing the
> > > > > > > appropriate version number and solid fill color (in RGB323232 format) and
> > > > > > > setting the framebuffer to NULL.
> > > > > > > 
> > > > > > > Note: Currently, there's only one version of the solid_fill blob property.
> > > > > > > However if other drivers want to support a similar feature, but require
> > > > > > > more than just the solid fill color, they can extend this feature by
> > > > > > > creating additional versions of the drm_solid_fill struct.
> > > > > > > 
> > > > > > > Changes in V2:
> > > > > > > - Dropped SOLID_FILL_FORMAT property (Simon)
> > > > > > > - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> > > > > > > - Changed to checks for if solid_fill_blob is set (Dmitry)
> > > > > > > - Abstracted (plane_state && !solid_fill_blob) checks to helper method
> > > > > > >     (Dmitry)
> > > > > > > - Removed DPU_PLANE_COLOR_FILL_FLAG
> > > > > > > - Fixed whitespace and indentation issues (Dmitry)
> > > > > > 
> > > > > > Now that this is a blob, I do wonder again whether it's not cleaner to set
> > > > > > the blob as the FB pointer. Or create some kind other kind of special data
> > > > > > source objects (because solid fill is by far not the only such thing).
> > > > > > 
> > > > > > We'd still end up in special cases like when userspace that doesn't
> > > > > > understand solid fill tries to read out such a framebuffer, but these
> > > > > > cases already exist anyway for lack of priviledges.
> > > > > > 
> > > > > > So I still think that feels like the more consistent way to integrate this
> > > > > > feature. Which doesn't mean it has to happen like that, but the
> > > > > > patches/cover letter should at least explain why we don't do it like this.
> > > > > 
> > > > > Hi Daniel,
> > > > > 
> > > > > IIRC we were facing some issues with this check [1] when trying to set
> > > > > FB to a PROP_BLOB instead. Which is why we went with making it a
> > > > > separate property instead. Will mention this in the cover letter.
> > > > 
> > > > What kind of issues? Could you please describe them?
> > > 
> > > We switched from bitmask to enum style for prop types, which means it's
> > > not possible to express with the current uapi a property which accepts
> > > both an object or a blob.
> > > 
> > > Which yeah sucks a bit ...
> > > 
> > > But!
> > > 
> > > blob properties are kms objects (like framebuffers), so it should be
> > > possible to stuff a blob into an object property as-is. Of course you need
> > > to update the validation code to make sure we accept either an fb or a
> > > blob for the internal representation. But that kind of split internally is
> > > required no matter what I think.
> > 
> > I checked your idea and notes from Jessica. So while we can pass blobs
> > to property objects, the prop_fb_id is created as an object property
> > with the type DRM_MODE_OBJECT_FB. Passing DRM_MODE_OBJECT_BLOB would
> > fail a check in drm_property_change_valid_get() ->
> > __drm_mode_object_find(). And I don't think that we should break the
> > existing validation code for this special case.
> > 
> 
> Like Jessica wrote, re-using the FB_ID property to pass solid fill
> information will need modification of existing checks shown in [1] OR the
> property creation itself would fail.

Yeah modifications there are needed. Or well, we need to extend that code
to allow bitmask for objects iff the driver allows that. What I meant is
that from an uapi pov it's doable, which is the part that matters because
that is the part that we wont ever be able to change once it's baked in.

> We just went with this approach, as it was less intrusive and would not
> affect the existing FB_ID path.
> 
> Since both approaches need modifications of validation checks, adding a new
> property is less intrusive and safer than the already convoluted checks in
> drm_property_flags_valid().

It's easier, but it's also the part that we cannot ever change (because
it's uapi). If the NULL fb on an active plane makes some compositor die on
vt switch, we then have a pretty serious problem.

I'm honestly not sure which is the approach that blows up less, just that
justifying uapi with the implementation work on the kernel side is not
really the right approach :-)

> Let us know if its a strong preference on your side to re-use FB_ID and if
> so why.

I just want to make sure we're picking the right uapi option, and that
we're not just excluding them because it looks like we can't implement
them in the kernel. Uapi is forever, the implemenation is not.
-Daniel

> Thanks
> 
> Abhinav
> 
> > If you insist on using FB_ID for passing solid_fill information, I'd
> > ask you to reconsider using a 1x1 framebuffer. It would be fully
> > compatible with the existing userspace, which can then treat it
> > seamlessly.
> > 
> > > -Daniel
> > > 
> > > > 
> > > > > 
> > > > > [1]
> > > > > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
