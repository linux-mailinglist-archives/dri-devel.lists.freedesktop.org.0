Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A249458F61
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AED06E092;
	Mon, 22 Nov 2021 13:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB546E092
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 13:28:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 311E85C022B;
 Mon, 22 Nov 2021 08:28:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 22 Nov 2021 08:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=Y
 uB79un/L6qYXxX1kBpVi7KsNohwQzXt3KGpPPF/vbw=; b=GjBSnC35xmpvq6OMX
 OIxwgYyX0nvbjERbQHspA1pbcXrGnn4jLDRSWiEJC6o0Kr4rPGA2gcw0gRghUDy6
 N7IooWxK7E5FeH9etRfAhEC9jZAdbt+nNkkPJyFVH3WORCQWeUNbHu3V+7JhFJi2
 Swp6uYbzF9eu0wlMZxtm5IjcQ0gvSKZxr2uYxP21zBelznQsHBrT/Wywl8eumln7
 uJ7w48gm/XVBjXLLgL688bgt1ncqJxsPnORZWVx5ATjEWPTNFrj2cle98J/Brt0c
 KIu+6rlq8HvdrI08pFguaf84+qqE/fD4zUO76QEttFVFWGxWL7FNhjuVy6bvI0rw
 +QAyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=YuB79un/L6qYXxX1kBpVi7KsNohwQzXt3KGpPPF/v
 bw=; b=WXm15Wb9eMhw1/n/HE1o0PPZqUEW0ngrBZN8lWpkynIpAqmnkmYxvCPjd
 Qq/guF0c+19A50MQOfz5M3Kd7VRqveZVYl91+CdbNbvmZFKrUOSkUXVyxYu08CpL
 Wgl3vYuvEA7ae92BhkeXqAvf2lwbNDAZPESOVNoaDwEJBGvC3O+dFY8Ed8R1P+H0
 i5HDiKbTltR4xVj1uTqd+ZgrfPZrwAgJqt5HQwP61E1eV/F+nv4Pz6g1sUo59Np1
 0QCqdGiRW/by5YPCf+eoeAZheJJee1FxGau4t8UbfDIT0nV0dtkFpwAOkBA2oNaH
 zXBJ2FwZrybZE4Dfii5T748OMyg+A==
X-ME-Sender: <xms:EZubYfHSrB9ZWXpyQNMicMZlKESmTeLoHr9vyL4myPzZ32wxBbx07A>
 <xme:EZubYcVyPH7TdY3v0vnehd1Hf4L8XcsvuQMJPLwPwtd2evcVBKDBnngitoXFmXmfK
 pKvhan6fM-VRM8Kiy8>
X-ME-Received: <xmr:EZubYRI01qltSEqOtIOTgC3owOfUyk57rW3Lw6exrdm8X2cM-G_Zb2bBuECq9uc2kgZpvx7hiM3ycScMM4XJF8EJr0Zj4_UaBL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EZubYdHDd6S1BEnpOkS2BECNY3j7D605yWywqBPR_GjtceQ6uXn_fg>
 <xmx:EZubYVXq259b0LsCqNp9of9ivf-WkSvjsh6neMehMrbpEp7CXkgQ4g>
 <xmx:EZubYYPAbeIDPTWsJXXTB7mw3QnR-J6xr9P0GwSIQ5vMFzNR5Gf_jA>
 <xmx:EpubYRpFolsOlkyn1iX32vy54dYc7rB_t_ea0KZwbIhRubRnzRd0bA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 08:28:49 -0500 (EST)
Date: Mon, 22 Nov 2021 14:28:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
Message-ID: <20211122132847.ds4gtk2unq3fkagy@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
 <20211122100759.qw6lvwb33ciemg2y@gilmour>
 <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 06:35:58PM +0530, Jagan Teki wrote:
> On Mon, Nov 22, 2021 at 3:38 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Nov 22, 2021 at 12:22:20PM +0530, Jagan Teki wrote:
> > > Get the display mode settings via mode_set bridge function
> > > instead of explicitly de-reference.
> >
> > What's wrong with dereferencing the mode?
>=20
> Nothing wrong with dereferencing, however we have built-in API to that jo=
b.

That's not an API though?

It's perfectly valid to dereference the pointer in atomic_enable, and
that patch would consume memory for no particular reason.

Maxime
