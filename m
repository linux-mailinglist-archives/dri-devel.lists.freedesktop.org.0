Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD291EBDC9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 16:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6E789CB5;
	Tue,  2 Jun 2020 14:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7365E89CB5;
 Tue,  2 Jun 2020 14:16:29 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id m18so920157vkk.9;
 Tue, 02 Jun 2020 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/6a0t6+7th0CQZpcLX9FSsj+5y1OPdbod01fcXwFCW0=;
 b=sAAGbc+hD14yma5Er/rT2CCXst65zCjTzv3RNPwbAeZqS0/qsLDQWFjHQjoTuGAeC1
 +ipXKm1ZoDdcONOTRhvidUfFwpVg9ZsOpg2F9JImpLXgIqY0vPmq3ISAC7ehqsaJyMmq
 ZIFnQiTa33xomn0HYM9RDwIFwF1icxNzbRDDq6u6o9Q1UGOmrT87cYXWR/pujy6Ekztp
 2UuzBjskR5IeOYFERkM/ERIzFsjrdlN3XM2XasDzmANJrlRl4hlq3+XNUK4ornQQazI2
 FWhzgAb1osiFDN4tgCYp2/JcYCQqPDD7ObSfnTlXAS7/7NHk0s+GDr6H2eP6sns6ZMVy
 FruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6a0t6+7th0CQZpcLX9FSsj+5y1OPdbod01fcXwFCW0=;
 b=kuxMRy52QXqbRYUZNGETRbjxr9W4pNVd+vRpmOrNPLIQ8cHMamUAW3cXI1MoV301PS
 dPPNeVptkVAOQBUkvvcUwrI4/UA6dBWsEEIWdpAXXaUuKoHY/8+fOBYRhd0FjfSs0NyT
 SMIeMAuOSgBZyJBIkMLCspRaGM5USZcIQYOpExvYfgwyIO51zE2ELD2YGkRLKDXJYyrA
 i54oezTb4nP8d98PDd0wmxbHQ5K0nNpiiUr1IW9Mpitxivv7vELE5fFndd7kckG6ZN7S
 1Q15DieUJpdTmqJIfycd9jCzuULIQwQX8zEdWiQh8jYq1/N8/8lXqfaKnQUiYhWz2Sxq
 NNfw==
X-Gm-Message-State: AOAM530dMRklyfikBbhK32WDt3tFW9UgdXy4hSuw5A1u41IGTf/MvWlt
 IgIiPWtXtJHoVzEFz4k8N7ecAchwIiopIOeJnOI=
X-Google-Smtp-Source: ABdhPJwsUlpy33FnIB6m4RAYn6vpQrhwYECjwYK+Cfnuf/EDhnqFeqzbq/cAlJV6cbDMbQlGYt6WBz8NxB2C5SttY3Q=
X-Received: by 2002:a1f:2ac6:: with SMTP id q189mr9360992vkq.28.1591107388620; 
 Tue, 02 Jun 2020 07:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 15:13:10 +0100
Message-ID: <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
To: Krishna Manikandan <mkrishn@codeaurora.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H . Kristensen" <hoegsberg@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krishna,

On Tue, 2 Jun 2020 at 08:17, Krishna Manikandan <mkrishn@codeaurora.org> wrote:
>
> Define shutdown callback for display drm driver,
> so as to disable all the CRTCS when shutdown
> notification is received by the driver.
>
> This change will turn off the timing engine so
> that no display transactions are requested
> while mmu translations are getting disabled
> during reboot sequence.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
AFAICT atomics is setup in msm_drm_ops::bind and shutdown in
msm_drm_ops::unbind.

Are you saying that unbind never triggers? If so, then we should
really fix that instead, since this patch seems more like a
workaround.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
