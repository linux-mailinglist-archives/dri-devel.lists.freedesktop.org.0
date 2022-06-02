Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE553B4A0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A58E112A7E;
	Thu,  2 Jun 2022 07:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541C310E591
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 03:51:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D6983320090F;
 Wed,  1 Jun 2022 23:51:47 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 01 Jun 2022 23:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxfierke.com;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654141907; x=1654228307; bh=+6
 v4s6bg78Q7jGgIkXGLe9dp2dwdRCZ7vAwWjbLTElY=; b=odpKzszHpmRqVVkw1L
 rqUCc1I2lie3iu1ZByYnN291sCB4EWq4hPL/Xyh4dJR7Jq/YGsD7lOVrzYFGbu8k
 mZB9hpdZvRDtmAxFcNrTmlXHrAg0dOts9TzXc3eaedd5PCnTJiFhDtvaWqihjcym
 QH1GATdHBn0MI8d622r2GhXgch7NPSh0R2+l4kSATt+2wSR+zzr4+gZb81jAn5XY
 7krB8dKNhd77cWv/H6ejAachtPj+aknb9cbB89lx40RmwkcJK8qZey0y0gK9ZHqs
 NtgcIdbl0/sL5UC/mxNg1XM9Rj6pkpqaX741ypLP0R0vKhySSlX5jUAbjoReeJJj
 c1HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654141907; x=1654228307; bh=+6v4s6bg78Q7jGgIkXGLe9dp2dwd
 RCZ7vAwWjbLTElY=; b=Sx5+DejUbHQMUPIm4dLkf7Wfg4zrUR1VO3RipTmO1Jce
 xccZ9nJ2siVUHUfaOU1MYMI2iUrKpjwiPLzCtlAXcideof+dp1/sfXMnKDol4GNH
 EFO1y+pss6l5jlgRfFMwStRDPq/CHX8bFxPURLXUxbkqSB46jGHGzl6DbgT+g5qb
 iLAs3lGuIUsjb7VKOIWbIklcmfUuPglxGxxi/PWq4g8kjpFjS51wykXezJxmeHje
 qN6P3bHPCY7/J4qn6CSRIa8GICuiQpqPoQpsgm2IE6wxfSU85IZ+9Aj7UCfHwl8O
 t5i+Amulj1KEycTIpZI7WD/Rs4z+YUiOkFavHLzklQ==
X-ME-Sender: <xms:0jOYYlRjZBZt61BV3xNzjF9yB4AVRRPKUmTPD_6BsyyEBNJu06iBvQ>
 <xme:0jOYYuzeYWumD3xucPPIbfPmh2-TaUfet8bY5wId2j_caiIdOnvfSce5FOlFHkbyW
 YtCyxrjaDnxHe4FvHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdforgig
 ucfhihgvrhhkvgdfuceomhgrgiesmhgrgihfihgvrhhkvgdrtghomheqnecuggftrfgrth
 htvghrnhepledtffegueehfefftddvudefvdekhfevhfeufeehhfevkedufedtleekgeek
 feehnecuffhomhgrihhnpeihrghmlhdrihhtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgiesmhgrgihfihgvrhhkvgdrtghomh
X-ME-Proxy: <xmx:0jOYYq1K5MdTnZkrjDgaXvnO9zO-geSOYR4E0qTtDgRr4Mj9dwr1tw>
 <xmx:0jOYYtClqln69qVKQxyBet_Oa5ilgce1w1oyGKHD356_r9LDtiEJAw>
 <xmx:0jOYYug9pfYoy1hR5fNai9L9KY2nKYtVlOH27vfNoWYT7hz3R7QZrg>
 <xmx:0zOYYjYa94ePK_1RKNrMmodXE5YnJmtTIBWjNnMc7E3uQfqCv9wr6Q>
Feedback-ID: idee9475d:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C46942D4006D; Wed,  1 Jun 2022 23:51:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <0d2c60d7-9fe9-4bd5-b8a1-972e50717e08@www.fastmail.com>
In-Reply-To: <20220601184711.GA201654-robh@kernel.org>
References: <20220601051748.1305450-1-max@maxfierke.com>
 <20220601051748.1305450-3-max@maxfierke.com>
 <20220601184711.GA201654-robh@kernel.org>
Date: Wed, 01 Jun 2022 22:51:26 -0500
From: "Max Fierke" <max@maxfierke.com>
To: "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: Add bindings for ClockworkPi
 CWD686
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 02 Jun 2022 07:54:05 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022, at 1:47 PM, Rob Herring wrote:
>
> You probably can simply add this to panel-simple-dsi.yaml. It mainly 
> depends on how many power supplies this panel has.
>

Unfortunately, it does have two, a 1.8v and a 3.3v, so panel-simple-dsi.yml won't work here. On the devices on which the panel is present, they're both always on so they were left out here, but this is a good reminder that they probably should be added anyway.

Thanks,
Max
