Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0DE557E8A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 17:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4041D10E028;
	Thu, 23 Jun 2022 15:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4810E028
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 15:25:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 30CB65C009C;
 Thu, 23 Jun 2022 11:25:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 11:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655997956; x=
 1656084356; bh=3shfMghcUfNmQ2mk/127emoUmSyF4uZg3BAFx3eN7h0=; b=0
 eqmMUywNEamz+0czdUhrksObSacjOZvNpF1PATNe1ip2cdeuL/EwlP6T28LB3kAK
 mdfx78AeqBgCeF3J5aJmdwbS0UwcbZBssR1GSb0c1hhR8QgLkZUU+zLa9/WGGM+E
 2EuTwQys9pOX4mP8TpyTey14kbgWl9F0TG0DXVBj6fFijGVAxCLMV8BZ2swbGbfb
 G8bQxjEn6nMpjvf4BvcOKb3Zz5CUnawdEeDgwNfheR4Qk57es4b64T7bTnfv6Yhd
 tmMtiuM8zEIqLcd3ahpRMySWIJc7suMnSFfYttD07s87g2vJLB4/bEWZET92sgtZ
 3xnCRNBeREOhF6RFHqS/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655997956; x=
 1656084356; bh=3shfMghcUfNmQ2mk/127emoUmSyF4uZg3BAFx3eN7h0=; b=D
 clJwHVncd2cYbIrVHvV+hDbczsTc5V3hvT88w4I/ni580U//zc76HBvCMAbsWwJe
 9s1lzvbv815WXSqgRmJ27IaLhP+YtgHoehad9GV1BANHJ4BKspHoL36o6z3SOGmh
 BNriC0zHs/yCwC4ovMX6vP74IZFT/2eXraYG/mQotZbJr+KF6vEnMLA+aUipnDEf
 vSDpevGWEuUDm5fC1MBltOH94gqDlVjYiZt3lm1lxfkCVR1xRSi1FQ26zU7jztGM
 J/8o1Uer5+LIcLGrcG0iYnGvqtwRtwzAXH3r1/TW6aroobgXPURW5IMy0pZpuC15
 rezB5otHFcApvhHcat+Qw==
X-ME-Sender: <xms:A4a0YkG_kOQQCB-Pt0MNcl1pjirNEDhPqHTZsTTri7GBa9SifvosCg>
 <xme:A4a0YtXwV1NqHauAgB0ZeQzX4BBk8qu9cOsFI96cNMsRiG9P8Yb87_A8z06Ql9Vrd
 O5vQvA7R-7ctoWsvw0>
X-ME-Received: <xmr:A4a0YuJAjTByCZVRdCFIeCbcbvKIJJ1BYuVFDE8gKrHUXwbV9WroBc9MaZeY_ihr9ZSTu1Jt1Ywc2xZ8TQnQLJDZr6y1BxC7vMPTb8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepkedvtdfhudduteekffeuveevieeuudeihfegieetgeejhfehieevlefg
 tdetjeffnecuffhomhgrihhnpegtihgvtghhrghnohifrdhskhhinecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:A4a0YmEYq6VIdtTEynXrqxr-_0Ij_6PXGl7vXdCVXBvEnHOvmfUgJw>
 <xmx:A4a0YqVLcBXTefaXEOwJqLf3ugFa8bgoOg2SsYgayFwC0h5WrNJb5Q>
 <xmx:A4a0YpMPyVcIEXnDoMaLWipgDkOYbsEdnHwuCye8l8ZNZaRKBvUSWg>
 <xmx:BIa0YmQTq--MMp2MN9MRxP7XG82EZicleF7M--aa3-DWw7gEq3Y7Lw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 11:25:54 -0400 (EDT)
Date: Thu, 23 Jun 2022 17:25:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: Enable output signal premultiplication for
 DE2/DE3
Message-ID: <20220623152551.f74mwbvqlmqkwshk@houat>
References: <20220605094018.9782-1-r.stratiienko@gmail.com>
 <5826286.lOV4Wx5bFT@jernej-laptop>
 <CAGphcdm=sOyppe8sAYMK6aeRXpxiHvj-h-Es6nigCNKBxdBNZQ@mail.gmail.com>
 <20220608081715.cblotjle6benihal@houat>
 <CAGphcdnz-fJUrtGoYXzmaCHd5rGR98_0e33a26Uh55c63Lh_rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGphcdnz-fJUrtGoYXzmaCHd5rGR98_0e33a26Uh55c63Lh_rQ@mail.gmail.com>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 07:44:03PM +0300, Roman Stratiienko wrote:
> =D1=81=D1=80, 8 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 11:17, Maxime Rip=
ard <maxime@cerno.tech>:
> >
> > On Mon, Jun 06, 2022 at 01:16:06PM +0300, Roman Stratiienko wrote:
> > > =D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:23, Jernej=
 =C5=A0krabec <jernej.skrabec@gmail.com>:
> > > >
> > > > Dne nedelja, 05. junij 2022 ob 11:40:18 CEST je Roman Stratiienko n=
apisal(a):
> > > > > Otherwise alpha value is discarded, resulting incorrect pixel
> > > > > apperance on the display.
> > > > >
> > > > > This also fixes missing transparency for the most bottom layer.
> > > >
> > > > Can you explain that a bit more?
> > >
> > > Well... I would recommend reading Bartosz Ciechanowski's blog
> > > https://ciechanow.ski/alpha-compositing/ or the Porter-Duff's 1984
> > > whitepaper itself.
> > >
> > > HINT: That magic numbers from sun8i_mixer.h ( 0x03010301 ) corresponds
> > > to SOURCE OVER mode.
> > >
> > > As you can see from the blending equation it outputs both pixel value
> > > and alpha value (non-premultiplied data mode).
> > >
> > > Also single-layer non-premultiplied buffers may have for example
> > > (R255,G255,B255,A2) pixel value, which should be sent as {R2, G2, B2}
> > > through the physical display interface.
> > >
> > > When OUTCTL.PREMULTI disabled pixel, the RGB values passes as is, and
> > > even 100% transparent data {R255, G255, B255, A0} will appear as 100%
> > > opaque white.
> >
> > Without going into the full explanation about what alpha is, your commit
> > log must describe what the bug is exactly, and most importantly how do
> > you trigger it.
>=20
> I do not understand what you want me to add.

Context.

Again, what the bug is exactly and how it fails, so things like what
setup triggers it, what exactly is wrong with it (is the layer not
displayed at all, corrupted, something else?), etc.

> I checked alpha appearance manually by preparing framebuffers with
> data and presenting it on the display in various combinations.
>=20
> I attached the videos and tests as a proof. If you don't believe me
> you can always check.

It's not about believing you.

Let's say that in a couple of years it turns out that this patch
introduced a regression, or something just isn't clear about it.

We go have a look at the commit message, and it just points to a video
that isn't hosted anywhere anymore, because you closed your hosting
account, removed it, whatever.

Then what?

That's why we ask to have the whole context in your message, because
otherwise you introduce a dependency on something Linux as a whole has
no control over. And if it's not there anymore, your current commit
message is useless.

> If you find something missing in the commit message or don't like to
> see external links feel free to amend it. From my point of view the
> patch is complete.

I'm sorry you feel that way, but I don't really get your attitude there.
What did you expect from reviews in general if you're just going to
ignore anything we might say?

Maxime
