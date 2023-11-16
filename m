Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E967EE914
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 23:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A2110E6FC;
	Thu, 16 Nov 2023 22:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805CE10E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 22:01:04 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5a7eef0b931so14695497b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700172063; x=1700776863; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XrDfTqC4kCNkXvqk06JZuMHZ8F1CQgx8Er0ge2sMlCI=;
 b=xcTKoTSYuL7iRAcauFlCa9cKPnQa61+U14PELs7RCmnSoF0/3uiBKgqwtW6rTT43QC
 m0hs6lsuzmlDECBZZ5WtSEJNaWE6nmjRCwweo46er3AHZY9558Qmt2Yozc1sHyNmtGGZ
 7xLGdFyVpbnfD2qCa7LUKvmZhyVf1CskWGXMemSEdLLv1ARc66Ia71bsD/0x4jToKLe7
 lB47xz2XmV6fkaf5hIz22dUfc/czBc2w6hC0ZeZmVN1qKUR0eB9S5RZwB6C+ft11GrIe
 sy4FmqyeG30u2v4vygOSczkQ5VHfDEjzK24GGkzZPoOUryW1DV5+DrqZGJmNKOVy+fP0
 izvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700172063; x=1700776863;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XrDfTqC4kCNkXvqk06JZuMHZ8F1CQgx8Er0ge2sMlCI=;
 b=FiWzEg2+5jfuxGQr/HKm7lwqHdcZ1Kt0izwkAVFGPVJR8DdT9hVkCzGRw5jPPnqv+e
 S+CKSnlYOrEtgd7ISs121RG3Dj7kZAb1d+ibioA9a/0Le2+rAe8GUFxUAysiS6fvxnNT
 0LBbWSQoaIBe8INF4v4QCplaK5y7o1c5MgJYXrpzJ/dqKtMhm86CQ7aILlWX7bBnFNAp
 c6WQ/wYnRhLChO6rLW4Ar6LDwIi2zMit+8lEiqkGNzV8mrLm5ZjCYnR+5QXy1vUNiSzP
 arvn1kV/YLdKnlibpQgy7T4xbvZZUzy4UPy8A58OE1PuJbQuhXNJajwBL3V4oe4562Zb
 IleQ==
X-Gm-Message-State: AOJu0YygEs49oNHS/6spJy5V9oh0lREQfj2fkuMHCT0xXS1rx345zbZA
 cc2TVxNs9BxDdOuFsNFYJSEbOSH1TPTegSyNDoWYBg==
X-Google-Smtp-Source: AGHT+IFar8dbn8tWGRc5Du9nzxi2agmew03+it+BDi75j3YNagGC4edoDYvKPdFZlty1Nzek7YOPn3SS7ZFTZyvb9QY=
X-Received: by 2002:a05:690c:a87:b0:5c1:8075:5a7d with SMTP id
 ci7-20020a05690c0a8700b005c180755a7dmr18665864ywb.39.1700172063677; Thu, 16
 Nov 2023 14:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20231115224409.240935-1-robdclark@gmail.com>
 <6107757c-1217-1759-8bcf-7dbce6f2e730@quicinc.com>
In-Reply-To: <6107757c-1217-1759-8bcf-7dbce6f2e730@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Nov 2023 00:00:52 +0200
Message-ID: <CAA8EJpqUBTMnkcR_dmvRCaBGNCn6x-mvnna4qVkzCVqQKBFyJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Move gpu devcore's to gpu device
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 at 00:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/15/2023 2:44 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The dpu devcore's are already associated with the dpu device.  So we
> > should associate the gpu devcore's with the gpu device, for easier
> > classification.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
