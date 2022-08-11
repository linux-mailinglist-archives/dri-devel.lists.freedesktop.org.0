Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0627590703
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 21:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6510F6EC;
	Thu, 11 Aug 2022 19:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983E11BD3A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QLRx4H+XGpXFylQ2TbFhWz3aL0PpZ3QlgVkAdrZLHrU=;
 b=PH+tA5l6A2n0DrdNGzr5bJWfjbE35C4fpJJE7ePCwG2DWZuHaIMiseErpIF5mqpB6OM1Yjbh0VlAB
 9ttQa56iPc4ArI4IDXCrZxQWjJfVkn7DH5t/7KBntUXjRzENW2Kg2r48U9aXQaWSljbVrhbUSbwSob
 6FAF46WgZknrgLh6XlCbeVelDNzf31c31rxCadTu9WJBCY1c3zlesAx013qR1aNLtgSUSzkgzUxVda
 wuH/KYEYQ5gJ+J8FYwfvLUqMMGA6ILU+oqbczAmr+O4nhRgp9D+e6xLL0eaF7cNd7D6B+FVJkjMDKX
 AyOsyjw4TSrMQwaErd/zn9kFbuJnySw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=QLRx4H+XGpXFylQ2TbFhWz3aL0PpZ3QlgVkAdrZLHrU=;
 b=S/PIWt1v71LueJpIH6QIZPdFui61kARPusGpQsDuJCNGbJbEERvTVCQLA2Q+VRJM1+J1El5la2Klf
 4Y2bTpDCQ==
X-HalOne-Cookie: fbe116bf4fbf6f9f5e47064d9d0ab3dfdec5f16e
X-HalOne-ID: dc430f0a-19ac-11ed-be83-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id dc430f0a-19ac-11ed-be83-d0431ea8bb03;
 Thu, 11 Aug 2022 19:36:14 +0000 (UTC)
Date: Thu, 11 Aug 2022 21:36:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH v3 00/32] OpenChrome DRM for Linux 5.20
Message-ID: <YvVaLM4sUVzBKL2v@ravnborg.org>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

On Mon, Jul 25, 2022 at 04:50:55PM -0700, Kevin Brace wrote:
> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> 
> Hi,
> 
> This is my first attempt (this is not a RFC posting) in trying to get
> OpenChrome DRM pulled in for Linux 5.20.
> I started to work on this seriously around the summer of 2017, so it has
> been a long journey.

I hope we have not discouraged you to upstream the openchrome driver.
Eventually we may end up where you aim for, but for now we ask you to
aim for a non-accelerated focused driver with no new IOCTL's.

So I hope we will see a respin of the series so more people can benefit
from all the effort you and others have put into the driver over time.

If anything is unclear or you need help with something let us know.

Best regards,

	Sam
