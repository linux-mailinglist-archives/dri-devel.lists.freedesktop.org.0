Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F418382C4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 03:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855F110E471;
	Tue, 23 Jan 2024 02:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A11710E471
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 02:22:57 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a308e6824ccso102256666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 18:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705976514; x=1706581314; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UQ8GDI8FzhEiMu6pZSg0ZuOmMJQKcLLfU4p0987uNpk=;
 b=broxAV6CDKaVh1/X+S9u6z11pYOT3vdHdltmWvCX37jHvSWe+frtR4I9s1EHgFyKMn
 GydVT7BEpxzvltKTtq1RPWA7sGtiYKWv0edn1Vo5tX1mmo28DcBhN45PfDqAGLfGfM3u
 YXjeRLXL+p9RtqLotQ4f3BkwTRuJ3MfSYO1UO6hvxeopq35oSVonVK/avr0tuy7cD8Jr
 WMTY/QxHTRGJNCfDznYyOZ6Fynws1A1RyTrrs2DiLa2UYPHo8IblKOTAV5hpVpukm0JM
 kxsM0CXDwim1mvxVaL/ftTCyHKu6us/Jtxn9rKLBhhmBAbOFcaF7hYDDZfTGxnjMzMBE
 2+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705976514; x=1706581314;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQ8GDI8FzhEiMu6pZSg0ZuOmMJQKcLLfU4p0987uNpk=;
 b=tKN6PrJ1Jq1lVFNdIP13h9rp0yALYA67iRb/8pmucdqCOwZr04ynF9L5ALxYcycUhf
 iqL2nj/M3fqEG7c8s0TNBz7w9vYcntk7ZWQ0Bi900D40Ie5lrmjwbJoU/fA20fLwaWmG
 94FjEbeDt6Ooj4qW6JuYr4ncAcTc7R+erycMXXZLoQEmHCFhF9Z4pp4qcxPdQP5kusd7
 eZEkjaqwQuS3fgb5iBzzxbfTWep5zyE/m4qTEu0szwUOM5S3U+yrblOtoNOhrmaETXb5
 Z8pZjf6IbB26Fm/Y7bMgmR6xRHAbVo5ZUoC4SJ2HbRLT2Rh6WC4DwZRiK2dMMbcCtbR7
 Hz9w==
X-Gm-Message-State: AOJu0YyL6oN7rZBYXDPXS9wxc85S/UsS8Dbg/3Bqon7EHWJ5ZOJqo6F0
 WAij/CUTtH63+57lc2aJykW3lId3pIzW6fOPV/b5+27WMfgTezvcJClzynPNCM89JWQd7iayG8A
 pwG8CqS+ouHhigvS+lR+Kh2FC1pm9QoJR6zA=
X-Google-Smtp-Source: AGHT+IFDCkj/zDpLb0MKY6dR1bSTBGpxcp2rQ+Gl8K7k1K8bcQXP4Bux8V5sPQoBHVJOS7dyfJRf8nFN/evo0h1C2Js=
X-Received: by 2002:a17:907:d405:b0:a2f:c878:38c0 with SMTP id
 vi5-20020a170907d40500b00a2fc87838c0mr3133557ejc.59.1705976513487; Mon, 22
 Jan 2024 18:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
 <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
 <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
 <20240122203552.529eeb20@gandalf.local.home>
In-Reply-To: <20240122203552.529eeb20@gandalf.local.home>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 23 Jan 2024 12:21:41 +1000
Message-ID: <CAPM=9tyQ22nw4_u366EX=PnROYcWPD7ONRFpPEKxRvTZo0B4zQ@mail.gmail.com>
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
To: Steven Rostedt <rostedt@goodmis.org>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, "Bhardwaj,
 Rajneesh" <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Fedor Pchelkin <pchelkin@ispras.ru>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024 at 12:15, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 22 Jan 2024 19:56:08 -0500
> "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com> wrote:
>
> >
> > On 1/22/2024 7:43 PM, Linus Torvalds wrote:
> > > On Mon, 22 Jan 2024 at 15:17, Steven Rostedt<rostedt@goodmis.org>  wrote:
> > >> Perhaps this is the real fix?
> > > If you send a signed-off version, I'll apply it asap.
> >
> >
> > I think a fix might already be in flight. Please see Linux-Kernel
> > Archive: Re: [PATCH] drm/ttm: fix ttm pool initialization for
> > no-dma-device drivers (iu.edu)
> > <https://lkml.iu.edu/hypermail/linux/kernel/2401.1/06778.html>
>
> Please use lore links. They are much easier to follow and use.

https://lore.kernel.org/dri-devel/20240123022015.1288588-1-airlied@gmail.com/T/#u

should also fix it, Linus please apply it directly if Steven has a
chance to give it a run.

Thanks,
Dave.
