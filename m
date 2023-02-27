Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EE6A3E75
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8322610E397;
	Mon, 27 Feb 2023 09:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5F410E397;
 Mon, 27 Feb 2023 09:34:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bp25so7739580lfb.0;
 Mon, 27 Feb 2023 01:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KdN6ISH1ECTOoz4cWXA2BXlXONjcORHaPFYKRa+pVyA=;
 b=L85+1UTI/bqDulPb23afcqDavr5yNobNtYxm4ZdplhrWFGrVlJbWQbfDO4czw1TgMp
 SNS5DvF7YuC3ZJIiPAWrS2X/VpHd+m2TRZchPA84PxRCgbT2tK0hte8+iOKWSfxgBJqa
 C9uzw1+uYQZ+rx+35OSUeR5j3Y+mCdSK4cr+vLQ/g68JwGuGS6cw3fMsGpIhu8GI7HTt
 zHgq7th6BWUw60ENh/SmZ3NsWwdRaI1uLD2uPUAebsuDjbPLEVlrP8JKtEkhF2+mygP/
 KrvM4VMZMGYzZz0+r0zonYOAakUAieHGpOXR+/zCmi3Fr37+fjtZgi7Cr+5ACt9Ca+cf
 /kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KdN6ISH1ECTOoz4cWXA2BXlXONjcORHaPFYKRa+pVyA=;
 b=MvKVsOv1sMP7IO6IKRFz8sFXtw6Vldj52U8JYBtmtYTqZK8NyfEs5/T755VLmprSth
 X+K3n3FBsI5+O7p67XuWZJyTzMNF6pcI0vRdlx7/I4il4IHTQLjfZ8FzewcKvDcx/Lyw
 VRwHLDAhuFHMXCl3U1Y9fGiKEyglxOgkp8xVOA+hXmn2uCcCCVdp4h+qiWNEmNsj9VRt
 hCwM2xjxPZSEEHt/3cg17ohCTvwuTIRTbflsDxM26pR3/GL12oIaAdYj4GWhCuuL84i/
 evyrIDOpdroIFgHUsCZkvpDDiVfnAQYS5eo7br+KsWfOYAkEpfHPfc3JyTU6GS8w/LIy
 QjCA==
X-Gm-Message-State: AO0yUKU8m9fhiqyemP3JhivEhyJJ28g64sdzH6AIWaS9U+yimJNyldZs
 qPoT/cxYVcuU9ZGYIIEGphs=
X-Google-Smtp-Source: AK7set+TTEk+rTlGT07RNeOlX4uO9/xvaUmqXHyMNIbwHb3f/UK95NiScmCiP68viFtD2y7XS0dkrw==
X-Received: by 2002:a19:7505:0:b0:4dd:9fd8:3a36 with SMTP id
 y5-20020a197505000000b004dd9fd83a36mr5201386lfe.1.1677490476230; 
 Mon, 27 Feb 2023 01:34:36 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w8-20020a05651204c800b004dc7fae3cfcsm844398lfq.75.2023.02.27.01.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 01:34:35 -0800 (PST)
Date: Mon, 27 Feb 2023 11:34:21 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Message-ID: <20230227113421.6e31b54d@eldfell>
In-Reply-To: <CAF6AEGsu666v9iOy2H20-JNkzi4Av0+OtrLBo_3CjRGByUPD0A@mail.gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
 <CAF6AEGs1_75gg+LCBj6=PH8Jn60PXiE+Kx_2636nP-+pajN8Hg@mail.gmail.com>
 <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <CAF6AEGsu666v9iOy2H20-JNkzi4Av0+OtrLBo_3CjRGByUPD0A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y/v=qEY7+AcackZUaMNyVcp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, "open list:SYNC FILE
 FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Y/v=qEY7+AcackZUaMNyVcp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Feb 2023 11:44:53 -0800
Rob Clark <robdclark@gmail.com> wrote:

> On Fri, Feb 24, 2023 at 2:24 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Fri, 24 Feb 2023 09:41:46 +0000
> > Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > =20
> > > On 24/02/2023 09:26, Pekka Paalanen wrote: =20
> > > > On Thu, 23 Feb 2023 10:51:48 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > =20
> > > >> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.co=
m> wrote: =20
> > > >>>
> > > >>> On Wed, 22 Feb 2023 07:37:26 -0800
> > > >>> Rob Clark <robdclark@gmail.com> wrote:
> > > >>> =20
> > > >>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.=
com> wrote: =20
> > > >
> > > > ...
> > > > =20
> > > >>>>> On another matter, if the application uses SET_DEADLINE with one
> > > >>>>> timestamp, and the compositor uses SET_DEADLINE on the same thi=
ng with
> > > >>>>> another timestamp, what should happen? =20
> > > >>>>
> > > >>>> The expectation is that many deadline hints can be set on a fenc=
e.
> > > >>>> The fence signaller should track the soonest deadline. =20
> > > >>>
> > > >>> You need to document that as UAPI, since it is observable to user=
space.
> > > >>> It would be bad if drivers or subsystems would differ in behaviou=
r.
> > > >>> =20
> > > >>
> > > >> It is in the end a hint.  It is about giving the driver more
> > > >> information so that it can make better choices.  But the driver is
> > > >> even free to ignore it.  So maybe "expectation" is too strong of a
> > > >> word.  Rather, any other behavior doesn't really make sense.  But =
it
> > > >> could end up being dictated by how the hw and/or fw works. =20
> > > >
> > > > It will stop being a hint once it has been implemented and used in =
the
> > > > wild long enough. The kernel userspace regression rules make sure of
> > > > that. =20
> > >
> > > Yeah, tricky and maybe a gray area in this case. I think we eluded
> > > elsewhere in the thread that renaming the thing might be an option.
> > >
> > > So maybe instead of deadline, which is a very strong word, use someth=
ing
> > > along the lines of "present time hint", or "signalled time hint"? May=
be
> > > reads clumsy. Just throwing some ideas for a start. =20
> >
> > You can try, but I fear that if it ever changes behaviour and
> > someone notices that, it's labelled as a kernel regression. I don't
> > think documentation has ever been the authoritative definition of UABI
> > in Linux, it just guides drivers and userspace towards a common
> > understanding and common usage patterns.
> >
> > So even if the UABI contract is not documented (ugh), you need to be
> > prepared to set the UABI contract through kernel implementation.
> >
> > If you do not document the UABI contract, then different drivers are
> > likely to implement it differently, leading to differing behaviour.
> > Also userspace will invent wild ways to abuse the UABI if there is no
> > documentation guiding it on proper use. If userspace or end users
> > observe different behaviour, that's bad even if it's not a regression.
> >
> > I don't like the situation either, but it is what it is. UABI stability
> > trumps everything regardless of whether it was documented or not.
> >
> > I bet userspace is going to use this as a "make it faster, make it
> > hotter" button. I would not be surprised if someone wrote a LD_PRELOAD
> > library that stamps any and all fences with an expired deadline to
> > just squeeze out a little more through some weird side-effect. =20
>=20
> Userspace already has various (driver specific) debugfs/sysfs that it
> can use if it wants to make it hotter and drain batteries faster, so
> I'm not seeing a strong need to cater to the "turn it up to eleven"
> crowd here.  And really your point feels like a good reason to _not_
> document this as anything more than a hint.

My point is that no matter what you say in documentation or leave
unsaid, people can and will abuse this by the behaviour it provides
anyway, like every other UABI.

So why not just document what it is supposed to do? It cannot get any
worse. Maybe you get lucky instead and people don't abuse it that much
if they read the docs.

E.g. can it affect GPU job scheduling, can it affect GPU clocks, can it
affect power consumption, and so on.

> Back in the real world, mobile games are already well aware of the fps
> vs battery-life (and therefore gameplay) tradeoff.  But what is
> missing is a way to inform the kernel of userspace's intentions, so
> that gpu dvfs can make intelligent decisions.  This series is meant to
> bridge that gap.

Then document that. As long as you document it properly: what you
expect it to be used for and how.

Or if this is reserved strictly for Mesa drivers, then document that.

You can also stop CC'ing me if you don't want attention to UABI docs. I
don't read dri-devel@ unless I'm explicitly CC'd nowadays.


Thanks,
pq

--Sig_/Y/v=qEY7+AcackZUaMNyVcp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP8eR0ACgkQI1/ltBGq
qqeRhA/+PoC4QNVf4EfGWRdLdkADJL2lKpF3Wtih+/IEBONjWjGySN+uzHnDevqh
8W2KiV1mC5QNncs/Ako4+u2Op0g5u+RWt+Ny5nU2oQ4cmi40E5axoh/8+h69P+BG
nByhRgb4z1HrD2VQSdtrDOqbHzWHSknw/nvVu9ZObWqTUs5NrbTUT3RKZFHKhcpP
0LeM+IBv6YuCMH1lnjhxiK75z9CqZH3c95VfdW0Oi0rHtU/d0pM62QPUkckA3vZh
o8DiXubBKBiwrGNj2Di16yxpNJEF9Cz0MTnIs3UbjHdjMhBO8pxkoGpKdNIMOsW8
NP6Ur/Ztxs+Hypa73ljD92g235Dd4TpeR9btRxVqlMuVfFRFaCStjEAIA+WMPo2e
8qAVgFzV/hCUL5t44fmtCEOcfTFs4+5sC7GniF7tiuoY+1ToTn+xFyIkT/9/65cn
wXBxN+T0zMioOMx7aaEgJ4IWyWOlllcyr1RUXxB3p2gJY3t7iius2dr/tnGV59a7
hzW6zwFIczX/zv9huV+qWD94JVoXNu6sLETmruM/tPY5ACjtt0+f4fCOiWP7lgXt
/YZY/eRkXoNoP0hIFB4qwdvML3MaUogpgKM1CI4kiYkE6ekfDf5yNmz1BJRpb7bR
BFa0/sGZBrxf6r4Zr6w48ZW/BfZnkrienbL7rmWArIJGyP1sSzU=
=Jrc/
-----END PGP SIGNATURE-----

--Sig_/Y/v=qEY7+AcackZUaMNyVcp--
