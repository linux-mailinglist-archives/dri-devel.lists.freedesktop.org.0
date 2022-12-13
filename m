Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678FA64BDD1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F6810E1EB;
	Tue, 13 Dec 2022 20:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8009210E1EB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:14:34 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id z12so823973qtv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 12:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fKMoGrNnuOijjqdWvmZKOjtUthKrCgRAryxHWgKTvTI=;
 b=aBrYrRL2ar8mCkjH5k3/E9EPWTrWLDai93bT53U4cmelzM+QccMJRV/sHCAwQtsWX2
 YP9rN38/TYWaaEgUr6x4g1dHK27Wamedi2WQuzttxWDpjhtLhul8RxzdW6ihBkoX+7uy
 7EaTaoM8+GYmKmjTjefxq9yBpCoB52EvJjsOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fKMoGrNnuOijjqdWvmZKOjtUthKrCgRAryxHWgKTvTI=;
 b=GOmcSZpHa0ITvI8odbcY3vdqq33V5km6xFi/GDsaDEFMSU7xOkY0Lx6yyCNiFEYWOk
 f2q2pTpGyJZwWtGYC6QBDPy1u0fRxLN4mTBy0zi98ij0XXyntbWQqBwtmm05lRBQv4oA
 b8XMJ72JK1pnIDJ9n/IBTLQ2YZiAwWFyQV2fx5fD/FV7NiTzZS6yTY6NawBALCRKW8Ys
 4+7SEPOEBmk9iJpvfSgokPg+ENxbINYOq2rcW2s+tQyHGO8fUYROOGPwuauvvY2zTfJk
 biCwtLE/DDCgP8qcx7CnKyCCkVKZO7UM1hogouT/nP5TG8AUwzJb9YqnKboqpEEJ5dkp
 fogw==
X-Gm-Message-State: ANoB5pnSpKZz8vFH6ikwawwd4TrpWW2zzAgKHDa1ECzBq7MUbe/wsEqH
 UvH883GpimOsv9mGLvLIeCxE9DYNC8gwpinW
X-Google-Smtp-Source: AA0mqf6/yrA5X5f5BKVhkft+O7e25XP+Z/uY7VmrZ0fL3ZfW6m1kt7U5hGkS/cpbOe0l+9BAmUuqAA==
X-Received: by 2002:ac8:66c7:0:b0:3a8:a84:7ffa with SMTP id
 m7-20020ac866c7000000b003a80a847ffamr17977979qtp.57.1670962472921; 
 Tue, 13 Dec 2022 12:14:32 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 k10-20020ac8074a000000b00397b1c60780sm417624qth.61.2022.12.13.12.14.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 12:14:31 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id jr11so810923qtb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 12:14:31 -0800 (PST)
X-Received: by 2002:a05:622a:5a87:b0:3a5:47de:a214 with SMTP id
 fz7-20020a05622a5a8700b003a547dea214mr71128740qtb.304.1670962470979; Tue, 13
 Dec 2022 12:14:30 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
In-Reply-To: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Dec 2022 12:14:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=whVsxgtwvnK2=WRvs_i+miknfB2R7dQ4U8oooBFJZYH6w@mail.gmail.com>
Message-ID: <CAHk-=whVsxgtwvnK2=WRvs_i+miknfB2R7dQ4U8oooBFJZYH6w@mail.gmail.com>
Subject: Re: [git pull] drm for 6.2-rc1
To: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 6:56 PM Dave Airlie <airlied@gmail.com> wrote:
>
> There are a bunch of conflicts, one in amdgpu is a bit nasty, I've
> cc'ed Christian/Alex to make sure they know to check whatever
> resolution you find. The one I have is what we have in drm-tip tree.

Hmm. My merge resolution is slightly different from yours.

You seem to have basically dropped commit b09d6acba1d9 ("drm/amdgpu:
handle gang submit before VMID").

Now, there are other fence changes in the drm tree that may mean that
that commit *should* be dropped, so it's entirely possible that my
resolution which kept that ordering change might be wrong and your
resolution that just took the drm tip code is the right one.

Christian? Alex? Can you please double-check what I just pushed out?

            Linus
