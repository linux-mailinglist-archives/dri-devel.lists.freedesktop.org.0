Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7BB51666
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE5D10E901;
	Wed, 10 Sep 2025 12:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="cjxDodLG";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="FY5yc2dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174410E901
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:02:09 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A1E0D14002EE;
 Wed, 10 Sep 2025 08:02:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Wed, 10 Sep 2025 08:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1757505728;
 x=1757592128; bh=dySMKmO8AjsZt3ofKwa8fuJUDSsofEKqrMaXNH5QXDA=; b=
 cjxDodLGdRyTfcubm8+cX9kymwwNMi40GYCZkDD1hDcsV1OmycxscHmPTvIGZps3
 dwe2KHvZ35gtJWhUg8E93GYKznpIgQfq66mxEpHxCxfKLBD7q4KN6mFlXemEAbcj
 Bt6dUqEAiPFUqB4hDJoSpv+QIMf2i3AxqoxCD/gCnW+e2q9vIWOhpqibelUjP0SL
 /fC3BNMUkB5eQpShV1KMh71dp+9Ue5I/qyu3kxmm/VeKaDBby+dBIapsmo3QD54C
 BY6pDNm3Y9HKgB1qjZSnCayC02mYFKrADWh6xBzByE1MV0YMYGB+SB5sTbmlZ6sA
 VeNHvR5Ok2V58qB9gHUl3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757505728; x=
 1757592128; bh=dySMKmO8AjsZt3ofKwa8fuJUDSsofEKqrMaXNH5QXDA=; b=F
 Y5yc2dwJdpSeLCDc5eXw0uhHyRxbLRldbR3ffRkMHZykoQX4laOE5UzM4zRI+5bb
 jw6t9YlQThdPNVJPPEbopvxFRw3gBVuNnhanVs7Qcmvdv7LXy06pA3HGaO4Z7l6n
 4b3NEIULK7FAv/GT0ZqA3w21H53ORvsmtjFnaLAXkzhplKsxknWbubrSam9Eak8G
 In78gk7yFTKJ3ZuMqXmZAVo7CQZM4/GUKzzu//OlvJGjxY116FhbLU5AaKDjvQ8V
 /x2wrTZnDMb5TpJUsyUTGzJlQ09Alo6PJiefQfqY6Um2+eeQgDd59fe54b9oEfpC
 PK/WdckG/cspUSaWwh3uA==
X-ME-Sender: <xms:v2jBaA7wjHS8UBtdW7O8xzo-C2XgnREy4hP1iou0ST9WYEJXGMDchQ>
 <xme:v2jBaB7mjPiv5q_9VIjd6HLzCKq8tFpQlrWIFtE3OPlTS_34rBP5hD43PQQYdbyCF
 EMSPiYTHuJQxIbPB9c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
 esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
 rhgtphhtthhopehsohgtihestgeigedrrhhulhgviidrohhrghdprhgtphhtthhopehsih
 hmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdp
 rhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprd
 horhhgpdhrtghpthhtohepuggrnhhivghlrdhprghlmhgvrhesshhonhihrdgtohhmpdhr
 tghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-ME-Proxy: <xmx:v2jBaLj3f8EyLQL81vF1aNUq25lGEpyu8bJWepPHw5FkXvrA8LanVw>
 <xmx:v2jBaPY_tFfrWA1MDRa7EFRF-AlYrc8UQoe8v44_LF9nz1JVNjdSjg>
 <xmx:v2jBaApEzJJUp2pabY83EVIR1vAbZoHHZUqcEY4bOkrjPEk2FIRGPA>
 <xmx:v2jBaEPQlVbpT_vMhmtUWJ-DYf3723fEcF3druBqEJBiycoihwPGQA>
 <xmx:wGjBaBSJi5wrIxjxxDttlNIOPGUEpLGK3t1wxC9hbZwZj668nSuk1q6Y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 5BB5370006A; Wed, 10 Sep 2025 08:02:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2uCCbRi8x6B
Date: Wed, 10 Sep 2025 14:01:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>, 
 "Simona Vetter" <simona@ffwll.ch>, soci@c64.rulez.org
Cc: daniel.palmer@sony.com, dri-devel@lists.freedesktop.org
Message-Id: <082bd0f1-ca71-49e8-8136-09f7523d3dfd@app.fastmail.com>
In-Reply-To: <bb2aaa0c-7c39-48f3-acff-629957b730c7@suse.de>
References: <20250909132047.152612-1-tzimmermann@suse.de>
 <20250909132047.152612-2-tzimmermann@suse.de>
 <fef5d665-e7c4-4801-93ee-176be10b1000@app.fastmail.com>
 <bb2aaa0c-7c39-48f3-acff-629957b730c7@suse.de>
Subject: Re: [PATCH 1/2] fbdev: Make drivers depend on FB_TILEBLITTING
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

On Wed, Sep 10, 2025, at 11:28, Thomas Zimmermann wrote:
> Am 09.09.25 um 19:29 schrieb Arnd Bergmann:
>> On Tue, Sep 9, 2025, at 15:19, Thomas Zimmermann wrote:
>>
>> Is there any reason I missed why enabling FB_TILEBLITTING is
>> useful if you don't use one of the four drivers that require it?
>
> It's more that some users might want to disable it explicitly. The 
> option adds additional code to fbcon. And most affected drivers could 
> easily be changed to work without it AFAICT.

Right, I see your point. I assumed this was purely library code
getting called by the four drivers, but there is also the fbcon
code it interacts with.

Acked-by: Arnd Bergmann <arnd@arndb.de>
