Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58EBF97ED
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 02:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB1D10E679;
	Wed, 22 Oct 2025 00:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fRLF9Rwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com
 [209.85.160.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2E010E679
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 00:43:35 +0000 (UTC)
Received: by mail-qt1-f227.google.com with SMTP id
 d75a77b69052e-4e89ac45e61so5213051cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 17:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761093814; x=1761698614;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHwbDXmMKzNdw9ZPIlNMeJUYP0GWMQ1Vm0hgbmyp2rc=;
 b=SO3m5hSVwLilnOcvLfMApKI+gzC6uV76lxnFDnqd9D8lpzRmcdfzyJlTwjRAHxLwEv
 oEIBA1PbtP8TNC0+enq/ZSi+qkQCt1KAQlMk9s68JtRFXALwAT2hOMMSWtRWpKzCpg3s
 H2GLb8aFLdMf3X17cYw4R5czrAyDx6yFHfj5U+YeKZbryWFZJcZH5AcS1yw08nvtRRPS
 LOq3p+0KaSE9eq/VApoJ9i0GzEsAwu4k0MtR3hDQzSiGVllSQXLBnXiSqChsc01juUFl
 8pKJJ5C29njna1qgfKrZ+VmF6Yt2NZAahfwvdCSPfpAfSboc18ZoGhB2aaVg/XJ9q/dg
 N7vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURQvLbqgziAhfiqSdaQ3GgaRAiPVOMYa8MUZ8TMqPlzHNcpSV+Iqs+NOsALQhmcz4tfIYYovoUnnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE3H5UkwQM4v/Qjiu7h3F1AgtbjpEg1wIB+jLwaf0iJGIUYBtW
 PiRmzvPsWecGuzipMvOQAjiNysiNHsZh3V011UqFn4iU9OstYKOhCxDv8ALDMBU2yVRtL2QyIcl
 /Zs5wyQZ0yvC1mIiO5ljlAdK5dJ3fJUYC4LjlOBzYZ5t1nNJ9NpLuE7cq+/SguM4tkUrl9sWgG9
 PTILcBSuQyPD1y/KIfFCpy2RJgLfDn85dTMFhY04tRHLziE2Qj2DHKgyfK5FNf9Rzb8MjzDMhao
 0hFZQA4PwEeYX8c4n/cm7bInSV+
X-Gm-Gg: ASbGncu4EfeLBA2WTwriq9n9JG0+rnp1ri+khsPwnAlUZRP9S/V1rU39x6rx6WdbwQ6
 Zm4IF75WcwIJ4DE45DPCYMbFHq/mpP7/9Zu2C1bAWkFSxL6A7iYpiGBEee0eOra2TXNUFY9CFGc
 YKh+rL9yTRRaqlfTCkl/IJt61gbatO3x4lkKUn59AHqjIN/gLXXx4Roebc6O9EiU+Xm+Smh/A06
 szE/SVrwOKvB6fwBxBkOaQG/aOz9r4VOEBOQpe6L2j8rnJGi2ZGJHU9FUYbauFz+YKLnAp3QmlQ
 1MF4CYYx98V6yUpEROKwDtmvA1c/A5dTRRacJFJrTK8xYbdjMcv1RHmFbC9mvV3kDHaeEeEUiaV
 TVkj0UmwKMDzRap9UqXtU/TeDLVi7CmsUgfWtSzIreRyOIINPu3zi3Fj3Lt8lajbN9BMfudn9/i
 +bG+BXsjN4gFLRNwvfvW3IkNOfMqpjnA2Y3Q4FP06qZg==
X-Google-Smtp-Source: AGHT+IHBSwlxfSA0kX2uEPxQg38Og5QCLMJdp41kBmzZoJ7Ff/PElI8Bn6N7KJC59wmyXjbuTvSngrgffdeW
X-Received: by 2002:ac8:5852:0:b0:4e8:a82b:af55 with SMTP id
 d75a77b69052e-4e8a82bb19dmr179362771cf.65.1761093814533; 
 Tue, 21 Oct 2025 17:43:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-891cc7df13bsm135618285a.2.2025.10.21.17.43.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Oct 2025 17:43:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-26e4fcc744dso40502305ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 17:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761093813; x=1761698613;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FHwbDXmMKzNdw9ZPIlNMeJUYP0GWMQ1Vm0hgbmyp2rc=;
 b=fRLF9RwpTcJEJHZesPxNpLVsgtKePQCSkq7HzGU+HGLsHIxd4UHyMqjSTasglsH+T7
 A74GmnAsB15dfz0X9nclFZlvUeGKm/vjyso6iODjSG0Ydm1cx+ozcyvL4r6tseOzdmJt
 f+qovFboL6yTiVvb57xyNE64wLCZKVCoPnYiM=
X-Forwarded-Encrypted: i=1;
 AJvYcCXorFnPgtD0+moaye632TIHpmMZ0/2U7QpcAqebfBB/x6dCI2/EE5DldMGUI5rQiA7ty9nvT780Us4=@lists.freedesktop.org
X-Received: by 2002:a17:902:ecc6:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-290c9cf34f1mr245359225ad.27.1761093813189; 
 Tue, 21 Oct 2025 17:43:33 -0700 (PDT)
X-Received: by 2002:a17:902:ecc6:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-290c9cf34f1mr245359045ad.27.1761093812781; 
 Tue, 21 Oct 2025 17:43:32 -0700 (PDT)
Received: from [10.211.247.102] ([192.19.50.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d5612sm120736235ad.65.2025.10.21.17.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 17:43:32 -0700 (PDT)
Message-ID: <89031e1d-fc65-4b30-850b-804136c0bb59@broadcom.com>
Date: Tue, 21 Oct 2025 17:47:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Validate command header size against
 SVGA_CMD_MAX_DATASIZE
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 security@redhat.com, Rohit Keshri <rkeshri@redhat.com>
References: <20251021190128.13014-1-ian.forbes@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20251021190128.13014-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/21/25 12:01 PM, Ian Forbes wrote:
> This data originates from userspace and is used in buffer offset
> calculations which could potentially overflow causing an out-of-bounds
> access.
> 
> Fixes: 8ce75f8ab904 ("drm/vmwgfx: Update device includes for DX device functionality")
> Reported-by: Rohit Keshri <rkeshri@redhat.com>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index b00818aaf94b..41a77dce99a2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3668,6 +3668,11 @@ static int vmw_cmd_check(struct vmw_private *dev_priv,
>  
>  
>  	cmd_id = header->id;
> +	if (header->size > SVGA_CMD_MAX_DATASIZE) {
> +		VMW_DEBUG_USER("SVGA3D command: %d is too big.\n",
> +			       cmd_id + SVGA_3D_CMD_BASE);
> +		return -E2BIG;
> +	}
>  	*size = header->size + sizeof(SVGA3dCmdHeader);
>  
>  	cmd_id -= SVGA_3D_CMD_BASE;

Looks good.

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
