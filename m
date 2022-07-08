Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CFC56B5CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2416010EC74;
	Fri,  8 Jul 2022 09:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636B112578
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:42:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 34A193200A24;
 Fri,  8 Jul 2022 05:42:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657273350; x=
 1657359750; bh=C4A/79K1Ql19+5byL7gOIYc2RdYztbQ0geBhMGr+9Aw=; b=T
 Vumf681hIjHVcFC385+cjB+R/KiNf52ukPEWdviQo1ibax9YOGkU3R99jwp5d65e
 +DBL4/sFhi40HEfs9qMiqTN22C7kQF3tiwTrxmY6rJx1NRE+RIp8Ca4EdIEOteOg
 upy0uQg4OeVHLPARs6J+X4I6qFDiifH3AMj//iPBYsDPbZ46UqnF/lSqmMk+vilv
 m2rx5b2bAHzFCxRO1nPWoD44xChT5h0DM6mAKcPON2ArdIU6D1KfLSt9AHQn0qlq
 GLqLulR9wSnVWUTKMqIxfWPjgHJ2nd0iZC97uhrrw70ZU00GzxXFNxotcAUWX7ij
 wxYbCh/6XLiYf73MyapBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657273350; x=
 1657359750; bh=C4A/79K1Ql19+5byL7gOIYc2RdYztbQ0geBhMGr+9Aw=; b=z
 pSZ5JdMd2iQ0yVkFbLkGFNUkLNZYK3GMrVT3nWByjt1BKiRXzeZg0mG/rbL+f/jg
 TaRZ/CkL67uLrE9tB8HIKzOU6upEY6/5wIG3rdvOt3zUrxF1CGadtXZMpt3IulW6
 gxgJ7ykwN9cK6NAuKrR/Bp2CNEf7ymFCA+k/VYFpqalVjLEFUGZcvHAMqa4DL3vQ
 cJYQ1IHSP0/IbtmHV2ia1hOo/z6hTX2epywp6JHfaBpJJfc1VWqqT6jS7uYpIX8A
 MFBKuzldMhunugxk0jIFg6PLJMGhAOQijaxgQFW51IPipNQOu9qMxYBNFdL2fgEu
 gRbTOKholYanlN7yrwu3Q==
X-ME-Sender: <xms:BvzHYi6lrUrjxWyK2wR0RI8vedsvh888fqgvKhR09iatXFhf7ZC0aA>
 <xme:BvzHYr7EtEA2KUMdVhpDUQDL286YMJhvJpbYzcVJyRwFzlL472ibSAu7Wq80EgTC0
 uhZ5LGhlHwmxlcJ_ao>
X-ME-Received: <xmr:BvzHYhfRQhDJ4uhoBdQDwlmjFZmG6nLLjmwSDMLDQXovEloXVZt_w0CjhRUvilhDuWUE4YalmQmxwI-0HG3muY0R3i8FAsbFUmGjB-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BvzHYvIcZex3Du3joei3zhx-n0aw6U7pGMLnFlzJ8eSgHNqemn8V1A>
 <xmx:BvzHYmKDakYDZRvLMrPz2Sd1dwtdLvNNIrUJVcTK-AU3bGjt9KGk-g>
 <xmx:BvzHYgyZokiRRwWnwmMk3ed0Vzga2bDajNq7VKazd0-dSJ6iK1h8Cw>
 <xmx:BvzHYrEktwNIjbsCuf-oNxVfe0ysFJSVhoIRgD_xjiyMKDYo9GXPRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:42:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: airlied@linux.ie, maxime@cerno.tech, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, daniel.vetter@intel.com
Subject: Re: (subset) [PATCH v3 38/71] drm/vc4: hdmi: Rework power up
Date: Fri,  8 Jul 2022 11:42:22 +0200
Message-Id: <165727332093.195632.8305509992446143168.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-39-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
 <20220629123510.1915022-39-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jun 2022 14:34:37 +0200, Maxime Ripard wrote:
> The current code tries to handle the case where CONFIG_PM isn't selected
> by first calling our runtime_resume implementation and then properly
> report the power state to the runtime_pm core.
> 
> This allows to have a functionning device even if pm_runtime_get_*
> functions are nops.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
