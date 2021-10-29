Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EF04402EF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 21:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A89A6EA77;
	Fri, 29 Oct 2021 19:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F0B6EA74
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 19:10:17 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 c8-20020a056830348800b00555b0c12d95so1719052otu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6E8vcYJD1fKDP3XaD/ycH8JYuUdwy86+ns+dWhU9gv0=;
 b=RocDwXFrDGO/UvAZFqVuRg/v72xtGyOM9Lk5I2qYuyt1+h8yABESCofSInZzYjJ7g5
 cOTtJivWVwprgwt3Q5LXiAJYIEl+sdyNTcBH1qmMMZJlh1QmB9bHBS76g/C8pElZQDuB
 q4l3oiqhf6zDfV9HFpik4L4/j1+eP7S6z4164=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6E8vcYJD1fKDP3XaD/ycH8JYuUdwy86+ns+dWhU9gv0=;
 b=tH3Xnz46CmgZSofJY87wp9YWk1qfWxoYkTMec1EpC3vQ8Fxy5nT3n5U3HgQCp5Xhvh
 bqBJhOiY1qPXwJeoWaWxhCXqMXMGClLX7bBC6Z6a/wllSCzdha/56Z24dViLgFlDo6WR
 wc1UGejTtWWL1+j9etNsRAIA+UYG04dcaZx56kx7WN2eIk0ePmyEuLnOJ0ViTlKjuMLS
 F8xqfKB98XX48ItWtJSFPza5P38BoLogg0XRB7NajkfApkAO45KlHYrC/mzeHmKppIDU
 B8BwVeLj807/7Sj35vFQaZ8+OWlsE8BkXxBuVQJuwFltyg5RP3Y+zJyLiBdaAr74s6JE
 +vVQ==
X-Gm-Message-State: AOAM531WlfOqajsYqDcaqHmQvRPJzAKZKY86RPzxtvPW5w21VcJk2GYJ
 ykRVA9FCFdlRQZwF22Hc0Y8p+eWH4ar7ooYhKzeVqQ==
X-Google-Smtp-Source: ABdhPJxCk6IMb59lyzYez87DGQZ6Gc3q17oYBRmUQDgX/ynDSJlazwQKn7ZL0Q43BMkQWirfnUQPme8eEHyOBDDqfXA=
X-Received: by 2002:a05:6830:1290:: with SMTP id
 z16mr2825771otp.159.1635534616693; 
 Fri, 29 Oct 2021 12:10:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:10:16 -0500
MIME-Version: 1.0
In-Reply-To: <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
References: <y> <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 29 Oct 2021 14:10:16 -0500
Message-ID: <CAE-0n51eW3kkeW+3vJyqVTUF-R5G38SF2VjXi4SksuFbz=zcQg@mail.gmail.com>
Subject: Re: [v2] drm/msm/disp/dpu1: set default group ID for CTL.
To: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, y@qualcomm.com
Cc: linux-kernel@vger.kernel.org, robdclark@gmail.com, dianders@chromium.org, 
 mkrishn@codeaurora.org, abhinavk@codeaurora.org
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

Quoting Kalyan Thota (2021-10-29 05:30:19)
> New required programming in CTL for SC7280. Group ID informs
> HW of which VM owns that CTL. Force this group ID to
> default/disabled until virtualization support is enabled in SW.
>
> Changes in v1:
>  - Fix documentation and add descritpion for the change (Stephen)
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
