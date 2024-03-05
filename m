Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3798719D3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9B410F96E;
	Tue,  5 Mar 2024 09:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JqKsENGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2CD10E361
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709631949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlPaL+1qbcMigBEz3qx7ZtCPheah+YYYXpFOCWieYr8=;
 b=JqKsENGXo7dfmWIU4/xaDbg+EcRBodDO5fBJYFiBMANdsuBUPkdIgUiA4IlHaSJLqiMIHw
 1x7hrhziZXI6Wz9L27zgJHX2D9HFOj1Y+QdHd5/7t37UEeYPlovccB+FSWePjoU1YHpvqh
 UBIdUlZHRwKgQWSxpMPxhUM849ZoKLg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-duqE7kmSN9eO3gbCO0oe-w-1; Tue, 05 Mar 2024 04:45:47 -0500
X-MC-Unique: duqE7kmSN9eO3gbCO0oe-w-1
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-7da5136a758so4893672241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 01:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709631947; x=1710236747;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qlPaL+1qbcMigBEz3qx7ZtCPheah+YYYXpFOCWieYr8=;
 b=k65+/LMzhmpCa9wHn8YT0l55dOdrufy2HIogyn4NA40mN/L7HaYkVrDtS4lIQGtU9x
 j9ZUCH6Y6TmpM42fQht3rtlmQKJ4lkZfjuMWFWjGJUNdniuhhJ0/aEwOqbSfWMLtu/qR
 qN2uzVr/btXmGsGJgKNganzLa1AnOkL5YTjpb6lm1kXoBxchWfzBNM5vEJcL3y1h1omp
 sZ9Z5NXHA7tt+5VBBWhM10jeoWQFEjBly4ICv7phLBIAZ1Aaeam2JZSW8w3+y5tMzNnX
 jQr67hf/psotMxMA8qz5HungRiocjBgpUdvCCwBkreo7tQkq2Hbll7uPe0Igwpp9XSpw
 JB8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBtpd1EOJ00678ZNrkUMQ3AGSptrKbiwQ7epcnk3yFEuWH7Z4TdKRBcHfhFZJPTObqfXtb36v8VHl1C+EIBumCR8mgnMNgALpgriUCOIaS
X-Gm-Message-State: AOJu0YxddM9nOXLlQRPsPeOlpYSB41Q9LqAjvcdwATL7CcaA49Qb217P
 MbQIvtDqsqq9uQ0OLB0GfKbxmQXW8QWoSMNVwnhic4RMre4y6dsjT7MlEI/zRLm7jt/eDhOMX75
 PbIsc9BVuI6r7UkOglWXo8ndqVrpinheom+vWTOXZZhj/vzq58/gATZWRXASkNIU3gw==
X-Received: by 2002:a05:620a:5e13:b0:788:33ec:d8a8 with SMTP id
 xz19-20020a05620a5e1300b0078833ecd8a8mr2119015qkn.19.1709630320807; 
 Tue, 05 Mar 2024 01:18:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL7ZlquCoZ60Snk3iqt0FcWv+4rmgyNgIzTovW4+l2TWmVx4HZr2FQyZGXyzR6Vzz7p4retg==
X-Received: by 2002:a05:620a:5e13:b0:788:33ec:d8a8 with SMTP id
 xz19-20020a05620a5e1300b0078833ecd8a8mr2119001qkn.19.1709630320559; 
 Tue, 05 Mar 2024 01:18:40 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 bp9-20020a05620a458900b0078812f8a042sm3635157qkb.90.2024.03.05.01.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:18:40 -0800 (PST)
Message-ID: <deaeaceb-bfb0-4dbf-b800-b0debfd3bac9@redhat.com>
Date: Tue, 5 Mar 2024 10:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/nouveau: fix stale locked mutex in
 nouveau_gem_ioctl_pushbuf
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240304183157.1587152-1-kherbst@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240304183157.1587152-1-kherbst@redhat.com>
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

On 3/4/24 19:31, Karol Herbst wrote:
> If VM_BIND is enabled on the client the legacy submission ioctl can't be
> used, however if a client tries to do so regardless it will return an
> error. In this case the clients mutex remained unlocked leading to a
> deadlock inside nouveau_drm_postclose or any other nouveau ioctl call.
> 
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

Should add a stable tag for that one, otherwise:

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 49c2bcbef1299..5a887d67dc0e8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -764,7 +764,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   		return -ENOMEM;
>   
>   	if (unlikely(nouveau_cli_uvmm(cli)))
> -		return -ENOSYS;
> +		return nouveau_abi16_put(abi16, -ENOSYS);
>   
>   	list_for_each_entry(temp, &abi16->channels, head) {
>   		if (temp->chan->chid == req->channel) {

