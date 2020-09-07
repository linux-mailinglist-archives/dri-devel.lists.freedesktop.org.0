Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A199425F35D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 08:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199236E0DC;
	Mon,  7 Sep 2020 06:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B996E0DC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 06:47:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1F5DA5804E5;
 Mon,  7 Sep 2020 02:47:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Sep 2020 02:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Q0DBGCLdRqpgGeoV451zpNYeMR7
 zl4F6cl2pawEVPVc=; b=Xh57S0T7w6SXHwUa2aBko3QAwKpDlhfB3FguZTO7L3r
 GwWviGYE0MG5QawyiTxh6r6NDlKaAZzCQMRC+mu/RxRH4/LErPHLUoWZJgZc9aOG
 Iy69jmi1WA5tOrrlf/FmUqVZuAuFDcR/X6FpQuWjnkuijsW57ETYPJysBUCl55mn
 cFqpWmhP76lxT9NFHGVCCAvCjOVvbDX3FmzVM1Kl8z9v2qOG0Fqbh2cfdx57V78D
 HTTRUFeKPETNAERB2t7djtTrqiFBdpwUQyNlVvSe5vQqfzVMrWv8xIMGNEKkTr1+
 MGGfFNmxE8S8PxO8EDEy/UGHUfi/052pB8+QkUIuALA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q0DBGC
 LdRqpgGeoV451zpNYeMR7zl4F6cl2pawEVPVc=; b=Fj/s3g0++VFkweOmX33oB/
 +J9XCYnBNEdjADKK06fIZsDLQHE1nJWk0ta1NycH0G/F364+eDZAfCTYpO+6DI8c
 g3KATIB0tG4h8fi5QNmMDrTCdOJdKhAQcVCLqfYIRZrcWqBHW7j7exwmx84Raund
 GsnV5wFA4epetdauHe3UjYVL1ZqkxgAz7bLb36u/aV36Z8b4MDvjzHgAs+9+OMXT
 sV9Xud15CeuO8gwesmSQda6XewX4wz/moAecMpJ7NBNbpngX7Pk5VNVz2C4Xsp4q
 I82fbjlBZW8srfLLaPdgcsogvh+h38V+MLq8eFFKRjfiKbN39EiA04QAJICYPvOg
 ==
X-ME-Sender: <xms:mddVX9x_7LZbFXF7WguT4fg_1-WpYe2CMzogeGS3KZG5m_88xUf4HA>
 <xme:mddVX9Q0WEywN9poOGwO-KfifkfK77CvCxlXUqk7WFeCbYvw9f5y18vR7VgCIb7Q9
 BJTuCnVfWM69g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegledgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:mddVX3VO1UOQxljzmxXESbTD_CBZj7O1FOP_ntD94FTATiwX1zzFAQ>
 <xmx:mddVX_jxDpXL8nFayqwxWzmssc6B5mIUMpSugM6seUzlxY-xVkizIg>
 <xmx:mddVX_CapUHn4AqHSgYB5QOiZkwxQhAA2zxOGfdNYNxOKT0IxXcPgQ>
 <xmx:m9dVXz7JaLvxQSA7z-n-7F41m5HUZh3WMdMZgeFNLgLesfo6Dg-91A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id B80A2306467D;
 Mon,  7 Sep 2020 02:47:52 -0400 (EDT)
Date: Mon, 7 Sep 2020 08:47:50 +0200
From: Greg KH <greg@kroah.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 0/2] video: fbdev: radeonfb:
 PCI PM framework upgrade and fix-ups.
Message-ID: <20200907064750.GA284261@kroah.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200907063153.GA29062@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907063153.GA29062@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 12:01:53PM +0530, Vaibhav Gupta wrote:
> Please review this patch-series.

I see no patch here :(
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
