Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE6269F25
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ADB6E844;
	Tue, 15 Sep 2020 07:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA3589E1D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 01:10:53 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id g16so494305uan.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 18:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQe8P1N6J+catpD2FGyjuA0rVKzNyGu7ZvYrmIJxXS0=;
 b=CPieKcKFmqI0A432OirujHVCWusGNcfp+FTD58zjMQqp8/y+QHUJnh7Uu+LDAkp93O
 rxVDQasIsh6IzkjQS5ZdG/bAIK5kEYsQrikxVKiWdUHDQ6dwyWEf6pNhoeP2ygCHyJZL
 ZLFMHALsBnhoiF47mwaj82Jg98m0HVQww+x1ZrBrRw3uYZTPpplgEMenAGcJkXs13boV
 TWpVZIKgz/pZ76bpdMZ8lrcakz9qPwz5QNV6lLZlAzkav7UhzqyshX9CwyoaAB08ezaO
 2RbWGaUXZTZz+DbEA3+kPNkmWF/7wdn8rZUFnkW8up0bnCjXtcIgLqigkmF0gtfv0GKd
 CsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQe8P1N6J+catpD2FGyjuA0rVKzNyGu7ZvYrmIJxXS0=;
 b=NURVwDdvtpr6gQubPV1NI/Ec0RaSdwffs2mJvQYqQ72nS2DWB6UlIaJByMssOgZqoY
 DvjSPNk0b47GXo1YpjbkineL7T1s5GRvdK+ybvWsXrlBfTyplcxv6zH14sb0OHeGPsw+
 ZlZipUuvmS/202gXip4uaLPcfLz/ocrPQThcmKmrlxUMeU95n8dpMFxaYges+WQkXVvb
 TyVgFVgdmx+Ey3Z+C/0Yl/OgHbqK2JXAqaEnVWv8ph/UrKR3asiLz+hT4O1EuJC1FLih
 Aqmob26A+JCm6+Jyv8AWrtZ5rWjD2KyKkicgZ4RdXPsQw9KyOEt/mE+U+taamzDO1BQN
 ZanA==
X-Gm-Message-State: AOAM531cPezg1hCYfCn8KAeWL2l+fDT1ZGHhTLtWp5NRzrVopQbWNa8D
 0TUigd53uODe0ul7r+xT4JN1W2+qe0rSTj70VP/8Xg==
X-Google-Smtp-Source: ABdhPJwXpUfnFXL4MQIGxKqKNhStBrC/UU/lquNclSfvKZdtzGCCZ07V6MS2IqMF19BHMAmNg/zLODWkRxrk/evBwB8=
X-Received: by 2002:ab0:2404:: with SMTP id f4mr8665652uan.108.1600132252547; 
 Mon, 14 Sep 2020 18:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-1-linus.walleij@linaro.org>
 <20200609200446.153209-2-linus.walleij@linaro.org>
In-Reply-To: <20200609200446.153209-2-linus.walleij@linaro.org>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 14 Sep 2020 18:10:41 -0700
Message-ID: <CAMn1gO52PQ-dFbCU49FCnJZz=gyLEE3F2vZ5rtbF_C-H+ur7qw@mail.gmail.com>
Subject: Re: [PATCH 2/4] video: fbdev: amba-clcd: Retire elder CLCD driver
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
Cc: Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 1:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> All the functionality in this driver has been reimplemented
> in the new DRM driver in drivers/gpu/drm/pl111/* and all
> the boards using it have been migrated to use the DRM driver
> with all configuration coming from the device tree.

Android's FVP configuration still uses FBDEV. While it would be great
to see it migrated to DRM, this first requires resolving a design
incompatibility between Android's composer and DRM devices that only
support software rendering. I proposed a patch that would help resolve
this [1], but there was disagreement about the approach and I haven't
had time to get back to this.

Can this please be reverted until FVP on Android can be migrated to DRM?

Peter

[1] https://www.spinics.net/lists/dri-devel/msg255883.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
