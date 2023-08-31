Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF778E790
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13D610E5A6;
	Thu, 31 Aug 2023 08:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C6010E5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:06:40 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-34ca22e3b3dso1791805ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693469200; x=1694074000;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lI5HuTSJh4kLrQZ9upvSPMABH82Jidmy6stP6xhqC70=;
 b=PKxi6fWglOYW6gm9H300zrqqUsiAa0j//pOL64pu5cIwbGfMfXRlviKtKPEZ6jg8iO
 ZuBH/770mXNJ6xObDoj3Ino5g25LH2R8S+YYUIv7Q3r+1/KVpfuCtw9celZsRFk9Crqz
 +lPNIb/6+JbbVch6/zI4EHUnHZhmlRaEkWzhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693469200; x=1694074000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lI5HuTSJh4kLrQZ9upvSPMABH82Jidmy6stP6xhqC70=;
 b=lUcQgkzYjqjDWXwlyUgOSAgGU7Jc1IY7Bgp0rChutk41+O7OgVndap2xQlAUaNPjye
 XA/EMrdzWxV6H2DiUa/GelueQkTq94To7K3VBDHhwvauzT/eDYqIBTj4dLKlSc1k/9tl
 1+LxENJT02ipGqqh7re9DGLeO7GrPlt+bcBj/gzbF7FJjFI7WlF2lYBOolJeIdRSHfV9
 QTgvKCHIoWSbOkoi6Wibufaj7th6/iqd1E4kwZ8oRyAzH+tGU4WGT/MfRyVVSh3ZdaNB
 qongIA4Fx1U6Me+grTczEQ6hbkXhkOGp9V9Vep3pYlj8tKcDI/MOx9yxWl1xbkyqQTpZ
 T01w==
X-Gm-Message-State: AOJu0Yyp/H6zhPfog1B34z3AWfrdhvtPBC0q3L1mRKuv879PeFIjbw9H
 uCjP1afPmy0Nz1KdRuKHCwC7ExhkgLEp8SNbAsQ=
X-Google-Smtp-Source: AGHT+IFwwszH61uB0+sFhhwPNxPGLvkqV0j4UcHw2w5qs9ExTveDdATUHaUlyM+mIjtkT9g/JiNT4w==
X-Received: by 2002:a92:cf47:0:b0:345:d4da:41d with SMTP id
 c7-20020a92cf47000000b00345d4da041dmr5101653ilr.8.1693469199857; 
 Thu, 31 Aug 2023 01:06:39 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47]) by smtp.gmail.com with ESMTPSA id
 y13-20020a92c74d000000b00348ea1a31ccsm288196ilp.12.2023.08.31.01.06.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 01:06:38 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7927f24140eso23112739f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:06:38 -0700 (PDT)
X-Received: by 2002:a5d:9d15:0:b0:786:fff8:13c2 with SMTP id
 j21-20020a5d9d15000000b00786fff813c2mr5435565ioj.11.1693469197856; Thu, 31
 Aug 2023 01:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230714094908.13087-1-jason-jh.lin@mediatek.com>
 <20230714094908.13087-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20230714094908.13087-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Aug 2023 17:06:00 +0900
X-Gmail-Original-Message-ID: <CAC=S1ni1LvViXbP-euO8trwmwn68Y7-=UxX4W77fc10+TVi2PQ@mail.gmail.com>
Message-ID: <CAC=S1ni1LvViXbP-euO8trwmwn68Y7-=UxX4W77fc10+TVi2PQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/mediatek: Fix unintentional integer overflow
 in multiplying different types
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 6:59=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> 1. Instead of multiplying 2 variable of different types. Change to
> assign a value of one variable and then multiply the other variable.
>
> 2. Add a int variable for multiplier calculation instead of calculating
> different types multiplier with dma_addr_t variable directly.
>
> Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Hi CK,

It seems like the series was accepted but this patch in particular
didn't make it into the tree. Could you take a look?

Regards,
Fei
