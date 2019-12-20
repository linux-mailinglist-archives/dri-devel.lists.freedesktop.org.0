Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE631292E3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73606E223;
	Mon, 23 Dec 2019 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110CB6E41A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 08:55:39 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n21so7062815ioo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFyk6wfDM3uJNZM3XmVJRb6zXEf3/dZ+tc8Bv4YB2yY=;
 b=W0dWNacy+Z08VU2VNyW6cLKarj2vQSvC7GwIrBrk5kAeHpY8LUCugVbH17i6+PQmyA
 lzshmpaK75tqkDiY8MXYJFy40HtHbIraPO0UNF/SdTr1T0MrZjg9bMNdnlBgv7STNqf6
 AcP0G+MibU3+k6+ra+ZS/fYB+z7mO6Z7OA5uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFyk6wfDM3uJNZM3XmVJRb6zXEf3/dZ+tc8Bv4YB2yY=;
 b=S7q2LZ3CvEu+oMJEL6nSGJFIBxNMd4X7RIrHqzpBV4r/ptuMND7KpuO9JnvOkdQXcB
 GzTZC/dNuM04br/eBx/RcBskQrXXzfVhAQZr/3CNeAzW6Ocp8aWXwJttEt6j8/Idmdlp
 Zn4x7S/wcJxtYromaimVRA5zqWKXltQnpIGH1GoZa9+aRSxeai3TBp0hpSiL1nC0velG
 Yb7+YZj1d7US7vlblypWPZsRBmeUJDyyucmVoDcK9bkneQsgz9fX5E6AKVePO5WBghf2
 vfmYRs3sl5wpwElqw7SqFWEIyc1FCFskBtPO6GeWE9HAD/M4LIVKxAwPJ5oOITy2EXEX
 iB6A==
X-Gm-Message-State: APjAAAV9cRmrrffSAzlGEixKguzqp0DLuCzWW60qKoaBtkqPfPvOx7Bd
 6YvVQEmGsrRIB+L93g2cQJgcZnLaWK4DZA7EgOkWaA==
X-Google-Smtp-Source: APXvYqx6jNS3ruJSqRukqpBfv5nCziRlHY3HFBeibFf5MWoadOk37sDVbGh863vc8QU+b1jTv0rGaDTo6tv6CoaEyJc=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr9807832ioa.102.1576832138346; 
 Fri, 20 Dec 2019 00:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
 <20191220081738.1895-3-enric.balletbo@collabora.com>
In-Reply-To: <20191220081738.1895-3-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 Dec 2019 16:55:12 +0800
Message-ID: <CAJMQK-h9w5a1CKyTqdBsmz6TYbcGMzhPLNwU7kYBYp56EV0PZA@mail.gmail.com>
Subject: Re: [PATCH v22 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, lkml <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 4:17 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [uli: followed API changes, removed FW update feature]
> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
tested on mt8173 chromebook
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
