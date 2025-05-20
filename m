Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B04ABCCC9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 04:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B7310E426;
	Tue, 20 May 2025 02:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="PcOPORvT";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="dqBRWi2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0410310E405;
 Tue, 20 May 2025 02:06:31 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id C701513803C1;
 Mon, 19 May 2025 22:06:30 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-06.internal (MEProxy); Mon, 19 May 2025 22:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1747706790;
 x=1747793190; bh=mZ7WwfyJ61d2d/Fq29HMvfUfq/XAcz+uQK+XMDt9ykI=; b=
 PcOPORvTTqJcNmE/5TlXvGAzK5Nf7by9gFrw3jGMsJ5uZ1RIyx5BsW+nSEir1ZOg
 FTRo6RON8938Euv9vDWEKtiSAEe7dygxo2ellKDxFl/8AhOQmw4jGXdVqM2g+1S8
 FJBDtYSqQmRfXn13o1w0EDw6IWcK/hE+Eq20mt53RrslJbPknvnuGkB6WS00EjqQ
 iqAEQ4gN5vVT08u4pBdw9DZEWKM6vO8NSTWTI7ZkzyaGR3qZseda1FUqXWeT3lp8
 R5oJN+usbO8WxNoC3UDh9T3d256jfMg/Z5uzGpy3R8MIHiFhNEgOm/9UOPRLxfmW
 +Bkhh+OIrZz6P7YHurK4ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747706790; x=
 1747793190; bh=mZ7WwfyJ61d2d/Fq29HMvfUfq/XAcz+uQK+XMDt9ykI=; b=d
 qBRWi2ZQSWXPgf+GMtNLA3aE9olJiSDXedE3Fmc0dvPc7Xn045jM/RTU7OQnBFid
 sZrzgUXJuRj2kFeMudkieFCqMXe3SwFX2TZA5XDEoQRfsqdl2Zql14Gcsjzlp9Zu
 e+cmG29FurR0pupfgsb5sii6JuziQn9OkoJFuxCnT6LM9yzbUhhs9EDDt/H8UClQ
 fcpvvXTJhwXV1pWCY+c6L9h9DHPvClokpnLaq3DtRVydBJEYZflVu9yEqSFNx1Gq
 fYCFfli03EFEDtFICYqBC/WMsuE+gBfGdX2K58jiqZXjxiwdEyKf9wvi4HqKOH/X
 I6tQYSNw0JH0fv2EAjnlw==
X-ME-Sender: <xms:peMraDfVvyQW2cY133_umWtYdsnD-MSJjkVoT8510hvguAwxD8SbAQ>
 <xme:peMraJNO54e9z1hXHdCec0tCFZj4Zt7Y9dHn-jyQ4eh4iEdGpYZr-CNJKAn_kC3bR
 LOdYsA2ymrRT_hWpb4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdeftdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
 tdejnecuhfhrohhmpeflrghmvghsuceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmh
 grihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeeivdevieekieefudehteduvefgtdel
 veeivdfgfeekudetgfeftdeugeejvddtvdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegsohhlugdriihonhgvvdefjeefsehfrghsthhmrghi
 lhdrtghomhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtph
 htthhopegrlhgvgidrhhhunhhgsegrmhgurdgtohhmpdhrtghpthhtoheprghlvgigrghn
 uggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthhopegrlhhvihhnrdhlvg
 gvvdesrghmugdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighes
 rghmugdrtghomhdprhgtphhtthhopehhrghrrhihrdifvghnthhlrghnugesrghmugdrtg
 homhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdrtghomhdprhgtphhtthho
 peiirggvvghmrdhmohhhrghmvggusegrmhgurdgtohhmpdhrtghpthhtohepshhimhhonh
 grsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:peMraMje-I5IgPXbQCaPM7Vn-gdDBlNzjetV0uWaFu-DephIS0X78Q>
 <xmx:peMraE_3YY2DnVaKzbjc-0Qc1RJvplFDcmPnv3r9sh_q1vYThzm4iQ>
 <xmx:peMraPsK__EbJu3o-693yM0L4v8xs-Y-9UCqnolu5vmmk0D1jUH5gQ>
 <xmx:peMraDHLv3e0oscSRLRhfl8p_EnnF_TIIaTEmT_4jOF_puTL5A1mEg>
 <xmx:puMraF2lxc_ZLmdmmeFcG2eQlpwwJaJfPwgKWhUSPTwPMvDomtzW-oa->
Feedback-ID: ibd7e4881:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id B694B78006C; Mon, 19 May 2025 22:06:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T895cc9c4e3ca05a1
Date: Mon, 19 May 2025 19:06:09 -0700
From: James <bold.zone2373@fastmail.com>
To: "Alex Hung" <alex.hung@amd.com>,
 "Harry Wentland" <harry.wentland@amd.com>, sunpeng.li@amd.com,
 "Rodrigo Siqueira" <siqueira@igalia.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, simona@ffwll.ch, alvin.lee2@amd.com,
 zaeem.mohamed@amd.com, "Shuah Khan" <skhan@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Message-Id: <458ee98c-872c-44eb-81a4-cb1fabcc4704@app.fastmail.com>
In-Reply-To: <53d0e162-da9d-4fea-aba3-b96a9da844f2@amd.com>
References: <20250503211902.70141-1-bold.zone2373@fastmail.com>
 <53d0e162-da9d-4fea-aba3-b96a9da844f2@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: adds kernel-doc comment for
 dc_stream_remove_writeback()
Content-Type: text/plain; charset=utf-8
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



On Mon, May 5, 2025, at 9:02 AM, Alex Hung wrote:
> Reviewed-by: Alex Hung <alex.hung@amd.com>
>
> On 5/3/25 15:18, James Flowers wrote:
>> Adds kernel-doc for externally linked dc_stream_remove_writeback func=
tion.
>>=20
>> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
>> ---
>> V1 -> V2: Corrected checkpatch warnings and errors
>>=20
>>   drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/driver=
s/gpu/drm/amd/display/dc/core/dc_stream.c
>> index e6e41678525f..b883fb24fa12 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
>> @@ -569,6 +569,14 @@ bool dc_stream_fc_disable_writeback(struct dc *d=
c,
>>   	return true;
>>   }
>>  =20
>> +/**
>> + * dc_stream_remove_writeback() - Disables writeback and removes wri=
teback info.
>> + * @dc: Display core control structure.
>> + * @stream: Display core stream state.
>> + * @dwb_pipe_inst: Display writeback pipe.
>> + *
>> + * Return: returns true on success, false otherwise.
>> + */
>>   bool dc_stream_remove_writeback(struct dc *dc,
>>   		struct dc_stream_state *stream,
>>   		uint32_t dwb_pipe_inst)

Hi,

I am just following up on this to see if it=E2=80=99s been applied, or i=
f any adjustments are still needed.

Best regards,
James Flowers
