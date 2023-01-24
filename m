Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D426D679582
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B872910E65F;
	Tue, 24 Jan 2023 10:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 43149 seconds by postgrey-1.36 at gabe;
 Tue, 24 Jan 2023 10:42:52 UTC
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65D510E65F;
 Tue, 24 Jan 2023 10:42:52 +0000 (UTC)
Date: Tue, 24 Jan 2023 10:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1674556970; x=1674816170;
 bh=i/z349wjaRLFgEN1WwEOPP6Jtfhnv3QcYuT0Uq05V7Y=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=CaNpRFc1dUxvoK3qCUFvDdt2xDJT8Aon+QtqXxo7EfQIdvEf2VggMQqyzK6uV4xDe
 5AEpplQKjHWuM2kLKaQe5yJ58dmblOHEM8Rg5uCpnXWjVxGq/cVBggMoXxiQA7GTPP
 MlHmavQmwppRuyLoaG8HX98qU9lJCGspC2zlJBks95Y3sCSby7z2mnTU9ws2xR0MBv
 iLExLCsv214W1VF/lpLpBhx7/Dhtas1Fw2yOtg3Mg96nLMlpUSDTp/H4rjR8DN0ZCQ
 MDEzS29xzWq8YxyoE2ee281yj5VDmvH1queHVsPIVEmZBYJ5aVtvBKYzO8xXeL5F/Q
 Wbt8KeqsEBloA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <0Cub9hfb3QAHFLGsDbS6zzbzAJE-2-h_jBawDV8Yd2zf9VtSeOGxA9EkcLhAgJALhx6c1_P2mswGag3NVzkUxg7Pd7Uvgoizy7HMfwhAk6c=@emersion.fr>
In-Reply-To: <Y784TJ5D1m0zsMDv@phenom.ffwll.local>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <60eea42e-07d6-3dc3-25ab-8fabc76c2473@quicinc.com>
 <Y784TJ5D1m0zsMDv@phenom.ffwll.local>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, January 11th, 2023 at 23:29, Daniel Vetter <daniel@ffwll.ch> =
wrote:

> On Fri, Jan 06, 2023 at 04:33:04PM -0800, Abhinav Kumar wrote:
> > Hi Daniel
> >
> > Thanks for looking into this series.
> >
> > On 1/6/2023 1:49 PM, Dmitry Baryshkov wrote:
> > > On Fri, 6 Jan 2023 at 20:41, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc=
.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > > > > > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote=
:
> > > > > > > > Introduce and add support for a solid_fill property. When t=
he solid_fill
> > > > > > > > property is set, and the framebuffer is set to NULL, memory=
 fetch will be
> > > > > > > > disabled.
> > > > > > > >
> > > > > > > > In addition, loosen the NULL FB checks within the atomic co=
mmit callstack
> > > > > > > > to allow a NULL FB when the solid_fill property is set and =
add FB checks
> > > > > > > > in methods where the FB was previously assumed to be non-NU=
LL.
> > > > > > > >
> > > > > > > > Finally, have the DPU driver use drm_plane_state.solid_fill=
 and instead of
> > > > > > > > dpu_plane_state.color_fill, and add extra checks in the DPU=
 atomic commit
> > > > > > > > callstack to account for a NULL FB in cases where solid_fil=
l is set.
> > > > > > > >
> > > > > > > > Some drivers support hardware that have optimizations for s=
olid fill
> > > > > > > > planes. This series aims to expose these capabilities to us=
erspace as
> > > > > > > > some compositors have a solid fill flag (ex. SOLID_COLOR in=
 the Android
> > > > > > > > hardware composer HAL) that can be set by apps like the And=
roid Gears
> > > > > > > > app.
> > > > > > > >
> > > > > > > > Userspace can set the solid_fill property to a blob contain=
ing the
> > > > > > > > appropriate version number and solid fill color (in RGB3232=
32 format) and
> > > > > > > > setting the framebuffer to NULL.
> > > > > > > >
> > > > > > > > Note: Currently, there's only one version of the solid_fill=
 blob property.
> > > > > > > > However if other drivers want to support a similar feature,=
 but require
> > > > > > > > more than just the solid fill color, they can extend this f=
eature by
> > > > > > > > creating additional versions of the drm_solid_fill struct.
> > > > > > > >
> > > > > > > > Changes in V2:
> > > > > > > > - Dropped SOLID_FILL_FORMAT property (Simon)
> > > > > > > > - Switched to implementing solid_fill property as a blob (S=
imon, Dmitry)
> > > > > > > > - Changed to checks for if solid_fill_blob is set (Dmitry)
> > > > > > > > - Abstracted (plane_state && !solid_fill_blob) checks to he=
lper method
> > > > > > > >     (Dmitry)
> > > > > > > > - Removed DPU_PLANE_COLOR_FILL_FLAG
> > > > > > > > - Fixed whitespace and indentation issues (Dmitry)
> > > > > > >
> > > > > > > Now that this is a blob, I do wonder again whether it's not c=
leaner to set
> > > > > > > the blob as the FB pointer. Or create some kind other kind of=
 special data
> > > > > > > source objects (because solid fill is by far not the only suc=
h thing).
> > > > > > >
> > > > > > > We'd still end up in special cases like when userspace that d=
oesn't
> > > > > > > understand solid fill tries to read out such a framebuffer, b=
ut these
> > > > > > > cases already exist anyway for lack of priviledges.
> > > > > > >
> > > > > > > So I still think that feels like the more consistent way to i=
ntegrate this
> > > > > > > feature. Which doesn't mean it has to happen like that, but t=
he
> > > > > > > patches/cover letter should at least explain why we don't do =
it like this.
> > > > > >
> > > > > > Hi Daniel,
> > > > > >
> > > > > > IIRC we were facing some issues with this check [1] when trying=
 to set
> > > > > > FB to a PROP_BLOB instead. Which is why we went with making it =
a
> > > > > > separate property instead. Will mention this in the cover lette=
r.
> > > > >
> > > > > What kind of issues? Could you please describe them?
> > > >
> > > > We switched from bitmask to enum style for prop types, which means =
it's
> > > > not possible to express with the current uapi a property which acce=
pts
> > > > both an object or a blob.
> > > >
> > > > Which yeah sucks a bit ...
> > > >
> > > > But!
> > > >
> > > > blob properties are kms objects (like framebuffers), so it should b=
e
> > > > possible to stuff a blob into an object property as-is. Of course y=
ou need
> > > > to update the validation code to make sure we accept either an fb o=
r a
> > > > blob for the internal representation. But that kind of split intern=
ally is
> > > > required no matter what I think.
> > >
> > > I checked your idea and notes from Jessica. So while we can pass blob=
s
> > > to property objects, the prop_fb_id is created as an object property
> > > with the type DRM_MODE_OBJECT_FB. Passing DRM_MODE_OBJECT_BLOB would
> > > fail a check in drm_property_change_valid_get() ->
> > > __drm_mode_object_find(). And I don't think that we should break the
> > > existing validation code for this special case.
> > >
> >
> > Like Jessica wrote, re-using the FB_ID property to pass solid fill
> > information will need modification of existing checks shown in [1] OR t=
he
> > property creation itself would fail.
>=20
> Yeah modifications there are needed. Or well, we need to extend that code
> to allow bitmask for objects iff the driver allows that. What I meant is
> that from an uapi pov it's doable, which is the part that matters because
> that is the part that we wont ever be able to change once it's baked in.
>=20
> > We just went with this approach, as it was less intrusive and would not
> > affect the existing FB_ID path.
> >
> > Since both approaches need modifications of validation checks, adding a=
 new
> > property is less intrusive and safer than the already convoluted checks=
 in
> > drm_property_flags_valid().
>=20
> It's easier, but it's also the part that we cannot ever change (because
> it's uapi). If the NULL fb on an active plane makes some compositor die o=
n
> vt switch, we then have a pretty serious problem.

The new compositor might try to GETFB on the blob which isn't actually an F=
B,
and gets confused even more...

> I'm honestly not sure which is the approach that blows up less, just that
> justifying uapi with the implementation work on the kernel side is not
> really the right approach :-)
>=20
> > Let us know if its a strong preference on your side to re-use FB_ID and=
 if
> > so why.
>=20
> I just want to make sure we're picking the right uapi option, and that
> we're not just excluding them because it looks like we can't implement
> them in the kernel. Uapi is forever, the implemenation is not.

IMHO re-using FB_ID for this is not a good idea. FB_ID is described by the
kernel as a property which accepts FB objects (DRM_MODE_OBJECT_FB). Mixing =
up
something else will just result in more confusion.
