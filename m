Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493C8AE736
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AE1113390;
	Tue, 23 Apr 2024 13:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="fqFCyc1o";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kJV4mjJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6D1113390
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:00:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 53AD913817CB;
 Tue, 23 Apr 2024 09:00:06 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 23 Apr 2024 09:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1713877206; x=1713963606; bh=96sOkJm4NW
 VH3kIPbR6s+LMnNin0blBdVvU3NTD2Rm0=; b=fqFCyc1oHE+6auJzo+hRbFwgM/
 oyV3kHrwOocGO6GwDHU83ixOOgB3AR3h8OGjiD1OOcN2Of/UGiHwcxWDGg7Q2kO9
 hZ8Yv593YADSLWfBqFhrQrRbctx+eFJefPAmpoGMFM1NH0aSQs1ukdmTqY3Q72Ao
 hij5dqno2g5LmhNHsTSo8/+Z/m57iCVwiK8b6pj6B/51ShQF4D8UCOJuexiE1h4Y
 cjtRI2eE7n6CpRdKAFUvLC7cZdEhViDW70miNgwJkjWU52UUYaK6+OjnMMcWkEEf
 G+nKBtedkghyG0Gjn0/agxzUfPOctWDzxLambqF/Eq10l0DJ/wGPA+M06vRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1713877206; x=1713963606; bh=96sOkJm4NWVH3kIPbR6s+LMnNin0
 blBdVvU3NTD2Rm0=; b=kJV4mjJA11QzkGuGatb62twjQKbnAAgYOuFW/mX8ZDEY
 h56eNptRCeQ7jkB9yJYgr4EvvJYuaJeYzfkRi6U91T2g4coTl78qeu4Ah4CBYxXX
 j+npQgWGnF168Y6Oyr6Qdrg/jv+ygqwj81Q+YHvwO2ikX9WkHo/eAnFFofBp3frf
 SWyLLPc+svrQl22xkjGqWmuJVsG9BRpDs4HOi1cPLImKWfvNgDrRCdVZK8zt208G
 vYn+kQRK/vuMH+eXuOQvIwdwc0ciXnsD5CAT4VljJANLVwNxTxyOuRggssvFACQY
 PT2uwkybeRVDRADdP8n3rdbJGrQ0+KTT44cjeVKEsw==
X-ME-Sender: <xms:1bAnZtnJ7by_3iVQOR4Bs_c8Igo2pPXcRMPL3Mf3A25lQwCD39H2tQ>
 <xme:1bAnZo0Dmp5o603hjNlYPYYDSFM-_LLeUbGVEfmg_D_rbqv_EMPDlCwjGfc0zLbEa
 Y4gYhrbwECNuaMi5RA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeluddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1bAnZjqJIGoZJGYvmN2m1Y0wmjgnhvfmGtckwD3x2SWNQ43vOWSsCA>
 <xmx:1bAnZtn1f320OiptasVGe0HQkFGo57T_qDEFVtiX4ao6u9xTN5EDPA>
 <xmx:1bAnZr1nrHRdqdTmtECoDnyXRaTdaBLMnTmSLt4S17qHVW2g_RJuaw>
 <xmx:1bAnZsuVvpv_MnlXM3DuGQlhvZURwmrtFpTmLsUbi9D2JKalpYlUaQ>
 <xmx:1rAnZtw-0sAb1sVjZXoQHf1StgQsEcl4I9ifaYfCnbO6Fmk6G3n7nY5k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CF625B6008F; Tue, 23 Apr 2024 09:00:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <081ae10b-0a64-48fc-9be9-540e67900527@app.fastmail.com>
In-Reply-To: <20240423102443.453261-1-masahiroy@kernel.org>
References: <20240423102443.453261-1-masahiroy@kernel.org>
Date: Tue, 23 Apr 2024 14:57:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: move DRM-related CONFIG options into DRM submenu
Content-Type: text/plain
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

On Tue, Apr 23, 2024, at 12:24, Masahiro Yamada wrote:
> When you create a submenu using the 'menu' syntax, there is no
> ambiguity about the end of the submenu because the code between
> 'menu' and 'endmenu' becomes the submenu.
>
...
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I think this is a useful cleanup.

Acked-by: Arnd Bergmann <arnd@arndb.de>
