Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755573A08CA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 02:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA7C6EC75;
	Wed,  9 Jun 2021 00:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A066EC6F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:55:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso3135698wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 17:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9qeiNnEqHnToVwTF+YALaJhts33Y3hAzDOiNFEpUNqM=;
 b=nqsl5TFA6nFViy1WhnYLZii0d/gfdyqbxMgo5ZeCK+zscVoklu4FygICY98Ui//B6f
 nCqThTZMMhYiHD4SThREyZrFCg+F9BfwGkG4DqwOzwpjwwl7ICQYAkZ/P3DlUE32eBtl
 npsM7xAJQBoLFsBLrlmr81kRgV5HvHjICWZSA/fZgQBWkdDx/2nHjZU1GQ/Lj6p2IV98
 FmmigXGK7Z0E94aqQpyP2g921KQ/vi1edhJoiU6MSqBsPr9zsKXC8FFKOo4R32sUVPuB
 WWLLPhyl/pILiWvSG9BUxQf+Jkkb0QIyP35vDEmcfqloSOejvDWhu0tJnTMgBQOcc/sy
 Ovww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9qeiNnEqHnToVwTF+YALaJhts33Y3hAzDOiNFEpUNqM=;
 b=WBykxgsRhmJgKOLdAkt22E6tTNN3e2sLcJRPHCUUoA4o5sONvL+ddjgvUTWJLBvSft
 GMMlySiA4iBppTseGdAG3hxfcXDswscZU2YpttCGl/SJ4CvySsb6RJ+Cg5e1kOZyHP2H
 Rs5OwLFkovCczXSt0kNTIxOWtWiiBnbLGbAazBF3ezqO47yu5qii7rPyOl8ei6GBjlnO
 IuxJA0fMdT/XtwFsMOMkYBNF8r5wgn7IGvNG4biAc/UqdS8Z6WeOgccidO2UiYME9ToI
 dupe/XMlb6B7ngRmuB/18MaH/hj1zRRCGTsX+5ndeToA8eT7vJ2GJ4n++vkCWvgoG5bx
 q3Ng==
X-Gm-Message-State: AOAM5337HvSk6ydU5YXdmPrJ1MDLQUYJ3+QO9KOIhELsjWCFT0W1jZxX
 ZKKM/210A3iiSuAPaFXIcK2Xi+GrxSCmrw/AxGwhTw==
X-Google-Smtp-Source: ABdhPJwGRvjqPAaMqbRNcEgccpnUGqtyTTgun+Da0x1HGhPQzUmbKr8INifXJjdvTGBCDxpQ3rvZx1RAIbgdMxBGVss=
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr25640495wmi.2.1623200151418; 
 Tue, 08 Jun 2021 17:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210608143159.1.I230026301243fbcee23d408c75aa468c1fec58f7@changeid>
 <e599ffb5-da5c-e4bb-a7d6-c2208a48868d@amd.com>
In-Reply-To: <e599ffb5-da5c-e4bb-a7d6-c2208a48868d@amd.com>
From: "Anand K. Mistry" <amistry@google.com>
Date: Wed, 9 Jun 2021 10:55:38 +1000
Message-ID: <CAATStaPcjYAoMdUVj_G3p_OQuw_faQY0PGiXeo3unPFd=WN2vA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix error code on failure to set
 brightness
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Eryk Brol <eryk.brol@amd.com>, David Airlie <airlied@linux.ie>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Thanks for your patch but this code has changed on amd-staging-drm-next.
>
> Can you try with the latest? The new backlight_update_status will always
> return 0 now.

Perfect! This solves my actual issue which is that restoring the
backlight level is failing on my device. Thank you.


-- 
Anand K. Mistry
Software Engineer
Google Australia
