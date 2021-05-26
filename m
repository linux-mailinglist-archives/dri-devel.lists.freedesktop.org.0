Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAEE390D5B
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 02:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846286EB91;
	Wed, 26 May 2021 00:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBE76EB90;
 Wed, 26 May 2021 00:36:02 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k14so46650605eji.2;
 Tue, 25 May 2021 17:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y5MMfJ/ySSUltKMUiPtJcOuxUuoxT1EBY0Rwedl2dhk=;
 b=IoVeiVun6pWtZgw/hiGSwGnxPNdt60msRXno7GEC/lMInQfxkv1A8xDSl/mlw/6xan
 uXpFwKRwLPM+Bn0K6HY6Wznw3hYGRDCTzEcfIcd0JtItkxZgYFrK7drPQSD+0KKEsnNC
 wr50SzXuxQHU5xjAGCV+2LPpGPN2VPiFx847p1ihXSM+K2z8zxp4fu0UfauB4F3o8tzL
 nKgOGT70sn/lS4dWx+ZMxI6lcRrY0aRNXhHq3TYhW/MmhpX8XAOsCuXbA/G/0JogotLW
 PAYWQCRTmLYyCY6pSzd0YWo/EHTU67DR/VJn9L9rH0MT9GfHr8EVhidosKUBaD5m3yvL
 s4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y5MMfJ/ySSUltKMUiPtJcOuxUuoxT1EBY0Rwedl2dhk=;
 b=ZlRxGVhcB/3rTOc9NsEvGgmn5MWQWtPWJ1dvEJgrl9V/6FmBRKVXOCJkHYyX8MYuGR
 UOzkCLG9dmvnEADtXH82NFfreLzoCo9lnI443CXgB3BU5sg4P1Tg2Wca6IFZQ4WlTOBM
 Mm4fimaX88f46U5wSkd8BmMhVOE7C/HYhbklmEMLNiy4AJmBjLGHdTyTJ+PghAIxA4oI
 7Z81Y1GN9N8VszHhxnVvQ7UVFMBwlyFRqQEyfCZI3DmOOju36alZ1LgMBJ0F35ZtSJUr
 XszmQzOsKHum+WhidXGWfkxyZ6Q7bShAWlcIPZ8TCBvF+djOBvNFGmnmgWP2S4Cxt9e8
 GIwA==
X-Gm-Message-State: AOAM5320mUjO1MwKoF0aadpJsHXoSL4eaFZmJ29CaI/kiKag2y57Toj+
 imhQa7YBAx/XV4SNY5/Tp1zOw/cR8adTqfWcA94=
X-Google-Smtp-Source: ABdhPJw5YP6gn5ujlbdeQ5mhz+XQTYTH858RjzZnpuhmAG03wDv1aSHglvjBCuLrwa9HfLUdhBVaI6SAaTEgpRTL/jc=
X-Received: by 2002:a17:906:1496:: with SMTP id
 x22mr31769041ejc.419.1621989361060; 
 Tue, 25 May 2021 17:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210511083139.54002-1-zbigniew.kempczynski@intel.com>
 <YJq5OHIO8ThIiKCz@phenom.ffwll.local>
In-Reply-To: <YJq5OHIO8ThIiKCz@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 26 May 2021 10:35:49 +1000
Message-ID: <CAPM=9ty84uK-gT3uXZXGOEFno11SBRUh=btXb-B7OYUmnGiRoQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add relocation exceptions for two
 other platforms
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 May 2021 at 03:05, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, May 11, 2021 at 10:31:39AM +0200, Zbigniew Kempczy=C5=84ski wrote=
:
> > We have established previously we stop using relocations starting
> > from gen12 platforms with Tigerlake as an exception. Unfortunately
> > we need extend transition period and support relocations for two
> > other igfx platforms - Rocketlake and Alderlake.
> >
> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.co=
m>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
>
> So the annoying thing here is that now media-driver is fixed:
>
> https://github.com/intel/media-driver/commit/144020c37770083974bedf59902b=
70b8f444c799
>
> Which means igt is really the only thing left.
>
> Dave, is this still ok for an acked exception, or is this now leaning
> towards "just fix igt"?

Oh that isn't great is it, I had thought it was the media-driver,
keeping a big uAPI like this open just for the test code seems a bit
silly. I get the tests are testing more than just relocs, but it's a
pretty big interface to leave lying around if we can avoid it.

Dave.
