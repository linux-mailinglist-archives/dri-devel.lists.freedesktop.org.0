Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2815CF1D43
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 19:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A1F6E402;
	Wed,  6 Nov 2019 18:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0650D6E271
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 18:13:49 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8358D2166E;
 Wed,  6 Nov 2019 18:13:49 +0000 (UTC)
Date: Wed, 6 Nov 2019 10:13:49 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm: Limit to INT_MAX in create_blob ioctl
Message-Id: <20191106101349.7dfaa4282db4c7a0239b96f2@linux-foundation.org>
In-Reply-To: <201911060920.71D7E76E@keescook>
References: <20191106164755.31478-1-daniel.vetter@ffwll.ch>
 <201911060920.71D7E76E@keescook>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573064029;
 bh=Ta1ybKjmi0q0KWQZNpGJKfbd9zOitUNAQZVj6Hxc294=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LdWzgySPOwqFPRp6S8W/AdVCXFeh0qivlwI4NKVsoiWM2TbBGXUlRJIR1GIYzWxcV
 8kGunXPENoww38XldDZxprZcnF4nPE2X9i01z4pWt3OC6eVVUwSZMkMMTI/J/WcgpN
 HMIBcYWinzHjE3tBtxfuy4b1RLfkAtoTZ3GaUzvw=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IDA5OjI0OjE4IC0wODAwIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPiB3cm90ZToKCj4gPiBTaW5jZSB0aGlzIGlzIC1tbSBjYW4gSSBoYXZlIGEgc3Rh
YmxlIHNoYTEgb3Igc29tZXRoaW5nIGZvcgo+ID4gcmVmZXJlbmNpbmc/IE9yIGRvIHlvdSB3YW50
IHRvIGluY2x1ZGUgdGhpcyBpbiB0aGUgLW1tIHBhdGNoIGJvbWIgZm9yCj4gPiB0aGUgbWVyZ2Ug
d2luZG93Pwo+IAo+IFRyYWRpdGlvbmFsbHkgdGhlc2UgdGhpbmdzIGxpdmUgaW4gYWtwbSdzIHRy
ZWUgd2hlbiB0aGV5IGFyZSBmaXhlcyBmb3IKPiBwYXRjaGVzIGluIHRoZXJlLiBJIGhhdmUgbm8g
aWRlYSBob3cgdGhlIEZpeGVzIHRhZ3Mgd29yayBpbiB0aGF0IGNhc2UsCj4gdGhvdWdoLi4uCgpJ
IHF1ZXVlZCBpdCBpbW1lZGlhdGVseSBhaGVhZCBvZgp1YWNjZXNzLWRpc2FsbG93LWludF9tYXgt
Y29weS1zaXplcy5wYXRjaCBzbyBhbGwgc2hvdWxkIGJlIGdvb2QsCnRoYW5rcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
