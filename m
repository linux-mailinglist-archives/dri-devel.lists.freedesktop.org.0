Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0797465A19
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012EB6E969;
	Wed,  1 Dec 2021 23:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CDE6E969
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 23:58:20 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id a24so23354587qvb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 15:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQT5LaKuLpVbjom//RaF2AtN8bjf4gP/+BsDdSre8KU=;
 b=lp4L8B9l+jnHbFKIcbcvNkHjhTK1O6mbofLkPamQb5VBj/MIHd93OExtstUQdeEOqM
 UMQPvKud8dsr3AfHXo6gMpBMwENnXFj/+ikud6r2xfl608m0EjGMEKAeJLoL5VaCPY52
 dUaOIBZ8X7EGC5cw5gsgz1GpdesgTzTFmLImw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQT5LaKuLpVbjom//RaF2AtN8bjf4gP/+BsDdSre8KU=;
 b=CX5z2BgfvzSG7GR+nVmVQlyEd3mUBohwCd2BN09P4xltvCKPN4Z58nZVzMiXgRtxgn
 hzO7x68iRZjxShLqP30voPgSykWjcL6QXLBe5MKlZwJ3NHdH0M1+dQupR+zs0Ufa0TU6
 Lh4HbkwK/BCiDm7gajuV2WZ4I6J7xkoKHtSuy04IRq8iTZ+9HvwVPgPSqzQVR+mmRPDS
 1APWm1EjwIw+qbEf+IXnXJlbMw2Mzr2rS7VYf6Bs8YdIHKE8VUN0h4RvR67mE5FasQH+
 Pn9S+hZaDi+GYWNszxB0cKC5F/Wix9oVlKSqHcqcT1BuevPtuI9e2YEcbHtaD6x/z2Xe
 waFA==
X-Gm-Message-State: AOAM530QGf7vffdUUKeRfW8oxI0FP23r49YeNew5oXbz8OW+S/Uuq9eU
 yVA8bE1wBUgnk+113nKHt4kyzMzzfOfwc/i5jSkeXg==
X-Google-Smtp-Source: ABdhPJzlpgZXsoQfRBzDzE58VVCzidR0RvngXil7sYYYYjvo4+YcwcrLBGNoEy/KBUtLRTFiMMMi5pjug9dEP26Q0DQ=
X-Received: by 2002:a05:6214:17cc:: with SMTP id
 cu12mr10393249qvb.66.1638403100004; 
 Wed, 01 Dec 2021 15:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-6-yunfei.dong@mediatek.com>
 <3fb4e348-295d-9ec4-43b4-0fad06b33010@collabora.com>
In-Reply-To: <3fb4e348-295d-9ec4-43b4-0fad06b33010@collabora.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 15:58:09 -0800
Message-ID: <CAC-pXoOgyTRqYpA9U2ze840moLQ+gTT4EnLq-Pn9H4PHd9ttTg@mail.gmail.com>
Subject: Re: [PATCH v11, 05/19] media: mtk-vcodec: Support MT8192
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Wed, Dec 1, 2021 at 4:10 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/11/21 04:41, Yunfei Dong ha scritto:
> > From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> >
> > Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".
> > Adds MT8192's device private data mtk_lat_sig_core_pdata.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
