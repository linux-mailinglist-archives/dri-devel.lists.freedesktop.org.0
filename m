Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A441B49C735
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961E10E7E4;
	Wed, 26 Jan 2022 10:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5232810E6DB;
 Wed, 26 Jan 2022 10:13:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w14so15276646edd.10;
 Wed, 26 Jan 2022 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7of4j6tXJsQTj96IqMsKqWsSKbGVqn3ZKiSJTHPl75E=;
 b=QHZGNvAuvGw7dVgE+zNRdndvuugGnChjIbsMvjjz/ITotAgWGyNwZuN48EXCo8az5D
 RWQMdAopz5nv/RRobC4VoRcuLtfo/RrKWSAUysAnG5W/5/9h/OvMXETCBuAkEbn4m9Vh
 ZRKNjulT52tFSx8jl00TJVZCKzHeKwvhagWm2XuDHHRI67mQUHyXyGjJwC3tgnpudBHK
 CUPg3gPeW91RE8SwaJcaX/cvKSHU6keIf7UPLJbzDiBXtJyAMK7gupAvOKDHHEKJh+F3
 9WpCas3I2OiV7CjbJWwV6SnsGTJS7yhn6+3ULU7z0WtzzLGHTl8R51wyt+Vu1KuStZpj
 M64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7of4j6tXJsQTj96IqMsKqWsSKbGVqn3ZKiSJTHPl75E=;
 b=R/wK78AETYs/snqBq93Ozbl3g6lT6n2WSpbcUv/glAD1tdq00tNe2nXPJJhoza2cYP
 2iPnKBr15q/KL6rUt1uvs75td07s/wYsG4Ybhck+RckrYz73z4O/uw3qYA8we1cQOgwV
 LWubROhJbbyKo7z0aad7psc7/OdlweCwZ5I0lH3lM9j02In/lcR7n4Uaxgk3n4YbOKpC
 mqtz2Dp4Jx/tc6PuWPpTAAeCINYm96h3c1AusQqlbX9s0xduG2wkjBZhJW3WrM7NUt8X
 seA4YL8/ZHa/SWa9ATLJxsUrkba0IY3O2lpoNb92M114eMEf+LNvEl7mv+sTT2xbu1lA
 xwWw==
X-Gm-Message-State: AOAM533rmhgQ3gIsSLHgjmrqxPwERHIhEe0gfCkhAZRogIvQM+fnpTG2
 /pMmkvhyzqnPgqfGpq9I9nH9CGgHxQH6uRaoQns=
X-Google-Smtp-Source: ABdhPJynLKvQGv/H0FG+uuXI+OlMGiphzh5iPLeSuydUEWE4P8tlRcmMs/osAZq4tj+XuWR5dY63TLHMcK+DIJhiiao=
X-Received: by 2002:a05:6402:35d5:: with SMTP id
 z21mr17032960edc.29.1643192006805; 
 Wed, 26 Jan 2022 02:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
 <20220126093951.1470898-10-lucas.demarchi@intel.com>
In-Reply-To: <20220126093951.1470898-10-lucas.demarchi@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Jan 2022 12:12:50 +0200
Message-ID: <CAHp75Vd+TmShx==d_JHZUu0Q-9X7CmZEOFdKnSrcRKs81Gxn3g@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] drm: Convert open-coded yes/no strings to yesno()
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Raju Rangoju <rajur@chelsio.com>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 11:39 AM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> linux/string_helpers.h provides a helper to return "yes"/"no" strings.
> Replace the open coded versions with str_yes_no(). The places were
> identified with the following semantic patch:
>
>         @@
>         expression b;
>         @@
>
>         - b ? "yes" : "no"
>         + str_yes_no(b)
>
> Then the includes were added, so we include-what-we-use, and parenthesis
> adjusted in drivers/gpu/drm/v3d/v3d_debugfs.c. After the conversion we
> still see the same binary sizes:
>
>    text    data     bss     dec     hex filename
>   51149    3295     212   54656    d580 virtio/virtio-gpu.ko.old
>   51149    3295     212   54656    d580 virtio/virtio-gpu.ko
> 1441491   60340     800 1502631  16eda7 radeon/radeon.ko.old
> 1441491   60340     800 1502631  16eda7 radeon/radeon.ko
> 6125369  328538   34000 6487907  62ff63 amd/amdgpu/amdgpu.ko.old
> 6125369  328538   34000 6487907  62ff63 amd/amdgpu/amdgpu.ko
>  411986   10490    6176  428652   68a6c drm.ko.old
>  411986   10490    6176  428652   68a6c drm.ko
>   98129    1636     264  100029   186bd dp/drm_dp_helper.ko.old
>   98129    1636     264  100029   186bd dp/drm_dp_helper.ko
> 1973432  109640    2352 2085424  1fd230 nouveau/nouveau.ko.old
> 1973432  109640    2352 2085424  1fd230 nouveau/nouveau.ko

This probably won't change for modules, but if you compile in the
linker may try to optimize it. Would be nice to see the old-new for
`make allyesconfig` or equivalent.

...

>         seq_printf(m, "\tDP branch device present: %s\n",
> -                  branch_device ? "yes" : "no");
> +                  str_yes_no(branch_device));

Can it be now on one line? Same Q for all similar cases in the entire series.

-- 
With Best Regards,
Andy Shevchenko
