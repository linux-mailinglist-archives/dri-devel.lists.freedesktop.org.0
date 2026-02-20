Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KxAVLHLzl2l0+gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 06:38:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0A164C4D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 06:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1725710E1A7;
	Fri, 20 Feb 2026 05:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mvel37h3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69C310E1A7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 05:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771565932;
 bh=MgkXVoyfifdow5dWdFn7Cmv3BIbV02PItic8VTIrQRc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mvel37h3e1h2Z9PCx2xLzs5t7XkpzO++DRs6r8eISiz3VKaO+UeBMAt1srv+IpR+4
 iJis5AgiuJI0jzacLOwcZnd0ev+8TRxZ1aMoofA0reNznVLn01McO8tMJuqsSbmMsT
 3cvivr4T6Gvu4HHJ02H78LQE2PRkHN2Sv6bdiQcnTOUJRN8wwqxv5sMTDCjtgBbZqO
 lFLsf59t5jsyVcvfJeG+MVBHcidB+AokU0a0dL5/zkR0IU1C53qgMtQHVFzXhDVVtv
 pksw7MFy0BfNe0v6/krjxkfAhr3MghUkx5iCceD7pzodwhiihZkBt/nuLUVcIRhPZ1
 ttcjNXSUfWZXA==
Received: from [192.168.50.190] (unknown [171.76.81.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EB65F17E0D4D;
 Fri, 20 Feb 2026 06:38:48 +0100 (CET)
Message-ID: <b7f86ada-a74d-4fb2-83d2-5b4ef18e00c4@collabora.com>
Date: Fri, 20 Feb 2026 11:08:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: recommend forking drm/kernel rather than
 uploading a distinct copy
To: Eric Engestrom <eric@engestrom.ch>,
 Helen Koike <helen.fornazier@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260219135645.261192-1-eric@engestrom.ch>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20260219135645.261192-1-eric@engestrom.ch>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eric@engestrom.ch,m:helen.fornazier@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vignesh.raman@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[engestrom.ch,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 23F0A164C4D
X-Rspamd-Action: no action

Hi Eric,

On 19/02/26 19:26, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>
> ---
>   Documentation/gpu/automated_testing.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git ./Documentation/gpu/automated_testing.rst ./Documentation/gpu/automated_testing.rst
> index 62aa3ede02a5df3f590b..8a7328aef10ef39ee329 100644
> --- ./Documentation/gpu/automated_testing.rst
> +++ ./Documentation/gpu/automated_testing.rst
> @@ -99,7 +99,8 @@ How to enable automated testing on your tree
>   ============================================
>   
>   1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one
> -yet
> +yet, by forking https://gitlab.freedesktop.org/drm/kernel (this allows GitLab
> +to internally track that these are the same git objects).

Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh

>   
>   2. In your kernel repo's configuration (eg.
>   https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the

