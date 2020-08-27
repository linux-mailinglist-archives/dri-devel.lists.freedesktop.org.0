Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A4255532
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3AA6E2F9;
	Fri, 28 Aug 2020 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B16A6E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598535710;
 bh=4quNDffXBr7xu+P8AYTF5B4Q4KC4iGb6IlNPmZ7OG44=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=e3sJovM3KqoNxeIq1/5pBzS+ip7jqoLwC9l9PlkeAZzaIDk5KZbPCIKsQ6rV2luSn
 uqWuwqbAyWcccWgkiwhmNF/tHGIGM11V+0ZhWnufh46+NPelcGb/ogBS63ui35TTXf
 0wzIiMwmUnHQetmDUnt70YSjg8+3NI0g6ji4yKcg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.146.7] ([217.61.146.7]) by web-mail.gmx.net
 (3c-app-gmx-bap26.server.lan [172.19.172.96]) (via HTTP); Thu, 27 Aug 2020
 15:41:50 +0200
MIME-Version: 1.0
Message-ID: <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Aw: Re:  [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
Date: Thu, 27 Aug 2020 15:41:50 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Qlp+wHkbak6pBZ5/7qykL04OknqT6U+WwH+B4u5tOtj3VmxF1XWSKrFYv2a1JnOA+i2Lc
 Hg2GwIs2jHrdNRuqRMAtCHBi/k4/RlQ99TTbKd3kElatLj3MdORZA1tUpyXWgo3l49SbXwC4yj/M
 LsWL+SJ4s2B+GEGWo+MoSBMhBUk04FIzI+8sYIdftad7aGEgMaAF9ze5jPqQLlRJbnQ6v66K2SKI
 ifet6FKzp2K62Ov2c3YltC4L6NbYXmQEMDhBvjZC7ybq//eKEAcT1eE6cw+WoWDwtZpst8hVn6oW
 UI=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h5tkjHGfYDU=:lPmXLFE1B8AX3Zy3CbIsRD
 s3VayhK0/M/yARQry0GUjQ5SQ/cVYMkllZIE0P5rQMgq99bx4K4Frj56LvcjoWVW9Dq0lnl9V
 8tEP/JgYwaTRELytQ6wzIsL1iT9R8N0SrgvWKHxoeshp4XfROVxrFBMBywPqL6GN/dTQKSahO
 olxlvZ0BKTn4rEqfQyJbwlEcSbapgGw+c2dPYFy+H2jLCzYdK9yJHVUcANPLJpkUFH4sIjeIz
 WEESP+gE41YkuahFPE6LKdC1SOMvqgUYZvzUZVQnN4oSLbearFiLbMolaegP5D1mde4xlLIaz
 PRE8U3SxgvkzmPaoocV2OZh9LHWXUIihI/d54ZD+n80KekMosV2o1V4T/oSGwm50xfFUQXDaI
 64++WExLDIV8BPHmWAmwc0KwXdQa+GwMJ8Lb4lIPk3uh6ybmq/RyAXXTIXh1HI825htbnZ9BE
 0QvCEmZN993Rkwu4IxmDbrNW2ux6TN6zBTSohvveBWurA5jol5hISl6oj9RZnSZUNbzqYS29M
 PPcTZ7jZA7F4cy/rX+b+5jr6woxNeuyXPyz0vMj3JBSS+KZUho+pWx9DNs7mZvtPgspguIL+e
 GBhrExP6PHJPYN0w936PQ3XA7YTUEE2y4TOF9QCfu80Zc1aWHiAKUo6cn0nhwFKuiIcsA+sFn
 aWDahsL08vUtEYS6ALCRT6XHEN3lT1UtI2rMrV3+NTEvCQs2xcTKXAN7AoYkz4e3K4BI=
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

any opinions about the dts-changes?

maybe series except the tmds-Patch get merged...so i add it only to my own repo till we find a better way?
currently mainline does not support hdmi at all for the board. the tmds-patch is only a fix for specific resolutions which have a "flickering" without this Patch.

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
