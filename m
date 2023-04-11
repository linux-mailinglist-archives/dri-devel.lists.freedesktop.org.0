Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993616DDAE3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 14:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C2A10E101;
	Tue, 11 Apr 2023 12:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAAC10E530
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 12:31:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 865CD5C00D6;
 Tue, 11 Apr 2023 08:31:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 11 Apr 2023 08:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1681216311; x=1681302711; bh=3aIknllDpgm3SkoUE3CkjvmdtB4XQCJjgC9
 tb3+wVK0=; b=psu85xKVAcESl5r5i3mvVaDrTFS8pLBS3srFTl1uYbHv85Hs0Pt
 wHMJ/C5b7Qq2ZBodG/NyaL+tsIOTc8nSTZIe2K1QE1ESXmTnzHo/mwyQkph2RcPv
 yoSQ+8YJH8L/9MOyr5ia3etIkEJ2ErQwdY3M2irRXe/opEgi7P/MFK+0dwHHzhEa
 ixsYQ2zqfm70IlyXz7ES4RWsRb+/LmJSOBx1qdC7XyaaMxjyJFrK4I2EtbCSYLqi
 NroSNX3u7pVZYZSwniaC+jyYNiopvdZkWIHCVoFCrAVAcXocRiBWXci838jZwtrw
 5TTDdN6PvyBMez6Inz5XLuyPJ6gynr3J/IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1681216311; x=1681302711; bh=3aIknllDpgm3SkoUE3CkjvmdtB4XQCJjgC9
 tb3+wVK0=; b=QMnUi475Q/oJILvmni8/7WYcQCljg+mtWaJtddYFSH29/3BZH/E
 R3nrb1iUaCfYU1H8duhnfj2TSTK9Ql6POgyo29UvTx8nCxuZGALA8bKhY964rsYE
 9VAaYU3ov9Wz6GuI3o8ovJRTzGtgyTyO/pT/IJmENWQlwGmgnTNiQj4xa+t+QnSp
 3ZUKni6TJ6gMII/PG5PsSdwTRcWtAZhkly6wdxIyjJCUB5Fu70z/HiRsNh6vHfnE
 djVLK8EH2LLLNlWinCJ7oH8clYybIKux7cqxRKW5MpOhhN64zYEnXYltx9sWusCJ
 jBHhdUba+p4ENZsK+0IC9pFU5XZPX/stKHA==
X-ME-Sender: <xms:N1M1ZDIR0GNKwTzkI6XLv3xcSOqg5It8ACCxanC0Ofq9Yuf9b4iC1g>
 <xme:N1M1ZHJaGO0dNu25hDQ2curJX3kQMpAN-Q22ZRnxWLCJpCaaGopfMO4WG_-TE9POD
 V39qZTDvo7n2pcU0s4>
X-ME-Received: <xmr:N1M1ZLtGGQl4Gk7EjkjYO8tVoireWvW3TB3Z004_Jz0lYdVzwiLH2O6RO-Ny0FIpZ2T4PXdQwzLqaT4CO195tdVuETVlzo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:N1M1ZMaLljgTtRUfYJMV0oJuPXxT3nY3VfEANcBY_bQsDMdXRsDEzQ>
 <xmx:N1M1ZKYreSRioshHGNs99-hZLb5npRQGQgvfCV95JBmZaXbGWdcHeQ>
 <xmx:N1M1ZABWvRb0h8jd8i0WERKuap8zvpjBrvK115vQcHQBfWQsaTGrLg>
 <xmx:N1M1ZPMmDC4KuTkIjpEjimWRkzQpKt172gRfv4VRdRD55mDNt3vEHA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 08:31:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: emma@anholt.net, mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 Tom Rix <trix@redhat.com>
Subject: Re: (subset) [PATCH] drm/vc4: remove unused render_wait variable
Date: Tue, 11 Apr 2023 14:31:47 +0200
Message-Id: <168121629600.140695.7798788569326447393.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406151203.1953812-1-trix@redhat.com>
References: <20230406151203.1953812-1-trix@redhat.com>
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 06 Apr 2023 11:12:03 -0400, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/vc4/vc4_irq.c:60:1: warning: symbol
>   'render_wait' was not declared. Should it be static?
> 
> This variable is not used so remove it.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
