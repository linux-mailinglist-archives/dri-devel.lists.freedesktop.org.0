Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFA533A61
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 12:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1010FA3A;
	Wed, 25 May 2022 10:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F3B10FA75
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 10:02:53 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-300628e76f3so2167127b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=skKBBfRRYXuRwhVe14kFlLzu87bgRcs/M27aCLh7cT0=;
 b=KV3iv8mN1U9PD2MgO0clViBbO7grBKtAf1sdx/gYalWA1iFCHF1rWM9EtZ5AaqUn87
 hlfhxzvnbcjNlQkI6iOK8UPvb86iRRGHQMKMqV7IiW7RNKB+BvDDNBqyr2DcvyWz8j+0
 P9unwGUtyETg/k+yrogTmgyMn3+zmgJt08GOYRR2aIcN5Lit5tfdOz0DbUsUPkuglDcP
 NrrL8NoSzraWfZPAZsZz101A0wYxwQCrfgA/wQoeJBA/jV/GuDkyfafywqqbUuooHWyN
 qneNtJlnLPqsvLyoANxldYOP4FpqsNKTDa3kgsmW0z5E6dhbRJTR31Aaq+yM5fE/HQ3m
 k43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skKBBfRRYXuRwhVe14kFlLzu87bgRcs/M27aCLh7cT0=;
 b=Oczb0PW/Hw59m+/CboQO91el6AKIjbiVtPg5Ti1iE5/T+1Ju6D62KUJFdEs+kDVDuP
 44czhD0S/xK8gFxigsN2IrNb9d+83gsgBkmg14JRlf6ECRHr1MsVeEnUsw4wVnGgg2nz
 h5K9F0D/q34VDe2PhEc49vqWrk0v6G/HoutkwXCTv7Czb7ZYeb1/6cvOLVttRcFdwvC1
 1EICr7az3AL+rf2N6jpve19mVCXDu3Kvj68abOBjuuqOuuf49ZCz+jHkCNMdvZpnYYW9
 Ltffs1jbF+HmHuc1eFOKC0gPCYL+mrMhzosymHgyyCyp94ZK+rC5zzDrOk3tqmUBT1NP
 2ggw==
X-Gm-Message-State: AOAM5301/c4HHn/H7sUXoxSice7A+4SXzvzcGOvqzXVJrvuESSF4wHcv
 c6MbpupGmkQNnL+EdZr7rSsV/Ff+k5ToM5SvOkNa0DS1sgA=
X-Google-Smtp-Source: ABdhPJzziXniEKQCdY2ls5XQiLE2Y5EBNEKVuIkTTTCfnyVvXJ+nEtXRxIY+lo9NXc/q+Wc3G9TAugIGBAP0Bj418c0=
X-Received: by 2002:a81:e4b:0:b0:2ff:7f18:8cd9 with SMTP id
 72-20020a810e4b000000b002ff7f188cd9mr26232292ywo.268.1653472972923; Wed, 25
 May 2022 03:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180216.2095060-1-jason@jlekstrand.net>
In-Reply-To: <20220506180216.2095060-1-jason@jlekstrand.net>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 25 May 2022 11:02:41 +0100
Message-ID: <CAPj87rPwx6tL5NtcmP=589wWCyKvZpFfLveaGtsd2wcyCh-1=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] dma-buf: Add an API for exporting sync files (v14)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 7 May 2022 at 14:18, Jason Ekstrand <jason@jlekstrand.net> wrote:
> This patch series actually contains two new ioctls.  There is the export one
> mentioned above as well as an RFC for an import ioctl which provides the other
> half.  The intention is to land the export ioctl since it seems like there's
> no real disagreement on that one.  The import ioctl, however, has a lot of
> debate around it so it's intended to be RFC-only for now.

Errr, I think we're good with this one now right?

From the uAPI point of view, having looked through the Mesa MR, both are:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
