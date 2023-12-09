Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0D80B68F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 22:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7842610E298;
	Sat,  9 Dec 2023 21:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9053110E298;
 Sat,  9 Dec 2023 21:43:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D4D73320046E;
 Sat,  9 Dec 2023 16:43:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Sat, 09 Dec 2023 16:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1702158233; x=1702244633; bh=We
 6kY3gAvHmi9sxQSDSEwapFQp49viPEwJBBDd9ci5w=; b=cvHA9bOcnXtURsTD7h
 hQIwOkrnSC/IEaopUb7jcU3SO71P2HglKc/Uf/tbOJgiQdVvBbYUi5wIeI/SuHdN
 yihGgZozlJtPuOEBXBUtit4VmIrrw4iI9wyvOpZtesme/XJI4CB73j6HIO/29i2g
 J9jzcjTXS3e2q7va1k83+YbmF98nTRA9aZv5rVUKh4ua+HV757M6xE1l6PExeBOH
 4AkKpOCn6h7HzggQz1bKkZ1QqQEmo4X7lqBxD3JHribrEUCKyubmKlBs8AncEceS
 WsxBv/4g9Tsa57PG4+KEQ8Z9hREEBU5ah1hjoC1XZRXhc0YlNTK5bJ/RHhiFPZSQ
 R4MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1702158233; x=1702244633; bh=We6kY3gAvHmi9
 sxQSDSEwapFQp49viPEwJBBDd9ci5w=; b=JLgUH7waXEbUzBEVje+yS8gqR3UZv
 0CffHOWY0+Z+wwB+vW7KwAu70naHiDTc5u+OYzUVLCv0unDsrJpC93z3zETAGff7
 e0/T0GRtbRg0+VnKpUtTWPl/Q4nlGcTAyPFjPNVovSCRC1cUnlcC3O2I04IH5cok
 MESfiIG+6tt4R9ba3Gg9/9KnbqSVFlntTrRNLbzBRy93epWnYX5VTNrGGgOaENLy
 XlEPzcvCm3VRq9ydeqbEFCF21r5ibe7XRlynlw5bEBTNt50vdbXTP7QJa37rnJfz
 NT1ZcZ4nx6pbp3NiCJ8HgiHHtOAi3T7I/d1Ju8OBaYA2CHgazdrnZNtIw==
X-ME-Sender: <xms:mN90Zcj1t9YVcktHsm-DKH45IHMXpA9-Hpk1MgTfZICEl6zlaEQO-Q>
 <xme:mN90ZVBye_9O77lTM1mzlC0eY5rXGnN3rcl8YdJFkH31am33R7m_eb1Es3R2UGMnB
 7ZiLaTlclBhknsZ7ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekkedgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
 feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:mN90ZUHkY2lVvRTuVB80nWKONPPFQfKxiUCPeYhQNqvjAx9BHimUqg>
 <xmx:mN90ZdQBaq15D8xNbGkhH8mnW9rg4RLUFMqWhsHROKx2rdbi3lmzmw>
 <xmx:mN90ZZwDe9e9jmJA9g9aU6t06uGsYV23Rtq8P4aLnmtVN_b5V5QsZg>
 <xmx:md90ZeJ8gleODk1pUugxxYDlZwxKnUBYXS_E8L8KAxGPRh2PldOCLA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A87CDB60089; Sat,  9 Dec 2023 16:43:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <7996d21a-3e97-408b-82a3-3bad432095a2@app.fastmail.com>
In-Reply-To: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
 <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
Date: Sat, 09 Dec 2023 22:42:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
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
Cc: llvm@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Palmer Dabbelt <palmer@dabbelt.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 9, 2023, at 22:29, Samuel Holland wrote:
> On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
>> On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
>>> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
>>>>
>>>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
>>>
>>> I also see one of these with clang 17 even with KASAN disabled:
>>>
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
>>> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
>>> [-Wframe-larger-than]
>>> void dml32_recalculate(struct display_mode_lib *mode_lib)
>>>
>>>      ^
>>> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
>>>
>>> So I'm in favor of just raising the limit for these files for clang, like you
>>> suggested in the linked thread.
>> 
>> How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
>> in that function? That should also avoid the build failure
>> but give a better indication of where the problem is
>> if someone actually runs into that function and triggers
>> a runtime stack overflow.
>
> Won't that break actual users of the driver, trading an unlikely but
> theoretically possible stack overflow for a guaranteed crash? The intent of this
> series is that I have one of these GPUs plugged in to a RISC-V board, and I want
> to use it.

Ah, I thought you just wanted to get it to compile cleanly
so you could use some of the more common cards. If you
are trying to run the dcn32 code specifically, then you
should definitely fix the stack usage of that function
instead.

      Arnd
