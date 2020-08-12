Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B838024349E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905496E52A;
	Thu, 13 Aug 2020 07:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C5A89862
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:35:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p14so918532wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 00:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XfihqZsdjcdv5tVC7wFsr1o1gj8RLJpLWlctKxN00t8=;
 b=D1jFIJxPQA80z4Eomgeer1iZdbOW9i+Hnn/nDZS6eevvWKao7/cwonferaNNU0lDOn
 R2PlHUawpbNnQy2lpSfhVmDKCpV5+3ZZrjVrht4ftusjDyemANZuF8poyrzzDdkZlrTP
 NZWxV8t02OVEbriVK59+v/oTltvWcdYasg/x6cSmxX27Wg20UEftg5v0pjztSMFzgZdh
 1a4OACCvYZAA6lgr4+CZ7aADb2ZEqDAMxLN4T6H+YvD3OwPPhY5yrXswYmBip4mAW08o
 s32CNccl/Xgg1SNdFl8S9DlNGqKtX+ZK0qkzi6pf7thn24wUWViiOHhaojWLqpgSqA6A
 oj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfihqZsdjcdv5tVC7wFsr1o1gj8RLJpLWlctKxN00t8=;
 b=NouUbp/jBAWSYFk/zKWGUN1LmtvRTAx+5GQhDtiDQkYw4H+/HBZ5zqk3BzsIecEl82
 QuxQ1HTDx7ZsITgS4nDno06Cnp8Tk3S2hM6XmLGvRo6gKUvDVcqnXBEWEP390n78D6rx
 UfPCZgarIV4JQWgFFUBBadKGVoiLFG4/aQsUFUPfrgcpVJiL6uxRslfL92aSr9VE5jt/
 hAMvNF13CfTin6qypiTZa12u3AJWsr021X9VFr2M1QhEX8X3QxwJsLM/A4KvWDJOmxTE
 JGVCKL8k5skDVqcgkVqS9ryXfCzj5nqO1AODxaVBw/x1Kk5+G0hCMk9fcsQvBGwWLr4l
 2sdA==
X-Gm-Message-State: AOAM530oQCJzdKLkQjZ78/xBzEhklX0MD/MZx42+r6/YfuO5Oj4uWbYG
 wbhrg0PgojwSCsSGLluInfI6Q1jrD28c/yBR3FmJ9w==
X-Google-Smtp-Source: ABdhPJzBNC/YM9uamzZ0gfpPsY6JeU/UxZmU8cQyqqtnB+YoX60CEAXzfjO07RBy0Wno5duRrD7MVej1m1/TUxoj2w8=
X-Received: by 2002:a05:600c:2209:: with SMTP id
 z9mr7122422wml.70.1597217740367; 
 Wed, 12 Aug 2020 00:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-4-rnayak@codeaurora.org>
 <CALAqxLV2TBk9ScUM6MeJMCkL8kJnCihjQ7ac5fLzcqOg1rREVQ@mail.gmail.com>
 <CALAqxLWg3jJKJFLnnne-mrQEnH=m7R_9azCGaGnEmFYR4EMh=A@mail.gmail.com>
 <ec5eeb21-48e4-5dcc-583a-ac9419659e44@codeaurora.org>
In-Reply-To: <ec5eeb21-48e4-5dcc-583a-ac9419659e44@codeaurora.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 12 Aug 2020 13:05:04 +0530
Message-ID: <CAMi1Hd1O+3bjQN6c9WQr+t0YXGBAukfFzJWtkgXDp1Zcir-0-w@mail.gmail.com>
Subject: Re: [RFC v2 03/11] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
To: Rajendra Nayak <rnayak@codeaurora.org>
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-scsi@vger.kernel.org,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, linux-serial@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rajendra,

On Wed, 12 Aug 2020 at 11:18, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> On 8/12/2020 7:03 AM, John Stultz wrote:
> > On Tue, Aug 11, 2020 at 4:11 PM John Stultz <john.stultz@linaro.org> wrote:
> >>
> >> On Wed, Mar 20, 2019 at 2:49 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >>>
> >>> geni serial needs to express a perforamnce state requirement on CX
> >>> depending on the frequency of the clock rates. Use OPP table from
> >>> DT to register with OPP framework and use dev_pm_opp_set_rate() to
> >>> set the clk/perf state.
> >>>
> >>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >>> ---
> >>>   drivers/tty/serial/qcom_geni_serial.c | 15 +++++++++++++--
> >>>   1 file changed, 13 insertions(+), 2 deletions(-)
> >>>
> >>
> >> Hey,
> >>    I just wanted to follow up on this patch, as I've bisected it
> >> (a5819b548af0) down as having broken qca bluetooth on the Dragonboard
> >> 845c.
> >>
> >> I haven't yet had time to debug it yet, but wanted to raise the issue
> >> in case anyone else has seen similar trouble.
> >
> > So I dug in a bit further, and this chunk seems to be causing the issue:
> >> @@ -961,7 +963,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
> >>                  goto out_restart_rx;
> >>
> >>          uport->uartclk = clk_rate;
> >> -       clk_set_rate(port->se.clk, clk_rate);
> >> +       dev_pm_opp_set_rate(port->dev, clk_rate);
> >>          ser_clk_cfg = SER_CLK_EN;
> >>          ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
> >>
> >
> >
> > With that applied, I see the following errors in dmesg and bluetooth
> > fails to function:
> > [    4.763467] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate:
> > failed to find OPP for freq 102400000 (-34)
> > [    4.773493] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate:
> > failed to find OPP for freq 102400000 (-34)
> >
> > With just that chunk reverted on linus/HEAD, bluetooth seems to work ok.
>
> This seems like the same issue that was also reported on venus [1] because the
> clock frequency tables apparently don;t exactly match the achievable clock
> frequencies (which we also used to construct the OPP tables)
>
> Can you try updating the OPP table for QUP to have 102400000 instead of the
> current 100000000 and see if that fixes it?

That worked. Thanks.

Should this change be common to base sdm845.dtsi or platform specific dts?
For what it's worth, we see this BT breakage on PocoF1 phone too.

Regards,
Amit Pundir


>
> [1] https://lkml.org/lkml/2020/7/27/507
>
> >
> > thanks
> > -john
> >
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
