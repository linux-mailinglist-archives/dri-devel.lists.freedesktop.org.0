Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975C759917B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04D910E00E;
	Thu, 18 Aug 2022 23:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAAD10E00E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 23:47:41 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z20so3731324edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 16:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=lkb4FCp7JzVDn63aFAKgVGnJumxydf06VihmAwdehNo=;
 b=F6veyJahgM0RgNyP6r0GXHFIAwfoHUUcIvbdeNkjvKDLvG93e1MrKLc9qW7KjCuJaQ
 DGZHDu4SOsjVJ8lj20BJS1hdEGAOzxwsnzifIG6PmXzFBJdnLhkA0kAchF71Mw5JD6Wt
 uPtXBVsICOQvy3+6KmOc5ifi/V+0hVpvfiaPR4PKHZiXTDWYV8olDcTuJgUoo1ln7hwA
 v1UqM/kofmeBR9vzFNIwAJcNuwjvpjBSpp7tF+2DGMuK1MTL+7y77jeRmoJ9+4yeYpiA
 pldPjAxqv4dy76gFKET2Dmvo2DnObwslZoYd4XEFXGICOhBRofH0WFRzAEQucnjWF7J1
 5ufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=lkb4FCp7JzVDn63aFAKgVGnJumxydf06VihmAwdehNo=;
 b=rMRd4ZnFdeoc2BK0vP6muGhhdT2HAZ59exAO0c7TNNVLWPnHOcKRJQT32uqjyAKDdI
 rO0PLKSbmaVYYidRiHuL9hjmvfAbsGqWy+Pqdrq1WCZV54gRAwchzNYEN1MQ6PjuFI2Q
 Yd1cLxFX58COvRJmiaPadQHewsO/6O8D5Y0qrtpGsjsUSzGoqirXHFg27lwf1U/kHFqu
 BNmxsqM4uJ3RtFzv2UiNMRfgh+WVkeM1ZYp2TBZXeQTLtVczz7vvnHs6NIMcRI5lUv/c
 uE8eswN1QOADmDfAP6QPo2cRrK7IJKJ066sKwSh7YsMVGmruLBkPBPCBFgvr0FmzMPpq
 nfcw==
X-Gm-Message-State: ACgBeo0z5TuQwqGMApUaMm43O9kr+w2HmKQ0i5aYc05uQjEpdN2vj/ny
 LDEsv71IWNKQvhFxsTki2Ivc2FGJ+OG85+t5PBFfqcTvm7w=
X-Google-Smtp-Source: AA6agR6VC8ETOy2JdDfh5lev9U2Dzt/9JV2x/eJWPW7KCStn+0G8jL+YTaCxhwCZN9W99VU0Ql41YgDcEa68t4wzUHA=
X-Received: by 2002:a05:6402:22b8:b0:445:fb3f:dc3d with SMTP id
 cx24-20020a05640222b800b00445fb3fdc3dmr4022082edb.378.1660866460219; Thu, 18
 Aug 2022 16:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220817211236.252091-1-michal.winiarski@intel.com>
 <cb4263a0-c5bb-bf27-0e06-9b62eff2d1c1@riseup.net>
 <20220818161953.2kfwu5vrfpuf57kx@nostramo.hardline.pl>
In-Reply-To: <20220818161953.2kfwu5vrfpuf57kx@nostramo.hardline.pl>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 18 Aug 2022 16:47:29 -0700
Message-ID: <CAGS_qxqYTOWrmDhJ_icb2+17-P2ng+ZFPTur-GiOpSB=TVfaaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/cmdline-parser: Merge negative tests
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Arthur Grillo <arthur.grillo@usp.br>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 9:20 AM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
> Already did that - s/passing negative cmdline/passing invalid cmdline.
> The tests are still "negative tests" - in other words, tests that pass in=
valid
> data, and expect specific error condition to happen. We can't use "invali=
d
> tests" here, as that has different meaning (broken test).
>
> We could expand it into:
> "Tests that pass invalid data can be expressed as a single parameterized =
test
> case (...)"
>
> Would that work? Or should we keep it as "negative tests"?

Just my 2c, "negative tests" was easier for me to immediately grok this pat=
ch.
I'd prefer this patch as-is ("invalid" in the test names, "negative"
in the commit desc).

But it is a term that some people might not be familiar with, so I
don't feel too strongly either way.

Daniel
