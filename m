Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F5617F63
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4407D10E3CA;
	Thu,  3 Nov 2022 14:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBEB10E2A9;
 Thu,  3 Nov 2022 14:24:50 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 r10-20020a4aa2ca000000b0049dd7ad4128so277184ool.13; 
 Thu, 03 Nov 2022 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u/xSN01Y9d0jDzJ8OY9Uml07yt5pXMZDHAA6O3LIwM4=;
 b=NNfn/U3u6fGUpwAIsw3QI8vNRnfExdw5AISKpSm4hA6ez4yskkICLV8O8q13vBNKGy
 LBoq/BR7pVxnBdmFGt3N2K+QjSb67MZKOkjy/6Cpcp6i0HveRrVB87dbnQpHrpRVp5CA
 VGRXD5zRtwfjbHGuS01PUBwws170k6uz3M7FF45R1A2x3CYKOpYY9fQYmV4vyxg3cUFu
 uMkh4HmUbnTHjukHQ5YYvKPAqXRMwLy6pw/asV0tJBah6yMnfKUGyvEjznb1A6P62YX9
 5s9pr6+zOe7WD8wmYtuovrLYL6CjXWg1i6hiFt0Yqovv681rh6t0OqM/LQXQElYc5sGI
 FUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/xSN01Y9d0jDzJ8OY9Uml07yt5pXMZDHAA6O3LIwM4=;
 b=TgaaPsddbLvX+HR1/68itJFqFGtiXklh8qGcaO984aK4nfSqq7Fp9sy2sEHyASfCGz
 pmhK/JCmgkuZcB9U7Vol5s3HNXwUoCetXHtbrOy/KlzFX5Q3dt/o+nhVgbErmFIi6xJI
 qG+E6SkjOcnrWq4F7q6JPb8U8IdffurALDTQXXXn/mKb0iOULreepQwnZqdVv9WN6K1u
 e41s15S9JIFcwLJuZI4TxFLhqK09FGhFsNNeCE6rjmtg+aIAUhv1F9tbSKmwPAnY2nWk
 cuYeutBoSjKDTs1ea7T4qeb6hLN6wmUIBNO4XTDi20fEewZL7V8rveDNdOuDyfaAYZxN
 F2TQ==
X-Gm-Message-State: ACrzQf3v6+e+BG35L/FtkiTebDXKGU3qrcXghKK93dSfqaRSYMVy8wSZ
 33Nie+gwMRNkKlemUKddhpDhBCpNc04t/tUyIVQ=
X-Google-Smtp-Source: AMsMyM6J5QRMxRp64kRAdhF5yjjfT9WHNQctflNk+E6Xp1u2gW/bCaFAXyDhIRKAHdTzy+3zP3AgCHbpg71s/ISYB+o=
X-Received: by 2002:a4a:a68b:0:b0:496:2521:c81d with SMTP id
 f11-20020a4aa68b000000b004962521c81dmr12952579oom.80.1667485489693; Thu, 03
 Nov 2022 07:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221101223319.165493-1-robdclark@gmail.com>
 <20221101223319.165493-3-robdclark@gmail.com>
 <bf5fb954-c71b-f02f-5300-4e030b10811a@linaro.org>
In-Reply-To: <bf5fb954-c71b-f02f-5300-4e030b10811a@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Nov 2022 07:25:07 -0700
Message-ID: <CAF6AEGtzfoxKLi7FrHRgdp-ft32rFH1XzEeu11SeH3c0Lodj0w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm: Hangcheck progress detection
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 4:26 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 02/11/2022 01:33, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If the hangcheck timer expires, check if the fw's position in the
> > cmdstream has advanced (changed) since last timer expiration, and
> > allow it up to three additional "extensions" to it's alotted time.
> > The intention is to continue to catch "shader stuck in a loop" type
> > hangs quickly, but allow more time for things that are actually
> > making forward progress.
>
> Just out of curiosity: wouldn't position also change for a 'shader stuck
> in a loop'?

There is some pipelining, in that there can be a couple draws in
flight at the same time, and SQE is running ahead of that, but with a
shader stuck in a loop the associated draw will not complete, and that
will halt forward progress through the cmdstream.  Basically what this
is doing is detecting that forward progress through the cmdstream has
stopped.

BR,
-R

>
> > Because we need to sample the CP state twice to detect if there has
> > not been progress, this also cuts the the timer's duration in half.
> >
> > v2: Fix typo (REG_A6XX_CP_CSQ_IB2_STAT), add comment
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>
>
>
> --
> With best wishes
> Dmitry
>
