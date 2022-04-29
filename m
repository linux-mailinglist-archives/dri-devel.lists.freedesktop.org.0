Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCB514DE2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D951010E3B5;
	Fri, 29 Apr 2022 14:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8A910E47D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 14:45:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5D7803200957;
 Fri, 29 Apr 2022 10:45:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 29 Apr 2022 10:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651243530; x=
 1651329930; bh=R2kzxb2faLVD2cfAlupuIoVIu6TQkApW4gsNm/Fi3EY=; b=n
 Ux6Slg6PFu8ZivE3vO765qork/TAWs8PsNEYF9pLh/KsW2S2rN3QAYjkLSupI9yz
 ANy05PCyRyAXdukzny8BX5ESgc6FUqdVMAcGUKNnat+H9a5qC8USfWa+t00/cbjg
 HQuQsclNxaf10v+fRC+1JuH00uL+Ml+/zMekJy0pcTQuOL9K3FsizazUNe9y0Pi2
 tq4XhJCMCfUxmb1NxcjgNvU0xQhltfzKdWva8CHh4J7p9iRPYqq5lWuHv0e7OTK3
 JUJwjD+Hb/4sd205Z/n62BvFZ/TP8gpXTkcq7n+ebAqcZtBW5iAdUBKqiRG1Ixjz
 XOTnRxayS720fjhxvZLkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651243530; x=1651329930; bh=R2kzxb2faLVD2
 cfAlupuIoVIu6TQkApW4gsNm/Fi3EY=; b=V7DEtPfhtDFO3zmsBMJ5gbcsR21WG
 mDEftKHPxFzTX6OR/raryXyTpNApzn+6tsIeN2Cq+72nNzpNBrEYwjMtz/sl0Y9r
 nCJTp6I/iGZ/xclnObyOrbc0Ga8iSftXa3cY/g69cZZkLNoZif/iFhTeZ3dWAT3i
 Z/3MnIwtjFp719qA86hKPLAFDAMb51IHQ04LhRRCtY9Y3m8Y+jYDBxloj7H3LE4H
 +DH9w7X7AoinQH2R2LPOdcKqvTxaDx0eag3/1DMt4wiJRhM8uaTYP9kLRz0FkUT9
 iJqnTCYE5yBafGYi2P4DnlOT4/R1kyA5bHtv+Whljhu3TklLHCNWE12XQ==
X-ME-Sender: <xms:CvprYv9sH7yLuYSIrUY5W2IamW421Bqp9FLBFzAP2DsPNem94WEpVA>
 <xme:CvprYrueWDqwVEharuXTBCTXZLTUJf3Vzh4K9JA3h3nvaIVW9a_BcSMvSx1NR99UC
 U-mQblt0G9gCwuXsmQ>
X-ME-Received: <xmr:CvprYtDvG-xPcEa2D7IviCVLfHXlunVVI4Lx_MZIDYqZ4Lun9KP4q0zeZF8JrpL5r4Byxk5vxOXPxHlw4zSGA9ySXk7mwxrdoBNdUHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CvprYrdn_VkuxwI-JVDxMQXCKU1DKsRigiZBgagMn86tPsKid7Cicw>
 <xmx:CvprYkNXC4e-UXROaccBdYTOYiC4fTNQBlJyOqtUKmO2Sp7wYwxsog>
 <xmx:CvprYtn15Ly_xPBvadrCKsdArC4SkDWduTY_qs2tNeupCQU1Q37w-w>
 <xmx:CvprYrdN44DgVVcB8uMnrsFDGPiqJSw-zEFl9csYvG-5llBaJCp8QQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 10:45:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: emma@anholt.net,
	cgel.zte@gmail.com
Subject: Re: (subset) [PATCH] drm/vc4: simplify the return expression of
 vc4_prepare_fb()
Date: Fri, 29 Apr 2022 16:45:20 +0200
Message-Id: <165124351807.924095.13447037610225505110.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429054945.3852039-1-chi.minghao@zte.com.cn>
References: <20220429054945.3852039-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 05:49:45 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
