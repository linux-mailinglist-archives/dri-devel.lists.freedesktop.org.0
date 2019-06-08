Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E2839A8B
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934A189209;
	Sat,  8 Jun 2019 03:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7872D8920A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:56:26 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id p1so1543369plo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sg8hZnfRQyshVayh9AfBUaCUwYP0fG+PoifVRoQ1/2U=;
 b=GLqw+4VbDlTKWfUeJhGTc/P1bbkC9vXSOF8o+a2LlUBfdW5j9P3XzchUXLqRX+MWFj
 K3XlckW4Thg7GNmJLjLXoat+xs+joco68L97+BmOSiLkz7GyHQfkBVLSn4SuagOIMbDo
 8MyxWbYnGpJir7u8AZqthu3fGgMh+B/smD17ejSwvjCUNfGSbSsRg2lecJypxiTHfLy8
 ntkdbR87gd9PVr10QcPsU3fVgKJ4fqlNaa8tyiDIUZeeKzPQPyU2qD/kPsmd+8uaqTyZ
 P7c1eHzqktT3SgC4KjsuoDeu97LSXwtEKzTUMWzBBiPM32bCi6s0WeVZqkBO0rEN/3Ho
 AlHg==
X-Gm-Message-State: APjAAAWds9lKOJOvXCifAX+XEsRj45U4tHukkUdGALJewCNgDKnu6yxX
 Pi8NymSscrIWRjQwqRrPZqzxWQ==
X-Google-Smtp-Source: APXvYqxOa+LbIfSKzO98kP7ZimZglTjC5TFvL11aIkaQBz55ZFGw6dQUA6lPd2PVhnyZkGPHF3XY8g==
X-Received: by 2002:a17:902:6948:: with SMTP id
 k8mr59073078plt.81.1559966186036; 
 Fri, 07 Jun 2019 20:56:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c6sm6781898pfm.163.2019.06.07.20.56.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:56:25 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:56:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 16/16] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
Message-ID: <201906072055.7DFED7B@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sg8hZnfRQyshVayh9AfBUaCUwYP0fG+PoifVRoQ1/2U=;
 b=dA3axcy3OSjQBllR3jO2rSL28yV4HEUJp/aPnDeszFXA+QJykqsQIUJ72CJFJfYEfw
 wdg907Km6KiqXC2789/OeRpcFlLBSZiEqKz1cQEJwy/XIHhLz8qR/HqqVrGp+0QeTjJc
 WftaB+rnktSZBXZ74MuozosAkMHfiOKMwo6jY=
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MThQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIGEgc2ltcGxlIHRl
c3QsIHRoYXQgY2FsbHMgdGhlIHVuYW1lIHN5c2NhbGwgd2l0aCBhCj4gdGFnZ2VkIHVzZXIgcG9p
bnRlciBhcyBhbiBhcmd1bWVudC4gV2l0aG91dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQK
PiB1c2VyIHBvaW50ZXJzIHRoZSB0ZXN0IGZhaWxzIHdpdGggRUZBVUxULgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KCkknbSBhZGRp
bmcgU2h1YWggdG8gQ0MgaW4gY2FzZSBzaGUgaGFzIHNvbWUgc3VnZ2VzdGlvbnMgYWJvdXQgdGhl
IG5ldwpzZWxmdGVzdC4KClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KCi1LZWVzCgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0
aWdub3JlICAgICAgfCAgMSArCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2Vm
aWxlICAgICAgICB8IDIyICsrKysrKysrKysKPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0
L3J1bl90YWdzX3Rlc3Quc2ggIHwgMTIgKysrKysrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2FybTY0L3RhZ3NfbGliLmMgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysKPiAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgICAgIHwgMTggKysrKysrKysKPiAg
NSBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZQo+ICBjcmVhdGUgbW9k
ZSAxMDA3NTUgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaAo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc19s
aWIuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQv
dGFnc190ZXN0LmMKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJt
NjQvLmdpdGlnbm9yZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0Ly5naXRpZ25vcmUK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZThmYWU4ZDYxZWQ2
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0Ly5n
aXRpZ25vcmUKPiBAQCAtMCwwICsxIEBACj4gK3RhZ3NfdGVzdAo+IGRpZmYgLS1naXQgYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2FybTY0L01ha2VmaWxlCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjlkZWUxODcyNzkyMwo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZQo+IEBAIC0wLDAgKzEsMjIgQEAKPiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsKPiAraW5jbHVkZSAuLi9saWIubWsKPiArCj4g
KyMgQVJDSCBjYW4gYmUgb3ZlcnJpZGRlbiBieSB0aGUgdXNlciBmb3IgY3Jvc3MgY29tcGlsaW5n
Cj4gK0FSQ0ggPz0gJChzaGVsbCB1bmFtZSAtbSAyPi9kZXYvbnVsbCB8fCBlY2hvIG5vdCkKPiAr
Cj4gK2lmbmVxICgsJChmaWx0ZXIgJChBUkNIKSxhYXJjaDY0IGFybTY0KSkKPiArCj4gK1RFU1Rf
Q1VTVE9NX1BST0dTIDo9ICQoT1VUUFVUKS90YWdzX3Rlc3QKPiArCj4gKyQoT1VUUFVUKS90YWdz
X3Rlc3Q6IHRhZ3NfdGVzdC5jICQoT1VUUFVUKS90YWdzX2xpYi5zbwo+ICsJJChDQykgLW8gJEAg
JChDRkxBR1MpICQoTERGTEFHUykgJDwKPiArCj4gKyQoT1VUUFVUKS90YWdzX2xpYi5zbzogdGFn
c19saWIuYwo+ICsJJChDQykgLW8gJEAgLXNoYXJlZCAkKENGTEFHUykgJChMREZMQUdTKSAkXgo+
ICsKPiArVEVTVF9QUk9HUyA6PSBydW5fdGFnc190ZXN0LnNoCj4gKwo+ICthbGw6ICQoVEVTVF9D
VVNUT01fUFJPR1MpCj4gKwo+ICtlbmRpZgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
YXJtNjQvcnVuX3RhZ3NfdGVzdC5zaAo+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4gaW5kZXggMDAw
MDAwMDAwMDAwLi4yYmJlMGNkNDIyMGIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaAo+IEBAIC0wLDAgKzEsMTIgQEAK
PiArIyEvYmluL3NoCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArCj4g
K2VjaG8gIi0tLS0tLS0tLS0tLS0tLS0tLS0tIgo+ICtlY2hvICJydW5uaW5nIHRhZ3MgdGVzdCIK
PiArZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLS0iCj4gK0xEX1BSRUxPQUQ9Li90YWdzX2xpYi5z
byAuL3RhZ3NfdGVzdAo+ICtpZiBbICQ/IC1uZSAwIF07IHRoZW4KPiArCWVjaG8gIltGQUlMXSIK
PiArZWxzZQo+ICsJZWNobyAiW1BBU1NdIgo+ICtmaQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX2xpYi5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
YXJtNjQvdGFnc19saWIuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MDAwLi44YTY3NDUwOTIxNmUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYXJtNjQvdGFnc19saWIuYwo+IEBAIC0wLDAgKzEsNDIgQEAKPiArI2luY2x1ZGUg
PHN0ZGxpYi5oPgo+ICsKPiArI2RlZmluZSBUQUdfU0hJRlQJKDU2KQo+ICsjZGVmaW5lIFRBR19N
QVNLCSgweGZmVUwgPDwgVEFHX1NISUZUKQo+ICsKPiArdm9pZCAqX19saWJjX21hbGxvYyhzaXpl
X3Qgc2l6ZSk7Cj4gK3ZvaWQgX19saWJjX2ZyZWUodm9pZCAqcHRyKTsKPiArdm9pZCAqX19saWJj
X3JlYWxsb2Modm9pZCAqcHRyLCBzaXplX3Qgc2l6ZSk7Cj4gK3ZvaWQgKl9fbGliY19jYWxsb2Mo
c2l6ZV90IG5tZW1iLCBzaXplX3Qgc2l6ZSk7Cj4gKwo+ICtzdGF0aWMgdm9pZCAqdGFnX3B0cih2
b2lkICpwdHIpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgdGFnID0gcmFuZCgpICYgMHhmZjsKPiAr
CWlmICghcHRyKQo+ICsJCXJldHVybiBwdHI7Cj4gKwlyZXR1cm4gKHZvaWQgKikoKHVuc2lnbmVk
IGxvbmcpcHRyIHwgKHRhZyA8PCBUQUdfU0hJRlQpKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQg
KnVudGFnX3B0cih2b2lkICpwdHIpCj4gK3sKPiArCXJldHVybiAodm9pZCAqKSgodW5zaWduZWQg
bG9uZylwdHIgJiB+VEFHX01BU0spOwo+ICt9Cj4gKwo+ICt2b2lkICptYWxsb2Moc2l6ZV90IHNp
emUpCj4gK3sKPiArCXJldHVybiB0YWdfcHRyKF9fbGliY19tYWxsb2Moc2l6ZSkpOwo+ICt9Cj4g
Kwo+ICt2b2lkIGZyZWUodm9pZCAqcHRyKQo+ICt7Cj4gKwlfX2xpYmNfZnJlZSh1bnRhZ19wdHIo
cHRyKSk7Cj4gK30KPiArCj4gK3ZvaWQgKnJlYWxsb2Modm9pZCAqcHRyLCBzaXplX3Qgc2l6ZSkK
PiArewo+ICsJcmV0dXJuIHRhZ19wdHIoX19saWJjX3JlYWxsb2ModW50YWdfcHRyKHB0ciksIHNp
emUpKTsKPiArfQo+ICsKPiArdm9pZCAqY2FsbG9jKHNpemVfdCBubWVtYiwgc2l6ZV90IHNpemUp
Cj4gK3sKPiArCXJldHVybiB0YWdfcHRyKF9fbGliY19jYWxsb2Mobm1lbWIsIHNpemUpKTsKPiAr
fQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3Qu
YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI2M2IzMDI4NzRlZAo+IC0tLSAvZGV2
L251bGwKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3QuYwo+
IEBAIC0wLDAgKzEsMTggQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAK
PiArCj4gKyNpbmNsdWRlIDxzdGRpby5oPgo+ICsjaW5jbHVkZSA8c3RkbGliLmg+Cj4gKyNpbmNs
dWRlIDx1bmlzdGQuaD4KPiArI2luY2x1ZGUgPHN0ZGludC5oPgo+ICsjaW5jbHVkZSA8c3lzL3V0
c25hbWUuaD4KPiArCj4gK2ludCBtYWluKHZvaWQpCj4gK3sKPiArCXN0cnVjdCB1dHNuYW1lICpw
dHI7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCXB0ciA9IChzdHJ1Y3QgdXRzbmFtZSAqKW1hbGxvYyhz
aXplb2YoKnB0cikpOwo+ICsJZXJyID0gdW5hbWUocHRyKTsKPiArCWZyZWUocHRyKTsKPiArCXJl
dHVybiBlcnI7Cj4gK30KPiAtLSAKPiAyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCj4g
CgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
