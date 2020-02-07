Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A3157155
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890156EB86;
	Mon, 10 Feb 2020 08:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F6F6FCBA;
 Fri,  7 Feb 2020 14:11:07 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id d15so2336057iog.3;
 Fri, 07 Feb 2020 06:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hwAVc8buUw/sXi4l5AGn5t8v/Of6qVn4+kM7CimiWbs=;
 b=RiThLvRaLcY+VY1nLgFfR8Wc7ihO/J62UUWv3LUtuTcFUBZfZCQF9Db7FXUxLoxK1C
 MvU9Z3ZTiELbj071a88cJKvn106vCNg7tFw+35XrbOrgfQ1m7ZBDZ9tlc1Mt+HV4TgfZ
 xBsn5/FxnhZ7cZqQmjCc03kKSe0O1SJl7A+E41hp5Qg58Sj8/eixwP9rZrj2fJT5Ps2+
 rHVvQYpZMaOqfhMCiKWYivGnJY+rV38VK1kfUfoWETqfaa2ZUU/U/feyqdsy0tTiWGtw
 arb9C21VMXHDNZAlH6y/vlbRmDtE59FkdRmkyxayDazwYJuuUE8gs6/lfwQsR0SILMDV
 0yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hwAVc8buUw/sXi4l5AGn5t8v/Of6qVn4+kM7CimiWbs=;
 b=UEScTPxE4P4t9w8K2IQJIerB1BjVyuTx2sgYvNt5UULGLo+lsBnlkly3LBbxtlxxIc
 zqgwO7rrHtTqWMADKN0iXccgH9HBxKBPy1gyEhho+G9u8UKVsL7VnhLBX3QeNvHpH6Pg
 868PT9Mog3Prbkws+Pz8hCqjgeDLtXJ6ct5mwfPam1dlITqoXAvLgDqO62EASIaS0YHw
 T4cJqyulkdpJZfyw+v7HftnySDQpGQN4i/kijvAhF3bb7dJzzqLcnxkzS01S5AyaSwcs
 2npUJ6GQqlM6yGZmByo/UMy43GVT+GWplV2NxKzThLvDPtGCVl9vtlCGVu+Bif1+06XM
 lysA==
X-Gm-Message-State: APjAAAWsw30is+9hYoQUptJ71DBrHbn57SUTeeVRZHb7RAlkyBhIMV63
 giSzUUcwWONVS+Xfh7fqmCzLQxnIqwor1baE8S8=
X-Google-Smtp-Source: APXvYqx3j7zH+QaAUuEIZqF5KOX67+KACiYeFAz54D60MjqYLdvguyv/8mRyGFXbS5DW7jigB5BO9WpWi0BjLQzMaTc=
X-Received: by 2002:a5d:8c89:: with SMTP id g9mr3170240ion.178.1581084666491; 
 Fri, 07 Feb 2020 06:11:06 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
In-Reply-To: <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 7 Feb 2020 07:10:55 -0700
Message-ID: <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To: Harigovindan P <harigovi@codeaurora.org>
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
>
> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> > wrote:
> >>
> >> For a given byte clock, if VCO recalc value is exactly same as
> >> vco set rate value, vco_set_rate does not get called assuming
> >> VCO is already set to required value. But Due to GDSC toggle,
> >> VCO values are erased in the HW. To make sure VCO is programmed
> >> correctly, we forcefully call set_rate from vco_prepare.
> >
> > Is this specific to certain SoCs? I don't think I've observed this.
>
> As far as Qualcomm SOCs are concerned, since pll is analog and the value
> is directly read from hardware if we get recalc value same as set rate
> value, the vco_set_rate will not be invoked. We checked in our idp
> device which has the same SOC but it works there since the rates are
> different.

This doesn't seem to be an answer to my question.  What Qualcomm SoCs
does this issue apply to?  Everything implementing the 10nm pll?  One
specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
so I'm interested to know what is the actual impact here.  I don't see
an "IDP" SoC in the IP catalog, so I really have no idea what you are
referring to.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
