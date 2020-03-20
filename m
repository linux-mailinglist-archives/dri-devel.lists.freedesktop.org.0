Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5B18C896
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EB66EAF0;
	Fri, 20 Mar 2020 08:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0D06EAB0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 01:05:45 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id j69so4096956ila.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 18:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIKmKtPK9inyHBgOdGiW1cUuusmeVK05PlwwC7X+p5I=;
 b=i6AR+D3jHyppvVrFUj442iIkudhoNOYo5aGJ+CNFj4M/c4ChNUL/eyGofj6hWNHBuY
 4P5MAkxAR1/5Xr1GPtYHWDK8fooG4Eg0/nh4cqrwaKcwhHE83DU8URq9JUcY7FBq86ng
 Vt124ONAuGsAl7gw8EKfp4oYNlMq73CH1Kxszez5Mh6pTu6dFBmXZiCJtqgpEgooOJDx
 KgXJSjHjsuscAUJZZsQMV60PVMH5V77m5x48qnL1DHE9FGkbNGCDZ7AJpgWJYieESVsU
 U0ZGI+6jQT7vCtloA+JY0ChZq4krmDE97EP5hRb7DEKbqDtb3GxDbLrpJex67SaSbs8R
 4e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIKmKtPK9inyHBgOdGiW1cUuusmeVK05PlwwC7X+p5I=;
 b=ch4Buax97n9haIaSsAsQNnbSwEjlqcc7YBorZHRSFogr1huq0WzAh7owTHiuPPZXo8
 2dtJcV/mnbIJD8zBub/kAQpnUhkQzaAlNv5pMKhgAWt/s+NMEcaQNB3Kw6zTFElRsHNS
 vCGZ3REJU0b4q2Jnucb8vd7vMHMTt9uBAHEcqKwhz+JuKd1HPBnYKQwJ2U44GoiQTOgN
 QC0CSFL1pEttZ50YfkFEndZhLI0ScNYIVpuv4BEL9+JKN1THyyoVdISTTrDBdOWBLO8w
 DDfbJi4tjPLXDulHMRdz+5yPiB1Gwz7ud+iL88vFkggcFyogBcBUBOct5x2f7GbRrmpT
 GXVQ==
X-Gm-Message-State: ANhLgQ2hU9p2u7OCm2qmACjLfuGGKj/0nOH9rshsCaEqGa/FMnG5ixWt
 IJzoZfhm8imN0kWNe6CXtmynGx2Lkclt6/W/Yfc=
X-Google-Smtp-Source: ADFU+vsXyzyi+qYF7P30xEdl3SKnMs0e3iLkESTh2BBQsMZWVdzJW5b85BdQP4rcWeSVIDarW3qIa5gY6lsuDO93L54=
X-Received: by 2002:a92:5fc5:: with SMTP id i66mr5814798ill.303.1584666344631; 
 Thu, 19 Mar 2020 18:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-3-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1583664775-19382-3-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 19 Mar 2020 20:05:33 -0500
Message-ID: <CABb+yY04NbSvHkQ0sVHd+KjU3ZFZSZD=H99OSNjoeu+Qpk7R8g@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] mailbox: cmdq: variablize address shift in
 platform
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 8, 2020 at 5:53 AM Dennis YC Hsieh
<dennis-yc.hsieh@mediatek.com> wrote:
>
> Some gce hardware shift pc and end address in register to support
> large dram addressing.
> Implement gce address shift when write or read pc and end register.
> And add shift bit in platform definition.
>
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
>  drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
>
Please segregate this patch, and any other if, into mailbox and
platform specific patchsets. Ideally soc/client specific changes later
on top of mailbox/provider changes.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
