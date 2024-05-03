Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8548BB451
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC3E10FCB0;
	Fri,  3 May 2024 19:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="I1+jYVit";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="iJOkEam8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout4-smtp.messagingengine.com
 (wfout4-smtp.messagingengine.com [64.147.123.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA7A10FBEA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:45:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id EFAF81C000CE;
 Fri,  3 May 2024 15:45:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Fri, 03 May 2024 15:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1714765543; x=1714851943; bh=iPKZ8N3ath
 A/5vP9vTrG4TOG4uDkTbTyXR3rycVEddg=; b=I1+jYVitrp1ODGVMjMfAPwdQ4v
 ZKLT5PY+CeBK47tCqHJVWYepuM7AUWm7MkgqewsCqbFJT9/R8jlbMfBPhLKz6fpH
 B6lQhdId/Svb28jxRYDKXQJKbP+z2HkQseJ9Nkb8FUtzrGYOn2nrhS9QEWsNMixY
 nKCYuO9YR2B4dK1W8TMJsoO1rOEx0QSGXfaQ/vThg819wc9MfIKqdRS/mqxAsoLO
 qwdRw0KpLN8fZDOR8dHah1jGtjsqCHAUalZxNr63HW/PhsR9+G6tLYZUP6Brs+aO
 GvKUKWb1VEBqPnaYRW1AsJRjAyyMMZiCp1xdyVU2Wxo3VVv8djN8QTNIr69w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1714765543; x=1714851943; bh=iPKZ8N3athA/5vP9vTrG4TOG4uDk
 TbTyXR3rycVEddg=; b=iJOkEam8hEwfOhjrpUnMEU+bEiakOxKceZaSbAvbnPTw
 YAjrFYj4R8j8+2ZaLU9oGlenw5Mpr55WuASnNJx+RCrFlXVovvBCFiG+AZ04rKlr
 ell12YXyuoS3VaQPeoVOF3M8sIHndhhuZQPr2MLfPFR66Q8PN+AymGcoEmn/Lrv/
 XObFNbOltx2vS8s2VYbVvSCF7Hhjq1vKYNRUWxvMmHHNfpfPfteDihfMXGYK7CJk
 jqMWy9ziFcJmvT1oAalyL59AOgoJd0SBWsZ9c09D7gDPNDtDgRKmWJYxVePVdRsB
 HToz5Wq26P2Xb0MyJCptZGoNhxKMdQkJz/knLen8sw==
X-ME-Sender: <xms:5z41ZkhwczmLRc6r6DSIh_ZclzlADRusMndT49eYSmlvAbQgyA1fPg>
 <xme:5z41ZtCaXWcMjZ0PxK39adneyrns_ytrEap8JbmePEtGQVsPE3VToInwAHJCe158-
 0bkZF626m3unkhzW2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:5z41ZsEiEiu2iRWxnQiINgV2HjhnALxQm1c0sVCDoOTbY9rkceL1tA>
 <xmx:5z41ZlSewU7bV7I4Lrig57f2BRDnrhfG8KxchpFd7SLWoPB-CzjKnw>
 <xmx:5z41ZhymY4bGKBwgUa85g9b8a7wECeWF617XJiwG21EmOV8ekOOfDQ>
 <xmx:5z41Zj5-YaqzmZBRCSGRcfTKY5POLfz6r3TI_eaATTu1n8Ibx9hlaw>
 <xmx:5z41Zok9A2tumfbzqdlckorkRq-p1OCNbVKk6IygbL0zZIKiriQ04LZn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0EB12B6008D; Fri,  3 May 2024 15:45:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-417-gddc99d37d-fm-hotfix-20240424.001-g2c179674
MIME-Version: 1.0
Message-Id: <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
In-Reply-To: <20240503192858.103640-1-florian.fainelli@broadcom.com>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
Date: Fri, 03 May 2024 21:45:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: "Daniel Vetter" <daniel@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Sam Ravnborg" <sam@ravnborg.org>,
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

On Fri, May 3, 2024, at 21:28, Florian Fainelli wrote:
> Android devices in recovery mode make use of a framebuffer device to
> provide an user interface. In a GKI configuration that has CONFIG_FB=m,
> but CONFIG_FB_NOTIFY=y, loading the fb.ko module will fail with:
>
> fb: Unknown symbol fb_notifier_call_chain (err -2)
>
> Have CONFIG_FB_NOTIFY be tristate, just like CONFIG_FB such that both
> can be loaded as module with fb_notify.ko first, and fb.ko second.
>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

I see two problems here, so I don't think this is the right
approach:

 1. I don't understand your description: Since fb_notifier_call_chain()
    is an exported symbol, it should work for both FB_NOTIFY=y and
    FB_NOTIFY=m, unless something in Android drops the exported
    symbols for some reason.

 2. This breaks if any of the four callers of fb_register_client()
    are built-in while CONFIG_FB_NOTIFY is set to =m:

$ git grep -w fb_register_client
arch/arm/mach-pxa/am200epd.c:   fb_register_client(&am200_fb_notif);
drivers/leds/trigger/ledtrig-backlight.c:       ret = fb_register_client(&n->notifier);
drivers/video/backlight/backlight.c:    return fb_register_client(&bd->fb_notif);
drivers/video/backlight/lcd.c:  return fb_register_client(&ld->fb_notif);

Somewhat related but not directly addressing your patch, I wonder
if Android itself could migrate to using FB_CORE=m FB=n FB_NOTIFY=n
instead and use simpledrm for the console in place of the legacy
fbdev layer.

    Arnd
