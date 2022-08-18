Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FC5A0192
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C566DC16D8;
	Wed, 24 Aug 2022 18:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BF82B594;
 Thu, 18 Aug 2022 02:01:58 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11c59785966so298280fac.11; 
 Wed, 17 Aug 2022 19:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=S/5XKfr/1Laii/jvtSToZop43NduFSge4r6M3yzcyjw=;
 b=b6NrriDxkguKdMxIx5EHPF92Ex0lVfeC4m9fKjxD5xVtw7GaFu8tLhqFfiHzAZcMd3
 YF0WmvOmWuC7l5BY5QkUp0bR6r0xoJD93h+rLZnYrlvP1RNzzVDH3TV6wgC8DBXxRzzI
 iUchu8J4g6JALFwchiea1CJBaqnLlrjn0nD8SqvSpkyrIRd6Kn//SGtaNZK4m4BSBVV2
 z3ygs9rpj+TQJ1DH2hET9EJ2k+Gcsz6efSeDKjZGTwq79f6sXOctW2/8pGUKfXaJXYeN
 05KT1OPNd/m9w4wYZ4d8ikKRhjTyT2IlaaAvpqhhpeVMrF8ygdo7QW3AnL28pSugNc3r
 oHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=S/5XKfr/1Laii/jvtSToZop43NduFSge4r6M3yzcyjw=;
 b=ufCqJovA2dx5hRywvC+TGiJy6CPB43uk8ueH0hmKsBb8ryc1he75zXdxI2wnVCXB7l
 nWDQJFReTyPzgsGKpLyphnP2D1uoCzf37BaNBn/XG3NKiRWg60DwZPOCn876/SuBQm//
 BTrt0DNNnLKSSFuMY3N7Y1uJms0Orgc7k7Olnqk7DCslvMWyrpX7f/FpiFkpcWYM+Yfj
 HW09NCdTGOglV3oaVU8t12oysY+Kk3XslvVPCoLDOoHzxLMBtP6J0quHamMf4nZ29nv8
 B7ew27aMw4CPPzeAW8gu6QizkOBMyzLah4LpJWquTc5j6ftCWk5MEY1Lp/W/BKOhc4P2
 GFEA==
X-Gm-Message-State: ACgBeo2OMxyudxwiHIdc1cy/rnSdkfSRLSuC9kbBna/6PU14LY4okjdA
 +BjUpJf8rJMtrKXLFSI9/1f7f+L3GQQtlyj3xsI=
X-Google-Smtp-Source: AA6agR5xyQe78Urmto57ircyi6EeHV+S2tnoOsF5QZuLcPzMKlnYvHKY05ZlT9jJ8u4iccYRJY5jEBIysxyi2jCzGas=
X-Received: by 2002:a05:6870:3398:b0:113:7f43:d0e9 with SMTP id
 w24-20020a056870339800b001137f43d0e9mr359862oae.33.1660788117392; Wed, 17 Aug
 2022 19:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <Yv1lepjhg/6QKyQl@debian>
In-Reply-To: <Yv1lepjhg/6QKyQl@debian>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Aug 2022 22:01:45 -0400
Message-ID: <CADnq5_Od9W1iuzYpsmODOB=Xem97ogeH_t0JrjWC-S8h0XM9fA@mail.gmail.com>
Subject: Re: build failure of next-20220817 for amdgpu
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 6:03 PM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> Not sure if it has been reported, build of next-20220817 fails with the
> error:
>
> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> Trying to do a git bisect to find out the offending commit.
>

Thanks.  I don't see that symbol in the driver at all.  Not sure where
it is coming from.

Alex


> I will be happy to test any patch or provide any extra log if needed.
>
>
> --
> Regards
> Sudip
