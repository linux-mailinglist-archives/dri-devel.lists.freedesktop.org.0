Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA96CDC11
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B918B6E471;
	Mon,  7 Oct 2019 07:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AD66E3E1;
 Sat,  5 Oct 2019 18:30:02 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9ef4]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGoob-00086Y-F8; Sat, 05 Oct 2019 18:30:01 +0000
Subject: Re: [PATCH] drm/amdkfd: add missing void argument to function
 kgd2kfd_init
To: Colin Ian King <colin.king@canonical.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20191005175808.32018-1-colin.king@canonical.com>
 <7677a8bc-cc5a-eb03-c7d4-b1a27330126f@infradead.org>
 <d9ae3586-f484-9734-1cc7-5e960fde76a3@canonical.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <43fae0fa-aa26-c713-ca64-627b58c6519b@infradead.org>
Date: Sat, 5 Oct 2019 11:30:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d9ae3586-f484-9734-1cc7-5e960fde76a3@canonical.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fgV0tic/m2eaYgm1jyj1dhCFsqYL5Ok8DtOhW/xIhw=; b=I/EFFs8tNcRNTTsh4FxjTYyqU
 9rK/La27+zAz+k0pn/W0fDccyNKZnMSCwifeFGutHV8k9SqZLz3/qEw3OD6QxNPV7F+QtpyQQTTqu
 wz4M8HwrLgQwofpqgq3Mcyzr5571Zr1KhNLq7ITtjbnaHYEGzVXb8G2SEQcgSpMNvIUdPaclF4UCl
 L2e25p8EVw8K9UDs20pWATHEi3nqarpH4ahUNWzlly2+iytBZQUsA6i4Z0KcvlMZVvZDeYD8bZOiC
 3R5yudalCyPgakpsmrsQF78TONjr5kIZXVJALtw4KBuLl8K8fkURfleFLHXNyIaRJTxyzUd13E9sT
 Zl4qVwEzA==;
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNS8xOSAxMToyMyBBTSwgQ29saW4gSWFuIEtpbmcgd3JvdGU6Cj4gT24gMDUvMTAvMjAx
OSAxOToxMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBPbiAxMC81LzE5IDEwOjU4IEFNLCBDb2xp
biBLaW5nIHdyb3RlOgo+Pj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KPj4+Cj4+PiBGdW5jdGlvbiBrZ2Qya2ZkX2luaXQgaXMgbWlzc2luZyBhIHZvaWQg
YXJndW1lbnQsIGFkZCBpdAo+Pj4gdG8gY2xlYW4gdXAgdGhlIG5vbi1BTlNJIGZ1bmN0aW9uIGRl
Y2xhcmF0aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5r
aW5nQGNhbm9uaWNhbC5jb20+Cj4+Cj4+IEFja2VkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4KPj4KPj4gc3BhcnNlIHJlcG9ydHMgMiBzdWNoIHdhcm5pbmdzIGluIGFt
ZGdwdToKPj4KPj4gLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9t
b2R1bGUuYzo4NToxODogd2FybmluZzogbm9uLUFOU0kgZnVuY3Rpb24gZGVjbGFyYXRpb24gb2Yg
ZnVuY3Rpb24gJ2tnZDJrZmRfaW5pdCcKPj4gLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmM6MTY4OjYwOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlv
biBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnYW1kZ3B1X2FtZGtmZF9nZnhfMTBfMF9nZXRfZnVu
Y3Rpb25zJwo+IAo+IExvb2tpbmcgYXQgbGludXgtbmV4dCwgdGhlIGFtZGdwdV9hbWRrZmRfZ2Z4
XzEwXzBfZ2V0X2Z1bmN0aW9ucygpIHdhcwo+IHJlbW92ZWQgaW4gY29tbWl0Ogo+IAo+IGNvbW1p
dCBlMzkyYzg4N2RmOTc5MTEyYWY5NGNmZWMwOGRkODdmNGRkNTVkMDg1Cj4gQXV0aG9yOiBZb25n
IFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPgo+IERhdGU6ICAgRnJpIFNlcCAyNyAyMjowMzo0MiAy
MDE5IC0wNDAwCj4gCj4gICAgIGRybS9hbWRrZmQ6IFVzZSBhcnJheSB0byBwcm9iZSBrZmQya2dk
X2NhbGxzCj4gCj4gLi5zbyBJIGRpZG4ndCBmaXggdGhhdCBvbmUgdXAKCmFoLiBUaGFua3MuCgot
LSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
