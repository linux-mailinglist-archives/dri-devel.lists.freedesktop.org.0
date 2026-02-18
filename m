Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHQbH2fQlWkaVAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:44:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3671571D1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8850810E2F1;
	Wed, 18 Feb 2026 14:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="qIXkfWZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61FF10E2F1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1771425888; x=1772030688; i=natalie.vock@gmx.de;
 bh=7T+TUkUkjp0S+bcY51v4+b+idC3PPS1pkWpyi4tgppw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qIXkfWZ+IMsv5mex0TSbMUyiP/6yiZs3EuXaWQu0WnAovs20+DeTj/a29u5KVn03
 NWLo74un92bc7yO02Z9ItSgxVvC16pVeJRyWJ6SUDGeZ8bVOa5fhWF3XaNMI0i6M8
 AIrulOPlUJ1hhAqPM8UYEeF55uNfAg2ZL/C+CukCuzJg5vRdK/bldTCc+0WNU4DjI
 32s2Vv7y9wlVJVC4dHNx2F8Vg0sFLjfAoo9m/7LYmDVijCwzXd1LX11c7k0rH4v67
 CYViYjKv/7uoej6tsPrS6VWUxEd6F3rECdYOfwSD+NKh7Cuax8wbWYRhxBmynoqAe
 Z21JwljTPHdPwviI8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.3] ([88.133.252.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1vEQVC1hva-00kOQz; Wed, 18
 Feb 2026 15:44:48 +0100
Message-ID: <fc716992-8fb5-4b45-a4d0-4c81bc65cc82@gmx.de>
Date: Wed, 18 Feb 2026 15:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: increase queue timeout to 3 seconds
To: Mike Lothian <mike@fireburn.co.uk>, dri-devel@lists.freedesktop.org
References: <20260218134452.112147-1-mike@fireburn.co.uk>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <20260218134452.112147-1-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8HOUltN9xMiILqZ74yYhbWuKMW+zogZAwTIH9tjTNZPLHvz6K/d
 HgUWZV5hbTyMTjJDOX42JFRHcmilfJni83x6NVOTFBBoOFGUyRRLTffVzHkZzmAYsKDT0w+
 WUkYnSSnQwdfQCP9gYec7Qm7cWEyu2L3iWzggRQ4MicEEQd5vEnPaeNYE6le0AE8DLfcm9u
 dhl0qb7aTVn3tQ880fSlQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nJQaQfEk6EE=;uq/6MyBKGyJk95RM4p7xwlc/h8N
 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
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mike@fireburn.co.uk,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,fireburn.co.uk:email]
X-Rspamd-Queue-Id: DE3671571D1
X-Rspamd-Action: no action

Hi,

On 2/18/26 14:44, Mike Lothian wrote:
> This fixes a timeout whilst running GravityMark v1.89 Fullscreen VK RT

I'd argue this doesn't "fix" anything, it papers over the app doing a=20
really long-running submission.

Submissions that run this extremely long are obviously prone to timing=20
out - that's a feature, not a bug. It's likely that this adjustment=20
fixes things for your machine only, and slower GPUs will still hit a=20
timeout. IMHO userspace (that is, Vulkan applications) should be changed=
=20
to not submit this much work at once, instead.

I'd also argue that increasing the timeout again hurts responsiveness in=
=20
GPU hang scenarios - you kind of want to get the user back to a=20
functioning session as quickly as possible. The current timeout of 2=20
seconds has some prior art to it (Windows's TDR timeout is exactly the=20
same), so I don't see much justification in changing anything here.

Thanks,
Natalie

>=20
> Fixes: 1bea57ea7544 ("drm/amdgpu: reduce queue timeout to 2 seconds v2")
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_device.c
> index c7f44422939f..00f495b8c4f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4204,9 +4204,9 @@ static int amdgpu_device_get_job_timeout_settings(=
struct amdgpu_device *adev)
>   	long timeout;
>   	int ret =3D 0;
>  =20
> -	/* By default timeout for all queues is 2 sec */
> +	/* By default timeout for all queues is 3 sec */
>   	adev->gfx_timeout =3D adev->compute_timeout =3D adev->sdma_timeout =
=3D
> -		adev->video_timeout =3D msecs_to_jiffies(2000);
> +		adev->video_timeout =3D msecs_to_jiffies(3000);
>  =20
>   	if (!strnlen(input, AMDGPU_MAX_TIMEOUT_PARAM_LENGTH))
>   		return 0;

