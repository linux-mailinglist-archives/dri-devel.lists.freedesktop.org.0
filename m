Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B93A9EB74
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 11:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FBE10E3D2;
	Mon, 28 Apr 2025 09:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eVL+xo2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E202D10E3D0;
 Mon, 28 Apr 2025 09:06:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so2569084f8f.0; 
 Mon, 28 Apr 2025 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745831211; x=1746436011; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vrP2CkY7EdRWUrqip7eV8X83IUPU9ETL4wnHODJxb2w=;
 b=eVL+xo2PF1dpOqm8Yi2X0PNXiEn5IRGV0KBkwjuWWnot4jSXDf0VSCum4GSHWyn9IB
 Osjg23CRZfPKN0GMxkdJsQIF3OU6V2fB/qD9Raxx3dBfnfN1SUkrLr7hQZIdepK0Zj5V
 15IPSpkTSSp4RxbfmqitPY3pm5RCzRXAY0yo/EmT7H4K4qZud8f9dPI8L+vDsyM7RFqd
 5tre4OWjnkLxwKGE1vU0QC0hSfxZ+ww93IzklqeiU1nWXpIQFg2ZJ0FffnYSzA7F6B9S
 9WcVTiBa2IrwghfhmgMCS6MUB6yZy4H7MOLhWo/whfIarHtCPTQJviLuaFMNkmMJmrxu
 pf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745831211; x=1746436011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vrP2CkY7EdRWUrqip7eV8X83IUPU9ETL4wnHODJxb2w=;
 b=ayuKnMJnJU+w7vrkIr4KNfHpmp0k/P/NeZq7+PUJmcNOXP7WEm9MkcyUP4MX4pW6s8
 3ccV8T95Z6rA0RbIRU1/ZYoMsYM+Hr9dPwa9UuOb4cUF+8Uj/pPGEGnsWPSfEVnCu3iI
 8a6R9Qrf1rba31ItksW3FF71cxN4acKVUNeRx29MChPBUcC15n7oKaC/7Z8XD9lZwll1
 iKZEGUDzkzkgesUQA2CyDW9OhSTBVDQHVMRbgJmXWbtQBEEThyNFRp0PCiI2CP8q0PIw
 NlnN3UMIJ66LTwPhu2fUS6V+MF8AnE18MoDMWuxfQutuWVRYLtIwnVdqmdaXvzqxcSww
 PeXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy/DTkzBYj6S8J16lTwOZ5q+VrmBo9XDC6nmecA2GU7iBx0yuH6P5Sx6+UmSqk95z0D9c30CAiBgs=@lists.freedesktop.org,
 AJvYcCX9OhV/Zn3b7JRXh5oRjbcFoe+8HAA1haBKwt98rztaeTsa1r+D9UWFg+VFJDFLP8sd3Ndo60HWCoqa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDzMgehECnm3i6f5QNfQkQXyioONyReTGHuk5NrBQt+rYtrYM9
 7aNYK99bgFb1Lt8XpIYemeegAe+K5VkiETDer/X2G9QwEjFKdr3d4785QTnxguHLaaRCRbYOE5s
 k33dMaHr1d+6rakAFFCRAQTuHFQ==
X-Gm-Gg: ASbGncsthE2dmccT4TXvgjYL4Tk4DiLOMX/xuJZDYMPOxhXHLE4KVJmLq6BrnbwjA0U
 m67J5Yp1FZXeX35K7LFzAG7lL2ZoQV1AdtDxCvsdQXT9q2ONr+3jlglyyQfD1LYaYeBxl/KON5t
 BEJnKjpwj+BN2v6DeY1mrT/A==
X-Google-Smtp-Source: AGHT+IHd5cOvjdSZ4jvtyMnwviGdePLYjYKhf+NbtpduvF+uiSPCjh2ycn+8lgcJGcQkuWFGpwfb0lxDvsulR2tTh74=
X-Received: by 2002:a05:6000:22c2:b0:399:71d4:a9 with SMTP id
 ffacd0b85a97d-3a074f7f22amr8908857f8f.52.1745831210949; Mon, 28 Apr 2025
 02:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
In-Reply-To: <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 28 Apr 2025 11:06:39 +0200
X-Gm-Features: ATxdqUE21e2Yp75-k_wyhiJlMRQ-z3ZtLT7itOJ8xGoFly7x2Ai_IKkUtx-RkD4
Message-ID: <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Johan Hovold <johan@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org
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

On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > to non-transparent mode to enable video output on X1E-based devices
> > that come with LTTPR on the motherboards. However, video would not work
> > if additional LTTPR(s) are present between sink and source, which is
> > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>
> Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> adapters or docks with retimers in transparent mode?

I am actually not 100% sure.
- If without LTTPR initialization, they default to transparent mode,
then yes, incomplete LTTPR support sets them to non-transparent
without per-segment training and breaks docks with retimers, while it
would've worked if LTTPR(s) would've been left in default transparent
mode. Note that in this case, X1E devices with ps883x are somehow an
exception, because without LTTPR initialization at all the training
always fails.
- If LTTPR has to be initialized either way, and explicitly set to
transparent mode if we do not want non-transparent, then no,
incomplete LTTPR support in 6.15-rcX did not explicitly break docks
with retimers, as those never worked in the first place. As per my
understanding, this is the case, unless something (firmware?) has
already placed LTTPR to transparent mode before the driver takes over
- then 1st case would be applicable.

Docks with retimers do not work in 6.15-rcX, but I am unable to verify
if it did work before, as I do not have a Qualcomm based device
without LTTPR on the baseboard.

> You describe at least one of this patches as a fix but I'm not seeing
> any Fixes tags or indication that these need to go into 6.15-rc to fix
> a regression.

You are right, I will add Fixes tag to the 1st patch to make it clear:
Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)

Or should I mark the entire series with Fixes, so that the docking
stations with retimers can be fixed in 6.15 already? Landing only the
1st patch will fix inconsistency with DP spec, but will not fix
docking stations with retimers. I guess this comes down to whether
existing LTTPR (but not multiple LTTPRs) support is considered a bug
(and patches 2,3,4 are a fix) or lack of functionality (and patches
2,3,4 are a new feature).

>
> > Changes in v3:
> > - Split 1st patch into 3
> > - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> > - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
> >   are link related, not panel related)
> > - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> > - Droped Abel's R-b tags from 1st patch that got split due to high diff
> > - Fixed alignment issues, initialization of variables, debug prints
> > - Moved lttpr_count to avoid ugly pointer
> > - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/
>
> I tested v2 due to the dependencies in msm-next and DP altmode still
> works on my X13s and T14s (while not using any docks):
>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Thanks,

Alex

>
> > Aleksandrs Vinarskis (4):
> >   drm/msm/dp: Fix support of LTTPR initialization
> >   drm/msm/dp: Account for LTTPRs capabilities
> >   drm/msm/dp: Prepare for link training per-segment for LTTPRs
> >   drm/msm/dp: Introduce link training per-segment for LTTPRs
>
> Johan
