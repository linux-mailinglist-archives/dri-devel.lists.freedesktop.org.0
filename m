Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21ED7E2FE8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 23:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8562110E450;
	Mon,  6 Nov 2023 22:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F8810E450
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 22:34:28 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5b31e000e97so69038277b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 14:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699310067; x=1699914867;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zv4RhvnOMGMg3eq9ITCzr1fXI0OmuHMDkPX1MRaWOUU=;
 b=Ad1tv9gyrqiPvFZKTQT5xAY9oQJkzrwvy631VkFTUJ6VGDhBGOm7JFhisDESp0ZMSW
 3l9PDdINr6aeozCUoQkHR24PMChfVVLC1goWVG7tB8qPJ20XuGUPadk5yLTLqp55ciar
 BRs+yaWUwoVN7dZaDGTf4T+S7S/1jIOpHYI5T6E0Y6pDsC5l8mmmuiV3iRofJhDTrDnw
 bJQ25B9yQKdOb/+XK8g1v4IcB3aCn3u0jBKAONhiYNZTShTmB98ngyXGuBtcaQMaF1T1
 XYOubrH76/ggm17pF/AadD8IFy/LR5GugF3yxR3XrwGcaySS8UJpwSgij118Uc+5vZ+7
 CR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699310067; x=1699914867;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zv4RhvnOMGMg3eq9ITCzr1fXI0OmuHMDkPX1MRaWOUU=;
 b=kpQdRLAMzClJklfRoV4aWLvTY1F3zJfX0vkoRpJslFPwtLoFbozEogbhRvHRG3lG2i
 6nbIqt8XSwhB0qIscI9ugq4z0utnbGiwVypz8hrgNT3xALOtwd7aTyqroyOVEjkTdVwG
 0tW6cWWYTBqcsW+M5KNzo0CIlvcvv5u4ieBXVnw364SBLVZ+cc3ZBJypUHZk8d9KDE/s
 zdzDwPdqyYsqlpR+dS9IfxcLKGc/2F7zsZyzGs820c3rwOprTYBcNaEeN0FcDtrY8UPv
 bHT26s02arqSfOtxKPsGLdZr2is3Aaj4pdvRw3gSD82UzRiwdm94pBblPGy8wzu8Dm6d
 dyUQ==
X-Gm-Message-State: AOJu0Yz/toGcgYKXKsW2zVkixm12gccxPfVf5n7+eVTk9q9vJ4X0ucws
 6/tm/f+knKaJolm78W9BquLiMdw=
X-Google-Smtp-Source: AGHT+IG3dN7sVGEmAqpGExbdQBclQaMGObFV5Ff7qDqy+XlnkEORRSYhm4pZMVboGPR/chlEPa5JMbg=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a05:6902:1083:b0:da0:567d:f819 with SMTP id
 v3-20020a056902108300b00da0567df819mr727054ybu.10.1699310067541; Mon, 06 Nov
 2023 14:34:27 -0800 (PST)
Date: Mon, 6 Nov 2023 14:34:25 -0800
In-Reply-To: <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
Message-ID: <ZUlp8XutSAScKs_0@google.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
From: Stanislav Fomichev <sdf@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mina Almasry <almasrymina@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, linux-arch@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06, Willem de Bruijn wrote:
> > > IMHO, we need a better UAPI to receive the tokens and give them back to
> > > the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
> > > but look dated and hacky :-(
> > >
> > > We should either do some kind of user/kernel shared memory queue to
> > > receive/return the tokens (similar to what Jonathan was doing in his
> > > proposal?)
> >
> > I'll take a look at Jonathan's proposal, sorry, I'm not immediately
> > familiar but I wanted to respond :-) But is the suggestion here to
> > build a new kernel-user communication channel primitive for the
> > purpose of passing the information in the devmem cmsg? IMHO that seems
> > like an overkill. Why add 100-200 lines of code to the kernel to add
> > something that can already be done with existing primitives? I don't
> > see anything concretely wrong with cmsg & setsockopt approach, and if
> > we switch to something I'd prefer to switch to an existing primitive
> > for simplicity?
> >
> > The only other existing primitive to pass data outside of the linear
> > buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
> > preferred? Any other suggestions or existing primitives I'm not aware
> > of?
> >
> > > or bite the bullet and switch to io_uring.
> > >
> >
> > IMO io_uring & socket support are orthogonal, and one doesn't preclude
> > the other. As you know we like to use sockets and I believe there are
> > issues with io_uring adoption at Google that I'm not familiar with
> > (and could be wrong). I'm interested in exploring io_uring support as
> > a follow up but I think David Wei will be interested in io_uring
> > support as well anyway.
> 
> I also disagree that we need to replace a standard socket interface
> with something "faster", in quotes.
> 
> This interface is not the bottleneck to the target workload.
> 
> Replacing the synchronous sockets interface with something more
> performant for workloads where it is, is an orthogonal challenge.
> However we do that, I think that traditional sockets should continue
> to be supported.
> 
> The feature may already even work with io_uring, as both recvmsg with
> cmsg and setsockopt have io_uring support now.

I'm not really concerned with faster. I would prefer something cleaner :-)

Or maybe we should just have it documented. With some kind of path
towards beautiful world where we can create dynamic queues..
