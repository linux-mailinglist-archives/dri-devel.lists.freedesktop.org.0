Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A97E32B9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 02:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8B10E105;
	Tue,  7 Nov 2023 01:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BBA10E105
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 01:56:04 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5a84204e7aeso60670857b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 17:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699322163; x=1699926963; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qRdFl5udOcDDgpUUHFmtzTJy5y7ihwibQnaHgGQmu7k=;
 b=OfDkS1Ho9PH0GNUDy9h78W9zLWCOYAhE6BjdJsSsJsz8DUVfAa5Fqngz5C8v+VU/1S
 HL8S3FGdpB8xCBCkww8HM3i/eCbSUmSOIp8ugQwnORycxDRnT/bSYQ7/MQoAqduDhUKl
 HjEhuIqSctLwyvsVxd1UTW2FH4E5qqjwpO27YYk954sx4y7fbRdzVqRs0qkGKpELY0pq
 cUjKZ2XjUwydDz3eFp6ni+bQqylXsyn9Dx2xQwF/ao5z8/ogqsTX8qbW9GgIoeU3vytY
 +G8r385tIrQCaOOQyPkGhuWA4gVzOjSC0jCk6eaGMRZ06J7QmdS7ZW6WEh0htFOrrona
 /5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699322163; x=1699926963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRdFl5udOcDDgpUUHFmtzTJy5y7ihwibQnaHgGQmu7k=;
 b=Q2i6B3lIQkzK2hC3NC3iRBD5UHdsfW88DiEiHGs9AplwK0o5W8vsstlB/nGku14gV4
 iZ1VH9plcwogv4/YP5dVJ0f0s8gKIFTRYH8KV8SXmiG64++j4bYoYmHvBN2SnTyIQ3R5
 cDWQg1dUM4dp7JhfdYemY7JY/gKm7IhuyuPkIjUj7Mx/CnqRlaZqpL8s0dMY7iSLYobq
 isC8ETtq8MhSQzNTxzH0zVJYQV1sguhRAhUIiBQ0bG1vnGfco9xhAitdPvKrdFsalww2
 GX+DiCVC1BKS0CivtZzVZY1BpiPbxvHKhPelaj2hQhXZsRHtKp+XMpX/zVbAL6oXwaSj
 pITQ==
X-Gm-Message-State: AOJu0Ywklj4a8JPO9VRWjTiWCCAqkPKoz01CtOZ/O99cP2H8VWzGyaPX
 H5L/fgp1Lnalh0WWtucSo9Kmo9kojsEx08x0zpLO/w==
X-Google-Smtp-Source: AGHT+IFtN3nj1SFB8choYmUK6+L0wPLOEXRz8UqI3Ocfv/fDkJmkQoE2qADkYCuPiioo32CihjU/UeJ2DjK7I3fYw4E=
X-Received: by 2002:a81:9a54:0:b0:5a7:fa8b:3fa6 with SMTP id
 r81-20020a819a54000000b005a7fa8b3fa6mr12601421ywg.9.1699322163303; Mon, 06
 Nov 2023 17:56:03 -0800 (PST)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 03:55:51 +0200
Message-ID: <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The purpose of this patch series is to incorporate pm runtime framework
> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> driver during system probe time. During incorporating procedure, original
> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> are bound at system probe time too.


With this patchset in place I can crash the board using the following
sequence (SM8350-HDK):

- plug the USBC DP dongle
- run modetest at any mode, don't press Enter yet
- unplug the dongle
- press Enter to stop modetest

=> the board resets to Sahara.

Please ping me if you need any additional information from my side.

-- 
With best wishes
Dmitry
