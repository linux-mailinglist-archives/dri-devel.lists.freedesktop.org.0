Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964F41AAA9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A808689E50;
	Tue, 28 Sep 2021 08:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65D989D2F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:34:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3B1513201CC5;
 Tue, 28 Sep 2021 04:34:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 28 Sep 2021 04:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=8
 Ndt5mR9lDoSu8oa1clA56MdgUfnF9KzG9Uod91RcnU=; b=KZVLBBU9tsRVCpQVU
 H9FxCaX5369ZyOsqGNsP3qYIksV05riSj+RoC/l+jaRLOkfaZ/WbCaS7ZO2QxRhn
 lCpxawnGZEokifQJg0pv4mALe53EAhMJNM6txASv43J5Zb8mgWTLiycBqWUzTTG6
 /L3fWcoeZucoFEclJ/ipR1shPqpVYm4bdi2+NHJRS2xUFYddS0w924/WrW8qS4wi
 D9WupVeTsq1EE8azv+TB4K3y292ASGhtp+zRJT5oFA/ZebiZRPQn7jK+WgonC094
 vAE4KpH0rwUjN5DYn3k2Nx7fIBG+H99HpzsoMG/ifujaDXUqG/3jTXRSP7o+gnh+
 j8mGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=8Ndt5mR9lDoSu8oa1clA56MdgUfnF9KzG9Uod91Rc
 nU=; b=Sg2RWt/Yens/ISPIedhUpJgADepthjpuYd0DEt0w8Olv+N2mY75iZtVC1
 2ETBlChDYl/ZIX5G5smSd+qaCGFW4/92xgbAhXUm2CG7NFshsqGtF/hyAIT7YMLh
 pHRA/bCdMF9RullNm10pAkT8xLOAD9cyPtOBcOdoDmqKX23EC0qZHD9J5Sn7xJJ7
 9TgjStmtzYA2JsyP7/10DNUPRTouSz2PmtrwvgbQ/+ZpN1nTQKSVWAdQDI7dEauf
 F5sI2NpqDL2BXuS8xdGhll9QeBWCJ1qWCpZ2qfJUrzmAzDJ4HFepvcDLKFPnpMPc
 5xmUAnzDsK+m9PRCCyiQaZbcMqFGg==
X-ME-Sender: <xms:qNNSYdofR0s493s_Qoi0cHuKFXMO7qpg7rb30134BvIq11pSbKOiXw>
 <xme:qNNSYfqH1KSnffOoT4pIdB5KZlM8JxRQqYWCfXhD1Xoc87w3m632wqshtNQ9UlZXD
 lsBKXSirP570c68TCI>
X-ME-Received: <xmr:qNNSYaPZgD7SrpAVN0ba6dCWQG8TSyrLk7g-Do82vaPBNS2UIPKtbyk2_wYsJ235EqyQRXJRj72TvvTnWnUp48TImtFiEd9yAyyXv6dK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qdNSYY6IjKFZojSQJzAv9CPPgZ7Qb4FBkO5_NkyvE1IFLchU1_Vxsg>
 <xmx:qdNSYc58sU4zKkYu_4p9QKaDaJi91ON-dGhF9QflmXgl4M2tJfB5TQ>
 <xmx:qdNSYQjUgSqyCHbqZsFt-EVN63OzWuPea0HlYBd1G5f25GB3XA2yoA>
 <xmx:qdNSYZsvhIXXCSNFO-tF1UamMpmFXyY6vYe4uB5ox1TKu1cbGav7bA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 04:34:48 -0400 (EDT)
Date: Tue, 28 Sep 2021 10:34:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210928083446.cfji7hmndt6a5nop@gilmour>
References: <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
 <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
 <20210924133022.waqgtr5xjjxigong@gilmour>
 <CAKMK7uFxO-ss86k483VJQJiHwcAYxNwD06xSEZStn+fWiRJ6iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKMK7uFxO-ss86k483VJQJiHwcAYxNwD06xSEZStn+fWiRJ6iw@mail.gmail.com>
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

Hi Daniel,

On Sat, Sep 25, 2021 at 12:50:17AM +0200, Daniel Vetter wrote:
> On Fri, Sep 24, 2021 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Wed, Sep 22, 2021 at 01:25:21PM -0700, Linus Torvalds wrote:
> > > On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
> > > <sudipm.mukherjee@gmail.com> wrote:
> > > >
> > > > I added some debugs to print the addresses, and I am getting:
> > > > [   38.813809] sudip crtc 0000000000000000
> > > >
> > > > This is from struct drm_crtc *crtc =3D connector->state->crtc;
> > >
> > > Yeah, that was my personal suspicion, because while the line number
> > > implied "crtc->state" being NULL, the drm data structure documentation
> > > and other drivers both imply that "crtc" was the more likely one.
> > >
> > > I suspect a simple
> > >
> > >         if (!crtc)
> > >                 return;
> > >
> > > in vc4_hdmi_set_n_cts() is at least part of the fix for this all, but
> > > I didn't check if there is possibly something else that needs to be
> > > done too.
> >
> > Thanks for the decode_stacktrace.sh and the follow-up
> >
> > Yeah, it looks like we have several things wrong here:
> >
> >   * we only check that connector->state is set, and not
> >     connector->state->crtc indeed.
> >
> >   * We also check only in startup(), so at open() and not later on when
> >     the sound streaming actually start. This has been there for a while,
> >     so I guess it's never really been causing a practical issue before.
>=20
> You also have no locking

Indeed. Do we just need locking to prevent a concurrent audio setup and
modeset, or do you have another corner case in mind?

Also, generally, what locks should we make sure we have locked when
accessing the connector and CRTC state? drm_mode_config.connection_mutex
and drm_mode_config.mutex, respectively?

> plus looking at ->state objects outside of atomic commit machinery
> makes no sense because you're not actually in sync with the hw state.
> Relevant bits need to be copied over at commit time, protected by some
> spinlock (and that spinlock also needs to be held over whatever other
> stuff you're setting to make sure we don't get a funny out-of-sync
> state anywhere).

If we already have a lock protecting against having both an ASoC and KMS
function running, it's not clear to me what the spinlock would prevent
here?

Maxime
