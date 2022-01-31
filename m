Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE44A41E1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 12:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5027310E1A4;
	Mon, 31 Jan 2022 11:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A6D10E1A4;
 Mon, 31 Jan 2022 11:07:12 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 13so11645267qkd.13;
 Mon, 31 Jan 2022 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dAoqoC5jLB02Mpd84E+KBi1N/SqcLY9xTKIeDSDuXv8=;
 b=GhXs2FmzRec6zbc39BLSGTg0wRuZDIn/DjwCMYb6vfpuMzpS7UP9MRjN5cdfSZuXE2
 c/hs4d2RgC4ftk4ZGxzDJV5T+EEWMgJz4JWjiSPxpieQBBJxAoZYxgdqxueLX5iF42lz
 HWXc17TGNWGY9HtLzhvErr/dcroXgOgeZ6tG5gUA79/kthH9PJdOLOnDouSgI9zzQPBb
 DpdK2ekXGnYXb3u1X5yPUXiH4i070q/QMvrizIRnTOmoX6Ae8+anOeSHeSZGQ4BDupD6
 GiANa7DnGgPEnECWWza75aBKz2WziubxQNEOGa72rhYjDKMpIf5CMUeZYizPEDEYZpwE
 k21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dAoqoC5jLB02Mpd84E+KBi1N/SqcLY9xTKIeDSDuXv8=;
 b=HWoC2wEc6X0kwEz0RHATPCCwGR/s2BhBwWZtFWMxOwk3Gkj0vFul18yuysQn+dXU+y
 GOY3BIu5Eg4R2xnP2oxCM4WP2UvupBbb/paKHZb/O2nPRshTI0Uu7xklWGw8wqafhW1y
 yqCOqNb3NI9NvZpcQNMePFM05fgOpXD397SbNcarzz9c7kcGgAaNPwfSJ1/xJ60fHPAp
 M5b+q4SNiPWpiNTeu8seMDWG1JI03Ah3Q1zLt3Jx8LuUGgEy5K1nFzvdSsqf+ORFqzU1
 Y/M+s7oljswcoP0aGstRgEoztrl383R04sCBOOqkyPhrpAnHWejC2XFsUYYzo00mBfzK
 F4mg==
X-Gm-Message-State: AOAM531cpdOCLDwrLv82lQDWWKzTM+qGMkQdu2LLSyVrz3GlYWrA3/NJ
 YsfSijXcYbhPeFfCL01uZ10oA3NCqttZvE8QWk8=
X-Google-Smtp-Source: ABdhPJxJNfKjOKZLeCFlH1HaZEPHz6emTUD1lLvbqq9a8SGAXA/FGkCBrqoSSyhV9ZJs0ODVFSQVlOiJkBSZpk18oLA=
X-Received: by 2002:a05:620a:1a8d:: with SMTP id
 bl13mr12699766qkb.569.1643627231457; 
 Mon, 31 Jan 2022 03:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-5-ramalingam.c@intel.com>
In-Reply-To: <20220128185209.18077-5-ramalingam.c@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 31 Jan 2022 11:06:45 +0000
Message-ID: <CAM0jSHPiy8-jLoRfV6UfxcZnbZh+UPA0NrwncJqAthbS6-VsFg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915/dg2: Add Wa_22011100796
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jan 2022 at 18:52, Ramalingam C <ramalingam.c@intel.com> wrote:
>
> From: Bruce Chang <yu.bruce.chang@intel.com>
>
> Whenever Full soft reset is required, reset all individual engines
> first, and then do a full soft reset.
>
> Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
