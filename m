Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A73BE265
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 07:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1F6E81C;
	Wed,  7 Jul 2021 05:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101256E80B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 05:12:57 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id k8so1081361lja.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 22:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbekPJYhk51AiCb/jp2mDu1SGe+rJ18xe7z1A6805jM=;
 b=fe4Ocl93rz7pECRQ1CotlTG3DMZJWB6KbfvEAGDDz0pOLoDd2Czs1C0Q4gG/WnxjWt
 Ha8o6slBnBLB7Qo6BIky+i7Zh+Q0BxgBpPGfZogc4KGXDNwc1AkFN4hh6k8V/l704Dw7
 VRjZ8Ju1F//y4ZLQyIKuT5gvxcdgpp117aEO/EzjqJDt968i7gZdxIZ3x7gtgnhffLQW
 vEwORBnDSzBQHh8yo4L+R4a1uV43BNTtsgrIDsCumj1nGDqr5juzpDznHSwSYOWhQjKM
 Cd+wjmNzLuYNzLJznG0bn+vtfDqtg0IKN56SXueZKGTMkAsKYLVfANKfcE0CXCTJbLHp
 h7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbekPJYhk51AiCb/jp2mDu1SGe+rJ18xe7z1A6805jM=;
 b=pPdvJBWCxoMj4zXJ4MMY9DXNzlUIgrxxSVfmM2GvhI4xkboHPxp2tjoqypWsJIBuOa
 /wHi5yDFPcJHfm/IFbc/e5nbvOBkANKpfjwlP1PnqVQIW/U1YnuzZxj0VeFAuNxsvMhK
 v/wrOwiFt6Pqy3XNmR00MtgBWTLhBzN3XqY7sPhwM+Mm1K9wppQo8RnsGt6+LMBYW6QA
 oG8hZNwRkTH/HGCzkcKUUgEXJ2IqRpJIc1FHC4E5DRPjBTscpuZifQ7SAid0LZ3Y2vqu
 z83igXu4nR2kF5MxEHuomSe7cCXNP8ni31v+JtKJo/+rRNN+NQ+2TbUx9FfVZ6jv8/bB
 r+oA==
X-Gm-Message-State: AOAM532dMDUrpC2I7lSh8u6yb5WIeT/gsBQYJKFKwMYhXMXDPs1iwfah
 Joa0DLAha0+W/U23Me6Ywy9RVkV/BzWVVGqrQDhtiw==
X-Google-Smtp-Source: ABdhPJxbc3+AxHLhFeAT5cU6slD5V2CJU2jO01d5xbmQ1yKB7QPxdlU4achffWzuXV4bC2pvaZA0xymSpnPwlr5oNvE=
X-Received: by 2002:a05:651c:2c1:: with SMTP id
 f1mr3244451ljo.128.1625634775403; 
 Tue, 06 Jul 2021 22:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com>
 <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
 <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
In-Reply-To: <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 6 Jul 2021 22:12:47 -0700
Message-ID: <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 4, 2021 at 11:16 AM Rob Clark <robdclark@gmail.com> wrote:
>
> I suspect you are getting a dpu fault, and need:
>
> https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/
>
> I suppose Bjorn was expecting me to send that patch

If it's helpful, I applied that and it got the db845c booting mainline
again for me (along with some reverts for a separate ext4 shrinker
crash).
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
