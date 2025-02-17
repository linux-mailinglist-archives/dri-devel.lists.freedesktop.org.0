Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1ADA38D16
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 21:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0B310E5D4;
	Mon, 17 Feb 2025 20:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yBnpy4Ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D6010E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 20:16:18 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5452c29bacfso3845291e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 12:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739823377; x=1740428177; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tsTvGlAO2PQ4d2384bE8SL5TPdN0LR6pjGuyQRT05vk=;
 b=yBnpy4Ct+lbIWD6MMWGHGBxfqhu48CpJdNhg7yZEPjnulMnximwz14Xk5aHKVqzbfj
 XQF1sjhfxNkxClBiPGig/gnnUQ6bUUA408KDTNfxiN5y8c7nXSGijLLEpop8sAhRBxcc
 vuuYoV2kwrefO1F+0T8v7Fesx1JebYXTDqDI42KlUdj1VKRKLknh5kw7Kjckt5Dzj9nZ
 XItHcA6n0CEb59ZE8X7wmUjIwZavy6unH2tD05peMOaRpey4qQ1+QWVIBQKNsHP0TjoY
 k763Ucfr9CKAP+c0GCA5dVNz/Ci2xp4N1Y3Q73FRQK9EuLua+tUuc66SCH9VqLihetch
 yNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739823377; x=1740428177;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tsTvGlAO2PQ4d2384bE8SL5TPdN0LR6pjGuyQRT05vk=;
 b=Rfnct6NGXCBIMFmrGVAXgDGObw/bjMXoF+R2CjtCYpLjh/0ZUwEPTz6JPCrH16mXrA
 LG1bRTUMAZzn0S/e4Ko7P2gAnt7pSOIYU6OstQhdGBWuzK9IQDaP9Wq40kUEGE3wPFfM
 TB2dyPLGuOxsyS84vjFNfnbrBHm6Kt1g2z0wNhIkEyKAPVPwaS+7yoSxxBnobcWWaXPk
 PldWEOPVzX7aKcw/yuutHSwrgV/d3saRzgWlEuGUhHDS5h6Kq6OWooOnAt9z8ykXwFJu
 xbKVTZaWquuWEd0X75NJ+0gKhuMbx62HjaFDKm6iKNEID3SeODOrTJkQKMy13j2WZWtd
 shDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Iq/cjP7KF3HJwU3bldcwmPd9yOUD2R8mtbehfaaSQUf/mOj9LvYekurJPn1Nd8vTc/Khey6s0ZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN7DqqAY5iihowMpeHZHQalIrEyYLyimTIXcb8Nx+26S5StCQ4
 0a9dZH+wN12L1ZpjUd5XzE/9FaRL7IZtitWeGlhq6bXrp9Me1onmJ4VckNt5X6U=
X-Gm-Gg: ASbGncuwlgAUsxHMbYnMdlIpMJygDZ/Hq682+48E6jBSM/tQaF3a6ENE3BwhSg7iQbE
 kg+V7lsITgrNcxu9EVXLKd+Um2Wf/LZukvuyRMigzcbupC1iTvvlPUqpV/NJuAR7sNrGsQ1H+hT
 ZphI6O5J6Uv8CVvthhBmih7onbW7+0KOafgy996FNmEYF+oh40XTHb3HX/FQQGIMdI0AgsBZzny
 qrys8oS8ZUoLI439w8X7JqGKgz3SPR4xyTa6UyVhEAlJhOO5aO26bK1TdYHJq0PHjMcW5Cneein
 WVFNdiEngU3QWb+otc/jSwY9EwuxD1nMEd+UgKTTdPMtBfDSFuSqc3V++SXVUI4mSD6ifc8=
X-Google-Smtp-Source: AGHT+IHTW2hidZoQgaJh6i18vKP0XNh1dEQr0uYfuvR6oJE5egXcYJYKmvUHeCYrFDjACBLMSRu1eg==
X-Received: by 2002:ac2:44d8:0:b0:545:3032:bc50 with SMTP id
 2adb3069b0e04-5453032bc53mr2778480e87.19.1739823376711; 
 Mon, 17 Feb 2025 12:16:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545d1b9c30fsm876364e87.15.2025.02.17.12.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 12:16:16 -0800 (PST)
Date: Mon, 17 Feb 2025 22:16:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <njhratp6oy27walyo7qfvp6oucppqjj4ubr5xsofrz6chx5c4r@c7wrehjfvykn>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-5-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-5-90d0fe106995@ideasonboard.com>
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

On Wed, Feb 12, 2025 at 04:56:09PM +0200, Tomi Valkeinen wrote:
> Add X403, a 3 plane non-subsampled YCbCr format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 4 ++++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 

Same comment: is there any other name for the format?

-- 
With best wishes
Dmitry
