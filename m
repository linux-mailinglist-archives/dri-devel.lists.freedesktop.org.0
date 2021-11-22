Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F44590E1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75D089FAD;
	Mon, 22 Nov 2021 15:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E560489FAD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:06:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 505D55C016D;
 Mon, 22 Nov 2021 10:06:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 22 Nov 2021 10:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=K
 iR+UZv1p+Lkivlzd22q2DRYBosZiCpsvvTZHi2S6j8=; b=O1TM9DOZR99iF+wxN
 iS5q8NonDhxGgJQMurqK8CGbfMkgXeD9brIT2XZFXaHw2nSW3FPHrUUjQU8wvRaM
 E4Yu6sVXv+LNmz9dQ7LHrvIYBxD4t8+hK49RcssSW6hlkrB2zMz4oP+CUPpjXMvh
 CtXZk+GzhSsF6SIwzJ46ENOO1mpdnRt4xXweLSUm/CvxDWVYtbYMwQdTUBif+tuL
 12/BRpi4XcvlmLSGwRosJ8/eNPebxX0Tct5D8fJTsaAdRX/aBJMQTkoGyjVyb4pv
 I9OHr0IUCr9wqrJLVV+oDyet3MxSqiz97lrWT2gRMe19BX07UhNxSidA0pMFfqnF
 cZbiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=KiR+UZv1p+Lkivlzd22q2DRYBosZiCpsvvTZHi2S6
 j8=; b=MgpjcD4l177qGKD4D6Tq/NaJVgAOAeK+ztC98D+cdUOsvxXQknO7/g7/Z
 0bl9XQFe32KuMDu6ZhRgXXGVqFP/2r/bVFPbgLWSrAjlqStAPZKPUgj7nOBwVkzq
 d1MwDyhm+xLswS6otX7PNqk9Vefb2xGFKE7/arPXVGrvy/5DfkfF3gGBqSzV/E/+
 A3FuOKCAMEywhPTfYVuLx+URTO8Zwo/uFZQYyC7Ub+aW9rmQirepabCbpvqREoom
 ciQ+V0rmvO8ddxPxOPpVYt+bYzTo67ImcF+aMjqsVDObPKhmj0/J472MluoBO+Pn
 13TpRkYcFi10z/X0rjqxbSyo3D6hw==
X-ME-Sender: <xms:5LGbYX4yBYp3_b1EkqVnExiucl1-AS4CFZ-Ana8FOHhH-KBzw93fTA>
 <xme:5LGbYc7PsYffyuSnUwxw2Jw1iakExyiaU4Q5jnN_7MkSb8K6ixefFYii501_EOCP8
 rah8D59deox2VdqLcc>
X-ME-Received: <xmr:5LGbYefmsLSd-ZJKniPzWRC1HtuBqzBQK41mxDuc8MhkBNZXfspw-OW--GNj53PiMKuWQCPNtXBsd8ywqFkgq1BsyWNTroMME-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5LGbYYJGnVIYdsuvnkEHe8h26NvN4C-wh6KLsYBvzbV0azIsq5wItQ>
 <xmx:5LGbYbKVa3K400S8oGmkq08sybuumXQtvtGnbaljdNjVoOLqSKCnaA>
 <xmx:5LGbYRxFSz12tgJ1jG5c-F4s5E8PC6RVkIK7KK7gisx0qZpGR7GMIA>
 <xmx:5bGbYS9XE7sFHQQxP6X9t6mgpwvDRfnybGlIhs8lTkYPmXSFm8TVuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 10:06:12 -0500 (EST)
Date: Mon, 22 Nov 2021 16:06:10 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
Message-ID: <20211122150610.mvltgil3yquli4qp@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
 <20211122100759.qw6lvwb33ciemg2y@gilmour>
 <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
 <20211122132847.ds4gtk2unq3fkagy@gilmour>
 <CAMty3ZAzwKtABZqJhVDmgOVpnZFg66z6Bc_pn3Fm9=658RPG1g@mail.gmail.com>
 <20211122140929.22cmvnxxapp752ic@gilmour>
 <CAMty3ZBOYRJ5ScrYEKoA9e1hP9=yuKuASvXyorB_kLsp26Fe3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZBOYRJ5ScrYEKoA9e1hP9=yuKuASvXyorB_kLsp26Fe3A@mail.gmail.com>
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

On Mon, Nov 22, 2021 at 08:01:47PM +0530, Jagan Teki wrote:
> On Mon, Nov 22, 2021 at 7:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Nov 22, 2021 at 07:21:57PM +0530, Jagan Teki wrote:
> > > > It's perfectly valid to dereference the pointer in atomic_enable, a=
nd
> > > > that patch would consume memory for no particular reason.
> > >
> > > Again, I'm not pointing any mistake in dereference and certainly not
> > > understand about what memory consumption issue here.
> >
> > You add a struct drm_display_mode field to struct sun6i_dsi. It
> > increases the size of struct sun6i_dsi of sizeof(struct
> > drm_display_mode).
> >
> > > I'm doing it here since I'm doing it via mode_set in other drivers. No
> > > problem for me either way.
> >
> > But *why* are you doing so?
> >
> > There might be a valid reason in other drivers, but there's none here
> > (that you mentioned at least).
>=20
> The reason is to use existing bridge function instead of dereference
> ie what I've mentioned. I don't have any other reasons.

This discussion is going in circles. Unless you have a reason other than
"because we can", NAK for the reasons already stated above.

Maxime
