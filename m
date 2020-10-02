Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533FD281335
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DFC6E0B6;
	Fri,  2 Oct 2020 12:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485086E0B6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:55:23 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F529206DC;
 Fri,  2 Oct 2020 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601643323;
 bh=5AJyIErWdlrgMYlEMAq+TO9asL7HgMDK0TTNyge8YO4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lcHFzgqDzd+7/14/hfQkWGSQBbQl3E2M5rJOmDJHooiwsfL8t+ChP9U7Rja4WJe2q
 G92kbsMn8vGdkX4wQeFsodsmI7mjHdlrHRf+RzgQH9DBwZWFeLtiXI5RIq7ZL05DGA
 arQTxLKktZLmuTIRj7YVI7GtaKGM0GZCK6qUCch0=
Date: Fri, 2 Oct 2020 14:55:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v3 0/2] Add configurable handler to execute a compound
 action
Message-ID: <20201002125522.GB3350322@kroah.com>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20201002123158.GA3346786@kroah.com>
 <95030036-87fe-8c61-6fc6-c60452d8ca96@collabora.com>
 <9bd7ff2e-ddf3-f950-54ad-c143e9c60daa@collabora.com>
 <20201002124529.GI438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002124529.GI438822@phenom.ffwll.local>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 02:45:29PM +0200, Daniel Vetter wrote:
> On Fri, Oct 02, 2020 at 02:36:33PM +0200, Andrzej Pietrasiewicz wrote:
> > W dniu 02.10.2020 o=A014:33, Andrzej Pietrasiewicz pisze:
> > > W dniu 02.10.2020 o=A014:31, Greg Kroah-Hartman pisze:
> > > > On Tue, Aug 18, 2020 at 01:28:23PM +0200, Andrzej Pietrasiewicz wro=
te:
> > > > > This is a follow-up of this thread:
> > > > > =

> > > > > https://www.spinics.net/lists/linux-input/msg68446.html
> > > > =

> > > > lore.kernel.org is easier to pull stuff from :)
> > > > =

> > > > Anyway, what ever happened to this series?=A0 Is there a newer one
> > > > somewhere?
> > > > =

> > > > thanks,
> > > > =

> > > > greg k-h
> > > > =

> > > =

> > > https://lkml.org/lkml/2020/8/18/440
> > > =

> > > Andrzej
> > =

> > Sorry about confusion.
> > =

> > This is the same thing, so there is nothing newer.
> =

> Maybe split out the s/V/v/ in drm so I can pick that up? Alternatively
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> if Greg takes it all.

I'll take the first patch now, the second one is a bit more odd...

thanks for the ack.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
