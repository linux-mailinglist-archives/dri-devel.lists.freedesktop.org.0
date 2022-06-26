Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF655B337
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 19:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E52E10EAA3;
	Sun, 26 Jun 2022 17:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1577F10E5BB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 02:59:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A0AAB320083A;
 Sat, 25 Jun 2022 22:59:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 25 Jun 2022 22:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidreaver.com;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1656212376; x=1656298776; bh=3I
 eufCplLlcj9jpQ45a+cMmawOgellICku8X7+NCdvM=; b=C4uaTn0BV58qsBXmJA
 G31lvN+p1ycP3wMZodrdgPDswfXZCWAeACWdrBa35dvOUMbIho6JAvbdxWylXFK8
 leTlj/7ZtOxbCjVfMkXNI0ZJMRR+TTsaj02+iIAk53geiVBjgFGFK+ed6ZTmXyK6
 DEx64LA6fXRaOHL3wLbLR0RtG9OCYs8F5O/SJitzIhGNLvkNjLFDmQlEbCn5ZfLy
 pS2BN/ugz6aIrs9PugCwXJ6CPFVk1XHoEz9mn5ElKF3GoSmlkwfznCBTTNvSvK3p
 ataB+R+QpeAnzUqKoE5Mj82olwiACZTYl48EidkJFDD5QapO0zg5LK1u/gfd4ge8
 rO2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656212376; x=1656298776; bh=3IeufCplLlcj9jpQ45a+cMmawOge
 llICku8X7+NCdvM=; b=sYLCXgmxwM6ntrLu+ozxGwUBrvZN36pfkF/6l8f8Gv3K
 ddyYOqVWOBbRZ6JtGIUgZIk9QwkjkQTyGCiwFcU3+KnF+gg51zm00nduXBnAXKrq
 S+6m6R0wxhHp0kZWhi4BjdELxnXq4fsGVKMi05c0k2ffiC0CRlbhXApRdyZ3t3g5
 JWU4gtc73WLN+LUwRgCWf6wSNsYk8MN/MHNyt1ZnDfaLh4SttBRkK2c7xaA9cNIY
 DaHxOblwd+/jKffyIqrV3M33cDjuJXnMlQhj6j9/v1NZG0qyxvsOL8jM8HsqyHXg
 CNYEqmhfsv7jWi1tMlUyg9tHmv3EHmcTQAfF/KQGhA==
X-ME-Sender: <xms:l8u3YvF0cdHKwL3ixNowYoncBmWbkso2ddD_gTNmP59eHjwA1wEY7g>
 <xme:l8u3YsVsgTAPPmcvUvVNALQ0P7dzgP2kLWcDyw19yaGlFbN2wxtEdYfbEh31TuaTA
 9mXrukfQ2htvY02BxY>
X-ME-Received: <xmr:l8u3YhKm0AGL31IrsYEjsMhqiGkQ7aXFWXGdSQTNXauUSaCkJCa_YyoRmTJtXXSqg9KK38TKxbxLFh5adjY2fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfhgfhffvvefuffgjkfggtgesthdtredttdertdenucfhrhhomhepffgrvhhi
 ugcutfgvrghvvghruceomhgvsegurghvihgurhgvrghvvghrrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffiedvtdekgeevhefhudeitdeuvddtgffftedtueelffffkeetgfdtjeev
 uedvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmvgesuggrvhhiughrvggrvhgvrhdrtghomh
X-ME-Proxy: <xmx:l8u3YtFNhjQ_J_NxZ3IRMnX4SbiLdTWdpMKOZYMvdwJeTN8K-cUo_A>
 <xmx:l8u3YlWsCD6UNREZ_QQEfZuZJpdwbNsopjgJg1NJXlH4FP5XqBzTog>
 <xmx:l8u3YoNayElDfI9O09C_0W9uTTrGMG3RBIMyyMcK1X7sLg1v2UtGSQ>
 <xmx:mMu3YrzY0Pu6pLJlsM8CQ59y7FomD8OzaP9vzcbMHD2Pwjxvq-K5pw>
Feedback-ID: i67e946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 22:59:34 -0400 (EDT)
References: <20220626020002.1577101-1-me@davidreaver.com>
 <a63132e226c2bb7b3f689cb09f7479adea5fe918.camel@perches.com>
User-agent: mu4e 1.6.11; emacs 28.1
From: David Reaver <me@davidreaver.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] staging: fbtft: fix alignment should match open
 parenthesis
Date: Sat, 25 Jun 2022 19:52:01 -0700
In-reply-to: <a63132e226c2bb7b3f689cb09f7479adea5fe918.camel@perches.com>
Message-ID: <86a6a0xh7v.fsf@davidreaver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Sun, 26 Jun 2022 17:47:58 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Joe Perches <joe@perches.com> writes:

> On Sat, 2022-06-25 at 19:00 -0700, David Reaver wrote:
>> Fix alignment of this line of code with the previous parenthesis, as
>> suggested by checkpatch.pl:
> []
>> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
> []
>> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>>  	write_reg(par, 0xE5, 0x00);
>>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
>> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
>> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
>
> It's probably better to ignore the message in this case as the first
> argument means something and the second and subsequent are the data
> being written via a specific macro using NUMARGS.

Thanks for taking a look Joe! That makes sense. I'm new to the kernel
and running checkpath.pl on staging drivers was suggested as a good
place to start contributing, but I'll keep a more careful eye out next
time and not follow checkpath blindly.
