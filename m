Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1879EA51A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 03:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFC110E09E;
	Tue, 10 Dec 2024 02:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Yk08MoFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F0710E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:29:32 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7fd377ff3c5so2092762a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 18:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733797772; x=1734402572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YwGnfbEH4hFj2vgRvQ8cfyXWj5AzZTrLl8yUXWOuos0=;
 b=Yk08MoFK4c7oPL2YRQxNgMsKREk7W1vkRl/jdtgRTnLWm9TDDj9IGlpyzSO+5DmTOq
 tj5MrQB30HCZHVWY0gJ9Oe4dNGIBbgpkmO+EmREYBA+c+LUDGMb86ojwRY4zRm89EAD8
 J/DYmCrk2esUjHgBcdUJYAfJ7KYCuqPN0KLB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733797772; x=1734402572;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YwGnfbEH4hFj2vgRvQ8cfyXWj5AzZTrLl8yUXWOuos0=;
 b=SPsr01mQl09KUf/zOOMb00twgkBo/smZR1DVcAjYcoSnRvQMNXQVCH4Z1WUW/Z8tSr
 l6hqqVIUDtCwRa015AqZKUN7UEH8yEKpsVVyZGLusNjoKuravj7qQ3ugEhLs3hHF+sRe
 Mtc9Hthoz3u/ZP2jH/FUV37JVnKWFD9R3z8LVz63TG5gbkiQdkaY3A6JZl5l0qma8voX
 FCCICC0SBJEkt6qlqqALnocvIlwWovGqQSFJrFrbjnno5XMTtgtO0EL7vIjDVPNNoh3e
 LIdnX9nQS9hdoCy/QXn9j9+X+UAmXBLXBAIWEg+VZVvqCjlldkUCDN8oYyJovKELk2g+
 K+pg==
X-Gm-Message-State: AOJu0YxNM5DvhQEyF89WDIvb7wlKIN4OtzUptJnRD+un2ptMbLsLNeCB
 uRpHefgmfvLDt7h9QPHXNHSFlLUdViT4/SqWgy9zbQ3pjHcJyCyLBnQksUbTKA==
X-Gm-Gg: ASbGncvE6Q+mcZNYrBjtkfHjP+UoU7kSzc1QLGjt3KFDvSLqjeYqpWlV7lpHXWyMPQl
 +R9tbgYhYG0CZnJ/6+rgKwcM61HXaQsIEotDwdSnNbSUKP/tl6m4RI++Syt0Sx9Z2ndqUMdlW7p
 WUrM7/BXGMmHKnHX03T9VKfF7YROai3wUAyggzhNoXz/Cvb33CqcyS7FnJzFRISz6I1V1AgtJPx
 otK+z0A8TDaRsqGgkE+gl0qrjJdsfKh8GX+Pe5eT+9D4hI+r71o9t4/h8OVZ1L/jcWboQjpM1g0
 wy9Juw6lPkVE0cRuHeg=
X-Google-Smtp-Source: AGHT+IF3uyK/OY+iqmKpJZB/69ba4EdvPQLuo9Mh0ken54PCwm0nV6me1dgB//2eVrIGHAr7usw35w==
X-Received: by 2002:a17:902:e884:b0:215:8847:4377 with SMTP id
 d9443c01a7336-21670a22bb6mr26390995ad.15.1733797772158; 
 Mon, 09 Dec 2024 18:29:32 -0800 (PST)
Received: from [10.211.247.102] ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2163725faf4sm37805835ad.196.2024.12.09.18.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 18:29:31 -0800 (PST)
Message-ID: <741fe248-6103-41ca-a00f-e6dae508359c@broadcom.com>
Date: Mon, 9 Dec 2024 18:29:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/vmwgfx: Introduce userspace managed surfaces
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com
References: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
 <20241018210046.2222313-2-maaz.mombasawala@broadcom.com>
 <CABQX2QOgUAaMNzTm16GXqALerzku565_gdMK_vn6CNX6fnhwwg@mail.gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <CABQX2QOgUAaMNzTm16GXqALerzku565_gdMK_vn6CNX6fnhwwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/19/24 11:38, Zack Rusin wrote:

>>  bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd)
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
>> index 835d1eed8dd9..cfa14a34a679 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
>> @@ -112,6 +112,9 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
>>         case DRM_VMW_PARAM_DEVICE_ID:
>>                 param->value = to_pci_dev(dev_priv->drm.dev)->device;
>>                 break;
>> +       case DRM_VMW_PARAM_USER_SRF:
>> +               param->value = 1;
>> +               break;
> 
> We probably should shield this with has_sm5_context and
> SVGA_CAP_GBOBJECTS, right? Otherwise the commands will start failing.
> 
> z

We can shield this with SVGA_CAP_GBOBJECTS, but sm5_context is not needed.
The third patch of this series "drm/vmwgfx: Add support for older define commands
for userspace surfaces" adds support for V3 and V2 of the surface creation command,
V3 is invoked for sm4.1 and V2 for sm4.

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
