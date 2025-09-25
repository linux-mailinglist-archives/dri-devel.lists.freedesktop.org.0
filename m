Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2C0B9D948
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 08:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF0410E28C;
	Thu, 25 Sep 2025 06:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="u6+t9Ove";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="g/O4e8xZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C15B10E28C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:24:42 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 0BCA91D0012D;
 Thu, 25 Sep 2025 02:24:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 02:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1758781481;
 x=1758867881; bh=NKAX9kjUmXnFRrCzUIGgkr9h1OYhUSbw+NJFAguSOSU=; b=
 u6+t9OveB76x+yyoGMpXV6g/7401MrH2RzEAOz8MlwPpO+I7H1i+jQhlhleYoWxi
 4yeLhw94FSKQZvzJH8L5PZnSO+LIlcFXbwHZc2m4mq+27GMfaney4NZZQeSNAJ1i
 CiO1Uw70U0s/BUUJurQVkatGgcUKM5EWKIXiuZMS9C369JhR+ml0e4dKvMj+Q5UW
 nGs0YVQODcX/vh1I5VHQHvCWicaP44BL9zkAdwTzgPw7vALRpiRB6aZLQ2PNWP8x
 At9+rBHfL4IsRlLmKnq1YxW0YQRwy9gkothC7RXxu0QZF2EC0GKapgqIuiUVAwqI
 eVjHaWKAB5jNqhfKPtSD6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758781481; x=
 1758867881; bh=NKAX9kjUmXnFRrCzUIGgkr9h1OYhUSbw+NJFAguSOSU=; b=g
 /O4e8xZ8DSji14yz/V2DKEy1M0rdS6I3oLrXtGxkehJtl001a/yMXt2JKLJI4vsg
 kKMWE2BVzLlk8UMifjepOUS40Kdnr/YvKZCUKpKZ+kAoQjuz6Xx73tJoNKx/7eFV
 iaGG+BsL9XbBlCRcks7ukknDYxQsAOT0twOXV5oQDjEwOYCTCNSs0JkUGCrndxT2
 w5a4OOjQ9PFlwg81+ESeU/BtZYeLHcIUYwsHbYnNHf8j2Ftn6/vdGflANUBFN2ls
 Acl3BIMUwwEBQbCaMgj84ClLVfYgov5mN/kV8d+75wxRkBxxixv3bOUCW7k9PP9x
 eJfyMG3uDfzw9z2UlCiRg==
X-ME-Sender: <xms:KeDUaOwAFBWWngC3dOVCUllUnvhtfB4mOeLFtxc3mNUQ0oSjADYqKg>
 <xme:KeDUaFFAd09lwyFqs6UZn6x4DCrvM3fOQ4CEXvEVcQ6aTqbRQlf97mFGd_DZoEbN2
 SXvHSI-F_XHOjdz8DWlXYlMNhHU1qc4F2zSzguvnKASZlaTBGTQK1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiheejiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
 esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhht
 pdhrtghpthhtohepshhrihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvg
 hgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughrihdq
 uggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhope
 grihhquhhnrdihuhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepjhhi
 nhhghihirdifrghnghesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepkh
 humhgrrhhirdhprghllhgrvhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphht
 thhopehtihhnghifvghirdiihhgrnhhgsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprh
 gtphhtthhopehtrhhilhhokhdrshhonhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdp
 rhgtphhtthhopeihihhjihgvrdihrghnghesohhsshdrqhhurghltghomhhmrdgtohhm
X-ME-Proxy: <xmx:KeDUaJBr4AE4kg4yft_QMXbJshQYIqUu_D1BM1N_2E-83dC0Ob62wg>
 <xmx:KeDUaB5BJv3VvABteZkLxNDpJiRsp3DUwCIT3AyFBvKNP8J_g-jZyA>
 <xmx:KeDUaKtNOeDucILvRjFcQx8B5J-JroNr8N3ezi9T8hzUy0QEpSP6GA>
 <xmx:KeDUaO7XOPMmTVhb2tHG9a_GsQpvZexbRE3XfkTgt6yvxHGdy8-mTA>
 <xmx:KeDUaJNz3O3KT7coY0DUmNfr5M_GGmoewetIowGYt3C9dZBtpQu9wns4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 5FC2D700065; Thu, 25 Sep 2025 02:24:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AMevm5OXfB2s
Date: Thu, 25 Sep 2025 08:24:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Amol Maheshwari" <amahesh@qti.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Kumari Pallavi" <kumari.pallavi@oss.qualcomm.com>
Message-Id: <969bdb49-0682-4345-98f7-523404bb4213@app.fastmail.com>
In-Reply-To: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Thu, Sep 25, 2025, at 01:46, Jingyi Wang wrote:

>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->phys));
> +			  IOVA_TO_PHYS(buf->phys, sid_pos));
>  	kfree(buf);
>  }

I understand what you are doing, but the naming of the macros
seems a bit confusing: dma_free_coherent() and the related
functions are designed to take an IOVA argument, not a physical
address, so calling IOVA_TO_PHYS() before passing the
address sounds wrong. This is made worse by the naming
of 'buf->phys' that is not a physical address at all
but already transformed twice into a dma_addr_t and
from there into a dma_addr+sid tuple.

Ideally the SID handling would be abstracted behind a custom
dma_map_ops implementation that treats this as a custom
iommu, but if the fastrpc device is the only user of this
address format, I can understand you want to keep this as
a local hack in this driver.

Can you try to come up with some better naming here, and
replace the 'phys' bits with something that is more fitting
for an iova/dma_addr_t?

     Arnd
