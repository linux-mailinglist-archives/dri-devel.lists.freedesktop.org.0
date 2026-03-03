Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBADCs2vp2nAjAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 05:06:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B561FA9BC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 05:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D091910E948;
	Wed,  4 Mar 2026 04:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Z3G1ig/R";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Fwd7Nv6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3B210E948
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 04:06:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fQfHT6mgGz9tX6;
 Wed,  4 Mar 2026 05:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772597190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8fdlXVX26MwcNio8HFgqq2WGnU2ojoh4wnFFfsJyso=;
 b=Z3G1ig/R9gq7km2xC87D/XsDXEFqPX8BH3O3a/2kOTAyYwZNsUcCrOK534XnrYmoPjy1TQ
 iYFQgtzY2TLc3NpmWqeVkHad6PNfkTj/JTrw5MGwc28VBqC2clRFBoXL7B4aYaTdSuqtUQ
 62GB1DSRvKD2oEJ7qn0f/akv9qAxNF07zxPyqssJRx/qJUP64qbkiGUYOvSWUgqxYgjTKA
 NZOhu2Gp5PU6lneDqi2twKfMBsKrfTMbC/J+Hf1U8sMnXNcKO3vGKUVi5NjeydGcW3eY0v
 wG4Vhsq5597lg3boqRWmlBWZe+eatjFpAeAN0FKRfmJJMN1WY4MI/bJNsB8fZg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Fwd7Nv6U;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <e6c16dda-ef03-496d-aae9-1b872d362fb4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772597188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8fdlXVX26MwcNio8HFgqq2WGnU2ojoh4wnFFfsJyso=;
 b=Fwd7Nv6UUoUecnJQ8i6xYfceIVnQ6HwlswWSd+7xg1F6aJI8bRl/KGZCgd1I7B72r2E9Z4
 zMIJOGdCVqTcP4VjdEGmzQ4l6CB1yTbxoFCf+kSTtkgJtx97BWe7HSxHncmKY8gcEcCYDi
 Lgpv0Bn0grwoAmA7PYghH0rIxv+jHN8jFkm0p0L75wsSpum4n0ELdGeQlNBoup535i5rG2
 1muVlhms+w7fjofkOLwfiTljjEnzkMPgXCcX6hfglY3uUL7VGH6DNWIe5Sj2oANGwAFdTx
 79TBVUiKIPve16qs7MV0e0lbmwBmFCwmUzgbcQABhpyXYqEcws902HSNdzujJg==
Date: Tue, 3 Mar 2026 21:57:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
To: Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <20260303-uppish-finicky-mustang-cd135f@houat>
 <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
 <20260303-delectable-just-clam-d25e08@houat>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260303-delectable-just-clam-d25e08@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: eiuqb5g46pfy8jydnkd4w1sqf1tzfnb4
X-MBO-RS-ID: 54b7360457c09a17b8c
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
X-Rspamd-Queue-Id: 88B561FA9BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:geert@linux-m68k.org,m:marek.vasut+renesas@mailbox.org,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,glider.be:email]
X-Rspamd-Action: no action

On 3/3/26 9:39 AM, Maxime Ripard wrote:
> On Tue, Mar 03, 2026 at 09:14:53AM +0100, Geert Uytterhoeven wrote:
>> Hi Maxime,
>>
>> On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
>>> On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
>>>> Update drm_of_get_data_lanes_count_ep() return value documentation
>>>> to match the drm_of_get_data_lanes_count() return value documentation.
>>>> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
>>>> drm_of_get_data_lanes_count() and therefore returns the same error
>>>> codes.
>>>>
>>>> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
>>>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>>>> --- a/drivers/gpu/drm/drm_of.c
>>>> +++ b/drivers/gpu/drm/drm_of.c
>>>> @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>>>>    *
>>>>    * Return:
>>>>    * * min..max - positive integer count of "data-lanes" elements
>>>> - * * -EINVAL - the "data-mapping" property is unsupported
>>>> - * * -ENODEV - the "data-mapping" property is missing
>>>> + * * -ve - the "data-lanes" property is missing or invalid
>>>
>>> I have no idea what "ve" means in that context. We should rephrase or
>>> pick something more obvious.
>>
>> "-ve" = negative, "+ve" = positive.
> 
> Thanks!
> 
> My point still stands though.
What would you recommend ?

Note that the documentation for this function is aligned with 
documentation for drm_of_get_data_lanes_count() by this fix, and 
drm_of_get_data_lanes_count() also uses -ve to denote negative error value.
