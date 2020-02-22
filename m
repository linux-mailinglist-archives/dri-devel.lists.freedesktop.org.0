Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270616A1E5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7331B6E1ED;
	Mon, 24 Feb 2020 09:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BF06E530
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:10:36 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q23so4770595ljm.4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 01:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aeinKijMUvwZffs1jb5awpoaXApbMpKIiMbRpFs/dbw=;
 b=Kjatv9F1CvG3i9rnmPS47G+S0+d40cd2EOCjbdtsXxDsabaarlCeMWFMAqK2q0noIy
 5h/9NqOtPOp/FH7nMCuZUuoII5mH70iSWXZj9BFWZAjCASNMdib+O6tSiVD3Wc3RItmW
 QaFwzWHILgVGi+FnTmPtNdDQA3TnlxEFQGVsKoR8CwgVjXU7bskgIBR8ZgL9D67AZ18d
 bmQggADFpvq8q5joCPrMJrvFy51UHQi7ShnnCAoF66o/nllDXj3rGE58aMoFUQQMNcjr
 +aqq6YQz92TEE+9tSndZwwwnfngxErNP2pk382zGcGKVKmtgh7OiDW8GTQSnQOFMzyjE
 JENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aeinKijMUvwZffs1jb5awpoaXApbMpKIiMbRpFs/dbw=;
 b=PvSrX46pmq6JCy3BKzNMLI1gWCtinvmJ94E3rbg76Kxd8OHYfIos2BX6FntR0UZd3l
 SARpFQ1Lxon0UmDnsNp5qvYLPyGSFBp2nwnO+1QckhSmi2kX3furDAK5OCE6EzWGZvOD
 gRf/FJLlYjl9YznAZ+emGh5DvL+eLnbW+D0k7B7mZubWawlX44rk/hNf/PscVWhRpyBd
 Kczb8inEzz1s8qus8HvUePNGO59gtvL4R5hYFhCcljzspRXAdChGKZKE1qQ954IB5++j
 Xmn0VVOz7rYVF8crF4R5v/OgK1s1oS+dVVlxCxONHM2QU0qrEsuPx7M57WVlSF2Lv3ta
 3TWQ==
X-Gm-Message-State: APjAAAVdFFT89i9gBR70gKaXTR0YMs6ttNLvpye3D5ZRwQ38QItOD6nv
 08Ft6uIq9Jmwvm7fEQU1OfglYbUj3o4a9epIRAs=
X-Google-Smtp-Source: APXvYqzt2fy0OQ5cPwyyek5jwcKfEoqt6c4Hu862dkrXlpEJwEOvQtp47c7eLwisjrbcC7pPh4VAEOKrgrd53lPiHEY=
X-Received: by 2002:a2e:5056:: with SMTP id v22mr24598753ljd.164.1582362634527; 
 Sat, 22 Feb 2020 01:10:34 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-2-git-send-email-kevin3.tang@gmail.com>
 <20200221212118.GC3456@ravnborg.org>
In-Reply-To: <20200221212118.GC3456@ravnborg.org>
From: Orson Zhai <orsonzhai@gmail.com>
Date: Sat, 22 Feb 2020 17:10:22 +0800
Message-ID: <CA+H2tpF-cYUBq5cKDzZ0n+OLemtrDnPKcdN=KV_tc38S2y+yoA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Tang <kevin3.tang@gmail.com>,
 Baolin Wang <baolin.wang@linaro.org>, airlied@linux.ie,
 Lyra Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 5:21 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Kevin.
>
> On Fri, Feb 21, 2020 at 03:48:51PM +0800, Kevin Tang wrote:
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > The Unisoc DRM master device is a virtual device needed to list all
> > DPU devices or other display interface nodes that comprise the
> > graphics subsystem
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang@linaro.org>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  .../devicetree/bindings/display/sprd/drm.yaml      | 38 ++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> > new file mode 100644
> > index 0000000..1614ca6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Unisoc DRM master device
> > +
> > +maintainers:
> > +  - David Airlie <airlied@linux.ie>
> > +  - Daniel Vetter <daniel@ffwll.ch>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +  - Mark Rutland <mark.rutland@arm.com>
>
> Rob is king of a super-maintainer.
> He should not be listed unless he has special
> relations to sprd.
> David + Daniel - likewise. Unless they are closely related to sprd drop
> them.
>
> > +
> > +description: |
> > +  The Unisoc DRM master device is a virtual device needed to list all
> > +  DPU devices or other display interface nodes that comprise the
> > +  graphics subsystem.
>
> I wonder why you name it "Unisoc" when all other places references sprd.

sprd is abbreviation for Spreadtrum who was acquired by Unigroup and
combined with
another company RDA into Unisoc recently.
Unfortunately these 2 companies already have had their vendor prefix
in kernel tree as sprd and
rda for each.
So far each of their prefix is kept unchanging.

-Orson
>
>
> > +
> > +properties:
> > +  compatible:
> > +    const: sprd,display-subsystem
> > +
> > +  ports:
> > +    description:
> > +      Should contain a list of phandles pointing to display interface port
> > +      of DPU devices.
> > +
> > +required:
> > +  - compatible
> > +  - ports
> So you want to force the driver to support ports - and no panel
> referenced directly?
>
> > +
> > +examples:
> > +  - |
> > +    display-subsystem {
> > +        compatible = "sprd,display-subsystem";
> > +        ports = <&dpu_out>;
> > +    };
> > \ No newline at end of file
> Please fix.
>
>         Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
