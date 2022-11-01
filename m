Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA06153D1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 22:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7996810E41C;
	Tue,  1 Nov 2022 21:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A479810E023;
 Tue,  1 Nov 2022 21:14:03 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id q71so14503908pgq.8;
 Tue, 01 Nov 2022 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6indUiCprMB0zjMLWvS6nYLrTKO3j8yjpLRzZacHoFM=;
 b=RvakqeHbzhIjgHA0SHrXXMScjhxIrsj98u/WPUsnoZgBbiMepcA6jWfxYuNLJ7YZKl
 7hQeN3cKsZHdgVa+by5PM9qwRAXlERGLBHtTYOATeumHcVBVJh12ijdH6hESg72b+wzw
 r27PIVAfsU6wsVC8jduamUDUDRQGWhqhfjL5fViN9pYW8AANiVCifGt4VRus4t71d8K3
 bh7W73of1dfjJMq65cWyAGs/0pzBnk7/j5SrDExP3MtP88tq0+DVqzpssHJq3RUnbrxN
 ZOeHFX75u3sTcdI+a70BLWQq/HCHg3+AiUVcjCfn2nTWdfUYiuiN2UIjcWOAoiGnLtrt
 Ah6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6indUiCprMB0zjMLWvS6nYLrTKO3j8yjpLRzZacHoFM=;
 b=mefUC7t3XfDPs0bD3ad7VbnY7r7GseEo/As1e4RkFJoiU9G3H7pBNiv/dwdDuBumpQ
 hY9zXb/rZFgEdDnViUz2Qn/DLyQerMwvo1RusEYFp05vBX/fOLdBMyZAR4KR/BwKOGcw
 c4Zge5eq5faKWx6Epc8Q8ksMjUYFC375Wo0UOfih2k2FUEwAeI3yPv7971a1OXFWfC5w
 nsKJa89R0Wr4a0hWYIW9KKtLAXRFNjdU5pp3h6wHCU3/owvhtWJAHZB+12xoro86dz9N
 Lgf3a7TJAFZvJBt3KAkxvpJLFEXmwUDYzT47+WvW24z1nhbsYVYaCIFYm0cXpChUlMzi
 b8OA==
X-Gm-Message-State: ACrzQf1ZLjrbPOLcTzacZF7Jd7vUtXttrWhAryb53ezdhoyeqJVFxBG3
 gvhDlOO1cjcJTBXUXHDpfMhOJukpumrrSg==
X-Google-Smtp-Source: AMsMyM52pQddQpmtGf7qmD+beu+QOQ/6824R/3H3162dp/zW7VTCB30F2Ej07jtHrVsyBI0az0Lq5A==
X-Received: by 2002:a05:6a00:234d:b0:561:ec04:e77e with SMTP id
 j13-20020a056a00234d00b00561ec04e77emr22151908pfj.14.1667337242960; 
 Tue, 01 Nov 2022 14:14:02 -0700 (PDT)
Received: from mail.google.com ([103.229.249.253])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a170903009400b0018685aaf41dsm6804056pld.18.2022.11.01.14.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 14:14:02 -0700 (PDT)
Date: Wed, 2 Nov 2022 10:13:54 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
Message-ID: <Y2GMEjB4NQ3RYk2C@mail.google.com>
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
 <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 10:42:14AM -0400, Alex Deucher wrote:
> On Fri, Oct 28, 2022 at 11:32 PM Paulo Miguel Almeida
> <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> >
> > One-element arrays are deprecated, and we are replacing them with
> > flexible array members instead. So, replace one-element array with
> > flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> > refactor the rest of the code accordingly.
> >
> > It's worth mentioning that doing a build before/after this patch results
> > in no binary output differences.
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3 [1].
> 
> This seems like a worthy goal, and I'm not opposed to the patch per
> se, but it seems a bit at odds with what this header represents.
> atombios.h represents the memory layout of the data stored in the ROM
> on the GPU.  This changes the memory layout of that ROM.  We can work
> around that in the driver code, but if someone were to take this
> header to try and write some standalone tool or use it for something
> else in the kernel, it would not reflect reality.
> 
> Alex
> 
Hi Alex, thanks for taking the time to review this patch.

I see where you are coming from and why you may be apprehensive with the
approach. From my humble point of view, I think that the artificial line
that separates "what we can change at will" and "what we should be extra
careful not to break/confuse others" is whether the header file is part 
of the UAPI. Given that atombios.h isn't publicly accessible, I tend to
gravitate towards the first one.

> > +  /* empty fake edid record must be 3 bytes long */
> +    sizeof(ATOM_FAKE_EDID_PATCH_RECORD) + 1;

I am assuming that this is the part of the patch that makes you feel
concerned about how devs will get it (should they copy this header),
is that right? 

If so, would a comment on the ATOM_FAKE_EDID_PATCH_RECORD struct
specifying the size of the struct when empty do the trick? 

- Paulo A.

