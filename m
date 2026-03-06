Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CtwCJRaq2mmcQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 23:52:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7346C228670
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 23:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890E210E331;
	Fri,  6 Mar 2026 22:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="L64e9Bx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com
 [209.85.216.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BABC10EDD0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 22:51:59 +0000 (UTC)
Received: by mail-pj1-f99.google.com with SMTP id
 98e67ed59e1d1-359832fc558so4998449a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 14:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772837519; x=1773442319;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0yJ/SLdtICJoGQjACZ8bFZzcca1tlE50SV5hXmqtVw=;
 b=UukqL2ssqJ2jRuFo4WGQCjvx1pEJkBnM8Gd6NVJwuqJgIkuD9kcK+rfjEcSvxBc443
 RFkiVNiwB/DDQaqQlkJW/lZ2q8/YORZMB19G7B7r+ZKBmE0tfD7HnVDJBCM4INWQAoD1
 cCUN46aYJR5oRfCQOCyG8mC52cG5bJYirOFFe8hzFCmzhnN72Pi6uhy06uxEQpLB0cK8
 akqsI/2iwLmBZ5yA6s5s1LPL4Wnf7SOynnY5zCTT04E+C/GygXOT9x07uqka4+8YYjqF
 bMupSchFyXh4laCGBN5ATnJVI/1TOlpWZSqOSTkFwBCF/wm7CKPmVKuDcfuppeDgUBlw
 bKIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKtX6dOWJ8/YyMOBanA/2zlYv80ycwQB5NYQvx3OojY6veUWpQLYIeamfHSxH42aP1Ae8V91VZFhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQhEi2xMZkx9enb+OLC+HTNtnXf5tZCUrLdMrxRawl1VACmIuP
 6PKSe9lmcK1xJ7+oSc09EaHt++Vy5Hnbu3xul4huKkGApnar4TNeyurUCCtyzTELwH8z08CPY48
 bA1TSMfRGgYHVcvY9CAXtOjJZzEYIcXLvUmkScQvXxM7YlEOK0ym8HHihoUKcl/DSikM7Q5CIWc
 DsrDVBrbfkxB29PMaPXkOTOJFlrwQUWMrJdW5Qy/4QzQ2EMZzyQmegDP/cVuU9GpL7ochJeNFEY
 kLR7pcCoT5k5yet2dI+csc86geUFRI=
X-Gm-Gg: ATEYQzzPi3wXhNFMJf0r7bQWsxCC7wMmXiAr7GwarLLdxT1Zcs+5XrdUl9346orOV0x
 Fj7zcNg7ZH2IsdgoecpzI2FUf8/w+cv4ZFHpnK1beKvSAAhtEaNr+vlljRXmq6KRyCV0sYKpz+0
 dFtAAZns7O/XVjz56ldDcHun5Sd4rB/vAJVXwhsRuJBMF1KqooKHa4sHeLuDgogLx4nILZ9qXdQ
 nCQX6bnCG2Ei76p/KZM463vTq1bQGojt7hoCz4eF9FCf/Rm8Uaya9cJvq0CuHgTv7Y7hZ4IyXPv
 Bf2rlq0tP0HZplI6amjA2ZdoYatZI06FnRKhYNXDbI64CT7Hh/1kKU9zuaMIWovYnEyYAxKQmUC
 fuVY1H7f7vI83aS5lkUh+myG28oqexs620cBk+jD8WaPBUofFqjm0+dbq06B2EJRr1n4QW9WrhG
 /yLegIn+vvzOtas3NCWwKquiwQwWYmYtXfWfkx8ikztw+o+NwRm2EEM8IfadDXuzgS
X-Received: by 2002:a17:90b:52c7:b0:356:1db4:8fe5 with SMTP id
 98e67ed59e1d1-359be33f6d6mr3188449a91.29.1772837518853; 
 Fri, 06 Mar 2026 14:51:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-359c01342a7sm322250a91.5.2026.03.06.14.51.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2026 14:51:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c711251ac5so5273872085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 14:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1772837517; x=1773442317;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E0yJ/SLdtICJoGQjACZ8bFZzcca1tlE50SV5hXmqtVw=;
 b=L64e9Bx8E7WYLcVWAVe6xQe8E7N7Jl2fRAeciRtF2JmXaMsV77Q4LW88KD6rYzfuKW
 cIx7rieI9x7b/AQJ/4nqDoivAgE6b05aV7cRSviyUdt967Ips+3mTRQAiINdpY697lgs
 diGenKHu7HTGAF1eNrzddKQv5GIAG08tm+AhU=
X-Forwarded-Encrypted: i=1;
 AJvYcCVyCaxMMsEg6IZNeSqYVL7Y5DjqiKtjGy3x6tQM0lMTx0R4FayOeuVCeW1hsVCc0D5ESgPdA3X12fM=@lists.freedesktop.org
X-Received: by 2002:a05:620a:254e:b0:8c3:7f27:a65d with SMTP id
 af79cd13be357-8cd6d371593mr492968685a.28.1772837517465; 
 Fri, 06 Mar 2026 14:51:57 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c3:7f27:a65d with SMTP id
 af79cd13be357-8cd6d371593mr492966385a.28.1772837516829; 
 Fri, 06 Mar 2026 14:51:56 -0800 (PST)
Received: from [10.211.247.102] ([192.19.50.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a31431703sm20587536d6.12.2026.03.06.14.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 14:51:56 -0800 (PST)
Message-ID: <090c202e-6898-4083-83c2-73003abd39ab@broadcom.com>
Date: Fri, 6 Mar 2026 14:53:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Don't overwrite KMS surface dirty tracker
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
References: <20260302200330.66763-1-ian.forbes@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260302200330.66763-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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
X-Rspamd-Queue-Id: 7346C228670
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ian.forbes@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:zack.rusin@broadcom.com,m:mpenttil@redhat.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maaz.mombasawala@broadcom.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maaz.mombasawala@broadcom.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/2/26 12:03 PM, Ian Forbes wrote:
> We were overwriting the surface's dirty tracker here causing a memory leak.
> 
> Reported-by: Mika Penttilä <mpenttil@redhat.com>
> Closes: https://lore.kernel.org/dri-devel/8c53f3c6-c6de-46fe-a8ca-d98dd52b3abe@redhat.com/
> Fixes: 965544150d1c ("drm/vmwgfx: Refactor cursor handling")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 55730e29d3ae..e7bddf840a79 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -771,7 +771,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
>  		ret = vmw_bo_dirty_add(bo);
>  		if (!ret && surface && surface->res.func->dirty_alloc) {
>  			surface->res.coherent = true;
> -			ret = surface->res.func->dirty_alloc(&surface->res);
> +			if (surface->res.dirty == NULL)
> +				ret = surface->res.func->dirty_alloc(&surface->res);
>  		}
>  		ttm_bo_unreserve(&bo->tbo);
>  	}

LGTM.

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
