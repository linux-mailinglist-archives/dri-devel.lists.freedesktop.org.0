Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE57A076EC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26B810EDC8;
	Thu,  9 Jan 2025 13:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="fIthwEh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD2510EDC8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:15:25 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7b6fc3e9e4aso69295085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1736428465; x=1737033265;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NrxsaHY4+ydMCtcaYh+rQuaKzB5LWZXeogQrNZ905dY=;
 b=fIthwEh1MKbiwueeU9RZdYnLcLJ+feqbmtQRfUfeGQ1aOtNrM6mgQQ3eKIS0ngKhbl
 wwOVnhSNUsVbdJoR5um6jlDOAlomjH9QgZgBfGINLo36KOjgFHsbfTL1wvXh8kzba49d
 jCmuPG2q7ppHOqI63UsoKV24ys8q9Yv/poZT0A33qyJkESH8/binPJCaMqFt7MA+2dLw
 ifPhDFXZPLqfBRnP/zegOTUZlm1eQh9CUe68Mrk1ZW4rw3C/cZq26KMoNbfimui8EGRj
 n3sgGGUvCnJ7Xv/pD9X0TeZZRhdTigA8/E52NECmW8EkgLxn+rcheYyBfUXdXGyj0rmd
 mAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428465; x=1737033265;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NrxsaHY4+ydMCtcaYh+rQuaKzB5LWZXeogQrNZ905dY=;
 b=tDWePq6YFsFgn3BM0oSGdmEHsCaIKg5SkTm7F2EpohrhxeP4p9SkC4T+kulcO6mgty
 qDro9qBbxK4VRO8y856/hAykoc9TZHhnvsEdgnMhkNyD7NEph0N2NTzAWVgNqs0klK0E
 lczVhK/KR883En69HfDF6FPX2zYa1BdxgM0ZB2M6AeeCNCIOM1iLVKt1L8Kw+WgQNHBs
 T80NJfww7AUL1xCkK5BFSvN+TS9JxrWTMREtbZJgN5pPWS2Pd0tdTfHf6vBxH25MEvc5
 WWZs4UOC1XL283uRxoOJBplxIMOY3mLfUxg2tTh+iD+1DkdhwikYjoM2rvMLQF4Iz/1/
 Vl/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYydzdHPSzkIX45C8IpcWZz0MJtB4CEtYFRlcnXaBm2f8kXgda2hnjFuD/d8nNLhxTrqYfxKK4590=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRWNOQANqXh6LbnmOOIGkN4TvIzIy6UL4hNVsDAIzb/mAPVIOv
 zdKTX5uQXWqf4FqPYxw/Lz33WIAL8iC61x6yKT41uQhQz6wx0srFm/zi4zadDtU9dSkc9GkQEH/
 cBszf3a5S38syGNxO/q0SSEkXRH31Vxvps3f+Ig==
X-Gm-Gg: ASbGncvZdo8rKOt0ehRHO8Te5kgMUV2ChevFjeDheAEI5+qTf0otQGo+PjFMW2Avkmc
 6444/lkfamh79FZ+BtPX+t1hObGWDES77ywM=
X-Google-Smtp-Source: AGHT+IEwwWkstzhQtFWkY3Tc4loq1wVn/E/7/ZkynGA9ZuskS2TJMdhid26UtxlqQl7e12aZnmo4W9SZTIhzZF8Df98=
X-Received: by 2002:a05:6214:21eb:b0:6d4:215d:91b9 with SMTP id
 6a1803df08f44-6df9b2384bemr102460206d6.11.1736428464641; Thu, 09 Jan 2025
 05:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20241219174929.126205-1-eric.smith@collabora.com>
In-Reply-To: <20241219174929.126205-1-eric.smith@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 9 Jan 2025 13:14:13 +0000
X-Gm-Features: AbW1kvbNTLYvPNjFQjSB20JYmnJ3VB9_FOrCSa1LtwSvwpWcAqfQnOARq3JNwaY
Message-ID: <CAPj87rPQZTg2Laws1BdzL-UOLV6jWinJqM=GeLdvm7UNEEnrdA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: add modifiers for MediaTek tiled formats
To: eric.smith@collabora.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 healych@amazon.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Eric,

On Thu, 19 Dec 2024 at 17:49, <eric.smith@collabora.com> wrote:
> MediaTek (MTK) uses some unique tiled memory formats
> for video decoding. Add these to the uapi drm_fourcc.h
> so that we can use them in Mesa, GStreamer, and other
> tools/libraries.

Thanks, this is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

I can push into drm-misc as well, but give me a bit to get dim set up again.

Cheers,
Daniel
