Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D14AEABE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7F710E2DC;
	Wed,  9 Feb 2022 07:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A1310E2DC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 07:06:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8272B6173C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 07:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CD1C340E7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644390415;
 bh=IaS3n+YSyvbjKGntCu5fWfQp5qdKI/SX1N0ILn7hVFU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ua/zxuL/fBCLCAIBGyJScWR0a7rxYlNzEsh6QTeN1tmXJvLMXpraG7Ao5bhxCml4f
 MGbh7JsbvGc75R6DCwlf9ba+McyrzSCOPDRJninqKjAuDSiknVX6z9MEAsIkVNqWXa
 X0ahxr721pJWX2Cbpdv9COgTNIk8g3Tn26nJco4Qa9fYkwiAuV3qFZGm7urvPKB/0L
 KuwuVOzi54x0AKv2MfP0xodzyEIddN72pxVdv4BarcGQeqHWKaurGCgV/Fp/o8oxbn
 iFeNeEqKvxHwsgiBc3qqHfThCY5fmpCjUMln6QzsHbEJD1Xx/gPjo0vs5yuHT/YSf7
 Z8hjmuWHbG5hw==
Received: by mail-wm1-f44.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so214592wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 23:06:55 -0800 (PST)
X-Gm-Message-State: AOAM530luTwPBv1PbQttodiAkdczuRsZkj61QZGG1BCcOvwYUQqpXt1e
 /b4xJ2VqDL0WumN9hYF8fB/ypbg53FhWawl/+Cg=
X-Google-Smtp-Source: ABdhPJzX9jWLhzTjtjQU7wN7OVHKYBR8BpWTxogSCK0npxv6vZ89SR9rQCAouuuUi4Nxuv6jbnTSYXFfBTmTa5PVQXo=
X-Received: by 2002:a1c:f309:: with SMTP id q9mr1267664wmq.173.1644390414247; 
 Tue, 08 Feb 2022 23:06:54 -0800 (PST)
MIME-Version: 1.0
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
 <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
 <6743d6b1-13fe-9c83-f706-82338dd03897@synopsys.com>
 <7ed6137e-cf19-3614-9404-e89389411a8f@infradead.org>
 <992f01cc-eb0c-b503-f9b4-4a037c6cf67a@synopsys.com>
 <2434f050-b82c-03e6-ee8f-8c8799119815@infradead.org>
 <1aef3a8f-f93e-2824-6b6e-8df8a1460f15@synopsys.com>
In-Reply-To: <1aef3a8f-f93e-2824-6b6e-8df8a1460f15@synopsys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Feb 2022 08:06:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3bJcMKW5QJqoUT8jDe+cbK0A-zSbNZhveX0WwC=ZEUqw@mail.gmail.com>
Message-ID: <CAK8P3a3bJcMKW5QJqoUT8jDe+cbK0A-zSbNZhveX0WwC=ZEUqw@mail.gmail.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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
Cc: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 8, 2022 at 11:42 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> Randy Dunlap wrote:
> > On 2/8/22 12:10, Thinh Nguyen wrote:
> >> Randy Dunlap wrote:
> >>> On 2/3/22 19:21, Thinh Nguyen wrote:

> Ah.. It's because I don't use old.config as the base config. I use
> x86_64_defconfig as the base plus some additional configs I need, and it
> has CONFIG_FB_EFI set by default.

Does it hang if you just disable CONFIG_FB_EFI on an otherwise working
kernel? This is supposed to only disable the framebuffer, but it could be
the actual cause if something else depends on its presence.

        Arnd
