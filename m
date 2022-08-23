Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958559E55C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 16:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D1A10EAE2;
	Tue, 23 Aug 2022 14:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B64810F610
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:50:41 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u6so13297971eda.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5HbW8uko2vZ7AfwOU8eshl0aSQHKvNNaKtmoLv6rUEM=;
 b=JVJ/J+80rmibqknLI2dl4D/IfJ9EQwbBZSfvxG712BBjzT3yS+x3AVpptqWtAIaoP5
 6AoLaaLRByrmJMtY636D5RKtuqEryU2Ox4VkD9HvYVOmuivp45RYryYXmKDqEJApQVWi
 nDj+k2TQWI9jk0P895iLQrG5xjpJylgYK15ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5HbW8uko2vZ7AfwOU8eshl0aSQHKvNNaKtmoLv6rUEM=;
 b=qWobb+45r1dFFTJUFogIO2mEq5IEOnm8xr/tMf67NMoQ4g37ddLBEYgx4zNKZ6BRjN
 QLsc98k2Td5kkp+0rnsF++43HKUXfKVo9W5k+qDlvQsz1EZk+dZpxwdS3CmcVuI0qnFY
 q6FJ2sYxS0T5jnmFFny5rro0G8831gax09eGZZjDW5S+jiE/S+mqfX1K+H4MYWt1Lni9
 jOQbSDQ6RLHjhBvVYjoZS7mZe6lxiC5RFgCGQMR1CpvbBnGS0LQuQB2Dfyexz0BtV1+T
 EMF4fxY3AG2T+AXXFFCSt8UNqsxd+a/Mdnu8vD+E6DNpJzSicCdSMFtXrmU6xGSMWz4Q
 gc3Q==
X-Gm-Message-State: ACgBeo32UOFAZ3maGhh9nupJtPBBaobQ2ln87159UDZQW1LHDb1wWA6T
 h91VQk2TPVB8otNsr6hYTHnOCE6yT9P+P1TKAek=
X-Google-Smtp-Source: AA6agR68jhzlQX9pxuyzP6/C9JXED3Dn7fkGI39bNQM8Fs0dT76uUfwsiiGTkoRLeHQO+B1r/+B/qQ==
X-Received: by 2002:a05:6402:3886:b0:446:1439:5385 with SMTP id
 fd6-20020a056402388600b0044614395385mr4118557edb.113.1661266239440; 
 Tue, 23 Aug 2022 07:50:39 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 h13-20020a0564020e8d00b00440ced0e117sm1535721eda.58.2022.08.23.07.50.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 07:50:37 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id n7so17305906wrv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:50:37 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr13686062wru.405.1661266236928; Tue, 23
 Aug 2022 07:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220726173824.1166873-1-dianders@chromium.org>
 <20220726103631.v2.4.Ie85f68215ada39f502a96dcb8a1f3ad977e3f68a@changeid>
 <CAMSo37XsawRxTnJriLUAwJAj0+ZzpACtMiR_3V7H1H9WXg3T_Q@mail.gmail.com>
 <CAD=FV=V5c0bCOCBvdnqVJ6Sa1XKeg+d7kTEL2Okh4GAL66MGiw@mail.gmail.com>
 <CAMSo37Uve4qrAA81zrO9eOGc4y7vjg-OZ9L7m9xWM7UkQ6PzmQ@mail.gmail.com>
 <CAMSo37U1uxUFkn4Jda5E+nDiz0wp8_ERbNa9BUgWttZ6dEssAg@mail.gmail.com>
In-Reply-To: <CAMSo37U1uxUFkn4Jda5E+nDiz0wp8_ERbNa9BUgWttZ6dEssAg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Aug 2022 07:50:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WNNAYtdoocp_ShyNBOBmqSSr79=x_2UKq+yfA+HiOo9w@mail.gmail.com>
Message-ID: <CAD=FV=WNNAYtdoocp_ShyNBOBmqSSr79=x_2UKq+yfA+HiOo9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] regulator: core: Allow specifying an initial load
 w/ the bulk API
To: Yongqin Liu <yongqin.liu@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Steve Muckle <smuckle@google.com>,
 Alistair Delva <alistair.delva@linaro.org>, Mark Brown <broonie@kernel.org>,
 John Stultz <jstultz@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Todd Kjos <tkjos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 22, 2022 at 11:23 PM Yongqin Liu <yongqin.liu@linaro.org> wrote:
>
> Hi, Douglas
>
> Just an update on the fix you pointed out previously here:
> > > [1] https://lore.kernel.org/r/20220809142738.1.I91625242f137c707bb345c51c80c5ecee02eeff3@changeid
>
> With it I could boot the hikey960 build to the home screen if it does
> not use the GKI kernel.
> but the problem will be reproduced if it uses the GKI kernel.
>
> And if this change is reverted, then it could boot with the GKI kernel as well.
>
> I am not sure what's the reason there, but there seems to be some
> difference with the fix above and the workaround of revert.
> Not sure if you have any idea about that.
>
> Regarding the GKI kernel(Android Generic Kernel Image)[2], it's built
> from the android-mainline tree(f51334eac4de) without any workaround.
> (Neither the revert, nor the fix applied), and the regulator modules
> used for the hikey960 build are hi6421v530-regulator.ko and
> hi655x-regulator.ko
>
> I am still not sure if it would work with the GKI kernel that has the
> fix that you pointed out in. the case that both the GKI kernel and
> vendor tree have the fix.
> Will update here when I have some results.
>
> [2]: https://source.android.com/docs/core/architecture/kernel/generic-kernel-image?hl=en

That's not too surprising. The broken patch is in the core kernel so
you need the fix in the core kernel. I think that means you'll have to
wait until `android-mainline` gets the fix. I don't work on Android,
so if there's some other route to get an expedited fix into
android-mainline I'm not aware of it.

-Doug

-Doug
