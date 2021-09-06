Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0823401F83
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 20:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8D789BF1;
	Mon,  6 Sep 2021 18:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2758996F;
 Mon,  6 Sep 2021 18:25:13 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id f6so6261548vsr.3;
 Mon, 06 Sep 2021 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i6BKrN7X5suyNsmFH5r3sUKXBVHf29sG6WVeH2BVyjM=;
 b=clAkQy9mohMLPnVHW5cIgwm5UEQQ5nDlPiwgp0cwJEYS0ycJTwv/DWUsRr0B8bbniX
 5/nkndYJJQt+jFffYyrtHZE10RuffIy6IiG+DYcDqlWqy8v1aJQBv/22QpJfJH5sAPEp
 lFzSMj0ku9aH22fxeXosDlemQyfBnrg21y/mGp51LbpdTK2SbNrLJNY55iFB8CjdVghV
 cCQba6HKcoqGwISK6MvywQ7Ew8wNqzUPIVUUw2uSew4EA9ZcK7Tn69EDc0rfdmfmLWbZ
 QQBHqFLn51nzUM6pTyUzm7OOUvLdQYde41jakHoVKOSwyJNU9iVB7OSZZDf1tmA+23aw
 oPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i6BKrN7X5suyNsmFH5r3sUKXBVHf29sG6WVeH2BVyjM=;
 b=lfRY+X+5SJm+hwkjvTX0zzChbvnLp2sa1/bPxKSaXSwwSeQh84Q8mbngp8WUvYRYQ8
 esVJN3YgOEi7FG9EIvivh444EAaWlTOXHQ/nwHVcmeBHGbt9PW6NhHESOrU1lyZf95Fo
 GVnqUvEetVdxfvJgRJXSqdyAoFMNBRECN2atA4oob904FwmgSmdntem+85FeoqB6dxJI
 lZIz07BSFbv6Nf/o4NUNNK+dPFpiu5feEE03LoqH4ZXPYxLOn8rA+NzgkcLMYNo7IQfm
 qUfLMYLL/4Cwq2ZRqbPP+9zt2pHHMyC5QOMpoc49dsE6K0pgH4ppgZvVPT2thE+rwg/t
 YFBw==
X-Gm-Message-State: AOAM530DwrL5jDugw80BlzVzxsNXh9SJrKMTq/RxXQxy4aea68BE3GMs
 8S5V/kzJNx1aDiUstqv15Kl/8J8NsMoc8v1yuRw=
X-Google-Smtp-Source: ABdhPJyg4VWsnkepgpvWdmz4JefgU8pNg5h7OlRD3wfkop9WYoZH2bRCi5vo8Qu00MZRxt35BDmA2bUFrpbKx4ektFA=
X-Received: by 2002:a05:6102:188:: with SMTP id
 r8mr6850374vsq.11.1630952712249; 
 Mon, 06 Sep 2021 11:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-6-jim.cromie@gmail.com>
 <b3c4b3aa-b873-a2aa-c1ad-5fed80038c6e@linux.intel.com>
 <CAJfuBxw-i-7YUenvBGHA0unBQ8BqmOGRF3nRYNwNPLVaxWpSvQ@mail.gmail.com>
 <1aabb5c0-eef9-a483-2631-25726c9dc268@linux.intel.com>
In-Reply-To: <1aabb5c0-eef9-a483-2631-25726c9dc268@linux.intel.com>
From: jim.cromie@gmail.com
Date: Mon, 6 Sep 2021 12:24:46 -0600
Message-ID: <CAJfuBxxQ-dNWHv1VGu7Hh705wZbxmsStDa_-cc=63fDtNZiyjg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 5/8] drm_print: add choice to use dynamic
 debug in drm-debug
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jason Baron <jbaron@akamai.com>, Greg KH <gregkh@linuxfoundation.org>, 
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I'll try to extract the "executive summary" from this, you tell me if I
> got it right.
>
> So using or not using dynamic debug for DRM debug ends up being about
> shifting the cost between kernel binary size (data section grows by each
> pr_debug call site) and runtime conditionals?

Yes.

> Since the table sizes you mention seem significant enough, I think that
> justifies existence of DRM_USE_DYNAMIC_DEBUG. It would probably be a
> good idea to put some commentary on that there. Ideally including some
> rough estimates both including space cost per call site and space cost
> for a typical distro kernel build?

yeah, agreed.  I presume you mean in Kconfig entry,
since commits have some size info now - I have i915, amdgpu, nouveau;
I can see some prose improvements for 5/8




> Regards,
>
> Tvrtko

thanks
Jim
