Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F666612C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 23:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EAD6E291;
	Thu, 11 Jul 2019 21:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC116E291
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 21:30:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 9B36014CFC090;
 Thu, 11 Jul 2019 14:30:53 -0700 (PDT)
Date: Thu, 11 Jul 2019 14:30:52 -0700 (PDT)
Message-Id: <20190711.143052.1773408891723438773.davem@davemloft.net>
To: joe@perches.com
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: David Miller <davem@davemloft.net>
In-Reply-To: <cover.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 11 Jul 2019 14:30:54 -0700 (PDT)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devel@driverdev.osuosl.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, benjaminfair@google.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, venture@google.com,
 openbmc@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yuenn@google.com, linux-mmc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, akpm@linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KRGF0ZTogVHVlLCAgOSBKdWwgMjAx
OSAyMjowNDoxMyAtMDcwMAoKPiBUaGVzZSBHRU5NQVNLIHVzZXMgYXJlIGludmVydGVkIGFyZ3Vt
ZW50IG9yZGVyIGFuZCB0aGUKPiBhY3R1YWwgbWFza3MgcHJvZHVjZWQgYXJlIGluY29ycmVjdC4g
IEZpeCB0aGVtLgo+IAo+IEFkZCBjaGVja3BhdGNoIHRlc3RzIHRvIGhlbHAgYXZvaWQgbW9yZSBt
aXN1c2VzIHRvby4KClBhdGNoZXMgIzcgYW5kICM4IGFwcGxpZWQgdG8gJ25ldCcsIHdpdGggYXBw
cm9wcmlhdGUgRml4ZXMgdGFncwphZGRlZCB0byAjOC4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
