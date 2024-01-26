Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD23D83E355
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63F610FE51;
	Fri, 26 Jan 2024 20:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74E810FE4F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:24:54 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5ff847429d4so12734287b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706300634; x=1706905434; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDpAa3J0tQehwA7Ry5x3tOdmo/d5D+jLymbO2mRHCxM=;
 b=vh+VNkPiey3Myz3Ee4kulMgNC70k8Ue0ZklilkswhWpS5eBGpSICRHKSecNnEz/uf6
 XSt8/1vkRFB5socT6kJ+n8nOEUFT2dk28gKR/mU3qLQUqWIyIBeUAkFh/tsB5vZYD9qw
 HVlKd0GzKHSy86qGVRcGW+JEghK+sSCfhx9rQGJycDGJj2BITUlvUew7ESIJIock/3Dw
 XiD3QLjvMd4NnzhzKkxnO5t4UnS0WCU3IK+1VKNP7tGyIPThMs5dhRp+vS2fVeiM8c3E
 7lm3rK/F1AAvw19e6+tzgeGcSuy4N5BnNAlkOjria3/UZ9VHOG6smpm5jYXvHAnrIVY9
 fCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706300634; x=1706905434;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDpAa3J0tQehwA7Ry5x3tOdmo/d5D+jLymbO2mRHCxM=;
 b=Ohcb8Y/kboz2OR5Rww2Rv7Kmnq9rbU/4/Y+uAE8Oh8us7pvNCq0M3fn0mGJyO0gc0C
 3e5uiLBSbpP3EqOJMdV7NDWBORXD8/K1CoF2awnKU1s22oWUcthq5DZYAW3pM277TugR
 N7sLNHac1gIJPPamip0OJYjbqqKB2g2TmKMW6yLsPR3q/aAKiMOMakzdvdmqOG/O18FC
 1jZX5jpaDye+bOnINzJAXzWAMHH7WRRDqhxLLS7/gziYpBUjomA9Rxw9kirO+hvYS1/q
 0ftI6LzFKT8zIs+uVI05165NbjnJ22g4gbpUBodR9cpeHM9Eh3lpHXeo5l1fle6rMmVk
 w7hw==
X-Gm-Message-State: AOJu0YwMXzSoYi38pnvFXQ0rJPJS7XPvQz2QOa5lKrwz9I6qEU3tOES6
 Rx7Dpr9F7XSifh7lGbA309CHTFMmfqEM4n9dr/TAXhOYriPTPj5g8iSXCgTu1sNh1fL58VTbiOd
 yzz9NU4ojO1ELMbmC/Sy7TzkOPFo+me0wU22SPg==
X-Google-Smtp-Source: AGHT+IFPF1qh1U967GMR4IMG8c2YBW/cJng//YXeuLBPB86SGHhjM8CdAyJiEtMQUeyEpXkZzGmpDP4rnUUw9ZtJD9I=
X-Received: by 2002:a05:690c:3603:b0:602:ce8b:6aec with SMTP id
 ft3-20020a05690c360300b00602ce8b6aecmr735792ywb.51.1706300633869; Fri, 26 Jan
 2024 12:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 22:23:42 +0200
Message-ID: <CAA8EJpoNuWaJTGs7MfHCQ+OE69HT+NZ1kjEw0ZJtvhZyS778zg@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 00/15] drm/msm/dp: clear power and parser
 submodules away
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Jan 2024 at 20:26, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
> dropping the dp_power and dp_parser submodules.
>
> Initially I started by looking onto stream_pixel clock handling only to
> find several wrapping layers around a single clocks. After inlining
> and/or dropping them (and thus dp_power submodule), it was more or less
> natural to continue cleaning up the dp_parser until it got removed
> completely.

I see. I have resent v3 because b4 for some reason didn't pick up R-b
tags  from v2. I didn't notice that `b4 send --resend` doesn't pick up
changes and just resends the previous version.
So I must beg your pardon for the spam. I'll push R-B tags via response emails.


-- 
With best wishes
Dmitry
