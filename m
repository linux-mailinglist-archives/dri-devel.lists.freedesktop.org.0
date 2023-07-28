Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30816766AD0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 12:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DB310E171;
	Fri, 28 Jul 2023 10:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739B10E171
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:36:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 097395C00DD;
 Fri, 28 Jul 2023 06:36:30 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 28 Jul 2023 06:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1690540590; x=1690626990; bh=fGf4vkC7kTuh6zjTnJeX+/H47oyZrFGunTu
 jcYTSFWA=; b=Hi9jduKRY358QdEnHSETxHJn9gaqjTn6N/91K1X2KRnkjsu5Glt
 bLlXU4lXNYOZue+eIAm8KTG54LJQznT3qSgrfM0YOYP3E0hoFiQsdAmSwWuvFWfD
 SgpCvLcehuqnu+AphL7bFxwtLAzTydysgWLorqINMISN+nI188QeicTOP7T56oBS
 nMgROzZ/bA6NoKVQzwvALINmT+ZuYAkh0+lnFa6gd7oiHrA+h/auKah0ZH8bx6/p
 IaWQ57mXCiUvUtK69mOJA82EPIT/jMRfp+qiI+SyENR4pF0ZrxbuKmtPYF8Yqtad
 71gfps5+5To/bxuvL+ZnNJ5Ht/y0yLcNELA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1690540590; x=
 1690626990; bh=fGf4vkC7kTuh6zjTnJeX+/H47oyZrFGunTujcYTSFWA=; b=s
 XtBSjpUwfRyu4g/Q6TejrQ8aO4/Wsuj2k9PELtJavY/Rmx+IC8Gy6Cd3sE/w71s+
 1E6nDAxHfeNMzdWhDd3PwCA9jwyB60Ga09pAWZ5eXa0OzLxGLMevheJ4f3AeD89Y
 x1H9UM6GwZy11npMpRN2PchOgmyIYmgdlTPuu16D0GUCGI3GrQTY7kDpSTb3Wino
 G5bcvr44jK2vUxFngcub8EILRbORo9+pI2VfYjea/eOP3HCot2pddciBVZ+Of7zi
 gdG/Zwp9WDtLryncB0mKdApS3foiKFIvvHTlGyP8EyJ7nZEMMcQzVF/AaLIaNGs8
 8gbzpvIzw+7+LG4N+k9KA==
X-ME-Sender: <xms:K5rDZJ6VnTtde425jiB_HPgXX5aLwTsclmuALmkk3A4pu4ZgTa2_NA>
 <xme:K5rDZG7EIjC2tcMYsuzYazOf30r5M6PBE0sMqXLQyMwG5oStDTaFhiCGaw1xIuRjO
 aKXJQvuZuPD0dfVRTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieeigddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeejgefhuedtjeejheduveegheevudffjeekhfevfefgtedtheegieeludefuedv
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:LJrDZAfPECyoUspRT4vJn-hj4ctnf_N62SpIjmxSpyZ-ucgFv12VVQ>
 <xmx:LJrDZCLcfw6ZylPRRE4k7QkFnx6ve2PR-4qzncSWe9lbY13mcVz3OQ>
 <xmx:LJrDZNIK07Mu49A9gRk-6puFSThTykxWDQ-PKTIReiXdlZf8rNA2qg>
 <xmx:LprDZN7WUxXxX_5yfpkv8EU-JI6JJZTvEI-f8WOGuJ73Z5hKK6EfDw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D46CFB60089; Fri, 28 Jul 2023 06:36:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <c43eb465-369e-4294-8783-e5401a8074b4@app.fastmail.com>
In-Reply-To: <20230728091208.45506-1-wangzhu9@huawei.com>
References: <20230728091208.45506-1-wangzhu9@huawei.com>
Date: Fri, 28 Jul 2023 12:36:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhu Wang" <wangzhu9@huawei.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, rfoss@kernel.org,
 "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>, jonas@kwiboo.se,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Dave Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Doug Anderson" <dianders@chromium.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maximilian Luz" <luzmaximilian@gmail.com>, "Peter Rosin" <peda@axentia.se>,
 a-bhatia1@ti.com, nikhil.nd@ti.com, "Tomi Valkeinen" <tomi.valkeinen@ti.com>, 
 "Tetsuo Handa" <penguin-kernel@I-love.SAKURA.ne.jp>, eballetbo@kernel.org,
 drinkcat@chromium.org, "Thierry Reding" <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next v2] drm/bridge: fix -Wunused-const-variable= warning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jul 28, 2023, at 11:12, Zhu Wang wrote:
> When building with W=3D1, the following warning occurs.
>
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:48:17: warning:=20
> =E2=80=98anx781x_i2c_addresses=E2=80=99 defined but not used [-Wunused=
-const-variable=3D]=20
>  static const u8 anx781x_i2c_addresses[] =3D {
>                  ^~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:40:17: warning:=20
> =E2=80=98anx7808_i2c_addresses=E2=80=99 defined but not used [-Wunused=
-const-variable=3D]=20
>  static const u8 anx7808_i2c_addresses[] =3D {
>
> When CONFIG_IO is disabled, above two variables are not used,
> since the place where it is used is inclueded in the macro
> CONFIG_OF.
>
> The drivers under the directory drivers/gpu/drm/bridge depends
> on the macro CONFIG_OF, it is not necessary to use CONFIG_OF
> or of_match_ptr in related files in this directory, so we just
> remove them all.

Note that even for drivers that do not depend on CONFIG_OF,
it's almost always better to leave out the of_match_ptr(),
since the only thing it can possibly do is save a few bytes
of .text if a driver can be used both with and without it.

> Fixes: 0647e7dd3f7a ("drm/bridge: Add Analogix anx78xx support")
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
