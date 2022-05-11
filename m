Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE553523D19
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 21:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178AF112B4E;
	Wed, 11 May 2022 19:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829F110FAEB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 19:08:24 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id m20so5892575ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
 b=dBuK2lymrrDPdlannsOQHXnUcfuHTrBkOPfEbu7qkW0E5kYO5Z+bFsewwOP9kO18lS
 Ebs/5hwuDtsE7odsW2FMFSxqELyAfsWmglvZotYHMj+VC+iTD8HgUjirJo2F71hfTMdW
 r33xYQIIdwMLG8WV5P6snakQvBwy2w3VlziQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
 b=68QD2efs+LpyEMPLlRkt68nSMzxHrMjY1Ratv4+qu5if35adDupCZzxTX8lX4faCdu
 JCDhIwNh/GVkDC2gJFOKeZyg/neViyNGFfjmU8/cp3GG0fD+X6lVdrT+RUGdEuTSPm2h
 IUX4Hf4SDAhkNDnIca5Huc/BjHyL/TVibo+V9Skwu1I1odef3NaPdWA0EaB9Li5t/uHz
 HyZhhVfthuTT054e1Pz5i0sctAgsbI22m/SaosbzmxOOQYotKiSKkweEm+SiJClwLYnK
 qk76kIYyhQyAEGyRMuBdd637rGJYqnpkpUQnjB5XHzIqV3Rgpy8fUZx5/Aura1PcamI1
 Z5Nw==
X-Gm-Message-State: AOAM531/nsmeUMUQLy6WZ+jzZWto2xazz3W7P6PAv0y4/doxUBjozEiG
 yw5vInW9OtykrJPiSFavFEwZIErl8AORukVDBAE=
X-Google-Smtp-Source: ABdhPJw6CjGHwzxqWtX1Sma7RbnQsvk4nWQL9rzFauSPuoDQmr1LFCEl/Md9D0YAu5/5EtA+BBzAkw==
X-Received: by 2002:a17:906:a091:b0:6f4:f5cd:27b0 with SMTP id
 q17-20020a170906a09100b006f4f5cd27b0mr25870890ejy.531.1652296102654; 
 Wed, 11 May 2022 12:08:22 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 oz35-20020a1709077da300b006f3ef214e1csm1308785ejc.130.2022.05.11.12.08.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 12:08:20 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso3819729wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:08:19 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr6316930wmq.145.1652296099201; Wed, 11
 May 2022 12:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
In-Reply-To: <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 May 2022 12:08:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To: Rob Clark <robdclark@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 11:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> It is missing in this revision of the RFC, but the intention is to
> have the gitlab-ci.yml point to a specific commit SHA in the
> gfx-ci/drm-ci[1] tree, to solve the problem of keeping the results in
> sync with the expectations.  Ie. a kernel commit would control moving
> to a new version of i-g-t (and eventually deqp and/or piglit), and at
> the same time make any necessary updates in the expectations files.

Wouldn't it then be better to just have the expectation files in the
ci tree too?

The kernel tree might have just the expected *failures* listed, if
there are any. Presumably the ci tree has to have the expected results
anyway, so what's the advantage of listing non-failures?

                  Linus
