Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2475A782D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C74B10E661;
	Tue,  1 Apr 2025 19:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vLsaStUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5844610E661
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:36:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2B6CA40DA7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE4DC4CEE4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743536199;
 bh=1Ag/K+ihKoxs8bjuDYRY5IgvbQcvm0S5yIrK7TXzdIc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vLsaStUPawDJNlhDqINP8hye4UPPOeB5VO3bdW5Jq3gNPwj4xtBobgZRJNW0vKriX
 MyUztOdlqzf48MUlgfSpoYmdgZ7eVlykSYi7JzEcz+66HUvYmjbLmF8v1sDxnc5vWM
 8WgOb1ENXWOGtXCtjaVRvOFYqC9QdL+etJMHmzG6u3Yf93nkYK7V1JQHhBalQSHC3/
 jA8RKr3MQZrOab/eq5wxyXEHY/Yaak+BO6JZ/WbxgirFCpB0xLOX4UNkqv20T1Q+tr
 P7W1Re3otcGAhrrWBrPtpmq6/zwERWKMWdKQ/RF5A9/sI9adbaOf44U5rDacmAdkS1
 ui94nERhV2pTA==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30de488cf81so35160261fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 12:36:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMLJP0z5UYug6q2pmc2pb8wv8D4JtZlfuxNSIChm3SQW8PpoYnc1ybpPWdxjVhUj+USlRJoLMyicc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC0LOQ+Vr6jvMk8OwMUugwIg/6jDXhQxK2SwL3WdSZWxJpHsRU
 9f4BK+fmEC37oJlMcmXlb1YaxNKfBfB9QKohMGBxD2wTWpXtMX8MFk9wCR+g38IB2CksaFVzPhn
 L2yBzjmPAa+wea3XkZTekREuS7EE=
X-Google-Smtp-Source: AGHT+IG9N2qpVoZa8OMnE0f5h8/6idR6t14JZMPu8pqEMW7w9TW8a6wHpfCXDzKqlb1iYWL9NK7+M+4ifF6F6jRmz1s=
X-Received: by 2002:a05:651c:b14:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-30de0311bdfmr47367051fa.25.1743536198007; Tue, 01 Apr 2025
 12:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com>
In-Reply-To: <20250401191455.GC325917@nvidia.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Apr 2025 04:36:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4NhxH8Dcg3PK=9Y0rGCmdgDj4K1MdSDZMCDswYNQ57A@mail.gmail.com>
X-Gm-Features: AQ5f1JqFpbeU9DDjx1XgQ88rtWtAOiCciadyWtSXN7XHSzcbTMVmt66lRxaF5RI
Message-ID: <CAK7LNAT4NhxH8Dcg3PK=9Y0rGCmdgDj4K1MdSDZMCDswYNQ57A@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 2, 2025 at 4:15=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Wed, Apr 02, 2025 at 03:46:34AM +0900, Masahiro Yamada wrote:
> > However, it is annoying to make every header self-contained
> > "just because we are checking this".
>
> From my POV itis not "just because we are checking this", I have a
> very deliberate reason for wanting headers to be self contained:
>
> I want the clangd code indexer and editor integration to work fully.
>
> When clangd is asked by the editor for a report on a header file it
> cannot know the missing implicit includes and it's functionality is
> degraded. It reports fake compilation errors, can't do all the
> indexing functions, and is generally a bad experience. To be clear the
> header is parsed and loaded into the database when some C file
> included it, just the actual editing of the header doesn't work well.
>
> This is a very big day-to-day negative for working on the code. I'm
> frequently annoyed by headers that are pointlessly not self
> contained. I'd really welcome someone doing a cleanup here.
>
> I agree it should not be a hard rule. I was reading the thread you
> linked to and I'm thinking the approach is not optimal.
>
> The only header files that should be checked are ones that are
> actually used as part of the build with the current kconfig. Christoph
> is right that there are endless cases where headers should never be
> parsed outside of specific kconfig settings.
>
> So, I'd suggest a better way to run this is first build the kernel,
> then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> generate a list of headers that are actually part of the build, then
> only test those. That eliminates all the kconfig problems. Opt out any
> special headers that really have a good reason not to be stand alone.


Sounds much better.



--=20
Best Regards
Masahiro Yamada
