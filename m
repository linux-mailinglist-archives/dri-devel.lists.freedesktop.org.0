Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ACF6F85A9
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 17:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509DC10E627;
	Fri,  5 May 2023 15:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72C710E0EC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 15:28:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9659dee48edso50292066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1683300511; x=1685892511;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I/bp2dbwNkmnXrxxLyUgzNawr5gq3eqvYqBraVVtdGs=;
 b=J38cOnYr4S6To0rfo+EonyDFvGcnVEhtqAOWg7T5Ez4ptvcBFpTixDF0YM8O3TbUjL
 UGsrRxwm5toCd+JkPfu9uFiwWY0Poyqv5OnmsdFznwSBc6jSFrmrI19TyiRlKRaxjnTV
 q7ZPb0e5PJ9tt3cfdj69vhVAwxqHzDMYti0W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683300511; x=1685892511;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I/bp2dbwNkmnXrxxLyUgzNawr5gq3eqvYqBraVVtdGs=;
 b=BhUcg3PT856jqqtOeiJBtBbhHar+e86lf53bom3Y9Pq6mWIMAAz1rFngYwmcNcUCTj
 p5zHxsBJmh02H/bs8xL/j7/jY7hyQwlI9gv00Awnv/R5LvmeV4u1OLKrDLBl31Jj4dLK
 bd84+LGMvJSU/hk8BZkZG6mUlOMCoCqv10m2bKnVA2balcB6HypeiRktSo9qpnIxLvoT
 XoXolF1IaR/vnTV7BJS2LNK7+xzgTqeAkuD9X0hZJZmnvgDqPA+qBRveLeHLFQDtGryh
 Cb6PrBnoLwdSDSDNHcRunpRjp4Z7lGml2/PIKKnVeMfd/yZYqR+sC6Z7Jhhbbo37LxNl
 XdfA==
X-Gm-Message-State: AC+VfDx0+EntQu+0Bj71aM8fagRLTdS1oGzcP8FuGgGDwcdbSswYsrW5
 Z7ICFIn/2NQQnkkdaAEIf74qQQ==
X-Google-Smtp-Source: ACHHUZ5xOIoBHicqeGJuVY0u2eKAoVe1JW6ZCELRfOwZk9sIlrrDb1LBeTbIT/wRrFedcoHquPhjWw==
X-Received: by 2002:a17:906:5350:b0:8d2:78c5:1d4e with SMTP id
 j16-20020a170906535000b008d278c51d4emr1548063ejo.5.1683300510697; 
 Fri, 05 May 2023 08:28:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 bi6-20020a170906a24600b0095337c5da35sm1087563ejb.15.2023.05.05.08.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:28:30 -0700 (PDT)
Date: Fri, 5 May 2023 17:28:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <ZFUgnMI4IIbv78By@phenom.ffwll.local>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 03:22:59PM +0000, Simon Ser wrote:
> Hi all,
> 
> The goal of this RFC is to expose a generic KMS uAPI to configure the color
> pipeline before blending, ie. after a pixel is tapped from a plane's
> framebuffer and before it's blended with other planes. With this new uAPI we
> aim to reduce the battery life impact of color management and HDR on mobile
> devices, to improve performance and to decrease latency by skipping
> composition on the 3D engine. This proposal is the result of discussions at
> the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> familiar with the AMD, Intel and NVIDIA hardware have participated in the
> discussion.
> 
> This proposal takes a prescriptive approach instead of a descriptive approach.
> Drivers describe the available hardware blocks in terms of low-level
> mathematical operations, then user-space configures each block. We decided
> against a descriptive approach where user-space would provide a high-level
> description of the colorspace and other parameters: we want to give more
> control and flexibility to user-space, e.g. to be able to replicate exactly the
> color pipeline with shaders and switch between shaders and KMS pipelines
> seamlessly, and to avoid forcing user-space into a particular color management
> policy.

Ack on the prescriptive approach, but generic imo. Descriptive pretty much
means you need the shaders at the same api level for fallback purposes,
and we're not going to have that ever in kms. That would need something
like hwc in userspace to work.

And not generic in it's ultimate consquence would mean we just do a blob
for a crtc with all the vendor register stuff like adf (android display
framework) does, because I really don't see a point in trying a
generic-looking-but-not vendor uapi with each color op/stage split out.

So from very far and pure gut feeling, this seems like a good middle
ground in the uapi design space we have here.

> We've decided against mirroring the existing CRTC properties
> DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
> pipeline can significantly differ between vendors and this approach cannot
> accurately abstract all hardware. In particular, the availability, ordering and
> capabilities of hardware blocks is different on each display engine. So, we've
> decided to go for a highly detailed hardware capability discovery.
> 
> This new uAPI should not be in conflict with existing standard KMS properties,
> since there are none which control the pre-blending color pipeline at the
> moment. It does conflict with any vendor-specific properties like
> NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-specific
> properties. Drivers will need to either reject atomic commits configuring both
> uAPIs, or alternatively we could add a DRM client cap which hides the vendor
> properties and shows the new generic properties when enabled.
> 
> To use this uAPI, first user-space needs to discover hardware capabilities via
> KMS objects and properties, then user-space can configure the hardware via an
> atomic commit. This works similarly to the existing KMS uAPI, e.g. planes.
> 
> Our proposal introduces a new "color_pipeline" plane property, and a new KMS
> object type, "COLOROP" (short for color operation). The "color_pipeline" plane
> property is an enum, each enum entry represents a color pipeline supported by
> the hardware. The special zero entry indicates that the pipeline is in
> "bypass"/"no-op" mode. For instance, the following plane properties describe a
> primary plane with 2 supported pipelines but currently configured in bypass
> mode:
> 
>     Plane 10
>     ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>     ├─ …
>     └─ "color_pipeline": enum {0, 42, 52} = 0

A bit confused, why is this an enum, and not just an immutable prop that
points at the first element? You already can disable elements with the
bypass thing, also bypassing by changing the pointers to the next node in
the graph seems a bit confusing and redundant.

> The non-zero entries describe color pipelines as a linked list of COLOROP KMS
> objects. The entry value is an object ID pointing to the head of the linked
> list (the first operation in the color pipeline).
> 
> The new COLOROP objects also expose a number of KMS properties. Each has a
> type, a reference to the next COLOROP object in the linked list, and other
> type-specific properties. Here is an example for a 1D LUT operation:

Ok no comments from me on the actual color operations and semantics of all
that, because I have simply nothing to bring to that except confusion :-)

Some higher level thoughts instead:

- I really like that we just go with graph nodes here. I think that was
  bound to happen sooner or later with kms (we almost got there with
  writeback, and with hindsight maybe should have).

- Since there's other use-cases for graph nodes (maybe scaler modes, or
  histogram samplers for adaptive backglight, or blending that goes beyond
  the stacked alpha blending we have now) it think we should make this all
  fairly generic:
  * Add a new graph node kms object type.
  * Add a class type so that userspace knows which graph nodes it must
    understand for a feature (like "ColorOp" on planes here), and which it
    can ignore (like perhaps a scaler node to control the interpolation)
  * Probably need to adjust the object property type. Currently that
    accept any object of a given type (crtc, fb, blob are the major ones).
    I think for these graph nodes we want an explicit enumeration of the
    possible next objects. In kms thus far we've done that with the
    separate possible_* mask properties, but they're cumbersome.
  * It sounds like for now we only have immutable next pointers, so that
    would simplify the first iteration, but should probably anticipate all
    this.

- I think the graph node should be built on top of the driver private
  atomic obj/state stuff, and could then be further subclassed for
  specific types. It's a bit much stacking, but avoids too much wheel
  reinventing, and the worst boilerplate can be avoided with some macros
  that combine the pointer chasing with the containter_of upcast. With
  that you can easily build some helpers to walk the graph for a crtc or
  plane or whatever really.

- I guess core atomic code should at least do the graph link validation
  and basic things like that, probably not really more to do. And
  validating the standard properties on some graph nodes ofc.

- I have no idea how we should support the standardization of the state
  structures. Doing a separate subclass for each type sounds extremely
  painful, but unions otoh are ugly. Ideally type-indexed and type safe
  union but C isn't good enough for that. I do think that we should keep
  up the goal that standard properties are decoded into state structures
  in core atomic code, and not in each implementation individaully.

- I think the only other precendent for something like this is the media
  control api in the media subystem. I think it'd be really good to get
  someone like Laurent to ack the graph node infrastructure to make sure
  we're missing any lesson they've learned already. If there's anything
  else we should pull these folks in too ofc.

For merge plan I dropped some ideas already on Harry's rfc for
vendor-private properties, the only thing to add is that we might want to
type up the consensus plan into a merged doc like
Documentation/gpu/rfc/hdr-plane.rst or whatever you feel like for a name.

Cheers, Daniel


> 
>     Color operation 42
>     ├─ "type": enum {Bypass, 1D curve} = 1D curve
>     ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
>     ├─ "lut_size": immutable range = 4096
>     ├─ "lut_data": blob
>     └─ "next": immutable color operation ID = 43
> 
> To configure this hardware block, user-space can fill a KMS blob with 4096 u32
> entries, then set "lut_data" to the blob ID. Other color operation types might
> have different properties.
> 
> Here is another example with a 3D LUT:
> 
>     Color operation 42
>     ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>     ├─ "lut_size": immutable range = 33
>     ├─ "lut_data": blob
>     └─ "next": immutable color operation ID = 43
> 
> And one last example with a matrix:
> 
>     Color operation 42
>     ├─ "type": enum {Bypass, Matrix} = Matrix
>     ├─ "matrix_data": blob
>     └─ "next": immutable color operation ID = 43
> 
> [Simon note: having "Bypass" in the "type" enum, and making "type" mutable is
> a bit weird. Maybe we can just add an "active"/"bypass" boolean property on
> blocks which can be bypassed instead.]
> 
> [Jonas note: perhaps a single "data" property for both LUTs and matrices
> would make more sense. And a "size" prop for both 1D and 3D LUTs.]
> 
> If some hardware supports re-ordering operations in the color pipeline, the
> driver can expose multiple pipelines with different operation ordering, and
> user-space can pick the ordering it prefers by selecting the right pipeline.
> The same scheme can be used to expose hardware blocks supporting multiple
> precision levels.
> 
> That's pretty much all there is to it, but as always the devil is in the
> details.
> 
> First, we realized that we need a way to indicate where the scaling operation
> is happening. The contents of the framebuffer attached to the plane might be
> scaled up or down depending on the CRTC_W and CRTC_H properties. Depending on
> the colorspace scaling is applied in, the result will be different, so we need
> a way for the kernel to indicate which hardware blocks are pre-scaling, and
> which ones are post-scaling. We introduce a special "scaling" operation type,
> which is part of the pipeline like other operations but serves an informational
> role only (effectively, the operation cannot be configured by user-space, all
> of its properties are immutable). For example:
> 
>     Color operation 43
>     ├─ "type": immutable enum {Scaling} = Scaling
>     └─ "next": immutable color operation ID = 44
> 
> [Simon note: an alternative would be to split the color pipeline into two, by
> having two plane properties ("color_pipeline_pre_scale" and
> "color_pipeline_post_scale") instead of a single one. This would be similar to
> the way we want to split pre-blending and post-blending. This could be less
> expressive for drivers, there may be hardware where there are dependencies
> between the pre- and post-scaling pipeline?]
> 
> Then, Alex from NVIDIA described how their hardware works. NVIDIA hardware
> contains some fixed-function blocks which convert from LMS to ICtCp and cannot
> be disabled/bypassed. NVIDIA hardware has been designed for descriptive APIs
> where user-space provides a high-level description of the colorspace
> conversions it needs to perform, and this is at odds with our KMS uAPI
> proposal. To address this issue, we suggest adding a special block type which
> describes a fixed conversion from one colorspace to another and cannot be
> configured by user-space. Then user-space will need to accomodate its pipeline
> for these special blocks. Such fixed hardware blocks need to be well enough
> documented so that they can be implemented via shaders.
> 
> We also noted that it should always be possible for user-space to completely
> disable the color pipeline and switch back to bypass/identity without a
> modeset. Some drivers will need to fail atomic commits for some color
> pipelines, in particular for some specific LUT payloads. For instance, AMD
> doesn't support curves which are too steep, and Intel doesn't support curves
> which decrease. This isn't something which routinely happens, but there might
> be more cases where the hardware needs to reject the pipeline. Thus, when
> user-space has a running KMS color pipeline, then hits a case where the
> pipeline cannot keep running (gets rejected by the driver), user-space needs to
> be able to immediately fall back to shaders without any glitch. This doesn't
> seem to be an issue for AMD, Intel and NVIDIA.
> 
> This uAPI is extensible: we can add more color operations, and we can add more
> properties for each color operation type. For instance, we might want to add
> support for Intel piece-wise linear (PWL) 1D curves, or might want to advertise
> the effective precision of the LUTs. The uAPI is deliberately somewhat minimal
> to keep the scope of the proposal manageable.
> 
> Later on, we plan to re-use the same machinery for post-blending color
> pipelines. There are some more details about post-blending which have been
> separately debated at the hackfest, but we believe it's a viable plan. This
> solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT properties, so
> we'd like to introduce a client cap to hide the old properties and show the new
> post-blending color pipeline properties.
> 
> We envision a future user-space library to translate a high-level descriptive
> color pipeline into low-level prescriptive KMS color pipeline ("libliftoff but
> for color pipelines"). The library could also offer a translation into shaders.
> This should help share more infrastructure between compositors and ease KMS
> offloading. This should also help dealing with the NVIDIA case.
> 
> To wrap things up, let's take a real-world example: how would gamescope [2]
> configure the AMD DCN 3.0 hardware for its color pipeline? The gamescope color
> pipeline is described in [3]. The AMD DCN 3.0 hardware is described in [4].
> 
> AMD would expose the following objects and properties:
> 
>     Plane 10
>     ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>     └─ "color_pipeline": enum {0, 42} = 0
>     Color operation 42 (input CSC)
>     ├─ "type": enum {Bypass, Matrix} = Matrix
>     ├─ "matrix_data": blob
>     └─ "next": immutable color operation ID = 43
>     Color operation 43
>     ├─ "type": enum {Scaling} = Scaling
>     └─ "next": immutable color operation ID = 44
>     Color operation 44 (DeGamma)
>     ├─ "type": enum {Bypass, 1D curve} = 1D curve
>     ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
>     └─ "next": immutable color operation ID = 45
>     Color operation 45 (gamut remap)
>     ├─ "type": enum {Bypass, Matrix} = Matrix
>     ├─ "matrix_data": blob
>     └─ "next": immutable color operation ID = 46
>     Color operation 46 (shaper LUT RAM)
>     ├─ "type": enum {Bypass, 1D curve} = 1D curve
>     ├─ "1d_curve_type": enum {LUT} = LUT
>     ├─ "lut_size": immutable range = 4096
>     ├─ "lut_data": blob
>     └─ "next": immutable color operation ID = 47
>     Color operation 47 (3D LUT RAM)
>     ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>     ├─ "lut_size": immutable range = 17
>     ├─ "lut_data": blob
>     └─ "next": immutable color operation ID = 48
>     Color operation 48 (blend gamma)
>     ├─ "type": enum {Bypass, 1D curve} = 1D curve
>     ├─ "1d_curve_type": enum {LUT, sRGB, PQ, …} = LUT
>     ├─ "lut_size": immutable range = 4096
>     ├─ "lut_data": blob
>     └─ "next": immutable color operation ID = 0
> 
> To configure the pipeline for an HDR10 PQ plane (path at the top) and a HDR
> display, gamescope would perform an atomic commit with the following property
> values:
> 
>     Plane 10
>     └─ "color_pipeline" = 42
>     Color operation 42 (input CSC)
>     └─ "matrix_data" = PQ → scRGB (TF)
>     Color operation 44 (DeGamma)
>     └─ "type" = Bypass
>     Color operation 45 (gamut remap)
>     └─ "matrix_data" = scRGB (TF) → PQ
>     Color operation 46 (shaper LUT RAM)
>     └─ "lut_data" = PQ → Display native
>     Color operation 47 (3D LUT RAM)
>     └─ "lut_data" = Gamut mapping + tone mapping + night mode
>     Color operation 48 (blend gamma)
>     └─ "1d_curve_type" = PQ
> 
> I hope comparing these properties to the diagrams linked above can help
> understand how the uAPI would be used and give an idea of its viability.
> 
> Please feel free to provide feedback! It would be especially useful to have
> someone familiar with Arm SoCs look at this, to confirm that this proposal
> would work there.
> 
> Unless there is a show-stopper, we plan to follow up this RFC with
> implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
> 
> Many thanks to everybody who contributed to the hackfest, on-site or remotely!
> Let's work together to make this happen!
> 
> Simon, on behalf of the hackfest participants
> 
> [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> [2]: https://github.com/ValveSoftware/gamescope
> [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29cef5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
