Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACFDB50487
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 19:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0505410E33B;
	Tue,  9 Sep 2025 17:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="LkiUW7MN";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="dVOpm72r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A31110E33B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 17:36:13 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id D4E59EC00AC;
 Tue,  9 Sep 2025 13:30:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Tue, 09 Sep 2025 13:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1757439044;
 x=1757525444; bh=kcBtm0PRVjFv0BFCQVR8WhttvH8Rf5tckVmKNixBbcs=; b=
 LkiUW7MNBvByPHtEROBNaKsur9l4syMqehF6v/DFhuGzu5AhfCwJYpTzxoh+UvsN
 ZttrM6f7is8cdHWp4skw1LlN/3cxPpL7Sc0FXFo86DFxJGb/6UXFMZcxxNukQNoO
 ieTpksAymFAvaJA6eUgzvyRSkNNmncwJA3xSV45aTZjUTi/iyK/PzvoOfvj+iSN6
 OcwuZuMN2GuLkTN6eLZRpzfdEKKNpAXmzsusBISaNXIMnsqu4R6BtJJ1LqcqL8GQ
 5EB2xGWwA8pzOtakSTTgWrrEEt43VG1/W/k9Rj07/XW26k6lnBdHuG1uCBiGz+wa
 o1NaZ9gFo65VHwxSUSOlAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757439044; x=
 1757525444; bh=kcBtm0PRVjFv0BFCQVR8WhttvH8Rf5tckVmKNixBbcs=; b=d
 VOpm72rr5CrKaSMNT98LuKZxY481oR1c1MrLZ1k2jIhMcVzy8Iq/I0fuBpoPDQGk
 22UivKHmATUqbiP/aH3whH5Qral3FfrIVzqxasSBIZj3PlfsBCXaJMdYQol9TX/8
 qMyY+zZUGn14LL33QjYeAjCyi9nAPa0YZXe4cfKb8II2JzZ697U19b6iGCwL457G
 DyesNWhmns0ATYtTgf11hBeTuDiaHAkD9OK8i5009pS7tWb5PrIgWxrdnT4EJBKc
 9Z7UVyQihSoLXcXvv97v6jnUG6sLUkreHfDouC6VVh3wShXe34rvskcPXm5ip6u4
 uea+TEkNUD7LMzCC/+RRQ==
X-ME-Sender: <xms:RGTAaAH7EwqFDwC51Dh7B5l_yJSzzNsd9e7nfih46dEmN3eEHGlOZw>
 <xme:RGTAaJXh5sjajJlRiDNmzRmwR7LF4BBvm-9RvkKhuumxDz_oNAJMB9hepETIBub1u
 FPvsmwA0otEkmFO9OE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvuddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
 esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
 rhgtphhtthhopehsohgtihestgeigedrrhhulhgviidrohhrghdprhgtphhtthhopehsih
 hmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdp
 rhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprd
 horhhgpdhrtghpthhtohepuggrnhhivghlrdhprghlmhgvrhesshhonhihrdgtohhmpdhr
 tghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-ME-Proxy: <xmx:RGTAaEN_EYlqVER37uTRkH8CglEAwRkzyvlN7KlSUe1DrTTBMa7E6Q>
 <xmx:RGTAaCXYlY76vQlv48zV_79QpIU7pY8jtJymxifR9aAX_xoaUkJxuA>
 <xmx:RGTAaA1K6Ky2LMn7TeQbC9D3mQuPIaWQf2DTTqDiNmsuhvHfAfYqTw>
 <xmx:RGTAaIoRr8bhvTWo1-VwGvTGYQtFtnwiJAfbcoasqkHe_V8Zb7vKHw>
 <xmx:RGTAaND-tHPsfk7vxLeKWP83YybZE8QvVb2W2Foyc2-ojnaBGeUTo2QV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 9D4A3700069; Tue,  9 Sep 2025 13:30:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ar21wg06fiH3
Date: Tue, 09 Sep 2025 19:30:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>, 
 "Simona Vetter" <simona@ffwll.ch>, soci@c64.rulez.org
Cc: daniel.palmer@sony.com, dri-devel@lists.freedesktop.org
Message-Id: <5932fd76-d4ad-4357-a9dc-1e464d689e75@app.fastmail.com>
In-Reply-To: <20250909132047.152612-3-tzimmermann@suse.de>
References: <20250909132047.152612-1-tzimmermann@suse.de>
 <20250909132047.152612-3-tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Turn FB_MODE_HELPERS into an internal config
 option
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Tue, Sep 9, 2025, at 15:19, Thomas Zimmermann wrote:
> Several fbdev drivers select FB_MODE_HELPER in the Kconfig. The
> setting controls some helper fucntions and has no meaning to the
> user. Make it an internal option.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
