Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A549AFC8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A1A10E72A;
	Tue, 25 Jan 2022 09:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C449610E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2ED6E580699;
 Tue, 25 Jan 2022 04:25:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 04:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=tEOaY2dnTCSzgv
 5fraWCoGkbmyQEoBnOyCy0bBl/Qmw=; b=icMYA6Psuz347bhK9C95WMX+8MzCLX
 bEDXskckCuPkDDt2BCmgfumc1pwqIFgSupilFd9dnqrasDojBgpKYenXt5v7VshR
 9wfMPQw/WQdmeRzGLALUENKr0DlFrLq7Ld7r3jTDZcZZsQwgBQJ1xoyC0ozyrefA
 in7k8DT32hw3xknkB9IRxBbP3BLwyvoYJd4a14f8tFSDuSJUrEWNVrJbqnQV5bd4
 OD7/XwfcNI/DULW77LB5szXKMzNsxaP+Om/DCqYptIYcvoL7au6uJurhEP6UoakB
 xDwd3mQJh+pZx4ELVZ9xuwItlME4D2eQqcx/gU1pkY6YDZx2qlgg+uWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=tEOaY2dnTCSzgv5fraWCoGkbmyQEoBnOyCy0bBl/Q
 mw=; b=bfzBN+IIbc5haNQcN1lU+rkTDgOCG0at4F0OCQZEYa73TkKY/9b7jeyvJ
 sWjNnbYVgY+0EAKIcIkE3T5OB70TqsfehjFVA+1Ct5TcUL4/6vok6u20RCy20oyB
 CJ62y5kdebVAC/uLXO3Dm9IgWQE2qly0xFCOPeT8Idl4T6uzA/cTRq07yCRxBHx2
 SdrKPFY+j/vI83bOZsAmolH//zShKdVWc4TDIvHI6fFHZ3qIoKeTYjaPJVPN3AwG
 kmVz90wLp+4K5FA6goky5AfcXFg1Py9lMGHwTprklWZ3HfR/CxRQtvVu3OqMtcXo
 cxXtAkkPMvOdAz0P+B3xb8ha/nvag==
X-ME-Sender: <xms:DcLvYTnP-lFhPZCEzAwUVfJb5170WuZU-qzVdg4G99nwV-e0YJRfJA>
 <xme:DcLvYW2NefzIpF_fF1REQTI9qJF26qmm0tvCETTuEp5Z8lDCKMASuJgLlZ8PaJP1o
 CjMikGuM5rfDseCIp0>
X-ME-Received: <xmr:DcLvYZp9rZJqX-aS0H0szttOmN6_RYaMdy4QuBFp1rfIzD86hyDRCFLxEyzmEGp6TX7sGCCeqbTOHnNCIUYIPi6Yj0e70cuZ33HOAEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DcLvYblCku011fzscFzF_Qr1I-22eKGJnXzFuxU_m1Mlgep5h7b0yA>
 <xmx:DcLvYR1jCLxnHRamMxfCDwa5hAJOhyHqpZL-6YKwtivLTmHGJNV5Cw>
 <xmx:DcLvYavdQJ6bRBptf1d1Ci63qdh9WIc8YxEH_lqxSrKJ7Lg3iGBDkQ>
 <xmx:DcLvYbyDkS--lUJBYZtlndndx04md8QhlvUf1jdZx9TYBCgNUu-eYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 05/16] drm/vc4: hdmi: Add full range RGB helper
Date: Tue, 25 Jan 2022 10:25:14 +0100
Message-Id: <164310270997.583056.12113276121229804086.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-6-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-6-maxime@cerno.tech>
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

On Thu, 20 Jan 2022 16:16:14 +0100, Maxime Ripard wrote:
> We're going to need to tell whether we want to run with a full or
> limited range RGB output in multiple places in the code, so let's create
> a helper that will return whether we need with full range or not.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
