Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC31A35025
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 22:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A8C10E0A2;
	Thu, 13 Feb 2025 21:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ujThXRMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD9110E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 21:06:40 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-308ee953553so14532671fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739480798; x=1740085598; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LmXeuchpKSKK7itV+jnu4GAZDK3KHsa9YGIjB4lMa4Y=;
 b=ujThXRMu7xNGvytx1oQC654uyu28OKt9V12acp/DZ/uL9J5m8iBWyDufdHavD6d+u5
 wSck1YgIJpQccNAEMPmQ4wyPa0hsutP+dL9g4PwfhLbzcGsFMXnF6F+uOpRtaeKTz3zG
 p532kZRmCLxrkPXXNrsHOn/KU0LBt7++I/TOx/GXZ8n6eHA7MkMZepzDAvroRjGZ5PMU
 RrjKlXHDxPHAS3GC9dDdliebdb3heQzTRdqweu9YXBXhMr8U42k/yPbJWU3pl1sV9ZYZ
 Zgfcll1AivBBknsQaoCXNU0+H4ppRswAkNj/6muzOmTpSPH+wnWzrRoWVvEWyCmZcHhT
 HEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739480798; x=1740085598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmXeuchpKSKK7itV+jnu4GAZDK3KHsa9YGIjB4lMa4Y=;
 b=eJq0qoexKdIXxnXCcnzKzjp6bEq4MzUFdg3TA8HwELCTKjmaD2URNbY491vGS97lCL
 Yogi428pzni0h2m5Y5KAEms32O4G6M3GCUoeEAIqrL4A+iAe1HUXx70qOhe9LjcF0vEM
 VWZlw2hR9Ab3mcMVHVRfEtTb7nj4kQGuEo2wdJ3VH2gpYKpXtJHVul4bSC4uGH8Od4qe
 Z/DuZuxOlbcYb6E/tw8IZ0/K7ZEWGQA/44SANmT34RMUZK5GfBaPb1NgMTXy5FZsIIBP
 S1D1mTaaPa81KFHD5XsCBq925Bjdwx9efBhU2FFukoJjYxLmiTSvdzjZFQx+rMdvVI62
 5rIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ9ubK2M9RlBLE55nmIt6DOhLELznpa2C2djQbgxG2OYCmbuBszxoplU6QIcfPwG2rXPcg0ySnNE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEsVx0xgVOe+4+Tt8ccuJ/SQZsgB+r2V1g7SpJ9iVM9k/INlXu
 fpw6/r+1wS5+CxSw3yhrnBI8cxdzPlTYW9UMGON+ztVkzZEWwkVCYeB+W3Pbpyo=
X-Gm-Gg: ASbGncvIQ4a0NnRVq0xvLPDjIthBNma0PdQVt5GM0aZnCpq8yRTL8ukbK2YeKQ9EF0s
 64ytjMNh2jaNWiwrLcgMBM3VedmLqfs2cij0VIwgXwN/ZwClcDBDvqg9/qjp3e7Py8t/659YL0Y
 g3S8dCRbsLNpF3MDK3htcy++VLMvIus+mrHltSLx2ybDpVgx3kB0ux8wdKQ4/11hleFN/Uj92cQ
 d+9ji8BRYoe8lpT+FVyd18rX6wsvr+yr11l2rl1JWBFmF45DFC+Y4i4fpide0NdFcVUBvqR+Ktn
 TCPsTTlEqUmNcEp1U7ZMZlvGkzgZRwAerx21DQQIZwhFIBkiA4azi8AtA2FZA9cVoYXvks8=
X-Google-Smtp-Source: AGHT+IE+Pbr51O7WuqBXkQBPlJzNzEXWSwgmC055Mxz7GAD+fo2hMYKs8st3+0i1dxoABKmhCmeD7A==
X-Received: by 2002:a05:651c:221d:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-30903911d8cmr25004601fa.28.1739480798491; 
 Thu, 13 Feb 2025 13:06:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091e04742esm109391fa.86.2025.02.13.13.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 13:06:37 -0800 (PST)
Date: Thu, 13 Feb 2025 23:06:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/20] drm/panel/xpp055c272: Move to using
 mipi_dsi_*_multi() variants
Message-ID: <6zfcqybwxycywlm45ou2wges5qjb63emndmlstieck6qgzsjt4@rdb5hevlufms>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <20250213-mipi_cocci_multi-v1-1-67d94ff319cc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-mipi_cocci_multi-v1-1-67d94ff319cc@redhat.com>
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

On Thu, Feb 13, 2025 at 03:44:18PM -0500, Anusha Srivatsa wrote:
> Stop using deprecated API.
> Used Coccinelle to make the change.
> 

[...]

> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c | 138 +++++++++++------------
>  1 file changed, 67 insertions(+), 71 deletions(-)

This one has been converted a month ago

commit 8025f23728e9bc817495d48a04954cdee27462bd
Author:     Tejas Vipin <tejasvipin76@gmail.com>
AuthorDate: Tue Jan 7 14:55:10 2025 +0530
Commit:     Douglas Anderson <dianders@chromium.org>
CommitDate: Mon Jan 13 08:22:30 2025 -0800

    drm/panel: xinpeng-xpp055c272: transition to mipi_dsi wrapped functions


-- 
With best wishes
Dmitry
