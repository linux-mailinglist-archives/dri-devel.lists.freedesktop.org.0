Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E126641D2FC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 08:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9D16E2E3;
	Thu, 30 Sep 2021 06:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44B56EB03
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 23:05:05 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v10so14742478edj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 16:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=junDmjsGeeXH6AFTkfwWvE4eRp4hhF7+aaNBz6qBSf8=;
 b=nh+yG0zcGzynV4sBXDmkkmzICeb9RD15jcVuXjresYcIPWYL58XSbBQJPKfFUhr8HZ
 MK4Ib2UM8QwPkWwPxTMaRQEZ7gbfZVkjY7R55PfgC8cA3vxaGIuubZfMiyj9VlQerY0G
 qzd51mNwVvGn5OlKaSz/Lja0vXV7+4AkM9gTHuvhGWaH7j6tX0+l7bCARq1tzxrntQrq
 CvBE28bSBCl3RlT5j8Yqj/eKQpRAQ+yYCXcXk9WsLzhOo96mtf6lFIu/3zDEbovoQwEZ
 tHt6Xf2OqFLnM2+N8UUPKz225lJqSVJC5Yg9eYivz/QUcj3aj93WFOKT1cDCHpAZRDjK
 QYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=junDmjsGeeXH6AFTkfwWvE4eRp4hhF7+aaNBz6qBSf8=;
 b=rSpDT/1UXWGmEMRzAXJPNEX3+4tpJUDpzmYg/DdJDmqTvmtUQ25Vz2ZTLmArr3ZHjA
 Q/LKg5A0vzQu1dIveYGh/Mr1GX9QdThbdiVz4cA3bzM5aszqHxoaCKpQWyyRsmjZ+JCm
 0xQIVGduAdodtVirti/yOVlYS15PQSZd/vW0QPt79ZfNCXXJpOjWUkFKwneN2zyrGx2J
 q6nYiHI5KdKsCEDlm7/7PmE7iDQe7+CKznF2bQPK/7nGyoqg6H85AFBJloilb0Dx+Gmr
 EWohzn9UR4rYs+Tu2YKD1my2m3VXfg15y7aXFYaxwWgHt66z9x8MFiPThvWHXkLUwuXr
 E8Wg==
X-Gm-Message-State: AOAM532Qm+PQeQu9JXZPZJOk33TEdNIDfSfQnfGfP7TM+9SX6WyUPZIS
 FhDSloo1dh14VCB0OOaRPDuEP/t/8XuUSpEZh2o=
X-Google-Smtp-Source: ABdhPJxNd8W4XXeXlRU3CKfDahGD6/F3XW55XhcqTgBtosY67UqcxtnkEDtJXvkNIg6AA+Ojjixpjh5S39+glLbrxjQ=
X-Received: by 2002:a05:6402:513:: with SMTP id
 m19mr1037540edv.184.1632956703972; 
 Wed, 29 Sep 2021 16:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
 <1632519891-26510-4-git-send-email-justinpopo6@gmail.com>
 <YU9SHpn4ZJrjqNuF@lunn.ch>
 <c66c8bd1-940a-bf9d-ce33-5a39635e9f5b@gmail.com> <YVB8ef3aMpJTEvgF@lunn.ch>
In-Reply-To: <YVB8ef3aMpJTEvgF@lunn.ch>
From: Justin Chen <justinpopo6@gmail.com>
Date: Wed, 29 Sep 2021 16:04:53 -0700
Message-ID: <CAJx26kVw8iJD_wJXypF4gjx697z_ErOdogWNNQffis19pt6y_w@mail.gmail.com>
Subject: Re: [PATCH net-next 3/5] net: bcmasp: Add support for ASP2.0 Ethernet
 controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Doug Berger <opendmb@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Sep 2021 06:02:28 +0000
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

On Sun, Sep 26, 2021 at 6:58 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > +static int bcmasp_set_priv_flags(struct net_device *dev, u32 flags)
> > > > +{
> > > > + struct bcmasp_intf *intf = netdev_priv(dev);
> > > > +
> > > > + intf->wol_keep_rx_en = flags & BCMASP_WOL_KEEP_RX_EN ? 1 : 0;
> > > > +
> > > > + return 0;
> > >
> > > Please could you explain this some more. How can you disable RX and
> > > still have WoL working?
> >
> > Wake-on-LAN using Magic Packets and network filters requires keeping the
> > UniMAC's receiver turned on, and then the packets feed into the Magic Packet
> > Detector (MPD) block or the network filter block. In that mode DRAM is in
> > self refresh and there is local matching of frames into a tiny FIFO however
> > in the case of magic packets the packets leading to a wake-up are dropped as
> > there is nowhere to store them. In the case of a network filter match (e.g.:
> > matching a multicast IP address plus protocol, plus source/destination
> > ports) the packets are also discarded because the receive DMA was shut down.
> >
> > When the wol_keep_rx_en flag is set, the above happens but we also allow the
> > packets that did match a network filter to reach the small FIFO (Justin
> > would know how many entries are there) that is used to push the packets to
> > DRAM. The packet contents are held in there until the system wakes up which
> > is usually just a few hundreds of micro seconds after we received a packet
> > that triggered a wake-up. Once we overflow the receive DMA FIFO capacity
> > subsequent packets get dropped which is fine since we are usually talking
> > about very low bit rates, and we only try to push to DRAM the packets of
> > interest, that is those for which we have a network filter.
> >
> > This is convenient in scenarios where you want to wake-up from multicast DNS
> > (e.g.: wake on Googlecast, Bonjour etc.) because then the packet that
> > resulted in the system wake-up is not discarded but is then delivered to the
> > network stack.
>
> Thanks for the explanation. It would be easier for the user if you
> automate this. Enable is by default for WoL types which have user
> content?
>
Yup that can work. We can enable it for WAKE_FILTER type wol and leave
it disabled otherwise.

> > > > + /* Per ch */
> > > > + intf->tx_spb_dma = priv->base + TX_SPB_DMA_OFFSET(intf);
> > > > + intf->res.tx_spb_ctrl = priv->base + TX_SPB_CTRL_OFFSET(intf);
> > > > + /*
> > > > +  * Stop gap solution. This should be removed when 72165a0 is
> > > > +  * deprecated
> > > > +  */
> > >
> > > Is that an internal commit?
> >
> > Yes this is a revision of the silicon that is not meant to see the light of
> > day.
>
> So this can all be removed?
>
Yup. That can be removed

>    Andrew

Thanks for the review.

Justin
