Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5AF2422C3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 01:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7578D6E85E;
	Tue, 11 Aug 2020 23:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F736E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 23:11:59 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id e11so498689otk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sGbgkpKabSRtvJFDP2cpGjFLq6qGka/uiZ+Vq9DL/Ow=;
 b=c+fmFqlTRhySOXMlvaJbso581+GBoEadjNClaEYTZEpjECXyeroSqJz0uvu/2+65RS
 GljkKHWebLTvyXe+LX5oUd7YPsah8EBUA6JHSjDQxpvFuhki5b7wMxRNSsUbXHUCJnqq
 SiAdhBT/u5SkBV0BNPQrO+NNNl2c3K4iF1EOQzL9Ozj/7uZ20bTMLYgzOeFbGVTz33UJ
 Io3yO/6ahoYdq8CmnNmVbeddS3V92417Yyv0lhIvmABUcQdBRbm5+lb3tq9/u6AX0IHE
 4FTDr409qB7h2z4Ao2Z/8iqpBOElJ568n7exBhDKyQRsW0gXenyYLgx+TTbk0US7++/G
 k5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sGbgkpKabSRtvJFDP2cpGjFLq6qGka/uiZ+Vq9DL/Ow=;
 b=akMpEJf3i3W3+a3C/R174KbmHxJyE/5jRYS3wpWwRh/S1AiKMzv5tPOvu7mn4yAt5H
 HxpzdeNIDpdp9JMk7gIwMQj2P47k+T19tF4aoStVqlD4Cca00Y+PckYZmY0447ZhhCX4
 a0g14G7Y2fO8GURBHVkyinnwMYKUVBfr5ZHVuo/skITdBfcK+ELOxjMHfjWtJ8kYU8/j
 1AdulLp0tOIlgKRaSmRaCxjfoJJ0LH96XerkWngVcsU8PA9pczJ0VY9MUzVVhWm3ARyp
 rOtnrynRBN0XDM2oUd/fXfzA0xoZ53gdcZ4HXveISpMvlSsPxXxCwy1lgxEcVI6+q9GT
 k1ww==
X-Gm-Message-State: AOAM533MvXNNHZE12ulQOPsyC1A63QvN1vwqD3eddjLdwtyybGCeWj7I
 FqWekL739L/xDzmy55VLb6hYMV4Mg1LVFOwt5j+jAw==
X-Google-Smtp-Source: ABdhPJz1l9i2eKeP99P0PVUqqfuqJ5MZWZKQYvADHHuV2THqxFZqfBLD5UUNVDPsADND7VkQzMhYIL9g7q6OWzOUHNI=
X-Received: by 2002:a05:6830:3196:: with SMTP id
 p22mr7492118ots.102.1597187518112; 
 Tue, 11 Aug 2020 16:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-4-rnayak@codeaurora.org>
In-Reply-To: <20190320094918.20234-4-rnayak@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 11 Aug 2020 16:11:46 -0700
Message-ID: <CALAqxLV2TBk9ScUM6MeJMCkL8kJnCihjQ7ac5fLzcqOg1rREVQ@mail.gmail.com>
Subject: Re: [RFC v2 03/11] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
To: Rajendra Nayak <rnayak@codeaurora.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-scsi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Linux PM list <linux-pm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-serial@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 20, 2019 at 2:49 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> geni serial needs to express a perforamnce state requirement on CX
> depending on the frequency of the clock rates. Use OPP table from
> DT to register with OPP framework and use dev_pm_opp_set_rate() to
> set the clk/perf state.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>

Hey,
  I just wanted to follow up on this patch, as I've bisected it
(a5819b548af0) down as having broken qca bluetooth on the Dragonboard
845c.

I haven't yet had time to debug it yet, but wanted to raise the issue
in case anyone else has seen similar trouble.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
