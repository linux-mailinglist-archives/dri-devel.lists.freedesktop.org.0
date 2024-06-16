Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F9909AF9
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 03:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248F110E0FF;
	Sun, 16 Jun 2024 01:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="tQK2n0q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9912310E0FF
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 01:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=VMgOaKbDyzjHCgUb9Jf5r6hZWkNjR/kmgzL4IDgUn4I=; b=tQK2n0q6YxQ1MOpicvrGXzAe5z
 hkkOiwDLzavAsBQEQsj5IJYut7t6wgSt4/KZx3rGh6A0B+8IWeFUB+91gJREvJ9bwRnN0TNjqgyld
 bE1JPQw/QKCIvaag4Gcl/Ihe6+z+kCePrXwNDSbyKWPsnhFxnN2otsc5d6XA4t/M30is=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sIeO7-0009sQ-Of; Sun, 16 Jun 2024 03:08:55 +0200
Date: Sun, 16 Jun 2024 03:08:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Omer Shpigelman <oshpigelman@habana.ai>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <61476e92-aba4-4726-984c-d845e5fc4dd3@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <38b9797e-d213-422e-8b2b-7a31f5924b55@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b9797e-d213-422e-8b2b-7a31f5924b55@linux.dev>
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

> > +static void hbl_en_reset_stats(struct hbl_aux_dev *aux_dev, u32 port_idx)
> > +{
> > +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> > +
> > +	port->net_stats.rx_packets = 0;
> > +	port->net_stats.tx_packets = 0;
> > +	port->net_stats.rx_bytes = 0;
> > +	port->net_stats.tx_bytes = 0;
> > +	port->net_stats.tx_errors = 0;
> > +	atomic64_set(&port->net_stats.rx_dropped, 0);
> > +	atomic64_set(&port->net_stats.tx_dropped, 0);
> 
> per-cpu variable is better?

Please trim replies to just the needed context. Is this the only
comment in this 2300 line email? Do i need to keep searching for more
comments?

	Andrew
