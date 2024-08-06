Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C83948F1F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854F210E039;
	Tue,  6 Aug 2024 12:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CtHPzusY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF30210E039
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:39:36 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-4f6ac1628dfso259813e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722947976; x=1723552776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrdmTtiXVmTM/1NHHOYdmmDXOI3jR7XQcOI+pwOJhWY=;
 b=CtHPzusYyoOwFU8g6I1ExL6IfaJu5uxvajpqx6Nww1sSRWTNTuQZ5ab3mxU28OSyeQ
 SrMyLgZLTTuHrH2fTDszrdm6rlj8DQRxLdxJnce+ZNkyrPLeJlphX9fVqHSt/AOOv7r/
 HkbEdw7KyTaq3hxOhrFtSCvG8fBMxe88RSKv231nTCRBP9NKq+9EB573HrONmS6EZfE/
 29w1vlsJAXwnYzbpf509kOermdtOq9aEyevHMmzEHx1PXVBO/ClnUvMHWDSxU/VMrr4Y
 yKnmN3GPej0EAZuEmwTu/994GQoLq4F5tcsBurowrUHpv8Y0rvMDrJ++8q9b4F+BFX6g
 90+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722947976; x=1723552776;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zrdmTtiXVmTM/1NHHOYdmmDXOI3jR7XQcOI+pwOJhWY=;
 b=OJVlDI2z3ICDcA8MmAcCFwZEzluXdrQl2by2q4qc0jowV3JZISY3gHR7q9ZTlr/vFh
 tMaTjOLV+1QfWFMTtOdGE2wHcODl5G3NZUXxaRxnjgzeC7qfbpc4mDJLE7CaPLfc0OGN
 1w8vSTSYtqiiFkHC0pOXf1O8FidX26I8tnb3mtc48Jbu5OpO1nB7910Amb8Yn/8XKFzB
 zv857AZvwaSpxwLCUslG45SDOpc3SPqsN5XAJtQ+EnxIgO+crpzLVLaGWJIJwmeDgqdD
 3w1uaBPGLvgaqdSiD2OljM8G0DoNM/87YXUUV8oWhHP6MRFBs/stUbOfpwoK3wvlUXQJ
 zGAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxEleh6DNMHHjugx8YuFuI8YlHneDuVztaxFQRuYERntQHTHWXBvOquCxiZX2cGXxvNd16ylpwAg8Bunjwq023swusuRaSSz0kLk8kTJBZ
X-Gm-Message-State: AOJu0YwlTus48EUghseN5gVaCAppz0/GJ2GdvmaOUAHyNmp6DMP72Y9F
 RtItLEh+hnTiP4hV0H8/VPwXRJXvl3DkApc5hreWf9wVQ1qYZLHA
X-Google-Smtp-Source: AGHT+IEzF8kEieTvm400vGSAD/FxkfKWUdB+Qp9zmFjvlH9NnaUdLi1L0Oe0+UqgMX4/h+bhgaOPVA==
X-Received: by 2002:a05:6122:4584:b0:4eb:5cb9:f219 with SMTP id
 71dfb90a1353d-4f89fe84d6fmr18355377e0c.0.1722947975581; 
 Tue, 06 Aug 2024 05:39:35 -0700 (PDT)
Received: from localhost (73.84.86.34.bc.googleusercontent.com. [34.86.84.73])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f6dce75sm450350985a.14.2024.08.06.05.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 05:39:34 -0700 (PDT)
Date: Tue, 06 Aug 2024 08:39:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, 
 Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, 
 Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Eric Dumazet <edumazet@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Helge Deller <deller@gmx.de>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Jakub Kicinski <kuba@kernel.org>, 
 "James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Jeroen de Borst <jeroendb@google.com>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Matt Turner <mattst88@gmail.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Shailend Chand <shailend@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <66b2198686b91_3206cf29453@willemb.c.googlers.com.notmuch>
In-Reply-To: <9aad36fe-cd4c-4ce5-b4d8-6c8619d10c46@web.de>
References: <20240730022623.98909-4-almasrymina@google.com>
 <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
 <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
 <9aad36fe-cd4c-4ce5-b4d8-6c8619d10c46@web.de>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to
 netdevice
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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

Markus Elfring wrote:
> >> =E2=80=A6
> >>> +++ b/include/net/devmem.h
> >>> @@ -0,0 +1,115 @@
> >> =E2=80=A6
> >>> +#ifndef _NET_DEVMEM_H
> >>> +#define _NET_DEVMEM_H
> >> =E2=80=A6
> >>
> >> I suggest to omit leading underscores from such identifiers.
> >> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declar=
e+or+define+a+reserved+identifier
> >>
> >
> > I was gonna apply this change, but I ack'd existing files and I find
> > that all of them include leading underscores, including some very
> > recently added files like net/core/page_pool_priv.h.
> >
> > I would prefer to stick to existing conventions if that's OK, unless
> > there is widespread agreement to the contrary.
> =

> Under which circumstances would you become interested to reduce develop=
ment risks
> also according to undefined behaviour?
> https://wiki.sei.cmu.edu/confluence/display/c/CC.+Undefined+Behavior#CC=
.UndefinedBehavior-ub_106

This series is following established practice in kernel networking.

If that conflicts with a C standard, then perhaps that needs to be
resolved project wide.

Forcing an individual feature to diverge just brings inconsistency.
That said, this appears to be inconsistent already.

Main question is whether this is worth respinning a series already at
v17 with no more fundamental feedback.

For reference:

$ grep -nrI '^#ifndef\ _\+NET[_A-Z]\+H' include/  | wc -l
149

$ grep -nrI '^#ifndef\ NET[_A-Z]\+H' include/  | wc -l
4

$ grep -nrI '^#ifndef\ [_]\+[A-Z][_A-Z]\+H' include/  | wc -l
3805

$ grep -nrI '^#ifndef\ [A-Z][_A-Z]\+H' include/  | wc -l
583
