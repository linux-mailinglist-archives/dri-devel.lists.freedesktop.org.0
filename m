Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4393838468
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 03:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375D210E02F;
	Tue, 23 Jan 2024 02:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3088210E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 02:33:52 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a309222cc62so106223766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 18:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705977170; x=1706581970; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bTu7e+R2osSeEN8Xk/RtMHC9XeUYH+SQtEvbC2VNoMo=;
 b=gfAet8eOvMuSoNivgSR4d2hWVQSrHaXWry5DNc0ZCXA5WYlNw4MsUdqsztbU5ZTPLn
 bTPDaW54bcK8tQ6sLgo9744aodG12TcNBNNUxqiaRRaguV0NKaJ/SWpmxMa1a5AnV/To
 URfT2KKNMzh3RVFji3nU9nZlKQdfBl9b3vNNynTsJ1qUftS3oTP+T7NzdLy06N8YyxfU
 pc18e7ZSlDJTGocdsfxxEEMT0l7BML6ewdZR43BEezu/bknZb5e9pvTs+61ldWmGpydJ
 QYHQNMI+lgbO+eAhyn0Axgqdu6oVRqmvDi2hEOtwuFyAyTP7/IENe+8MDJWGW4RHfHq2
 pUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705977170; x=1706581970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bTu7e+R2osSeEN8Xk/RtMHC9XeUYH+SQtEvbC2VNoMo=;
 b=bqQ1NS0DI8cvTZNfd/Ox3osPw7pcVPN1TAiEGlpj5qT402Zn1iIAmFOsdTVS3rbYYo
 ZZVzjiTUoI4CZV7xj+kofwgrVS3CbJ6gcH/SAZpcx13TEeS/dzx+khkNwwr3hWls6fWG
 f2CaoJUwIqNG6MF45kguB0qM+TxfPpsuaJWf1CWlz9sycVRXeETDtI3IWnGjrWmFTaLr
 31Lfzylnvr+woOMs1xFRRv9dKq/XR9ZdOH4YbSpT+tlbsotKwdBxhQd/Hk+34+akZAEa
 nXbB640OIF+8p0bEX1X59U7pMniYx8Pn5dWpdd3teJCFVIT3jnLArZFl0jFBy/veSmwp
 xF9Q==
X-Gm-Message-State: AOJu0YyL4ezSbMqq1e3JIZtU2CMwouQDs3OZJxNVJJCj3/04y0TWNrn6
 JQJHJMPJYHLuBf3riEyFYEOOmEZXY83NF1KYq3RAvdxZVWuLKz2eLEWQEpUxPWpnfoa54O3G1dE
 JRRcCqqrb7gatAQiI2YAbLj6U9Sg=
X-Google-Smtp-Source: AGHT+IE7VdcQSqNrPhkD9owPZ1XUsP0f4OqLr/OJRdAs4mUyZIPiwMT97B31EG2v+CaXbSobt+7BPfP+Ubee7g1kU80=
X-Received: by 2002:a17:906:c43:b0:a28:fd0e:6051 with SMTP id
 t3-20020a1709060c4300b00a28fd0e6051mr2306716ejf.33.1705977170369; Mon, 22 Jan
 2024 18:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
 <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
 <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
 <20240122203552.529eeb20@gandalf.local.home>
 <CAPM=9tyQ22nw4_u366EX=PnROYcWPD7ONRFpPEKxRvTZo0B4zQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyQ22nw4_u366EX=PnROYcWPD7ONRFpPEKxRvTZo0B4zQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 23 Jan 2024 12:32:39 +1000
Message-ID: <CAPM=9tyCN1ZhvCTjoKn-Yg5BhnrMae4E5Ci4_u7BZ2vv5gDnKw@mail.gmail.com>
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

On Tue, 23 Jan 2024 at 12:21, Dave Airlie <airlied@gmail.com> wrote:
>
> On Tue, 23 Jan 2024 at 12:15, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Mon, 22 Jan 2024 19:56:08 -0500
> > "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com> wrote:
> >
> > >
> > > On 1/22/2024 7:43 PM, Linus Torvalds wrote:
> > > > On Mon, 22 Jan 2024 at 15:17, Steven Rostedt<rostedt@goodmis.org>  wrote:
> > > >> Perhaps this is the real fix?
> > > > If you send a signed-off version, I'll apply it asap.
> > >
> > >
> > > I think a fix might already be in flight. Please see Linux-Kernel
> > > Archive: Re: [PATCH] drm/ttm: fix ttm pool initialization for
> > > no-dma-device drivers (iu.edu)
> > > <https://lkml.iu.edu/hypermail/linux/kernel/2401.1/06778.html>
> >
> > Please use lore links. They are much easier to follow and use.
>
> https://lore.kernel.org/dri-devel/20240123022015.1288588-1-airlied@gmail.com/T/#u
>
> should also fix it, Linus please apply it directly if Steven has a
> chance to give it a run.

I see Linus applied the other one, that's fine too.

Dave.
