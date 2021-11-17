Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B5453FB6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 05:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B2F8800A;
	Wed, 17 Nov 2021 04:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432DE6E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 04:47:56 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f18so3717759lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 20:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8U2582OS1JaBUff58dtaXUBiFj+EMR4BTAPwq+0xIaw=;
 b=Ja0Ly8463jJKuAdQpWA9GcfTz/Daj29Uu2xpAl1NWvznw8nGJu/8idwsv+h7nsS0d7
 sbeZ7SxYetg0OxoD1VJAouul5fHz8PZ8Y+WymnSq10XoGlkkBjnWXb0NY8jeSOtSQW3r
 NulV4ePey2/k2Hd5WlTG3cQOSTOZj8Wh2UDkavPJsLslIU20/gedLTDWYxsZAaKt34N6
 WS5sQkUMcWWXNMLjhv3n0pg66FCkN7QCUZjzDUF7xQ33AMyqSkOQ+Co1ellV6tw7Z+OU
 pPFessNFKq7IMJtSvyHelqGXb085MkRXli8fd/Z0FLR54PilmMiSct7p4NMczpCyoZjr
 /vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8U2582OS1JaBUff58dtaXUBiFj+EMR4BTAPwq+0xIaw=;
 b=Ouc32gBxiny6XKr6dYCNLFlkaQPiSqhGE/leKq04w46Zn6F7y2wkmt4d24TC9K5ViO
 bIQY4JPD8RiV0RWQQXGbtXXDcZHzMwR9VR8SfI8gGU8GkNh4VLAXi/C7Teu96K5vu0gS
 pDSewUJDZfv+c98hddBzxnTbVhkEHcrpfkFsc/HvQV3FG0fFnZz5lTEo472C/sNHtAD7
 UsAmhMG9tYumm6J9/fs/yd3bYIYEKBuuyVukN0xv4u94YrS/IDaMfwatnRLd1y8d96PB
 dIORviJNoL4ajKEPZq6Tz42z0OOjTvoTYQ/9rg5nYfn7rJlE6bbdhtSEnHjwF3+aGZ6/
 N9EA==
X-Gm-Message-State: AOAM532UNF5wYDJ+eNsGJmKyq6wUyXSefVEIYRzIdO8z/ucvnrJGFUMO
 S7xMiT+zJoU/Ik52Apcb4XJI9GN3pmFZ3QWlghLubQ==
X-Google-Smtp-Source: ABdhPJyldWMENzlShuXN8AJQein9+ZsGwLrHFzyV/qsCAWzPwXoeo0B6vnn8tzVqsZ6DlJyqFYmqFXnBQniUo774f18=
X-Received: by 2002:a19:c105:: with SMTP id r5mr12116791lff.661.1637124474573; 
 Tue, 16 Nov 2021 20:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20211117020724.2647769-1-pcc@google.com>
In-Reply-To: <20211117020724.2647769-1-pcc@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 16 Nov 2021 20:47:43 -0800
Message-ID: <CALAqxLWn67emfDPcMGrjVag0zCCrNF2=rEiHKQgr2eJ8AotCPg@mail.gmail.com>
Subject: Re: [PATCH] lontium-lt9611: check a different register bit for HDMI
 sensing
To: Peter Collingbourne <pcc@google.com>
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
Cc: Anibal Limon <anibal.limon@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 6:07 PM Peter Collingbourne <pcc@google.com> wrote:
>
> It has been observed that with certain monitors such as the HP Z27n,
> the register 0x825e reads a value of 0x79 when the HDMI cable is
> connected and 0x78 when it is disconnected, i.e. bit 0 appears
> to correspond to the HDMI connection status and bit 2 is never
> set. Therefore, change the driver to check bit 0 instead of bit 2.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/I7e76411127e1ce4988a3f6d0c8ba5f1c3d880c23
> ---
> N.B. I don't currently have easy access to a monitor that works
> with the existing driver, so it would be great if people with
> monitors that currently work could test this patch to make sure
> that it doesn't introduce any regressions. Otherwise I will change
> it to check both bits.

So very interesting! I gave this a spin with my monitors and it works fine.

Vinod: Can you check the datasheet to see if the wrong bit is being used here?

thanks
-john
