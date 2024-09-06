Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AC96F825
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 17:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE8510EA99;
	Fri,  6 Sep 2024 15:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="KFC41kw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27D510EA99
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 15:26:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42bb885f97eso18116485e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725636384; x=1726241184;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIpoenoFKtkGUMFZF4oq1JoaRf7qXszURyjP4OsStTc=;
 b=KFC41kw5XUTQmZhLVVlfm4gTVm8SKWkTvQaiSLYLO3YIiaGru1FiGomKp8PudyPGB0
 FicoWu74b5AcsMcwX2Z1eMtA8gD6TtXwGAhRotN94g/uAM1vxEaV6iqkImZLSj1QSLdu
 VTW2EtE3mZzGzXy3qu/H68ueDFLkuHmO8nQ44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725636384; x=1726241184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AIpoenoFKtkGUMFZF4oq1JoaRf7qXszURyjP4OsStTc=;
 b=fwbIndNhoF+2rZ3w3c3fovfLhWDcnYuULsxzu89xOGu/jpWVABuSjO8Lhj/Y8iHQ10
 +tKEDVdpxymsZUZvG1kcl5AXleb7dZg47C0wa6VmAW5kxON3r9A9np+ejDaAsj+9vysM
 W8pmvA5yK25NYDpECn77qtZwy/RG2I2fzDsRJVgqwKulzqzqSPrRFzgxAHVtOeMMdklh
 fDustTc9pFSOo6Ta+a5nNnPDhNWkRvMG8vV3aE6hF/gUwVu2b/Dx1O/c4GKGHxw+SdBU
 nle6YEG97Cg7REpfw9Tdf1noXoeOQUHmRIeGtUsyci00E0WKgmRwiycWhH9Bj20B5YV9
 Ydxw==
X-Gm-Message-State: AOJu0Yz3oWRYjWrLpYM64sADxNThigOko/p30hJzJ+lzOq8bU8kHVLQ0
 pHGshHMHG0wDIKlQ+egdq/r5qJaqfQns1aAjzAh0alMdi80Sbmz49o6IRpw1XZmKO4pz27weXji
 hSJCj8JZcRX+k2gWLL57gJrg9ENI5vJbdJrje
X-Google-Smtp-Source: AGHT+IH2WiFCweaHzQf7rvyt0CrNPA9JXQYwXEfje8fO9x1s6H9rOVPsH93pXCXxM+NRFnhBI28EbMQiI/zD/2ifs2Y=
X-Received: by 2002:adf:e945:0:b0:374:c1d7:4ef9 with SMTP id
 ffacd0b85a97d-3788882a61bmr2097111f8f.26.1725636383960; Fri, 06 Sep 2024
 08:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240905181710.154732-1-ian.forbes@broadcom.com>
 <CABQX2QMvg-A9tnwwm1O3s5bhhd_w5==YqtLM5Jrk8psniAsKvA@mail.gmail.com>
In-Reply-To: <CABQX2QMvg-A9tnwwm1O3s5bhhd_w5==YqtLM5Jrk8psniAsKvA@mail.gmail.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 6 Sep 2024 10:26:12 -0500
Message-ID: <CAO6MGtjCwMD8U07-oYYuwz9o5AaENkRw-isjFLGGxzfxoB+s7A@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add tracepoints
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 5, 2024 at 10:59=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
>
> In general it looks good but what's the reason for the submit_time?
>
> z

So you can get an approximate time of how long each command buffer takes.
You can then use it to construct a histogram or look for outliers
using bpftrace.
Useful when doing performance analysis to determine if slowdowns are being
caused by the host or the guest driver.

$ sudo bpftrace -e 'tracepoint:vmwgfx:vmwgfx_cmdbuf_done{
if(args->status =3D=3D 1) { $elapsed =3D(jiffies -
args->header->submit_time); @exec_times =3D hist($elapsed);  } }'
Attaching 1 probe...
^C

@exec_times:
[0]                   59 |@@@                                              =
   |
[1]                  334 |@@@@@@@@@@@@@@@@@@                               =
   |
[2, 4)               431 |@@@@@@@@@@@@@@@@@@@@@@@                          =
   |
[4, 8)               961 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@|
[8, 16)              596 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                 =
   |
[16, 32)             139 |@@@@@@@                                          =
   |
[32, 64)              67 |@@@                                              =
   |
[64, 128)             36 |@                                                =
   |
[128, 256)            30 |@                                                =
   |
[256, 512)            17 |                                                 =
   |
