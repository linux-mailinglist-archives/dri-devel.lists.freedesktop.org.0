Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313AC76BC02
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 20:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEF210E1AD;
	Tue,  1 Aug 2023 18:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDEC10E1AD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 18:11:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4821F5C0092;
 Tue,  1 Aug 2023 14:11:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 01 Aug 2023 14:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1690913475; x=1690999875; bh=eE
 +ZmxEPmJK7h2uvgN28/68aN/r8oCV0QiX0mkRPJM0=; b=MOvEMqKBwfQr/v4gQW
 Pj9K7OOIgyIcqkZhBgNCiwVcrZF+ClNMMYq1pW2oFBg6be5tLFtktnVqCwAOC8Hq
 AvfWn9TXZNky3AWSaIMrkRyPvffCFfO7omCSKmtyUvy9lcx94cLLElK70KDCbzmg
 RjSJIP+gKO3uxEgonoufcfLFMC/RwNxULJrwCbBgdat4S6eazXcNY/609dQMTdCm
 xh4vb0hmxy2VlWfl+WbXaM5rheD6qZbNbP6s1640GQ56gRxwCrUVvuUoMRT+3rg4
 tBuQ47zyMjomRPztceyWww5A1iIBjP0p1oKT+GB5rwUAaqW+40/1BRrmO1Fc9Sq0
 dzfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690913475; x=1690999875; bh=eE+ZmxEPmJK7h
 2uvgN28/68aN/r8oCV0QiX0mkRPJM0=; b=c8sM2APwKJCVWfzPDnXSEl0NOsIiw
 c6fivvjjPHXDY1WKY8+zf80bPzxhfgf0hbMdSk7oWiFSpjYFBgROA+W3ABK0jhut
 un5EU2ZMLyt7E5bm8BFlIHEEeh6QWXtny0nf/0Ttg/3FAsTORIRVmiC+UALxkXed
 +89JyalK5DP5UE2AC7vYVpk7LOy+o8I9eC/P/C8s1Ma00qJVylflExdFBZj/n1Tl
 w73Gp6Tuf3nS1SWkR9Enoj5WCKmJW+pYzQnRbK/+z7DZ4ABrcCcnntL/zYZ6BqZV
 ZfY5EP859SxwqCpnbbCuewUji9p+XWT+Go8fNCE2+u0fuoY5LQKW4SzMQ==
X-ME-Sender: <xms:wkrJZF4-MvIwfc1rXS8txE4iDlut3RwWd304lgBEPLV9LoJbl4bEXA>
 <xme:wkrJZC4eC47jiXssaNQmvo1Qytc2FpvkP1JCL7kB9Vjevk022wC_AYYsyzRC1WWZ7
 AsUhzeZvDkZUV4h_mI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjeeigdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:wkrJZMeFoSXh9txuVmbpeditEQr0l5nKLcD4q44pPMEsShwgLr2DLg>
 <xmx:wkrJZOIrTk7jKZ3HSZ-lq04o-CCI7Vof-nvlen9lvonEXh3d9XjAUw>
 <xmx:wkrJZJJ_UT8zIppLsGBPBlr-me3VcmAJRBZh2q8JqvF6vcuyjtQVTg>
 <xmx:w0rJZGG6JhQ-eQb5yhobYHEW_-QfcDE060EkfOsV3iZErC4X7f6J0Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AEFE9B60089; Tue,  1 Aug 2023 14:11:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-592-ga9d4a09b4b-fm-defalarms-20230725.001-ga9d4a09b
Mime-Version: 1.0
Message-Id: <117fa43e-6cef-4530-bb70-63c193f108f9@app.fastmail.com>
In-Reply-To: <ZMlIJNQtzb1SDIb/@smile.fi.intel.com>
References: <20230801033220.219869-1-wangzhu9@huawei.com>
 <ZMlIJNQtzb1SDIb/@smile.fi.intel.com>
Date: Tue, 01 Aug 2023 20:10:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Zhu Wang" <wangzhu9@huawei.com>
Subject: Re: [PATCH -next v2] drm/i2c: tda998x: remove redundant CONFIG_OF and
 of_match_ptr
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
Cc: dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 1, 2023, at 20:00, Andy Shevchenko wrote:
> On Tue, Aug 01, 2023 at 11:32:20AM +0800, Zhu Wang wrote:
>> The driver depends on CONFIG_OF, so it is not necessary to use CONFIG_OF
>> and of_match_ptr here, we remove them all.
>> 
>> Even for drivers that do not depend on CONFIG_OF, it's almost always
>> better to leave out the of_match_ptr(), since the only thing it can
>> possibly do is to save a few bytes of .text if a driver can be used both
>> with and without it.
>
> Instead, you may convert this driver to use device property APIs and make it
> OF-free (okay, almost, with one API that still would be called for OF, but not
> for the rest).

No, there is really no need for that. That can be done if anyone ever
needs this driver to again work with hardwired properties from another
device, or from ACPI, until then this would be a waste of time.

Removing of_match_ptr() on the other hand is useful since it is
a common source of bugs.

      Arnd
