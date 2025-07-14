Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F5FB0426F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4BC10E4A8;
	Mon, 14 Jul 2025 15:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="Lnt9gkmO";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="hD9nCXPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6CA10E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:01:56 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id AA1F77A030E;
 Mon, 14 Jul 2025 11:01:55 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Mon, 14 Jul 2025 11:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1752505315;
 x=1752591715; bh=+1B/AXLCX2MnzgZT1P/hZnnKS44NBY8AHKmKaJUNjHA=; b=
 Lnt9gkmOg7Xkq89lXSDdqF6u/n5n+KP+kWpxSKsa0W5EyJFy4hdiOGa1JbYwumSm
 9IkPXtrZTsGYg9ZyJnTrP8MTuiN60IAOssZ0GOkp1W8ZDls1nuRGdab2ZWZJNLWd
 0XmoTJsl98lONw+/oXzvM87Zc7X07ubenQevj2gP6XYArab8E8xeH4WyAZIXIyhs
 iwK7BCo35DnzvnuCWMhpEaYoG/p10glsfdQPObSyc11IiRNAPifVCRX3ptturnFu
 q7LqYuLZVSaJhysaSJkedd1/cYw3HF1j5fL4OE4QbygtrDt6R3EstAeBgm6UEFvd
 416FY0+G6ebBi2UPHPXWqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752505315; x=
 1752591715; bh=+1B/AXLCX2MnzgZT1P/hZnnKS44NBY8AHKmKaJUNjHA=; b=h
 D9nCXPBNwV9yhWnhYz6+BE0yJa7wDhKiwsVUafySXFes/USmMAvijahCEIZEVKAk
 ciolENnVd8dGzsMKHr7I0eRdseKf/gLKDyMFkZyzuUDKE9EUqdeleMGxXNq9Brwk
 qw8bNJ6CROfTtLX5fu7ygZwS/iSxEfztmpDiEpId8J5a6uo6mJY6gcdJZSa8RA+q
 UZBUWwNUf3ExLjDaIgl4h2fmQpAkLqVJghoYYvwstMKiOH1oyHmPvUVQI5YZkYA0
 DVktlWzFKV/XklDEuyWngo11r8bXH3mdQrP9GpUmuLeAP54uThchLcSlXQWyc/Fs
 oXpKwIdN7t7vYBYKgZymg==
X-ME-Sender: <xms:4xt1aBeevDjtc7QjeN4MMMMMtw1AoPdpdcorr2416lREOt8UwlJR9g>
 <xme:4xt1aPMVgpUS4RUeiApBtEvcTf1a6GlpX0A0Fng9TOXq7przNMFz1PEwGpSjzr9S0
 6vrv6wlFwJlhGmI3y0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
 thhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhguvg
 hrrdguvghutghhvghrsegrmhgurdgtohhmpdhrtghpthhtoheptghhrhhishhtihgrnhdr
 khhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepghhuohhqihhnghdriihhrghngh
 esrghmugdrtghomhdprhgtphhtthhopehlihhjohdrlhgriigrrhesrghmugdrtghomhdp
 rhgtphhtthhopehmrghrvghkrdholhhsrghksegrmhgurdgtohhmpdhrtghpthhtohepmh
 grrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehsihhm
 ohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtg
 homhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4xt1aCNBxZskL_8p4yOUexz9__kVpRRrAHDhPRWOc2m80NmDexf9fQ>
 <xmx:4xt1aG5Ptm7zHvvRneYE3WgmmWDd9iyDkI53lDsudPnV9XGaR8RlVA>
 <xmx:4xt1aGZF0vG5_euE8xNc-dfI7F1ESS8G9iCpgOv-dZtW4vDMMS22LQ>
 <xmx:4xt1aDc70-fnx9WR5_cHqte56g2r-WIzq94_lEA4c91dSXpRoVDjOQ>
 <xmx:4xt1aKCQIt1k0BO0KgbnfxhA-z9ZxcBWdQjU_K1r_--Fq3wFuU2SmcMk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 06F92700069; Mon, 14 Jul 2025 11:01:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T6e7c1da684903917
Date: Mon, 14 Jul 2025 17:01:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mario Limonciello" <Mario.Limonciello@amd.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Alex Deucher" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Lijo Lazar" <Lijo.Lazar@amd.com>,
 "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>
Cc: "Olsak, Marek" <Marek.Olsak@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-Id: <724b4600-d983-434a-acf6-68cd87b04636@app.fastmail.com>
In-Reply-To: <db654178-a6d7-416c-bab6-b494a7c118ce@amd.com>
References: <20250714081635.4071570-1-arnd@kernel.org>
 <db654178-a6d7-416c-bab6-b494a7c118ce@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
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

On Mon, Jul 14, 2025, at 16:59, Limonciello, Mario wrote:
> On 7/14/25 3:16 AM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> When power management is not enabled in the kernel build, the newly
>> added hibernation changes cause a link failure:
>> 
>> arm-linux-gnueabi-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
>> amdgpu_drv.c:(.text+0x1514): undefined reference to `pm_hibernate_is_recovering'
>> 
>> Make the power management code in this driver conditional on
>> CONFIG_PM and CONFIG_PM_SLEEP
>> 
>> Fixes: 530694f54dd5 ("drm/amdgpu: do not resume device in thaw for normal hibernation")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> We're going to fix it using this stub instead.
>
> https://lore.kernel.org/linux-pm/20250712233715.821424-1-superm1@kernel.org/
>
> It's in drm-misc-next as of this weekend and it should show up in 
> linux-next in the next day or two.

That patch makes sense as well, but I think mine is useful as an
improvement even if it doesn't address a link failure but only
reduces the object size by reducing the amount of dead code.

      Arnd
