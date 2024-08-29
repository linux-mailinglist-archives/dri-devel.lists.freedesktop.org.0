Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64783964C64
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 19:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EEC10E740;
	Thu, 29 Aug 2024 17:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MOs9dxye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6220210E740
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 17:01:33 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-371a13c7c80so1239787f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724950892; x=1725555692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YehqG4PtaapmXnLiVOq9WpGytyQ7YD42DofQvtnV7HU=;
 b=MOs9dxyeXVK+015PEPuSjOoqTCNGZuJvV7mXpbEA5TP7qr8U5Rn6qrF8+4ZqIhI/ND
 HSbGP8brUzSFpJZzDvqNQ50nHT+i96v2WTB9UW2RYhafONXb8vPciuhoYzp7HtM5FKVR
 mwnpi4/7FjfS7XPZNkqKkkatUiSJDVcuEdaETmJ586DIGjoDgcZyd5jFcKsk3E3oDCuM
 wrTNFs04P1OcX6CAHdmFEQOejl5FXU5g/u71f2/DDNCdEMzmfJbJSCU9H53BjmPYt6Br
 3tyVnVrrVr5vz4+nHM/SiehYKNhaMB01pos5Hhf72n8doWwHiQE6Z19PGVCF8aAJxvKt
 0EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724950892; x=1725555692;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YehqG4PtaapmXnLiVOq9WpGytyQ7YD42DofQvtnV7HU=;
 b=tiullb7CG+yNXbgpkHTPODFEFdlhVa3Y8lNJRvrnf4CG4aFvNZpf6kmOIT49hPnWU+
 oFREwSdVspax5PcNx5s8ZjhquaZyOQsgF1rMgEXucszs5siKcGHtaNv+ClAf7ckUhQso
 BeuBZDKtEceeP/nVlJCl62NIwTZC5WLYGbMpjpfmeLvPxbdgURUx5avjouG2HR+iFsUJ
 Iw9ixa53mN27kI8m90NipaZcFlLXJSMLvMZ7VgC2gxQ5JutY6F1pSyRztNdQ87I13FxJ
 hNNhxyYkC19bbMiTpzA63mlLbSWzfz9ugDu1cM8WMXkqrq8jmGVOVjgT8meQ8BX0wvgV
 8Bsg==
X-Gm-Message-State: AOJu0YyrYRWaznI803iH7umpB+4BD5I7m87bmyOpgbqBmrrV1DvUhf1p
 Ejo+Tuuju1H2X4U0TT5Ar2rWDXTe/6o9cc1A8CxpIU8DlqNtteiP
X-Google-Smtp-Source: AGHT+IFosliCC5+a+h4wlp+6u+dlP/pGWWU2L2Rh54ZG82z8dvc2aWVVIoZMBy8f4qkeaRSreWo7yA==
X-Received: by 2002:adf:f302:0:b0:362:23d5:3928 with SMTP id
 ffacd0b85a97d-3749c1da581mr1781820f8f.17.1724950890602; 
 Thu, 29 Aug 2024 10:01:30 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e33f5esm22284355e9.39.2024.08.29.10.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 10:01:30 -0700 (PDT)
Message-ID: <cc32d1c4-16de-423d-b125-9301154c950d@gmail.com>
Date: Thu, 29 Aug 2024 19:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/sti: avoid potential dereference of error
 pointers
To: Ma Ke <make24@iscas.ac.cn>, alain.volmat@foss.st.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240826052652.2565521-1-make24@iscas.ac.cn>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20240826052652.2565521-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 26/08/2024 à 07:26, Ma Ke a écrit :
> The return value of drm_atomic_get_crtc_state() needs to be
> checked. To avoid use of error pointer 'crtc_state' in case
> of the failure.
>
> Cc: stable@vger.kernel.org
> Fixes: dec92020671c ("drm: Use the state pointer directly in planes atomic_check")
>
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>
Hi,

Tested-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>

Regards,
Raphaël
