Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3FA55B78
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 01:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B6910E033;
	Fri,  7 Mar 2025 00:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="axVN0JU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAB810E033
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 00:08:51 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-2bcc0c6c149so1097199fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 16:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741306126; x=1741910926;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qIBYJfinn3ZTy2inbKBXycwp5r8VN34mN6BJPNVjbHg=;
 b=axVN0JU/DBXdZdWzSZNtEVQ+dcQgCbSMAHso7WOiy5Lha7AkXjCzchE5nWqOmEgCUo
 5ySubynXXYCqruOrylukOx4XhyZ0ls8LGrQ7hZflv8RUeT0t6uzix4D4VoM/GjCGSaRB
 PBpk27EDTcdNSwxzZdlS5mKocccMvGL3NSvRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741306126; x=1741910926;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qIBYJfinn3ZTy2inbKBXycwp5r8VN34mN6BJPNVjbHg=;
 b=bevh2WPWC7hS4JN7qKpKfhvO0KChfVWZNszTsNftnbtmUYAvicjOMozPQ8ZvuHNKvz
 ghEH5Gcc1r1JA8G0pJ2TAYN27CHcvmBIYsyltZxoZ1YsL+QrQvudviQhXgwTcYbTi6+M
 y+eaKFAIG9ZQ+uJsb4i2ZhyMsJJraF7KAReTOSgIMCy3t5qWzU+IMA59Sjnj5u3Do9zd
 064U0yGh51n9GJDpd+uSC66RuJFjlWpQb+i1Tztr0qLBdWEZjzJh+11JDl7oljH4xLoM
 F5Su+W6nETeGsgaSDuk6wt9GkdIGdJNU1akLeVM/PBFtAzgU1BKRsKWLAbCu3Yy/0h3T
 MsIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoMMJfNWRsgvVIViPl5cdwlRTF/IkEuFDni8j9C18af5BnWXcZBmYNeFh/49sJN3/gJBldkwWbJho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykPYWty0/wZ5cMQVvwLzw7EMWeDCoIe6bQ83Zof3qbtgslRHkS
 jqLMh3DXAxfQhJQHzpU36WaEWQHxfQe2GyHu7SDUeJakDMFxNzFFwiJq193mQQ==
X-Gm-Gg: ASbGncto4vSPtH7ACvxnmDNIa8yjxNYrCHMvmWtE1Uhf9OhnwMcO+9u19n9uJjRD3WR
 nFz/OFx83XMVvtuqCI7/zmJWqGzyXytypa9LYub2pIZ6s09xZnkjdQdWlzttayC0eenWIuz5aIc
 qNBIJ0NrkKbndRwMACgfOc73IvruE6vo6EV4GisNU5DHQBSGhEKD8yFnopsMaXN7xxPK2OK4sgW
 phhKhNt9zaB7NJL005cKHqZIDsZjZX7grygQFYDwFGRfZyuUxVfyWUYZXDrqxVsUwYh+hXWfh/a
 4o782B456ZohszttQbUuXG3ZmUIwIKosmVRtmWRvb3AAMG7s1odH45QaAz3L22W7+tFTWR1VATA
 Xvc1WTm94DQ==
X-Google-Smtp-Source: AGHT+IFrJZjCqawt6r8iNZej/vCgzAPRwgtzxXc5RImQuEHCyAi1ABwtdeoCCElXtGijb4agexMchQ==
X-Received: by 2002:a05:6870:b291:b0:2b8:e4b9:47a3 with SMTP id
 586e51a60fabf-2c261143981mr697030fac.22.1741306126140; 
 Thu, 06 Mar 2025 16:08:46 -0800 (PST)
Received: from [10.211.247.102] ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2c2488ba989sm466859fac.15.2025.03.06.16.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 16:08:45 -0800 (PST)
Message-ID: <5e45550e-6e00-4498-a2da-e5711bbe03a9@broadcom.com>
Date: Thu, 6 Mar 2025 16:10:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Fix native cursors with vmwgfx
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com
References: <20250306041222.2776379-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20250306041222.2776379-1-zack.rusin@broadcom.com>
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

On 3/5/25 20:11, Zack Rusin wrote:
> vmwgfx had a number of cursor issues that related both to our handling
> of dumb buffers and general detection when a cursor has actually changed.
> Fix those issues and bump the kernel module version to allow userspace
> to recognize fixed versions of the driver.
> 
> v2: Include the fix for leaked dirty trackers in kms fb surface
> cleanup code.
> 
> Zack Rusin (2):
>   drm/vmwgfx: Refactor cursor handling
>   drm/vmwgfx: Bump the minor version
> 
>  drivers/gpu/drm/vmwgfx/Makefile              |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |   6 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 844 ++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  81 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |   3 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          |  12 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |   2 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          | 851 +------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h          |  49 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c          |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |  40 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c         |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c         |  11 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c      |  25 +-
>  15 files changed, 1031 insertions(+), 917 deletions(-)
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
> 


Should update the year in the copyright to 2025, looks good otherwise.

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
