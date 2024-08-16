Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5647F9552FC
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5341B10E772;
	Fri, 16 Aug 2024 22:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cnrrZ19m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF32610E772
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:01:28 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-70eaf5874ddso2042106b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 15:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723845688; x=1724450488;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LgYbK43aGwAGDFsh2G/orDGPKoPLKqPAZlb8hVQ7jyk=;
 b=cnrrZ19mhD9M9evcSN8RNogAs6yATGNTZtl+puxx8EhJHEF1zv8IzuE1rFUN9lc532
 m1Ki4DkKcolcYJ1L5V87SEo+Gj9TxwpfPqk0+2DO3wgIZV8EUc7kWqSfRIzRGwaupx3z
 WaoYTwJgdAllfQLmTe+UOYYb11CT+blWN3yUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723845688; x=1724450488;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LgYbK43aGwAGDFsh2G/orDGPKoPLKqPAZlb8hVQ7jyk=;
 b=E3D1kpfRz/DHQr9q+4LrbBzl3UN/7722MQhPbchrR4unNrqCCydR5GEmW+ov769Xfp
 6djGHVn/ozJuEPCC3Kh98d5L3UxxM5UwjPjrJPhSq40aobKu+uMcVlzxhem4V+QSgzZF
 M7EhD4qjXmNMfxQ3uXgYn3s0Ntlpv7ek0KmvB7sx4E5kULljBAeZ+9mep8SLZ9ESJWO7
 ks2TuFI72P1ghyKP3WjX4g4jSLQAAh9SaP1fWyCleM03IlLecfzIvehF0wurKVPknAk7
 Zb9c3aUXeF6YCkXomGnt5lYZ3P5kWS5RaUFfiOKyadQUUx8ccx3L5FB532sO9jBnsUb6
 v42w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlMs+d/7E78po6rmjYL+Upe45Wo201DysBQQ9nFtc3vqkdOx4ps/UDmCUJRt7Tv5kDEg+rFfEk1nLUsxCjwGwNdUWw/z3wCK4hQ/zVSbe+
X-Gm-Message-State: AOJu0YwujCPa0iLcwb/q8qBISYwsJwyEpgjlxw6G30S/yrVBAyaNHTsb
 WOKkxk7JiAX+XkYaOww+ygoCYbfGAIpkJLiwAe7IgL2SftJVkEBQdOWtuxzfCA==
X-Google-Smtp-Source: AGHT+IETZ8eaLaE4B3x+bJR+tPYhwTevDdDt/Kt8K15TFD6sknvXCq42uH3VGHr3pU5Kqog4MIlK6A==
X-Received: by 2002:a05:6a20:cf8b:b0:1c6:a777:4cf6 with SMTP id
 adf61e73a8af0-1c904f6e00bmr4695993637.10.1723845688003; 
 Fri, 16 Aug 2024 15:01:28 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127add7cc8sm3055015b3a.36.2024.08.16.15.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 15:01:27 -0700 (PDT)
Message-ID: <fd12bedc-7c71-40dc-95ee-9583b9d9ff15@broadcom.com>
Date: Fri, 16 Aug 2024 15:01:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Various prime/dumb buffer fixes
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com
References: <20240816183332.31961-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240816183332.31961-1-zack.rusin@broadcom.com>
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

On 8/16/24 11:32, Zack Rusin wrote:
> This is the same series I've sent out earlier but with one extra patch,
> that fixes the dumb buffer coherency on low mem systems.
> 
> The second patch has also been updated to not use math functions.
> 
> Zack Rusin (3):
>   drm/vmwgfx: Prevent unmapping active read buffers
>   drm/vmwgfx: Fix prime with external buffers
>   drm/vmwgfx: Disable coherent dumb buffers without 3d
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c    | 114 +++++++++++++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      |  13 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      |   3 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c    |  12 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |   6 +-
>  6 files changed, 136 insertions(+), 16 deletions(-)
> 

LGTM for the series.

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
