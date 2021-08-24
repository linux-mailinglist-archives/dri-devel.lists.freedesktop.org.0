Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD333F6C15
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 01:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7A26E0E9;
	Tue, 24 Aug 2021 23:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DD46E0E9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 23:07:52 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id y3so22180219ilm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 16:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WE+YtBA3gJnr+ACnUTzWBgYKs5rZNaGQyfyCqSLCJh4=;
 b=XR8IPmMsfb9AITUHo8H7bgAFJbyTroEyqBamjYr4/G1KWUAhK9q9B/TaXjlqsz6JNL
 lmuSqtjEAd6pcHjtv9EvIFF0nyacrsz1Op48/IRk4c4mBbQP72dS06JO6BHCq14yNc3P
 Pp9LH7ufBggVEDobtoj8S/HX0fEXtUOLKHkS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WE+YtBA3gJnr+ACnUTzWBgYKs5rZNaGQyfyCqSLCJh4=;
 b=P+NGHYLU2iVtIbCA9UZHxUt4plxYP3emLy6M/uW86ynkYbLBp6xPq9YbXKLfOrlnna
 bEPONPV1Nzkrut0m4QGBvr/rJEJkJAs4MzLmIf7Z+Z8r3wmO06FrR44o0Mmz7phuIc4c
 AsmTiR2yJHoJRrWypHeZKsl0oY9j2uEuMQofBtlcvm1k//lOsYpcetHA44eC1hPbdWNd
 mmzIeE2MyeSC7ErL8bxxKv8qO7S/PxzEe8c8ZzNtPsIxK4ue0ZOd3NfIp5w/wOEua+Ov
 Oc1dSnjiEHVKtpLL++bUZDNc1wv+tG1Oh3mEyNZ81ftiU6U5P0PnSdvMUlHv8zlfv11J
 NmOQ==
X-Gm-Message-State: AOAM532p4rrC+8ZthiNmcQ4ZZutP2zYWgmGt9MC3Cd28URhu990QfRPI
 GyiCs0bCOy6jBQRG5surwJDZ+Oj9qTDNQQ==
X-Google-Smtp-Source: ABdhPJwTRdlwKVux8mb1oGEZpJK+KOrBz1nNL4gN/iYuXWlGvSFKpAWiHfa47pBK240GrL5TG5CRNA==
X-Received: by 2002:a05:6e02:1e09:: with SMTP id
 g9mr24388514ila.198.1629846471852; 
 Tue, 24 Aug 2021 16:07:51 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id a9sm10871127ilr.36.2021.08.24.16.07.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 16:07:51 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id f6so20911388iox.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 16:07:50 -0700 (PDT)
X-Received: by 2002:a02:644:: with SMTP id 65mr3305905jav.84.1629846469728;
 Tue, 24 Aug 2021 16:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Aug 2021 16:07:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VgWm76kb1KwsieTXUmddPgkENtGBQ2UtMzQ38ob+6EKw@mail.gmail.com>
Message-ID: <CAD=FV=VgWm76kb1KwsieTXUmddPgkENtGBQ2UtMzQ38ob+6EKw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: Add SC7280 compatible string
To: Sankeerth Billakanti <sbillaka@codeaurora.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
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

Hi,

On Wed, Aug 11, 2021 at 5:08 PM Sankeerth Billakanti
<sbillaka@codeaurora.org> wrote:
>
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
>
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)

The ${SUBJECT} of the patch should probably be updated to say _what_
you're adding the SC7280 compatible string to. In this case, that
would be the msm dp-controller.

-Doug
