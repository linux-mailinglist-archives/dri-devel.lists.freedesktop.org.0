Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F341A7660E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 14:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8651710E0A1;
	Mon, 31 Mar 2025 12:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GGnFF8JM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21E610E0A1;
 Mon, 31 Mar 2025 12:34:28 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso28123755e9.3; 
 Mon, 31 Mar 2025 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743424467; x=1744029267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8C1B/iAjfxZB5rM4ON16gPgb8RTIZjhmtB4Xg7w4JZc=;
 b=GGnFF8JMaAZGTrLA1WW5gaf9vizGujfol8A/disyOSSq8xp/9xI6JOYQ81fgdGOtzL
 ALUroHl0hCNwEWy1oLCvxk+iZQSHXh4rtfemKCmoSqSKskJuCA6hP4h7FFJ88UMAFnIV
 M6OI3i2jWCd7vHKot2mtRBTyOBWVua6CJpVVve9Um0E2/CIEYoo37i7WqEwmcrC45NwF
 j+n0usfXbhcZo8KdlG80J9PRxX65EbGZIrpDfElgLfXauiWKNBFNG6SluOlDktPtSPwJ
 xtq7zKDHaNea/dt1lW5qSqpC6Scz1/DytZZUqXO/Nj+4jweaqULgeBtubZ4RZSmGo0e0
 3Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743424467; x=1744029267;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8C1B/iAjfxZB5rM4ON16gPgb8RTIZjhmtB4Xg7w4JZc=;
 b=GFZUo3MikgXeu2wx9w+llFcIqzVh7Zcq+FL03LJmYgaC40NcSGe9NScOgp6SI+YJgf
 3YsrtAW4Ajv362DQypeyiQIatdB4GOdW08g0jCeeMzvIVp1CvVhKcWwTcOhuEqNkGzKN
 t4DltVAyWPgbTyLxuws6e4Z5TJwxh7DMgaMOWrEfPqHDRyWNM4OyjikHK/3pFHrTlU5R
 XRIWhGOgseXzYEp5RGqn+ngjSvbMVMz/Qj/r8ySOLmIHa983s8cgJ7s+YNThz54WeT3T
 fx/1+z/J12wkdoArw8LS5UazLgspTjN1YzbWBRgP872Cs7vAuu/EyCAnqi77JgAU3rNU
 uaDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjX1Q0doOurlgO8dPyFab18gbMhdMhH7j2Zlq0bDmXd2zHytR5wVlMM6cRd9bH8kVfHfxWOHbvRaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT1HFAgEStt3xI7q2t8tkoDaaN2QPQpb8qBdK4wUUvHa3q6B9S
 j/AFNq2Ek4J2AxZi5UfOPU661/UFbpGyKoY5CircFTp5dcgvdaiW
X-Gm-Gg: ASbGncvdvpy6MKAk/PlZQEyiMP5ETu4Xf2Mz2MAG76vSBfL0lSzMxz81n4NOaQc1kwI
 zDS1LytCug38c0hUsyejCyN0RqLiiiIOf/GdzpO9f8WkF+I3TnwLiGgrifd2kW2o9wpjjFXkYZC
 F3kcj/AJriePtOR+rsl941/VuGFSrCanzIUaStJpQFNPdSOzEDcwgMTgkNioFduyGS5i8IvPcGN
 cjPv0WRs1SQtlJTrRRTrPHXDwcCC+E6j4N9eo4Ql92SJx0GxA4oUM4NAh26AuJf/fHLlT2zBrXq
 Ff7dN+G4Gw5Xqps3eRtPZ/u6xkjsCC/Kj7YnI9GCnDMGssUydGUPw1TGO2C1C8nIQ+bM8UwzJh6
 cOTi2uRio
X-Google-Smtp-Source: AGHT+IEfunH6HBm1Y7PMm/0AssIfHy3J3Wc1+rqe+wHnYUK4e/iGLilXY3nFa6l/MWKO2U0EbJxUpw==
X-Received: by 2002:a5d:59ae:0:b0:391:1139:2653 with SMTP id
 ffacd0b85a97d-39c1211d013mr7275853f8f.52.1743424467274; 
 Mon, 31 Mar 2025 05:34:27 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e393sm11326406f8f.72.2025.03.31.05.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 05:34:26 -0700 (PDT)
Message-ID: <2a2e9a4c-b888-45e1-a191-847dd8e7cb9d@gmail.com>
Date: Mon, 31 Mar 2025 14:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: replace use of msleep(<20) with
 usleep_range for better accuracy
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 aurabindo.pillai@amd.com, alex.hung@amd.com, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250326070054.68355-1-bold.zone2373@fastmail.com>
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

Am 26.03.25 um 08:00 schrieb James Flowers:
> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).

Our display team has to decide but I don't think that this patch is justified.

The time given to msleep is just the minimum time necessary for some HW action to take place. Waiting longer than that is usually not harmful except when you want to optimize total operation time.

Regards,
Christian.

>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 2cd35392e2da..2d225735602b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -682,7 +682,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>  		if (rc_cmd == cmd)
>  			// active is 0
>  			break;
> -		msleep(10);
> +		usleep_range(10000, 10200);
>  	}
>  
>  	// read rc result

