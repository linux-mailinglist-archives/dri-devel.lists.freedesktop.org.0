Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0024EA3A5F8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 19:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A6210E73D;
	Tue, 18 Feb 2025 18:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="pyvU0RFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D569710E73D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 18:45:33 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38f22fe889aso4650289f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1739904332; x=1740509132;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wqOeSb5kQECJzK8E/twQM0OBiDvl4tXTTz7+by0M2g8=;
 b=pyvU0RFeO1CRfY4dsh4PdZ034np0rzX+rkVehMm9Gd6fIKY7iIow1JZElervh7VApR
 wK61ly9fjyCTTFdfgkPmOfgwvfgJWPobkAZ9NjGr19LfxfcvA4PkUvarnBH+r1N/J5He
 GAYZgx/8qyIfoVGzLSyFWLZLrPF16tGLtpmW0AHNbS4zqEVGF8ldIPCXh7WI/NVtQ4x5
 mOFXzulY00HNgcK7UBWt3bSZ+eKdaqO626MBJDYP46orJ8+0g2MjIZNjJ/pw1Y/dLQVC
 E51WvemLMDiRMHuqZHTiHr+ScTYnpE5z5Y4TBMhBNdM2Qu20BVkzvD63dZ/Ne4NWHoAJ
 NVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739904332; x=1740509132;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wqOeSb5kQECJzK8E/twQM0OBiDvl4tXTTz7+by0M2g8=;
 b=gHyNwt7aMbEhlsE0HvveNLnzCcMAAnG3TGIPFBepPbrERO6a2G/QjoY328YuQMICZ5
 QIHiaxchwqePSY29jVbZlkiqoK1YiycV9I7LAeC0u5emVX8RIeJQtOZwfNPZsVt4xzob
 bPnOi8JwuCkqtIYfHZac1quVLS9qGss1IMBQD/tPVPylfkZ9/Td/8FrpjvUI3w9pm6r8
 WugKsZBrQJjW5MytsJsVw1fkSv/tsimU67fCDyUHbcdHgozSIuug/9XkWJ32nnuqDNjc
 F57G7cThGCV0QR9gVdqTfRWVoOZZo69QTLeAwn4Ia/g2rr5tojeGz8Gy1xf2SiYtaHiE
 HK2A==
X-Gm-Message-State: AOJu0YwHH8Bch7LEOZIGrJhAhVC0UFLNLVke5t0rX4tF3hSYoTSa0g7H
 j0ZdUaTjEMxy0wEFFjVT23zMtlZV8+Pm575jvAHergUY/FpJAEA9kMvsBg6j1Q4=
X-Gm-Gg: ASbGnctRAOGMBpCC6sD+Yfqgk9dc+n5ctl38RBUfp5bGO6wK1drgfAmZkWKm9Krp/c7
 3rWhmGHnAsZfxgosdQYNj6Nn3TZu0uDQCcIAEZ1Om4n6y+LDkMbw5lp7i7vlajyyc50p041wyo7
 Ec+V2XwlnC2cplacUSzdpgShWTKZOgMuHF6Ie0WZZ7cOAdF/03zkXHKERU5By0I9blr1O8xVLqB
 /APGxfKlqKu+0BJ3mQtFZwT6TJtQFAi5Pkw/QBR6B+bqHXMpI1NY+OMY+mVpJSeTGxgoXn+1Ibu
 p/5m/sfL0KZPLLisO8JNnHkEdlx6STE=
X-Google-Smtp-Source: AGHT+IEVgMArTWms+d6frp0xDz+CjbNc3BZ3sXgOIC+WarxymIETKb6cDWsvjOEtlW+5Ur4I5Kt1/w==
X-Received: by 2002:a05:6000:1a8e:b0:38e:d026:820 with SMTP id
 ffacd0b85a97d-38f33f28f6emr18410043f8f.16.1739904332109; 
 Tue, 18 Feb 2025 10:45:32 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43987d1865asm59555595e9.3.2025.02.18.10.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 10:45:30 -0800 (PST)
Message-ID: <0bda0535-3c83-46ef-b40f-8b2be1ead6cc@ursulin.net>
Date: Tue, 18 Feb 2025 18:45:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/xe_drm_client: Add per drm client reset stats
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, joonas.lahtinen@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
 <20250214203757.27895-5-jonathan.cavitt@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250214203757.27895-5-jonathan.cavitt@intel.com>
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


On 14/02/2025 20:37, Jonathan Cavitt wrote:
> Add a counter to xe_drm_client that tracks the number of times the
> engine has been reset since the drm client was created.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
>   drivers/gpu/drm/xe/xe_drm_client.h | 2 ++
>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index f15560d0b6ff..ecd2ce99fd19 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -492,6 +492,8 @@ static void show_blames(struct drm_printer *p, struct drm_file *file)
>   
>   	client = xef->client;
>   
> +	drm_printf(p, "drm-client-reset-count:%u\n",
> +		   atomic_read(&client->reset_count));

When drm- prefix is used keys have to be agreed in drm-usage-stats.rst. 
Therefore I suggest exploring across different drivers and seeing if 
anyone else would be interested. Maybe people who worked on the DRM 
common wedged event for example.

Or in cases when new stats are not universally useful drivers can prefix 
with xe-. We had this discussion recently with some panthor internal 
memory stats.

Regards,

Tvrtko

>   	drm_printf(p, "\n");
>   	drm_printf(p, "- Exec queue ban list -\n");
>   	spin_lock(&client->blame_lock);
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index d21fd0b90742..c35de675ccfa 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -53,6 +53,8 @@ struct xe_drm_client {
>   	 * Protected by @blame_lock;
>   	 */
>   	struct list_head blame_list;
> +	/** @reset_count: number of times this drm client has seen an engine reset */
> +	atomic_t reset_count;
>   #endif
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d9da5c89429e..8810abc8f04a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1988,7 +1988,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   		return -EPROTO;
>   
>   	hwe = q->hwe;
> -
> +#ifdef CONFIG_PROC_FS
> +	atomic_inc(&q->xef->client->reset_count);
> +#endif
>   	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>   		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>   

