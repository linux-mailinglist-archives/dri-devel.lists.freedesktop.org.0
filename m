Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F79638716
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC27310E5F6;
	Fri, 25 Nov 2022 10:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB47E10E5EB;
 Fri, 25 Nov 2022 10:10:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C968D5C011C;
 Fri, 25 Nov 2022 05:10:08 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Fri, 25 Nov 2022 05:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1669371008; x=1669457408; bh=sHNDwussAO
 DPs0bMRD5Q0+uhuwgj3HV2Euo1WwhXFms=; b=WvsTSkpj57FeW2bCYcSxBN7GZB
 RPS6+d8Z0kwTQY+YsMFHTPYXUhPpmBpzM6Ijib4RH+CthsoBH7d7qhVMs1xPpKOl
 2msAxkxW77eYdm2K+gLQ0VsnVBk9bGZ2/vXTok/XmP5Z2RTc49gyR91hY2Dutp89
 pmMyj8xAAHD9Ei7QsNpCxzgtGSitxX37UY50av3jRTQZqAf97Nqus9dH7vJloAA4
 mA5yBq3AZwT2LO9UzIbwtgZEHk/aqVk2qpMCm+Eph1c10hKDzhaA2VF2JsaihDhn
 gxRStJZabserBvI47e8uqsnYBhjRfSbEtv5fdFn8H5ywNOjxUiWDXlLN09eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669371008; x=1669457408; bh=sHNDwussAODPs0bMRD5Q0+uhuwgj
 3HV2Euo1WwhXFms=; b=fJ0rcyJaeCm/CRMm12MXRsYMFCzv8arZ6TCxIh6NDMHI
 sjkPltkiy/h8jKPZ1JHPlMFQGY4T0jDmahKzTjKV2bsRsoJwt0tJfHM44j7uBde+
 ngcbjypLIGe6x3NS7MQBrgkvFDOM9hIfoDOpRxbht78CWJqpp0Hdr3lehW/PRbjB
 7NEYapsfiSDLaubOarcX6k+XFLJu6zwmRZ9DP2jsgtc0TTxHdZYG+2tz61qdFOvy
 OCV/5ev7CA0mR/KQRqtZeQCZ15bJJdGOXxAUMCOMSY9y8TVzSEscgaFRKtD45xLp
 SEr+bSwi2fmXxZUJEU2s/wBNLwl0sW+/oue2/+yYNA==
X-ME-Sender: <xms:gJSAY6qPRPh2Cq0b0CQ4lAsfnMviHcWLAs58MPV8e0TF2CUpuvom4w>
 <xme:gJSAY4oD8nKYgXIRUH0L7piwat9Elpsj2GRtCZ2am-87NsahTxTBWGyq-hstdhC_5
 KoVtwi__B9LGLIsYF4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:gJSAY_PV0UbOXz3I4CW9JTI6t5UnpXlfGz0UH1yHmC1kHeUHVdG9PA>
 <xmx:gJSAY57Wd-iPEEnDS3buE8trakr2m4IKvgvhNMf_PHZTwmdgnbzP_Q>
 <xmx:gJSAY54ZxL8mrHTzz1YoGTjQeBrGOBoNxFWlONFZAxBWL1F6W9Pdng>
 <xmx:gJSAY2xCO-nom1RUTGjMIMPJYnJnrp_FGykf51NJev0fCcENkTfvWQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6CDCEB60086; Fri, 25 Nov 2022 05:10:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <fdce9233-b547-43c9-aea9-3038a1a84a1d@app.fastmail.com>
In-Reply-To: <20221125092517.3074989-2-lee@kernel.org>
References: <20221125092517.3074989-1-lee@kernel.org>
 <20221125092517.3074989-2-lee@kernel.org>
Date: Fri, 25 Nov 2022 11:09:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, 
 "Nathan Chancellor" <nathan@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Tom Rix" <trix@redhat.com>,
 "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com
Subject: Re: [PATCH 1/3] drm/amd/display/dc/calcs/dce_calcs: Break-out a
 stack-heavy chunk of code
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022, at 10:25, Lee Jones wrote:
> bw_calcs() presently blows the stack-frame limit by calling functions
> inside a argument list which return quite a bit of data to be passed
> onto sub-functions.  Simply breaking out this hunk reduces the
> stack-frame use by 500 Bytes, preventing the following compiler
> warning:
>
>     drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dce_calcs.c:3285:6:
>       warning: stack frame size (1384) exceeds limit (1024)
>         in 'bw_calcs' [-Wframe-larger-than]
>     bool bw_calcs(struct dc_context *ctx,
>          ^
>     1 warning generated.
>
> This resolves the issue and takes us one step closer towards a
> successful allmodconfig WERROR build.
>
> Signed-off-by: Lee Jones <lee@kernel.org>

Is this still needed with the patch to turn off the display engine
on most architectures? On which architecture and with which compiler
do you still observe the problem?

Note that this probably doesn't actually solve the potential stack
overflow by itself, since the function that is now split out
is still called with the parent stack active. Splitting out multiple
smaller bits however would solve it since then the stack frames
could overlap.

    Arnd
