Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1733720EC14
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 05:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F4789C98;
	Tue, 30 Jun 2020 03:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6E589C98;
 Tue, 30 Jun 2020 03:35:50 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id rk21so19008244ejb.2;
 Mon, 29 Jun 2020 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aJmSmwrsaH1bBcOCXi7RMW99NT7rqTSYgM8PKCwsCVQ=;
 b=qDEvnMum80gV5DvWSU5LwQhbLXk5TfinUIQ/IMpus0k6Rw+VScCW9Yv1HA7db8lJ8E
 sS0nOnrkDYcOTrQ7N55qSxOB+vBYLLNN5+f7ee8WhBC0DIvpmoujM4v/TXmTo7RCb211
 b1qW0H1YU2AGgcLuswKtS/A+kAdIrTbKnNhRGaOR7OEuN40xea79yJxzoSEIn4rUmcK1
 xEt1v/X1I1X0FDC2+42Q7u2bczAIjNLPly7sSY/lwpdQnDpYdUXfh3olM3AQeJaHTqfE
 SFoebc9xy3rDlLgua88QRc+TiL/NDg1ZZezu+PnwlPtUY6LOIeCDthEY5hSDFQkdcYYh
 houA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aJmSmwrsaH1bBcOCXi7RMW99NT7rqTSYgM8PKCwsCVQ=;
 b=onPc57t8Nm1PKG7SPvB76lrDxpVQA9OpMo26WdZO2kR38lEFI22ldCm5cowYk8ET9+
 hdlfzho5938bd3bT9ck/5NX/TzAAIkYfhJdKJTbiD99rdaejEmH7Sc+fW3Qflp1YrM6H
 IDYB5ug0G1ICH7kYVQWXsFu/m4JSyU6vgTBFfNGVmE1pSbr2snClV+mCAGWqDsTDPxdt
 iLlEtm24syABKKRbm7ICirBX+8LWBBQmwI5v1VVf96m97LSP36/Ups6JqoNzLsBzinSW
 x6oqWtDZQgmfmT5rWc1ekE4RecGOCCjnRVx6ZCcEGEhk7DtTINgI1HaiR6ij+56Es1ev
 A3Kg==
X-Gm-Message-State: AOAM530gNpMl37sq0wDpSZH3UG2Msin4/TNXsTtChkQvJEC1afPfEjEt
 Ar19EueqJkuk54MzVmiCyfcE5s/hk9nIDnHi62o=
X-Google-Smtp-Source: ABdhPJxIln0jXR4HaSVjKUP56QmC1imF/pnulXgJu7ASsZsBlTWTXsrX/u1Fk9SDVfSNOKBCkCqdGImbFFK86KhXx1Y=
X-Received: by 2002:a17:906:ca4c:: with SMTP id
 jx12mr15323864ejb.231.1593488148574; 
 Mon, 29 Jun 2020 20:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200629234921.3511-1-jonathan@marek.ca>
In-Reply-To: <20200629234921.3511-1-jonathan@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 29 Jun 2020 20:36:18 -0700
Message-ID: <CAF6AEGtEbAKo21YNMrV58FWiXSSKR7odycXYp=cW9Mso=qFATA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/msm/a6xx: add A640/A650 hwcg
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: Sean Paul <sean@poorly.run>, Wambui Karuga <wambui.karugax@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 4:49 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> Initialize hardware clock-gating registers on A640 and A650 GPUs.
>
> I put the hwcg tables in adreno_device.c, but maybe it makes more
> sense to keep them in a6xx_gpu.c? (this would allow switching a5xx
> to use the gpulist too.. it isn't possible to include both a6xx.xml.h
> and a5xx.xml.h in adreno_device.c)


yeah, I've kinda tried to avoid "crossing the streams".. maybe these
should move to adreno_gpu

BR,
-R

>
> Jonathan Marek (2):
>   drm/msm/a6xx: hwcg tables in gpulist
>   drm/msm/a6xx: add A640/A650 hwcg
>
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   8 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 140 ++-----------
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 219 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 +
>  4 files changed, 251 insertions(+), 123 deletions(-)
>
> --
> 2.26.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
