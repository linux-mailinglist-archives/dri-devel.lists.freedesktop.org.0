Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70596523B99
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFF410E668;
	Wed, 11 May 2022 17:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CE010F111
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:33:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id j6so5435524ejc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
 b=KSDW7EaxEEAox9ArNl/cG0HEgm3SfZ3GtqPNzdmMU8fD7w0C0oDZs3MEyYZ6yoLdeu
 yShjYNBWL3FgGR6nQX6mpwU5Yirj2LjWdpRYv8a8UxBup5whzO4smQ6iqzPoBSfjp87S
 7RlaOLEm4NKQMZeXbACuJSvVt1Ssh4WSaqYVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RnK+iHlohBHk+K+PPu2H+s8rv61aQCy6hHkZXbGO1nI=;
 b=aAhUqkLzl491Ch5LQNX5lJDLFsWe/fci6gs/4/oT6PmXL+AGp8gXfewzpcH0U8M6dj
 xcwYjG51g2/9fgG5IhYecIu0URDMtjbCqVVh3bMGy5DkJ3RW4+A8VC1ropoG7GWIVl88
 H9Mewqr41pIW4Mq7RTLl21kWFI4rpHWjaWwO5OvGWqEnZt91i2/PMeQxAh2LwdUzrnus
 HsTK6Or3Bg7YEEqxjE+Do91Zx/hHI/1M6W9ZJ5dwYnB5eK3BLmx+pwpRCcp3jNuTC3yj
 pYnUeixX00VA7zK3PXnsnTDVhPv7UqU2uDDvfj/tWKa0LJt4Q0ss3uiZ3SLe6B3DGOyP
 7miQ==
X-Gm-Message-State: AOAM5329+IRQH7nUztEp09ViKzcQYp3Sdsj7fYD2ccaSkNLPt/ZWuTt+
 ftJPN46jU89+JuJlPJj2Vh91dX+XOIi1bjNdTlk=
X-Google-Smtp-Source: ABdhPJzAC6t+iouO9zazJdY/wIzeFJW4hBj7s5ESQFZOqxVMkvI+Er6on4wX72guyYuGvkuKxRucvw==
X-Received: by 2002:a17:906:dc93:b0:6f4:6a93:f227 with SMTP id
 cs19-20020a170906dc9300b006f46a93f227mr25812217ejc.661.1652290405468; 
 Wed, 11 May 2022 10:33:25 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05640204cf00b0042617ba63c4sm1425405edw.78.2022.05.11.10.33.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:33:24 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 r188-20020a1c44c5000000b003946c466c17so1036292wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 10:33:22 -0700 (PDT)
X-Received: by 2002:a1c:4c06:0:b0:394:65c4:bd03 with SMTP id
 z6-20020a1c4c06000000b0039465c4bd03mr6060279wmf.8.1652290402369; Wed, 11 May
 2022 10:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
In-Reply-To: <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 May 2022 10:33:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
Message-ID: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > And use it to store expectations about what the drm/msm driver is
> > supposed to pass in the IGT test suite.
>
> I wanted to loop in Linus/Greg to see if there are any issues raised
> by adding CI results file to the tree in their minds, or if any other
> subsystem has done this already, and it's all fine.
>
> I think this is a good thing after our Mesa experience, but Mesa has a
> lot tighter integration here, so I want to get some more opinions
> outside the group.

Honestly, my immediate reaction is that I think it might be ok, but

 (a) are these things going to absolutely balloon over time?

 (b) should these not be separated out?

Those two issues kind of interact.

If it's a small and targeted test-suite, by all means keep it in the
kernel, but why not make it part of "tools/testing/selftests"

But if people expect this to balloon and we end up having megabytes of
test output, then I really think it should be a separate git tree.

A diffstat like this:

>  7 files changed, 791 insertions(+)

is not a problem at all. But I get the feeling that this is just the
tip of the iceberg, and people will want to not just have the result
files, but start adding actual *input* files that may be largely
automated stuff and may be tens of megabytes in size.

Because the result files on their own aren't really self-contained,
and then people will want to keep them in sync with the test-files
themselves, and start adding those, and now it *really* is likely very
unwieldy.

Or if that doesn't happen, and the actual input test files stay in a
separate CI repo, and then you end up having random coherency issues
with that CI repo, and it all gets to be either horribly messy, or the
result files in the kernel end up really stale.

So honestly, I personally don't see a good end result here.  This
particular small patch? *This* one looks fine to me, except I really
think tools/testing/selftests/gpu would be a much more logical place
for it.

But I don't see a way forward that is sane.

Can somebody argue otherwise?

            Linus
