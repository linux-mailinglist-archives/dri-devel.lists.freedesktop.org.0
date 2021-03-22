Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654A344A1B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F0A6E4F9;
	Mon, 22 Mar 2021 16:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DDB6E503
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:01:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a7so22151410ejs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4okk4MmpHakXvgepDctT+DEH5N6/lcep70YDmAG4FHo=;
 b=uPyGwICWeEa1F9KeyRcWTtNqFei9/HbJ4Bxnoodslrx30NcHBnarNMgN6ayCpsr4N0
 Vi8ujf2mSi+LZHcfb4AJkQ3Gwfqn/Hsc5sV5Th94b4uQSOP+iHf64N2gXnBMMMV/40B5
 +ez0yVNkWDtwKyloxsM/dX5qQdaklAQynuoo4okxHGqc3l8TMThcT9NFl7ZBnkZh9sbL
 oXVKm5CtyWo+nkEONLUOGbK/LWP2HafPnVsnYtmQUwcibRyRg1aTBg4s4/NpELDPtcdy
 lIyeD2JZJC2gvLHIHpFuj55FpGw0VcnxfzuhoGEf5PiQYIWcsQ48Lt6qEO1dBjTrdCrH
 RVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4okk4MmpHakXvgepDctT+DEH5N6/lcep70YDmAG4FHo=;
 b=pUGu17WLjq0PnjNaetSwloWhQWenpOwbiG1Yez+OlIdtowun9Z4AUTJBTtRpR/qiWX
 t5dBFFk+WX1w7m9m/jsaLd3sVadLukSIMK2StsWWJsdb+VrrhIMAVy+DRE+jIsa6kMb5
 o5ccyCYSIMUvYEkcXXXM2NFKVhjqJlSNvlRiYEFr9Tmq89Fy9WJMF3utfx8aHm4uuyMC
 l/Otjz5/Yb5zFe4yjAYUVeHnP15IrAk/ob3t+AdXC6GqW9DHg00wvuHYHns81vb7Yvuc
 ojfXJzIBjTSNGZm8aZ9wl69RjFHsZ50x9YJ20bwTBWUM9fh3Ffz4wqOKgvb8tTA21ccC
 dnEg==
X-Gm-Message-State: AOAM530re8ao9atM2EiadbB0X9VhFFaRsWYGlM5HSGrGhTPgVPv6cQtN
 HK852Xhom0FXD/CQY+HUEQWHFnfvQzK5V15HLc4I8XTi6ok=
X-Google-Smtp-Source: ABdhPJybFzFBbRqqqO3S3xhEFcGmzRx4itDgYMBFT3SIeLHFu5BiOySf5Q3lGa5WjysIwHrw6N0sCh3PQXuTpDGMGk4=
X-Received: by 2002:a17:906:b288:: with SMTP id
 q8mr505834ejz.210.1616428908297; 
 Mon, 22 Mar 2021 09:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-2-jason@jlekstrand.net>
 <CAOFGe94ggJUBH_+bbxAVLUge8NZQYHK55ZzjnQ2erXhh+r8c=A@mail.gmail.com>
 <87wntz5rdg.fsf@intel.com>
In-Reply-To: <87wntz5rdg.fsf@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 22 Mar 2021 11:01:37 -0500
Message-ID: <CAOFGe97UDA9n6LCGXEZi-2B6ZTNeOG+D7sEX1kwEF5L2kUsWcw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 7:01 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sat, 20 Mar 2021, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >     This reverts commit 88be76cdafc7e60e2e4ed883bfe7e8dd7f35fa3a.  This API
>
> Small nit, I think it would be useful to reference commits with the
> citation style:
>
> 88be76cdafc7 ("drm/i915: Allow userspace to specify ringsize on construction")

Done.

>
> I use this monster in my .gitconfig:
>
> [alias]
>         cite = "!f() { git log -1 '--pretty=format:%H (\"%s\")%n' $1 | sed -e 's/\\([0-f]\\{12\\}\\)[0-f]*/\\1/'; }; f"

Thanks for the tip!

> With that, 'git cite <committish>' will give you the nice reference with
> 12 chars of sha1 regardless of core.abbrev config.
>
>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
