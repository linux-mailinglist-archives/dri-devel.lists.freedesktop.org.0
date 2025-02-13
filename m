Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDFEA349A9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAB510E40E;
	Thu, 13 Feb 2025 16:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hysN4GAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A82B10E40E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:25:01 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso1175246e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739463899; x=1740068699; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RP1Frco8mVbDxpufPwI05XZgkOP7lEoWQNwutSthLNA=;
 b=hysN4GAO4qj9gGEprSWOAONZltA6MCoyFMVxItmPmNDA/4hZPSbnlsCwiPoEYTLFmh
 x7R61OEFUCA6fQjNu648gp89Xh5oqmuh8xLJiAklGih8Ud2IsFRHK9KwXHltErXxZ4o6
 6GBNdTblzqLNv5BEj+Zgk0xUBd+jymxRxxpcmHriEWRPDqiUzGIpi+0Vq/+dpmb2C+yU
 6jUUUybGWhNc+SOBspbvBqCdwJ5LlLZst4tYftZ6aANVGI1AkiQrjeWyI7Bd5jMJrR+y
 di8fN2zTF4hXNe1ws77gIjojh0+ooSxjk1I3N24prFhO4BkAPVnqBvnRuBlhvOe1QTLt
 8KLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739463899; x=1740068699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RP1Frco8mVbDxpufPwI05XZgkOP7lEoWQNwutSthLNA=;
 b=i3eqsijrKKJMSpw0uIhKg18V94sRYTU6vFxP9fMCOOyxUSW16tDKQQYiGsDzcUB/pC
 OVZGIAwD2jMEDv8mq7yNyd+qfgGFMmcZQ2Wp7znUfDNNAtjd4Cjv6zovcwZaYGZtIfvi
 6G7PVK9g6IaKpBBdlEAm+Bu0i7hkFj+EYJR3noLsmNjvQXiB7VdCgXVfWAgTq7Z/+ena
 ffNWheH8AjorrILqp7FhSYLzQd6VbBlLjMzTLPzQtB2oZpDa7CAsEIBvGJmSfGID4pP3
 Sz1+fyCEyBE7eSOHaWumLu5Mrw/Ulmw9/BK081C7PJwiESRZSJsxNd13o46k8t+YDGds
 QWSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP+67sNSE5Pj1THYgz6NwtTgM1pl9P8X7AcSbIC+y1JwQwBXlOyO2LvaJO1fG0NZM80EnrOZox8j8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUG4KZjdEBIIVInX3Te824GTyx6ePGgJQfApFed4VrQkt8qToN
 vyUIOllYfkQx2TR46hRDGlNT93T/k1i2LIqj2ojhRWG0D2wnkkiNZYwC/BMzcyo=
X-Gm-Gg: ASbGncvb7jbJpRj7bKEvJ57gBbqs88eVwu1Syn7IQ8PFRt4GGnzjjW9EsDHVnXTdDbZ
 dv4L7rGwQPwqO9wKdh79SLP/jWI51BsKkh6pkLYHb1O6a5dpJnDKm/4J9ZBqgShAL+rdm9JkjFa
 lNRWwPhUhk8xugUbsAYCyN5ipyZV944T3KXs9DyPpfGNQrAtutfX2BdgL47c9ZRBEc5uojJZ0DR
 vwFU+4DvpWszY7XW4CFNYOcU01OcTKHBNSxb2r9PqQNh2bCp8Na6k35ho49vAEUujoTMblDZJ3F
 sC6WJGdq4Z+puSpw2+f5FENW6wpULZW1yzvM9Gip26/9xtNU+LPNDip9TARbdIprB6qlmCQ=
X-Google-Smtp-Source: AGHT+IGfRjD7Tz5iv/1tFAE3Xtx4zjrCq99Q8Fqbxf8sq8iSc86pgj85yDAeiyyxfZEf0fMuxxQU8Q==
X-Received: by 2002:a05:6512:3f9:b0:545:8a1:536b with SMTP id
 2adb3069b0e04-5451dde9440mr1199443e87.50.1739463899538; 
 Thu, 13 Feb 2025 08:24:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10cafdsm219598e87.169.2025.02.13.08.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:24:58 -0800 (PST)
Date: Thu, 13 Feb 2025 18:24:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 28/37] drm/bridge: Provide a helper to retrieve
 current bridge state
Message-ID: <suykislck4eekj7yotvgadjnfuv2ctu23ezxsy3iwjo4mdfrom@7dcec26cqeak>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-28-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-28-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:47PM +0100, Maxime Ripard wrote:
> The current bridge state is accessible from the drm_bridge structure,
> but since it's fairly indirect it's not easy to figure out.
> 
> Provide a helper to retrieve it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
