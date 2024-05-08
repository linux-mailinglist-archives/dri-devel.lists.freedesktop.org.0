Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69F58C0607
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 23:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC293113200;
	Wed,  8 May 2024 21:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="OHuCSQe5";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ev/yVz7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098B2113200
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 21:06:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id E0A6011400CD;
 Wed,  8 May 2024 17:06:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 08 May 2024 17:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1715202379; x=1715288779; bh=5puM+pB0xD
 dlD+iNYiM57HoPBhMGCRpSG1kFa7iBTr4=; b=OHuCSQe5p9gB2aKdR6EMCF+xen
 bpAxHzCC4VuhiXmf557HE1lvAX9KsuX5skkZ30e2cfmS4Kx7Lmwb1BRBFtLyIyxN
 RpU8jvN5wDUjNvnoqUjf4YpPLdehyQoFEkw0Q7man9opsLCOq3ZcES1GMhdxV5GO
 xmcq+gpDEw66uqsrihin/X5DlOda/oIFywK58h16miJJThTBpjtKSNrwUKeVPxfh
 F32nJ61Wgix8bWIeTSBSBVtWm2QphLGEHUBWGdnaEN6k9R2SoQTzGyg5fCL6RdUZ
 lLC8jGvsXlQUM90RjR/R8g8Fh2AVB9d4nc84NgrZftuIdoJ5sOVD2tCRwbJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1715202379; x=1715288779; bh=5puM+pB0xDdlD+iNYiM57HoPBhMG
 CRpSG1kFa7iBTr4=; b=Ev/yVz7a0Q5Oc/Ww223Qo+Scn8zOu4bKZVU7X7SDXUEH
 PvbapzfCsMtbh4ZmIYa1kISCxYWUVr6IA39uXFzLsTHKv7G4YPZgrrleHN+yX1gL
 JB+UOgMrCyon9Whx+uOjUBhFW34H9GtkhshDaymRY5rriRVGtSHjrMezFF81zeiZ
 VEz6umcLGcRo5x7NBrCvD+Q1haIVbAf0WVFkPLppinFUW7c11oxrwzS3x4Ogty8o
 5IscK+Z1XrqkrIEVnFC+BnXZSpSMpees71CBoHm3L0v0EUd24IGXTuXEYA5jnMUK
 yPIRk2aT4EbimiGoC0a5iADUBY8FYHNLsL0v6Se0Ag==
X-ME-Sender: <xms:S-k7Zs0OW8OJ148A_dS3grtU_H-tmWUVEi5eNg-N6fzJaPeyxTW2hQ>
 <xme:S-k7ZnGXA7CG4LyVDt_XShcxUorFRzIFY2PGTggqeo7aedkUwitvFH_pN90vaXG6c
 eMMNILu6n1oUZqMF2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:S-k7Zk5ZI719oM-6QqBe1FUuBnjo0oZQO3F6iwJk3QzPZQ9E5FGiQQ>
 <xmx:S-k7Zl2GFIea-bwmf0oynz0nOrs7O9w9Z5530FE2OkoshFNOYInV8Q>
 <xmx:S-k7ZvGHdLQ-yKcvUBxX1rOg8-7ye68fk8AEfdpiQUSU221Pa0R6zg>
 <xmx:S-k7Zu8D01iuD3wL0QE29hQLVX6b3Ia4iHiF8j7I-KeU2uq1eKzfRA>
 <xmx:S-k7ZlYxszuKqwiknwqpWhzRINGbHapLezgcQMFe-Kq4IxbYPjhEeN-p>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3384FB6008D; Wed,  8 May 2024 17:06:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
MIME-Version: 1.0
Message-Id: <7bee1995-ade0-487c-a63b-993e6accb923@app.fastmail.com>
In-Reply-To: <20240508203613.GA2715801@ravnborg.org>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
 <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
 <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
 <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
 <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
 <ZjoMI5bJSlqhtOy1@phenom.ffwll.local>
 <41191296-0aa0-4010-b70f-efa80b9200d4@app.fastmail.com>
 <fe156e32-8ce7-4ce5-99cb-6291ad4b83b0@broadcom.com>
 <41639d6b-a429-43f4-8568-12fcd1671cff@app.fastmail.com>
 <20240508203613.GA2715801@ravnborg.org>
Date: Wed, 08 May 2024 23:05:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sam Ravnborg" <sam@ravnborg.org>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 "Helge Deller" <deller@gmx.de>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
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

On Wed, May 8, 2024, at 22:36, Sam Ravnborg wrote:
>> 
>> I think if you want to do a new version, that is likely to run
>> into new problems, given that this part of fbdev is particularly
>> fragile and partly wrong. On the other hand, it would be nice to
>> have a patch to limit the use of the notifiers to the smallest
>> set of kernel configs that actually need it, and leave it turned
>> off for everything else.
>> 
>> These are the ones I could find:
>> 
>> - CONFIG_GUMSTIX_AM200EPD (FB_EVENT_FB_REGISTERED)
>
> I was surprised to see this driver is still around as many other old
> drivers was nuked as part of the pxa cleanup.
> It is the only user of FB_EVENT_FB_REGISTERED - so a potential cleanup
> if the driver is no longer relevant.

We kept gumstix at the time to give a chance to do a DT conversion
using the qemu model, but so far nobody has worked on this. My
feeling is that we'll end up removing it at some point in the
future along with the other legacy PXA board files. 

Even if someone wants to keep working on gumstix DT support for
qemu, I agree that we can probably remove AM200EPD, AM300EPD
and metronomefb, since those are not even modeled by qemu.

     Arnd
