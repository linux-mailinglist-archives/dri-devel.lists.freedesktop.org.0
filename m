Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A597E8A1AB3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 19:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B3810F254;
	Thu, 11 Apr 2024 17:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tyhicks.com header.i=@tyhicks.com header.b="LFrnW+gV";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="QjszwsZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 717 seconds by postgrey-1.36 at gabe;
 Thu, 11 Apr 2024 16:41:22 UTC
Received: from flow4-smtp.messagingengine.com (flow4-smtp.messagingengine.com
 [103.168.172.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587C210F04E;
 Thu, 11 Apr 2024 16:41:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailflow.nyi.internal (Postfix) with ESMTP id 9DA22200367;
 Thu, 11 Apr 2024 12:29:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 11 Apr 2024 12:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
 cc:cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1712852964; x=1712860164; bh=gqLmiSCFDE
 hztj3oo+M3RvxGGuNWOcopRWr00SfiOXg=; b=LFrnW+gVLOjXO932zV8JFLHcU4
 Z11oxiPjXEeIoTv+hRBxeNFBSHFRORV89RE+hDz8o/FNQfb0ZylM3LlaV7SfIbIh
 Addzl5MtYd6DCOKuuPjLWJpx7oS4vGZa3oYfHS1M59LR0YuAs7ja3h2OT7vsqFfY
 5lefW/nwLq1Gjc8RK3AO2aQKwckfEkr+nH8s5ZalQfAl92JZTgbm+Wg914c2UB5m
 eNqrL2vxBMmvDGIaiYP6BCPQg3oUbh782W0RrfBe4O6nE4nSNjLpbLzpSB9hnFID
 pXfng5Et+lGDZHZhWOFMibGKmgT0m+diqRUIayMGR5+j1SDWiOhyO1XbxcyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1712852964; x=1712860164; bh=gqLmiSCFDEhztj3oo+M3RvxGGuNW
 OcopRWr00SfiOXg=; b=QjszwsZVkv7GUJ0uc0dhoDjZrwffXdSQOTPWHmT4H3mj
 sdeyyErO2JxiM/ZM7lw+G2Xjk+V8dzc0F0tFHdo6JHONeBT/ha7tRiMO+nyluWht
 sCLk0CteXP+F0ciqwnwyEzKIhl9lFKOQejgIyx3d0knunefs6jkNYVEfPy6BfWky
 My4ZuOyf7c/xkIXD1YnRECJRudPOX5hGDB9SeyTh2Mi6k0tMbZfTJvdXYfILZCyY
 TMycg/iXXwbTaWErbdzYedwL/odNoQ4I/lF28UcD3TuK+QiDKYMU7xoQyKetNMnM
 xrjf9RbU15ha6PRU4peAkTbO7efhDWd6dUDQ8SlhlA==
X-ME-Sender: <xms:5A8YZul7kXoS-E9HTR43PZEfsjxiUGr6s04HTzfT7XGJQqRPvj-YWQ>
 <xme:5A8YZl00B3abTQ5vNWSDYehm_cfFWxdUj6XlCR_XJIzyPSm5bvgogBrpmjNhj3AbY
 YVU8tpnsP6EPyEyqaY>
X-ME-Received: <xmr:5A8YZsoxOZ0l_g7S6OVUqYg1WXYzf7dlDHutUKObDutlAEQVsPctVQbFuHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvhihl
 vghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhsrdgtohhmqeenucggtffrrghtth
 gvrhhnpedvhedvtddthfefhfdtgfelheefgefgudejueevkeduveekvdegjedttdefgfel
 ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtoh
 guvgesthihhhhitghkshdrtghomh
X-ME-Proxy: <xmx:5A8YZikbMasM7VZgHvtObLV2P9GFgJ0r470-Kc7fgEo774Qvf2Oj3g>
 <xmx:5A8YZs0qX9ZGWE_5YIJqL-CXhvqo1qiTvKUehekqralf-0nAJJfbMQ>
 <xmx:5A8YZpsD3ILS-9-fb0yu84z7H8q2JBo_xGPFRaXTzSzJxv8tekgNbA>
 <xmx:5A8YZoVcbJKojpd_wm4DCcLSdUivGbr5St9mLlhRB_29tXjO_qgkvA>
 <xmx:5A8YZt4seqo2FXF3xVRK1SddDyq4KetKDKrVv1LOiQ97qa59hBpsDkJP>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Apr 2024 12:29:22 -0400 (EDT)
Date: Thu, 11 Apr 2024 11:29:19 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 speakup@linux-speakup.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-afs@lists.infradead.org, ecryptfs@vger.kernel.org,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-arch@vger.kernel.org,
 io-uring@vger.kernel.org, cocci@inria.fr, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
Message-ID: <ZhgPuPVYT26SxgQW@sequoia>
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411150437.496153-4-thorsten.blum@toblux.com>
X-Mailman-Approved-At: Thu, 11 Apr 2024 17:04:19 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-04-11 17:04:40, Thorsten Blum wrote:
> Use `find . -type f -exec sed -i 's/\<the the\>/the/g' {} +` to find all
> occurrences of "the the" and replace them with a single "the".
> 
> Changes only comments and documentation - no code changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Reviewed-by: Tyler Hicks <code@tyhicks.com>

Tyler
