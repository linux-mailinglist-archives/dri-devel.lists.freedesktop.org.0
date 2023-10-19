Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E97CFA57
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 15:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F69810E4D5;
	Thu, 19 Oct 2023 13:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337FE10E4D2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 13:05:14 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-59b5484fbe6so97590427b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697720713; x=1698325513; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rbM+qQUNE2weQ5cnzFLT1Qc6XFwhF5OSMBSFH1UxmMI=;
 b=kG5TiYg8HosUSuTaRJov2e7no8m5DaBXjFoWXojO5EX2CC7XNslwz6YZEl+LnSDIlZ
 vD4PzFJHgxh6VYy/nBQCEn7kj3OupPbWSr4GVHbDL9uXulp65MtYVXF3U71fSmPgovVI
 UILdDK9EGaQR0ff5bSrq7zM6D76R4HaYMhO7ihbyHTq1ZEDbu4uTVWnS097RsL4p9JRW
 zy7U0AWVKHaJVErsaFHdqApgwu1p8Ojd810wMsFGSwwxCvp9j2eALKOagjCXmK5LjGZC
 koGyxZsGoD9SATjni/YKeTF3iroigiTLyFcsyQzZQ13G3WumIKW3WpYNNRpn499di+p4
 6odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697720713; x=1698325513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbM+qQUNE2weQ5cnzFLT1Qc6XFwhF5OSMBSFH1UxmMI=;
 b=SfxJUSFFjuUZXzbiFHjkcZ1QhRjZLLXRNPolt+qg781MVO1h3jTH0moyRlZMJv7wob
 5wjXGe+2KuKWPJ70LBFIt1moAov73H4KxxPrXzEKbUhf/hweenF9RjfRAmJTVJ6s73G1
 LgIQAcO8buUj2FGUt4rhFGpZShHtQaYrXps+FGRJeukR3ZqoWwBvCvdgYpeMTLFT2ilq
 Lt2xBSMGl78tJPULur5XzYZpEGHKciowaYp9T9CV+0QpKTWmEivUnh56VJqMgn3DDej8
 xEX+ZUir/FXUhBuzejuqbO8nMF3D+9tWfESAUBDHbVhtDFp4Wr/36CaqTmmcAvXoQF9f
 bBqg==
X-Gm-Message-State: AOJu0Yz7ckLCIBUtyX7UPI+3J/7OBMGMwZPCcg5RIjer7BLUaFtbENgA
 hFN2q/SCscCpz9iuh9b33wgHIiqYTNBgGgtwDCLwLQ==
X-Google-Smtp-Source: AGHT+IFdSX1HpPsh0RDrBsVBXf68icjGXwoNe/l4tlQ0yV1+tnNZAErnPCdVrGpNL24iHTDqyWLASjGL0KKSf4YU4UQ=
X-Received: by 2002:a05:690c:f01:b0:5a7:f002:4fe4 with SMTP id
 dc1-20020a05690c0f0100b005a7f0024fe4mr2703160ywb.23.1697720713175; Thu, 19
 Oct 2023 06:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
 <1ca930a4-60fe-a867-f676-0b79682982c2@quicinc.com>
In-Reply-To: <1ca930a4-60fe-a867-f676-0b79682982c2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 Oct 2023 16:05:02 +0300
Message-ID: <CAA8EJpqE6b4qi0vaV-gypCwyVHwDibC+rVB5SgBvK58cyU9uzw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: cleanup debugfs handling
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Oct 2023 at 15:33, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/19/2023 3:44 AM, Dmitry Baryshkov wrote:
> > Currently there are two subdirs for DP debugfs files, e.g. DP-1, created
> > by the drm core for the connector, and the msm_dp-DP-1, created by the
> > DP driver itself. Merge those two, so that there are no extraneous
> > connector-related subdirs.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
>
> One concern with this is, we are migrating from one debugfs per
> dp_display to one debugfs per bridge.
>
> Today we create one bridge per dp_display so its fine.
>
> With MST, I am unsure if there will be changes needed.

For MST the add_connector callback creates a new connector with its
own implementation of  drm_connector_funcs. So if necessary we can
create debugfs files for this new connector.

> But, we will figure that out once we add that support,
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
