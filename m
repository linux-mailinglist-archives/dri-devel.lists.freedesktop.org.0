Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02543638BB6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 14:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E97C10E7B9;
	Fri, 25 Nov 2022 13:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8028510E7B3;
 Fri, 25 Nov 2022 13:58:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B0A65C00EE;
 Fri, 25 Nov 2022 08:58:16 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Fri, 25 Nov 2022 08:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1669384696; x=1669471096; bh=HZFW0Q6ily
 rDold9b9ca9gHjKB3WJYu7yBNi/OLlm4s=; b=KGJZiKitRl3OE1rk8bBGc/1ZQ3
 Ma4nnuK/qC4S+Z7c21rN3BBkmmsOTu1iSi306GclQlD1aLoZAI7bxy/Zyf2WWL/c
 T9YvWuOmeJrBE27O8hLQcZnBIRtt9zF029V8GJQjvRIz05T4SrutfObIB2+ecPmU
 aBmXNBORU+7plARbIQUQSQ5mPoXPc7wapieq5aUFQwuQ3c9l+7X8Di1Tkd2WkPey
 JXi606GY2/woLA7wakeS7nNMMWQZj5pAhDMaidzPb4bOqwDKNFBbYuTD93yeC7H7
 nYJlejZXEmApA5wxfE4OEZtGDMbpTAe+VgMh0H2DdXH/wJsvYNw8sBVsSGiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669384696; x=1669471096; bh=HZFW0Q6ilyrDold9b9ca9gHjKB3W
 JYu7yBNi/OLlm4s=; b=WCy1IAOAaD2q1pazTB73ladozixKckhwGuvVzqadnlJP
 8J01lU3w9VknC9kPGp3I7gOJrs8GiLfpRxTIkKd6S5jJAjCWwHIQhYJNTTJSZTEz
 i3nXo0D2H947sSrNaGRGnq5Kp8vW1eQ1zBUysveDTiTrDXCVrwt/ul8GqKybWKtD
 7V/BtIkBcO16XL/6LR4PoTIzudeUJeTt85YvzVW28dvqxomIk2wSGU5DV1WHXU3H
 ZWgvNxf3+yDutaJgJ/WYFSUUhTJYy/wuxE/IPkXCtHQMWBNM1T3RQXY8C1aaSYps
 39J8LX+2CdwIwUPL7WGG4cv2wSM6DmRkvi8McvKdtg==
X-ME-Sender: <xms:98mAYwTQQTPGZUCY5Ecf99OxN3NiVm8yFLqj-xE3583Zb1FwbQfQdQ>
 <xme:98mAY9xFj3fZePOmQeLVotqhpGpJT82FlInXycwbBhS05dxL7D2bG8b9TqWBgvUHn
 mZ3bCgl9dGb2ra3WG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:98mAY92-9MacwOWeuopHJrwvwn8LiAnzE5Y0q9lTofBIjOxjSE_S2Q>
 <xmx:98mAY0A-T3hqUI6pt_PcBXnOum7WDdCLnvk4tFP0rF6WahVCDRCXwQ>
 <xmx:98mAY5jF7orPhyh-LUci3Lcj-EVZkKEk81Hfz_gu9sIAR7uraz74FA>
 <xmx:-MmAYyZ2dEuifH96GuYTNE97AmSuYSQT7jhv1i24XaZPX_o4hKDJ7A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 90CCFB60086; Fri, 25 Nov 2022 08:58:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <347df991-4755-4f11-b530-4d0e3994a9db@app.fastmail.com>
In-Reply-To: <Y4DFx20YXDLcuVJm@google.com>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125120750.3537134-3-lee@kernel.org> <Y4DFx20YXDLcuVJm@google.com>
Date: Fri, 25 Nov 2022 14:57:55 +0100
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
Subject: Re: [PATCH v2 2/2] Kconfig.debug: Provide a little extra FRAME_WARN
 leeway when KASAN is enabled
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

On Fri, Nov 25, 2022, at 14:40, Lee Jones wrote:
> On Fri, 25 Nov 2022, Lee Jones wrote:
>
>> When enabled, KASAN enlarges function's stack-frames.  Pushing quite a
>> few over the current threshold.  This can mainly be seen on 32-bit
>> architectures where the present limit (when !GCC) is a lowly
>> 1024-Bytes.
>> 
>> Signed-off-by: Lee Jones <lee@kernel.org>
>> ---
>>  lib/Kconfig.debug | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> index c3c0b077ade33..82d475168db95 100644
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> @@ -399,6 +399,7 @@ config FRAME_WARN
>>  	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>>  	default 2048 if PARISC
>>  	default 1536 if (!64BIT && XTENSA)
>> +	default 1280 if KASAN && !64BIT
>>  	default 1024 if !64BIT
>>  	default 2048 if 64BIT
>>  	help
>
> Note this also fixes 61 warnings when
>
>   (GCC && !GCC_PLUGIN_LATENT_ENTROPY)
>
> ... which as Arnd says should not be enabled by default.  We'll
> address that issue once this set has been applied.

Thanks a lot for checking this!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
