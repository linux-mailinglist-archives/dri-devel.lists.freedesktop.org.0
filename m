Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D22139275
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 14:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EED789DFA;
	Mon, 13 Jan 2020 13:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E4B89DFA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 13:46:42 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DB1A21569
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578923202;
 bh=AIlrTSnZ1J1BYZeDE/zgmZ4IXahNEVbk9lgMh1AEQ7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iuAnG+CuflajR1/NGCyzA+4OgWdGpK3JBRoW8i3KxcgXNDqf9Araj+ScJo6ZeOjjT
 ToxoD9QgrlII2z7n3Hm7SMXMKF36MPInnWtwtpDLa2NsPpMtB1H9dT9mt/EKuNq5Z+
 kUI3gsWP6kXyJfteOQcIJNHfn36dpPu35Nr5/ljs=
Received: by mail-qv1-f50.google.com with SMTP id dp13so3979523qvb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 05:46:42 -0800 (PST)
X-Gm-Message-State: APjAAAUDsEs/04EYhr/lgSThLXA1mk3qK6cbW4VaFnE8ZWs8Jp31e8w5
 4eOtU5X5FRbULD7mCjvMWzXHHm9C51xXjQGEFw==
X-Google-Smtp-Source: APXvYqyIYYc2t9K2miXG3KyEWH3O5mjcXutnn4DUpikq6B35lTbFFyOCnIJ1ccg69kvCPXEd2zULH+m1JMCJtqyImI8=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr15327544qvo.20.1578923201111; 
 Mon, 13 Jan 2020 05:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20191230090419.137141-1-enric.balletbo@collabora.com>
 <20191230090419.137141-2-enric.balletbo@collabora.com>
In-Reply-To: <20191230090419.137141-2-enric.balletbo@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Jan 2020 07:46:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLHWa9n167xn+aPFVDvcFLNZpNvWVkrJ15v1WnTtYBLWg@mail.gmail.com>
Message-ID: <CAL_JsqLHWa9n167xn+aPFVDvcFLNZpNvWVkrJ15v1WnTtYBLWg@mail.gmail.com>
Subject: Re: [PATCH v24 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulrich Hecht <uli@fpond.eu>,
 Nicolas Boichat <drinkcat@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 30, 2019 at 3:04 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> Add documentation for DT properties supported by
> ps8640 DSI-eDP converter.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> I maintained the ack from Rob Herring and the review from Philipp
> because in essence the only thing I did is migrate to YAML format and
> check that no errors are reported via dtbs_check. Just let me know if
> you're not agree.

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
