Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332C2C1F8D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB1E6E237;
	Tue, 24 Nov 2020 08:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E714389D1D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 09:18:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DF49C5C0136;
 Mon, 23 Nov 2020 04:18:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 23 Nov 2020 04:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=H
 G/nt7a28tptLldaB7ibIVxih/Sg2WyfiDcJegH7zVY=; b=rWuJd5iIMRvngZe9H
 pr451RpOCiWs/DoTngQgmOVRMh2fEbd2mfwvVgW+JqFy2R5CcfOAHYYW5nX0go3l
 mtMc2LW2HVJ00+1Ll2ZD9LH+8aDhDVaA29fXso8go4PLgPiMGBUlIsUwuG1Pr8kU
 N2jBvFgup07bsk+7q/KYrWXbLul2KQMYhRrQQfqQFoDAT9QWgqJ1te3QFB/9dOOa
 8Og2TZRaETDuAg3C4b19TLPijolSHPivCA7GJ7WLngUelyQWnuJO9T4dc8+It/su
 IyyeDKHtKngvBS8vJfDZrCvPwS0xWvI17iw4ObqY4DIWu80pnn0O3eherK1m3gbU
 vEVIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=HG/nt7a28tptLldaB7ibIVxih/Sg2WyfiDcJegH7z
 VY=; b=m/r56miH16i83ctIBvf6eK+NJ2O496EAlj0+n2YOddMSTXXahxjry/EHJ
 MZxaWAdjaJ/xzRKjt5JPXDw4kSHuISKuySpibtP33fEj6Xh5/3C69Pa6sKZ8wJI2
 nJ3TnHE7DyAnRlrpdwPKMPrd/VeZHl9+MPbDtnAe3uWB5q1I7K7mlcgTgGbjGFVV
 d9u5Uplmt9X02dJgFP33x9ZOE9qZw7Zqf2WM+Ov+GVSXNn7BqsVQY3Cryf/J4Np4
 p2cEreAW0+yX4mHwm5VDODlLAJ5Qg6zfo1hQF1lTYWB6TFUwiVJcoKKWmQ9mwY7b
 +P7isPH8aeo9cz7BgfWksJL4j7gWw==
X-ME-Sender: <xms:WH67X2n_hIsX72jMytlPx2Tz9s06eELveRI7N7ZAL994TUeL_98dWg>
 <xme:WH67X90x26-mb1UtQT2G8wJ3bHGqKCg7OZ2LCIBYEiudd20n2e67FnZQZsKGcq31f
 NI8pX8EvEeOtn7wHoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WH67X0ohPWRdPuEqajRglpsc8vTSZ8FG5ucLKgfRu75yqJM7-mo9Iw>
 <xmx:WH67X6kUC7v2Sx93hdWCKDVIMBhkVGam2vGpWo2JfHs02Dzmx71Kow>
 <xmx:WH67X01mV24Gul6wIiAvuZtKLIImOaA2v-IfRhtZx17_IxQMK_GjHQ>
 <xmx:WX67X4-1d0Rz5L-sDUqOejt_LcZlzDnonpT_jOIhF0HKnGkTqDz7SQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F375E3064AA6;
 Mon, 23 Nov 2020 04:18:15 -0500 (EST)
Date: Mon, 23 Nov 2020 10:18:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/10] drm/fb-helper: Various fixes and cleanups
Message-ID: <20201123091814.jthgvie4edd7litt@gilmour>
References: <20201120102545.4047-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120102545.4047-1-tzimmermann@suse.de>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 11:25:35AM +0100, Thomas Zimmermann wrote:
> Here's a number of fb-helper patches that have been piling up recently.
> 
> Patches 1 to 3 fix bugs that I spotted while going through the code.
> Because of the way the fbdev code works, they have been avoided so far.
> 
> Patches 4 to 10 cleanup damage handling for fbdev's shadow buffer and
> fix a few issues.
> 
> Specifically, the final patch adds locking to the code that flushes the
> shadow framebuffer into BO memory. During the conversion of radeon to
> generic fbdev, the question came up about interference with concurrent
> modesets. If fbdev has the BO pinned in system memory for flushing while
> the modeset wants to pin it to VRAM for scanout, the modeset would
> most likely fail. We haven't seen that so far, but it's possible at
> least. Acquiring the fb-helper lock during the flush operation prevents
> concurrent modesets from taking place.
> 
> The code has been tested with SHMEM and TTM BOs; with atomic and non-
> atomic modesetting.

For the whole series
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
