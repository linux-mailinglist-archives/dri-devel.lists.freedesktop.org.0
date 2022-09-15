Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867F5BA10C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 20:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E0E10E126;
	Thu, 15 Sep 2022 18:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Thu, 15 Sep 2022 18:55:50 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0913010E231
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 18:55:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 53F6C582BAC;
 Thu, 15 Sep 2022 14:50:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Thu, 15 Sep 2022 14:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1663267810; x=1663271410; bh=BBYoQBiYc3
 blvf9HLzeei4DjTG96i2voaCfxbBryfek=; b=MD/SPjkYriKkZPO0IKBMTzNyHD
 2NkJwDPiDt6d08iDVWgkkKyagHowZE82kgFUjeayHGChz0V4ll79h9IKxWaapbVq
 T53pIacMaGFJrFp/LYMq+DY2t0pva0D9E9E1LfjJRMq0vfCID87Viw1+s9l0TcM0
 HWsR5US9mN3FI7A8Fi8ICIfDDuFdGnr/ig4XFSxQUSDtS9qLlTNi7KLRd+c5YHdL
 1g3Q9oqE2MU31wFFu4YfVjZr4RuNwBhbTh1L+JuIl/7W/XahSVqECH7cDZRjcoN9
 QnWK4iarBG0VMhsUADqf2ZX/xWOsmCtsj3dhq52mgohPOLqMO9Kb6ts2tFUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663267810; x=1663271410; bh=BBYoQBiYc3blvf9HLzeei4DjTG96
 i2voaCfxbBryfek=; b=0nV/D6/Qe5dubZEHkhDqr6L+R0jme1Skhm+b8pH0RACL
 vKoVavUPZrmy0Sfkn0XWLe0MGh5oJn/1M6kyINIIW1jG9Lese3SeGsVE1WW7ZzqK
 d0htkhh5tz6a2qU3Qh/6WnrHCpYENa2rv2cPYprP+LKweWkfEkS4+A1II2o3ppdT
 dFI4zaZQahgKfxwXvgbbkjYJIdH1D8EmtY/MCqBucVkF0poGYXzTj41ve96J+hb5
 b5O5TiRRe3Q1/FJddDbjj8lSxsC5DVIxj79YBkUnR+OlKAOvs+bcQUZHwv2C6idT
 tksqyVP97RLSNCOJHRplKpRJOE+hf35gpr9vDhoeqQ==
X-ME-Sender: <xms:4HMjY3rzgUaF40C3d0WcWQ2u_DVFF2jyhQVAbSQB3dRTWgTihB1KTw>
 <xme:4HMjYxpjgk5fCBjkdi1nKv7Pbwia8ByC7KkJ8zUp5tLQraoh2EVxWyE6uhgtK3gwb
 ax0S8VGtpvNuEqfiWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedukedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
 feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:4HMjY0Pm5XHk-g7wSGdxxqd6qiecnTUc-p5rQV5L-Er4Ex1xnR93sA>
 <xmx:4HMjY66oarAjzbfOhtFV36Gwai_hazX6LeLGsaN9sEzTO8u1TGPRpQ>
 <xmx:4HMjY27qoZG8dAaFWwdosyRGFW59SFfGMxMCp088_BgmdJGtCsv96A>
 <xmx:4nMjYx3ywXZCQbn60d0ACPvXtZmQDy2NDHE3yAYv4hWksHtt6JxTLw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9F9F5B60089; Thu, 15 Sep 2022 14:50:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <9b4152e9-34cb-4ed6-b5e3-ef045b40dff2@www.fastmail.com>
In-Reply-To: <202209160259.7f3Z5krO-lkp@intel.com>
References: <202209160259.7f3Z5krO-lkp@intel.com>
Date: Thu, 15 Sep 2022 20:49:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Subject: Re: drivers/gpu/drm/omapdrm/dss/dsi.c:1126:1: warning: the frame size
 of 1060 bytes is larger than 1024 bytes
Content-Type: text/plain
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022, at 8:17 PM, kernel test robot wrote:
> Hi Arnd,
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
> master
> head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
> commit: 3d427228f7370894680580fcd0381c0349624fa1 ARM: ixp4xx: enable 
> multiplatform support

This did not cause the problem, the bisection just landed on a
commit that enabled additional configuraitons.

>    drivers/gpu/drm/omapdrm/dss/dsi.c: In function 'dsi_dump_dsi_irqs':
>>> drivers/gpu/drm/omapdrm/dss/dsi.c:1126:1: warning: the frame size of 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>     1126 | }

I think hte problem is that struct dsi_irq_stats is just too
large, at 776 bytes. The interrupts are disabled during a copy
from 'dsi->irq_stats' into 'stats'. A trivial workaround would
avoid the local copy and keep interrupts disabled through
the entire function so it can operate directly on the source
data, but that would introduce a longer time with irqs disabled,
which might be bad as well.

Since this is only called from a debugfs file, and reading that
file is probably not performance critical itself, maybe
using kmalloc on the large structure would be best.

       Arnd
