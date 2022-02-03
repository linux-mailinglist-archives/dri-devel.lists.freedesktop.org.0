Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD74A842C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 13:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A3D10F69B;
	Thu,  3 Feb 2022 12:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126810F69B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 12:57:34 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id t199so3875148oie.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bstye3+6hcI4XrRtz56PI9+FkC4lJ8ajau65mu3lQDI=;
 b=j5WIKoRhbmM9pozdHyPKDI5QVFORl/e+xI0LD1IF6SbA6MK8E2cNnw6htU0uRzZiUC
 UTHbRDVv7bB0ZdVPqVSNh/c//QVsLTHLpvdJmIl2x8PYpMDkfWCoyxSO3hL4x/Y09n2c
 4ECI6dgbLF5y8fa/CTM7q4IXKQvzigpFuTtHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bstye3+6hcI4XrRtz56PI9+FkC4lJ8ajau65mu3lQDI=;
 b=RcqwrYQlms+6XOp0WdHHH+ADaPNKtJ+8teylLh6mCC1tYTVjhYnm4U1Mwr54tzrjQx
 2MJtpOPRoUU4iQdMg3NZpSfVT1oH/T3PgGQKppKWzJIZhUKAxd/aLAOMrBy7RISSVV/X
 urIdGv7rQHBUqDMg1S7uENGx6+ckYsivTTb/6hSozsjfcC3+iIXvyjwGmv8qDlqumCoe
 PMgo8Hrqj5HpAyLk/5KX+Mn+OATclJWMMZ5wjSz6C+5M1+9yrdP0AeHpqFgc4Y6zhHuv
 F+GrFEgUZsbV9CM3bY7JP12AR2bwBpUYQSS8UWeLbxNewOpVfl/L9OcUDojJskYO85qT
 WqdA==
X-Gm-Message-State: AOAM533eMC45eVYr6RCqFQpC5qgVBpFyU4ke7FHD6ShJTgR+7Q9DcJbY
 4D+7H5Nmi6Y6rxVck1FWoGc+aqUcbdZowijDMqN2WA==
X-Google-Smtp-Source: ABdhPJxGb1FfiYFh9/0KvGMfqbe3DU8GFNQcblsOOJIOOPQB2lvMONor4hntZRNHZGPd1SKwtbKauV5dfMHEElezkYY=
X-Received: by 2002:a05:6808:1641:: with SMTP id
 az1mr7688634oib.278.1643893053522; 
 Thu, 03 Feb 2022 04:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20210927192324.5428-1-Jerry.Zuo@amd.com>
 <87ee4krwl3.fsf@intel.com>
In-Reply-To: <87ee4krwl3.fsf@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 3 Feb 2022 13:57:22 +0100
Message-ID: <CAKMK7uHFnFB29o5-3GFo5=bne=u==iFyZ2WmSMUkyj4ujZx-XA@mail.gmail.com>
Subject: Re: binary constants (was: Re: [PATCH v3] drm/dp: Add Additional DP2
 Headers)
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 3, 2022 at 12:58 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 27 Sep 2021, Fangzhi Zuo <Jerry.Zuo@amd.com> wrote:
> > +/* DSC Extended Capability Branch Total DSC Resources */
> > +#define DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT         0x2260  /* 2.0 */
> > +# define DP_DSC_DECODER_COUNT_MASK                   (0b111 << 5)
> > +# define DP_DSC_DECODER_COUNT_SHIFT                  5
> > +#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0     0x2270  /* 2.0 */
> > +# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK   (1 << 0)
> > +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK   (0b111 << 1)
> > +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT  1
>
> The patch was merged a while back, but only now I noticed the use of
> binary constants, which in C is a GCC and Clang extension [1][2]. There
> are some instances in the kernel, but not a whole lot.
>
> Do we want to avoid or embrace them going forward? Or meh?

$ git grep '\<0b[01]*\>'

Gives me almost exclusive hits in
- .rst files
- .S assembler files
- comments and strings

So I think probably not? I mean there's also BIT() and BIT_MASK()
macros and stuff like that, and reading small masks is pretty simple.
-Daniel


>
>
> BR,
> Jani.
>
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Binary-constants.html
> [2] https://clang.llvm.org/docs/LanguageExtensions.html#c-14-binary-literals
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
