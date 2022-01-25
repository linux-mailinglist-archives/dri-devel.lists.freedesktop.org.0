Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E176649AFCB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90E610E904;
	Tue, 25 Jan 2022 09:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C269B10E8FB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28EF8580699;
 Tue, 25 Jan 2022 04:25:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 04:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=/d9rzkpBiv9rmz
 b20igJe8/IGFXvTFtNWU8KjbxKCxY=; b=Gtoa2p63l1dXQzpZ/FQeVNRiFLhjmM
 cjTBOca2khNQSVRF58jHc2UkZnNyt9NuwrTUdktDHYa49A/Dh+AaD4qzEx7EIn5g
 BnUIemI+B0RIoHMcmWPLbHu8kC87KYurpB9DgUZCKf3yBjSRKiwA547yI5zUfz07
 yhCOKxmJAqbeKHrdK4uaTL5LuoPzx2yfexf/NPurV2yJZHsgp1emhW2ZvjpfXW+O
 m0gvo1/UNGwGWwqdDY0KsyJM+dmvPuoIhYSDelbNOyRfWboSunfOZ8gkmpcwB1K2
 pQT/xS5iVf5rhPaMl5UcA7V7tqRPliVRSNL8Up8pRHyrXuFgna+AsK6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=/d9rzkpBiv9rmzb20igJe8/IGFXvTFtNWU8KjbxKC
 xY=; b=iUzAln1X5VV/dG2uuoiYp0G9Ts2hPhd+lNHILjOqwyUjQhjecqhcrwjgi
 pb3mKhtYn+r6RhVa9uGWvF5SHidckwFEkyTVo6mQXmNu/hoMH4yggPX6acGoCYUG
 j75ixWJAFmmOvs0zVUtD22VS/79dmhWwikz0QSqWBQ8QjGMddlp16ePb73aZDYGY
 qsOc35fkmxHmcv8Fk2/ZA9Q+yMeCu07cQwAayLSoud+hC1iLA/cI1X28qM0CK+E4
 fy/+xv3xcsiEZTm6bKWQQdEa4mKlq9vzjvzFNfOG/9wjBgeF+ysainVXz72F/aSD
 B9r/7NcKnK3MgDVkhOcdt358fiq+A==
X-ME-Sender: <xms:EcLvYXYhunAhIpaVgbHwtmwNbWA6u2N8_3PT_-fbNvymMZ3afMuTFQ>
 <xme:EcLvYWZfDq5Nnt5g406EKktHYJGepdF1x4U5EmrQyrdrvzgd7tEcZOt3yJjTpI0Oc
 ckmxAzZgD6YLL7ytyw>
X-ME-Received: <xmr:EcLvYZ-aPGM5zRLZRrtNCGMp6tMbQ4JIwU1m3xwV-33noXbvRNXlhUb5dN7BEOzyCLIIYSmEMY51X3HsCnBLJSwB9IUU7mnLBpHnz1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EcLvYdobMGX7CBqgBwZbYX-c9C8KrrofybpxvNlSDfkd9kBrzvx8yw>
 <xmx:EcLvYSp8vUNjRG3CnEvnOg-fuD7dUsyyKBkmJ1O6aZb2vuDLFekSow>
 <xmx:EcLvYTQ22nitLwuvwDkJLUFTOdVaEyUWbgIRMMjRBWVK5YIDKpCKlQ>
 <xmx:EcLvYR3nS40VegV6GvZNibsf_MAD5diQPhE7ESiRPSfwPOShSSl3BA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 07/16] drm/vc4: hdmi: Move XBAR setup to
 csc_setup
Date: Tue, 25 Jan 2022 10:25:16 +0100
Message-Id: <164310270997.583056.4349515527066110046.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-8-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-8-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 16:16:16 +0100, Maxime Ripard wrote:
> On the BCM2711, the HDMI_VEC_INTERFACE_XBAR register configuration
> depends on whether we're using an RGB or YUV output. Let's move that
> configuration to the CSC setup.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
