Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36C27A821
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D832E6E3D2;
	Mon, 28 Sep 2020 07:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D62C6EC93
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 11:38:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC32C5C024B;
 Fri, 25 Sep 2020 07:38:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 25 Sep 2020 07:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=2
 TJ0U0xCsiEyKFuaY9REmNmn7RYkEK4DVkQfyTbUUH0=; b=rCLh3fkbt18vaNLLv
 A/4x74NVZb6Gl06Z0Umm3uXsHRrsiXDUwHEW6RIIqfdNOFhF42oOPGA8P64lZeKW
 7tugW9sL5cDyJVYKBOfIjuZ0ZB16TgoodcVX1A8qQ0wTROJfeyBdNAKdwlsTBnsC
 A9kGXdJSpirDfY4wloo+dHNjm3zwisdbD5yB+3xPdlrtL3zPmOepOiHfevAhEPSv
 7ZS/4JfhLo6pmelTORBuvmsuRCXwQOCALWdxOnOGwXLvTfIw9vxmirVeHf+MK86w
 z0g9/Y2F2La6KS3lMDcRFRIPM09dP6v8A22rlXMB+f9G+c2aLHfnn/XGDDHTlTDh
 FAADg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=2TJ0U0xCsiEyKFuaY9REmNmn7RYkEK4DVkQfyTbUU
 H0=; b=mBCnwSBbYXpF47Al0v5raedvS6udbwwD5hwr7fbYytuxSYzNtesCiRzy8
 Qdu6N40vpomQC5MvvD7cX/xZthzonfca7zp8OxDjM8kb31SbMy2oAXorm73dR5wo
 H0HNcGfYtSJ8SibNTzvyvmstFVJDqURJmHOb+ffJvbcJtQJhIGkmnBEQIXJVcCn6
 mksQGNs4RrxZKTOR6q8nQO5vHajt/gZfFySt82hJarS6bMvyOUvo3KDdkxlD0DMy
 vJefK7QsOnlwC/mXvVaAxelN+not9Tg3oR/YzkVD1205y8JwgWDZNwDH1hkJd8nr
 /Zmf/HpjdikxJk2BvZwivb5KC1z5w==
X-ME-Sender: <xms:wtZtX1BYw0NQN9LM9huuyiXBFisAOi7k-VybfvRo4VV8ZnynEY4Gaw>
 <xme:wtZtXziWOm30Zl_YsO_rBIBRBbfXK98SWaKlQhYezZgbo-dGpYJg-erKi8moFSU8y
 cGSMIClEHC6AvNpqBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wtZtXwme6CcHMM9RZMcqOicW_tqqCiK63jomrEBIB9RZIsjPlGvYPw>
 <xmx:wtZtX_zLNr9yteapt8JA19woRcFcwIyF_GfLk5XOQXRWUhvj2K4cyA>
 <xmx:wtZtX6QGLXaBeDdPWoutaSXBf_fScDY_xsRYXSWwwt7elBsnCCnGiw>
 <xmx:wtZtX3I88ddWgEm5siOsgsscHHU3mmSQ43gVldCfptMsQQs4L35fEw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28B0D328005A;
 Fri, 25 Sep 2020 07:38:42 -0400 (EDT)
Date: Fri, 25 Sep 2020 13:38:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 1/2] drm/vc4: crtc: Rework a bit the CRTC state code
Message-ID: <20200925113840.nemma2q7stujf57f@gilmour.lan>
References: <20200923084032.218619-1-maxime@cerno.tech>
 <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Wed, Sep 23, 2020 at 03:59:04PM +0100, Dave Stevenson wrote:
> Hi Maxime
> 
> On Wed, 23 Sep 2020 at 09:40, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The current CRTC state reset hook in vc4 allocates a vc4_crtc_state
> > structure as a drm_crtc_state, and relies on the fact that vc4_crtc_state
> > embeds drm_crtc_state as its first member, and therefore can be safely
> > casted.
> 
> s/casted/cast
> 
> > However, this is pretty fragile especially since there's no check for this
> > in place, and we're going to need to access vc4_crtc_state member at reset
> > so this looks like a good occasion to make it more robust.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Based on the issue I perceived with the previous patch, I'm happy. I
> haven't thought about how the framework handles losing the state, but
> that's not the driver's problem.
> 
> There is still an implicit assumption that drm_crtc_state is the first
> member from the implementation of to_vc4_crtc_state in vc4_drv.h. To
> make it even more robust that could be a container_of instead. I
> haven't checked for any other places that make the assumption though.

Good catch, I'll send another patch to fix it

> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Does it apply to the second patch as well?

Thanks!
Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
