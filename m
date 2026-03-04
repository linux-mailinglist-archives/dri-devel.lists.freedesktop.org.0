Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBSBNnqBqGlpvQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 20:01:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D45206C55
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 20:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4810EA7E;
	Wed,  4 Mar 2026 19:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="mtZIUOI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6389C10EA70
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 19:01:09 +0000 (UTC)
Message-ID: <559e74ce-f572-4f92-a6ff-4f4feb3db028@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1772650867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2GN9fZLcJOt5gGCUtsmhrqERVtGtfaDHOgportvZj0=;
 b=mtZIUOI+geuTaBstE1+9kS/rAJKWDCLwxzdqB34NruU+WzILuNZ3RHgSB0zcawq8ougovl
 muJG+32FveNMumN6yYGjrV/VP4T3bXjtoYD6GeGjJPMowmIXQ6aXLOkD83mc4YAny6J2Bk
 csqKqoPbTdhLe0XWjTvT7Zu1UyPdYqohAsDvsf/FlTu1ohHiOuVY0ixAG84XUNzzI43w8q
 3eRYvHUZ/PegdAwfd3B9OSsPhQseswmFABFNsus56axCppo9uCvGlJvHcNu65LGDMNFVHv
 iWs8Vw7b2jeGwdJmWBmW23we3q1TaRQFkbxxw0JHDsWb4Z7fKHSWyj5NTYGeTQ==
Date: Wed, 4 Mar 2026 16:00:42 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] drm/panel: himax-hx83102: Add support for Holitech
 HTF065H045
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-4-val@packett.cool>
 <bd2bb9c1-70e2-4914-afe2-c172501c25bc@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <bd2bb9c1-70e2-4914-afe2-c172501c25bc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Queue-Id: 65D45206C55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Action: no action


On 3/4/26 1:26 PM, Neil Armstrong wrote:
> On 2/17/26 08:00, Val Packett wrote:
>> This 720x1600 panel is found in several Motorola/Lenovo smartphones like
>> the Moto G9 Play (guamp). The initialization sequence is based on the
>> datasheet. Add it to the existing HX83102 panel driver.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 86 +++++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c 
>> b/drivers/gpu/drm/panel/panel-himax-hx83102.c
>> index 1d3bb5dca559..34e0e956db48 100644
>> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
>> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
>> @@ -701,6 +701,67 @@ static int 
>> starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
>>       return dsi_ctx.accum_err;
>>   }
>>   +static int holitech_htf065h045_init(struct hx83102 *ctx)
>> +{
>> +    struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>> +
>> +    msleep(50);
>> +
>> +    hx83102_enable_extended_cmds(&dsi_ctx, true);

BTW I have noticed since that the enable-extended "password" command in 
the doc mentions the model of the IC: {83, 10, 2D} for 83102D, not {83, 
10, 21, 55, 00}.

Works fine either way, can't say I'm really noticing any visible changes 
from the init sequence, but I'll adjust it to be accurate for v2, can I 
keep the R-b?

Thanks,
~val

