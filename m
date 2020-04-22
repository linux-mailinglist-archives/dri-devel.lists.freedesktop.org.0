Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B31B4DE8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 22:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B115883C5;
	Wed, 22 Apr 2020 20:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D4C883C5;
 Wed, 22 Apr 2020 20:02:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t14so4023438wrw.12;
 Wed, 22 Apr 2020 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OuJ642QNA4A7wvc5+3aRgoAp1gwDXwTAcEpXfkSYc1E=;
 b=Apr/a8mGERYV3rRYil7/SnSadDcx+c2huXSt+KnAqnrYpIm446pHxcFuR4eA1iv0gh
 CchWQ3W+1K6+SwYbKxV9Hjyxi17f+vBMRdB3dvhUVPLS2PVrnAw6GR/1PZwM/cb2Dvnt
 lO0yPJj8+iszdE/aj3/5PuQHNR+/e7SOjEPrrVMeVbHSkp3QLgyfcF1KnBFAGqb0/PWK
 iXvAMpVgsy1I3lRy+APfqZ73PgQTL7CsvREDWK46DGMXclgk4mZy1LqMCpDsJMSufpFD
 5sx00FGrQ5cA4hgNmv+Y5fAG+xl08EBRCrnVijwuxZ8EejL+yBzpHoimtk2zImlu2VMl
 NebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OuJ642QNA4A7wvc5+3aRgoAp1gwDXwTAcEpXfkSYc1E=;
 b=BBFTZrRqKOVHW5Rm/ykLQ0Mu7dvV89rpvLb59iPx1MTcj9xkgzs6rXRSzG0A27ODgK
 cMKQO0i7KGt+X3Oz/aMXGfL38BOxoLeT3EjKGlvKwYJT13lq/JhBsMDH+d2pxy67QpPo
 M6CdvnquDOkfxqAI232QVfOM5V20hu6Q85m/xKIvaZ8AZdj7AJnTWr2PYnnkZCHXsdcT
 b79pXPruu3x7+VsXbnhZGuFV4R00OMoUrFqnhT5gC3HZrk2rjw+HCxqF/iW92zmlxAFm
 zHZPt7Gk5IJ+hVCxBwVRjs2gU0pP3CU2D3pc1SmNGQ7nXtpelpzlqnOt5yBXDNGsxvy1
 Z70w==
X-Gm-Message-State: AGi0PubDa7IpvbTDAv2hD9GTBVApIelsSU1X+TQO9is8HLRMwuXEFlW/
 IFVwT28EewTX2eWElucBncSdWpR8gE/edqZPqpM=
X-Google-Smtp-Source: APiQypJfrprCm/T1bwaCdsjBbfNk1tEgBWhve0G7SDkPT9Dm/zvsmDWgvZ+La8VTcJpM28ZlRwILwvhERndbs3xPElw=
X-Received: by 2002:a5d:5352:: with SMTP id t18mr767455wrv.111.1587585764794; 
 Wed, 22 Apr 2020 13:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <31d56a46-e3de-e768-a154-03b6afb3ad72@infradead.org>
 <6892a582-3598-1963-5b6b-96cd8d24dad5@amd.com>
In-Reply-To: <6892a582-3598-1963-5b6b-96cd8d24dad5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Apr 2020 16:02:33 -0400
Message-ID: <CADnq5_OPGy37a2Rf3iJkO1zTyWhK6q-u-zE6H4uDq2zweC8X+g@mail.gmail.com>
Subject: Re: [PATCH] drm: amd/display: fix Kconfig help text
To: Harry Wentland <hwentlan@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 10:00 AM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2020-04-21 7:34 p.m., Randy Dunlap wrote:
> > From: Randy Dunlap <rdunlap@infradead.org>
> >
> > Fix help text: indent one tab + 2 spaces; end a sentence with a
> > period; and collapse short lines of text to one line.
> >
> > Fixes: 23c61b4599c4 ("drm/amd: Fix Kconfig indentation")
> > Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>

Applied.  Thanks!

Alex

> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/Kconfig |    8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > --- linux-next-20200421.orig/drivers/gpu/drm/amd/display/Kconfig
> > +++ linux-next-20200421/drivers/gpu/drm/amd/display/Kconfig
> > @@ -21,16 +21,12 @@ config DRM_AMD_DC_HDCP
> >       bool "Enable HDCP support in DC"
> >       depends on DRM_AMD_DC
> >       help
> > -      Choose this option
> > -      if you want to support
> > -      HDCP authentication
> > +       Choose this option if you want to support HDCP authentication.
> >
> >  config DEBUG_KERNEL_DC
> >       bool "Enable kgdb break in DC"
> >       depends on DRM_AMD_DC
> >       help
> > -       Choose this option
> > -       if you want to hit
> > -       kdgb_break in assert.
> > +       Choose this option if you want to hit kdgb_break in assert.
> >
> >  endmenu
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
