Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B3D465A21
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 01:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E56D6E97D;
	Thu,  2 Dec 2021 00:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66FD6E97D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 00:00:05 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id o17so25888763qtk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 16:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YzFMI5oWE2o+jFyOP5vbILw8vGd41FKbBUY66oRdEQk=;
 b=HVyEG20SBKF/jqmTGVh7Dh/M0D4FVk1nCzH++iKpmlf4sjOzLgIFju63Hl9Ed9BGhp
 m/HR14Jg/zzhVH6f8hsABaAUF0TrZGvGQ7qOxJWv1GPxlYKLiMTwAiS1Ujvt8ReOCeBW
 Zk0Wf82z+4aMUjNuedm8E4Rft/118UNq0bX0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YzFMI5oWE2o+jFyOP5vbILw8vGd41FKbBUY66oRdEQk=;
 b=XFYCpvcGCMT7riP+X7p/iWf8HSItk+VU0WGQo+eR8UQhH3KkSJFBkODgpMGflsUJ90
 PmPNqFmCXrzJ/54QOiYKA/8QDCx8p+3qUVUOHGQC4kF4RVS1GEUfdwvtUnQSnr8lzp2j
 swPiFz648fdEq7OE/jKiW4Kd/aULOIs8npwN7nA537e/FPoKlK1+8FDq2Kp6zEJSSrZi
 2dw3pZ4+nZK1fFRzmmteRXsOSpWbzISHu5un4MsQwBbIZljw4gW3hZHomv02FwE0BVJ7
 hcAF8511qQEZi8RmQObEtYoFzyQRDQEtmY8oWdADN2p2O/JbUZQnMB7xyAr2VUKWBEqa
 1fQA==
X-Gm-Message-State: AOAM533YVKsTUW8KAdKLn2UXYIh+e18iDELHVvWlgNLhuQNPMYKB9hP0
 spgwLyh6HvbzGpJrCI7eldbpRT8tdJGyCQmr4+KBJw==
X-Google-Smtp-Source: ABdhPJwuwORHr25rSusAmz6Rw8B8e2m0YmLSJeSuvEmJ4pbHkBNQlMFlJSCM9HXMUs06MfzXrMPJl/3J77nepYoci9c=
X-Received: by 2002:ac8:5a10:: with SMTP id n16mr10785131qta.278.1638403205087; 
 Wed, 01 Dec 2021 16:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-5-yunfei.dong@mediatek.com>
 <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
In-Reply-To: <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 15:59:54 -0800
Message-ID: <CAC-pXoP2nn-DdSJTWDES19UdMp9A5unj9u7Bs=Qw+ex9=HvyVw@mail.gmail.com>
Subject: Re: [PATCH v11, 04/19] media: mtk-vcodec: export decoder pm functions
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

On Wed, Dec 1, 2021 at 4:09 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/11/21 04:41, Yunfei Dong ha scritto:
> > Register each hardware as platform device, need to call pm functions
> > to open/close power and clock from module mtk-vcodec-dec, export these
> > functions.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
