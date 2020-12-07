Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F02D2633
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E602B6E9CB;
	Tue,  8 Dec 2020 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A4D6E854
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=hWgEFWxtA5vHvY/cTLZIg3kHkIKYysgYUsDBGEkeogk=; b=vs6tHrh4pKe3hJSYy5Xe3Ww+0a
 HSwtec2B3U9FmlLXWwJocucnGcLp9KhCe0sXThZ2CWB+W2FoPPL4jgPZ2mZKkPUlS6UPZoU9YHHUV
 Lxo1HVMefaxyzIxFMqts04Z90zwT6dVEuN+VrgXWyHz8+nZQS/9H1n8bosuAlYXFHIqmE/EQuKvCc
 uUgihOZi7rGoTtkXqjxaSfH6i0mITrt6pOIquJmISGSTv4e1y0nRLz5wGDKJPnUEJ7u7xk97DzV+w
 c0Yg1nBfBk2tk51ET0AK0RMkRMFDFsu/Zu56iVo7PFeTH2bYydYYq7qf2wqSUiFmyz0imHE2RQ+kC
 u65ItD1g==;
Received: from [2601:1c0:6280:3f0::1494]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJbj-00031f-GG; Mon, 07 Dec 2020 16:43:28 +0000
Subject: Re: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-3-sam@ravnborg.org>
 <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
 <dd81dd0e-9701-8332-63eb-2f159c535d02@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d144fe12-8f05-464e-3c1f-272999b39311@infradead.org>
Date: Mon, 7 Dec 2020 08:43:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dd81dd0e-9701-8332-63eb-2f159c535d02@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Qilong Zhang <zhangqilong3@huawei.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Douglas Anderson <dianders@chromium.org>,
 Gustavo A R Silva <gustavoars@kernel.org>, Tony Prisk <linux@prisktech.co.nz>,
 Andrzej Hajda <a.hajda@samsung.com>, Peter Jones <pjones@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNy8yMCAxMjoxNiBBTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkKPiAKPiBB
bSAwNi4xMi4yMCB1bSAyMDozNyBzY2hyaWViIFJhbmR5IER1bmxhcDoKPj4gT24gMTIvNi8yMCAx
MTowMiBBTSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+Pj4gRml4IGtlcm5lbC1kb2Mgd2FybmluZ3Mg
cmVwb3J0ZWQgd2hlbiB1c2luZyBXPTEKPj4+Cj4+PiB2MjoKPj4+IMKgwqAgLSBJbXByb3ZlIHN1
YmplY3QgKExlZSkKPj4+Cj4+PiB2MzoKPj4+IMKgwqAgLSBBZGQgUkVUVVJOUyBkb2N1bWVudGF0
aW9uIChUaG9tYXMpCj4+Cj4+IEhpIFNhbSwKPj4KPj4gWWVzLCBSRVRVUk5TOiB3aWxsIHdvcmsu
IEl0IGp1c3QgbG9va3MgbGlrZSBhbnkga2VybmVsLWRvYyBzZWN0aW9uIG5hbWUsCj4+IHN1Y2gg
YXMgQ29udGV4dDogb3IgTm90ZTouCj4+IEhvd2V2ZXIsIHRoZSBkb2N1bWVudGVkIGZvcm1hdCBm
b3IgcmV0dXJuIGluZm8gaXMgIlJldHVybjoiLgo+PiAoc2VlIERvY3VtZW50YXRpb24vZG9jLWd1
aWRlL2tlcm5lbC1kb2MucnN0KQo+IAo+IFRoYW5rcyBmb3IgdGhlIG5vdGUuIEkgYXNrZWQgZm9y
IFJFVFVSTlM6IGJlY2F1c2UgdGhlIHJlc3Qgb2YgdGhlIGZpbGUgYXBwZWFycyB0byBiZSB1c2lu
ZyBpdC4gUmV0dXJuczogaXMgY2VydGFpbmx5IHRoZSBiZXR0ZXIgYWx0ZXJuYXRpdmUuIEkgZGlk
bid0IGtub3cgdGhlcmUgd2FzIGEgZGlmZmVyZW5jZS4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9t
YXMKPiAKCkknbSBub3QgaW5zaXN0aW5nIG9uIHVzaW5nIFJldHVybjoKSXQgY2FuIHN0YXkgdGhl
IHNhbWUgYXMgdGhlIHJlc3Qgb2YgdGhlIGZpbGUgSU1PLgoKPj4KPj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4+IENjOiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgo+Pj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KPj4+IENjOiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPj4+IENjOiBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4+PiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4+IENjOiAiQWxleGFu
ZGVyIEEuIEtsaW1vdiIgPGdyYW5kbWFzdGVyQGFsMmtsaW1vdi5kZT4KPj4+IC0tLQo+Pj4gwqAg
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX25vdGlmeS5jIHwgMTAgKysrKysrKysrKwo+Pj4g
wqAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibW9uLmPCoMKgwqDCoCB8wqAgMiArLQo+Pj4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgoKLS0g
Cn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
