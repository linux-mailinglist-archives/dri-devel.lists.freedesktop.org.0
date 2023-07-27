Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3A764D75
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925B310E04C;
	Thu, 27 Jul 2023 08:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B562C10E04C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:34:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 21A2E320069B;
 Thu, 27 Jul 2023 04:34:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 27 Jul 2023 04:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1690446840; x=1690533240; bh=Kt
 70aUWRCQiNoYiStp/Mo3gHp9sQpR7A/WtiJssbNbE=; b=M+ThFV+WHuxvXWi+JN
 svub23aKsXg8Po4cl5kYcKXQKk7JIAwPlLqlsti1nXh1rsxE/Mqja5iKs8zqDl1+
 SMl+/ljk5nT4EWjN/CKAundLr5A5/iDyhqeNKopzbCRzOZS+Dyc+w2HjT/pzs6Hv
 77zLJL51uwnRAVZXL4RLxfJZD8YL58Y3Wwdf4ySrfKGgg7rDbY5wZSM+AFPJFRoU
 ZRXoWyGdltPHzIJQCCJZZ7mTVtjEp0tU84QlDuWLhvxT5pfz6oyZywhx+dcFllk6
 wZQ9u2wqsPztWYDFafVQ5n9i3WGWrpzfFVn0igSk78Dk4FPmz0g3dp20O2RnBIYW
 6g7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690446840; x=1690533240; bh=Kt70aUWRCQiNo
 YiStp/Mo3gHp9sQpR7A/WtiJssbNbE=; b=FcMTzQ1AKdZXVDCw5R2pj43HYBQ/6
 W0s/dMYzOx4H00wAxrUHjFDZ7tGhql6YcM1RDFEK9Fo1WaIMVwdlv6p5+9gBPr5g
 kCh9hGQ2v+mHKOLolWJSqF+EOODbblBLrVUxuPLFMTOiI3AqW6HZO7GWU+ONc74b
 2KpClSxeoAquY3CLuRefVOu/E12FezvX1QdAGvj8HsYYGu/XSu0Cbf3V2pJc0TCe
 BJurzq9LUZVmAVuSCXR2+PSzgE0K4O3Q5dNHSU9NMQ0vkE6G9Pw1SEC8CWI5owmh
 jf+XsSk0hmwRF+AmAwHZOPTQO2QzJ/e/xjcyic5Dt/NnSDHEUBP4hQEQw==
X-ME-Sender: <xms:-CvCZHIWjRB1POHcnPkdKvIihnigSagvCjqOa0WF0tf_crB3qoNmXQ>
 <xme:-CvCZLIWS6P0zLBVAV-PI9vKxNqbzgrubyHk_W7Ncl0Fr1N1t6iCguI0H1FANPodd
 ZE2asH2JNUT2hYFrRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieefgddufeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-CvCZPvt1DxLYZ3HVNE_NZx4aI0nE8ucuqJ5-TT11VRnnx1nt3g3FQ>
 <xmx:-CvCZAZCwIbZ3lILeZfZHFjm2H3eAkwyaJA-uV-eegIbHbaM54rwyA>
 <xmx:-CvCZOZE-WiPr6j7hjetZNAvWWwtJJB_iqR9qRRxdRjVrqAHRvWlrA>
 <xmx:-CvCZDP8FOUywRvnP2FA_cUa1xaoLPMgY-YYR3dLf61o9hQE2PM5Gw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5BA55B60089; Thu, 27 Jul 2023 04:34:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
In-Reply-To: <20230726220325.278976-1-arthurgrillo@riseup.net>
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
Date: Thu, 27 Jul 2023 10:33:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arthur Grillo" <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
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
Cc: tales.aparecida@gmail.com, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023, at 00:03, Arthur Grillo wrote:
> Using the `kunit_tool` with the command:
>
> tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests/
>
> Lead to this error[0]. Fix it by expliciting removing the
> CONFIG_DRM_FBDEV_EMULATION.
>
> [0]
> ERROR:root:
> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>   Selected by [y]:
>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>

I think that's a bug in the Kconfig files that should be fixed
by enforcing the correct set of dependencies. I have not encountered
this in my randconfig builds (with a lot of other fixes applied)

In linux-next, CONFIG_VT cannot be disabled if CONFIG_EXPERT=n,
so this does not happen.

> diff --git a/drivers/gpu/drm/tests/.kunitconfig 
> b/drivers/gpu/drm/tests/.kunitconfig
> index 6ec04b4c979d..c50b5a12faae 100644
> --- a/drivers/gpu/drm/tests/.kunitconfig
> +++ b/drivers/gpu/drm/tests/.kunitconfig
> @@ -1,3 +1,4 @@
>  CONFIG_KUNIT=y
>  CONFIG_DRM=y
>  CONFIG_DRM_KUNIT_TEST=y
> +CONFIG_DRM_FBDEV_EMULATION=n
>
> base-commit: 45b58669e532bcdfd6e1593488d1f23eabd55428

Changing the local config should not be required after fixing
the Kconfig files.

    Arnd
