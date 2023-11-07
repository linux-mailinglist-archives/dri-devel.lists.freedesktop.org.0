Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A67E31EB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023A10E476;
	Tue,  7 Nov 2023 00:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E80E10E476
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:03:54 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-49dc95be8c3so1967478e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699315433; x=1699920233;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+k7O7fPsM7i2kvbi4Eehiz4lx1hbxjBD0ACtWEdTidQ=;
 b=2qneux0xQd4aLyLWSyzoYZPktUqBMGsSNv3DnSnnPFWDwMaiG6xzD8jDW81c8eUQSN
 gMz3bTs4yo90u6z9dfdkUwAzLzs9MGufUE5N+OqR1xfsZZ9+FKxuVpbfe2nFUVwgLy2U
 fZO1C3OxRcSZWeBafLW438gYdL4Kfv+S+ILYSkkuR615UAwgTBCPlfnT+Q6Eur/x3B/S
 p13gClg9BMysgq0Sff241krknYIuLL8FseCKyYfaBzqHltXzuclxfK3SuxeloDVvTi8Q
 QJz59AdHGmd2XqVAAHc6bI9AFHXUdEIDsfLNXs6/m35eanrzbbkzHXgYC4MfSkUsKRIa
 4bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315433; x=1699920233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+k7O7fPsM7i2kvbi4Eehiz4lx1hbxjBD0ACtWEdTidQ=;
 b=qEU8nLeDrFWu4vQmGF0Q+UzYWvMOcCMA4boSW2PVtffYFlZo8QSDEsqK3jPO/deq+b
 7F2j1hsBOvifyGLEjEy4vo4YwNUDxxESo8RHPEQl9eTlJE98544butCaoADwzp+9gjnS
 5zuNVVM7n/ySUtEdk5ubvH1vO5CLOoVDl4Bgm3iT4pITJ2rgvFUJdximl2P+5ROdklgG
 W7oeBwC6zAyflBtkBlOc6LkmsfgJO6tudiiHDXygofB9KgdK8v6I+XliMckEUIxwY++4
 aDMq8jtU1fppUhgDILQ8j070OM4BD7m4m+VOFtHip71T5ROoOBS9l8HHk0S6LY4dTmmn
 sCiw==
X-Gm-Message-State: AOJu0YzwPAYj62D0VpfThahJ/dLKNyYpueod/KiatiExWaLebgqhRAUt
 Y0AIACrpD8XmgcAGE8pGfqocGvWyS39XiQCA8l2tpQ==
X-Google-Smtp-Source: AGHT+IEtcpOYvpwzR5ghgo79gr1DGe6ofXaayePQzxg8gI82zeZvTQdm2jCfdPUEIBnZJalKkVVzL1oy5qF5cdYsa+A=
X-Received: by 2002:a1f:aa15:0:b0:4a8:4218:7b90 with SMTP id
 t21-20020a1faa15000000b004a842187b90mr19912346vke.9.1699315433224; Mon, 06
 Nov 2023 16:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <00883386-0c4b-4ba7-84c6-553f468304e6@kernel.org>
In-Reply-To: <00883386-0c4b-4ba7-84c6-553f468304e6@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 6 Nov 2023 16:03:39 -0800
Message-ID: <CAHS8izN3k+x4W19cRv=DyEuJewGKUxVwobQgSZOLEDh3wDcyVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
To: David Ahern <dsahern@kernel.org>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 3:37=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 11/6/23 3:18 PM, Mina Almasry wrote:
> >>>>>> @@ -991,7 +993,7 @@ struct sk_buff {
> >>>>>>  #if IS_ENABLED(CONFIG_IP_SCTP)
> >>>>>>      __u8                    csum_not_inet:1;
> >>>>>>  #endif
> >>>>>> -
> >>>>>> +    __u8                    devmem:1;
> >>>>>>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
> >>>>>>      __u16                   tc_index;       /* traffic control in=
dex */
> >>>>>>  #endif
> >>>>>> @@ -1766,6 +1768,12 @@ static inline void skb_zcopy_downgrade_mana=
ged(struct sk_buff *skb)
> >>>>>>              __skb_zcopy_downgrade_managed(skb);
> >>>>>>  }
> >>>>>>
> >>>>>> +/* Return true if frags in this skb are not readable by the host.=
 */
> >>>>>> +static inline bool skb_frags_not_readable(const struct sk_buff *s=
kb)
> >>>>>> +{
> >>>>>> +    return skb->devmem;
> >>>>>
> >>>>> bikeshedding: should we also rename 'devmem' sk_buff flag to 'not_r=
eadable'?
> >>>>> It better communicates the fact that the stack shouldn't dereferenc=
e the
> >>>>> frags (because it has 'devmem' fragments or for some other potentia=
l
> >>>>> future reason).
> >>>>
> >>>> +1.
> >>>>
> >>>> Also, the flag on the skb is an optimization - a high level signal t=
hat
> >>>> one or more frags is in unreadable memory. There is no requirement t=
hat
> >>>> all of the frags are in the same memory type.
> >>
> >> David: maybe there should be such a requirement (that they all are
> >> unreadable)? Might be easier to support initially; we can relax later
> >> on.
> >>
> >
> > Currently devmem =3D=3D not_readable, and the restriction is that all t=
he
> > frags in the same skb must be either all readable or all unreadable
> > (all devmem or all non-devmem).
>
> What requires that restriction? In all of the uses of skb->devmem and
> skb_frags_not_readable() what matters is if any frag is not readable,
> then frag list walk or collapse is avoided.
>
>

Currently only tcp_recvmsg_devmem(), I think. tcp_recvmsg_locked()
delegates to tcp_recvmsg_devmem() if skb->devmem, and
tcp_recvmsg_devmem() net_err's if it finds a non-iov frag in the skb.
This is done for some simplicity, because iov's are given to the user
via cmsg, but pages are copied into the linear buffer. I think it
would be confusing for the user if we simultaneously copied some data
to the linear buffer and gave them a devmem cmsgs in the same
recvmsg() call.

So, my simplicity is:

1. in a single skb, all frags must be devmem or non-devmem, no mixing.
2. In a single recvmsg() call, we only process devmem or non-devmem
skbs, no mixing.

--=20
Thanks,
Mina
