Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3176AD6B4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 06:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B2610E42C;
	Tue,  7 Mar 2023 05:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0395210E36F;
 Tue,  7 Mar 2023 05:11:22 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id f13so11323468vsg.6;
 Mon, 06 Mar 2023 21:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678165881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOhaj5GaMc2x+mrmGWMEhuFpIiJwp+9KbBPK8wKJme0=;
 b=e8hl3EEyt4DxXdBBzVFW2YX2FyQYl9J+LekJuNwUxMSMgfHz1/PC6VHwQaqSjPptvA
 hC6OxQYaAMCK/02ReFmgVpiSqDHZllJAk8tARaYERGqJYpTjgPO7Mxeho+eE7DwSxWJc
 9c3PmbapBNNOSq1Mk/pa/LBHS8hUK8bgqok9GortNdTzQ4yKAAUR9wjpWk56k0r2PwTt
 aA1OEvu6hcZuiaZLjAXIFP9FLCOVmm7S7gZS68oKQsM5vfqnIGKF+REHleRitJPf15zw
 OX28lAlMkqsvROV4gFvy4NR8j60I1YRcLiwMj5He81BDPV13Q60l9poBJMHothtS0q4O
 HBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678165881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOhaj5GaMc2x+mrmGWMEhuFpIiJwp+9KbBPK8wKJme0=;
 b=bPAgLPx+W7PoqNa4QC1sXIBXFFRwh+ewNadSkAZQefGKmqb2uzw1UvNmC7cVqFZV3h
 fpAOLHxT2iSknJvP5vo/Qx51BTtukhym/FiSrDX9X+/hbodlYM/sW09T0ns5r6f307zn
 gR1lEeQM8qVsJMF4gzt1oQpDvb5X4R0vFFZrpDFoGp5Rq36HPyea2L9jaUVfao4bWkRE
 sADbJoAQvshk7Ooi8W36ZzfWKBUaYHCgtxShVkUIkzWFCXb9+IOfbDeo27xmp23Uekmv
 Ezww4xzf8BLqbG2jRab1goPq6XJteCoXKfehalJxz7ZFA9af+j0SSYA1xq2hLjQG3S2x
 mJRw==
X-Gm-Message-State: AO0yUKX9nB98I4GioOOxs1ZuyoZhNwImkRbuRpi1d2vwasPnOts1hwtj
 zkVNUCmfmCRPDL36dXsIT1BiNCF7/hRH7K3Yj0Q=
X-Google-Smtp-Source: AK7set/W/A+me1jNyqWc9vH8ucYNaNO688tI9JJgzbjVx6tkIj8x0Jl/Ni8mowOOIOX3Uuu3Dn7pyPGaxtgEYlgRtxI=
X-Received: by 2002:a67:e94c:0:b0:421:c4a7:872b with SMTP id
 p12-20020a67e94c000000b00421c4a7872bmr6603337vso.6.1678165880965; Mon, 06 Mar
 2023 21:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-33-jim.cromie@gmail.com>
 <CAOZdJXXHGW1iceWgB47wSUhG_hYA48JWtOPRrVRnL-EvRCxhBA@mail.gmail.com>
In-Reply-To: <CAOZdJXXHGW1iceWgB47wSUhG_hYA48JWtOPRrVRnL-EvRCxhBA@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Mon, 6 Mar 2023 22:10:54 -0700
Message-ID: <CAJfuBxy=QKPfR=OEW5ZoUz9_9MWotJnu3CKWknuhGDNOCf7Whw@mail.gmail.com>
Subject: Re: [PATCH v6 32/57] nouveau: adapt NV_DEBUG,
 NV_ATOMIC to use DRM.debug
To: Timur Tabi <timur@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org, Luis Chamberlain <mcgrof@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 6, 2023 at 11:50=E2=80=AFAM Timur Tabi <timur@kernel.org> wrote=
:
>
> On Sun, Sep 4, 2022 at 4:48 PM Jim Cromie <jim.cromie@gmail.com> wrote:
> >
> > These 2 macros used drm_debug_enabled() on DRM_UT_{DRIVER,ATOMIC}
> > respectively, replace those with drm_dbg_##cat invocations.
> >
> > this results in new class'd prdbg callsites:
> >
> > :#> grep nouveau /proc/dynamic_debug/control | grep class | wc
> >     116    1130   15584
> > :#> grep nouveau /proc/dynamic_debug/control | grep class | grep DRIVER=
 | wc
> >      74     704    9709
> > :#> grep nouveau /proc/dynamic_debug/control | grep class | grep ATOMIC=
 | wc
> >      31     307    4237
> > :#> grep nouveau /proc/dynamic_debug/control | grep class | grep KMS | =
wc
> >      11     119    1638
> >
> > the KMS entries are due to existing uses of drm_dbg_kms().
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Has this patch set been forgotten?  It was posted six months ago and
> there's no sign that it was picked up.

Not forgotten, but chicken-egg problems with initializing prdbgs/drm-dbgs
in drm.ko & dependent drivers pushed it down in priority.
I have a fix for them, which needs Jasons "lets use notifier-chain" patches=
,
which is now in Luis' modules-next.

After that fix lands, I can revisit this one.

> The changes to drm_debug_enabled have impacted NV_DEBUG and NV_ATOMIC
> and something needs to be fixed.  I posted a simpler patch a few weeks
> ago, but maybe Jim's is better.

I couldnt find it on lore, can you post a link ?

But I do recall something about chatty logs, caused by

#define drm_debug_enabled_instrumented(category)                        \
        ({                                                              \
                pr_debug("todo: is this frequent enough to optimize ?\n"); =
\
                drm_debug_enabled_raw(category);                        \
        })

If thats the case, it does seem to be frequent enough to silence.

Before you do so, could you turn on the "mfl" flags,
and count occurrences of each callsite ?

echo module nouveau +mfl > /proc/dynamic_debug/control

the numbers and duration of enablement would inform any optimization,
including those available in the subject patchset.

thanks,
Jim
