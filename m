Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495728BD15F
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 17:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A3110F111;
	Mon,  6 May 2024 15:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="NaO+Rt7M";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="HoT89lpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfhigh1-smtp.messagingengine.com
 (wfhigh1-smtp.messagingengine.com [64.147.123.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A034010F967
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 15:14:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.west.internal (Postfix) with ESMTP id 130DF180013F;
 Mon,  6 May 2024 11:14:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 06 May 2024 11:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1715008483; x=1715094883; bh=gLUe+zUDiv
 mPqZGQxuXZTT6/Fx3FkhmBqOIVx66+4hI=; b=NaO+Rt7MUy2AcPaVgx6tw4zrh+
 5uh5nZtN/+pUlpiYtwu+qSOS0US5En0DRd771nYvorFs6X3fW2lGBISgZh7EgqsS
 bZi1BNhN6ByaLF35nzNd0aHdtEY2um8iXWmqQyV+zOvWuA9DBAlvzukWEBnODSeA
 Y8R8B7flhy60PRMKqP5oSCjDuVH6Cl4sWRNLhBHcVDuIMhz40rcIeo+80uOFQxTZ
 LkeCrTzFKpHGtSZqA3P2MPuzu0a17PyVeSMm5TtW+3rEbQOZ3RlcLXJqEyA54Hg2
 nZu06fxFF1T+Jqt2wDdkWscpKUCclEFCBS04f1vbZR2116dqgT8ra8JHBt8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1715008483; x=1715094883; bh=gLUe+zUDivmPqZGQxuXZTT6/Fx3F
 khmBqOIVx66+4hI=; b=HoT89lpbziT5N8m/FfuyhrDzwBIAlnTOD3Up2g++v+RE
 dx+GzBd2JYL6IB9yu16NmoOOgUHF7vD1Sd3h3zTyLefSwQ0fL4u1GyqwRQm0hq25
 pHXBq/d1V4Nl76wfmIUlfegY6hnhz/QBvs5tdT0c4143nZBRCcL3UusIcjAgWrzu
 OqRmNLiPqNM/nsQ2Ce+M3Lgdn1bo/WrQ7YLSKek4EGknbkCyW+AiLZ8zIx4aHzo4
 FY5AcciH5gFKDeBj3XxeXjOYHZULhkr6WsnN7wgc3O5D3JiROB32J4EILjWa3dMj
 ZkgjKnLXmpKPzDaI8+WdRBPYVnj1ycI7Ya9yKiW6ig==
X-ME-Sender: <xms:4_M4Znp2edXWlzkjdACp3Wb04ntw0OzFBo1AtkuaRnPR2ft3V1xGhA>
 <xme:4_M4Zhoql1FCSA6qHZvZDZlt_395T-deA4EZqJhp8vtnnussyELDhBFAj8XQj3I4U
 hosBLQnKSle6i_fxGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepleehueefffevveejgfelveeiuedutdevtdfhtdevveelgfevuedtkeeiffei
 geffnecuffhomhgrihhnpehgohhoghhlvghsohhurhgtvgdrtghomhenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdr
 uggv
X-ME-Proxy: <xmx:4_M4ZkOhiOBgBmQ6oV7yRpr7xUjO0bDTMYtJL1f1w39FOOozxMg55Q>
 <xmx:4_M4Zq5HtmMpcgmwilY196HYutrAWb7aEOvM7Hdmy3V08V-lEVAqrw>
 <xmx:4_M4Zm6drm2XFnwr3Quuv0kwajqIcwrtiDc-SxbtFYGoFafWGF6_Fw>
 <xmx:4_M4Zih4GJtHow5_R9qGkcefOkb1gIDcPtgtAwQ60Ozc-R8HRGLUtQ>
 <xmx:4_M4Zotg_n3dJBwLWJ-vpX_vIVVJ0v46krWJAiI7uYb5nmwiy_fMwdZ8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 65593B6008F; Mon,  6 May 2024 11:14:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-437-gcad818a2a-fm-20240502.001-gcad818a2
MIME-Version: 1.0
Message-Id: <618ea004-6fd9-4f1c-836a-fbf66089a03b@app.fastmail.com>
In-Reply-To: <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
References: <20240503192858.103640-1-florian.fainelli@broadcom.com>
 <8e1867fc-34da-457c-b95a-2d51ea97336a@app.fastmail.com>
 <05a5e893-12f7-49fd-9a9a-abd387571f9b@broadcom.com>
 <ZjjXtEwWWZX43c6l@phenom.ffwll.local>
 <47c63c4c-c657-4210-b476-c91c4f192483@app.fastmail.com>
Date: Mon, 06 May 2024 17:14:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Vetter" <daniel@ffwll.ch>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, "Helge Deller" <deller@gmx.de>,
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

On Mon, May 6, 2024, at 16:53, Arnd Bergmann wrote:
> On Mon, May 6, 2024, at 15:14, Daniel Vetter wrote:
>>
>> This one is. And it doesn't need to be simpledrm, just a drm kms driver
>> with fbdev emulation. Heck even if you have an fbdev driver you should
>> control the corresponding backlight explicitly, and not rely on the fb
>> notifier to magical enable/disable some random backlights somewhere.
>>
>> So please do not encourage using this in any modern code.
...
> Alternatively, I wonder if that recovery image could be changed
> to access the screen through the /dev/dri/ interfaces? I have
> no experience in using those without Xorg or Wayland, is that
> a sensible thing to do?

Replying to myself here, I think I found the answer in
https://android.googlesource.com/platform/bootable/recovery/+/refs/heads/main/minui/

which has separate backends for fbdev and drm, and should
just work as long as the drm driver is loaded in the
recovery image.

Florian, do you know why this is not being used on the
machines you are looking at?

      Arnd
