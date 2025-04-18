Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293BA9356F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 11:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8D610E208;
	Fri, 18 Apr 2025 09:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="DXWEiVOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD7410E208
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:43:31 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-47686580529so18680301cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1744969410; x=1745574210;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kFpo5oEBW5stbppkFOY++LlhDbuxsd6jJIOfBbyrv08=;
 b=DXWEiVOBk5qmVqNQwUKNSz00WO1p9+c7BIqVHYby8eP+J/gfv6ueEZhyeQu9KmoQsm
 wyDn4blAz5dwpZzZ5q/zjkAKRVSLry3tVwvF5ukylRNByHTFDueW2e0GUoIdCv1qcY+y
 TyJWOr/9D9Gr5621MsnN+o7MZy4Tix7FwFyL9IOsHq25pXr3f/N6Nhk2/X82xaAX09m0
 Lr3bvNtmYB4Tv8/wGBpsdelS7vtEwf4cRMEnri6WyZjlwkibB79bgrMhfJupD9SFM7Tp
 EK7L1kphHsfD7wQ+XiKB1O9QSC9tm2M1bHRKUXCuEcz2MtZ0eWWL5Q4hW6OtEOX+BGln
 4DsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744969410; x=1745574210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kFpo5oEBW5stbppkFOY++LlhDbuxsd6jJIOfBbyrv08=;
 b=PJ3j2zg48HOy4WMtm1H5fW/bE9vlhueDwNOOyCTudM7MBUfUC1IEovh2imSdLM6sQh
 byXnHbzDVwXQDCtq3iM1htrvmKCRyj/DFgkF95r4YUSwPP7M6QmedR6y18kagC2K00vg
 dweNDSChYkI2mCf0dp87Dw3gOrpxcBJFi2Cs5oXX+a1j0tQr5Xng0/p9mlnS3aGNMQH5
 yaXF/co4PDMKRxBbF8acJeEdkIKPLMF9ndCR+9KNVtpm/1rXz36mvJj9uyKucwuINv/W
 xU6Fw3cDY+aodUrx4678gWpMe81HMbHi4cxJp/JiPtjF8lIBVctRGwoFGoDVq0m7KxI3
 tXyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH0EMdT8Dy1//E4LrRpPJM4VhiuNG9V3r2peYsWwWu+5n/T9cbGBs9wBNpuBeJ0GmjiK6xrGzBbpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykkDb0Nb4eviQvf43lxr9X+hbozO9Win7Z1XgcF4+zCVzQUV4a
 I3+eA5mCK2Eajis+6mdImKd4rteCXCf5m8GIrB6GEAgxs/upwYmwBNuzIoK2x47QbQAg8jP26tv
 7kI9AQvAyCEOBLR85hmyX4p0cgNoVw8NT6ZEn+A==
X-Gm-Gg: ASbGncvY9PmnNsZbdOtPOMcG0hyoVqsr6y/cTVZrosq2iC/BsH0E/Zziore8Pip//gt
 CT6Ls37MHRhLlcooYqBZHr9rXUuLj3mVkyIxBYkpXilzTYo3Q5/1bSXjNaq3rx2wdO+o7if3FzD
 AgFmec2vQK3iR4jO6uFt7cjB7dy+/j8Q==
X-Google-Smtp-Source: AGHT+IELNPez3z5hE7XPdAn+/JmuPm4/LRceRqb1tqN8GldH7aTJ6b0D5paprWRXm4NnYwwtrill8wPC4uiDxVjoiEM=
X-Received: by 2002:a05:622a:1a95:b0:47a:e53a:5762 with SMTP id
 d75a77b69052e-47aec394ccdmr27568231cf.22.1744969410714; Fri, 18 Apr 2025
 02:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250414095332.9674-1-mail@etehtsea.me>
 <20250417065759.5948-1-mail@etehtsea.me>
 <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
In-Reply-To: <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 18 Apr 2025 10:43:19 +0100
X-Gm-Features: ATxdqUGMyPtODmDTih2v_sR4LqFZ8n_GN4IoaxZBEb6HaOtqp6Dx3gQ7MviTVqg
Message-ID: <CAPj87rNDsyBfy=P=0SzTm7u6Na6BpeZSpEt1mRPhLCd6rHXzTA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
To: Andy Yan <andyshrk@163.com>
Cc: Konstantin Shabanov <mail@etehtsea.me>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dan Callaghan <djc@djc.id.au>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
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

Hi Andy,

On Fri, 18 Apr 2025 at 01:16, Andy Yan <andyshrk@163.com> wrote:
> I prefer the V1 version PATCH[0]. This is because we do not deal with hardware-related
> differences at this level.  It involves a VOP-related restriction and we always  handle
> limitiation like this  within the VOP driver .

As said in the review for v1, this is not enough for generic userspace.

If drmModeAddFB2WithModifiers() fails, userspace knows that the buffer
can never work in that configuration, and it should fall back. If
drmModeAtomicCommit(DRM_MODE_ATOMIC_TEST_ONLY) fails, userspace does
not know that the buffer can _never_ work, because the failure may be
transient or due to a combination of things.

Returning the more localised error saves userspace a lot of work and
enables a more optimal system.

Cheers,
Daniel
