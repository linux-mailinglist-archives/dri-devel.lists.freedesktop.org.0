Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D11A1A653
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 15:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D12610E83C;
	Thu, 23 Jan 2025 14:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RzRa2e53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5E010E293
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 14:55:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43626213fffso14186085e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737644128; x=1738248928; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=upW0o11czM3rq1xyIyTJu9A6ZGTiL/ktJa+3JV8KCvY=;
 b=RzRa2e537o1ucY5AFR5e/9ROfT5Gkv9HKT7on/WCVH12ABHpyoL+n+Rcu+fpt3mYF6
 EGe/n5sUqXrYKaHWw8h9euh0m8JvczuEABk/RA9PQYnAn/IOT5zETcU5dv+eQve4USmo
 6andFBkvCVLujH3G5ScpLABSIRvAnpzES/BBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737644128; x=1738248928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upW0o11czM3rq1xyIyTJu9A6ZGTiL/ktJa+3JV8KCvY=;
 b=USx2+MFWnEEcao8STY31XoXKvYgKfMQr32HeIJrG1wRc/tLRzdyxSzYdAHZuf2D42D
 pfAw9gAy6tNMSkXyeTb+3AjJbmG9tXeU0Ai/rXH3oP1l8UyyraCJP8OetNN/52RuDrBe
 ezxwSo79/4Oclkb2DWOx2WA/GV6OnsvRThtkJzBdfmRo9gNwxIeIgHt8SjBMk/625bw6
 CWK00ZHan4YcsoGXg1xDTa8sr7SH+EzGFyseuZJUvdTn06aITzbcgja73BW0bR1CWxyW
 pKPfXVkyXcw9IKAgHsrdI5ML02PW2ItipdXQysMsX2OUsbh2kPcvp2dySlkCcFIqRkPv
 XAng==
X-Gm-Message-State: AOJu0YyMqpIR/HSWiY/rGLzNR6IET/txBGKUMNk78lOW2QS3xP43Vqoe
 1hIyV8oEUKa+4nZMrXROTKUMBdzV4HPKvymwp4p8To67vJ3rt6VP5GKmZGnJv/Q=
X-Gm-Gg: ASbGncsbnmZbgKn1wBCSb+xe145qkwZ3/HaLT92u1PchgcN7fjqh1+XmPkqJYl32aam
 BbImUyJ9SSzjkUvObkGRLRBoxj54hCcL28RZEbs+eCDz+RsC0v3ID+jJ7GD1GaSucPwYBiz1aFN
 t2N9qMNop2luJxtp1GCdhteCN7TtF/CW8A6H4wVzoJFmE8rSr28CQ7k83njn5s0t6+qeY0uWqGj
 UlmPfxfjxTshtTbcK6JUdguWvE6Sd98zIUXHb7aPmaWOZcOJpNirSmdmYVb/OTjpC60gaR+9kw9
 DnCZRxmogyhNGKtU
X-Google-Smtp-Source: AGHT+IE7BhkUFF2qHI0G/tCUqF6t2iGENyy5rwl62Zw7BY/QQn9skwrSBU8Fm+gu4mBqm2ES4RoHjw==
X-Received: by 2002:a05:600c:5110:b0:42c:b8c9:16c8 with SMTP id
 5b1f17b1804b1-438b885b8c1mr34261125e9.10.1737644128137; 
 Thu, 23 Jan 2025 06:55:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318aae1sm67298595e9.1.2025.01.23.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 06:55:27 -0800 (PST)
Date: Thu, 23 Jan 2025 15:55:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: Re: [PATCH 0/2] drm: add header tests
Message-ID: <Z5JYXICinxvDXN2J@phenom.ffwll.local>
References: <cover.1737556766.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737556766.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 22, 2025 at 04:41:32PM +0200, Jani Nikula wrote:
> Add CONFIG_DRM_HEADER_TEST to ensure drm headers are self-contained and
> pass kernel-doc. And for starters, fix one header that this catches.
> 
> Jani Nikula (2):
>   drm/client: include types.h to make drm_client_event.h self-contained
>   drm: ensure drm headers are self-contained and pass kernel-doc

I guess we should give this another shot. On the series:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>


> 
>  Kbuild                         |  1 +
>  drivers/gpu/drm/Kconfig        | 11 +++++++++++
>  drivers/gpu/drm/Makefile       | 18 ++++++++++++++++++
>  include/Kbuild                 |  1 +
>  include/drm/Makefile           | 18 ++++++++++++++++++
>  include/drm/drm_client_event.h |  2 ++
>  6 files changed, 51 insertions(+)
>  create mode 100644 include/Kbuild
>  create mode 100644 include/drm/Makefile
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
