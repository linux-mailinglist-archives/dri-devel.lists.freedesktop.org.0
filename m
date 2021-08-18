Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BEA3F05E7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763FB6E5C0;
	Wed, 18 Aug 2021 14:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50046E5C0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:12:09 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id cq23so3338232edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eB91atCKNaWXZ4G9jJEBMaY5XPxe3TqKcsNVpOzbuIg=;
 b=DTpujLDvvVlnCM0pQBx0BGUvqOtWu8KBNz/CCnb7ZL5qIIyj7oaB3Y+4sG+KNhUGLW
 QODJIvfC/DH/QkIFP9RbwFPkJPfBFs6cRwVYwKnmsLfbvPwhM5XuQKyQMvEihdS7/h6a
 OliQ4yemaAPXBuf+QpGJZJSXwNRm2FepmDXyvB0z4o3M3N4/pSvlRBHUwQM4y8TYj31K
 xcA7guBOAdi/pbrejynrby1xf9Bq9kk5S2qRJ1gsLRTlU3LWDAxGLOU+yCb4SY9qZDqC
 H8sTkMkmtdJix9r6CICDC7d34EnN+F4Si5DBumcF8AzLxuik7TCkS+UPlSlqiAZLWKfv
 YiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eB91atCKNaWXZ4G9jJEBMaY5XPxe3TqKcsNVpOzbuIg=;
 b=RSjb0U8saYIy0e9rhZ4fRZwTc6xTUqRgIL18PlfaFE29fqM32rmDINoEzOG7sNjcFL
 RKQiHy7qTlULy8MVkPRf2kGfjQi85SduFAn2P/hyQq4KF6mfQCyHFH9M6czVt0+vyKNq
 duH1P1mE8odGgLgzyCEI+0mId15yNmACBubuYlUFc57+btM+J+z+A2KE60EoZ/nAyE6c
 bNoH8i0u/D0mccc63W0wCbTbW5RyXsJovRS3OZ5CyacMyQFktMseMZW4B/0EUcJOrr4U
 vYO/TYC47+stxdtdEE1BCfZbIJzvLNxh0VtbAnLLlQ5LyNjs/minp33e14xuu5+4CrE9
 2Y3A==
X-Gm-Message-State: AOAM532hyGyhgcM7LIjU3xnY7fiU8M3X2LFXyRYVkezLVgKOIAVhIu2/
 rFKGPfpy+thMm2vj8GS7ztN5pt2KUX0YLLiqarqdkw==
X-Google-Smtp-Source: ABdhPJyCq8sH0IgDkVaL6YJK/HNWvHaqTzC1UOGz6EehLJOQW2PJ8Uo0EyT8gsWJU0/XrPvHBEQEwKmT97rUZZwiONY=
X-Received: by 2002:aa7:db8b:: with SMTP id u11mr10261665edt.362.1629295928412; 
 Wed, 18 Aug 2021 07:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210811025801.21597-1-yunfei.dong@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 18 Aug 2021 11:11:57 -0300
Message-ID: <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: Yunfei Dong <yunfei.dong@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
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

+danvet

Hi,

On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> This series adds support for multi hardware decode into mtk-vcodec, by first
> adding component framework to manage each hardware information: interrupt,
> clock, register bases and power. Secondly add core thread to deal with core
> hardware message, at the same time, add msg queue for different hardware
> share messages. Lastly, the architecture of different specs are not the same,
> using specs type to separate them.
>

I don't think it's a good idea to introduce the component API in the
media subsystem. It doesn't seem to be maintained, IRC there's not even
a maintainer for it, and it has some issues that were never addressed.

It would be really important to avoid it. Is it really needed in the
first place?

Thanks,
Ezequiel
