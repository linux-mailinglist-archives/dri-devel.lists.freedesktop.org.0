Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831D64C95A3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 21:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2A810E145;
	Tue,  1 Mar 2022 20:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2316710E145
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 20:15:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o6so23398504ljp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 12:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eHzcr1YBGh9o3F4BfOGRvjDUMT5g6q2aQ+3yXHWlOo=;
 b=IZ7/AMI7eJ+ZC/a6fwyXrw1yeswUH52MRpfmJL+44Eql30HG9WzC+yjvRBlCihk6qS
 EvBYRMpstobbwMQtFKPVT7whOd7g6EVNZ9/wh7HN9tT37SQk/kV5yveCnI1WKJxZgJfl
 u5hnXn2wSwbpo9fmHyh7tnjuQRET8kflkToPHzIjsE09X8R0kVDj2vdGuFiwf8ERMe6P
 ZUYFx2H+eXSISc3wqYR+rj1jGJiYrqhXhAk2plKyJAwvUaqs44FoSzMAFM70O9Zf7sm+
 roIZG0kJTwRPMpvGKMjoahCaVCHPIeV7xANIw5S+Q6dN5bwJxAjfKupRq3TdUUvC7rAX
 ewCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eHzcr1YBGh9o3F4BfOGRvjDUMT5g6q2aQ+3yXHWlOo=;
 b=4egk3xvhOnMx2p3Mwt1wswOg/3SJHyg8F+Gwd0ifYQQh8Qp7t0O9VMrQAovcWFgZhh
 88+X0sc9PrFJ+40ZrDpWgfwqjyBB+pcmukSQyQIOMvGArnYJuEmjvUcGADAjKXSz5/cF
 3Lqs0tItgEZVmxJLj/XufrQKWXgmtNNn35luarWgPMxE0/6aKxUY1AyEYyFtS1jyy274
 VQVZN2/UJcXaOIbnQIzH33EL0g1MqY/AFvtv9ObtWWnD9GA1UVQtSoKUcv688ddXnUzU
 OnvbWcp16Ao1aAP/hZJ3l6h07/vs7EXWdA8ZmJEINMb+NpDc3qee6Z76sW2+WwhG27B7
 pcNA==
X-Gm-Message-State: AOAM5324i8tyDgWMsxFs084LQyq5Myd9iimhvuGhjK1I+5tjNokhUEdN
 8INuNJDrkF7rh64FOEsPlJpPptYP8UhekTMpmFIXfg==
X-Google-Smtp-Source: ABdhPJzNPHP87nTATQhKnvYuvIArBZyNmAuESqaseKTw/6hflPbUYbtD2HuT0mMBWgoGoh8R52W1FO0GY7/eOoWfE0w=
X-Received: by 2002:a2e:3004:0:b0:223:c126:5d1a with SMTP id
 w4-20020a2e3004000000b00223c1265d1amr18945849ljw.408.1646165703196; Tue, 01
 Mar 2022 12:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com>
 <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
 <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
 <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com>
 <CAOWid-cXYze56YmUACWP4emNeGHXMFf4q5aZfFGUwVXWNFAvSg@mail.gmail.com>
In-Reply-To: <CAOWid-cXYze56YmUACWP4emNeGHXMFf4q5aZfFGUwVXWNFAvSg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 12:14:51 -0800
Message-ID: <CAKwvOdn52Kn1dnmp9cCwJtv5kPwZfHgApzhzajsdkjOwF8XqVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Kenny Ho <y2kenny@gmail.com>
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
Cc: "Joshi, Mukul" <mukul.joshi@amd.com>, llvm@lists.linux.dev,
 Dennis Li <Dennis.Li@amd.com>, Dave Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, Tao Zhou <tao.zhou1@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Chai,
 Thomas" <YiPeng.Chai@amd.com>, John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 11:12 AM Kenny Ho <y2kenny@gmail.com> wrote:
>
> On Thu, Feb 17, 2022 at 2:06 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Feb 17, 2022 at 2:04 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > >
> > > Alex,
> > > Has AMD been able to set up clang builds, yet?
> >
> > No.  I think some individual teams do, but it's never been integrated
> > into our larger CI systems as of yet as far as I know.
>
> I have just added clang build to our CI last night so hopefully we
> should be catching these now.

Wonderful! ++beers_owed;
-- 
Thanks,
~Nick Desaulniers
