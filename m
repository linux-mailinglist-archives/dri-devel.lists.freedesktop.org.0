Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758D9402ED2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 21:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76AC6E0BE;
	Tue,  7 Sep 2021 19:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD356E060;
 Tue,  7 Sep 2021 19:13:02 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id a13so85335iol.5;
 Tue, 07 Sep 2021 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bDAmrQspvTHk4pXz96SxgqAEoYvB8Qdlb33lW2JOQKI=;
 b=iiaLA9iMJ1l/ZVUFBUL09riUqd8KCAFHSBgHpVV94Te6gjyYNUe468qaok1x0albDO
 IxsvhA9VjWjL68B2TtpsU79ayleQF+6eLhi3eOsxorE/xnyq5VsPeAV1G5rXH1XH4vwH
 25yrQ3QdtaqOUQIimvO98kzNHEgIBnJK+fxLSSjhoy1U+KonCL69C9Bgpzhxv8L4t87q
 pIeQ+5LilhJTDuERHH0MjhPzDQ45jkofDeejMgOpldFf6hdwGuc4xMtsgv3Ic7qEriOW
 0OThCYpCF6l7sjDKKUHyqwFX4HJ/ejjXla4KWYGl3ARlMipeZTb3UNq6WeacvSz51VB0
 blPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bDAmrQspvTHk4pXz96SxgqAEoYvB8Qdlb33lW2JOQKI=;
 b=JKJwQZt1pkhpmN6LAsQ8ydPb3PngoXQ2A39YhTuGyVN72zm/Jtz4Xc/SBHtJDLaAED
 0leO+jNsX6WUh0i+mmES0JV7Od1IrsN2DGxHkbRR6n9vZhhvpqMtg3POyLuMQMtCEWW9
 zzx1tAEF+PJySU0gltn7v1IXLdW/nZTdwOPrpvtJImCPoETnpdSi2wWKwPzK8awWu7TG
 vHZt8fqrVnhUQA9avkSGm5p32PuvJXrlABKqnOvb5L6/mSqLHVS0I0c29G38d9OjWTJE
 Y07FFAPVBxvCxWGgQYS9lQeZmqGwzv7vIflFrl/laSgQxjYcet7cc+Wq7ARo4hQ7IuZT
 RGtA==
X-Gm-Message-State: AOAM531qALCdW7tlth8Ic1mu2F0mn0ZewK5fXlXRZVcIO6K9WSpYlVSd
 1wbP48HG/hKvS8b2/4sb1R4vZYrKOgei02HJQyE=
X-Google-Smtp-Source: ABdhPJwzbaiPi0tOgc36KfgAKqrn62eE1qk9JEH9OxgwGowNbmENlYJ37v4PzRRODGJoiIfiZTATjqiN8fzzPEMm/24=
X-Received: by 2002:a05:6638:2690:: with SMTP id
 o16mr17203558jat.65.1631041981634; 
 Tue, 07 Sep 2021 12:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 7 Sep 2021 13:12:50 -0600
Message-ID: <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, 
 MSM <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org, 
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org, 
 DTML <devicetree@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Bringup functionality for MSM8998 in the DPU, driver which is mostly
> the same as SDM845 (just a few variations).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

I don't seem to see a cover letter for this series.

Eh, there are a fair number of differences between the MDSS versions
for 8998 and 845.

Probably a bigger question, why extend the DPU driver for 8998, when
the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
dumb, but I don't see a valid reason for both drivers supporting the
same target/display revision.  IMO, if you want this support in DPU,
remove it from MDP5.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785
