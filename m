Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3563446228
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 11:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E97B6E086;
	Fri,  5 Nov 2021 10:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E235E6E086
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 10:24:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6124255wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wughG4qxRUnf+ZAEboXxi/hr77FofhKpeq3OM7yjSGk=;
 b=B3rJ6rXIMweJWSeypJKjKHfi/VTkLqZfBJIZ7xs1onwCxkL9svhm8ZHl+ZnULwhYpb
 5GsDM/8gWp4p2BTWPBvm7JkD2JtYSoyguGWpcXxehUv38G5m4HO4eBLWQH0RiBunu1Fn
 o614k+uZO2kB8q40uVVCMydOfCF12P1pjhlwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wughG4qxRUnf+ZAEboXxi/hr77FofhKpeq3OM7yjSGk=;
 b=5PzArL8q4nrGMGZFWXKThflHlliPL2S6TUiiLsX2JKUcL7rMCaacxcsvVeOaQiMfR9
 pM7Sf6fJoFHSc0YojPLgWG1InTnHNwzIRs416SMbph/Cfhr/MtVr6so1kTpNUFweoBAu
 qsxFpWkt5BSmULcWqa8H5V3ziZB3RrkKVUtKmL9xlWr0Dxe62Bmb0vmpaNjxslfRT7uc
 CTR2P3YmL/NdxxorRil1U28mM8OcyOF89XGJmW3YX2RpENqhPMiJa2Q5kFQgvjqbztiD
 lLv5JrLej+nIITQDcItzC06+4eSfVVb8Pj+d3UXVOKLU4Ex7x7B678ko4EwV7wCeZrqO
 FkUQ==
X-Gm-Message-State: AOAM5321lRyEexEQYc+G0OsF2RUQkvON90J2Ewl3PP1SSMN7pyGsSDS1
 BLsIBgHxrZwZifv0CF1HULGzuA==
X-Google-Smtp-Source: ABdhPJxSduJoe3RgdbDpnBdmbfLOhm57xQbJA7BPyJNH30Gub4m22li3xSm9843vQ1pWfGhyk5KIlA==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr9076196wmr.45.1636107841476; 
 Fri, 05 Nov 2021 03:24:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y7sm7445927wrw.55.2021.11.05.03.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 03:24:01 -0700 (PDT)
Date: Fri, 5 Nov 2021 11:23:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: dri-devel is for all of drivers/gpu
Message-ID: <YYUGP/jajA6KUS/j@phenom.ffwll.local>
References: <20211028170857.4029606-1-daniel.vetter@ffwll.ch>
 <CADnq5_N8OOx=Sd3mJSb1KjROUFdB2czrQudLN3Dp_p8=CG8BqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_N8OOx=Sd3mJSb1KjROUFdB2czrQudLN3Dp_p8=CG8BqA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 01:36:58PM -0400, Alex Deucher wrote:
> On Thu, Oct 28, 2021 at 1:09 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Somehow we only have a list of subdirectories, which apparently made
> > it harder for folks to find the gpu maintainers. Fix that.
> >
> > References: https://lore.kernel.org/dri-devel/YXrAAZlxxStNFG%2FK@phenom.ffwll.local/
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

'tis should be good enough, I stuffed this into drm-misc-next-fixes.
-Daniel

> 
> > ---
> >  MAINTAINERS | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 98aa1f55ed41..fdb1f91c6bb9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6153,8 +6153,7 @@ T:        git git://anongit.freedesktop.org/drm/drm
> >  F:     Documentation/devicetree/bindings/display/
> >  F:     Documentation/devicetree/bindings/gpu/
> >  F:     Documentation/gpu/
> > -F:     drivers/gpu/drm/
> > -F:     drivers/gpu/vga/
> > +F:     drivers/gpu/
> >  F:     include/drm/
> >  F:     include/linux/vga*
> >  F:     include/uapi/drm/
> > --
> > 2.33.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
