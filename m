Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D732AA8205
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 20:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F0710E205;
	Sat,  3 May 2025 18:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="EJavWuzr";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Aapabulk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E142810E0DC;
 Sat,  3 May 2025 18:52:39 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 707CF2540115;
 Sat,  3 May 2025 14:52:38 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-06.internal (MEProxy); Sat, 03 May 2025 14:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1746298358;
 x=1746384758; bh=L7whafli7ccrgxtjjLt2LWxTdI/uTPEKZB5Tk4Ozj10=; b=
 EJavWuzrdG2lF1+QcZXVqatf1Fn2BX8hkN8U4RKRlmsh1nXoBz4Qm7qzb42sWiq8
 NPISbjGWj6Tdlqd5aLr7RVsZTs3Grhp8vI4b+P+o/2QQsy6WiC2vjux8OwCoHReJ
 K7JoJBMdaHsrNn8HZ5Nrk58Vzjfy4PhjMDjohQrHaZjkonENHWBYXELA8msr8tPS
 FrIE6uRz+lWgvR7+dae0TpVitPYDVbU0LJQttMOsxi+jWIOu6E3gwWy5K7DvRbNs
 l5snGA1AmJFitdy8kGP+VCin8YQizi1zRH8PPzvMqlBKrkpx2+BRwzgGXSYWNTAd
 LPrlBzA/0SwYVlU6+K7SeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746298358; x=
 1746384758; bh=L7whafli7ccrgxtjjLt2LWxTdI/uTPEKZB5Tk4Ozj10=; b=A
 apabulkrmj/lvhEaoqF9mnr01F5XTnmTyCnDgOn+NzF9j6kPEt+gx+fcvKASXliL
 jDIKBDXOHtbnBihZuWnOsrWWtWGEWLuL2dSwje5fVcSCbz5w96e+c1SyvjU2/T1n
 KPqXsFlzOiK6B+Zolc9ABkRWhrj1oJn+tkpOqMeLUu5XOrJ3TRX0/JmwbndGG2nm
 QlCcg8KEbMM9E31uLp258zXzeG3eqX2HchUhoY45YQerwS7C4ZbWuaBKwlP1Cejg
 Njs7GUAsFSJcUGon7pUQ2dvAwrhqDDAAtbpDHMc8nLgMwiW6gcX+7+3YHJdEBPYx
 CgWaohr61jC0pxQSrG7PA==
X-ME-Sender: <xms:9WUWaAZaOXjayHPRNj0rqnJtfsZ_r-iBLuLHX3xtfrzUqBWZ_2vsjg>
 <xme:9WUWaLbUyjDmfOunX1Qiw1lPGYudpbDgIDBDI4b5D0LgYpAcBPfyfiuzQlOrwVYLK
 6iqr6Z8_4E8bVzqkoc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeeiuddtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpeflrghmvghsuceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmh
 grihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfdtheejiefghefhjedvheduuddv
 gefhveeiheduleevveehkeetiefgieeukeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegsohhlugdriihonhgvvdefjeefsehfrghsthhmrghi
 lhdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtph
 htthhopegrlhgvgidrhhhunhhgsegrmhgurdgtohhmpdhrtghpthhtoheprghlvgigrghn
 uggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthhopegthhhrihhsthhirg
 hnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehhrghrrhihrdifvghnthhl
 rghnugesrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdrtg
 homhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghi
 rhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrg
 hlihgrrdgtohhmpdhrtghpthhtohepshhkhhgrnheslhhinhhugihfohhunhgurghtihho
 nhdrohhrgh
X-ME-Proxy: <xmx:9WUWaK9toOQydufxLh0_u7f5mvc1v6hHdNQfj3hKCvyNtI_c_9Y6rA>
 <xmx:9WUWaKpZEZ_iN5FaRixxsZ1j7aFCCIcwN1XP6aAiKm6CtcmNAhtRCg>
 <xmx:9WUWaLqt7aHfKwI67c2gXfAtc6HWZ-I42oSs8Th0Abph73qpIii6Rw>
 <xmx:9WUWaISwpnA_GQvFfTxPYImBFJrsCpqLnh-XvoIn75HvP-7cDFaS_g>
 <xmx:9mUWaKFOW2N7x_Qp_Sv_orU37p5J0bKYC9mmDpOSxSUBQHX_qDwkxRZ1>
Feedback-ID: ibd7e4881:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id F1B4978006B; Sat,  3 May 2025 14:52:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T48d424c97f2c2475
Date: Sat, 03 May 2025 11:52:16 -0700
From: James <bold.zone2373@fastmail.com>
To: "Alex Hung" <alex.hung@amd.com>,
 "Harry Wentland" <harry.wentland@amd.com>, sunpeng.li@amd.com,
 "Rodrigo Siqueira" <siqueira@igalia.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, simona@ffwll.ch, "Shuah Khan" <skhan@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Message-Id: <e2119599-6641-4327-b3eb-d49c128e8513@app.fastmail.com>
In-Reply-To: <83eae1ce-ead2-47c9-a636-755a5207a6be@amd.com>
References: <20250501055701.2667-1-bold.zone2373@fastmail.com>
 <83eae1ce-ead2-47c9-a636-755a5207a6be@amd.com>
Subject: Re: [PATCH RESEND] drm/amd/display: adds kernel-doc comment for
 dc_stream_remove_writeback()
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


On Fri, May 2, 2025, at 3:25 PM, Alex Hung wrote:
> Hi James,
>
> checkpatch reports the following warning and error
>
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
> description?)
> #18:
> Adds a kernel-doc for externally linked dc_stream_remove_writeback() 
> function.
>
> ERROR: trailing whitespace
> #39: FILE: drivers/gpu/drm/amd/display/dc/core/dc_stream.c:561:
> + * Return: returns true on success, false otherwise. $
>
> total: 1 errors, 1 warnings, 14 lines checked
>
>
> On 4/30/25 23:56, James Flowers wrote:
>> Adds a kernel-doc for externally linked dc_stream_remove_writeback() function.
>> 
>> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> index 0478dd856d8c..060ee6c3fc2e 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> @@ -552,6 +552,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
>>   	return true;
>>   }
>>   
>> +/**
>> + * dc_stream_remove_writeback() - Disables writeback and removes writeback info.
>> + * @dc: Display core control structure.
>> + * @stream: Display core stream state.
>> + * @dwb_pipe_inst: Display writeback pipe.
>> + *
>> + * Return: returns true on success, false otherwise.
>> + */
>>   bool dc_stream_remove_writeback(struct dc *dc,
>>   		struct dc_stream_state *stream,
>>   		uint32_t dwb_pipe_inst)

Thank you Alex, and sorry about that. I will correct those issues and submit a new version.
