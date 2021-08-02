Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B323DDDA4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 18:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8928D6E1D7;
	Mon,  2 Aug 2021 16:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502556E083;
 Mon,  2 Aug 2021 16:27:13 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id k7so17096479qki.11;
 Mon, 02 Aug 2021 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hfG5pLLGBVmijGs7xD1CuYUYuRgtJdbg/w8jfytxMq8=;
 b=KCMBWwrB7rl9OU23KgEVRMNrHkjI1UKzf688kWLXVEwgeNJcNUEFn/VqxfBmj/RpNi
 fU7laMr621aEhNdbx+OdRBeG+gRjYLKUtX6YwfYdGH1jiOfiYbFh9RvqsE7G7X2Hcr6L
 IJD1goHuBubu29rquTw+430JSLxAt+s34C3IcQXoIbHdotn0TAHF96EnLgoC091BV6D8
 vKRxR4BW5FYKCX85Vyxg7ZVVfl6YOhLMldCnEvHDcsFJe8Fwf2EhaQjExoDYOarkFf0Y
 O41YnyeQ9I6FHv+VtEkpTJAWuNqqcU0IxGZo2xIbPmfEF6kRc4gS1MBxUmJXU2e9LQ32
 Knxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hfG5pLLGBVmijGs7xD1CuYUYuRgtJdbg/w8jfytxMq8=;
 b=FE+hNV/OZ8RxANKDyK1j0t7XMWy42dPQcVL75fTn7+FhB5lMIflHAPvvspNvKPsgyA
 wpBomfE1p2KKa7X/SkYVBlI+CqTEkn1o452DnDCUoF8PCxJvhfssXk8ZQ/i/aHkdBloJ
 FnEo4f6UOIsYtHDc5VM3szwbq6cr7CHUAiPBhytVywnfveU2GcOlmzf72ws/9ukGiXKk
 juGudpLWJojP+RSWX+L4c+ssDWMzCJ+EgJO7MOAkKNt9RJFKF+qOF1N26dbotEf9kCid
 aaRJqDbjMZ8YUI0Hlct5K1LmlnWMWI34s7p0Sl+CXYyh628vN+dL7H7CfGbqi6cQz8Eb
 4hCA==
X-Gm-Message-State: AOAM533NOW1YllP6LhUA+2YOv/oQJrgS+UbGq+HpE4QF1S9156dn/T3y
 j7bhRrdV2w8Igt/gHQC8/xrHJJ7jo5dAe1Ed5o8=
X-Google-Smtp-Source: ABdhPJw2gIhU+kR4Sx6iXg7nZweEAbd8+bVuItdW1omD41KUb06isEtVR9mByToT58siGUrRB/NUDTpHz2hl5JtZxys=
X-Received: by 2002:a37:64d:: with SMTP id 74mr16642727qkg.407.1627921632473; 
 Mon, 02 Aug 2021 09:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210731214211.657280-1-jim.cromie@gmail.com>
 <20210731214211.657280-6-jim.cromie@gmail.com>
In-Reply-To: <20210731214211.657280-6-jim.cromie@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Aug 2021 17:27:01 +0100
Message-ID: <CACvgo53iF4Gk3XhQAtogf52CBFuB9tDxp+Mp8A1UwcvEOQto6Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] i915/gvt: control pr_debug("gvt:")s with bits in
 parameters/debug_gvt
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jason Baron <jbaron@akamai.com>, Ashley Thomas <Ashley.Thomas2@amd.com>, 
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Wyatt Wood <Wyatt.Wood@amd.com>, Jessica Yu <jeyu@kernel.org>,
 Johan Hovold <johan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@gooogle.com>, 
 Joe Perches <joe@perches.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
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

Hi Jim,

On Sat, 31 Jul 2021 at 22:42, Jim Cromie <jim.cromie@gmail.com> wrote:

> DYNDBG_BITMAP_DESC(__gvt_debug, "dyndbg bitmap desc",
>         { "gvt: cmd: ",  "command processing" },
>         { "gvt: core: ", "core help" },
>         { "gvt: dpy: ",  "display help" },
>         { "gvt: el: ",   "help" },
>         { "gvt: irq: ",  "help" },
>         { "gvt: mm: ",   "help" },
>         { "gvt: mmio: ", "help" },
>         { "gvt: render: ", "help" },
>         { "gvt: sched: " "help" });
>
Previous commit removed the space after the colon. The above example
needs updating.

This concludes a casual read-through on my end. Hope it helps o/
-Emil
