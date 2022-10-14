Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333A75FE62C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 02:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DFF10EA19;
	Fri, 14 Oct 2022 00:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639A010EA19;
 Fri, 14 Oct 2022 00:19:31 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ot12so7339186ejb.1;
 Thu, 13 Oct 2022 17:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YLUuEPbeHwPmQyYJMc73Q6jKpll4zmH7qmymoNKBPY8=;
 b=MDuWDD6o8ZR9Bgi3eqLk6EOdwaCfN8Eq7bbHZRgmQPrK8zE+sqSPh22Ar0bmDxG0Rv
 LKUp0DPSaWOG4LDRwB00jA2xXWeuPJine//GuOKf5cBC1u84YoM+tPQhoVlBBPEpN0bz
 M5l6FSQZ/usN9GLAcTv+JpVtLFq/LbffMHnigGj4FrkveUAg2Vrr8Ttedkz32fzoduu7
 QM/WwTgA/pPqmM/+N2N6rlF43yLzkYq5bCWzKjjgm+f4fiEzY9in0WszAw8zGPbqMCZL
 0hCeNWv/07qBM18kl7HY1zBi8QqZseeV42GCgPxb4Xylq9Kx43mlLL4aG0rGuLDCiIn9
 eV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YLUuEPbeHwPmQyYJMc73Q6jKpll4zmH7qmymoNKBPY8=;
 b=WvvLfw+O66Y9HM1rlWvz6+Whv88b4fwysimQTZl7KIlijrd/dETrctcFMNWCJH6IHf
 S8qM+FlZxr/xd7rxFhopyXn/Ql/qOLm15ibNW9b5MBHSCPPzGVj5L/hee9k+M+EBO9u1
 pfOEULIu85NhparqYIQz4oKRgUDJDXZTVH3cZ1yBFm6iqf9p9caqLMDvtj/JeroAt2Zd
 n2gEUTGIQT7u2ElTx4N9z81Rvk4tmkjWPttp8wuI1CC9RlU9XBXULQ+FA5a9KLEb5Z5J
 wXesNIkdfqkcDEHD6/0VfDXUPXZ1mZ5DpJIY1Q76e6AdrkFeRO2V49ubLtKELZLRqvPr
 ko0w==
X-Gm-Message-State: ACrzQf0/Kc+h4BpDdmlIAAWYglUmfc2MYJgJt3VD5NWsmfqygZ4UX/ff
 Ms6fAiIO1GZR+vSePpwVvWDm/iAingp73U2eQUs=
X-Google-Smtp-Source: AMsMyM4kPG7TtZnxn8Yo16eNXuFfUTOnLoHMOQilmDGRp4LO6S7BrxEk7p7tyizz3Ox6+tGDFEUmZku3Q0T8FO9NebU=
X-Received: by 2002:a17:907:a052:b0:78d:8531:92b with SMTP id
 gz18-20020a170907a05200b0078d8531092bmr1674708ejc.37.1665706769713; Thu, 13
 Oct 2022 17:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221013225520.371226-1-robdclark@gmail.com>
In-Reply-To: <20221013225520.371226-1-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 13 Oct 2022 17:19:18 -0700
Message-ID: <CAPaKu7SE+Vh9rW6MVr8fCUdrJM6f7O1ZOfSPFdzRaw9TjpG-FA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] drm/msm/a6xx: devcore dump fixes
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 3:55 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> First patch fixes a recently introduced memory corruption, the remaining
> two are cleanups.
Series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

> Rob Clark (3):
>   drm/msm/a6xx: Fix kvzalloc vs state_kcalloc usage
>   drm/msm/a6xx: Skip snapshotting unused GMU buffers
>   drm/msm/a6xx: Remove state objects from list before freeing
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 18 ++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  7 ++++++-
>  2 files changed, 22 insertions(+), 3 deletions(-)
>
> --
> 2.37.3
>
