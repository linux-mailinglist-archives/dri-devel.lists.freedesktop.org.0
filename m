Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC792FFE3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 19:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2A210ED7D;
	Fri, 12 Jul 2024 17:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Yc4zCgtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732F010ED7D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720805940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sipNUbj7qIymRT+79qbVwcgrJBEdFVUgDof1TAUYRzU=;
 b=Yc4zCgtvzEiOD9JbqhuimwLozjknBWgDS1uUiY5uDaXB7a8RD8jNE6wz04XG5aovD7K7ks
 frTnONs+Qmks8WFWOwpFFzFrj/wy20d1J8XBJQltanomooVtk2BoZ50j6DD9/sLAZOSdFl
 1gE2Kpw2xgrXXhH2YtYThb8nsqn9Qls=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-w8-X0A8CMjeLsdaBmCkaaw-1; Fri, 12 Jul 2024 13:38:58 -0400
X-MC-Unique: w8-X0A8CMjeLsdaBmCkaaw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4265464ddc9so13134605e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 10:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720805937; x=1721410737;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sipNUbj7qIymRT+79qbVwcgrJBEdFVUgDof1TAUYRzU=;
 b=aesBdY9mT06ns5atqsdbdR3Frk0zcX1uKlZcI25eORWJpwU2BDPelvXFeYmLWnjpf1
 PIdxJXjCZa8+rDRekqPmOlOxp9yFI87NXTwFfkZx80RTkbadhvkeiN74R1KHer/KYKr8
 FCVkDJa0GVIsd9MWoAkBKJFh77qw9oDv4ZwP8IgVaNundkwtUf48XVXkY0ZhbGF1Djtn
 0grxJ1/+iV0uf6Or8AYjU3nZidmcQTSTcLsmeDp1um5qeHIKYF5Y0tMVXIHzas8zfJu+
 HbGZhyDGex+SxK905HP3hCsbu9ZHghEr8dPHoLuIV+9nI57JMWPW9cRIkUARSIXR/1ub
 uebg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW63NtE9ziGlKck/wNyCxuEnygD5Soi6nF10bOUcWgsKJIk94U2MxDfujCqT4S97b0zovDyGQhJOVLQ6NtpoFv59bQdXQeJVPMp0F6lIaSa
X-Gm-Message-State: AOJu0YzPRwwgM3QuEsk3TorVaIBoCZb2/BjyKR5HLpzogcv4iYvodSLf
 tlfqVT+gYHNpkQOR1NqybxmYcgc8af8R70JzgfAu0uZgg95yup5O+qsO8Ak6zCgGh7enRmDiA7s
 V8BGpU86qb0nZXKFVlYn2lJAJZGrXAsfQmeAbZnwPa4hlFXhft11W1HjYE4PJYXUqIw==
X-Received: by 2002:a05:600c:4613:b0:426:526f:4a1f with SMTP id
 5b1f17b1804b1-4279daf2585mr30621105e9.16.1720805937773; 
 Fri, 12 Jul 2024 10:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwxyB3tY2Z4sxPaWpQBWCpnq//rThRXFxa0CLe10n5BDi1DzzpSy6RoH9nNF6GDL7AeQz3Ow==
X-Received: by 2002:a05:600c:4613:b0:426:526f:4a1f with SMTP id
 5b1f17b1804b1-4279daf2585mr30620885e9.16.1720805937464; 
 Fri, 12 Jul 2024 10:38:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde890f6sm10676030f8f.53.2024.07.12.10.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 10:38:56 -0700 (PDT)
Message-ID: <6c5ba940-8e18-4b4f-9e30-5608b228ec8b@redhat.com>
Date: Fri, 12 Jul 2024 19:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: Improve variable names in
 nouveau_sched_init()
To: Philipp Stanner <pstanner@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240712062618.8057-1-pstanner@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240712062618.8057-1-pstanner@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 7/12/24 8:26 AM, Philipp Stanner wrote:
> nouveau_sched_init() uses the function drm_sched_init(). The latter
> function has parameters called "hang_limit" and "timeout" in its API
> documentation.
> 
> nouveau_sched_init(), however, defines a variable called
> "job_hang_limit" which is passed to drm_sched_init()'s "timeout"
> parameter. The actual "hang_limit" parameter is directly set to 0.
> 
> Rename "job_hang_limit" to "timeout".
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Applied to drm-misc-next, thanks!

> ---
> Changes in v2:
> - Remove variable "hang_limit". (Danilo)
> ---
>   drivers/gpu/drm/nouveau/nouveau_sched.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 32fa2e273965..ba4139288a6d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -404,7 +404,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>   {
>   	struct drm_gpu_scheduler *drm_sched = &sched->base;
>   	struct drm_sched_entity *entity = &sched->entity;
> -	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> +	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
>   	int ret;
>   
>   	if (!wq) {
> @@ -418,7 +418,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>   
>   	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
>   			     NOUVEAU_SCHED_PRIORITY_COUNT,
> -			     credit_limit, 0, job_hang_limit,
> +			     credit_limit, 0, timeout,
>   			     NULL, NULL, "nouveau_sched", drm->dev->dev);
>   	if (ret)
>   		goto fail_wq;

