Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93449AFC7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60DB10E6C6;
	Tue, 25 Jan 2022 09:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B574D10E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2122D580699;
 Tue, 25 Jan 2022 04:25:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Jan 2022 04:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=qlUZAED03zdVbo
 ThHaNNbWaf0CTeDgNQrAMWY5jBa5w=; b=iLQkcjn1l2klU2qwnRvN1sq8pZz9nC
 JRxqv0TMdusI6KuvTnnUTKZXNaATQrlFWrcNqf/w7UkfXU3/40bGpdB4yj83LW8p
 F511c/HM5frz6QBDLzaGbZEOjnSuJrvjjQ3KdbGJaXXrl5rVZccRQV0EuTto8VUd
 Psb1X6p+5vyI1nlg74eDljwqIKJFBBgKdkoYuUfpVFFkeaHQeYX4v9hWQ/TlFSJh
 FR0LUvKpbs7RXKyFW9m0EuR1/YCzlyzzFb7TfVh2KaGHxRzpshe/GIiy/XYIBxrk
 OuKc3FMO5MNqJqmKWhkIINvk3acaBdMjka+n1xD2jzzap6pjOFYKqy0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=qlUZAED03zdVboThHaNNbWaf0CTeDgNQrAMWY5jBa
 5w=; b=nH82vJtnBKnMNwvH1ukY3snH7QjF5TL5We8aHL2ODfqLJWT8mtQTK3d17
 vA+Lx2d618dWcj9IXw319TLY+RTn5GLedUkAB02uXarnIGvnNoxdpkuOEpQgKaqc
 JmK3j4WT56Ey9aacAR1/QjNqmHh2hudpjNtvcQ0waSbFCc2PQm8lBTMN9TCU9cut
 QJvwPlzpY9jYyteCGCinO7mkdd3QzHBId/UbZEiJB3hljc+TmshO6YGIE9ejzJhB
 T8CBHuUIu9RBKeUp4Qr0N6lnoMLMbkHW7HMjzPrmtV8RSdv0ITHoqqgIg+4WQCSh
 DYSSKlhjVeiHmrvJOJ+BFw0P2Qtyw==
X-ME-Sender: <xms:C8LvYTM468LR3UmE1cMxrxMU8o1Xc6NiTVC1vOVxZA9fCI1dFagbUA>
 <xme:C8LvYd_bnqPJ9q_Z1wlJ3-olCgawttdRkpM32MuzhZKBGKdfRFDSoC9i_qey1G9Uu
 5SX65dPWbtShRdrwOU>
X-ME-Received: <xmr:C8LvYSRQIm_KW8LPJlr22QMt4G-uo-iYPeKfyhde9ySA43FUnpmpClTGvYGK_AB-pyGOIQqfb4-3bXcPW7hAZTtwEzC7irc5WYynfVM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:C8LvYXvjr4OCiVgOL8YMQYTQQcKUBY6oORr_waPsfD8h5iTZM16rIQ>
 <xmx:C8LvYbch7LNMO_0ADQnLhNSnFQOnvSsfmK0ubyaPutWtpihQFbmlgw>
 <xmx:C8LvYT1hbwmwHqPP7xDO66wmlwnFJMsbymbkeLVEFifZbmqgqeRufw>
 <xmx:C8LvYf7YQCC4-AHP92DpNG-tb2EIgtMZ-xDn5qLywn9ePstcg2VJiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 04/16] drm/connector: Fix typo in output format
Date: Tue, 25 Jan 2022 10:25:13 +0100
Message-Id: <164310270996.583056.11584319020241104876.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-5-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-5-maxime@cerno.tech>
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

On Thu, 20 Jan 2022 16:16:13 +0100, Maxime Ripard wrote:
> The HDMI specification mentions YCbCr everywhere, but our enums have
> YCrCb. Let's rename it to match.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
