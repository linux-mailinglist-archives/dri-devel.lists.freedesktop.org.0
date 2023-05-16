Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94728704944
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF5710E32F;
	Tue, 16 May 2023 09:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A932A10E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3075e802738so12728597f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684229419; x=1686821419; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bo1b/bEqOS6KDD6qflz0mFStzeeE7aur/bUdV5C/8NA=;
 b=vRap7UvFpv5ghKGfHsGU8Sx21psojIcztLgVIfwXWJknaFex0YDfYeBt8QdLUe6Gkb
 EG8UOIkceBXE/IjJcromhmhBBpTrow4u9OeNW6CAeY3KRZ0bFKuLVdpeY8nmc+myHUdO
 QhWgL+NzdeSPH23J+bAgDCGqdpH9wbSG5pqBuhWPpuqDrIYLKuRV8gn3+IdCXRGtPLeQ
 AjSm8pJWYkjp47srU3RKptYEqRNguW1H8a3RokeO9ozq+kjRsQBor8Gk7+nk3ni92ger
 /HYUENYA8FPWMde5Tv1gEz0Zud3qfusXGXJv1yXRj322ED7prIUFViaYje9qN9wwEY2a
 XwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684229419; x=1686821419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bo1b/bEqOS6KDD6qflz0mFStzeeE7aur/bUdV5C/8NA=;
 b=CIC6gs67XjsCUaAlv4E/0s0sHDl274KRKBH6tJOfQu0FOmenfRJjNLTvcSiQB97gP0
 DaI+dKHI3EwvCe+LuGFbAM12s6lBz7OhlgPXkQYsqWWdj8dK2XcwGG8prdwpos6v/NC7
 TuZdbzHjpwNdwv7jeG2O3Xm7Qh3lo1ceVxJQ7bAEkxLJQ2lpClaX5zKF1Sk6YkXi4f7K
 MoW7BOxZUGckRuFtF/YoSi79z5GpadvUQ47uCcMQLhWHQlz85P0vhoVDltFilwiXpXKO
 Cw3/AfgBDGx4XDpuYc3N3ZxnuAKhuNh/aqQxeaxy/JY2V7YmFSw7qxkCN333iBrHVPMG
 ys9Q==
X-Gm-Message-State: AC+VfDwZf9pBeRlcE3VPLoetgSLKGQuRqYc4MSzVx/6FbwjBt7TV6ps1
 JrJmL4Yitw9/gjv2hHtl3YfE3Q==
X-Google-Smtp-Source: ACHHUZ7VHIunoibF7bQd4takm4fdk7SjKWAPNooKGJ2N2GmNNWqcstqBa8aSFOHr6/KgX4SlBiDTqQ==
X-Received: by 2002:adf:f2c3:0:b0:305:fbfb:c7d7 with SMTP id
 d3-20020adff2c3000000b00305fbfbc7d7mr29019988wrp.44.1684229419563; 
 Tue, 16 May 2023 02:30:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6704000000b002e5ff05765esm1928076wru.73.2023.05.16.02.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 02:30:18 -0700 (PDT)
Date: Tue, 16 May 2023 11:30:17 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <shthzc3zekvm2mrcch6vexsq5djpoxwupvdmmovhrz2ack3wxx@s4ptfhq7iwvi>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
 <b2nk4jw2hpy4ndoq4cojazkn6h3tra2zjffhiswb7aqryabf7q@mkbtzhzcbivv>
 <54e6923c-729a-49de-8395-fbd0b8443aa8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54e6923c-729a-49de-8395-fbd0b8443aa8@collabora.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, chunkuang.hu@kernel.org,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 04:32:42PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/23 16:07, Julien Stephan ha scritto:
> > On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
> > > > +#define CSIxB_OFFSET		0x1000
> > >
> > > What if we grab two (or three?) iospaces from devicetree?
> > >
> > > - base (global)
> > > - csi_a
> > > - csi_b
> > >
> > > That would make it possible to maybe eventually extend this driver to more
> > > versions (older or newer) of the CSI PHY IP without putting fixes offsets
> > > inside of platform data structures and such.
> > >
> > Hi Angelo,
> > The register bank of the CSI port is divided into 2:
> > * from base address to base + 0x1000 (port A)
> > * from base + 0x1000 to base +0x2000 (port B)
> > Some CSI port can be configured in 4D1C mode (4 data + 1 clock) using
> > the whole register bank from base to base + 0x2000 or in 2D1C mode (2 data +
> > 1 clock) and use either port A or port B.
> >
> > For example  mt8365 has CSI0 that can be used either in 4D1C mode or in
> > 2 * 2D1C and CSI1 which can use only 4D1C mode
> >
> > 2D1C mode can not be tested and is not implemented in the driver so
> > I guess adding csi_a and csi_b reg value may be confusing?
> >
> > What do you think?
>
> Ok so we're talking about two data lanes per CSI port... it may still be
> beneficial to split the two register regions as
>
> reg-names = "csi-a", "csi-b"; (whoops, I actually used underscores before,
>                                and that was a mistake, sorry!)
>
> ....but that would be actually good only if we are expecting to get a CSI
> PHY in the future with four data lanes per port.
>
> If you do *not* expect at all such a CSI PHY, or you do *not* expect such
> a PHY to ever be compatible with this driver (read as: if you expect such
> a PHY to be literally completely different from this one), then it would
> not change much to have the registers split in two.
>
> Another case in which it would make sense is if we were to get a PHY that
> provides more than two CSI ports: in that case, we'd avoid platform data
> machinery to check the number of actual ports in the IP, as we would be
> just checking how many register regions we were given from the devicetree,
> meaning that if we got "csi-a", "csi-b", "csi-c", "csi-d", we have four
> ports.
>
> Besides, another thing to think about is... yes you cannot test nor implement
> 2D1C mode in your submission, but this doesn't mean that others won't ever be
> interested in this and that other people won't be actually implementing that;
> Providing them with the right initial driver structure will surely make things
> easier, encouraging other people from the community to spend their precious
> time on the topic.
>
Hi Angelo,
Ok, I see your point, but for future potential upgrade to support A/B
ports I was thinking of something else: adding independent nodes for csixA
and csixB such as:

csi0_rx: phy@11c10000 {
  reg = <0 0x11C10000 0 0x2000>;
  mediatek,mode = <4D1c>;
  ...
};

csi0a_rx: phy@11c10000 {
  reg = <0 0x11C10000 0 0x1000>;
  mediatek,mode = <2D1c>;
  ...
};
csi0b_rx: phy@11c11000 {
  reg = <0 0x11C11000 0 0x1000>;
  mediatek,mode = <2D1c>;
  ...
};

giving the correct register range. One thing I did not mention is that if
csi0_rx is used csi0a_rx and csi0b_rx cannot be used (they share same
physical lanes as csio_rx), but csi0a_rx and csi0b_rx can be used simultaneously.
So platform device will enable only the node(s) it needs and enabling
csi0_rx and csioa/b_rx will fail because they share the same register
region and map will fail and it does not have any sense because you
either have a camera using the whole port or sub port but you cannot have
both plugged in. What do you think about it?

> > > > +#define CSIxB_OFFSET		0x1000
Maybe moving this declaration in phy-mtk-mipi-csi-0-5-rx-reg.h would be
better?

Regards,
Julien
> Regards,
> Angelo
>
