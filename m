Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673F5FD8DE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 14:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0B010E20D;
	Thu, 13 Oct 2022 12:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD15810E201
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 12:11:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A9635C00EE;
 Thu, 13 Oct 2022 08:11:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 13 Oct 2022 08:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665663070; x=
 1665749470; bh=+kmMB+Y0H+JHQFA3Whpj618NAI+RsbcCTAHKIiQVbds=; b=x
 dJb6gZRLUnCaJgY9qVnVPXg2Dxc0lsRv5aEyDCNm/mexguj+zLbnLx2koFsJinsS
 10LitBXqWNT3wn9lMDkIbyvLTcg+tkTpLlegX9Nlo/fXS8mr0ROnBK4pE6NIoLga
 txDNXUpXd4T7/0DqLJWR82Jj+vMtofLZREAzOmLbwTo1UAK6zvlnY6xTl72SKLlB
 IkDs53ugIXIy/IFxJ2kYF9viY6/74S2z3+zC+SsMlAH49VEGXHceLFADmke3PyeX
 c6U29SjDo61WgDeEmGLBQ/iUB2lsJOJ4a0tj6Yy83dlqDGf8TPkGm4BrZfAfGKam
 q9SOQPw12EboNDlgZUvhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665663070; x=
 1665749470; bh=+kmMB+Y0H+JHQFA3Whpj618NAI+RsbcCTAHKIiQVbds=; b=O
 MOZl0mjMeehSSuhC6/gNFdF1dZQvpalzzTGBoJ0Wq8NmCsuabQMEhhTml9a3MpWh
 aBo/sg2n+wYHNLmGbZqsfZiPqg2qkosgdjqb+BFcgxoePLDNCqT7QKhjRed0iCku
 LA69tlFXqCVlcTnhuCU0N3mbnL/+BDiuN3XW8e0oK2Z6iu3rL4ckwwEbXZgt6aRX
 LI4Bm1Jod/mpksBQaYIMoDSkN5ZuCcSY9XpwXlNa+bhrtFWol3KDORz27M0REAW5
 lwQIFPOI5kn2GeAVbo+hCgCdBl8ThrR7cUd8mSXDgUFD5S45WtlXN3DkzEIqyFjM
 1JM3p/2ZCZcrptAzD1Fdg==
X-ME-Sender: <xms:XQBIY-0Lg8pzFyw7j6TtFmbV1i3Q_prQLp1irh5Jr6BxoM74tSQkyQ>
 <xme:XQBIYxEe9cJ1Vg0Nx7v0jmsDWsJtchFF2aKAnT4ghJ0ayO45zeY886RENWchBN6Tt
 3kNOY8WuAEp6D1ADPI>
X-ME-Received: <xmr:XQBIY25rbai-tENzqIdpKqOYJX9Lodqc3_-wuUJnfaP0C6xagp6P7-bcIXF3tp9z3msEhuwOfLKT0K0UY7sfDfU4h97L-d01J6G7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XQBIY_39Zrdz2BBa614gyaIk36WrWKKy1m9USvK-_cmF8SBor5TxUQ>
 <xmx:XQBIYxE3i2Z3wG0UTtM4FEolf4X_UfHaibMDiTUEIGOB6PBIc1wzhw>
 <xmx:XQBIY49UUr-dUSxoHFkLS9o6tid9Ws9439KoCZj7K65Af280-tfhng>
 <xmx:XgBIY3YLJsQHBWtXPW4NSxNfuaR8s73bTl1I4Lvg0dq_d7XgleFPeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 08:11:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/vc4: Add module dependency on hdmi-codec
Date: Thu, 13 Oct 2022 14:11:02 +0200
Message-Id: <166566305525.1731673.3723228232123982344.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220902144111.3424560-1-maxime@cerno.tech>
References: <20220902144111.3424560-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Sep 2022 16:41:11 +0200, Maxime Ripard wrote:
> The VC4 HDMI controller driver relies on the HDMI codec ASoC driver. In
> order to set it up properly, in vc4_hdmi_audio_init(), our HDMI driver
> will register a device matching the HDMI codec driver, and then register
> an ASoC card using that codec.
> 
> However, if vc4 is compiled as a module, chances are that the hdmi-codec
> driver will be too. In such a case, the module loader will have a very
> narrow window to load the module between the device registration and the
> card registration.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
