Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD77E30E3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E77F10E457;
	Mon,  6 Nov 2023 23:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326D110E457
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:15:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54357417e81so4838a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 15:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699312509; x=1699917309;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Iwt8apmvOTlb3cb3hpk+8zrI6lsHw5+CGh1ZVTiOJKc=;
 b=DQmBNCm+c/90brBn5JgkwO1ReBnunOV0hS3lSRKW2y589IsnuzOJyXhxzVUcCq+qcW
 4bcNvLsfmU4Yc5NicBEB0Y+QWkkDCTIWCQTjTY7KBCCo/0H7FGD/SUgOVQ03sTlpS0P+
 ecVNHc6TN4aRal2LbCmZ64b7lpmxjbjrbKVdICkhaF7JrY0vyJyqzlio3DEx342s8mGs
 ZbLHu4NU20vT7htnRnxxwDUOQfIGLFGadvAPWlK2wvAz6iNpyX/Q75/rFTX3fWFLj/B1
 osSorjL3ROvfz4mfD/Vecv4mB5d/a6OsHkHe9jktd6Q4vGuqqsWCEAlnQsPIc795sDmV
 l6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699312509; x=1699917309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iwt8apmvOTlb3cb3hpk+8zrI6lsHw5+CGh1ZVTiOJKc=;
 b=LHX4AkBxnOPQJn6flk59ZAOBJKNphM7+JgoNVGUBSuAK1ngDCNFk1sIDjgC0CAjj+L
 eIy6t1xdM2XPUGgrhTqqMuIYQDS5zs7JycxNZjPGUhuyPLxD2DoxymnVT0iZ/oWlxs3K
 XIb8xsrMlrnBcviKFQxvaWzBxMbGAuuLQM/ATma7Yqscfl/geoGft+GZGQEJkoFVgeY1
 ox9x30LSxva6aN+0suiIn+sIxEvDom/3AUTALY2MqdZaCZcS/rnGpIjBbrysfo35qkkq
 0AV0XtJAxjMdspUsZuKEs4rUWorJzQpUF6d0MaJqbaIy0LD+b1+AgawNuavAr4ON3832
 krMg==
X-Gm-Message-State: AOJu0YxMaonGjILH3DPGvtHPbmHC6Iw8xiG5sKJQo2HMQc/qFz9itVkR
 tb9qefefs8u0qbX7TvbCJIhRogdVfVoA2uYXgxjOng==
X-Google-Smtp-Source: AGHT+IHTSouxAKt24JqNQrY4w64PECIu3JABBvOq/CI28t3x23re6I5ClN8+Wc4xyUBocwb/ocpBHXx6D7HsHh7DMmM=
X-Received: by 2002:a50:aac7:0:b0:544:466b:3b20 with SMTP id
 r7-20020a50aac7000000b00544466b3b20mr20167edc.5.1699312509365; Mon, 06 Nov
 2023 15:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
In-Reply-To: <ZUlvzm24SA3YjirV@google.com>
From: Kaiyuan Zhang <kaiyuanz@google.com>
Date: Mon, 6 Nov 2023 15:14:57 -0800
Message-ID: <CAAHRiQXF01PGVwUJOt9o3Ea1bPrShZHC2EJcqm3_e6B=sMwgfA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
To: Stanislav Fomichev <sdf@google.com>
Content-Type: multipart/alternative; boundary="0000000000007cbbe40609840653"
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 linux-arch@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007cbbe40609840653
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> But there is still always 1 dmabuf to 1 socket association (on rx), right=
?
>
In practice yes, but my understanding is that such association is only
enforced by NIC features such as flow steering.

So why not have a separate control channel action to say: this socket fd
> is supposed to receive into this dmabuf fd?
>
 Are you proposing also adding the installation of corresponding flow
steering into this action? Or just add checks to make sure the flow
steering won't be removed?

On Mon, Nov 6, 2023 at 2:59=E2=80=AFPM Stanislav Fomichev <sdf@google.com> =
wrote:

> On 11/06, Mina Almasry wrote:
> > On Mon, Nov 6, 2023 at 1:59=E2=80=AFPM Stanislav Fomichev <sdf@google.c=
om>
> wrote:
> > >
> > > On 11/06, Mina Almasry wrote:
> > > > On Mon, Nov 6, 2023 at 11:34=E2=80=AFAM David Ahern <dsahern@kernel=
.org>
> wrote:
> > > > >
> > > > > On 11/6/23 11:47 AM, Stanislav Fomichev wrote:
> > > > > > On 11/05, Mina Almasry wrote:
> > > > > >> For device memory TCP, we expect the skb headers to be
> available in host
> > > > > >> memory for access, and we expect the skb frags to be in device
> memory
> > > > > >> and unaccessible to the host. We expect there to be no mixing
> and
> > > > > >> matching of device memory frags (unaccessible) with host memor=
y
> frags
> > > > > >> (accessible) in the same skb.
> > > > > >>
> > > > > >> Add a skb->devmem flag which indicates whether the frags in
> this skb
> > > > > >> are device memory frags or not.
> > > > > >>
> > > > > >> __skb_fill_page_desc() now checks frags added to skbs for
> page_pool_iovs,
> > > > > >> and marks the skb as skb->devmem accordingly.
> > > > > >>
> > > > > >> Add checks through the network stack to avoid accessing the
> frags of
> > > > > >> devmem skbs and avoid coalescing devmem skbs with non devmem
> skbs.
> > > > > >>
> > > > > >> Signed-off-by: Willem de Bruijn <willemb@google.com>
> > > > > >> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > > > > >> Signed-off-by: Mina Almasry <almasrymina@google.com>
> > > > > >>
> > > > > >> ---
> > > > > >>  include/linux/skbuff.h | 14 +++++++-
> > > > > >>  include/net/tcp.h      |  5 +--
> > > > > >>  net/core/datagram.c    |  6 ++++
> > > > > >>  net/core/gro.c         |  5 ++-
> > > > > >>  net/core/skbuff.c      | 77
> ++++++++++++++++++++++++++++++++++++------
> > > > > >>  net/ipv4/tcp.c         |  6 ++++
> > > > > >>  net/ipv4/tcp_input.c   | 13 +++++--
> > > > > >>  net/ipv4/tcp_output.c  |  5 ++-
> > > > > >>  net/packet/af_packet.c |  4 +--
> > > > > >>  9 files changed, 115 insertions(+), 20 deletions(-)
> > > > > >>
> > > > > >> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > > > > >> index 1fae276c1353..8fb468ff8115 100644
> > > > > >> --- a/include/linux/skbuff.h
> > > > > >> +++ b/include/linux/skbuff.h
> > > > > >> @@ -805,6 +805,8 @@ typedef unsigned char *sk_buff_data_t;
> > > > > >>   *  @csum_level: indicates the number of consecutive checksum=
s
> found in
> > > > > >>   *          the packet minus one that have been verified as
> > > > > >>   *          CHECKSUM_UNNECESSARY (max 3)
> > > > > >> + *  @devmem: indicates that all the fragments in this skb are
> backed by
> > > > > >> + *          device memory.
> > > > > >>   *  @dst_pending_confirm: need to confirm neighbour
> > > > > >>   *  @decrypted: Decrypted SKB
> > > > > >>   *  @slow_gro: state present at GRO time, slower prepare step
> required
> > > > > >> @@ -991,7 +993,7 @@ struct sk_buff {
> > > > > >>  #if IS_ENABLED(CONFIG_IP_SCTP)
> > > > > >>      __u8                    csum_not_inet:1;
> > > > > >>  #endif
> > > > > >> -
> > > > > >> +    __u8                    devmem:1;
> > > > > >>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
> > > > > >>      __u16                   tc_index;       /* traffic contro=
l
> index */
> > > > > >>  #endif
> > > > > >> @@ -1766,6 +1768,12 @@ static inline void
> skb_zcopy_downgrade_managed(struct sk_buff *skb)
> > > > > >>              __skb_zcopy_downgrade_managed(skb);
> > > > > >>  }
> > > > > >>
> > > > > >> +/* Return true if frags in this skb are not readable by the
> host. */
> > > > > >> +static inline bool skb_frags_not_readable(const struct sk_buf=
f
> *skb)
> > > > > >> +{
> > > > > >> +    return skb->devmem;
> > > > > >
> > > > > > bikeshedding: should we also rename 'devmem' sk_buff flag to
> 'not_readable'?
> > > > > > It better communicates the fact that the stack shouldn't
> dereference the
> > > > > > frags (because it has 'devmem' fragments or for some other
> potential
> > > > > > future reason).
> > > > >
> > > > > +1.
> > > > >
> > > > > Also, the flag on the skb is an optimization - a high level signa=
l
> that
> > > > > one or more frags is in unreadable memory. There is no requiremen=
t
> that
> > > > > all of the frags are in the same memory type.
> > >
> > > David: maybe there should be such a requirement (that they all are
> > > unreadable)? Might be easier to support initially; we can relax later
> > > on.
> > >
> >
> > Currently devmem =3D=3D not_readable, and the restriction is that all t=
he
> > frags in the same skb must be either all readable or all unreadable
> > (all devmem or all non-devmem).
> >
> > > > The flag indicates that the skb contains all devmem dma-buf memory
> > > > specifically, not generic 'not_readable' frags as the comment says:
> > > >
> > > > + *     @devmem: indicates that all the fragments in this skb are
> backed by
> > > > + *             device memory.
> > > >
> > > > The reason it's not a generic 'not_readable' flag is because handin=
g
> > > > off a generic not_readable skb to the userspace is semantically not
> > > > what we're doing. recvmsg() is augmented in this patch series to
> > > > return a devmem skb to the user via a cmsg_devmem struct which refe=
rs
> > > > specifically to the memory in the dma-buf. recvmsg() in this patch
> > > > series is not augmented to give any 'not_readable' skb to the
> > > > userspace.
> > > >
> > > > IMHO skb->devmem + an skb_frags_not_readable() as implemented is
> > > > correct. If a new type of unreadable skbs are introduced to the
> stack,
> > > > I imagine the stack would implement:
> > > >
> > > > 1. new header flag: skb->newmem
> > > > 2.
> > > >
> > > > static inline bool skb_frags_not_readable(const struct skb_buff *sk=
b)
> > > > {
> > > >     return skb->devmem || skb->newmem;
> > > > }
> > > >
> > > > 3. tcp_recvmsg_devmem() would handle skb->devmem skbs is in this
> patch
> > > > series, but tcp_recvmsg_newmem() would handle skb->newmem skbs.
> > >
> > > You copy it to the userspace in a special way because your frags
> > > are page_is_page_pool_iov(). I agree with David, the skb bit is
> > > just and optimization.
> > >
> > > For most of the core stack, it doesn't matter why your skb is not
> > > readable. For a few places where it matters (recvmsg?), you can
> > > double-check your frags (all or some) with page_is_page_pool_iov.
> > >
> >
> > I see, we can do that then. I.e. make the header flag 'not_readable'
> > and check the frags to decide to delegate to tcp_recvmsg_devmem() or
> > something else. We can even assume not_readable =3D=3D devmem because
> > currently devmem is the only type of unreadable frag currently.
> >
> > > Unrelated: we probably need socket to dmabuf association as well (via
> > > netlink or something).
> >
> > Not sure this is possible. The dma-buf is bound to the rx-queue, and
> > any packets that land on that rx-queue are bound to that dma-buf,
> > regardless of which socket that packet belongs to. So the association
> > IMO must be rx-queue to dma-buf, not socket to dma-buf.
>
> But there is still always 1 dmabuf to 1 socket association (on rx), right=
?
> Because otherwise, there is no way currently to tell, at recvmsg, which
> dmabuf the received token belongs to.
>
> So why not have a separate control channel action to say: this socket fd
> is supposed to receive into this dmabuf fd? This action would put
> the socket into permanent 'MSG_SOCK_DEVMEM' mode. Maybe you can also
> put some checks at the lower level to to enforce this dmabuf
> association. (to avoid any potential issues with flow steering)
>
> We'll still have dmabuf to rx-queue association because of various
> reasons..
>

--0000000000007cbbe40609840653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">But ther=
e is still always 1 dmabuf to 1 socket association (on rx), right?<br></blo=
ckquote><div>In practice yes, but my understanding is that such association=
 is only enforced by NIC features such as flow steering.</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">So why not have a separ=
ate control channel action to say: this socket fd<br>is supposed to receive=
 into this dmabuf fd?<br></blockquote><div>=C2=A0Are you proposing also add=
ing the installation of corresponding flow steering into this action? Or ju=
st add checks to make sure the flow steering won&#39;t be removed?</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, N=
ov 6, 2023 at 2:59=E2=80=AFPM Stanislav Fomichev &lt;<a href=3D"mailto:sdf@=
google.com" target=3D"_blank">sdf@google.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 11/06, Mina Almasry wrote:<b=
r>
&gt; On Mon, Nov 6, 2023 at 1:59=E2=80=AFPM Stanislav Fomichev &lt;<a href=
=3D"mailto:sdf@google.com" target=3D"_blank">sdf@google.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; On 11/06, Mina Almasry wrote:<br>
&gt; &gt; &gt; On Mon, Nov 6, 2023 at 11:34=E2=80=AFAM David Ahern &lt;<a h=
ref=3D"mailto:dsahern@kernel.org" target=3D"_blank">dsahern@kernel.org</a>&=
gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On 11/6/23 11:47 AM, Stanislav Fomichev wrote:<br>
&gt; &gt; &gt; &gt; &gt; On 11/05, Mina Almasry wrote:<br>
&gt; &gt; &gt; &gt; &gt;&gt; For device memory TCP, we expect the skb heade=
rs to be available in host<br>
&gt; &gt; &gt; &gt; &gt;&gt; memory for access, and we expect the skb frags=
 to be in device memory<br>
&gt; &gt; &gt; &gt; &gt;&gt; and unaccessible to the host. We expect there =
to be no mixing and<br>
&gt; &gt; &gt; &gt; &gt;&gt; matching of device memory frags (unaccessible)=
 with host memory frags<br>
&gt; &gt; &gt; &gt; &gt;&gt; (accessible) in the same skb.<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; Add a skb-&gt;devmem flag which indicates whet=
her the frags in this skb<br>
&gt; &gt; &gt; &gt; &gt;&gt; are device memory frags or not.<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; __skb_fill_page_desc() now checks frags added =
to skbs for page_pool_iovs,<br>
&gt; &gt; &gt; &gt; &gt;&gt; and marks the skb as skb-&gt;devmem accordingl=
y.<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; Add checks through the network stack to avoid =
accessing the frags of<br>
&gt; &gt; &gt; &gt; &gt;&gt; devmem skbs and avoid coalescing devmem skbs w=
ith non devmem skbs.<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; Signed-off-by: Willem de Bruijn &lt;<a href=3D=
"mailto:willemb@google.com" target=3D"_blank">willemb@google.com</a>&gt;<br=
>
&gt; &gt; &gt; &gt; &gt;&gt; Signed-off-by: Kaiyuan Zhang &lt;<a href=3D"ma=
ilto:kaiyuanz@google.com" target=3D"_blank">kaiyuanz@google.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; Signed-off-by: Mina Almasry &lt;<a href=3D"mai=
lto:almasrymina@google.com" target=3D"_blank">almasrymina@google.com</a>&gt=
;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; ---<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 include/linux/skbuff.h | 14 +++++++-<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 include/net/tcp.h=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 +--<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 net/core/datagram.c=C2=A0 =C2=A0 |=C2=A0=
 6 ++++<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 net/core/gro.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 ++-<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 net/core/skbuff.c=C2=A0 =C2=A0 =C2=A0 | =
77 ++++++++++++++++++++++++++++++++++++------<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 net/ipv4/tcp.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 6 ++++<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 net/ipv4/tcp_input.c=C2=A0 =C2=A0| 13 ++=
+++--<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 net/ipv4/tcp_output.c=C2=A0 |=C2=A0 5 ++=
-<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 net/packet/af_packet.c |=C2=A0 4 +--<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 9 files changed, 115 insertions(+), 20 d=
eletions(-)<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; diff --git a/include/linux/skbuff.h b/include/=
linux/skbuff.h<br>
&gt; &gt; &gt; &gt; &gt;&gt; index 1fae276c1353..8fb468ff8115 100644<br>
&gt; &gt; &gt; &gt; &gt;&gt; --- a/include/linux/skbuff.h<br>
&gt; &gt; &gt; &gt; &gt;&gt; +++ b/include/linux/skbuff.h<br>
&gt; &gt; &gt; &gt; &gt;&gt; @@ -805,6 +805,8 @@ typedef unsigned char *sk_=
buff_data_t;<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*=C2=A0 @csum_level: indicates the=
 number of consecutive checksums found in<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 the packet minus one that have been verified as<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CHECKSUM_UNNECESSARY (max 3)<br>
&gt; &gt; &gt; &gt; &gt;&gt; + *=C2=A0 @devmem: indicates that all the frag=
ments in this skb are backed by<br>
&gt; &gt; &gt; &gt; &gt;&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device m=
emory.<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*=C2=A0 @dst_pending_confirm: need=
 to confirm neighbour<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*=C2=A0 @decrypted: Decrypted SKB<=
br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0*=C2=A0 @slow_gro: state present a=
t GRO time, slower prepare step required<br>
&gt; &gt; &gt; &gt; &gt;&gt; @@ -991,7 +993,7 @@ struct sk_buff {<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 #if IS_ENABLED(CONFIG_IP_SCTP)<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 __u8=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csum_not_inet:1;<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt;&gt; -<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 __u8=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devmem:1;<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 #if defined(CONFIG_NET_SCHED) || defined=
(CONFIG_NET_XGRESS)<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 __u16=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc_index;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* traffic control index */<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt;&gt; @@ -1766,6 +1768,12 @@ static inline void skb_=
zcopy_downgrade_managed(struct sk_buff *skb)<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __skb_zcopy_downgrade_managed(skb);<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; +/* Return true if frags in this skb are not r=
eadable by the host. */<br>
&gt; &gt; &gt; &gt; &gt;&gt; +static inline bool skb_frags_not_readable(con=
st struct sk_buff *skb)<br>
&gt; &gt; &gt; &gt; &gt;&gt; +{<br>
&gt; &gt; &gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 return skb-&gt;devmem;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; bikeshedding: should we also rename &#39;devmem&#3=
9; sk_buff flag to &#39;not_readable&#39;?<br>
&gt; &gt; &gt; &gt; &gt; It better communicates the fact that the stack sho=
uldn&#39;t dereference the<br>
&gt; &gt; &gt; &gt; &gt; frags (because it has &#39;devmem&#39; fragments o=
r for some other potential<br>
&gt; &gt; &gt; &gt; &gt; future reason).<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +1.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Also, the flag on the skb is an optimization - a high l=
evel signal that<br>
&gt; &gt; &gt; &gt; one or more frags is in unreadable memory. There is no =
requirement that<br>
&gt; &gt; &gt; &gt; all of the frags are in the same memory type.<br>
&gt; &gt;<br>
&gt; &gt; David: maybe there should be such a requirement (that they all ar=
e<br>
&gt; &gt; unreadable)? Might be easier to support initially; we can relax l=
ater<br>
&gt; &gt; on.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Currently devmem =3D=3D not_readable, and the restriction is that all =
the<br>
&gt; frags in the same skb must be either all readable or all unreadable<br=
>
&gt; (all devmem or all non-devmem).<br>
&gt; <br>
&gt; &gt; &gt; The flag indicates that the skb contains all devmem dma-buf =
memory<br>
&gt; &gt; &gt; specifically, not generic &#39;not_readable&#39; frags as th=
e comment says:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; + *=C2=A0 =C2=A0 =C2=A0@devmem: indicates that all the fragm=
ents in this skb are backed by<br>
&gt; &gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device me=
mory.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The reason it&#39;s not a generic &#39;not_readable&#39; fla=
g is because handing<br>
&gt; &gt; &gt; off a generic not_readable skb to the userspace is semantica=
lly not<br>
&gt; &gt; &gt; what we&#39;re doing. recvmsg() is augmented in this patch s=
eries to<br>
&gt; &gt; &gt; return a devmem skb to the user via a cmsg_devmem struct whi=
ch refers<br>
&gt; &gt; &gt; specifically to the memory in the dma-buf. recvmsg() in this=
 patch<br>
&gt; &gt; &gt; series is not augmented to give any &#39;not_readable&#39; s=
kb to the<br>
&gt; &gt; &gt; userspace.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; IMHO skb-&gt;devmem + an skb_frags_not_readable() as impleme=
nted is<br>
&gt; &gt; &gt; correct. If a new type of unreadable skbs are introduced to =
the stack,<br>
&gt; &gt; &gt; I imagine the stack would implement:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 1. new header flag: skb-&gt;newmem<br>
&gt; &gt; &gt; 2.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; static inline bool skb_frags_not_readable(const struct skb_b=
uff *skb)<br>
&gt; &gt; &gt; {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0return skb-&gt;devmem || skb-&gt;newmem;<=
br>
&gt; &gt; &gt; }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 3. tcp_recvmsg_devmem() would handle skb-&gt;devmem skbs is =
in this patch<br>
&gt; &gt; &gt; series, but tcp_recvmsg_newmem() would handle skb-&gt;newmem=
 skbs.<br>
&gt; &gt;<br>
&gt; &gt; You copy it to the userspace in a special way because your frags<=
br>
&gt; &gt; are page_is_page_pool_iov(). I agree with David, the skb bit is<b=
r>
&gt; &gt; just and optimization.<br>
&gt; &gt;<br>
&gt; &gt; For most of the core stack, it doesn&#39;t matter why your skb is=
 not<br>
&gt; &gt; readable. For a few places where it matters (recvmsg?), you can<b=
r>
&gt; &gt; double-check your frags (all or some) with page_is_page_pool_iov.=
<br>
&gt; &gt;<br>
&gt; <br>
&gt; I see, we can do that then. I.e. make the header flag &#39;not_readabl=
e&#39;<br>
&gt; and check the frags to decide to delegate to tcp_recvmsg_devmem() or<b=
r>
&gt; something else. We can even assume not_readable =3D=3D devmem because<=
br>
&gt; currently devmem is the only type of unreadable frag currently.<br>
&gt; <br>
&gt; &gt; Unrelated: we probably need socket to dmabuf association as well =
(via<br>
&gt; &gt; netlink or something).<br>
&gt; <br>
&gt; Not sure this is possible. The dma-buf is bound to the rx-queue, and<b=
r>
&gt; any packets that land on that rx-queue are bound to that dma-buf,<br>
&gt; regardless of which socket that packet belongs to. So the association<=
br>
&gt; IMO must be rx-queue to dma-buf, not socket to dma-buf.<br>
<br>
But there is still always 1 dmabuf to 1 socket association (on rx), right?<=
br>
Because otherwise, there is no way currently to tell, at recvmsg, which<br>
dmabuf the received token belongs to.<br>
<br>
So why not have a separate control channel action to say: this socket fd<br=
>
is supposed to receive into this dmabuf fd? This action would put<br>
the socket into permanent &#39;MSG_SOCK_DEVMEM&#39; mode. Maybe you can als=
o<br>
put some checks at the lower level to to enforce this dmabuf<br>
association. (to avoid any potential issues with flow steering)<br>
<br>
We&#39;ll still have dmabuf to rx-queue association because of various reas=
ons..<br>
</blockquote></div></div>

--0000000000007cbbe40609840653--
