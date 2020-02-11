Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7A158C02
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 10:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48C86E4B5;
	Tue, 11 Feb 2020 09:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 837156E491;
 Tue, 11 Feb 2020 09:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 577EE2A6048;
 Tue, 11 Feb 2020 10:41:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Y5c4P5LHANWr; Tue, 11 Feb 2020 10:41:50 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id E7C9F2A6046;
 Tue, 11 Feb 2020 10:41:49 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1j1S3A-000eJE-I2; Tue, 11 Feb 2020 10:41:48 +0100
Subject: Re: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
To: Nathan Chancellor <natechancellor@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
Date: Tue, 11 Feb 2020 10:41:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211061338.23666-1-natechancellor@gmail.com>
Content-Language: en-CA
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
Cc: clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMi0xMSA3OjEzIGEubS4sIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IEEgcmVj
ZW50IGNvbW1pdCBpbiBjbGFuZyBhZGRlZCAtV3RhdXRvbG9naWNhbC1jb21wYXJlIHRvIC1XYWxs
LCB3aGljaCBpcwo+IGVuYWJsZWQgZm9yIGk5MTUgc28gd2Ugc2VlIHRoZSBmb2xsb3dpbmcgd2Fy
bmluZzoKPiAKPiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZl
ci5jOjE0ODU6MjI6IHdhcm5pbmc6Cj4gcmVzdWx0IG9mIGNvbXBhcmlzb24gb2YgY29uc3RhbnQg
NTc2NDYwNzUyMzAzNDIzNDg3IHdpdGggZXhwcmVzc2lvbiBvZgo+IHR5cGUgJ3Vuc2lnbmVkIGlu
dCcgaXMgYWx3YXlzIGZhbHNlCj4gWy1XdGF1dG9sb2dpY2FsLWNvbnN0YW50LW91dC1vZi1yYW5n
ZS1jb21wYXJlXQo+ICAgICAgICAgaWYgKHVubGlrZWx5KHJlbWFpbiA+IE5fUkVMT0MoVUxPTkdf
TUFYKSkpCj4gICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+IAo+IFRoaXMgd2FybmluZyBvbmx5IGhhcHBlbnMgb24geDg2XzY0IGJ1dCB0aGF0IGNoZWNr
IGlzIHJlbGV2YW50IGZvcgo+IDMyLWJpdCB4ODYgc28gd2UgY2Fubm90IHJlbW92ZSBpdC4KClRo
YXQncyBzdXByaXNpbmcuIEFGQUlDVCBOX1JFTE9DKFVMT05HX01BWCkgd29ya3Mgb3V0IHRvIHRo
ZSBzYW1lIHZhbHVlCmluIGJvdGggY2FzZXMsIGFuZCByZW1haW4gaXMgYSAzMi1iaXQgdmFsdWUg
aW4gYm90aCBjYXNlcy4gSG93IGNhbiBpdCBiZQpsYXJnZXIgdGhhbiBOX1JFTE9DKFVMT05HX01B
WCkgb24gMzItYml0IChidXQgbm90IG9uIDY0LWJpdCk/CgoKLS0gCkVhcnRobGluZyBNaWNoZWwg
RMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20K
TGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2Eg
YW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
