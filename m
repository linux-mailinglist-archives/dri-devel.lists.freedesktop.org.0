Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B071190C0CF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 02:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF1A10E531;
	Tue, 18 Jun 2024 00:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="X2GIm8Mq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dlh01JSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com
 [103.168.172.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C1E10E531
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:57:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id 231161380803;
 Mon, 17 Jun 2024 20:57:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 17 Jun 2024 20:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1718672236; x=1718758636; bh=HthqcoOdBh
 /JK0eSSjRZiYaRguDJqed9JCqeCaWqaF4=; b=X2GIm8MqFYIjY9hChpzwMV4a4B
 DWt59AMHg/VJVG5y6Rco+PbdySHeM2Lll9EyLn8Emgy+Xp6DitfgwPgCzd+gVLYb
 F6jsrrdqRU3EvhJ0hm1Woeaf1LredHqeNf07J4wGsm0QAoO/muAZlGZsP5wX8I+9
 aNv99soLhwE9RyeG4Yf9N3ouE/p5f2umX2kt7+ToY6UTqM46adpi9UGR0cy93ihY
 58WWkfx/XQIPtbJIvO9HVdwRQf10fyc2mhOXND8GjFADik1+jnJqVTmJZr9T7Sdg
 k8entB0Px4f1q5QAl8KyxN7FE9nxnCH//OltmltW1Fd1vbnYteroYkJ4jP0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718672236; x=
 1718758636; bh=HthqcoOdBh/JK0eSSjRZiYaRguDJqed9JCqeCaWqaF4=; b=D
 lh01JSRa/LB9EMZLvlsYZUNBJvMpYIQd0NzMbdDnYJWzb16IdWTIf1DJhtBRWq8r
 KmOUmt0QWK29vQsgSHcBUF6Y5NgjynqkzPqkgSyCzZ9GPmHIzLVT9Vpjed6RxNs5
 K111QEiyRVPZ3C/uw2ch/hIOEjSYCqlcfurxsvKBb1lzPK1k9XZzlNGqSQVu1OzT
 ZME6D3a+lGnzuIdvO/Bp4EsI7lF1M8BaMqq8kDUE8MG68/wgFzT+7qKj2K7dFXXo
 /pOXz6BeEM8/932vNt+vYti+JnMr32YAys3J5PvYf5EHfChzaBGhe+1ZUursERhd
 LM4x9moCS/SUNFKZqsvIg==
X-ME-Sender: <xms:a9twZnLk5vFSlfFivWahqkY2MeN_LCZojpsCHXIgPPADF3Pp6dK3Rg>
 <xme:a9twZrLMmy1ERlFVL5GlVKrIy4sbTBcWVQq0uTDzpQsW3AJ13A-JtPqvseHDdKv7t
 UDvD98EY9ufHX0>
X-ME-Received: <xmr:a9twZvtrtmwRbDJNhyKQQAN8tmdOyP2h8njU1A_ls6XzuqQZrWsq3ZwpO5YWCqh4E0u94gS_euu9DzSWtht5OlWfmfj2uGCswpsFS54OpEap30OG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedviedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtgfgjgesthekredttddtjeenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudfgieetueeuueeihefhfeetudfh
 iefgteekuedvgfeuhffggeegfedvkeegkeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:a9twZgbo9qjBtr9aI7AfebSQQDY9_2brye7Hpa0BU0M6Cn3CtZOF6A>
 <xmx:a9twZubyYRtVeubFjkmi5KoX0QJHGa_J_Elx-ok0GDtuh0VmToViIQ>
 <xmx:a9twZkCs3Ylc0k4DNivo_f7_bWw-ECMwhdHLYLwd7w0CZOYf9aiGKQ>
 <xmx:a9twZsZowZl3KsmY6OV45_JeW-pA187fQwaUXx4uSLixI46sY37M7Q>
 <xmx:bNtwZkkWTlRIUvyeWN5yg9jy0bap-acAklEI19GGuLNXmRX8h6Pcwqw0>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 20:57:15 -0400 (EDT)
Date: Mon, 17 Jun 2024 20:57:14 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnDbaply6KaBUKJb@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook> <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook> <ZnCglhYlXmRPBZXE@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; x-action=pgp-signed
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnCglhYlXmRPBZXE@mail-itl>
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

On Mon, Jun 17, 2024 at 10:46:13PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monné wrote:
> > On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote:
> > > In both cases, the device physical
> > > addresses are identical to dom0’s physical addresses.
> > 
> > Yes, but a PV dom0 physical address space can be very scattered.
> > 
> > IIRC there's an hypercall to request physically contiguous memory for
> > PV, but you don't want to be using that every time you allocate a
> > buffer (not sure it would support the sizes needed by the GPU
> > anyway).
> 
> Indeed that isn't going to fly. In older Qubes versions we had PV
> sys-net with PCI passthrough for a network card. After some uptime it
> was basically impossible to restart and still have enough contagious
> memory for a network driver, and there it was about _much_ smaller
> buffers, like 2M or 4M. At least not without shutting down a lot more
> things to free some more memory.

Ouch!  That makes me wonder if all GPU drivers actually need physically
contiguous buffers, or if it is (as I suspect) driver-specific.  CCing
Christian König who has mentioned issues in this area.

Given the recent progress on PVH dom0, is it reasonable to assume that
PVH dom0 will be ready in time for R4.3, and that therefore Qubes OS
doesn't need to worry about this problem on x86?
- -- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZw22kACgkQsoi1X/+c
IsGqtA/+INEbVP6pjKoMOJStaXajIvx19hJFU5HJQT0FBe4u2VXd3wfhK5gbJ90P
NrlE3Lstzper0qBG7Lt8lt4DAcL9Q3Ml9d8M0K7z6VYIKPqiu2Wh/P25HD7r+Adn
L2AMwnKUHtC02LJpT1Cjt/acKU3En9TMd35RhCNf4K+c9Swodtea3iOo7GzgQjNA
TFMAYiiIlhwQIvThrVlcKktCMZajvhudxwfZTd3EfUkIQbMtc/ydkeqL92nV9Fg4
uz+AEeDDNhCGsEjrFUFTXKnXc/28jpVIc4mXyGW+x4dginRjrjRVmtNrnz/1wO+S
X/xVUVnvLoTUXI+dKI9y5XmobVAJzLNZaEOEfnKePj5zA2ayRfnWybPBjzJuU+S4
wKevyBDlTuOdgtOT9nktd+qzXBQYtreEu8f+t9sEezURpVU/oOyrVn7Ui0RMtZID
W3sXJH3NfVb3mWCsYOMpJyzb5VYfYR5PWN6Ggln/CHvfLTDI8TKdaO41INkXLlTC
fA1cXVSKPn/VX9LRIFcQ81v9MGBAFkDX4Mf7z7xodi9Qopj+o2Yw66g5vLrPxPCH
asJSdnrnaZAtZSsbEhY4uV5+4QLD0dyNUqj+HxRlODFwhpDyervCikfp0MoSsWmT
qFvFHkiSqkx7E33QaVjmcGmFv4eWTVunYxW0j8tWnpWQLNLfPzY=
=H5gN
-----END PGP SIGNATURE-----
