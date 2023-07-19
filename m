Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF9759CEF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 19:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2977610E10B;
	Wed, 19 Jul 2023 17:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059C810E10B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:57:14 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-66f5faba829so5384412b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20221208.gappssmtp.com; s=20221208; t=1689789434;
 x=1690394234; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FVEMGAeC4A4acfilWsGklHz88eR5z5EWRCCV9Kst0I=;
 b=0Q1tzUOb9vYJXHmPeDryrYB5A4pEESrmEqXYj9Hg+90Z5+QCPv2ecrkofZgQVHrh2Q
 2SmV6ESktQAtsjCYVJZhJojTRHsrQLvYLqNH0EoTgXcN4+EyUGH6ZSXKFYb02Y0hiirh
 icie1/r4QjaO+Xr/8VrDJJ+t8iIcRUo2snH46DM7aXAbB12rMZS46rJ2h5Z2q3coLAKN
 GMT7GgUwcUUW4SpZr+6zG8X6fnKROWImTBv7u2v/1CdFXwNuMSzJvhzr6uNXEVsoU8p0
 jr3ynj+/29rinW5TGGhTFa+uF7yLH222PS2w2a9Iu7qAlX2Am1gjapUEui6PcMe/HT1i
 pwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689789434; x=1690394234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FVEMGAeC4A4acfilWsGklHz88eR5z5EWRCCV9Kst0I=;
 b=bmvKVw1YreyLt6GScPX6ldzoFrMBKzxbBFfBMlBEVkCJPNKNk8HfPHvTRzDEvHIQkO
 YL0zdO4u5NJ2vKdH2iCT58MjmERAjSVTDcalV6MEsyxcrTtG0XxvVmjXst9+eawU1WGM
 eEbJdU9Vg+yfWu7Q+YLjbFJotOT81ib5gzG9NEINtogKfqO93T4sUb2xVRLpuhIe4qJA
 /hcjSCPiWx75Xp6GKepxxr6CrmhmiEZUFtyVIXhLDNSech//Zh8qdN21HV8FnTkCU+Ve
 P/DrGUJdpPe8nHfyVMNrMEBgYQ6yi3EzQGIBk9YwcFBjicviE6Ibn3rFNHbILK2iEpXA
 cUOw==
X-Gm-Message-State: ABy/qLbxEwFJFjCv+CkheAwEAQo2+kDmkpiRHFaAZpTS/lUuqZ9Z0dCj
 39e2BpvuHSwlB9G60VFrVWdW5Q==
X-Google-Smtp-Source: APBJJlEsVXT/riHHb217/IRnC4FkTdrL+WEIRgGEaqW1QkKPQqx7J9SZ2+4YPKCL/Z0Wz9JzjQeyoQ==
X-Received: by 2002:a17:90a:d598:b0:264:97a:2ba6 with SMTP id
 v24-20020a17090ad59800b00264097a2ba6mr4560333pju.7.1689789434001; 
 Wed, 19 Jul 2023 10:57:14 -0700 (PDT)
Received: from hermes.local (204-195-127-207.wavecable.com. [204.195.127.207])
 by smtp.gmail.com with ESMTPSA id
 nw17-20020a17090b255100b00263f41a655esm1415304pjb.43.2023.07.19.10.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 10:57:13 -0700 (PDT)
Date: Wed, 19 Jul 2023 10:57:11 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Message-ID: <20230719105711.448f8cad@hermes.local>
In-Reply-To: <CAHS8izPORN=r2-hzYSgN4s_Aoo2dnwoJXrU5Hu=43sb8zsWyhQ@mail.gmail.com>
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
 <ZLbUpdNYvyvkD27P@ziepe.ca> <20230718111508.6f0b9a83@kernel.org>
 <35f3ec37-11fe-19c8-9d6f-ae5a789843cb@kernel.org>
 <20230718112940.2c126677@kernel.org>
 <eb34f812-a866-a1a3-9f9b-7d5054d17609@kernel.org>
 <20230718154503.0421b4cd@kernel.org>
 <CAHS8izPORN=r2-hzYSgN4s_Aoo2dnwoJXrU5Hu=43sb8zsWyhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 linux-kselftest@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "David S.
 Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Andy Lutomirski <luto@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jul 2023 08:10:58 -0700
Mina Almasry <almasrymina@google.com> wrote:

> On Tue, Jul 18, 2023 at 3:45=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> >
> > On Tue, 18 Jul 2023 16:35:17 -0600 David Ahern wrote: =20
> > > I do not see how 1 RSS context (or more specifically a h/w Rx queue) =
can
> > > be used properly with memory from different processes (or dma-buf
> > > references). =20
>=20
> Right, my experience with dma-bufs from GPUs are that they're
> allocated from the userspace and owned by the process that allocated
> the backing GPU memory and generated the dma-buf from it. I.e., we're
> limited to 1 dma-buf per RX queue. If we enable binding multiple
> dma-bufs to the same RX queue, we have a problem, because AFAIU the
> NIC can't decide which dma-buf to put the packet into (it hasn't
> parsed the packet's destination yet).
>=20
> > > When the process dies, that memory needs to be flushed from
> > > the H/W queues. Queues with interlaced submissions make that more
> > > complicated. =20
> > =20
>=20
> When the process dies, do we really want to flush the memory from the
> hardware queues? The drivers I looked at don't seem to have a function
> to flush the rx queues alone, they usually do an entire driver reset
> to achieve that. Not sure if that's just convenience or there is some
> technical limitation there. Do we really want  to trigger a driver
> reset at the event a userspace process crashes?

Naive idea.
Would it be possible for process to use mmap() on the GPU memory and then
do zero copy TCP receive some how? Or is this what is being proposed.
