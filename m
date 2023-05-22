Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CD870BF27
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644310E31D;
	Mon, 22 May 2023 13:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A110E31D;
 Mon, 22 May 2023 13:07:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id C056C5803A7;
 Mon, 22 May 2023 09:07:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Mon, 22 May 2023 09:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1684760820; x=1684768020; bh=c9
 3SmvLDeC64L51UuCFxKGnCCgmnVKaRqTKgfxWZ1ys=; b=MLCMKmdR20X7i+uMMB
 p+8Bl8mcfuXsoN9oxkaYz9yJqNc+Uq0a0hGJ+SPuV5ZisOoi/9oUJYzVbdJ5mMsC
 wcn+reG+to+Nl024aZdHjvAndkmYyVIRPEooNtirOnocO6hajNyHYRikw3ONMlrt
 fK6766QSCaEUk8QYm+KF2R6aqV7aIN87uGt3Nm7/oHvpscIAfmp5IpMbBEnQvKbW
 w00+4GyOmUgnjxEjFJ73/VxZO6o/hMYs/o8+cSnBiUlZR0fGyZjbRnttT0Ypgy3U
 53ISsGPqwikreb3ymgPcUWlwUVUj8ut0FteHzMfjygw8SVBXfDv4n//c18zDU3b0
 xlLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1684760820; x=1684768020; bh=c93SmvLDeC64L
 51UuCFxKGnCCgmnVKaRqTKgfxWZ1ys=; b=ZFevDW2W8S7FjKYvqGFg4RabbRy9j
 D0vDK2N3DUtLciR97xwV9tvExxWzTBevblDXEdxtoh9du0rDBkeyR/Dj0zE6gxkE
 XPETVYrImwtFOAPzuQGAptzZraTnVt48wU8sXo7sGpeN4FAfgmG+nMhZCNYfTyE7
 R5xBtnpMmklQ7JOsMBq9AZ70e1+eiPXjsobjzNHLZPFtrfThVW8gSo6Bi0449djK
 FT9mxoQGUq9Vkjm4POE6SYunF4yNYjxEMJhbLKgY3dH1YTkyKxLnVkyrlJSfjt7m
 LtUi3oGh9+57TywxB4t/XDwnQs+mq7oTUyLsNkCe84yqKEfCAJghKJz8g==
X-ME-Sender: <xms:8mhrZNRjH4YYUGSj8UsLoa6o_P2wl1tPwAzXDAmqbW-ZGJfZCSOsSw>
 <xme:8mhrZGwVdHbY2c8bkLkjqHfMOiNlOk8xrLthGbT51RQqALKqbdw66Adh46jQWpM-D
 opwTdT0ne2-h9232PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:8mhrZC1_nBlypOTS2fXYV--cUSR2LKArBobBwRH7JJkoFKOMjMVPbw>
 <xmx:8mhrZFAARAra-R85PT2JOAuNpdOCmec_W7XHCctRVRM_hqyCBtavUA>
 <xmx:8mhrZGjGP12Y9RDUaS2okglSFxGWQ4NatOph0oswfIUBU02iLRsGjA>
 <xmx:9GhrZBj_SK5fBJXEYP7q15nX172iDSohGuTzXFd0Mdriur6iRcn-FA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6CA3FB60086; Mon, 22 May 2023 09:06:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <5dcf01e7-4378-4b4c-9751-454b16270c69@app.fastmail.com>
In-Reply-To: <2043cea3-7553-ee9d-4aaa-6f1d22ac4d87@suse.de>
References: <20230522105049.1467313-1-schnelle@linux.ibm.com>
 <20230522105049.1467313-10-schnelle@linux.ibm.com>
 <2043cea3-7553-ee9d-4aaa-6f1d22ac4d87@suse.de>
Date: Mon, 22 May 2023 15:06:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Dave Airlie" <airlied@redhat.com>, "Gerd Hoffmann" <kraxel@redhat.com>,
 "Dave Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Subject: Re: [PATCH v5 09/44] drm: handle HAS_IOPORT dependencies
Content-Type: text/plain
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 spice-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023, at 14:38, Thomas Zimmermann wrote:
> Am 22.05.23 um 12:50 schrieb Niklas Schnelle:

>> There is also a direct and hard coded use in cirrus.c which according to
>> the comment is only necessary during resume.  Let's just skip this as
>> for example s390 which doesn't have I/O port support also doesen't
>> support suspend/resume.
>
> I think we should consider making cirrus depend on HAS_IOPORT. The 
> driver is only for qemu's cirrus emulation, which IIRC can only be 
> enabled for i586. And it has all been deprecated long ago.

I tried it out in arm64 debvm, and both the kernel and Xorg drivers
are detected just fine according to the log. I only get a black
screen, which could be the result of a missing VGA BIOS or the missing
unblank Port I/O in the driver (I doubt the VGA ports are hooked up
on arm64 qemu), but there is a good chance that it's currently
working for someone else.

      Arnd
