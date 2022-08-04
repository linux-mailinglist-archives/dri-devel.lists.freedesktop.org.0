Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F316A589725
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 06:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197B52BE13;
	Thu,  4 Aug 2022 04:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB78410FA43
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 04:46:54 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z22so23850849edd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 21:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=mlcDetprCkAQhT6bsYk6vsCpr9ieC7YbTXG3pKPT178=;
 b=NATqAhWVYYxpEe5PSX9aiNEYl+Z4tAuqTnY5zZIVSEVZGGwRLsr9CUj7FknwBfLaWc
 hqeY9YV2yHq4tbscB29uwNsOxM7jPKEbpOi5Ih9Qe2ss/Wmn9oW4JLHsNqQGpC3KjTIn
 SLYlwHxk2zPRltowSR+VdW3KZFmIbK1B+137E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mlcDetprCkAQhT6bsYk6vsCpr9ieC7YbTXG3pKPT178=;
 b=OB8FUMhE4QvS/8oDIXH4YkEGhfFvxJ2LgcaW+8mCAIujmAObf1bw5f7N2qnDW7CWjj
 Y+sFbBinex+uo0SpabYNW9gJ5Avvv38+rmlAT5UQepcYW94XMAzgWDkI1+5I2pdotQ4r
 h8RIESBA1OKJbLYbbf1Qdl5v3GmHg3vT7o6Jva6me6BU4OcCymGaZ2IFru5SAc5luSmD
 fbRTiXhuPgUyccWvF1rnjhsWRFFDEHtNh/gBWrYjyKfBwtkhcBu/nf4Gto5zDjrnstyF
 zllkq6HqKanq2wjcNgghJLnsC0MCnqbs72EddhwHCxlyqPwgA2W8949MDxHSNI5DcBpe
 GIUg==
X-Gm-Message-State: ACgBeo1S3FBGQ/LsWz1DC74Yd05Vlj1ATYuiXknQFm191WcBqIDV4LBI
 FrLwyBifq+g6NpmhkCtsX4MEOx+ze9a4Gsrw
X-Google-Smtp-Source: AA6agR7CYM7McWVP+NP4B2SwCh3u6H2zgjIJZ+Y7zQNSnDZE6lwsVioO3DEME1MF8Z4uxqosXE1Srg==
X-Received: by 2002:a05:6402:50d0:b0:43d:a8aa:2373 with SMTP id
 h16-20020a05640250d000b0043da8aa2373mr119199edb.219.1659588412936; 
 Wed, 03 Aug 2022 21:46:52 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 au7-20020a170907092700b0072f1e7b06d9sm135282ejc.59.2022.08.03.21.46.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:46:52 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id z16so23777075wrh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 21:46:51 -0700 (PDT)
X-Received: by 2002:a5d:56cf:0:b0:21e:ce64:afe7 with SMTP id
 m15-20020a5d56cf000000b0021ece64afe7mr61283wrw.281.1659588411328; Wed, 03 Aug
 2022 21:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
 <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
 <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
 <CAPM=9txkjJg5uArn1ann7Hf+JFCukQFGwqv+YHAx97Cdxezs_Q@mail.gmail.com>
 <CAHk-=whWcektQzPJgSPa2DC3wMPxgLh8fJVQWeo8i99XMXPjfg@mail.gmail.com>
 <CAPM=9twUvRoVcWHhBH7yuDDVj8K8aM0APQ8Yx3cx19keLJP8Gg@mail.gmail.com>
 <CAHk-=wjbfAuN1eV+F0wWFsWEaMmJsT2p3DXnUvxo7bQ-xJwKCQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjbfAuN1eV+F0wWFsWEaMmJsT2p3DXnUvxo7bQ-xJwKCQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Aug 2022 21:46:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wih3NEubvTye4URZOmLYu6G+ZT9cngepo0z++ogCWUymQ@mail.gmail.com>
Message-ID: <CAHk-=wih3NEubvTye4URZOmLYu6G+ZT9cngepo0z++ogCWUymQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Dave Airlie <airlied@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 3, 2022 at 9:27 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll do a few more. It's close enough already that it should be just
> four more reboots to pinpoint exactly which commit breaks.

commit 5d945cbcd4b16a29d6470a80dfb19738f9a4319f is the first bad commit.

I think it's supposed to make no semantic changes, but it clearly does.

What a pain to figure out what's wrong in there, and I assume it
doesn't revert cleanly either.

Bringing in the guilty parties. See

  https://lore.kernel.org/all/CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com/

for the beginning of this thread.

            Linus
