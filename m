Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0E48A1F4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 22:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC1710E2A2;
	Mon, 10 Jan 2022 21:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95C110E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 21:31:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c71so47523329edf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 13:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMStWYTxwVQaJhyJLae6t3+kMoMNGINbvb8xY3neOIA=;
 b=RJK9CS19sfnbMmdtWYqqmTO2hIF99alsdGsEpyVHVEUBRpibJULk/RKplq79VHg/q7
 6T/HpbgtqNtD5zfQJXao1BMv7sBp5Izw+BaNbRDW33RDryM8DXQYXXjsa9WGGO9vCSuZ
 IQXd0a940P9InsBz4RLmgppWGLz2MBym6mCL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMStWYTxwVQaJhyJLae6t3+kMoMNGINbvb8xY3neOIA=;
 b=bY5qakba2R8Q4Gd9ibBhzb5VVfzyBycOFjc/wXUafvzbE5JD29Eqw8NhQNSqvFVWIs
 q/IrElqkatfvs0bscLihtdDfbB69cVuQ7w6lb3QWTaVFMO3FbDMl2BiqU63DeuunRY/C
 FQaCcDx5lE1b2oqnVDTIr7/w9nyel2bB1fJNRHdxInckfd1oPxIeOFuzP18yyTCeMtT3
 ZWhYsaldJGWPLT2BgQfYiRKpEBhgzR2SVnsO36kMjtiwfjyMZvTtampidCtJ8Yd3aFWX
 4IV0M9T9PXtdz7EE1JCTfWYnmOhPG2pnILoC+riEOFlFoHZJHCBooSx0lkTbEislnN3S
 auHg==
X-Gm-Message-State: AOAM5324eDXiXwzFrBvyTxKEJZig1JyS+lSGsgoaQqROS6OZGZCsiMN2
 rcSYBfO92emHFIJ5nQBAObQVpw7cgAgZKmx5T2I=
X-Google-Smtp-Source: ABdhPJxraqhALBYD1c874jXtxoCaKUQlAdmpeqLns+cuiqrgf1Xp8jbvhC560J9KDvAFJNucM3j+0g==
X-Received: by 2002:a17:906:4e46:: with SMTP id
 g6mr1271552ejw.366.1641850258950; 
 Mon, 10 Jan 2022 13:30:58 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id i23sm4082469edt.93.2022.01.10.13.30.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 13:30:57 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so685528wmf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 13:30:57 -0800 (PST)
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr20561566wmz.155.1641850257383; 
 Mon, 10 Jan 2022 13:30:57 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
In-Reply-To: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 13:30:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
Message-ID: <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 6, 2022 at 10:12 PM Dave Airlie <airlied@gmail.com> wrote:
>
>   git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-01-07

Gaah. I merged things and it built cleanly, and I pushed it out.

But then I actually *booted* it, and that's not pretty.

It *works", but it's almost unusable because of random scanline
flickering.  I'm not sure how to explain it, but it's as if there
wasn't quite enough bandwidth on the scan-out, so you get these lines
of noise and/or shifted output. They are temporary - so the
framebuffer contents themselves is not damaged (although I don't know
how the compositor works - maybe the problem happens before scanout).

This is on the same Radeon device:

   49:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev e7)

with dual 4k monitors.

Any idea?

                  Linus
