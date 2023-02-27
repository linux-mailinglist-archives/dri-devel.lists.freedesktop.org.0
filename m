Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF66A45FB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 16:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C9310E42C;
	Mon, 27 Feb 2023 15:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9606410E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 15:23:36 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3488C5C015C;
 Mon, 27 Feb 2023 10:23:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 27 Feb 2023 10:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1677511413; x=
 1677597813; bh=M2kOdYuuIhiRxnfJ/lJYLql1ul3xwfOMmBdF2hwGzWM=; b=U
 xfYfVSZ78nB/59oJEKc9fqsSQT52EfW/y7mADAKwtwbtz4d9yIW2Ga2DXRpdVS1h
 g06RTF3hj/sKhCE+C3+pK9PArctcnbE9w0C1B/odyujCzrxCaD1+mvtc9NDf0jgC
 ECmsGVceHE5ekiZP3lBeCq2eQcKQVQUsvSbbkPgptwQwbOWIi8VT8AVensrLvU83
 8+SPnDJaib9pQdo/3/R8Ezh7YscRSMr4+feUjF/9ROpwSX4UfMsxIymzrixe1hFk
 TvCDcYX9kabFVhbFN21CwaCEGyHvbNJUmYzoRnXACvzET0JogyHGy2QTaqhRtFuD
 PQMM27Oj3L3yRRlsws/rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677511413; x=
 1677597813; bh=M2kOdYuuIhiRxnfJ/lJYLql1ul3xwfOMmBdF2hwGzWM=; b=H
 tmeX+s6m0FtGx1CJ6gsqMTQuT9+5bdlzCRXDZfDn5su36U4q7/KTNaqAiPLf0eAD
 Zk4TK9Usojr2OuYCdv2+jNCP4n9rfV8a6EkLlkdLgsJ1nuJ++mHd7RCPUrAhyo8U
 E9uatgcxOAdLozioLek6qaA+xwgtfhm9ChE3BufIZIP46AJ0Lny1qdZuSAI49fkR
 AVMVcbiHlUEBwYWg8rNWWzEip5X2JyIUpvuExL679f2fE1wY/oHIg5qNYi8wUVHF
 WtO3FGBe2QZPF9ql0Pm5HPGid6zoSBLTkOC/W4NNY2p8vpPMhd1/0nPLec3TAWx7
 P327TMi+VaGGDJMMnHwdg==
X-ME-Sender: <xms:9Mr8Y0qCifmYmewZxgEi4Kpq6xphax5hPGNkOi3NGarvHFejfqDhrg>
 <xme:9Mr8Y6oRyVrHd5Om-W3y1JeMDRVQTCuQRCWQWxOEXd6vgzNY67Pbn26ah_-6OTAQK
 BKFuQ9wkmGDjttYQRg>
X-ME-Received: <xmr:9Mr8Y5OZk_lgu8qcyE7DEOgN3t9Kdoo0vTb1RS9UxjRKkUfHhr3B3AZYWuJ3WELIid7ke2B1Hd1ilZYjbGAK6Fn7RZUg71s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9Mr8Y77hOTJzTj0hvaJuZ7ia8Sk2ctJ8-rQ3LmtqB7s4yAzIFAUN5g>
 <xmx:9Mr8Yz6W4X4l0KKxaZYwsf7xp0ZcZXfhB0PIvYHOBd-LVuGSaJbw1A>
 <xmx:9Mr8Y7hIF3mVsIU0Uec0XUuFMSWruflvL2xx5696pt13AhHaIa8-kw>
 <xmx:9cr8Y7yLptasvmiqiPav0Ei7yOch3h-vKrM_5sOLCH0n5jFS2AJWGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 10:23:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20230127154052.452524-1-maxime@cerno.tech>
References: <20230127154052.452524-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/probe-helper: Cancel previous job before
 starting new one
Message-Id: <167751138883.69358.14481331718322986992.b4-ty@cerno.tech>
Date: Mon, 27 Feb 2023 16:23:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 16:40:52 +0100, Maxime Ripard wrote:
> Currently we schedule a call to output_poll_execute from
> drm_kms_helper_poll_enable for 10s in future. Later we try to replace
> that in drm_helper_probe_single_connector_modes with a 0s schedule with
> delayed_event set.
> 
> But as there is already a job in the queue this fails, and the immediate
> job we wanted with delayed_event set doesn't occur until 10s later.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

