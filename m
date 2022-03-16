Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDB4DACD0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 09:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2CA10E369;
	Wed, 16 Mar 2022 08:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9B710E263;
 Wed, 16 Mar 2022 08:48:28 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id u3so2237464ljd.0;
 Wed, 16 Mar 2022 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=18IE4cT0TFpQlP5iToTrhHyA6k73arzu8vXbyCqgpdg=;
 b=XKoUPLV6RlbGcreozvXdE58YaeC1xXjfI1x3WvmtJZiRtu3KeDfvXfvs9rC+eTw8ph
 qJ0mBPeK/zCrFojaZCGaupfBAdony0Wm55T4b1Vve4TEjTnsjAVXQoAki7ExhngvtnqK
 Dl2rF+TOLPEJ2Bi84jCDAXo43RmmsBmG0BrHdyoO/Y9tXoVm0SenASzz8x2PsVS8XYED
 kkcvA2YV2qcDdG2gwzFx0XkG1O2lwfoFPEN7laIPpjUMAFx+6zVYmeJkivgE5zbRiDNL
 1tM7SFF9j++FAAnsyqmb7ZDN4h4kE1Ro0+272Io8z2zUIoAv7gdfK0B7pe+eugHRQAVX
 I+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=18IE4cT0TFpQlP5iToTrhHyA6k73arzu8vXbyCqgpdg=;
 b=Mh/MoY393QLJGVLw21l09uQ3NAtvfv3lpO9TMm69ZYnjlaFD/d95NW8q9Yv8w5h5H1
 L7bDEWa0ayBRuBjb1+YPnIqjQgW7BAAl0goUotTLWe/yeF8vFAkOMlVI6cbeHdpr4Uvd
 PzoJy3ELKwKK6QDTDeZEjC5cqL7DzmEAmTgCxAU6q0niCsLezGWZ7rw9ROvMln+KXDzy
 XDUGo/b3wSf+Sq1vXkJCtQyHRvnX6Ep5FvMeH63g1PCEiE7v8VPfV0p/06O8f63nTlTa
 kh8r4PT7rktxiybmq4YBM+rx9n1u0k9tfb5Ba1AAPQDWTPgiWJz2O43YQQ9X7WFjnKhe
 yVTA==
X-Gm-Message-State: AOAM533CuhTSAdcR4K1mV5jWgobkdlI5YA+crjq4zZMiUbTm3LsA5bJn
 tCXRIlQl/dzIkJhCgW0eNLU=
X-Google-Smtp-Source: ABdhPJxaHe1NtDqow5uJ7vbbFXJQx/4V+sV9UjJJ/Z9Uz3ptc64y+YT0nWNIKbOJKHXkBT30tFVzRw==
X-Received: by 2002:a05:651c:50a:b0:246:74cb:2222 with SMTP id
 o10-20020a05651c050a00b0024674cb2222mr20600484ljp.484.1647420506649; 
 Wed, 16 Mar 2022 01:48:26 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v17-20020a2ea451000000b00247e30b50dfsm121797ljn.107.2022.03.16.01.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 01:48:26 -0700 (PDT)
Date: Wed, 16 Mar 2022 10:48:15 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <20220316104815.11ec2e6c@eldfell>
In-Reply-To: <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N2t+1=JLZxMZ8L=Au/icOww";
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Christian =?UTF-8?B?S8O2?= =?UTF-8?B?bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/N2t+1=JLZxMZ8L=Au/icOww
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Mar 2022 10:54:38 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Mon, Mar 14, 2022 at 11:26 AM Pekka Paalanen <ppaalanen@gmail.com> wro=
te:
> >
> > On Mon, 14 Mar 2022 10:23:27 -0400
> > Alex Deucher <alexdeucher@gmail.com> wrote:
> > =20
> > > On Fri, Mar 11, 2022 at 3:30 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > >
> > > > On Thu, 10 Mar 2022 11:56:41 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > =20
> > > > > For something like just notifying a compositor that a gpu crash
> > > > > happened, perhaps drm_event is more suitable.  See
> > > > > virtio_gpu_fence_event_create() for an example of adding new event
> > > > > types.  Although maybe you want it to be an event which is not de=
vice
> > > > > specific.  This isn't so much of a debugging use-case as simply
> > > > > notification. =20
> > > >
> > > > Hi,
> > > >
> > > > for this particular use case, are we now talking about the display
> > > > device (KMS) crashing or the rendering device (OpenGL/Vulkan) crash=
ing?
> > > >
> > > > If the former, I wasn't aware that display device crashes are a thi=
ng.
> > > > How should a userspace display server react to those?
> > > >
> > > > If the latter, don't we have EGL extensions or Vulkan API already to
> > > > deliver that?
> > > >
> > > > The above would be about device crashes that directly affect the
> > > > display server. Is that the use case in mind here, or is it instead
> > > > about notifying the display server that some application has caused=
 a
> > > > driver/hardware crash? If the latter, how should a display server r=
eact
> > > > to that? Disconnect the application?
> > > >
> > > > Shashank, what is the actual use case you are developing this for?
> > > >
> > > > I've read all the emails here so far, and I don't recall seeing it
> > > > explained.
> > > > =20
> > >
> > > The idea is that a support daemon or compositor would listen for GPU
> > > reset notifications and do something useful with them (kill the guilty
> > > app, restart the desktop environment, etc.).  Today when the GPU
> > > resets, most applications just continue assuming nothing is wrong,
> > > meanwhile the GPU has stopped accepting work until the apps re-init
> > > their context so all of their command submissions just get rejected.
> > > =20
> > > > Btw. somewhat relatedly, there has been work aiming to allow
> > > > graceful hot-unplug of DRM devices. There is a kernel doc outlining=
 how
> > > > the various APIs should react towards userspace when a DRM device
> > > > suddenly disappears. That seems to have some overlap here IMO.
> > > >
> > > > See https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#device=
-hot-unplug
> > > > which also has a couple pointers to EGL and Vulkan APIs. =20
> > >
> > > The problem is most applications don't use the GL or VK robustness
> > > APIs. =20
> >
> > Hi,
> >
> > how would this new event help with that? =20
>=20
> This event would provide notification that a GPU reset occurred.
>=20
> >
> > I mean, yeah, there could be a daemon that kills those GPU users, but
> > then what? You still lose any unsaved work, and may need to manually
> > restart them.
> >
> > Is the idea that it is better to have the app crash and disappear than
> > to look like it froze while it otherwise still runs? =20
>=20
> Yes.

Ok. That was just a wild guess.

>  The daemon could also send the user some sort of notification
> that a GPU reset occurred.
>=20
> >
> > If some daemon or compositor goes killing apps that trigger GPU resets,
> > then how do we stop that for an app that actually does use the
> > appropriate EGL or Vulkan APIs to detect and remedy that situation
> > itself? =20
>=20
> I guess the daemon could keep some sort of whitelist.  OTOH, very few
> if any applications, especially games actually support these
> extensions.

I would think that a white-list is a non-starter due to the maintenance
nightmare and the "wrong by default" design for well behaving programs.

I am not a fan of optimising for broken software. I understand that
with games this is routine, but we're talking about everything here,
not just games. Games cannot be fixed, but the rest could if the
problem was not sweeped under the rug. It's like the inverse of the
platform problem.

> > >  You could use something like that in the compositor, but those
> > > APIs tend to be focused more on the application itself rather than the
> > > GPU in general.  E.g., Is my context lost.  Which is fine for
> > > restarting your context, but doesn't really help if you want to try
> > > and do something with another application (i.e., the likely guilty
> > > app).  Also, on dGPU at least, when you reset the GPU, vram is usually
> > > lost (either due to the memory controller being reset, or vram being
> > > zero'd on init due to ECC support), so even if you are not the guilty
> > > process, in that case you'd need to re-init your context anyway. =20
> >
> > Why should something like a compositor listen for this and kill apps
> > that triggered GPU resets, instead of e.g. Mesa noticing that in the app
> > and killing itself? Mesa in the app would know if robustness API is
> > being used. =20
>=20
> That's another possibility, but it doesn't handle the case where the
> compositor doesn't support any sort of robustness extension so if the
> GPU was reset, you'd lose your desktop anyway even if the app kept
> running.

Why does that matter?

A GPU reset happens when it happens. If a compositor does not use
robustness extensions, it's as good as dead anyway, right?

Killing a compositor from inside in Mesa if it doesn't use robustness
might be better than leaving the compositor running blind - assuming
the compositor does not quit itself after seeing crucial EGL/Vulkan
calls failing.

> >
> > Would be really nice to have the answers to all these questions to be
> > collected and reiterated in the next version of this proposal. =20
>=20
> The idea is to provide the notification of a GPU reset.  What the
> various desktop environments or daemons do with it is up to them.  I
> still think there is value in a notification even if you don't kill
> apps or anything like that.  E.g., you can have a daemon running that
> gets notified and logs the error, collects debug info, sends an email,
> etc.

With new UAPI comes the demand of userspace proof, not hand-waving. You
would not be proposing this new interface if you didn't have use cases
in mind, even just one. You have to document what you imagine the new
thing to be used for, so that the appropriateness can be evaluated. If
the use case is deemed inappropriate for the proposed UAPI, you need to
find another use case to justify adding the new UAPI. If there is no
use for the UAPI, it shouldn't be added, right? Adding UAPI and hoping
someone finds use for it seems backwards to me.


Thanks,
pq

--Sig_/N2t+1=JLZxMZ8L=Au/icOww
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIxpE8ACgkQI1/ltBGq
qqdLtQ//Zn2UMLSQrlzICuqDdsi5+LpTdcT5ztwL2/8/451QHYzd6V3B0YkRf7K8
mC5tRgHImFxxB1mXWBl+TtvBxBx02Ik3P8Y84srwn2B9/tGREr/eL2Ho2uVcN6Hs
+qQ0SITTJqL+n1wJ1JgIgB2m7OkeOP+p0o2sWiDEecNcbRr46wkU7ySL2cN5Kdem
+3DQ4L2nDibWFw6zih1Qvp2sjaJx45K8ARvWGedwIhLSbigxKHvzh2Xf5MXZGjq/
1phYfH076ujLx+K1nmbNntGMT2EAW4+5w2TuteCUv7cJ1xdUbKZvuXi7dWbLyehm
vyvAKDLybN2imz2iVeLqfK1m89eOksg0rTS2cJj01vvK1KTsMpU6E3TefqFyca5P
92W/THSIGFXk0gSZl3ep3yXUDgjCmK0qAyC0IidYWLV3g8Nd2vZj4Zu8VJRoSQ4t
uMCVGtXpjQXLvnSdJsRMUqSWxw7CQ+VOsnTPSFI/B0kEa1rNGfecUUve8QHdheZA
y98NTLu9yD94kTvDI+KJ1TUHQ8aHGJcCGgpwqdnbUMV/fwX7wSbulSu/WV4whnGi
+zfwPtfG/KIFuci8AhYzIOqnJZFwkHapAmUb1Sj1BkZz2gbK2hbprxPhY5okn/1K
adn6FdHQRDQm9ZW/l+z88+yxqJssauwMcgf/WNXdZl4COHxklmE=
=QbSS
-----END PGP SIGNATURE-----

--Sig_/N2t+1=JLZxMZ8L=Au/icOww--
