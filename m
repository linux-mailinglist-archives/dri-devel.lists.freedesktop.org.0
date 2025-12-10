Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40507CB3409
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 16:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B3910E1FE;
	Wed, 10 Dec 2025 15:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="DzshKmml";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="FFaeg9pD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Wed, 10 Dec 2025 15:06:10 UTC
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BD910E1FE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 15:06:10 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id 1FF1E1380371;
 Wed, 10 Dec 2025 10:00:44 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
 by phl-compute-04.internal (MEProxy); Wed, 10 Dec 2025 10:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1765378844;
 x=1765386044; bh=3F9rY3jf//Lh0+TVIlNn2mQE5tkdRIgO4uaCG8qXxwI=; b=
 DzshKmmljMPyM50jQ9SVmMASZThstQGAviKNTwGGMubBeP6vTNpoZiFOnTDa+mbq
 QMK6UhvmVSzRW8N1dhWdh7oGbWI39vPUHgKyu8wtxD1GU8ywJd5419vg5gvvoA6w
 WJ6zp3/OEBRRt380augwsi2v5q4BtKvGjSQBzVx5R7BvpUCSRJA2WQ6M06vlSNWG
 vs0+yBcPzriBYwmrNAvspvF2qRxTsCfjKRqeNj4EriFDBiBYJewCCT/HQ+TGa40u
 9kW+vCKIVrDykGb7WS7ndr1+t8qwLOj3zupJ/ne+EOMutXEUZEPkWYsFP/fZ5RGN
 jKLpHFPkzNKK/5oOvSIFWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765378844; x=
 1765386044; bh=3F9rY3jf//Lh0+TVIlNn2mQE5tkdRIgO4uaCG8qXxwI=; b=F
 Faeg9pDGg1ojnzuso4MjEzDybQD+KL+e+olDujx3OnYvU9BU4kTqH04Na/U5wbF3
 JHwqaHqrgHdlhl88wVoLNetC3vPn7IbRxKec/EJwN6+QJFhBTyrSvC849WSIkdl7
 +r/3fe04NeU16iK47SQiGDmTwisWXL+QpaYX2fdYk6XpWaZfOzebsflsh5sfu4X2
 moc5ItNt9TrgBOeLvJx/Ivm/d3diF76F9WJCQ0YyooJmNeyWZQxjjQ/d8CNnzyen
 XoscxqJB1hyCwektD6lQ32LTiJhdc3ZZNZLlDiFfVwenVLuiRifJFqkEqKIK/C9A
 sj18k8A5pV+0ET5DZkUsQ==
X-ME-Sender: <xms:G4s5aQbnNUHoU-ijXirZK0p5YrqXbHwCCMt5rMI9CCaNzKJSQtybGg>
 <xme:G4s5aWOVmTqn-JfR_K08UdpmsB1QnjaEjP0_RiSu6QCG9mywWiWSxHE0kFnuhzor5
 Sb_GY0OrrP5OSHK_UxOwIbHTejGQugCnptTYAwGBY_rimWfXc8U1hk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdejgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
 esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhht
 pdhrtghpthhtohepmhgvsegsrhhighhhrghmtggrmhhpsggvlhhlrdgtohhmpdhrtghpth
 htohepughirghnuggvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehsihhm
 ohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtg
 homhdprhgtphhtthhopehjvghsshiihhgrnhdttddvgeesghhmrghilhdrtghomhdprhgt
 phhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushifse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:G4s5aQqjVChPkNNOA6aei2ILlAm3he_igXk36iuO-RTJ3Lcl3Am6mw>
 <xmx:G4s5aTDnnHByAkenTAiJnRpSKWWpQ0Oh7BK_1mmzEie2OMG4znzv-g>
 <xmx:G4s5aZogf-2YQ17eCyPNCB1m_37MX_72tIq0BqrLJueMhskYpPVHag>
 <xmx:G4s5aWBSmHdRi05PBBOXoCvRY8lFXU_y-9ptiO-4ylUnSRPBrt27yg>
 <xmx:HIs5aZ8QERDl83G8gYtdN0brwwtJHxEXxL00MRjYPPl6vxeEDpDKw0at>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 2770CC40054; Wed, 10 Dec 2025 10:00:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AWQo6ABWGaON
Date: Wed, 10 Dec 2025 16:00:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brigham Campbell" <me@brighamcampbell.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, "Doug Anderson" <dianders@chromium.org>
Cc: "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Anusha Srivatsa" <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <2ac20c84-2544-408f-a29a-8ae88ef3969c@app.fastmail.com>
In-Reply-To: <DEU9O691LF9V.142HEUAU7DZDR@brighamcampbell.com>
References: <20251204094550.1030506-1-arnd@kernel.org>
 <DEU9O691LF9V.142HEUAU7DZDR@brighamcampbell.com>
Subject: Re: [PATCH] drm/panel: novatek-nt35560: avoid on-stack device
 structure
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

On Wed, Dec 10, 2025, at 05:54, Brigham Campbell wrote:
> On Thu Dec 4, 2025 at 2:45 AM MST, Arnd Bergmann wrote:
>> Change this to a pointer as was liley intended here.
>
> Shoot, you're absolutely right that I didn't mean to create a copy of
> the struct on the stack when I wrote that code. Thanks for the fix! I'll
> try to be more careful with struct usage and the stack in the future.
>
> Can I ask how you got the build process to emit those warnings? I didn't
> see it when I developed my patch.

I'm doing randconfig tests to check a large number of possible configurations.
I also have the CONFIG_FRAME_WARN logic replaced with lower configuration
specific default to catch more regressions in this particular area.

       Arnd
