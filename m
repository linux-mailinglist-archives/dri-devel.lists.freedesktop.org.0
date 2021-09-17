Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243144101AF
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 01:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35E46EE98;
	Fri, 17 Sep 2021 23:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9366EE98;
 Fri, 17 Sep 2021 23:21:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 863CF2B00971;
 Fri, 17 Sep 2021 19:21:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 17 Sep 2021 19:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=9D1TvVjqqwgGetcBxSubPdthhs2
 qP2/L39fbHUN1dhg=; b=icvXUUhsZiTbYQL+UTHGxJkFbsfkRzRd9zXqXNqF0Pq
 Yyft55LMFcsAjXmAMRyF1A6r97yyo/ATgGnQ59ZOA56zNetCyoSLOWWsV1X+v6K9
 qnPiyKZ6sscWFQI7BDKzyd07QA3Gbj6ALlxL5osSZp3P1EdTw7N+zQkSfRAu2rn3
 GlZ0uhOh4KveCTJRPk+LpWSfgQ1Xy+tmDq4u4ZwRd/lTvV9RMDAs/pvnJQc0SQZE
 42JeBDnQeeSYQnKLBBUbr3wasz+N6txMrAsilyaLR7hdYtgup5LC8n77giNJFKM/
 7DkW0bManZUgEdGpTxv4iU4+ZXBnnIXgR3bdpbSrMAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9D1TvV
 jqqwgGetcBxSubPdthhs2qP2/L39fbHUN1dhg=; b=LLSUGVTj888HafrCp5tZJ4
 OjpyCTAHfGymnGaJ95AGUkK9Vsn+Y44XkW1cDGf9h9YE+tCX5ePjPp++CVIXrlJv
 OtWIf2wbSVDdxr24UPC3fnxs0AKUtK9GAY+MTIrRglK+TlvByFXYYA8cFsXcLP0l
 Zs46gC19S75xYiRiondJMTMklM3GHx2FcvFcsggljO7cEdHzyaM57vbRys7CoYQt
 IYNsZyH9BgSgzyKA2NiIQHNeETN7+jNJAU994bUe6UzpTCxjAAKzSFlRJxUKpZjd
 XGfTNFRTkFBbro4lsZBRfMfOVlUemK86Hh1xgpEojdvTfAQMosFceT9UNGM3HwBw
 ==
X-ME-Sender: <xms:ECNFYf2AeexzJ6ACMFSdIfbY5eEbF_Cc2EBmJioiwerfS3sbWHbBzQ>
 <xme:ECNFYeFV0XB_kyVZuIL3gDCkHlJKA9oliZNRs61PT1ws_tH5DWJZAun9WeeTqNuin
 AJeRfpLH24gVdio9w>
X-ME-Received: <xmr:ECNFYf4OFl0ohAw5b9lAH_NTdUEi83EiO-abc1np6ih4MqktclUsqhSqo-HsvHvmK8tY7E-n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehjedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
 nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
 gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:ECNFYU0C6M7ROTHINOrKLFicmRrOc54MXpjbCNB8W9v1C-Y_mHtUCg>
 <xmx:ECNFYSHtGazCRU7_Mh9D32hqGosKvR1D0_Kf7ZhDAscX5QIleiVMTg>
 <xmx:ECNFYV85aEvgfkcDgBu137LQFDm1UK7ytQb-FPgMLALM_VFKarLYJQ>
 <xmx:ESNFYVBQ5mCdH7PoNQ4187ntV2s52SA_JVha30z4b_KwS6hENpVY6pR7JZ8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 19:21:49 -0400 (EDT)
Date: Sat, 18 Sep 2021 01:21:47 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 15/15] doc: drm: remove TODO entry regarding
 DRM_MODSET_LOCK_ALL cleanup
Message-ID: <YUUjC5MhADgMs3aw@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-16-greenfoo@u92.eu>
 <20210917155652.GP2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210917155652.GP2515@art_vandelay>
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

> Can we remove drm_modeset_lock_all[_ctx] now? If so, let's queue that up as part
> of the set.
> 

drm_modeset_lock_all() and drm_modeset_unlock_all() can be removed (I'll do that
on v2 of this patch series).

drm_modset_lock_all_ctx() is a different story and there are still two places
(one in the i915 driver and another one in the amd driver) where they are
needed.

I would need to understand the code better before trying to remove those :)
