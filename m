Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307FEC4051
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 20:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CCE6E883;
	Tue,  1 Oct 2019 18:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DB96E883
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 18:45:27 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DD95215EA;
 Tue,  1 Oct 2019 18:45:27 +0000 (UTC)
Date: Tue, 1 Oct 2019 14:45:26 -0400
From: Sasha Levin <sashal@kernel.org>
To: Wei Hu <weh@microsoft.com>
Subject: Re: [PATCH v5] video: hyperv: hyperv_fb: Support deferred IO for
 Hyper-V frame buffer driver
Message-ID: <20191001184526.GE8171@sasha-vm>
References: <20190913060209.3604-1-weh@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913060209.3604-1-weh@microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569955527;
 bh=tSA0eH9++rEulu7t4v7lBqNfCOSP45VX2fYHTJajmIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGwXl5KenUFK6V19PoWZFBUaizhy7wGsLSmuwo71F64a03cLn+s42VVQQxB3oM4VA
 xvWwn8ePcDfEv9LhI3Aghg+dlRq8CXruUwcqoTicuXQtSBTVo5AVacMZkg9tDQWCM2
 91TZgYTkyx2usfmibcp0aptevWtTjOCNyUA2LN48=
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
Cc: "info@metux.net" <info@metux.net>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "shc_work@mail.ru" <shc_work@mail.ru>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>,
 Michael Kelley <mikelley@microsoft.com>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDY6MDI6NTVBTSArMDAwMCwgV2VpIEh1IHdyb3RlOgo+
V2l0aG91dCBkZWZlcnJlZCBJTyBzdXBwb3J0LCBoeXBlcnZfZmIgZHJpdmVyIGluZm9ybXMgdGhl
IGhvc3QgdG8gcmVmcmVzaAo+dGhlIGVudGlyZSBndWVzdCBmcmFtZSBidWZmZXIgYXQgZml4ZWQg
cmF0ZSwgZS5nLiBhdCAyMEh6LCBubyBtYXR0ZXIgdGhlcmUKPmlzIHNjcmVlbiB1cGRhdGUgb3Ig
bm90LiBUaGlzIHBhdGNoIHN1cHBvcnRzIGRlZmVycmVkIElPIGZvciBzY3JlZW5zIGluCj5ncmFw
aGljcyBtb2RlIGFuZCBhbHNvIGVuYWJsZXMgdGhlIGZyYW1lIGJ1ZmZlciBvbi1kZW1hbmQgcmVm
cmVzaC4gVGhlCj5oaWdoZXN0IHJlZnJlc2ggcmF0ZSBpcyBzdGlsbCBzZXQgYXQgMjBIei4KPgo+
Q3VycmVudGx5IEh5cGVyLVYgb25seSB0YWtlcyBhIHBoeXNpY2FsIGFkZHJlc3MgZnJvbSBndWVz
dCBhcyB0aGUgc3RhcnRpbmcKPmFkZHJlc3Mgb2YgZnJhbWUgYnVmZmVyLiBUaGlzIGltcGxpZXMg
dGhlIGd1ZXN0IG11c3QgYWxsb2NhdGUgY29udGlndW91cwo+cGh5c2ljYWwgbWVtb3J5IGZvciBm
cmFtZSBidWZmZXIuIEluIGFkZGl0aW9uLCBIeXBlci1WIEdlbiAyIFZNcyBvbmx5Cj5hY2NlcHQg
YWRkcmVzcyBmcm9tIE1NSU8gcmVnaW9uIGFzIGZyYW1lIGJ1ZmZlciBhZGRyZXNzLiBEdWUgdG8g
dGhlc2UKPmxpbWl0YXRpb25zIG9uIEh5cGVyLVYgaG9zdCwgd2Uga2VlcCBhIHNoYWRvdyBjb3B5
IG9mIGZyYW1lIGJ1ZmZlcgo+aW4gdGhlIGd1ZXN0LiBUaGlzIG1lYW5zIG9uZSBtb3JlIGNvcHkg
b2YgdGhlIGRpcnR5IHJlY3RhbmdsZSBpbnNpZGUKPmd1ZXN0IHdoZW4gZG9pbmcgdGhlIG9uLWRl
bWFuZCByZWZyZXNoLiBUaGlzIGNhbiBiZSBvcHRpbWl6ZWQgaW4gdGhlCj5mdXR1cmUgd2l0aCBo
ZWxwIGZyb20gaG9zdC4gRm9yIG5vdyB0aGUgaG9zdCBwZXJmb3JtYW5jZSBnYWluIGZyb20gZGVm
ZXJyZWQKPklPIG91dHdlaWdocyB0aGUgc2hhZG93IGNvcHkgaW1wYWN0IGluIHRoZSBndWVzdC4K
Pgo+U2lnbmVkLW9mZi1ieTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4KCldoYXQgdHJlZSBp
cyB0aGlzIGJhc2VkIG9uPyBJIGNhbid0IGdldCBpdCB0byBhcHBseS4KCi0tClRoYW5rcywKU2Fz
aGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
