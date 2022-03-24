Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBB4E6B40
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 00:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D4510E1B6;
	Thu, 24 Mar 2022 23:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BCD10E1B6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 23:35:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p15so12200088ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0o8oWeOMAEkOTxmLuclyfRnkj3vNYhXxWM1g/i8YYyw=;
 b=PyGnV6IKjC3aOySkg5s9HM2x1RHndWLLDdlwrX01jNIlZJGsrt29r2qugLL1ky7b2X
 rjoJNJF90LPo9254rkevlAXVu0ghfHuHz71lZUnZzYsWYfTyQQKwIRMEMhxdQq+eCpeu
 sa9PF6/EDr92RxDq2nMD/uxEU7ZJdlAGiuRFg2L6eWL1/lgjPi7D69d9yV3PA1uc6q0C
 u3B2coYHb+0WnbqJd0iRw3p0Wrhu54LmW5mRyp5+oFH/9jbzd+k/MoMs0H8vMWOn4ogN
 3lbUOnJ/Iw4+VHEgYHN0CnZo7lfFofhSxWwB76VvH4yMQEqieTF/pkzeNoHF3vw02o7B
 aOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0o8oWeOMAEkOTxmLuclyfRnkj3vNYhXxWM1g/i8YYyw=;
 b=2h+61cCYXVf7hsNuWhTetQmHoyuPYV4KD8RGzx5yF7nNG0QPRipFPmfjGKS6B0oGWf
 8SzPeiAVak8Jm1z+uqEUDzNVdPB5HcKfc2fu9MjiVnfP/InZ5OUVNTrn1tX40T32Zb+X
 HDLAhnQLeskmVR/erk1fzV+Gx1HQpl1E0HYwz4wTvkW/qKGkvr3bZy2dtchrXbcsHGKz
 1DbuIEeDHaU0pxfjTZxZQ31YdqEGJzE7/mdFEavnCgDWzjw/0akB6coWPbMctmzznxjF
 iZaitxT7Q8GTM3TMugyDU3SQsDgyHFNB7uJ2GPAWqysqIw5iOuTSvrnIM41BUZtfF7Zy
 vWOg==
X-Gm-Message-State: AOAM5338Dmo/LhyVcwAUX+NqF3vRTE03lew/YflO7Pql9N73Esip+57f
 sm61f1eLE2JNaxP5KlM7njBewXn/jLArJUuFC0Lc7yVM
X-Google-Smtp-Source: ABdhPJx2XAfqjsmN2+Mv+7/Oc+pDkDeioXPkvZDamVrLp4s9Vxi3/kV4lBnANZ8B6DhawEFcxbUiePZblMhua3prnbE=
X-Received: by 2002:a17:906:478b:b0:6db:8b6e:d5de with SMTP id
 cw11-20020a170906478b00b006db8b6ed5demr8825286ejc.161.1648164949096; Thu, 24
 Mar 2022 16:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <1648163409-18338-1-git-send-email-chunkuang.hu@kernel.org>
In-Reply-To: <1648163409-18338-1-git-send-email-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Mar 2022 09:35:37 +1000
Message-ID: <CAPM=9ty5wwXvtU6W3yZ4Kgk5V3+ZiQFibSGhDXr+a7RxUpOAUA@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20220325
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Mar 2022 at 09:09, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Dave & Daniel:
>
> This includes:
>
> 1. Fix dt-binding issue.
>

This tree is based on a random drm-next tree, which I can't pull.
Please base it on the latest drm-next tree.

I tried cherry-pick these patches over and it failed badly on the last one.

Dave.
