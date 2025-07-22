Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F14B0D78E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 12:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60910E2B8;
	Tue, 22 Jul 2025 10:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="C6VqZ2f7";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="llkC/Qoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE0410E079;
 Tue, 22 Jul 2025 10:52:54 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5515A7A0201;
 Tue, 22 Jul 2025 06:52:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Tue, 22 Jul 2025 06:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1753181573;
 x=1753267973; bh=FnLOLSv8agUNvtWwXJcvjWEfYF/cxzIbWP6/PqOEwAk=; b=
 C6VqZ2f7S9mIRYUELpXpnO+t69T3rnNMXuzWdaK0skJw3mX2rjnMo99gBMZIEkdm
 GRmQRG21g5icCitmkKspFhO3+WgV1e7jDG4im8gm6Ju/jfgt0nFLoSEYgRPIPoWf
 UDQSFpOU8XzMP+AhmX7rdHlyxiXm9K20mH8lRJamCxesQweQ42ZuTnWPQE1s+cUy
 cHwzpLF0+ORRQ5fhoHoaZ7B8iCNEyHc1rgSSSe6846A547d43qJKU8HMLf5xw5Q0
 fG9YLbYiZy3OLqaHYrcTuJjhtxH9K0JcoZRt6cyTDc1mMeJYu+SOn4IRsRuitnPV
 7Om/9IUL2rn7WgC2LZlyhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753181573; x=
 1753267973; bh=FnLOLSv8agUNvtWwXJcvjWEfYF/cxzIbWP6/PqOEwAk=; b=l
 lkC/QozRAylQgy6u7kRCxvUIEG1Ke6z8TeCFBvPSD/8OI9YBM6Kc4ugdxIuVXlJp
 LS83fZACrI1wNVRqSpigtbmyAV2V607Sj+fzSoASGR/wf3Yqfzbb0CwLw9vm6umz
 U8Tf2op9kh6rVlPyJSUOVoL7dgcco8E9yzmzzuwF/1mdGwLWsChWUsDy8DKZ8tL4
 HUzM0oAZ1Kfbqcus0CwA5RlEhcdY2juyD9UhDR/Fq2ml/b8QYhwezjU9WQe9Eyn9
 gqWrQKiVKWUuzsL2SsopqtZzumjyL/IQ9EBjghO6dhtPKkGGKHHrcrcvfhr/Sl5h
 Y+ymbYN5mkyaeN/KA5y4Q==
X-ME-Sender: <xms:hG1_aBEK_DWPSzEhKYWqA8yKDJ1izCEv6xSL3zTRRayHtxRijVhhxQ>
 <xme:hG1_aGWr_brqeEpSRKL7TCLl_A9YyH7zaBPkZL6KGyE0dsrqpnNC6LHZaI0cEZ0J1
 gybBhfWeLPLBmvMIfU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeejudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
 esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
 pdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlh
 hivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhrhhishdrsggrihhnsghrihgu
 ghgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrthgrughruhesghhmrghilhdrtg
 homhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughr
 ihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtth
 hopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghp
 thhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
 htthhopegsshhkvghgghhssehnvhhiughirgdrtghomh
X-ME-Proxy: <xmx:hG1_aAO57fs7HK76j4t-6D10Og1axam1vQQiYg7sR_mkTbZnz1devA>
 <xmx:hG1_aO2C3xsktnCVcqaaED66usVapgUe6HiFXuodCIBJbFKPSAAITQ>
 <xmx:hG1_aGoM-5k1pDzf6gT6A5zWJoUz6J-8js2brOIBKnVjweJxOT7f8Q>
 <xmx:hG1_aAcNFY8wF6rYWJ5EgpxGwj_2HUtujs7x6_77x9AKuF9OyQ4AMA>
 <xmx:hW1_aDOZEwNtzPLa3pup_ixPAFisLyKZONmEX3Az98dsOdbYdDlZwBbH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id D45E8700065; Tue, 22 Jul 2025 06:52:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T0fa10d1000c4a2fe
Date: Tue, 22 Jul 2025 12:52:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chris Bainbridge" <chris.bainbridge@gmail.com>,
 "Satadru Pramanik" <satadru@gmail.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Dave Airlie" <airlied@redhat.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list" <linux-kernel@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Timur Tabi" <ttabi@nvidia.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, regressions@lists.linux.dev
Message-Id: <d5010230-b718-4770-b731-f62225f1f808@app.fastmail.com>
In-Reply-To: <aH9n_QGMFx2ZbKlw@debian.local>
References: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>
 <aH9n_QGMFx2ZbKlw@debian.local>
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
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

On Tue, Jul 22, 2025, at 12:29, Chris Bainbridge wrote:
> On Mon, Jul 21, 2025 at 08:22:48AM -0400, Satadru Pramanik wrote:
>> Hello all,
>> 
>> I suspect this commit in 6.16-rc7 has broken acceleration with Mesa's
>> nouveau drivers on my machine.
>> 
>> glxinfo -B reports that I'm using llvmpipe.
>> 
>> Reverting this in 6.16-rc7 restores nouveau acceleration, and glxinfo
>> then reports: "OpenGL renderer string: NVE7"
>
> I also bisected an issue to this commit. On my laptop, this commit
> results in an intermittent desktop crash (Xorg segfault) when changing
> display scale, which can be more reliably reproduced with:
>
> for x in {1..100}; do
>   xrandr --output eDP-1 --mode 2560x1600 --scale 0.5 --filter nearest
>   xrandr --output eDP-1 --mode 2560x1600 --scale 1 --filter nearest
> done
>

I won't have time to work on fixing my patch before the merge window,
let's just revert it.

      Arnd
