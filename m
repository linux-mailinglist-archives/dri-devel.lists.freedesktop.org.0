Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9E87960F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 15:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDAE112E65;
	Tue, 12 Mar 2024 14:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Uy8D8rAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921E5112E65
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710253597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qscJDfRCQcCfV2ZaWpNKEX1/zPnts270hoXgjIYZr90=;
 b=Uy8D8rAYOUxxxlBOsivsZ03YEWxZl8La5py7pfKy7Xt9qfhVe8v8+aUK4W7SPHnIKMTRza
 ldLHaWX7vF4SmcYKl+3ANObThonfoPOYkgflsV9ogGycjz4hGsHJ6d0nrjKdHvJiip6XtY
 nHAgL5dprpGmfREUwjVZWsUAsQCCpNM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-mc2NKznsOgKZ9P_u2bjqng-1; Tue, 12 Mar 2024 10:26:36 -0400
X-MC-Unique: mc2NKznsOgKZ9P_u2bjqng-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-412edc9d70aso33582095e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 07:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710253595; x=1710858395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qscJDfRCQcCfV2ZaWpNKEX1/zPnts270hoXgjIYZr90=;
 b=OySS0Pc5S4fSuChB8N5j8xQVznav7RReD8eIR/hu6UYMsuJBv4cqAmKqLI13KeODpO
 kw9GYpiI9I0+8pCK/a7iz1WII00KKvWloKX+h1kpRLrgFHxnqG2atUvBPAZFKOV/u+fX
 Q+uw5GttFly0H+6vOk/cq04qfsTbYhJrZxs9dfC/PXQ3yOgaZKUjIz0vLXOeOCyCZXyH
 663KO+s61d4FKWgZiaoKoX2PJZO1xf0ON9FvGoOr9Tv6DpTCNJHhEvFNj8zjwmNbi6T8
 rNx2/QLFMO72+flPvCRP39pHBd7DnC/64t3bLrkAgKVlyApaeyeMHlGeInHPdI0GXaHU
 hMmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNd0qR8KDUPen8YkZ78vLgMCfe+WRBpkl5u0u6DyDrZ5E8qtmbp/JgcZCiYwyAFcNPSPdo93/NRKDCgHYqef7+sjiCtH6CiD0xI4nanZDD
X-Gm-Message-State: AOJu0Yy5/COoB3hJvP8+ICq+e478GI5y28HB+CEA/K+sDdGf4bB/ZDdz
 khP6fdAdidUpMmXghj4Bv26QShc7uykgwmVhiLRLZ0LRjZRfcQkAy7FFVEr1BE0Hg6HwoYBqglC
 uQIKKJTmOleP8EOq5Y1U2xzxM2YIXlek8abbeYBGyDmprQnX66hFD9/50RAFx2DZVxoRyuXNKBQ
 ==
X-Received: by 2002:a05:600c:5253:b0:412:ee24:5711 with SMTP id
 fc19-20020a05600c525300b00412ee245711mr1598072wmb.16.1710253594811; 
 Tue, 12 Mar 2024 07:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY8NhEfj4JM9F3wL6fABF5cUqU5KXWfFmZOATf3DS373UOh6nuNZG6uT0Qwe5UlTFCNqPs7g==
X-Received: by 2002:a05:600c:5253:b0:412:ee24:5711 with SMTP id
 fc19-20020a05600c525300b00412ee245711mr1598058wmb.16.1710253594470; 
 Tue, 12 Mar 2024 07:26:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 fc20-20020a05600c525400b00412ae4b45b3sm18797103wmb.30.2024.03.12.07.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 07:26:34 -0700 (PDT)
Message-ID: <d63bcfdc-53ab-4791-b13e-1f3f1cc8430c@redhat.com>
Date: Tue, 12 Mar 2024 15:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v9,3/9] drm/panic: Add a drm panic handler
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-4-jfalempe@redhat.com>
 <43a752f1-7ad5-49e0-b64b-66fdebbaa1ab@linux.dev>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <43a752f1-7ad5-49e0-b64b-66fdebbaa1ab@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 12/03/2024 14:18, Sui Jingfeng wrote:
> Hi,
> 
> 
[...]
> 
> 
> While applying you patch, there is new blank line at EOF reported, see 
> below.
> This is not an issue, but I want to report this to you.
> 
Hi,

Thanks, I will remove it for the next version.

-- 

Jocelyn

> 
> git am ../drm-panic-Add-a-drm-panic-handler.mbox
> Applying: drm/panic: Add drm panic locking
> Applying: drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
> Applying: drm/panic: Add a drm panic handler
> .git/rebase-apply/patch:439: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
> Applying: drm/panic: Add debugfs entry to test without triggering panic.
> Applying: drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
> Applying: drm/simpledrm: Add drm_panic support
> Applying: drm/mgag200: Add drm_panic support
> Applying: drm/imx: Add drm_panic support
> Applying: drm/ast: Add drm_panic support
> 

