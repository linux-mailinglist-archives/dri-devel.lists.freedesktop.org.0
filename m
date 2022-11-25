Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BCC638E59
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 17:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE88010E12A;
	Fri, 25 Nov 2022 16:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F010E111
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 16:40:07 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id z6so2812997qtv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 08:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=M7vbIwl+/fvLQH2FFFO+pS8hv/f21DHk1Zk9oQnQSyg=;
 b=baCMPYRiGmv4nNjq0fISCCMILHJoCecvFoDJbM4uWRU/YmEDafEV6kcgM4L3vE/oBp
 KpodMp0IhnUahSEKrf7NLXAIipZo5D+3wsePZJmaDt1K+jAyQv1XEXnGXTjGKpU3XOT2
 8m31mL5YdkWGV/VZ339G1x3ZRUWLHfnu54MT7jwOvzohpR6NHexBG2cRh69Lq8OJKOST
 4KtMsf8AvGg4JTnc6Svyt9pWa8UzqmvceUaerMia9BoCaLi3HULwDCbZ0sy6n07LKX5U
 /hX4PvRnd9nD5zX+DDrpcodRUroRTuFSXm1knSWZ0Nx7Z1igEtNQWB87MBw9jiyodEPc
 +6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M7vbIwl+/fvLQH2FFFO+pS8hv/f21DHk1Zk9oQnQSyg=;
 b=VlXjtxYbct2nKyMde+9HHAWBbHYVAVTZaXiYHLsG8dH7MAsr/B0TpXV/J/2jYHOiGq
 NewOM0AUPgRQ3A2A2SYrSMu2kYgtGar255VB9OUjN3wUKOVmT31ygJJpIxvQxn4Ppv6w
 U22c6ikzV6UHQ1u3JdOEbJGIdfh0rQuZU/z1C3nktu796dKvRG019/8GqgXrgVN+i0nZ
 DvQ4853LS5QaTRFkIC/8gGM4XfLFPSp5A7T8xp3QXqgv0MhMC238dI5Pzzmj5sCl7Cxg
 4xKZ7nsAjHPMOjwWsLRFwjfFKd+rYy5jaDh2Z1hMotPptJh5ofc2+aN7+xur0DPrAZQG
 oQZA==
X-Gm-Message-State: ANoB5pmH4qFyGom1rpV9ppXR5I5SgdJNvmcaPVNsTgzKPlugAXAund5a
 /36NdzJL3S5bFi767OaRZUIxIw==
X-Google-Smtp-Source: AA0mqf5GX0lNZDIsHrQa5Zn2FHtDVn1hNwF7Y79T83y4UcicdENZlRS6zqIBovKjG9S4bPGe3Mteag==
X-Received: by 2002:a05:622a:4d4e:b0:39a:78d4:57e with SMTP id
 fe14-20020a05622a4d4e00b0039a78d4057emr21097351qtb.118.1669394406051; 
 Fri, 25 Nov 2022 08:40:06 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 k12-20020a05620a414c00b006fa22f0494bsm3071540qko.117.2022.11.25.08.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:40:05 -0800 (PST)
Message-ID: <ba6e42f04c436d93bfa71d5dee7fd35ef2245073.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
Date: Fri, 25 Nov 2022 11:40:04 -0500
In-Reply-To: <Y35LcspZ385IC4lJ@phenom.ffwll.local>
References: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
 <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
 <20221123103338.238571e1@eldfell> <Y35LcspZ385IC4lJ@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
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
Cc: linux-media@vger.kernel.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 23 novembre 2022 =C3=A0 17:33 +0100, Daniel Vetter a =C3=A9crit=
=C2=A0:
> On Wed, Nov 23, 2022 at 10:33:38AM +0200, Pekka Paalanen wrote:
> > On Tue, 22 Nov 2022 18:33:59 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >=20
> > > We should have come up with dma-heaps earlier and make it clear that=
=20
> > > exporting a DMA-buf from a device gives you something device specific=
=20
> > > which might or might not work with others.
> > >=20
> > > Apart from that I agree, DMA-buf should be capable of handling this.=
=20
> > > Question left is what documentation is missing to make it clear how=
=20
> > > things are supposed to work?
> >=20
> > Perhaps somewhat related from Daniel Stone that seems to have been
> > forgotten:
> > https://lore.kernel.org/dri-devel/20210905122742.86029-1-daniels@collab=
ora.com/
> >=20
> > It aimed mostly at userspace, but sounds to me like the coherency stuff
> > could use a section of its own there?
>=20
> Hm yeah it would be great to land that and then eventually extend. Daniel=
?

There is a lot of things documented in this document that have been said to=
 be
completely wrong user-space behaviour in this thread. But it seems to pre-d=
ate
the DMA Heaps. The document also assume that DMA Heaps completely solves th=
e CMA
vs system memory issue. But it also underline a very important aspect, that
userland is not aware which one to use. What this document suggest though s=
eems
more realist then what has been said here.

Its overall a great document, it unfortunate that it only makes it into the=
 DRM
mailing list.

Nicolas
