Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF31EB673
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9696E193;
	Tue,  2 Jun 2020 07:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6FD6E9D6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 20:34:22 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id v11so5858261ilh.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YQ2eTRzHonhqJF3ZL4HYlMxSElcEqq+WSqbBmVWDUhI=;
 b=tRI5eqJPiHGaD4J0PlwEJbmOeTLTXvBVFiz49/nwb9HvI5FnUEIWpISRg9S6usOTLR
 ffjIu5AyTInmZJSpqk3cYkRMkn2P3lrBCQMiKvQK9WWw9oL1GOJrqjmtVQswiAu/xDMm
 hDx4qaoIjbgzSphtSas9COsc7e2LLqSmpg+k3o96kHelcU4kRlwRrb340EL7oH+vH7JY
 PxVflsJi0fglfmwXzpVLbVAPfgnolwiFXei2OZkWTU+d61+z/hmiHEwkb0T6eoZi1Cm3
 X03Igs/+fdvJU6arMWAXoecFr2s7WzdyRLFl21ZmB/lktpRTGHWuY0GQs5uCk82/RoAy
 f+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YQ2eTRzHonhqJF3ZL4HYlMxSElcEqq+WSqbBmVWDUhI=;
 b=QQ+JM00qMDhFQngceU5HxC4aTVlAEvGmGNfddJwPPuH9OJfoc+syKg8LWpUQbFKRGY
 sxJ75c+Bjw0LLwuaMUq1zl1N6WWDrlAvTiQqBPuLU1aclnOHFZIezrFZQ0NKo5sGERD3
 te8ia9VK/SiIrwwa9xA8ozgS7slLC6ejYnYB8CU45ylaYhja1pIFFvcZvFbfPxgX6Ivr
 yqApyt+2seu+b3CRpoOxx+3R7SobkxUJs78I837gB8YvdHibSyX7iQSS/eY52B+CJYQj
 +tsbbCOAh3y9zItt1gPGvKwb/iXv2/tLbjakT1o4l9C5WcJ9OOloCcPn5F0dPcgl6OHt
 ngDw==
X-Gm-Message-State: AOAM5305X19i0Qf7wHMTLgmRMBKetFJmkf1VmKonM/sUpYmxS97uo6kz
 d01EugquxBvyXhLxDhkb0k6W6cCI7ySWBflDgVw=
X-Google-Smtp-Source: ABdhPJykT3ennuBwiv4teUw8fHN2/mAUZtgeRiRVpY21O+TfXGVZ28jkFKhCCaxyiyHA34VHj2THd7C4qJbb3CjaPz0=
X-Received: by 2002:a92:7104:: with SMTP id m4mr7655023ilc.87.1590870861509;
 Sat, 30 May 2020 13:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 30 May 2020 15:34:10 -0500
Message-ID: <CABb+yY16FzgafSYRo8DuVMttqUR5JVzXDsaP2rX+UnrNOD6k2A@mail.gmail.com>
Subject: Re: [PATCH v6] support gce on mt6779 platform
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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

On Thu, May 28, 2020 at 12:05 PM Dennis YC Hsieh
<dennis-yc.hsieh@mediatek.com> wrote:
>
> This patch support gce on mt6779 platform.
>
> Change since v5:
> - spearate address shift code in client helper and mailbox controller
> - separate write_s/write_s_mask and write_s_value/write_s_mask_value so that
>   client can decide use mask or not
> - fix typo in header
>
> Change since v4:
> - do not clear disp event again in drm driver
> - symbolize value 1 to jump relative
>
> [... snip ...]
>
>
>
> Dennis YC Hsieh (16):
>   dt-binding: gce: add gce header file for mt6779
>   mailbox: cmdq: variablize address shift in platform
>   mailbox: cmdq: support mt6779 gce platform definition
>   mailbox: mediatek: cmdq: clear task in channel before shutdown
>   soc: mediatek: cmdq: return send msg error code
>   soc: mediatek: cmdq: add address shift in jump
>   soc: mediatek: cmdq: add assign function
>   soc: mediatek: cmdq: add write_s function
>   soc: mediatek: cmdq: add write_s_mask function
>   soc: mediatek: cmdq: add read_s function
>   soc: mediatek: cmdq: add write_s value function
>   soc: mediatek: cmdq: add write_s_mask value function
>   soc: mediatek: cmdq: export finalize function
>   soc: mediatek: cmdq: add jump function
>   soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
>   soc: mediatek: cmdq: add set event function
>
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   3 +-
>  drivers/mailbox/mtk-cmdq-mailbox.c            | 101 ++++++--
>  drivers/soc/mediatek/mtk-cmdq-helper.c        | 163 ++++++++++++-
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h      |  10 +-
>  include/linux/soc/mediatek/mtk-cmdq.h         | 125 +++++++++-
>
Please break the patchset into two. The lower mailbox related changes
with soc changes on top.

thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
