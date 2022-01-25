Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C549AFCE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9711410EDF5;
	Tue, 25 Jan 2022 09:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E9D10E904
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 30A30580DB5;
 Tue, 25 Jan 2022 04:25:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 25 Jan 2022 04:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=iS6ioRIKa15mNX
 dWruz4W2TXFR7NzCdQEhMlt277keY=; b=PzVA1G2qfvjmRnTTNYWfg58fWOHk7v
 54EhD7pa581bdiNoEUDlISDUfDB4ow7tqGMm0zyJcKd5BeAE5u17kcwiFG34zScw
 xBsks3+br1UVxlND52p2EIrLNQV0RLzMdDBmbrvl1NBcXMs2Omro78mopQW7dRlY
 lQT1qcYdtHcF0DAOrTtNrVw9GRyHcD6gHHI/tXjJ9hKbb+LZyGNdCYVe1mtJlFDj
 9daQs62cc3PlWhEagsSNNKf9AFz32phlqfKucLnNLu80DxSXwvHfpTaoiLQqexj5
 jUFbhHhNSzKwYrwLRU74CRHvU/alYM3vhAXIdeymyLKI6/9H+7DxlrpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=iS6ioRIKa15mNXdWruz4W2TXFR7NzCdQEhMlt277k
 eY=; b=Of1+FDTkTudLRXDNnVg5Q56UmTF8/+UR1it3Xsn306/gxxPh6MypZ2I+u
 3bnlBvTuxOzmn08Rvd88/EbCeoxYoUcElP+RrpHnat4BqYFqclThVD+O+E01biU1
 AiqrTgOGEslBGtDOAZAekfxTvcA0flVVEpIJhCHrNz73YQYkpP5Y0CW2AmghgUNk
 lX/UiMMS7PC2HcT9fmgrcjfQAElIm9qei3OaWDT7oQqEyzWBSOukzwjsubx1e+nz
 aYwN9ZFdQQl6cr3ydxKoW1BAwwjVs4dJadDGv9IvP2U6vxaZ00BYSftt/GYAg3gP
 RNzXMQII3/oycl8jrIbGzx4YxUUkA==
X-ME-Sender: <xms:D8LvYYtJ-U4s6dWnlIqCTo4AnrGpGtIDRUHNM2ZHMWvIRkr6DnfBQw>
 <xme:D8LvYVdOUTY7ag4kmr5QxA59n01VUjvnJTFIGMbmjQk4OhtTwenpksN_v4IcgLIo4
 -QqhIiK_Pm1CxBRQKc>
X-ME-Received: <xmr:D8LvYTzdlM7ZJJiCeqb6fVKTgvqaO3wP-Ag_yvVMQn-DD8aU1ca8UKgY3_XS7GWgdaG5zgcbxJwAop_kEVGVr4emZb0I5Q5Khjrl4GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:D8LvYbOGWfTTEm92dffMlxmzTfU70xJmTS81J4waIrUtS11FCbz5DQ>
 <xmx:D8LvYY_wahwk2piAfXTLTQ-SJoK_irs2I8WQnzjp0jEfTzPeWUpWMw>
 <xmx:D8LvYTWDY3RZQYX3ZX0dY17UIOMp4pFYCxlP0azDF6TtPDm26z3-1A>
 <xmx:D8LvYTa6-QNz_nJvVD2pgM4O69xN2U6VDTboJrfF7kYkBqCnREBekg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 06/16] drm/vc4: hdmi: Use full range helper in
 csc functions
Date: Tue, 25 Jan 2022 10:25:15 +0100
Message-Id: <164310270997.583056.6884613783171223185.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-7-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-7-maxime@cerno.tech>
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

On Thu, 20 Jan 2022 16:16:15 +0100, Maxime Ripard wrote:
> The CSC callbacks takes a boolean as an argument to tell whether we're
> using the full range or limited range RGB.
> 
> However, with the upcoming YUV support, the logic will be a bit more
> complex. In order to address this, let's make the callbacks take the
> entire mode, and call our new helper to tell whether the full or limited
> range RGB should be used.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
