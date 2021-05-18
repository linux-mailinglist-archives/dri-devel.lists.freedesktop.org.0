Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B0388226
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 23:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3CB6ECB2;
	Tue, 18 May 2021 21:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8E16ECB2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 21:31:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u21so16758698ejo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=veMfG6kwKtjGfJk6CkECwMk0LnoYrS9PYsgFuQgGNNo=;
 b=mARpTPBbZ9aaAj6af4Ph+av/wITZP1I2JAN/uh/ZFB0Kak/rKyNrSlAT1XDsqjZO6x
 w2Ofvqkfhrqc94Mz2G5PF4OLteFtdHHMgAAmBXtaIBCGiq+w9A/06Uw9jSbGm1Xc0tp0
 1jOUFPVCzrza7vmmhpW47L8RgtUbqqjf/iEopo19C3g0nrc3LYPVQBhJyznKQx/LuM9T
 5rM7flKSlOIqd7505V9n6iUUiF7MQJf+6sxl02fb2XPw3XYDQBth1w4nU4TlrZXOWgFt
 SaPjb2K57xfQGWJjdgO5mZcC2QiUca7LuEEi1qeWSLEBqsGGT89ApaH6KZHZj23WrfiY
 iMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=veMfG6kwKtjGfJk6CkECwMk0LnoYrS9PYsgFuQgGNNo=;
 b=l08WGnWC4HVt5VXZpadk6SytV523wxtLYa3bxJBLu3Pke64n7W+onrL5/5+9s7EQnS
 ulthlEZ8POYXaQH8ZoFJZ2+Uqx2/GMD0qYz+pj+dFA6p9zEOuBiqa2bGWQ/Zm5KFy4lU
 AK3AGe1ekvd6jva/OX32BTdImT9oHCPszzfi9CK7Yt+RHDuw4aP4UaMLxI7A4/izcJNl
 yFluXHjlfQQkpAWBul9E2mdVaeecolsyvTe+yTBrXqzlBg6x4g52nCFbak8MDQxivzeX
 GbUI/bnCGPvTx44yw77tOv/7tFh0yAt4iQQN/GIWXb7aA6ei7+OnQTQvNDEG079ljBXn
 DdXw==
X-Gm-Message-State: AOAM531ecAsncsjntFTZAbHLouFytU1psXzqkSCJ4H2+Y/0zIDBE7Lc0
 w94WX1JxlMQF5UNOWqRSl8Nm6o1Ocld9yOe+WHb+OnjS
X-Google-Smtp-Source: ABdhPJxglJopJPVJeBdJAibx2pLncwgknWUSIbigd+ipMvPXFO+JmZfx1w+dU/BvPykLB89d5NTB0UodnOwsVCtUBGY=
X-Received: by 2002:a17:906:6b96:: with SMTP id
 l22mr8027647ejr.456.1621373506979; 
 Tue, 18 May 2021 14:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
In-Reply-To: <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 May 2021 07:31:35 +1000
Message-ID: <CAPM=9txtjS1UNRVjcWvW4JhwggOaZ4rwgbvCvWv43-eYEBt5gA@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> We basically don't know during CS if a BO is shared or not.

Who doesn't know? We should be able to track this quite easily,
userspace either imports or exports buffers,
it can surely keep track of these and flag them.

Is this a userspace might lie to use worry or do you have some really
broken userspace we don't know about?

Dave.
