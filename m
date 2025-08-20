Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4F9B2DFD6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3D210E265;
	Wed, 20 Aug 2025 14:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YYu9dhxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9713910E265;
 Wed, 20 Aug 2025 14:47:41 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b47173edabaso1207277a12.1; 
 Wed, 20 Aug 2025 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755701261; x=1756306061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P74cWaI2z7D5zkTAV6WkwACmi9NfYu/QabOQMTjargE=;
 b=YYu9dhxQcqzlaFe4TQUoRpUnbYDUndO9Kr5UEuI2Oyjngp9E7Yihc0vYqxU3Kr9QGN
 omLUg47MHDitkTqpITuPP5otDC3vyzZEM2MWl2mCjYQ3iy2K0V3RtbPTMfvrdrztPMup
 qB8jIrMa/vxEYOg5S53oes8/pHI1N1gXeMz0KORagBuIeDQi+dL/wRee+9515PNcgdA0
 TwrxBbV29F8RwZBOU0hV2fO7eJ2ofm4ODFSGlFx/z2vh4HCaDtqGi9iMAErp59GauXft
 EMvp20wQ8YoNGLphAl/OqT513Cd/cuvdWde7zK3uqe4qrHeWHRuXXX2imCtvp5Ewj1bg
 pr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755701261; x=1756306061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P74cWaI2z7D5zkTAV6WkwACmi9NfYu/QabOQMTjargE=;
 b=uijMwQlM9BZDtqq6iJ/jbkzNK1H6pF2pfs+8qOm+U+u4Kko2xOWZ/ZcraqzdhUXa4z
 P6AwpMHubbfD0phSYrxqCKJFPRBb2J65Yl6N3zpi3tgAC6jTjUSjH9JVQ9IMnbbj8yUH
 Opiv4zIMuqM+QxRxSCE2ZayybMT8Vid9Xqsuj5zXFYvgJ9Oxo7kR4Dyyjk9aY85LplCr
 rwntXjUJdsUaYsPk78T33TZjkTyKFLDOHT1M4F0O8C+5YqrZWft8cJM6s8WG+CtOodWJ
 CSLA6BjBxQPjp/zbHn3cTBPiCEzcOfPz6WBpbJ8tSw/WgQoeClkxW9TAGT/Ug8byG+13
 KVzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq6+ttucv+HnMzl/NNWaAThMQs5w7OT5bz6KcZCgxqAdqLpPOqFOAQv8Bn7baB2/G8mWWCgocj9X8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3c9V7nw5k2mV6JC16BrqpwHaEoQWwa9m/yfrYPo8CLEMBCtNH
 xaipoN9JSzXjpPoD94BcP30oPoa4auwqYccWQpsRuoAsYWLMG5tWqVB2i3d3yRPaLTkS/bqPubv
 cfYKeS/h2KXS7oqYetLf+DaknkSV31Wk=
X-Gm-Gg: ASbGncvNCk/JI36mb3eZCQI3zRvNpfwNWD6AQB05gW8fRujKh2J6mYPtLf88Fe7ikAg
 ETtjJPHKvdWNWbJIdaDrmTufCAYVOgSyaEpD4RT+7vBJQ7wAQoRlX9s66vDEpeJy6mVtBZbzsnz
 Hr8LUjWS1W/QAxmROWiYTI4tydZ96XQM2VQgcrMbUFCitrEKUHCOhZDPg0PUPgb8zLrHjTQ1P+C
 kq7Mp/3kjFN+jFInQ==
X-Google-Smtp-Source: AGHT+IFUNJ9BxglyIJfmA24m4n2cMgP8qB/zVxhLPOKn4d+ZE2WHDRb30TmaMasdJc610kkF0N/8cY8mrV+0HOB+b00=
X-Received: by 2002:a17:90b:4b8a:b0:321:29c4:e7c3 with SMTP id
 98e67ed59e1d1-324e141af03mr2170138a91.3.1755701260964; Wed, 20 Aug 2025
 07:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 20 Aug 2025 10:47:29 -0400
X-Gm-Features: Ac12FXwouonsgjTZxaCzJYBWL0yW-dIZ2_c2VOjUHtNx9Lqxaj97eBQUloKwy2E
Message-ID: <CACu1E7FA-TTeW=cFqdUN+5NZhmU-hphiW--4qyvOgk+5RT5dqw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: A few GEM/VM_BIND fixes
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 19, 2025 at 7:29=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> Fixes for a few issues found in vkd3d-proton testing.
>
> Rob Clark (3):
>   drm/msm: Fix obj leak in VM_BIND error path
>   drm/msm: Fix missing VM_BIND offset/range validation
>   drm/msm: Fix 32b size truncation
>
>  drivers/gpu/drm/msm/msm_gem.c     | 17 ++++++++---------
>  drivers/gpu/drm/msm/msm_gem.h     |  6 +++---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 31 +++++++++++++++++++++++++------
>  3 files changed, 36 insertions(+), 18 deletions(-)
>
> --
> 2.50.1
>

Confirmed that this fixes vkd3d-proton test_large_heap on a750 with my
turnip sparse MR.

Tested-by: Connor Abbott <cwabbott0@gmail.com>
