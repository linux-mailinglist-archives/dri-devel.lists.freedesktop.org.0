Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314672335D7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 17:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596016E915;
	Thu, 30 Jul 2020 15:45:38 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AF16E918
 for <dri-devel@freedesktop.org>; Thu, 30 Jul 2020 15:45:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so3315827edx.7
 for <dri-devel@freedesktop.org>; Thu, 30 Jul 2020 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1J01Oczhd220RAym1LfngVA7OUijoix/GTLOnOq0wQ=;
 b=mYI2K30rokgxWE0w7UBhOkOYryaDcfDKVw60BHk8x3vYQ//HRCVaVYL2FU1hFijMfT
 8rwLHSUgRg6/W4AvbrMRanJPGCBILdYCXc9SWKUFPRFJy2DEbfn3agkQJvTbPEzwd5hq
 Z7xb4bbxbDLahiPDYZ4URSuz3MQj++4zVmHqM/tXhleHuX4XwfDzWsqa7a3ASLmbqdNw
 PQtvqxQ6Qv1RyiW63qtuPBNmZF21uFplD/0Yigy4RjgHLEr3/XZIdkL6GA62Vw7iCzbH
 ocQCE4wQEl0soppOd8kGhR6nr5YcIrnu8VKQ6oc7usO2cTRWz0ICuZi+gHH8fMD59RgR
 HGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1J01Oczhd220RAym1LfngVA7OUijoix/GTLOnOq0wQ=;
 b=SiBsZR7tZzxNU2U862gcpM6odPDruX+MCQ+VUMcMkj3zX0LI80vg8wuAQ700bNnFDL
 9ZW6jJPGrkoCGmHVH9m47nY9HT6v0bjKR0xJCR7OQnG2GuZovHC3sJi/VkTspE8YcTcD
 qchrMPQAg9WNtbpCRzR8hf3wBa3QlB1uww6CVM4rdF/jJVwcDHYLvCK2Yv7h98v9fiVW
 B5jSEp33iZ7bGkciG9+lEGmMEOxdFQHRKzEi5saTD9G/NzLgqRXX9gbAaFJUcN1qrWGK
 o2I4QZHSSOxRd1AsI4yUTTycLFC6Hib/c3ZOHTfjW4MqOYWJ+SGfHL1AuI8pXLVBcZD4
 ZKgA==
X-Gm-Message-State: AOAM532IilqfVwNd5s58HQGCJH98YRmvHj8mSpdU5Edb90vONVjgm7yc
 TXpdioZSqZLLRlJeRX99dfKykGx1OCw3xgl8Qu8=
X-Google-Smtp-Source: ABdhPJxJBzb6IrbCKjuOC0BujTWS0dRylwUyeXRe0DDUCUbkZVlP/EuIVuplkgjxRZfoLFnUlWJiDAFypFhpWjX6r1E=
X-Received: by 2002:a05:6402:1c10:: with SMTP id
 ck16mr3213692edb.151.1596123935735; 
 Thu, 30 Jul 2020 08:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
 <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
 <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
 <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
In-Reply-To: <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 30 Jul 2020 08:46:16 -0700
Message-ID: <CAF6AEGs9=-0YBJpONaXf1wavU5ZpxhAQ19vfOn4JHby1zgPwpg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 8:37 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 30-07-20, 08:27, Rob Clark wrote:
> > Hmm, I've already sent my pull request to Dave, dropping the patch
> > would require force-push and sending a new PR.  Which I can do if Dave
> > prefers.  OTOH I guess it isn't the end of the world if the patch is
> > merged via two different trees.
>
> I don't think a patch can go via two trees, as that would have two sha
> keys for the same code.

it looks weird in the history, but other than that I think it is
fine.. at least I see it happen somewhat regularly with fixes in drm

> Though it is fine for a patch to go via two different trees if we make
> sure the same sha key is used for both.
>
> Will it be possible for you to provide a branch/tag of your branch
> that I can base stuff of ?

You could use https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next/
(or the tag drm-msm-next-2020-07-29), which already has the OPP patch.
I've been trying to avoid force-pushing that because downstream trees
are already pulling from that.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
