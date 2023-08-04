Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5AE77012C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114C610E709;
	Fri,  4 Aug 2023 13:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0104B10E6FE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:16:55 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d45caf42d73so260842276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691155015; x=1691759815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CN0KqmR92Gl21HQtvAMPIpHXJ6Dwonwz8bIB3UAxFh8=;
 b=lTe8kRlkQhbCr9QuKFpIQmuAtZdUH5mPurZ2vCnZAsxaQqcSqvtzge8st2Doky9U6y
 xY/2YDlAzjvJxM+3yPH5G6wjvpFlPDN/qPR4KmvahczFf0xUY2gffcvTJ4I7WDDINNU6
 xnffE8OAedgkbwdJoiZZV72j7B0U14gzEJZm1FA3uYB6YGRQF9I8dUmb4HvDv1oOtH7F
 nppWSTaOezES3Qq1iAqOSdow0tmHbRDOcLFhTenoUNEgPu7dDfXfhF11nBemTfQK9YRG
 cqmtB4syCb+9g1BDBbU43sFuyPtNlcQ71KB7zK0zzi77eQkJt74uCl/eTzvWt8TBr0ec
 tkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691155015; x=1691759815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CN0KqmR92Gl21HQtvAMPIpHXJ6Dwonwz8bIB3UAxFh8=;
 b=kApYa1opdryxHbtqMywK+eDQnzyjFFMVL9IEa2G1jHBbp3q//rwIdbT15VroOQQueb
 RcIIYGRyHQb2+eV1HCWIRQRR8UcTnz/VZBbHUBHuWIAt/jFyt9sPiQ/VVrZIKWvviKSN
 U3PAjVcflWwxYrzy9/Ndvi49E1YUvHSIDzjSaSMSjB2vkGJctq08UuBXUFprHbe4u8Nk
 RldWbpWelP70zY3GCp+ICYG4+mIAmfOerJ1VWp/0dxk5n/Jd9+rfkPlR+WlecyhwOc9o
 Mhc5h9M2iXVx6cl8oBFwPI+sNGVc9JsW1BGVshVFaaZ/AYT7gbsBz1LkkfL6Knf4YICH
 FMeA==
X-Gm-Message-State: AOJu0Yw+TMABVOaMGR6pYg60Zz73A16WVorNgiXPYzHdYqgDmId8S0Ec
 RoXYyEafsYe1uSQmddnwdcmbqeO3LQ2xtePmatdo6Q==
X-Google-Smtp-Source: AGHT+IEAY+cs9ul8AsuJqNlA1Ij2SA6DE6uBQAWyhGZ4hywFx5Y9P9mpVKMALAsrD8z/aHpSNClZlHD8GZm8+r89DqM=
X-Received: by 2002:a5b:701:0:b0:d0d:f5f3:d2bf with SMTP id
 g1-20020a5b0701000000b00d0df5f3d2bfmr1444562ybq.48.1691155015082; Fri, 04 Aug
 2023 06:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 16:16:44 +0300
Message-ID: <CAA8EJpp9SJG1MQEwbGHLVWvJZomagttQ1y2B3EmXqB+owO0Xwg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: freedreno@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Aug 2023 at 10:57, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:183 dpu_core_perf_crtc_check() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6096
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
