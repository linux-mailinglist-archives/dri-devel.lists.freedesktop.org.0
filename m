Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBF9B2C09
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D060510E44A;
	Mon, 28 Oct 2024 09:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="Z944a2DO";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="C+UY0K0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BD010E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:53:38 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id 7AD6D11400FC;
 Mon, 28 Oct 2024 05:53:37 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Mon, 28 Oct 2024 05:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1730109217;
 x=1730195617; bh=+exzClQswDanihSowa8oY8xkwPi84cs3lQgzY4bgZBg=; b=
 Z944a2DO2QsMhWE4pQ+z141hUSa5OGqwvzJSx6ux6nsEV/tx7Vly2RL+TsECrlzC
 d8px0wrAExvDqjEJ3mGGIZ3QxKz5kQ88Y/5Faaje0ujI9eCA++ToahDUcPGjUOU5
 UQvCWdXl9AlQZw6T1MfQRmbkkEgsJ3FpMBPTI5eFROtZdCiTi6bfMx8Rd6sRF6d1
 Y0zr/usCRq2gROIrLMSlNgD5kScVkZX279VPkjW/yMlHD6bMEA1gITQSidILqlH2
 Wo5IargGKSfSDUd21IKqFddiGsLJJR99GyCtBQmjN9cmTq2uBJywFe16nJ+K+QIL
 SiWOBiBkecnL7J3M70zvUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730109217; x=
 1730195617; bh=+exzClQswDanihSowa8oY8xkwPi84cs3lQgzY4bgZBg=; b=C
 +UY0K0IkWxlgl18/OocpNy0hFM7+Pfp+mqnWaS3r0ToCsDHjyfMUgPj6AZsQccrA
 FP3hYbgFZqsfFpt+AWpJGh9eAv+bhGOyMXlFRvCkef/eJ7E0+P9+v/LMdgHfdjYs
 Rf4l2cQX9J+J2240uG1b8C+3+n35WQK6KovszVSB7U62pQS3rvtlgCodjDiKYJCK
 wY8MItMdPxUDevDNd65DMDY9wwecjMDmERDaWAFkLWq7UGe9RCpvOwDIVUDy287P
 ftbVviTaqo99eNDSvbKQr1eMjzF9BJsNpLUlxDp+W6QcOG+tIl493f25o/z8kTri
 CMhmpEF7KG97XH32gk/ZQ==
X-ME-Sender: <xms:IV8fZz6jSB5azzmFk99blo7JUCmDB45BajZchNnGlAmxkrNVwlth5w>
 <xme:IV8fZ45RtbCG3icYMS3tCL9YfyxRSu8pPH3a0icPRM-n25i70IoHyWXvz_ps6OPMV
 OhZwQnsySdVjI-mF0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejkedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedp
 mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdroh
 hrghdrrghupdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehstghhnhgvlhhlvgeslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopegurhhiqd
 guvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohep
 rghirhhlihgvugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrg
 hnnhesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
 rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrd
 hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IV8fZ6elwW4-bSIJfKGxoRiQjlUFy3avmJngN65hgqNs11M6KX593Q>
 <xmx:IV8fZ0L-HvAaoLOrncFnLR0Ybt6LUp4Zq4yHbLrlZiHUFLl0shJl-g>
 <xmx:IV8fZ3JSvfLwSXmSj0lRctzm6j_HA1_Jt945ErDcqB-iaoXX7M1P6Q>
 <xmx:IV8fZ9wirdCdBVR6Kykn74fUfhjNvdd3NcNfEDGx0oEFhMwvhlSwWA>
 <xmx:IV8fZ0pbbm_NUyMIhsxDzRXZPTZ3WXorJU3rjzBV5mudN0jjACb5GE2C>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id F05DB2220071; Mon, 28 Oct 2024 05:53:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 09:53:16 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Dave Airlie" <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, "Arnd Bergmann" <arnd@kernel.org>, 
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Message-Id: <dae4e7b9-fe13-45a7-bae3-3629ff708a25@app.fastmail.com>
In-Reply-To: <20241028133441.7b92ee4f@canb.auug.org.au>
References: <20241028133441.7b92ee4f@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the asm-generic tree
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

On Mon, Oct 28, 2024, at 02:34, Stephen Rothwell wrote:

>  -	} else {
>  +	} else if (IS_ENABLED(CONFIG_HAS_IOPORT)) {
>   		ioaddr = VBE_DISPI_IOPORT_INDEX;
>   		iosize = 2;
> - 		if (!request_region(ioaddr, iosize, "bochs-drm")) {
> + 		if (!devm_request_region(&pdev->dev, ioaddr, iosize, "bochs-drm")) {
>   			DRM_ERROR("Cannot request ioports\n");
>   			return -EBUSY;

Looks good to me, thanks!

      Arnd
