Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E805B75E4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14D310E773;
	Tue, 13 Sep 2022 15:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A99D10E4CF;
 Tue, 13 Sep 2022 15:57:58 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id b81so6069320vkf.1;
 Tue, 13 Sep 2022 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=i5/2s/PtLL3F7sLuPHmoT47IPaMV4985HuOVmfSMhas=;
 b=FbQwg+dOez++WMspFJqw3yEG1M9ose4sVfHvAK1ksk90VagdWtbqpulHuCRHaYxWtx
 iWBUI7EruGr5Fnk1kzQbRwg2rXSrp1eTMYgGIhiEyyDqPWTrp28ydel1DboiYARudz05
 3HuiX/r1ZYm7OKE3cPd8kxtBYA08o1jSXqVOt/p+p00VqyKyxnQFlqtEQZ33eQRTqD0Y
 Vv4hGG7Dzo1Y1N+PY6/116ZIX+AOdx0Hsl8QBSO7ey8fPW54COsVdx0wAh+TbkQoBbVD
 gktX3l08/T7cFDFA6Zz2W65Jy6gqZXkfBtBsY7hTcGUI1RhvpppGaZvZKcEYhHdET21G
 zvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=i5/2s/PtLL3F7sLuPHmoT47IPaMV4985HuOVmfSMhas=;
 b=I4gH+Duw5770rVJDBrUw4yovuhP2WwafBaRurN2PfNswQ6r4DatOBIUcVx7D1z18/q
 IpBqw4n2VVeJDzSsyvg/oqcq9H3aWDbmSplz4uldzyrKIzf0xS/Sno7xddpUl+l6VKjM
 9XB5kWtl4w8RBYnuJGCr4uCcAqP082S9bVyBHIsQy3KRU/RwqoEUwISZRj8W9lx8Bw6d
 b8C6fMXRz23h2z8ZSGxEXWqHT1MXkSlzmbTzfNbpizVrBd+4AmksF5PLkgSfhaUIhvkH
 BFACBWKS2ceqhrGjpLhbpsE6Sca85M6RoQKYfNvKNrE/NOG2hPR+uabbtSYO410QLqg4
 FvrQ==
X-Gm-Message-State: ACgBeo1L8At5d8RyGtaS+6Kzlp2LTCYAwkSk5CdtQIRhYcVO6W4Hzp6e
 BQWpu6CDrJcs/8dkukRd+fUBsSJMbKeEC4Sf8AQ=
X-Google-Smtp-Source: AA6agR44lSG8WNfFrRxZTUuCUtDbsrpCwCxLMS1Oq5vTfjYOKjqu8k4+i5IJZlBMtaqQKUsoKsN6BU9gFKDQhHfo5ss=
X-Received: by 2002:a1f:2a58:0:b0:37d:2a8d:5fbd with SMTP id
 q85-20020a1f2a58000000b0037d2a8d5fbdmr10871327vkq.31.1663084677136; Tue, 13
 Sep 2022 08:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20220912052852.1123868-2-jim.cromie@gmail.com> <87sfkw6gn5.fsf@intel.com>
In-Reply-To: <87sfkw6gn5.fsf@intel.com>
From: jim.cromie@gmail.com
Date: Tue, 13 Sep 2022 09:57:31 -0600
Message-ID: <CAJfuBxyrpMsHdYozXPSf=Oms4XAHyQ=PUx18RU3w=R1wVJQTtg@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] drm_print: condense enum drm_debug_category
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 4:17 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sun, 11 Sep 2022, Jim Cromie <jim.cromie@gmail.com> wrote:
> > enum drm_debug_category has 10 categories, but is initialized with
> > bitmasks which require 10 bits of underlying storage.  By using
> > natural enumeration, and moving the BIT(cat) into drm_debug_enabled(),
> > the enum fits in 4 bits, allowing the category to be represented
> > directly in pr_debug callsites, via the ddebug.class_id field.
> >
> > While this slightly pessimizes the bit-test in drm_debug_enabled(),
> > using dyndbg with JUMP_LABEL will avoid the function entirely.
> >
> > NOTE: this change forecloses the possibility of doing:
> >
> >   drm_dbg(DRM_UT_CORE|DRM_UT_KMS, "weird 2-cat experiment")
> >
> > but thats already strongly implied by the use of the enum itself; its
> > not a normal enum if it can be 2 values simultaneously.
>
> The drm.debug module parameter values are, arguably, ABI. There are tons
> of people, scripts, test environments, documentation, bug reports, etc,
> etc, referring to specific drm.debug module parameter values to enable
> specific drm debug logging categories.
>
> AFAICT you're not changing any of the values here, but having an enum
> without the hard coded values makes it more likely to accidentally
> change the category to bit mapping. At the very least deserves a
> comment.
>

hi Jani,

You're correct, this is unchanged :
   echo $script_debug_val > /sys/module/drm/parameters/debug

wrt the enum, the next patch adds a comment,

 enum drm_debug_category {
+       /* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
        /**
         * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,


But that comment mostly misses the point youre making.
and the specific NAME is stale.
and the s/int/ulong/ __drm_debug should go here, with the use of BIT()
I will fix this and repost.

Is it useful for CI / patchwork / lkp-robot purposes,
to branch-and-rebase onto drm-next/drm-next  or  drm-tip/drm-tip
(or dated tags on them ) ?




>
> BR,
> Jani.
>
>

thank you

> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  inclu
