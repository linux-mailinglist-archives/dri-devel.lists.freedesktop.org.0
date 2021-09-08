Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065CB403D94
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4256E20B;
	Wed,  8 Sep 2021 16:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Wed, 08 Sep 2021 16:27:10 UTC
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AA96E20A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1631118428;
 bh=c8kx2mxaUtJP+F2gy9j6QJnBJzmkD8Gn3hp7HPUBAt4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gxLPLwDmO+ELpERfwF61Ad80eMKc2YEajh2OOxiDZ9m1gZKm6PL5wFRxn7hGPiNNA
 eMi2QLLPRrMGZtEeOIlJVWe6ZFQnSDNeXAO3u8uxHurQgWTX/STC2U5PxGDz8P1fhC
 r2oHxGjM1RNSxsMNkL2Py2ZMMo4Y6f9X7SlBZYUo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from reader ([5.2.69.50]) by smtp.web.de (mrweb002 [213.165.67.108])
 with ESMTPSA (Nemesis) id 0LyE3J-1n2l1M3Hqn-015aVF;
 Wed, 08 Sep 2021 18:21:27 +0200
Received: by reader (Postfix, from userid 1000)
 id AD5D62D18; Wed,  8 Sep 2021 18:21:12 +0200 (CEST)
Date: Wed, 8 Sep 2021 18:21:12 +0200
From: Dennis Filder <d.filder@web.de>
To: Sebastian Wick <sebastian@sebastianwick.net>,
 dri-devel@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <YTji+NWmLsluyV+1@reader>
Mail-Followup-To: Sebastian Wick <sebastian@sebastianwick.net>,
 dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>
References: <20210907155214.285b3561@eldfell>
 <0e9edc155c2621e607543316a0220312@sebastianwick.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e9edc155c2621e607543316a0220312@sebastianwick.net>
X-Provags-ID: V03:K1:o5mHPZ2Rf0ErXe9lPGUziIJLcdcgCdQJBgdl5yPOdKcGUd8DuW2
 wjU1+j7EAh7tOU+o0ID0ZwdUZS2mX8TZTRTa2YY+dwBaZfIIT9Q2BjVxNPWHvFGMD/vSzcD
 V4yV8tPtH7LqQnaB0US7vVijeStvwgNOBjesbxxHhhrssUEW4aMzaadyi7Xvs+aNLCfkEyr
 LL50Mz9yUBNiLsUTptzcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tzesSeHab8U=:GyNSkQLcJQK733UKwHcinP
 /+E8H7Unk2V4KAxteZ0IYISD/IjlBrFnwMSUtJ5wpo2vMGLoeAkqDvXUX8UizFvBmf78RwR17
 ZC05ZD5RwJo0SVTN0WJ/Td1nK2hGoLlahKkBmg9ut7RKwNDr4KXcf/Px8Hl0zjrfGiBzyLruW
 jrHr7jYRwvfgAjurrizX71Sv+RCCE6eB4oVzR7C4FsQN9Jo8cW7Jm0MK7cCXdD2TKJoKEJT0R
 7l6CpNendrxlaq+U6gVjIEPi+4y4XfygaAbkb7Lm3MrRXzLGNWVS5CvJfAOlqgb6aXbcuJ8es
 SDIDsixvNTDdvw9H4dZTRUpmfbQrUWgZ+4XISM6AM9CfvjGUu3mmHHwE5DSrr79UXPgRIy6ze
 9VyB3noTTcq7bvzQClh5oykFKlLS6NMa2VyIPXNsaglz2qZvZik+dnVIZQ8Owf5CrHwrv0xEy
 4IKeR8KelXA57UgjS2xCQ7GDH8fqprIBcPp5gi4fpE6mweMZiJx8OdSg+hWg9YHWbItDxHNwK
 aH1sShlB1xP4Ic5b9O8tlvUCX8LDkIDTKvnt96G/TpTE+OuehKa/c23x7NUym6011C0llpZI6
 Z8VgUdDTTJ3H/M19TxXLdE4zgODhrbfDq41WX7+SQKMUoLR60pg2TfGUT7mCif87u48uWFTSr
 7MEGv4Im/ARXHhq0bcdILbMvJuinZkn9ogPtGPYIQ352hV3ghULrItCYNKWHsRKP33b6VtbQu
 U+t+gySIGIgHamM0K8GK9fbvzbNjnczMs2hluHLdxDhXb5Yhu7DwZvPm80cvwymR8gH9IzMoE
 OidGX28EKPiSb/ZcSIx5mrImidzaxIF7bvADM1RnYDfKFngJ+hvOfjISYOwvvfKiL8baBczQM
 ElSblvUjsdsFI+qxJz7IO6U5JeSB6qtW/OwCeXsYC4rYG251cC8/fsepgY5sbwkPNAy/bJVxq
 2i91Q2rgyUhqYMGbD+lArT3w8rl9FtBpt/8Wgvwm78IIxQsFhiZmQsOkwBd0ggvodZ6QLhQFL
 sp0EhEGMIYMrUrZhmd3JiXoWZOk82Y5ihCpG98nvKfXBIkeroiYVhBosHJ5Iui/GIRvJFvtVG
 UXNlAZj3XuM5H0=
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

On Tue, Sep 07, 2021 at 05:52:41PM +0200, Sebastian Wick wrote:
> > On Tue, 07 Sep 2021 10:19:03 +0000
> > Simon Ser <contact at emersion.fr> wrote:
> >
> > > FWIW, I've just hit a case where a compositor leaves a "rotation" KM=
S
> > > prop set behind, then Xorg tries to startup and fails because it doe=
sn't
> > > reset this prop. So none of this is theoretical.
> > >
> > > I still think a "reset all KMS props to an arbitrary default value" =
flag
> > > in drmModeAtomicCommit is the best way forward. I'm not sure a user-=
space
> > > protocol would help too much.
> >
> > Hi Simon,
> >
> > for the "reset KMS state" problem, sure. Thanks for confirming the
> > problem, too.
> >
> > The hand-off problem does need userspace protocol though, so that the
> > two parties can negotiate what part of KMS state can be inherited by
> > the receiver and who will do the animation from the first to the secon=
d
> > state in case you want to avoid abrupt changes. It would also be usefu=
l
> > for a cross-fade as a perhaps more flexible way than the current "leak
> > an FB, let the next KMS client scrape it via ioctls and copy it so it
> > can be textured from".
>
> The state reset already is an implicit protocol. Another IPC mechanism
> however could extend it to work the other way around: instead of
> inheriting all the state and trying to transition from that to the
> second client's desired state the second client would send its own
> desired state back to the first (instead of applying it immediately)
> which would then try to transition from its own state to the second
> state (and if it can't you fall back to the implicit inherited state
> protocol). However, this is only an improvement if the first client
> knows how to do the transition and the second does not. All in all I
> doubt that you can convince most people to add this kind of complexity
> just for slightly higher chances of a good transition.
>
> The reset state protocol on the other hand solves real problems and
> gives you a good transition as long as the second client knows about the
> same properties as the previous one which usually is the case for the
> typical bootsplash->login manager->compositor chain.
>
> Maybe I'm completely missing how such a protocol would work though.

The idea was that since you would have to have some IPC mechanism in
user space anyway to quickly effect a flicker-free transition from
Plymouth to the display manager (since, as de Goede reiterates in the
other message, both processes must have the device already open and
call drmSetMaster/drmDropMaster coordinatedly) you might just as well
look for ways how it could be designed for the benefit of everyone.
Using "implicit protocols" for things like this is usually the go-to
way, not because it's good design, but because it is easy to
implement.  But these "implicit protocols" have a tendency to greatly
limit what can be done and to not be easily adaptable once the use
cases become more complicated or refined, and thus they force
contortions on everyone eventually.

How such a protocol could look?  I don't know.  Maybe some DBus
interface for a broker/multiplexer for shared devices that would keep
track of the current DRM master and tell any process interested in
obtaining it what process to talk to.  It could then contact it either
via DBus or over a separate socket, communicate its capabilities,
negotiate the modalities for the transition and acquire the necessary
resources in the form of file descriptors passed over DBus/the socket.
Then both processes could set themselves up for the transition and
effect it, which could involve e.g. unlocking a locked mutex/semaphore
in shared memory.  Alternatively, the donor could refuse the handover,
e.g. if a screen locker is configured to prohibit release of the
device.  Complexitywise the sky would be the limit, of course, but it
needn't be this complicated from the beginning.  An initial version of
such a protocol could be held just as simple as the status quo.

As for the point raised by Paalanen that implementing something like
this would require a lot of effort I must state that, while certainly
true, many of the things I mentioned here are already implemented
somehow somewhere.  Plymouth has a control socket and protocol with
which the state of the splash screen can be controlled from the
outside to make the transition to gdm smoother.  The xlease project
apparently was designed with the intent that DRM devices should be
leased (and subleased) out to processes, and cross-process
coordination would be governed this way.  The kmscon project also had
to come up with something to govern device access since it could no
longer piggy-back on the VT-API.  systemd-logind also draws up a
framework for governance over a shared device and how to tie them to
sessions/seats (with such peculiarities that you cannot auto-spawn a
getty on tty1 since that is "reserved" for Wayland).  Then there is
the VT console, and probably lots of other little things I don't even
know about.

All this effort is already being expended, and IMO it proves the need
for some way to gracefully coordinate access to shared devices that
offers more than what can be done with current "implicit protocols".
The community should consider acknowledging this need and trying to
answer the question what such a subsystem should and should not look
like.  Once the nature of the problem is understood better
implementational questions will become easier.

Regards.
