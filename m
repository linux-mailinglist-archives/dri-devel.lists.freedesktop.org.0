Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB07E95E7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 05:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6137C10E100;
	Mon, 13 Nov 2023 04:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2CA10E100
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 04:08:24 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-45f0e332d6bso1767358137.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 20:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699848503; x=1700453303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fNlzfs8IwIwZE9A6q67KhpJlkrTSE+tePrP0YR73OHc=;
 b=Q9UqUewwK5ONH7BpIFmGgSCdOYWXcII7rL8h2HzLghhQAN5UsDcJDiI6PtExhy3TJM
 636BfAHL3NKleI7ElxWyFRbtUnoQApYb48kIFG85oxlLXoLBoP9cL8M7IA6RF/RQf+Pz
 temXU8KavhEx1LD//zXDgvNyZLjfpgm+2heciFmm4q+1FMXuFqEJgnL/WaTRzSBeX1bE
 t3ssXeobQzqbfr0DkrRPUpRKJvs7gum2p/c+wZXQJJRZ5ayEdqmPq1dvwB5Tcn6pShL5
 tGPCSsyS6jorv9mtLoysc7rVw1HuEPwbzE36Qvjobo2EHAqRK3E9wQi/rB/4BO2xs2SS
 rfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699848503; x=1700453303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fNlzfs8IwIwZE9A6q67KhpJlkrTSE+tePrP0YR73OHc=;
 b=aON9PCsLSm2RwOi3ktBiMRalCzk6p9GIt51mcZOi+nnJ+sLpR8Dm4dIpLI8veqOwoG
 Nlm+dO+e7PmeugmrPEhrZQW2RUhFAYv6HWmwN62GKbvmzKVbQQkGza9vs2vE55dTyJ7c
 +4hNGJneR9G0my7cX8ylzVGr+KsYAshQWXMwNycD3Dg6EmFKHb4I3lrgjL2BfEznnPs6
 nSCUzh4HmETzNAa9bcwan/EdTtROKl6PZPJv+x8160Vq66kA+WOoAPM88E1PZ344UJaV
 fRhraTs3+S9TfC0aoTtvv7cBnXI5hAjHuXmk3WT3G2vsWoPZM60WVxTs23Zxcyec3tZL
 YuFQ==
X-Gm-Message-State: AOJu0Yz7WD0tTIAg2FUnq6w4kHI6PSLmePtS83PItymSl7GnCrpDBVjJ
 L9xqH/qcvXxjcdK+bxO1KPHXx3R9A8oAs1lZgXtAkA==
X-Google-Smtp-Source: AGHT+IHqCItyp2X183Is4ZUWWeu08E03+bCPhwHxhH1umjtWjuw2QPn7bjsb51GqQnBkszbQBlUyYv0Wl+YEehcAH+Y=
X-Received: by 2002:a67:c19a:0:b0:45f:b92c:663b with SMTP id
 h26-20020a67c19a000000b0045fb92c663bmr5549887vsj.29.1699848503509; Sun, 12
 Nov 2023 20:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-13-almasrymina@google.com>
 <20231110151335.38a1c6ec@kernel.org>
 <CAHS8izNFnE8RGgBhKzxhVoKXtXgZGVQCLSdm4_dWNeH9Gx-WDQ@mail.gmail.com>
 <20231110183556.2b7b7502@kernel.org>
In-Reply-To: <20231110183556.2b7b7502@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 12 Nov 2023 20:08:10 -0800
Message-ID: <CAHS8izMQQekAdkLF7eFHfwGJJ=LFmGLHpSpOYiQeLs96ByEK7w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 12/12] selftests: add ncdevmem,
 netcat for devmem TCP
To: Jakub Kicinski <kuba@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

j

On Fri, Nov 10, 2023 at 6:36=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 10 Nov 2023 18:27:08 -0800 Mina Almasry wrote:
> > Thanks for the clear requirement. I clearly had something different in =
mind.
> >
> > Might be dumb suggestions, but instead of creating a new ndo that we
> > maybe end up wanting to deprecate once the queue API is ready, how
> > about we use either of those existing APIs?
> >
> > +void netdev_reset(struct net_device *dev)
> > +{
> > +       int flags =3D ETH_RESET_ALL;
> > +       int err;
> > +
> > +#if 1
> > +       __dev_close(dev);
> > +       err =3D __dev_open(dev, NULL);
> > +#else
> > +       err =3D dev->ethtool_ops->reset(dev, &flags);
> > +#endif
> > +}
> > +
> >
> > I've tested both of these to work with GVE on both bind via the
> > netlink API and unbind via the netlink socket close, but I'm not
> > enough of an expert to tell if there is some bad side effect that can
> > happen or something.
>
> We generally don't accept drivers doing device reconfiguration with
> full close() + open() because if the open() fails your machine
> may be cut off.
>
> There are drivers which do it, but they are either old... or weren't
> reviewed hard enough.
>
> The driver should allocate memory and whether else it can without
> stopping the queues first. Once it has all those, stop the queues,
> reconfigure with already allocated resources, start queues, free old.
>
> Even without the queue API in place, good drivers do full device
> reconfig this way. Hence my mind goes towards a new (temporary?)
> ndo. It will be replaced by the queue API, but whoever implements
> it for now has to follow this careful reconfig strategy...

OK, thanks. I managed to get a POC (but only POC) of the queue API
working with GVE. I still need to test it more thoroughly and get a
review before I can conclude it's actually a viable path but it
doesn't seem as grim as I originally thought:

https://github.com/torvalds/linux/commit/21b8e108fa88d90870eef53be9320f136b=
96cca0

So, seems there are 2 paths forward:

(a) implement a new 'reconfig' ndo carefully as you described above.
(b) implement a minimal version of the queue API as you described
here: https://lore.kernel.org/netdev/20230815171638.4c057dcd@kernel.org/

Some questions, sorry if basic:

1. For (b), would it be OK to implement a very minimal version of
queue_[stop|start]/queue_mem_[alloc|free], which I use for the sole
purpose of reposting buffers to an individual queue, and then later
whoever picks up your queue API effort (maybe me) extends the
implementation to do the rest of the things you described in your
email? If not, what is the minimal queue API I can implement and use
for devmem TCP?

2. Since this is adding ndo, do I need to implement the ndo for 2
drivers or is GVE sufficient?

--
Thanks,
Mina
