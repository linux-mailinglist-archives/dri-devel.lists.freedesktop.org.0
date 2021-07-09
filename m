Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BE3C2AC0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 23:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005FB6EA90;
	Fri,  9 Jul 2021 21:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B556EA90
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 21:16:31 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id z9so10139743ljm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FFJn93KXlbUO1eC2UPdfdsHwOfyOvGiL00QyxwOUiUI=;
 b=biK9KW1Cem9wEcxu6XQ+7cKDNwZkZL4LAy9aNFLRa7F0wS4kO9BNpPZ7D2fvXVi5ne
 Ja0VYcEhg0ugIcH7I/6jgiTuaj83cUIemzGa7QkeIhCH5Fs2auxNCSMemycxIiDblMDt
 4SL+u5Lpnr4/4RjsZo0fB0/ebpI6lZZXjO1pL66YizZtZYCOp49X3jOC1c6uCm2a3Ujr
 4WuJ1Yyp5q+lxDm19CXqRpYkTN4O4mYrnG78q+WI4j4YvByFRYeOmP37xyMkNzWy2c6G
 pJrhkCkLMF3kJc64OPHCjFw4ppLftdW3VV2Z8UezZT4IwyBxCvWXBeaDHdCqU5+uYIDM
 VSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FFJn93KXlbUO1eC2UPdfdsHwOfyOvGiL00QyxwOUiUI=;
 b=lKMLd6Udu7HLl3PDv2cc2tUBG7426MnMr1gB4cynCZdBPBMQ/EtLYqlkMGwvMZF9Dv
 BHZbRBa9ugHW2n64IyGAKq0rR3pMlTjG6ga01JzO0x69xmO1MKfu7tb6uAUdL2P+NXYt
 XwkV6g6C3XVVhm1pWcoGOiJO7a/YCT+9PlzJNxBXmguOzFH0DGmWdTO9uSbA427um8cJ
 EqOJVkGi0Dn0A6H+ButceFMCMi+9L7B9JiBPKs8z9QvTyGTXyI/ovSAAOBYdrkG3aFgQ
 FfSJLmFubxYkNwQN3OvfxuNaosQe/9eDryI6kfb9Ur16SCEdh77G4C1x4+jjL6IeUhNJ
 +oJA==
X-Gm-Message-State: AOAM531dwt6xvlMGNEdTQcdMYeatSWb+kvBjZ+OZfQnGt9zEv/cEOo5Z
 q/epQPK1Iae1Q/4r/QGNWuE=
X-Google-Smtp-Source: ABdhPJxp/+NTQ81AZlwJauM9o9/HxJXNZkHnftQviz1jVAmg4gdpJvVVI88j0vrPQnG0sO9vW/Ei5A==
X-Received: by 2002:a2e:7210:: with SMTP id n16mr24699177ljc.8.1625865389512; 
 Fri, 09 Jul 2021 14:16:29 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id u10sm606303ljl.122.2021.07.09.14.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 14:16:29 -0700 (PDT)
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
Date: Sat, 10 Jul 2021 00:16:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thierry,

09.07.2021 22:31, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi all,
> 
> Mikko has been away for a few weeks, so I've been testing and revising
> the new UABI patches in the meantime. There are very minor changes to
> the naming of some of the UABI fields, but other than that it's mostly
> unchanged from v7.

Why you haven't addressed any of the previous review comments? There
were some obvious problems in v7 and v8 still has them.

> One notable change is that mappings can now be read-only, write-only,
> read-write or none of them (rather than just read-only or read-write),
> since those combinations are all supported by the IOMMUs and it might
> be useful to make some mappings write-only.
> 
> For a full list of changes in v8, see the changelog in patch 6.
> 
> I've also updated the libdrm_tegra library to work against this version
> of the UABI. A branch can be found here:
> 
>   https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
> 
> That contains helper APIs for the concepts introduced in this series and
> shows how they can be used in various tests that can be run for sanity
> checking.
> 
> In addition, Mikko has made updates to the following projects, though
> they may need to be updated for the minor changes in v8:
> 
> * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
>   Experimental support for MPEG2 and H264 decoding on T210, T186
>   and T194.
> 
> * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
>   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
> 
> * grate - https://github.com/grate-driver/grate
>   3D rendering testbed for Tegra20, Tegra30, and Tegra114
> 
> I plan on putting this into linux-next soon after v5.14-rc1 so that this
> can get some soak time.

It should be a bit too early to push it into kernel. The UAPI is not
ready because it's missing essential features. We can't call this a
'modern UABI' until it's fully implemented. The design decisions are
still questionable because this UAPI is built around the proprietary
firmware (and based on UAPI of downstream driver) which doesn't fit well
into DRM world. I haven't got all the answers to my previous questions,
should I repeat them?

UAPI is not the only problem that we have. The performance and stability
of the driver are in a very bad shape too. The modern UAPI can't be
built on top of the old code. It's clear now that this is a very serious
problem that must be addressed along with the UAPI work and I'm getting
silence from you guys.
