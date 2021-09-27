Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3620241A121
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 23:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5F26E85F;
	Mon, 27 Sep 2021 21:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A939389346
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:02:47 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 138so37195073qko.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNPetvOupXqRGUiN551DEoj5v4Vq3J9M2I/AbCZn9/s=;
 b=DaJH5fJcZaPTWSS82pjbCuzrmgUbbbI8rDumgBGUwFhl/oYhvIG/pZqFDRqj3etyng
 gynjZU/qESEM03OCs4i9F0KxLfb9njtq1177Zhh6o5nIU4Ak6ZFaHDvNbgLrAZMWuX+7
 /vo8yFf6ik5YAvsKvs/gkABlt5Fb5DP5jWTCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNPetvOupXqRGUiN551DEoj5v4Vq3J9M2I/AbCZn9/s=;
 b=ArNiWFky+DpVrpjBNSs8b8dtZqfA64Y05plwEe7tuLMngnIKIB0G9PqYZAV91AVraV
 EPXMjJfgVWraapq5qTj85VdF+Qp77MCoft3m+lNS8BJwjhRivHWtz+ED7/XmjK+23Hdx
 k/CJxkomXLQJZ/QGiNlo/iVPWysZxRk211ET+fMU6twscp6Q7zUAaXrCisFws/ww7ieN
 HYX/4/LpcJvgH3ZPKEggYjpOnvXyLz/6oCGw2xoaoKxrqFhrEjR1tXQC6JIRZ1HnVZnz
 QvhVkHK3MnuaA79g9uQZpjOXur42qJXvk5OgS6LIdlKBuuDv+qmidoeFOQ5T8ukhvOVO
 OGWQ==
X-Gm-Message-State: AOAM5337Byvfhv3BWH2TIvC5hOxAHUMu8YppylJNor9lFDGTe1km5CxM
 EWDsFKMJZj+GoUC/DZj+u5TA+2HsSvYPFZw+a8P1bA==
X-Google-Smtp-Source: ABdhPJwBRvTBeyV1410Jpc8AMLHK25Pf6f0uExAdgdt+d7oQNAG2MpwCW4ToDnxi98Sln0HasYsHB8qhK0klEJITwTM=
X-Received: by 2002:a37:a087:: with SMTP id j129mr979840qke.253.1632762166561; 
 Mon, 27 Sep 2021 10:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
In-Reply-To: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 27 Sep 2021 10:02:36 -0700
Message-ID: <CAC-pXoMR=mOwnKqP5SFAfF3Ka5UrG0F8Mj=sJuEziU=uOKftoA@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 27 Sep 2021 21:05:15 +0000
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

Hi Ezequiel,

Thank you for reviewing these series from Yunfei!
This series is one of the main obstacles for us at the moment for MTK
so please continue to help & support reviewing this series.

> > According to google's suggestion, it's better not to use v4l2 async
> > also.
>
> Hum? I haven't seen such objection on the mailing list.
Maybe coming from Tzung-Bi?
Yunfei, please let us know.

Steve
