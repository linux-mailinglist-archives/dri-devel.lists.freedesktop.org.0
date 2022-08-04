Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805D5896CB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 06:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B5F8AD17;
	Thu,  4 Aug 2022 04:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF83810F455
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 04:02:50 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m8so23723777edd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 21:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=PnuQJw20lFgf6lictocgrukbVyZz4GO4xw4KHJCExoA=;
 b=IHZhJYNYi4waXA7SLGcJwbFPPDe49qbv1kLm01qI3ZZ3Wie5Sn3rNuCtwGyTiq07if
 z+6sN2Bf6t3RgFc21xyO8Xp07JoaVwfVQQtrNX8y5DWsZFj6IV5msPJ9lmA3zweOkkYl
 76tUFnCugJUi8gTv+vtcSxCfLMwgD7HnMjQIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PnuQJw20lFgf6lictocgrukbVyZz4GO4xw4KHJCExoA=;
 b=B862aFb/HfbnwI2PyyDrewB+DLgtFWAGj+oAycX3XuM6LDqImZ8oIefiouGNWi0+7z
 0c3kpBaJDcVm362TRuHP0OIbYrkfePLjnNW4kZIPuuACtoJmje7pv0Q0iXNsXWr1zmQ4
 uxNQH0bd88cc6tNdCDWGoEa6nUGF5JXybUwUAQPLyCZ4ptJz8kRNTEjnIsaKPoh6xMSe
 8KSE9fXsQiA8BZ3rVeeIvoKcw0+KOiO0KxWHOZAob0OkvLmMGpBxmQFWFiLLskOUXfUb
 QDy4EKnCDSpZNQB43cyWwZw4hJXnUpBimxG/N7qZZf7bdOdfVXUZIvXAxa4OFWhxyZbI
 qxUw==
X-Gm-Message-State: ACgBeo39nTZB49YUoggqFUdeZwN4BrrdSCcR61B6QU+7Mwjrcg/lKSEF
 EBiK84BI349lszFZaCZrQiqktQ4OjeoO/rQc
X-Google-Smtp-Source: AA6agR7A8ECD73XwWAVn6jvnBD4qfza85QCJTiOMLVfQ7ZvSRfB7OqwRKuc1XvNQzAPpwlPXavh7Uw==
X-Received: by 2002:a05:6402:177b:b0:43d:64c5:7799 with SMTP id
 da27-20020a056402177b00b0043d64c57799mr6098edb.180.1659585768714; 
 Wed, 03 Aug 2022 21:02:48 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 z11-20020aa7d40b000000b0043d7b19abd0sm13891edq.39.2022.08.03.21.02.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:02:48 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 j4-20020a05600c1c0400b003a4f287418bso1748288wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 21:02:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3553:b0:3a3:2b65:299e with SMTP id
 i19-20020a05600c355300b003a32b65299emr4550604wmq.145.1659585767868; Wed, 03
 Aug 2022 21:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
 <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
 <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
 <CAPM=9txkjJg5uArn1ann7Hf+JFCukQFGwqv+YHAx97Cdxezs_Q@mail.gmail.com>
In-Reply-To: <CAPM=9txkjJg5uArn1ann7Hf+JFCukQFGwqv+YHAx97Cdxezs_Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Aug 2022 21:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWcektQzPJgSPa2DC3wMPxgLh8fJVQWeo8i99XMXPjfg@mail.gmail.com>
Message-ID: <CAHk-=whWcektQzPJgSPa2DC3wMPxgLh8fJVQWeo8i99XMXPjfg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Dave Airlie <airlied@gmail.com>
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

On Wed, Aug 3, 2022 at 8:53 PM Dave Airlie <airlied@gmail.com> wrote:
>
> > It works on my intel laptop, so it's amdgpu somewhere.
>
> I'll spin my ryzen up to see if I can reproduce, and test against the
> drm-next pre-merge tree as well.

So it's not my merge - I've had a bad result in the middle of the DRM
history too.

On a positive note, my arm64 machine works fine, but that's just using
fbdev so ...

But another datapoint to say that it's amdgpu-specific. Not that that
was really in doubt.

                Linus
