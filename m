Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B83561362
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 09:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331DE112824;
	Thu, 30 Jun 2022 07:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB11A112820
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 07:40:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4007C320092B;
 Thu, 30 Jun 2022 03:40:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 30 Jun 2022 03:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656574848; x=
 1656661248; bh=AMvqDQ8f+OjeHfV9rASJ/W+awq7Gaq8IEdTb5e5lnYA=; b=J
 tqPGw0kK0k/k6kLUHOreCuK2c8IiJc9fvB5psBRTIS8JfF1CAYlD8o7YASBgkSGi
 O4AKe1hiLZe4hOd041AwY1lT4j4POgpwVSo9ZzSjCdRjhTJhE1fj8iXo8L4W+KzZ
 MOEwOyw8SPaXY/pHckY5Y9PIzFD6QeNpR1UIK/wamPO4jw8LM4DBk8nRw7ANM22A
 nWdB4qutJ+njH/peOszaajBhGOO5Nl0J4qkybaRi/lCIn7d/hY0oBZTtc2D44Q6J
 M6K2C1Q0eNAtSuirkJ8TzphlzJL3SymJLhvbHA7hLyWqes99hMYMGkNjOUV7fxda
 W11Lq3XdR2QsII3I2f1Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656574848; x=
 1656661248; bh=AMvqDQ8f+OjeHfV9rASJ/W+awq7Gaq8IEdTb5e5lnYA=; b=y
 JMCFR76FABuyL85Tu84bAosN+u7Lkasv6Sj9y92Z3OU1pl8xwX53Ckg4RTGjkB4a
 LXDbRJzzMKHibBxMU8/Lb2blyJvxCQnn0yYEG146w/3kemx2EAt5RcTGr423f3yj
 VMxnbVyEEBPgo07sXyW1xX05j69AEb9g++Pte++smKYV5GOCLYBoxvqA95HnjkRA
 g4w4+nqb9RpqkivWzNcdBwEeYhgO+oeZ14x1dDGL7s9aUxdUN7qAS3WePNvgYuDr
 GhPsFTp/EwZGvzKzGKqs9Ho6gqBPCLUQeHN4++1i58dd7CnBPwQfd1znovualTjp
 MIM1jMOTn46ZbhkxtP4SA==
X-ME-Sender: <xms:gFO9Ygt30HP7y56s1PqRJdcOw_Y8wuG2UfFyreb-PeUfNlSEIg9-kQ>
 <xme:gFO9Ytet0CrOj-4QRI67c5Bt7-iHRaCq8EEvXBLip8ECucflU7Uh8mETYtaVVrp8K
 wgo1c4rG9imwZPchAc>
X-ME-Received: <xmr:gFO9YryGnWLvguxg5JORxfUoHoRRWU_sGBvqaK-JKV-IjtQrYFw4atc3YNrAtl-y5gIIpGGGX1HFwl3ez-0YQpFOMOZcXBRls4Z4drM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
 htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
 segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
 eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gFO9YjOyUgab31j3HFcrw2dhHhEULQemZPjW93nuwCvS8f77isEg9g>
 <xmx:gFO9Yg92l7ruYvIj_uHn5kSWg1XLU1-l3vOk5PWdUkRRjMDMH0tFwA>
 <xmx:gFO9YrVaSd_cYPeUxKNoPFyqxmFp-jJuFxS1CD5Buiqj3OIXw-QGlQ>
 <xmx:gFO9YtNbLdioDSNQXmkKoO9s9AEVnkco6d1IDhKs-sasN4ydKQ5FYw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 03:40:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dave.stevenson@raspberrypi.com, daniel@ffwll.ch, trix@redhat.com,
 airlied@linux.ie, emma@anholt.net, mripard@kernel.org
Subject: Re: (subset) [PATCH] drm/vc4: change vc4_dma_range_matches from a
 global to static
Date: Thu, 30 Jun 2022 09:40:45 +0200
Message-Id: <165657484374.261230.9959051107234808555.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629200101.498138-1-trix@redhat.com>
References: <20220629200101.498138-1-trix@redhat.com>
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

On Wed, 29 Jun 2022 16:01:01 -0400, Tom Rix wrote:
> sparse reports
> drivers/gpu/drm/vc4/vc4_drv.c:270:27: warning: symbol 'vc4_dma_range_matches' was not declared. Should it be static?
> 
> vc4_dma_range_matches is only used in vc4_drv.c, so it's storage class specifier
> should be static.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
