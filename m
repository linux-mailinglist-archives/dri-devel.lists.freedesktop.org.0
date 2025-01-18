Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B48A1616E
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 12:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B1D10E06C;
	Sun, 19 Jan 2025 11:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="PpIhHRwt";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="b16TOA6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 438 seconds by postgrey-1.36 at gabe;
 Sat, 18 Jan 2025 12:36:11 UTC
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963B810E052
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 12:36:11 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id 89C3213801CB;
 Sat, 18 Jan 2025 07:28:52 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-07.internal (MEProxy); Sat, 18 Jan 2025 07:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1737203332; x=1737289732; bh=zcU3bh0Td9K939Ujta2kcP5qxUMjJXNG
 zp+UHMOQHJA=; b=PpIhHRwtIV1ldVpeF8k2nEeAWepXyEtSMghRgH/3AU1OLQDS
 J2dALAs2RCETq0MieEiKQde9YL/rQLqn1q+Uo5KcvVWB5kmrNh+xETf8i5SknumF
 hGxmDGEHDIp7Er9yCDpbszIaISE5wv7I5hYYAuUIhkFKKWFIhnfaVK0tnpykpVzG
 xHlCYg6ESrorij6VnZYAXO+6PDocSixOPvKyLRkrW15P/ORmPmr3jKCVYnezFv7M
 I5vAEL9qOyBr/lEe0K1Cfy8ARdzF7VEVNTGrVOzlGqWhvdzA2TxTyxL0K5PciV3y
 S4WdbrGLWu9cBM9qLX6cZA/f209wRW8srR4RRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737203332; x=
 1737289732; bh=zcU3bh0Td9K939Ujta2kcP5qxUMjJXNGzp+UHMOQHJA=; b=b
 16TOA6wuGADPx6lSClZZ/jLEZvKuZiBA4YbxCaFf6RN0eu2EcdPjhX0GhrTBQsFA
 W7H3ZlanUnBJu0KZkbywJhmLZTsN70LsLndUR2XcLuc5PnQtgQPAltteyZCRbUav
 Fv7v0Is+34Jm3+cjWStjm06fd6nxS9h/54lylavZc2WEk5otktkoXMrhQBmqgO9T
 XkiiAz9/w3s8hIcuCVKC2cw1QgPFGna50wmx839MJJ7lHGyAxf1CzsRfb0fRpqah
 0TtUW8uWtbmEp7enmnhdPC+Uf4+TSnHV4VwZhMR3ab8tREB+XicFX7t+TAF4hVoD
 Bv15uJB34r3V8KOD+tKbw==
X-ME-Sender: <xms:g56LZ5cjVxqkHRBfoDR_1g4qyDsveSxMcYOIBLOj0xV656RkWKgeGQ>
 <xme:g56LZ3PtPYo-eKFJ-b8l2k3yZm5AhBbBsUUOO9e6qKQzWR3fbcqUud1ehXMLI4K4c
 0tCsXZMTXOgMSpSYG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrh
 druggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveekueef
 ffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
 hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
 phhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhhisegrlhihsh
 hsrgdrihhspdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthho
 pegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnh
 gvlhesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
 rdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinh
 grrhhordhorhhg
X-ME-Proxy: <xmx:g56LZyjEFxeZe2qYhJ3oU5wZQHDTDzczvDxfHhrDqDelWHdpdHtrjA>
 <xmx:g56LZy_hHfl_QLoD6sIrpCAykPiohLmfVEJ0WMJI3vAVAWuQYEGsoQ>
 <xmx:g56LZ1vfoH9NZQO3DYRZw3nJYO76Aj722dKQ_lkYptShwifUWE7Bbw>
 <xmx:g56LZxF49TLfXmDKVUZbhDSvCJh2ZyLGiqpNrZ3UkE_f-GdL94P0xA>
 <xmx:hJ6LZwn0bti_1Z1O7mj0PbM0JyGYdgISjzrqGBIRUkTBxbMhQOe5tvcX>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 8E1AABA0070; Sat, 18 Jan 2025 07:28:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 13:28:31 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Alyssa Ross" <hi@alyssa.is>
Message-Id: <e78f5268-f0a9-44d5-8dbc-7ef7f26278d5@app.fastmail.com>
In-Reply-To: <20250114-adpdrm-v4-5-e9b5260a39f1@gmail.com>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-5-e9b5260a39f1@gmail.com>
Subject: Re: [PATCH v4 5/5] MAINTAINERS: Add entries for touchbar display
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 19 Jan 2025 11:46:42 +0000
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

Hi,

On Tue, Jan 14, 2025, at 22:38, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add the MAINTAINERS entries for the driver
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>


Thanks,

Sven
