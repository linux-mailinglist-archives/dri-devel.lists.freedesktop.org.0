Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EDE42FDB9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 23:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0769E6EDFA;
	Fri, 15 Oct 2021 21:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986BE6E415
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 21:59:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id i20so42405427edj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9pKyE4uXQ4v77H67bVhfvYNdBYMVwhYoxHl8+ZSF6s=;
 b=Z9/Wnz3HV1RIE0kt/gUyL6rSKP114/irnOAKQdhKMk3C080mvTEDXcYWcTwBIq12xC
 /7O8zFykbmnCXIciX883dHr08y/jLLO5+ousxsFk+LUcq4OmlUZ7kKn9pFfge/q45HNp
 lgMljTVEuG3JtclgRxA/bXl6GIMyMn1dsmyJx6qIeA2lRizdywzbqhRnGbvdmp/pZA+0
 vHr8QP3/QnSmsnl/UbaVadqEZtqGC+aLOrCe/DK/e1nlpbvYjOZ4yrbbcvihmEFcjHfB
 aL8hVdd4Ocl+ZZJ3FXLVpUc9pWqaYzk8n/gRqc3Z992I7pbmcpTEgHipysTBhK3Y+GRh
 oSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9pKyE4uXQ4v77H67bVhfvYNdBYMVwhYoxHl8+ZSF6s=;
 b=Ouf071ZpXv1bhoBs2jg3utHklLziSMCAVxGkLlDB6zL2rhtqbPu0Kk/DFxfiM86n+3
 B0ZK+T2Ib71ODRf/1TOM15sVrJ9teZyENCD+GtPd6pjxRcD9vLaPD+a5QG0IpdIbS47G
 DGP9pLnEbfCBZbm3cFTd48b1I6dZehr7FEFJgBNME66htY2XAFpoyiYHCEIDuDHaxHOt
 nxR//9llzBTPOmzchzFPnzscvHN4blmW5jy7yJ3atmkXUZgxWScVeOFlHeUTY5SedR7a
 0D47p/rK/p3Rpkm2PGnVJhuauX8/eZOaOIlHXOaz2/USqGG/vmj2WABh/8q0lBB4kSaK
 vFlw==
X-Gm-Message-State: AOAM530rzmGnrcx/SDwPODVbPKMqned9OOZBqPvS50xy8IMVcep9f8Z/
 ganGwpaOAaSywOSeWsvIFrPia8/VbIL2Gu94Kgc=
X-Google-Smtp-Source: ABdhPJzp86qa0FdWr7jP+PxpSeQNFXQFNcPFAbi0Fz3srgNClnpBQS/YnOhaT16RiuXhCdSG0FryUUUlxHCO8y+Cops=
X-Received: by 2002:a50:da0a:: with SMTP id z10mr20692743edj.298.1634335186003; 
 Fri, 15 Oct 2021 14:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-3-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Oct 2021 23:59:35 +0200
Message-ID: <CAFBinCDubtF=gSO=dpr==mMnBPeLGnWNMSi0X0_pqkFbtLCkQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson: remove useless recursive components
 matching
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The initial design was recursive to cover all port/endpoints, but only the first layer
> of endpoints should be covered by the components list.
> This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
> first endpoints instead of recursing.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
