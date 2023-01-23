Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A685A67800A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684910E4D1;
	Mon, 23 Jan 2023 15:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7006110E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:38:41 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h184so5723485iof.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GTMdUYoB31JTLCUSgm3VtLqQhozltwVtxsd9chRjQsA=;
 b=Q3dQNfOIsBKbEssAr8S/0j2BHEXhzLeK6qqTwjbGFlMNtkbm96lJaHLBbeZdqOLHIN
 jqv9DLB/SnYamc6sLj/eI0xT3q+9bPStpYW/Xa0XZzY6uaYxxy8c+5ohJwrCBHoi8K2/
 mNe/DClGW0oO4B+xbmmD3rwMhPieMBk9avVZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTMdUYoB31JTLCUSgm3VtLqQhozltwVtxsd9chRjQsA=;
 b=lm9lSjTNCvqBm2btr4igeBxx9WhDMzLvWB7RsNWKIELswoBVqhy4DkgJgjYwHp1Nvu
 8kwwo1NVxTy9u43ldXs7ynaLJ+lr/Kjh/D+fvIQtjUFT8saoQc7ADPz9or2YJcSjc3x3
 d3chjgTnU+7s7pMkO5UxFMDxN0rZl+dnI1Tfo4xxXPuoMB8eIlvP37BcZGtz6qbe6AN2
 fa3Rftm7zzc0B/Vydw+hsNrYl0BVphPQi3t+TmVM8DivJMob8bFLrCwthO1p/WTtCOPG
 uE+ibDPaKrHvmoTR3WuWjxP+m2fsA+wsp/iIOFWdkRYddctDYUjxlh0foLzpd3OC2pMT
 8Ztg==
X-Gm-Message-State: AFqh2krZcWgcxyQ8Pg79KXczVZVrn5RJ/+edhy9Go8eZ7FympRoHsE4W
 haGvqD8kNlpsJyP13Kbq8SAlhHZS2/QvmHEI2vVk8w==
X-Google-Smtp-Source: AMrXdXuXxev/GY8Oy07lOGET6d1ZUhWZ1e8eg082MJK3Aqa3PS4fKCI4WfECJhpMfT04OzR0UvCeatClLncLpOlbbd0=
X-Received: by 2002:a05:6602:1782:b0:6e3:134:3a97 with SMTP id
 y2-20020a056602178200b006e301343a97mr1998187iox.64.1674488320775; Mon, 23 Jan
 2023 07:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20230110231447.1939101-1-robdclark@gmail.com>
 <20230110231447.1939101-2-robdclark@gmail.com>
 <2d5f0bc3-620a-1fd8-061f-92f16efd3c5e@kernel.org>
In-Reply-To: <2d5f0bc3-620a-1fd8-061f-92f16efd3c5e@kernel.org>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 23 Jan 2023 07:38:38 -0800
Message-ID: <CAJs_Fx5Wjnxw3rOtu6ye493SO-K+b3WLECYGBSCDUsyQhTjdiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/gpu: Add devfreq tuning debugfs
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 4:38 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/01/2023 00:14, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Make the handful of tuning knobs available visible via debugfs.
> >
> > v2: select DEVFREQ_GOV_SIMPLE_ONDEMAND because for some reason
> >     struct devfreq_simple_ondemand_data depends on this
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> For some reason this was merged even though earlier kbuild reported
> build failure. This breaks linux next and qcom defconfig. Please drop
> the patch from the linux next.
>
> See earlier build issues reported:
> https://lore.kernel.org/all/202301130108.fslQjvJ8-lkp@intel.com/
>

This will fix it:  https://patchwork.freedesktop.org/series/113232/

BR,
-R
