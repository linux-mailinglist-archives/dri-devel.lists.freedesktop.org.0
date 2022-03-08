Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC14D20B9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 19:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EB710E2D3;
	Tue,  8 Mar 2022 18:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7B810E2D3;
 Tue,  8 Mar 2022 18:53:02 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c20so7311563edr.8;
 Tue, 08 Mar 2022 10:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbj3xN0iDcD9/ITu0QYceYztDmj5HBmZeXlHsmQyrHw=;
 b=B618Sz+Xe0Jlwlh7LCH+brDIS/apTr66CGVdpWmDijL1AfVKPArkwxSnfq3nIRELa6
 TUXfrPY1cssYxeKbeY+Ip/mOslS0mP/E1k6W0H2j2Y91NMPfkDtML8bJWVY8DCo1TyKk
 gTyIXNUYexF/C22ReOOhfIEDkTBOo8Fs8MLg5nnPeuPooL1PhgDOxoudzwiFWU5bUOo7
 lmxV2L+z26Wi42uHoPFYo2khhsU9eEyzNz0hc7z+McfjGRvcR8cxNDpSgOy6CUuwPU75
 pHcWFGSBqKOoOlM8Hg/NRfAPK7fnu9yWDoMzm+Yfdzk0jAf5WsyDy+XULVjTMg4K82m3
 FBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbj3xN0iDcD9/ITu0QYceYztDmj5HBmZeXlHsmQyrHw=;
 b=UpbVZqWxflvwbFPLDb9eZ94646v8cY5mbXLifCvfxf0ip95IpJ6TyUwTYZs9RvxO/R
 sErire9Ci6kMtTF6i33WttEjLznyn2wrq5g5NSdSi6LmAL0vGIIZ8MQMSTb2esxcRkZo
 u2s6zGpaknJnriTN+I0C92kMjOWACKk1EtWLSpiJ4t+PQ21VxRfEhDb2VL76WGigc6c7
 K0JJPKwYkfnEwug5r4KCB9wAkZVXtW7zQrL6bPUc4o+cVHoC9DOuHnbqUnbHP9xt4mGv
 Z3N6vIwgfVg+H4a6bvhjuwSCxcTfPBb3buOtZLm/4+7lKb97r0AlDxX0AXKI8hgI/n4R
 58Dw==
X-Gm-Message-State: AOAM532gJIYfP6ppQjl8ICufPK5/US29V/YejAocupE0VREpAPQsSKQA
 LnbTCctgkKpkCGXvdkiO/mnHjUB7rznoFgBf3kM=
X-Google-Smtp-Source: ABdhPJwOJAgm8wr1+UkxQb7mNwouA+rAJXuJwzkhiCZQ1YADoQAKP9kdCqJXn9nLHZLfoyyEyfV4Hifbp+0BVDY0Ivc=
X-Received: by 2002:a05:6402:1e8b:b0:3da:58e6:9a09 with SMTP id
 f11-20020a0564021e8b00b003da58e69a09mr17146759edf.155.1646765581293; Tue, 08
 Mar 2022 10:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20220308184844.1121029-1-robdclark@gmail.com>
In-Reply-To: <20220308184844.1121029-1-robdclark@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Mar 2022 15:52:49 -0300
Message-ID: <CAOMZO5Dkr7PqvgYpNp1fBR7P91T-x1ke2pRN6A6GWFJ7zBQo7g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix crash on devices without devfreq support
 (v2)
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Anders Roxell <anders.roxell@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 3:48 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Avoid going down devfreq paths on devices where devfreq is not
> initialized.
>
> v2: Change has_devfreq() logic [Dmitry]
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Does this need a Fixes tag?
