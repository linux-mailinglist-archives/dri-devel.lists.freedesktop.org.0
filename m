Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E846B5E2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B09AA556;
	Tue,  7 Dec 2021 08:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 562 seconds by postgrey-1.36 at gabe;
 Tue, 07 Dec 2021 03:25:54 UTC
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F7C736C7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 03:25:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 76D0D2B000FE;
 Mon,  6 Dec 2021 22:16:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 06 Dec 2021 22:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=K
 DwpeRiMBZ51a/1N537G6MpuhOZKtEbUes449q2dxHA=; b=aMSVqlTgdlw0z4qzM
 jhsxSmzCok04+3Ub8TZuJRQFEilsZUiVfV5tRwxqtKK7Kvkuwkx2LXPvycBx2d7l
 9N8VmLkcPANwMi6mSuo3tSQjEQg1ZchvrtMJ73faDvC9mPDDJyOUd2CDzU56jcSx
 N/ibXUgMxl83B9tf4KZVGfabXL8MfAyJvhbwNHQiHiZosl+r97LFopr2VXOZUNxT
 ztaabFr8IqjrxRO6RtWoJygsRezHqXXOqBYorI2X4D7WhezS3a0J05KT7f6jV6m+
 8UzIrlu+cHtjBO74JbIDSIMy+bOd9+UIUHqs0qkt4LtHcqjVZqnj90EDjt1qJRHA
 jVkxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=KDwpeRiMBZ51a/1N537G6MpuhOZKtEbUes449q2dx
 HA=; b=Wjgizc0i5kuQ49PQnaS0dZyj7XWwusgQ8K38W5zQ2uHc/bhPBd6l/TUnc
 ndCtVqqYhudhtuWA05eAOXHfYP4toV/TYqp0PX6xlEPkdVxu3VbtZ1qc+1IgnNRD
 zeVruVhdGtzVslfW6YAbCSBjw/SHBNDPnqhthtz9Q/9sOOiAGpGJ6FN61gIkc2Na
 oUIY6B5cKUbhe5mkhXJ3WUocdM7633zG3HKOoEYC8xlrbH9c0fsHpZx0InB2HlJe
 MNdHzbn6hf4uG3UcXpAlNOKyBzPgrE4pfZOQ80pId3YHL7kCgq7ncXKRn7uOuFfD
 nAP0e7A2TZGlPX9l0Izunr3+3oTfQ==
X-ME-Sender: <xms:C9KuYY3yF_ZwjRG9Xv3bxTZesMsUR4MqCTjytAZW6Rcfb4CQPONoeQ>
 <xme:C9KuYTEQD3RbrHY7ir45q9C8NR74L6Gs76FIPpwQ0wLTKIDmsbwGbnug34Zth8F7v
 GgHWTYT-z0fR21EaEg>
X-ME-Received: <xmr:C9KuYQ5DglWL4yyQjaK65vj9wf3eDjNIxzXVHTUYw_bKjI4RipH5k9RNFzifW7edKAYflvvII8QqSNUmlrEMjT5YVkDI5EPuogTL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeeggdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvghtvghr
 ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
 eqnecuggftrfgrthhtvghrnhepveeuveeifeetgedvvdehgeefieehveekffevteeiudei
 hfevvdejieeuleefleefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhht
 thgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:C9KuYR2NgKorlsKgWHKhNABkmON_FpvJAX2Yp0yhLyHCUpx24z9b-Q>
 <xmx:C9KuYbHng5AsCOalPPnoCNqeqRC92Np16M2wRpd2DaOUCdEQDHXX0A>
 <xmx:C9KuYa9IZaBsRgGQ3CjK6qn6kafZOkXZ4K1WSbVQ8_-ZFf3D4nqe9g>
 <xmx:C9KuYYdQupVdu8lccYCGrOfdRRLo-5bYAkb2_01tz5y2qrYgiGRJXqmF9nQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 22:16:22 -0500 (EST)
Date: Tue, 7 Dec 2021 13:16:16 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <Ya7SAHD39m/CLJqw@quokka>
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell> <YZcB4ooqpvP3gHdx@google.com>
 <20211119123841.1d628cb6@eldfell> <YaaLITQF+lngE+VZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaaLITQF+lngE+VZ@google.com>
X-Mailman-Approved-At: Tue, 07 Dec 2021 08:26:14 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@linux.ie>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 12:35:45PM -0800, Brian Norris wrote:
> Hi Pekka,
> 
> On Fri, Nov 19, 2021 at 12:38:41PM +0200, Pekka Paalanen wrote:
> > On Thu, 18 Nov 2021 17:46:10 -0800
> > Brian Norris <briannorris@chromium.org> wrote:
> > > On Thu, Nov 18, 2021 at 12:39:28PM +0200, Pekka Paalanen wrote:
> > > > On Wed, 17 Nov 2021 14:48:40 -0800
> > > > Brian Norris <briannorris@chromium.org> wrote:
> > > > If KMS gets a pageflip or modeset in no time after an input event, then
> > > > what's the gain. OTOH, if the display server is locking on to vblank,
> > > > there might be a delay worth avoiding. But then, is it worth
> > > > short-circuiting the wake-up in kernel vs. adding a new ioctl that
> > > > userspace could hit to start the warming up process?  
> > > 
> > > Rob responded to the first part to some extent (there is definitely gain
> > > to be had).
> > > 
> > > To the last part: I wrote a simple debugfs hook to allow user space to
> > > force a PSR exit, and then a simple user space program to read input
> > > events and smash that debugfs file whenever it sees one. Testing in the
> > > same scenarios, this appears to lose less than 100 microseconds versus
> > > the in-kernel approach, which is negligible for this use case. (I'm not
> > > sure about the other use cases.)
> > > 
> > > So, this is technically doable in user space.
> > 
> > This is crucial information I would like you to include in some commit
> > message. I think it is very interesting for the reviewers. Maybe also
> > copy that in the cover letter.
> > 
> > In my opinion there is a clear and obvious decision due that
> > measurement: Add the new ioctl for userspace to hit, do not try to
> > hardcode or upload the wake-up policy into the kernel.
> 
> Perhaps.
> 
> I'll admit, I'm not eager to go write the fd-passing solutions that
> others are designing on the fly. I'm currently torn on whether I'll just
> live with this current patch set out-of-tree (or, y'all can decide that
> a simple, 99% working solution is better than no solution), because it's
> simple; or possibly figuring out how to utilize such an ioctl cleanly
> within our display manager. I'm not super hopeful on the latter.
> 
> IOW, I'm approximately in line with Doug's thoughts:
> https://lore.kernel.org/all/CAD=FV=XARhZoj+0p-doxcbC=4K+NuMc=uR6wqG6kWk-MkPkNdQ@mail.gmail.com/
> But then, we're obviously biased.
> 
> > > I can't speak to the ease of _actually_ integrating this into even our
> > > own Chrome display manager, but I highly doubt it will get integrated
> > > into others. I'd posit this should weigh into the relative worth, but
> > > otherwise can't really give you an answer there.
> > 
> > I think such a thing would be very simple to add to any display server.
> > They already have hooks for things like resetting idle timeout timers on
> > any relevant input event.
> > 
> > > I'd also note, software-directed PSR is so far designed to be completely
> > > opaque to user space. There's no way to disable it; no way to know it's
> > > active; and no way to know anything about the parameters it's computing
> > > (like average entry/exit delay). Would you suggest a whole set of new
> > > IOCTLs for this?
> > 
> > Just one ioctl on the DRM device: "Hey, wake up!". Because that's what
> > your patch does in-kernel, right?
> 
> Well, we'd at least want something to advertise that the feature does
> something ("is supported") I think, otherwise we're just asking user
> space to do useless work.
> 
> > If there are use case specific parameters, then how did you intend to
> > allow adjusting those in your proposal?
> 
> Another commenter mentioned the latency tradeoff -- it's possible that
> there are panels/eDP-links that resume fast enough that one doesn't care
> to use this ioctl. For an in-kernel solution, one has all the data
> available and could use hardware information to make decisions, if
> needed. For a user space solution, we won't have any of that, and we'd
> have to work to expose that information.
> 
> I suppose we could ignore that problem and only expose a minimal UAPI
> until we need something more, but it feels like exposing a UAPI for
> something is a critical point where one should make sure it's reasonably
> descriptive and useful.
> 
> > > > How do you know userspace is using this input device at all? If
> > > > userspace is not using the input device, then DRM should not be opening
> > > > it either, as it must have no effect on anything.
> > > > 
> > > > If you open an input device that userspace does not use, you also cause
> > > > a power consumption regression, because now the input device itself is
> > > > active and possibly flooding the kernel with events (e.g. an
> > > > accelerometer).  
> > > 
> > > Well, I don't think accelerometers show up as input devices, but I
> > > suppose your point could apply to actual input devices.

fwiw, filtering INPUT_PROP_ACCELEROMETER would go a long way towards ignoring
accelerometers.

> > My understanding is that accelerometers are evdev (input) devices,
> > especially when used as input e.g. for controlling games. I'm not aware
> > of any other interface for it.

> I'm not familiar with game-controlling accelerometers, but many types of
> accelerometers are serviced by drivers/iio/.

you can also unbind devices and use hidraw directly.

> And even if they register as input devices, do they match the ID list in
> this patch?

device type assignment is problematic, but i think in this case it doesn't
matter if the associations are a bit rough. You don't care about the type of
device, you merely care about "is this likely to be used". And I think for
that the list is good enough.

though tbh, having this policy in userspace would still be better IMO.

Cheers,
  Peter

> > Even audio sockets are input devices for detecting whether a plug has
> > been plugged in, but those probably wouldn't flood anything.
> 
> They also won't match the input_handler ID list, because they won't
> support the key or position combinations in the heuristic.
> 
> > > > Yet another problem here is that this completely ignores the concept of
> > > > physical seats. Of course it does so, because seats are a pure
> > > > userspace concept.
> > > > 
> > > > The kernel VT console already has problems because the kernel has no
> > > > concept of seats, which means that if there is a second seat defined and
> > > > a desktop running on it, while the first seat is in the normal VT text
> > > > mode, then everything typed in the desktop will be delivered to the VT
> > > > shell as well! (This has a possible workaround in userspace [1], by opening
> > > > the evdev input devices in some kind of exclusive mode - which is not
> > > > common practise AFAIK.)  
> > > 
> > > Sure.
> > > 
> > > I'd bet the intersection of systems that use SW-directed PSR and
> > > "multi-seat" is negligibly close to zero, but I can't guarantee that.
> > > Chalk one up for a user space policy.
> > 
> > Your cover letter has also the other bullet point: ramping up GPUs.
> > That applies to a lot more systems than PSR, right?
> > 
> > Maybe that is an acceptable trade-off: be 100 µs faster (your
> > measurement) by ramping up all GPUs in a system instead of only the
> > relevant ones?
> > 
> > Or maybe that will hurt normal gaming computers by ramping up the iGPU
> > when the OS and game only uses the dGPU, which makes iGPU eat away the
> > CPU power budget, causing the CPU to slow down? I suppose that would be
> > handled by ramping up only GPUs that userspace has opened.
> 
> FWIW, the current work we have out-of-tree involves only select GPU
> drivers that know they are slow to ramp up. If this were generalized,
> then yes, it could potentially have undesireable side effects. I'm
> certainly not an expert on Rob's work though, so I can't speak to this
> very much, but I imagine we could resolve the {d,i}GPU problem easily.
> 
> Brian
