Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F211F3DF626
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 22:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F5B6E030;
	Tue,  3 Aug 2021 20:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336FB6E030
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 20:13:11 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id z26so148962oih.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mL66p7hWwJs0uODfuoDP6bwn2OF6cA0CzfTBUWUkGg4=;
 b=XS7RdH1UoHVjTZIVBMtzi7boDGmgd74mV5qkzXfTgWhhlsz3FFJTEDA96jM66q0qkf
 tnVqs4HREXO3oXmdzKpEJ5QPLD/vrXJKcTd6Abto1Wzs2Ai81iJHcmfPEb236VbvNpzy
 yXHQfuIRGFlXCLBAiYSqYmJ9UCVCi1qrG8OYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mL66p7hWwJs0uODfuoDP6bwn2OF6cA0CzfTBUWUkGg4=;
 b=OqRmXwGgG64bhXyq3uf4dt7hkbyQJX84BW5HdM4+tq9PjVhYv52KkkRiB46scjxr9C
 EfBn6+q3W6SvDCrPkV6v8PQU/2/fGj8Nr2rfT6XStjhbBH0M6VQjtQSgTRLG/h4Ck+Oj
 g8pfD2CoMxRaDnobRumDFzeN18JoM2xHtco4JgOOxhLV7xoGW6I6reIog83rIBW9te8K
 DtiuPZtBtBrf5cRzClZ3FRrAWczJKchGzQe6NlxDhsti5ZYWmzeX/PPPKZqXXU1nXLZg
 xFoSf/Hk1IpiNK+DzaeSHtB5shlZBrfJbMNA59yAXIWtV6T/+pUwyypM53t+9uSiLd6E
 MkyQ==
X-Gm-Message-State: AOAM532WjnpdexugNnB/gHH1UnIzWwsB3o1fVIb3nHJRnVl5v/WuajSv
 N65rlp1hvJFhfZbDBttkS8bMo/NPMJB0VX1O3QU72A==
X-Google-Smtp-Source: ABdhPJwHzCEof57wa5MwJlj+OLIE4A4DUTjhh66InjV2cvQnN4ABaOQLvHRfB7a7K2brpMYq1WkI3dr6mVq+wsZF35c=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr16109374oiu.19.1628021590448; 
 Tue, 03 Aug 2021 13:13:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 15:13:10 -0500
MIME-Version: 1.0
In-Reply-To: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
References: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 3 Aug 2021 15:13:10 -0500
Message-ID: <CAE-0n52+PvNpz5uqf3O_NsfQ4q2taeZmdSdoM3fGDLp5aQVj-A@mail.gmail.com>
Subject: Re: [v2] drm/msm/disp/dpu1: add safe lut config in dpu driver
To: Kalyan Thota <kalyan_t@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, robdclark@gmail.com, dianders@chromium.org, 
 mkrishn@codeaurora.org, saiprakash.ranjan@codeaurora.org, 
 rnayak@codeaurora.org, stable@vger.kernel.org
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

Quoting Kalyan Thota (2021-08-03 03:41:47)
> Add safe lut configuration for all the targets in dpu
> driver as per QOS recommendation.
>
> Issue reported on SC7280:
>
> With wait-for-safe feature in smmu enabled, RT client
> buffer levels are checked to be safe before smmu invalidation.
> Since display was always set to unsafe it was delaying the
> invalidaiton process thus impacting the performance on NRT clients
> such as eMMC and NVMe.
>
> Validated this change on SC7280, With this change eMMC performance
> has improved significantly.
>
> Changes in v1:
> - Add fixes tag (Sai)
> - CC stable kernel (Dimtry)
>
> Fixes: cfacf946a464d4(drm/msm/disp/dpu1: add support for display for SC7280 target)

This is wrong format and commit hash

Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for
SC7280 target")

> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> (sc7280, sc7180)
