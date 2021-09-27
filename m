Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0841A120
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 23:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBBC6E049;
	Mon, 27 Sep 2021 21:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4313389C9D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 17:31:55 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id t2so10835035qtx.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q25abHd9wgNegk3LUcOidVwBOafJNu1U9ST62KJXKh8=;
 b=Ny6AIsS9MNvI6ERmgppnjGwYp+CeoJRk0IArqfNnE6eticiIdzNtufGZQts0fxRfaa
 2La6isn8ClLdLGvpKcRN7Ws+5DbB2alushQpd5Mgdc9x0R4XjR8obr6bX67RKTuetBaA
 VnxeAY+0ch/n5c2/oqU2Ri+Wkk5YXe/CnUMzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q25abHd9wgNegk3LUcOidVwBOafJNu1U9ST62KJXKh8=;
 b=pSwaupYwRGTiObjChRoBLOOSnAMLBN7lQZylROtsQuNzP/4FIphWteX1O3SG7m2NYv
 faHZ4c8PvDmSfsBwJtSVF4fF+m/T9oFaq4hr6NWSZNBdjMtSGtBy2R70FVXjzFkY4fSN
 UZj5toG0KQwD7FqBvAZZkO4MF1LGtBoFagZNweexBzem4Vyzo2696NETCE5CVZuDHXx9
 g16Ke91l9e0hjqtwhJqG/4DL6sS0puEGpOKb4iY4RQZUIfy/HMQw43yTKNj5Hi76QVV7
 hqo49CrBI6myPl3UE1/gGPrlZcyDJp8yL1TpFdz//xOz1yXX0ZaEP3ZyMGKMWwlT9phV
 UcLA==
X-Gm-Message-State: AOAM533DRPx2ieO/+73J4s6q0G7KqoHGC2TkHsBdYwPCn/xwFZj2XuFi
 g2txLSD4iQxIlScoFr3qG1giP23YBD//JW12SvTIxQ==
X-Google-Smtp-Source: ABdhPJx1KC2Sf4WzHgUQwWyPdWRuSlZoOLnjiZdGnYaexNZXkvQiCqTpJJd5W5gO70e5CRvJBsLepizgX3kZwngK+r4=
X-Received: by 2002:ac8:4089:: with SMTP id p9mr1016844qtl.363.1632763914260; 
 Mon, 27 Sep 2021 10:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAC-pXoNT8AFA2j1DiD9M_uGb92fVcukTGDKVURaGjwpPstcwqQ@mail.gmail.com>
In-Reply-To: <CAC-pXoNT8AFA2j1DiD9M_uGb92fVcukTGDKVURaGjwpPstcwqQ@mail.gmail.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 27 Sep 2021 10:31:43 -0700
Message-ID: <CAC-pXoPrOO8W2Le_-WdgX3_=D-Qde8ut_TAzC++EyGCkdoOoPQ@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>, 
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

> > [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> This link seems to be no longer available.

It is probably because the default state is "Action Required", and
this series was accepted recently afterwards.

I can see the series with the below link.
https://patchwork.linuxtv.org/project/linux-media/list/?series=5826&state=*

Sorry for the confusion.

Steve
