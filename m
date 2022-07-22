Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257CD57E452
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 18:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6207E14A98D;
	Fri, 22 Jul 2022 16:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0559737D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 16:25:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z22so8453280lfu.7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2cHLZsYSzu3vlQWq2uTFZBxgK+nHwwF/vJBUwns59Ds=;
 b=n5bJ2manL/cCWuwR0ZJd2UvjhGDXg9VMCs+OvLl8bGyfqKipgVkFHueBbViZ2lEBA1
 6NKiKenhcTxri61yQIaTCHoiV6+sOqsgzuGab5gL8C3miq/ows4KAHWtKz6TrXJvEGmf
 j4Dffqm/p76WMCjN/vqMZ7AG/++q67fMOnnx7kbUwLmSYewy2QwjAYS4w5V8bf3xo54H
 4wkmllD15xq9EMw/cMlQcIe4twyMyi2w2808mTnrFhPlse51W3MSJ42rC9GL+9+wc0zQ
 88JuNMU3uUiozQmZoQhCNIpSzTJFN0MeFUMQJbKOOE6ZqdFbVJFwttBW/m5ZhwknQU6a
 4Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2cHLZsYSzu3vlQWq2uTFZBxgK+nHwwF/vJBUwns59Ds=;
 b=3WhWQHDcyabONGlZdppUBwnjb4RrrB/gQ8K+KiM/HrroZaaOeFKTpdKjlcsjdCeDHe
 aJxdzaT9CKUpCqNMzYEU2sRmUs/y6QKXZnZGS4ZmtHaaoptIYbt1pdN1elywEYAKMOGH
 2sJ7iMA2RVvz13OJcwe6anE0iNfXPVf1FpSu69AInIBI9uoEYr7Qr33g8BJznVcJskCg
 W+76KeqUMJzUuiYk8OZUXIZXzyxFezzH1ud+wBcvtYKo+TuFwHtmRNlBmVkZuLZHDXqC
 tn+EJdoBTptj5FCtOFA/ZBAAhYhh4Ut2bb9nofyV0BVodZeiWTL7qa83f/fx1MLNhMat
 SeZQ==
X-Gm-Message-State: AJIora+piSKt2spYB8AVHAlAJX85n4UaHRaDuTzLeTECUjIzhfkpiLv2
 or2JLWaTA33LvMMypDiHuxFOdg==
X-Google-Smtp-Source: AGRyM1sPLTtJuvAxH41K5c4T5wV2zD6vvOVSwpXKE6dWwQy/OWWh7eYNR6Txk9u9vVFJK0Gagcmh7g==
X-Received: by 2002:a05:6512:3092:b0:489:dece:5539 with SMTP id
 z18-20020a056512309200b00489dece5539mr276918lfd.269.1658507130797; 
 Fri, 22 Jul 2022 09:25:30 -0700 (PDT)
Received: from localhost (89-64-117-232.dynamic.chello.pl. [89.64.117.232])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a2eb901000000b0025c8c3747bbsm1209127ljb.37.2022.07.22.09.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 09:25:30 -0700 (PDT)
Date: Fri, 22 Jul 2022 18:25:29 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
To: =?utf-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>
Subject: Re: [PATCH v5 9/9] drm: selftest: convert drm_mm selftest to KUnit
Message-ID: <20220722162529.wy4ox7pyjhno66lz@macragge.hardline.pl>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-10-maira.canal@usp.br>
 <CAM0jSHNG8Ozs+NpvwMK6zvbRm3Ve=Wa1_H7jS0uQ8FeAWgvyoA@mail.gmail.com>
 <b1ae4f77-4e24-24c9-fd87-abcd612a3533@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1ae4f77-4e24-24c9-fd87-abcd612a3533@usp.br>
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, siqueirajordao@riseup.net,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 brendanhiggins@google.com, mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 tales.aparecida@gmail.com, kernel list <linux-kernel@vger.kernel.org>,
 leandro.ribeiro@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 08:04:51AM -0300, Maíra Canal wrote:
> On 7/22/22 07:35, Matthew Auld wrote:
> > On Fri, 8 Jul 2022 at 21:32, Maíra Canal <maira.canal@usp.br> wrote:
> >>
> >> From: Arthur Grillo <arthur.grillo@usp.br>
> >>
> >> Considering the current adoption of the KUnit framework, convert the
> >> DRM mm selftest to the KUnit API.
> > 
> > Is there a plan to convert the corresponding selftest IGT that was
> > responsible for running this (also drm_buddy) to somehow work with
> > kunit? Previously these IGTs were always triggered as part of
> > intel-gfx CI, but it looks like they are no longer run[1].
> > 
> > [1] https://gitlab.freedesktop.org/drm/intel/-/issues/6433
> 
> Hi Matthew,
> 
> Isabella sent a while ago a patch to IGT adding KUnit compatibility to
> IGT [1], but there wasn't any feedback on the patch. I believe that soon
> she will resend the series in order to make all KUnit DRM tests run on IGT.
> 
> Any feedback on the patch is welcomed so that we can fix this issue as
> soon as possible.
> 
> [1] https://patchwork.freedesktop.org/patch/489985/
> 
> Best Regards,
> - Maíra Canal

Hi.

Instead of going back to using IGT for *unit* tests, it would be a better idea
to adjust the CI to just run the tests once at "build" time (just like e.g.
checkpatch).

We would then stop executing the same test multiple times on different machines
(note that both DRM selftests and i915 "mock" selftests are pure unit tests - in
other words, they don't need the hardware to be present), which would save some
(small) amount of machine-time that can be utilized to do something that
actually needs the hardware.

Plus there's no need to maintain the kunit-runner in IGT.
Note - we're currently going to lose "DMESG-WARN" detection if we go this route,
but this is something that can be improved on the kunit-side.

-Michał
