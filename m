Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8AA446306
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 12:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C5D6E1E9;
	Fri,  5 Nov 2021 11:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF6C6E1E9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 11:55:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A616E2B011A5;
 Fri,  5 Nov 2021 07:55:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 05 Nov 2021 07:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 2pyeWZ2E1x1KEGH/jVF7bqL3NiTBZeSGniCmlq96Z/A=; b=dxialj1GP3kgb4q4
 ynPTU7bgb0aTc0VDBcXlwcCaUTaQ2CXjVrNc8DMWCHLSJte5WCyhwi8wgTGh7zxJ
 UhcpxHLhqxz/+BvESfeSZvj2plPrk5aKKNXX6MPHm/6+Ms4tmL1b/+r9vO4P20kv
 hs/FkPLWSN55FZdp84up2sjwWO+NJvjyC2CWoF0bi45RSXOtFIPqc4X6ycs31gKk
 iEJ7/n+qGGb15GrXyujxI/E4hm9RVShitnrGH2xL9LWhCIK/1jLazkzHgJLtdspv
 +z8ECzMXghbFAcH3SGB+P+utSQFK0dkNpbTd02+3KKjGOOONNVecb6DKH2hdMHoK
 E3h1Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=2pyeWZ2E1x1KEGH/jVF7bqL3NiTBZeSGniCmlq96Z
 /A=; b=j0pw4HU+6e3fxLusyAk0yg3AU2N6SdkuWCQheWhyZFHepNF8XwhIaM5wb
 DhCH6jhJW9jv2ORrDU37bs7StY7dWbrf1B2iq63mc+USHLEJkd+rPtVv821LbIVZ
 oaTq5Hqkg6zH67mH2dVJWzxComiRoXI8EMsVroRJ/NX2thyWi2ETFE5pJvQNo90M
 qJz0T8ANOVVH1qTHQHWLXHAiGfGiDpoAVstglxmZFstYTplb4R/n/9JM+QMojtq5
 Ynv5Nf7eDgmLEvoMghcIfxBiyRTL2P8Zeiyl06Mu0U1dlzpj+Ns2dvKPXdVMEBDy
 4bBiYuX5SnVfaUhL0MKe26IyAQB5g==
X-ME-Sender: <xms:nhuFYWrRab2AQN-QB64EtQoi4jot5Kdwe3hxEyoaCjj2alaNcqfkTw>
 <xme:nhuFYUqC4fkLyJOFUv_O9yceuv7XvJnUrfUYaYFU_fAZLTq9E9Qk8_mWx_7PLkxoR
 L9ApQl4nP5ItzM7EMA>
X-ME-Received: <xmr:nhuFYbNNqz_oXMIrhrUTAQ7ISBIpUwcJYODIcSXe6SI63zdAb4sz_ZSuEMEQosyDJ6yHaDE5DvzItv5_T5mqVSr47FtkJO-kc-ReGDJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleetjeelfedvjeffteejheffhfdtueegffeljeefkeffleetkeetgfevtedv
 keejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nhuFYV5TpiPFyWt0DaLqDVPNXAOIJmgv6lQrt_ZODKtaU6YC2AEUfQ>
 <xmx:nhuFYV63ozdT5f9wuTsICD3t7del3UmQkQPMV10mSP7G1VadFLnkzg>
 <xmx:nhuFYVgjAtcE8wsgN8xlKjHZ5R6z5-o0H3-lvV77F40ReoQYNrIYAg>
 <xmx:nxuFYaEHj3020sbnu5uKYpyGzHZYaqVEUNJyA4JJPyHSc4zsb0gjCNedZnc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 07:55:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH 0/9] drm/vc4: Introduce locking and remove !KMS state
 access
Date: Fri,  5 Nov 2021 12:55:03 +0100
Message-Id: <163611329277.229873.1346692461600186942.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 16:11:04 +0200, Maxime Ripard wrote:
> This is a follow-up of the series here:
> https://lore.kernel.org/all/20210924135530.1036564-1-maxime@cerno.tech/
> 
> and the discussion that occured here:
> https://lore.kernel.org/all/YWgteNaNeaS9uWDe@phenom.ffwll.local/
> 
> The original series aimed at getting rid of the encoder->crtc pointer usage in
> the vc4 HDMI driver, some regression was noticed and the following discussion
> pointed out that we were doing a fair number of KMS state access outside of the
> mode set path, which is disallowed and unsafe.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
