Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262188D2FC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 01:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6D210F534;
	Wed, 27 Mar 2024 00:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vmYAPO/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3515210F534
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 00:02:11 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dc74435c428so5995953276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711497730; x=1712102530; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tS0zc7MW0kmEmnpstJm/aVt2IhnEYkSbjvjwNRNCsKc=;
 b=vmYAPO/TAgex35G39MuMpTYAFz1d8np1yj4PW/l+5I9UAtiF43ybbRRVok6cFFKt6o
 ynX6sEjO8OnjYsnP76opSsCXMi3Q6P1LjC4hw989dx6mF6OtTSLtYcWJ8SLPn6PFApvn
 XNgv96UqE4caoxjIDveUQpat83wdp4PssPqNuDXcr8rjeQCZtb+1Th4w2kv1BcpjdKqy
 TReXdpNq1kvSTJ8KWxl9whZImLx0HZTCUdge2IFAtPzGfdiLqZKMmuf94xAGV7WrjTWg
 7QgrMhq9+evNykddpfKjMJanohgPOcdmJRzsJ30yUxvdalSrZm8W1zRZVFQ5A6lddLC2
 dntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711497730; x=1712102530;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tS0zc7MW0kmEmnpstJm/aVt2IhnEYkSbjvjwNRNCsKc=;
 b=J0HxpxrynnxtBRwizU4802OUMNb4CG1GREm8yp4kSNsy5+Dq2lLIAA0/nnqXehfeTN
 DS/Y4fMalH63kUBbq6/ziCDXS2+XikZy+epGwgURm1hnWUpkMta7hyXrPH2Ug89EvvfT
 Ii5j8boKOfsnPF7OSwDai661T5ICMEwtcRF4dWymD+QgP+FixIqFQrSr+5wVt4N23eYO
 oV35NYMnBl4k3ostVegaEAIAwQwEc2MziMAFRS01+R5Zn/1Kfkp402dCafduo4jd6CWC
 Ma5fU7VDib79ATFjn8hrG/V7FTcMv9/NNiEwutJ214vtP7VPTVhaBGhlqgC7Kni6KlYb
 LGYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnwJyYoyG+GuXvZmC03MgrBQ54nuOpAJ8Xwoj0PEcAKs2edyLhOIrXdrMIVI4kau3mBzLvgbZ3V6UybPHEMjAHRbQMPGx+BsGfeAA/7kZq
X-Gm-Message-State: AOJu0YxvMgNpuOT41e0zAHDYoEfwrmD+rLQazoh0sMwi02L5i+OVHvMl
 BSRi6gyGXxvbIIOiJIrUECKqIdV5dUQYEYwoGPF+wNNopMXJzW0BetfHcQWk0g/JAlh2+owV95U
 G6Yg12psx7eg+toGdElgcDec/crxNunyyCW6Q4w==
X-Google-Smtp-Source: AGHT+IE0CLdgIxaupn4P97/flUIXcr4ydXAa7ow+nC1nF997KzOScE1dzX7ClgNkAVGwtfkCHk7mRqplM/Ne8uj/fUw=
X-Received: by 2002:a05:6902:529:b0:dda:aace:9665 with SMTP id
 y9-20020a056902052900b00ddaaace9665mr8653289ybs.60.1711497729965; Tue, 26 Mar
 2024 17:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
 <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
 <CAA8EJpry2dHyBF4wyXeFAyLu+9_tYg3xyP6eAM7RzJzOiOqypA@mail.gmail.com>
 <464ff2ec-b023-4485-0565-ccc63f951088@quicinc.com>
In-Reply-To: <464ff2ec-b023-4485-0565-ccc63f951088@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 02:01:58 +0200
Message-ID: <CAA8EJpoqU5-m6LVaQFLB-8k8V9sAQti9wA7oXjHCW7A4u5TDmQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Wed, 27 Mar 2024 at 00:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/26/2024 3:25 PM, Dmitry Baryshkov wrote:
> > On Wed, 27 Mar 2024 at 00:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> >>> Import the gen_headers.py script from Mesa, commit FIXME. This script
> >>> will be used to generate MSM register files on the fly during
> >>> compilation.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
> >>>    1 file changed, 957 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> >>> new file mode 100644
> >>> index 000000000000..ae39b7e6cde8
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> >>> @@ -0,0 +1,957 @@
> >>> +#!/usr/bin/python3
> >>> +
> >>
> >> We need a licence and copyright here.
> >
> > Yes, this is going to be fixed in the next revision. Mesa already got
> > the proper SPDX header here.
> >
> >>
> >> Also is something like a "based on" applicable here?
> >>
> >> <snip>
> >>
> >>> +import xml.parsers.expat
> >>> +import sys
> >>> +import os
> >>> +import collections
> >>> +import argparse
> >>> +import time
> >>> +import datetime
> >>> +
> >>> +class Error(Exception):
> >>> +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> >>> +http://gitlab.freedesktop.org/mesa/mesa/
> >>> +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> >>> +
> >>> +The rules-ng-ng source files this header was generated from are:
> >>
> >> Is this still applicable ?
> >>
> >> Now gen_header.py is moved to kernel.
> >>
> >
> > Copied, not moved. So Mesa remains the primary source for Adreno
> > headers and gen_header.py
> >
>
> But all future development and code review on gen_header.py will be done
> in kernel itself OR periodically we will sync it up with mesa?

We'd sync from kernel.


-- 
With best wishes
Dmitry
