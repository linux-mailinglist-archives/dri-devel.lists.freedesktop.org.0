Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D5459F4F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 10:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725696EBAC;
	Tue, 23 Nov 2021 09:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B614C6EBAC;
 Tue, 23 Nov 2021 09:32:32 +0000 (UTC)
Date: Tue, 23 Nov 2021 09:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1637659949;
 bh=WaYv4Vo1ied5Can2vStLBRqq5qJ8vzsHC41nroVCbKU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=mF2LsX4wZDisixKtW1bcOAJTHf0WjPG91SzlHISEtGuZGk1Cn8biO9ZokaN192Yz8
 BzOP9TotglL3KB6ghzW169xRSIpHRdWqu4RtCay7x6PYP5SI2K3qFivh/bRVx5qGHv
 /mBYvwXmxvkXueWSArOCQrcblEfT1hnRsuTk08NfJ8YqaXEE/RwMIqM5APRvvfsmHz
 Rctozj430tUUIcsMyBcIOgeY2daYHpj9S7GV1zVdYPa0/Tqx8ydyhdZZEXDk3+gdj3
 5f+BQCmZAUVfr/EtsUINCrt9+kkMZWWFG2J9UIjBWseWwcTz4YRxMInK4sb7XDjQuF
 JQjv+Fr35uKEw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs,
 selftest with it - RFC
Message-ID: <-PHBNsA2s0YNaFjE_76_aCTSMbqUpcaqbttDKFOZv0n9VRShPsgC8NDHq_S8KCpNbE32E9LRrw7CHb3pgFzgg99jFb0DX59vpcPVODkYe4Y=@emersion.fr>
In-Reply-To: <20211123104522.7a336773@eldfell>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211116104631.195cbd0b@eldfell>
 <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
 <20211118172401.0b4d722e@eldfell>
 <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
 <20211122110208.528e1d80@eldfell>
 <CAJfuBxyFzA++2JUxLY-6yLqmrETbmsWpTiyJH5w1qKiAkMriNw@mail.gmail.com>
 <20211123104522.7a336773@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: quic_saipraka@quicinc.com, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Will Deacon <will@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, jim.cromie@gmail.com,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 quic_psodagud@quicinc.com, maz@kernel.org, mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First off, let me reiterate that this feature would be invaluable as user-s=
pace
developers. It's often pretty difficult to figure out the cause of an EINVA=
L,
we have to ask users to follow complicated instructions [1] to grab DRM log=
s.
Then have to skim through several megabytes of logs to find the error.

I have a hack [2] which just calls system("sudo dmesg") after a failed atom=
ic
commit, it's been pretty handy. But it's really just a hack, a proper solut=
ion
would be awesome.

[1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/wikis/DRM-Debugging
[2]: https://gitlab.freedesktop.org/emersion/libliftoff/-/merge_requests/61

> > > > Having a subsystem specific trace buffer would allow subsystem spec=
ific
> > > > trace log permissions depending on the sensitivity of the data. But
> > > > doesn't drm output today go to the system log which is typically wo=
rld
> > > > readable today?

dmesg isn't world-readable these days, it's been changed recently-ish (last
year?) at least on my distribution (Arch). I need root to grab dmesg.

(Maybe we can we just let the DRM master process grab the logs?)

> > > Yes, and that is exactly the problem. The DRM debug output is so high
> > > traffic it would make the system log both unusable due to cruft and
> > > slow down the whole machine. The debug output is only useful when
> > > something went wrong, and at that point it is too late to enable
> > > debugging. That's why a flight recorder with an over-written circular
> > > in-memory buffer is needed.
> >
> > Seans patch reuses enum drm_debug_category to split the tracing
> > stream into 10 sub-streams
> > - how much traffic from each ?
> > - are some sub-streams more valuable for post-mortem ?
> > - any value from further refinement of categories ?
> > - drop irrelevant callsites individually to reduce clutter, extend
> > buffer time/space ?
>
> I think it's hard to predict which sub-streams you are going to need
> before you have a bug to debug. Hence I would err on the side of
> enabling too much. This also means that better or more refined
> categorisation might not be that much of help - or if it is, then are
> the excluded debug messages worth having in the kernel to begin with.
> Well, we're probably not that interested in GPU debugs but just
> everything related to the KMS side, which on the existing categories
> is... everything except half of CORE and DRIVER, maybe? Not sure.

We've been recommending drm.debug=3D0x19F so far (see wiki linked above).
KMS + PRIME + ATOMIC + LEASE is definitely something we want in, and
CORE + DRIVER contains other useful info. We definitely don't want VBL.

> My feeling is that that could mean in the order of hundreds of log
> events at framerate (e.g. 60 times per second) per each enabled output
> individually. And per DRM device, of course. This is with the
> uninteresting GPU debugs already excluded.

Indeed, successful KMS atomic commits already generate a lot of noise. On m=
y
machine, setting drm.debug=3D0x19F and running the following command:

    sudo dmesg -w | pv >/dev/null

I get 400KiB/s when idling, and 850KiB/s when wiggling the cursor.

> Still, I don't think the flight recorder buffer would need to be
> massive. I suspect it would be enough to hold a few frames' worth which
> is just a split second under active operation. When something happens,
> the userspace stack is likely going to stop on its tracks immediately
> to collect the debug information, which means the flooding should pause
> and the relevant messages don't get overwritten before we get them. In
> a multi-seat system where each device is controlled by a separate
> display server instance, per-device logs would help with this. OTOH,
> multi-seat is not a very common use case I suppose.

There's also the case of multi-GPU where GPU B's logs could clutter GPU A's=
,
making it harder to understand the cause of an atomic commit failure on GPU=
 A.
So per-device logs would be useful, but not a hard requirement for me, havi=
ng
*anything* at all would already be a big win.

In my experiments linked above [2], system("sudo dmesg") after atomic commi=
t
failure worked pretty well, and the bottom of the log contained the cause o=
f
the failure. It was pretty useful to system("sudo dmesg -C") before perform=
ing
an atomic commit, to be able to only collect the extract of the log relevan=
t to
the atomic commit.

Having some kind of "marker" mechanism could be pretty cool. "Mark" the log
stream before performing an atomic commit (ideally that'd just return e.g. =
an
uint64 offset), then on failure request the logs collected after that mark.
