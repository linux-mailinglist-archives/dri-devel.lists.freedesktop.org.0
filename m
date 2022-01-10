Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09084489DCE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 17:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E8B10F2F3;
	Mon, 10 Jan 2022 16:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F7F10F7A6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 16:48:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b13so2665342edn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1as2ORVFGAUPz82GACIBpegMjn+JCuCyTRlbW8CfXN8=;
 b=QFtyR/r9smMnqiKzjW9tRSQpEdzB65FWrdr0jE+xD+pxb0PYYJhdBEot8djPPLnEtn
 Axgwkc+vukNyahS9U3cmNi8OJhE+ZSddUqFMIpBIFpPv5v0ZhZhI+skhCfH5Mqsf0bLN
 WxiqSn1daWffv/HhOKs+KLh8svAYUWUBYXP6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1as2ORVFGAUPz82GACIBpegMjn+JCuCyTRlbW8CfXN8=;
 b=j2BExX8u3lXRx7WTmoOtM9wLcEaKhIbHARuw738v+VsoSjGSM6et+pZ30AyaSMyxb/
 vWOUKQIidyIzlmj40C9PKa4UKA+KMDHauXnj+fqCycPGrR6STbw7Vz+Ta2qyGNjc0i4x
 MxggeMd5cjNcx3LV8GhlHgW/UeEQ/VYP0nimZJ6KAccbx0BQCnVm3pcUoqX6wmBDgXxR
 Cu/we6uDvk+R1eAtmGDyNcSjk2FvjbeLwYc1iq/0dqv9ykSs7PUddmHCXgFMjyxp7p7J
 i939fc21fkxnxuXrhuV4wgwMfOnWtwYV7O179BPBH7oIDoWfLPbxglzejTpgWBazCkzl
 Ojhg==
X-Gm-Message-State: AOAM533U0UP6fjCHB/r5wc0yBxegYue1WdNfJ1q8JffQeG8PPMfquyFc
 kavVFjjQB/FUu4Epl6lqnl8WFVZClSN0UG4gwKY=
X-Google-Smtp-Source: ABdhPJwPY1U+VdUpwFOwbMeahrqoaDp6ROWz+H8Dbo4j8iZI1dxz3fu12FcFVaezU867R4iS8nyv0A==
X-Received: by 2002:a17:907:94c7:: with SMTP id
 dn7mr464552ejc.470.1641833284606; 
 Mon, 10 Jan 2022 08:48:04 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id a3sm1789745edv.91.2022.01.10.08.48.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 08:48:04 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so1217331wmo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:48:04 -0800 (PST)
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr19704237wmz.155.1641833283772; 
 Mon, 10 Jan 2022 08:48:03 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twJOj8+cfEPArF7N_TZpVM8vN+S4s2mMM7phsS-ZOgmJA@mail.gmail.com>
 <163789349650.12632.8523698126811716771.pr-tracker-bot@kernel.org>
 <CAMuHMdXEKbc9ovGPqtO8v-xRCoSKF=KZ-53g+7vRKnDZMCmeGA@mail.gmail.com>
In-Reply-To: <CAMuHMdXEKbc9ovGPqtO8v-xRCoSKF=KZ-53g+7vRKnDZMCmeGA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 08:47:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgWQ0mYz_yt9cn3KDr+6eQ5F3wvJ_cGp-E3A5PW+aeuuw@mail.gmail.com>
Message-ID: <CAHk-=wgWQ0mYz_yt9cn3KDr+6eQ5F3wvJ_cGp-E3A5PW+aeuuw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.16-rc3
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Sun, Jan 9, 2022 at 11:38 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The commit that merged this branch made a seemingly innocent change to
> the top Makefile:

"Seemingly" innocent?

Or something darker and more sinister, related to the unrelenting
slaughter of flightless fowl?

You be the judge.

             Linus
