Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E51FD5DC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 22:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55276E174;
	Wed, 17 Jun 2020 20:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0456E174
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 20:16:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n23so4485674ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llMR4XP929ZlX0ktOlskzBn+oIEoOfRqB8eqQjrjFOM=;
 b=RcjQboxpASiHG7fxPLYiYz5Qsa067b/Y7vl562EyU/eKD/7YLcsaUuCfIdUTFBIHmw
 wHu1OwrDlNQHnWt4Ew9oNmuKIrDMqXCfolYHnFGrjkmeyGXdLquSjo3gFjVUR1nfQq/i
 ZK6t1/zTyaUNnP5hURPNXEeotoLQhdR6NJOnbSNL2A0LapL/0QmmidRZK86i5GdxS0L9
 jP1ZHgwGyeRQrZuUnxjyUCHcPXBBM3N5+LS4Ao9rF9K25pqmqaMxUzIWODCR9fG0TcDO
 bi+9IEPa45OkrbM3kjub8tE3MWQeGbESE0rN8pj6AZO0BV4H+yNG5Einj+yC97ghVEgl
 z+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llMR4XP929ZlX0ktOlskzBn+oIEoOfRqB8eqQjrjFOM=;
 b=ddVTWbJycKLa0GU5GmRt+W78IGo8iRQuvIjxF8KG/bxj0IKh8B/zKvgmZmgYVsIa2Z
 yiu/kMPrf1Mrep0glsD5wK2WzVRItNGvHMiVT2LGahd+j7/PrVLnl5R1+c4LSpQpsuG7
 Lzqs7eRmTZf6PLr12JrQj7ywg6yE0pa+DUky6P0tx6l5bqs+F37FxZnsC1YefrCWlmE1
 jnjbs9owjauApG494uZfHFwfM78hkn/JS+OHeoN6iOfnfXaI/pCd5QiYFnTQk+/HKWmD
 yxpqlq28hPlH3N0vgwGzuOfThm2u8KnKTq8PgLd0fFO5yieXo2x67knqEgpG2AaazE1K
 8H7Q==
X-Gm-Message-State: AOAM530HmUvqatnEMhuG6lTpSBC7FQuZQJXlwcu8e6BhGtJvHLR3XVl2
 hbe5WzYQ4/5HMb3uwRtbD54YIIPPfxyYpDkh5Wu6Sw==
X-Google-Smtp-Source: ABdhPJwSuKXzvk5zn5fk4tSXh655bmsbFyqQJkONPwl29Qe0rVGDqzm/i/OqfAbWrrePE2TK2xM+/wTuvOvXd6Q6bW8=
X-Received: by 2002:a2e:9147:: with SMTP id q7mr513712ljg.430.1592424977772;
 Wed, 17 Jun 2020 13:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200409233350.6343-1-jcrouse@codeaurora.org>
 <20200409233350.6343-5-jcrouse@codeaurora.org>
In-Reply-To: <20200409233350.6343-5-jcrouse@codeaurora.org>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 17 Jun 2020 13:16:06 -0700
Message-ID: <CADaigPWJDEwPZyUyEO9H3=+zzdEX=h+gSa-w1ppNpM9ryY0LZA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] drm/msm: Refactor address space initialization
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, will@kernel.org,
 Wen Yang <wen.yang99@zte.com.cn>, Sam Ravnborg <sam@ravnborg.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 iommu@lists.linux-foundation.org, tongtiangen <tongtiangen@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Drew Davenport <ddavenport@chromium.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, freedreno@lists.freedesktop.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 9, 2020 at 4:34 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Refactor how address space initialization works. Instead of having the
> address space function create the MMU object (and thus require separate but
> equal functions for gpummu and iommu) use a single function and pass the
> MMU struct in. Make the generic code cleaner by using target specific
> functions to create the address space so a2xx can do its own thing in its
> own space.  For all the other targets use a generic helper to initialize
> IOMMU but leave the door open for newer targets to use customization
> if they need it.

I'm seeing regressions in dEQP-VK.memory.allocation.random.* on cheza
after this commit.   The symptom is that large allocations fail with
-ENOSPC from MSM_GEM_INFO(IOVA).

Possibly relevant change from having stuffed some debug info in:

before:
[    3.791436] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000000 + 0xfeffffff
[    3.801672] platform 506a000.gmu: Adding to iommu group 6
[    3.807359] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x0 + 0x7fffffff
[    3.817140] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
[    3.823212] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: vbif_nrt
[    3.832429] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: regdma
[    3.841478] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
[    3.848193] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000 + 0xffffefff

after:

[    3.798707] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000000 + 0xfffffff
[    3.808731] platform 506a000.gmu: Adding to iommu group 6
[    3.814440] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x0 + 0x7fffffff
[    3.820494] hub 2-1:1.0: USB hub found
[    3.824108] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
[    3.828554] hub 2-1:1.0: 4 ports detected
[    3.833756] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: vbif_nrt
[    3.847038] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: regdma
[    3.856095] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
[    3.862840] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000 + 0xfffffff

256MB for GMU address space?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
