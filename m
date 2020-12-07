Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BC2D2637
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7779E6E9D6;
	Tue,  8 Dec 2020 08:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB7F6E8F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 22:28:54 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n7so10283817pgg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 14:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWXoV2CMUKwuuJ9IGyn1rKyPqeDvcvXFpNW+D3PeZwc=;
 b=kdu710mWZmTmZmTippRswW3tNYS61Hyt5bfuXqwbc5QE25E3c+yvVvbeGQ6TqFEqgv
 3C+T9eGEchPhr7810GzQMYpyW0pfwBZiSQ1noHFBdceEU+6Y5WoVfe229HyXKeEpf2Gv
 4D8IlCK2FTh0VfqN4CJAE6yOZovksKJnnH3Z27ZSTvJeRD5DTnxCFy6Uf52DpFawOfyN
 EdZLPi4zpALMCG5G5DL+0sZ3aoNXyAzskwh4ceJQGcItrZuoFIRSZUbYZSnav4dNeSRi
 /dlborW2be3RN5R3tJsHMpb+Y1Al9qqt+Y2K0ekSmFV1spS6crIvHyLQZ700qoIu37NX
 nqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWXoV2CMUKwuuJ9IGyn1rKyPqeDvcvXFpNW+D3PeZwc=;
 b=jp9CcdX13+ubYviKxBxM5znm9D605nMFmK22n1MvvatAQxFwVVDXEdunnbMq0PtHPj
 8jLaFJ1Q3vD9I2nsE/e1KFpxwI8UOemDiDu2b72d5o1NSCGgMQzvyJPZmVqCBqA7ULvG
 VlcEMHwU/xZZaqnGsxo4AJ62DNDHzlh/VejZ8mtxt3tuyKIAP9Mwz7ReXqYul1Z0dOzi
 OV3i++n1OBw9xEI7Sq9YQpq08PYrLt7hfryRswL4IOT0uqJaaIeG/Lriz28X1buRFB6g
 Qf+1CvQzOVT949sLmZQbQSgkAKiQFOyfLLp+MKxJv2nU1/ytAsJFEVaZ6xF+aUTbMjo/
 cIXQ==
X-Gm-Message-State: AOAM530AdVOsynrgzNPye9+LRYzcg9VixeqUQyOArtuJbl5xVtBb4MA8
 7T9LFjcLBM1wR8deFWmgGdRaa2NCL6peFVKgfflhIg==
X-Google-Smtp-Source: ABdhPJzH235ZBy2+HtgSTmZfucYCnB2ALLUQMf094BhLSCBeBGevRQx+U8bJiscjIYvbi5B1I9kNRlXmGrr1BhXaY5I=
X-Received: by 2002:a17:90b:1b05:: with SMTP id
 nu5mr898064pjb.101.1607380133527; 
 Mon, 07 Dec 2020 14:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20201204081349.1182302-1-arnd@kernel.org>
 <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
 <b9d7e33c-4dcd-0075-d0ca-d22b2488c354@amd.com>
 <CAK8P3a09KQS7S5-vJU7ECJh0HXUhwZW9zOOp4c32mtvM5XcU1g@mail.gmail.com>
 <CAKwvOd=-2zoc06EY4R9ZJ0M874bQv3NuT8a0q9=RoYeMMtnXVQ@mail.gmail.com>
 <CAK8P3a0gjPWiRX0yg=i6Qxgyo02AtQVVsw+=w-OvF956Tn=jDw@mail.gmail.com>
In-Reply-To: <CAK8P3a0gjPWiRX0yg=i6Qxgyo02AtQVVsw+=w-OvF956Tn=jDw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Dec 2020 14:28:42 -0800
Message-ID: <CAKwvOd=+w6vJvvq9Pwnv1EHHzwCx=o_=PbSozXpqryN6P1yxVQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: Arnd Bergmann <arnd@kernel.org>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Roman Li <Roman.Li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 7, 2020 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Dec 7, 2020 at 11:08 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Mon, Dec 7, 2020 at 1:57 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > >
> > > Right, looking at my latest randconfig logs, I see the same problem on x86
> > > builds with clang as well, though I'm not entirely sure which other
> > > configuration
> > > options are needed to trigger it.
> > >
> > > So my patch can be disregarded, but I agree this needs a better fix,
> > > either in clang or in the dcn driver.
> >
> > If you could give https://github.com/ClangBuiltLinux/frame-larger-than
> > a spin again, I would appreciate any feedback.
>
> I've already tried it, but the tool doesn't seem to like me, I never
> get the information out of it that I want. This time it failed because
> it could not parse the .o file correctly.

Can you send me a config to reproduce the .o file?
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
