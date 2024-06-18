Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8636490D46E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DECB10E6A6;
	Tue, 18 Jun 2024 14:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="h/Fp34FR";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Py1JfzbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 533 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2024 14:21:09 UTC
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6DF10E6A6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:21:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id 7FD29180007B;
 Tue, 18 Jun 2024 10:12:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 18 Jun 2024 10:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1718719934; x=1718806334; bh=PUyO7rEqEy
 UMRxDgGs+JjU2AQ3HsAsI5ZlgH+/pmHr4=; b=h/Fp34FRivK2MGFipBl5dFBabT
 wGT7vNPIn5LkChuZpJMnTaCqrbxDeWXeOWjuti+G//juPpNz0FTfQs7YMQ7SQLX5
 Yg0oGkyQwmnSeLVfTYFMfZjG79dLVHHHswpb3AEz3q5j7ca1sEfHPQQQX8ZFSVaH
 47pE+bLFrN5hXJy9NizLY/b1Odi4CFJjBeqm6oUlu6T8Q593iMkhiwt9sgnbFoJl
 4xZck/in6AAG44nhd36FzjBV95Rs/Ghp7hvrYO7dfk4MFukNTpJuaueDTQyoXChe
 txqRzesA9pv1h8TVpp+U2zmprDT/VXROs/AXENwMywYFFW2B9Ku48o4sqgcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718719934; x=
 1718806334; bh=PUyO7rEqEyUMRxDgGs+JjU2AQ3HsAsI5ZlgH+/pmHr4=; b=P
 y1JfzbVT/7Bl/qHNtB95zZ6JPVF0FIOLMHKJZBvn9P0Tdfmv4q4vR1XYx3WxzRxp
 qFmKzvioFVU9bY57DevQuRQU2mPBLNOLMQMCQSIZ60ZaDs1mE40ViA0y0YW5kjBe
 rEZn9E8nv+D6M/9rzXZvfDUhMqRXvrvbneMNJP9Vhv0c7H4Go2qIKSjZQtDztO51
 c381Ir4hbdkxH6wrkWZ2JWYtgs9JPA0mBqVf3Hdm7837e4r700/evzMw8VnxKOTb
 6uuGMKkdEKGDuIC7ZkRJLbVlllMeQQ7PjUMwmxNH50Y7ffwrBd2auRQZ45GK2yl9
 bu4+CZQQuA114nZavUYYQ==
X-ME-Sender: <xms:vZVxZhgPqeKTTQIt9vuoV5faWXgMpHSRmnDgKn7Y4XbisKFZDiOM3A>
 <xme:vZVxZmAZoWcnL2ec8lbGk8jKF-ldjb1DJAZTymEE-beuk_DvC6oKNDWSHPycHPHIA
 ybaBmaMh0XrfLQ>
X-ME-Received: <xmr:vZVxZhFmRHhxafYg5s0QzU2z95sTKltlFTQ_MbYsxBL0FzlFxqDOWl0gGy1VJExF9vh0HR2Ii7bNRYajCrH6NV5UcwEIcw66-8-6YCcqSOtOBaba>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtgfgjgesthekredttddtjeenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudfgieetueeuueeihefhfeetudfh
 iefgteekuedvgfeuhffggeegfedvkeegkeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:vZVxZmQnYsMF8uzLv4z65V6PgrYt9naVdkzZrC9LC0L_Uz3sV6y3qA>
 <xmx:vZVxZuxhoqSr1HGwzXO9nJ5F1OwQ77Ak9SSEZQtpQh0tsS20HAgLxA>
 <xmx:vZVxZs5VlGsOOnk1imAZxYYZV51vo2OCPOwWeCOacCzAwS9E0dxFMw>
 <xmx:vZVxZjwuxUOn8g82LmiWiCOvpDx4ct9LLoGnZp6QAE7pNaglyRSjRw>
 <xmx:vpVxZifpn9YmOCRm3CdF8lKxLmbq9rqr8gYS8I4BG6YZYUHuO56iS8XI>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 10:12:12 -0400 (EDT)
Date: Tue, 18 Jun 2024 10:12:11 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>, 
 Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnGVu9TjHKiEqxsu@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook> <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook> <ZnCglhYlXmRPBZXE@mail-itl>
 <ZnDbaply6KaBUKJb@itl-email>
 <0b00c8f9-fb79-4b11-ae22-931205653203@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; x-action=pgp-signed
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b00c8f9-fb79-4b11-ae22-931205653203@amd.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Tue, Jun 18, 2024 at 08:33:38AM +0200, Christian König wrote:
> Am 18.06.24 um 02:57 schrieb Demi Marie Obenour:
> > On Mon, Jun 17, 2024 at 10:46:13PM +0200, Marek Marczykowski-Górecki
> > wrote:
> > > On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monné wrote:
> > >> On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote:
> > >>> In both cases, the device physical
> > >>> addresses are identical to dom0’s physical addresses.
> > >>
> > >> Yes, but a PV dom0 physical address space can be very scattered.
> > >>
> > >> IIRC there's an hypercall to request physically contiguous memory for
> > >> PV, but you don't want to be using that every time you allocate a
> > >> buffer (not sure it would support the sizes needed by the GPU
> > >> anyway).
> > 
> > > Indeed that isn't going to fly. In older Qubes versions we had PV
> > > sys-net with PCI passthrough for a network card. After some uptime it
> > > was basically impossible to restart and still have enough contagious
> > > memory for a network driver, and there it was about _much_ smaller
> > > buffers, like 2M or 4M. At least not without shutting down a lot more
> > > things to free some more memory.
> > 
> > Ouch!  That makes me wonder if all GPU drivers actually need physically
> > contiguous buffers, or if it is (as I suspect) driver-specific. CCing
> > Christian König who has mentioned issues in this area.
> 
> Well GPUs don't need physical contiguous memory to function, but if they
> only get 4k pages to work with it means a quite large (up to 30%)
> performance penalty.

The status quo is "no GPU acceleration at all", so 70% of bare metal
performance would be amazing right now.  However, the implementation
should not preclude eliminating this performance penalty in the future.

What size pages do GPUs need for good performance?  Is it the same as
CPU huge pages?  PV dom0 doesn't get huge pages at all, but PVH and HVM
guests do, and the goal is to move away from PV guests as they have lots
of unrelated problems.

> So scattering memory like you described is probably a very bad idea if you
> want any halve way decent performance.

For an initial prototype a 30% performance penalty is acceptable, but
it's good to know that memory fragmentation needs to be avoided.

> Regards,
> Christian

Thanks for the prompt response!
- -- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZxlbsACgkQsoi1X/+c
IsG+WhAA00y83cU94MMJCuDMqTCSOgJraPchvQHLBuMIB0cJkIbVxhA2T4yuvVZy
Bzg/oVvWJH8B+p47HHo6uyjoPoeO659q8Hyea6zT8yMrKhiwOF8UxFRyxakdYHRs
l793sCwUtMFwkJdsfacTSKjL6sMktWhicvOqX4rA/SIVpwzZh1auFjAIrZ2BENb/
YIRH18Dfl2iEOA2W3TQTNiaqLeT2qtYspDVVLuUeAe7OAFCJVSkeMpAPPR15jCzm
Ou0HP6JP2jH6h7Shd09ns+3UvQK4xaygpvEsj+BwpXPf2CDNgypKHezqgF1WMzCc
HGXK1deGXE35XNH4EL5jgRlF7FmLT54CXuMpPIGbfNWbT2fvpoS2tyrdQPHxwgr8
lqqqfjugZ9qzbqA4v/m+v0cKFclMvSYL8Rzn+tbz8kAFf7VTglypY55RIIStdnSZ
sLYStA6qv8Mcu4NHYvdGeatTS26XR72X+dB5ApTn4dLLttnzbXMAyqDSTys28XQb
jeHnh1uTOLChODJHu5prHJ6bN0MxmISwFuot58gW/iI0spyihRhPNjZ/6E/7BpIm
8AGiT+p96dvaymLB5k6dqj5ruqVPP8HLBibB8zafzJn3JIJpjCZm9HM5YcO7xMQ2
92ZNZ/XOswah+0s6MyWDCsU8jKnhQ87ESnB4JItI5skKj+001Jg=
=ddxn
-----END PGP SIGNATURE-----
