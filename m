Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBwpGx/cimkOOgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:19:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE9117D6D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537EB10E4E5;
	Tue, 10 Feb 2026 07:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cORE1bB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7510F10E4E5;
 Tue, 10 Feb 2026 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770707995;
 bh=mXytY2lL2wi8cjZeNB2IcAirtUMY2l1nJ77qqr3eRgI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cORE1bB6JiXPP7MxYMEIB9mnMgtmqwgQWX81FlF2vw5eQto+1TUUuWBeugjetaSV8
 Hj+Ua2UaDoaOn3wzQBLNmooz3DV7UbKMkaVOSRxOlRZWasCebnpSw3TCi3wavrMIPR
 VAF1c/3QFj1yh3vT9Abs/Xzwp/B9+EPUKy3EkSI0xnN/DW0r3RvRro0opIMTKzU4E4
 uhPC1u5cw0mgJG1qxpa3eSkS6XE0xImmDJtUcFxDzPlTvUnhr6AmuPM35XvHS2uN1u
 0lUvIGnc7IC+qf+frLWojZ/ioO6Fx2k2K1yWxtkXE4ChKnpDTrOx/y6p8Yjiev5gZL
 PDXhRtW/OBwxg==
Received: from [192.168.50.190] (unknown [171.76.81.211])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 36D1717E13A6;
 Tue, 10 Feb 2026 08:19:49 +0100 (CET)
Message-ID: <5ed6508c-78ab-4606-b503-9bc54f5cdea9@collabora.com>
Date: Tue, 10 Feb 2026 12:49:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] drm/ci: uprev IGT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-7-vignesh.raman@collabora.com>
 <zi7frtnecrzyei4fl4nmwmth3icnsyycxxobbrcwovbqfsfq4z@eh25dyfrjkqz>
 <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
 <5vxrhiilcsaull2airasmc3pjqazvswrtojozz264i5vk3m6zl@pgkdwq46p4ho>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <5vxrhiilcsaull2airasmc3pjqazvswrtojozz264i5vk3m6zl@pgkdwq46p4ho>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: F0DE9117D6D
X-Rspamd-Action: no action

Hi Dmitry,

On 27/01/26 19:55, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 06:26:11PM +0530, Vignesh Raman wrote:
>> Hi Dmitry,
>>
>> On 27/01/26 18:01, Dmitry Baryshkov wrote:
>>> On Tue, Jan 27, 2026 at 04:14:01PM +0530, Vignesh Raman wrote:
>>>> Recent IGT [1] seems to be broken on MSM hardware, with many tests
>>>> failing due to the old_primary->index != 0 assertion. Uprev IGT to
>>>> the last known good revision where the tests pass, and update the
>>>> expectation files accordingly.
>>>>
>>>> [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a909ab05
>>>>
>>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>> It is not clear, which parts here are due to Mesa uprev (yes, there are
>>> some of those) and which are due to the IGT uprev. Please split into two
>>> commits and make sure that Mesa-uprev passes more or less clearly.
>>
>> The mesa uprev and the IGT uprev are already split into two separate
>> commits. The IGT uprev only updates the IGT version in gitlab-ci.yml and
>> xfails.
> 
> I think I was not clear enough: Mesa uprev also causes some of the
> xfails. Those needs to be a part of the Mesa uprev commit.

I have created v2 where the mesa uprev commit also includes the updated 
xfails. I will send IGT uprev as a separate commit/series.

https://lore.kernel.org/dri-devel/20260210071138.2256773-1-vignesh.raman@collabora.com/T/#t

Regards,
Vignesh

> 
> 

