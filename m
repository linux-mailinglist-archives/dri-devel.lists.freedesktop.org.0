Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF65F8809
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 00:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9F610E409;
	Sat,  8 Oct 2022 22:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EAC10E406
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 22:09:03 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-98-KtAFQuLTPeKLVd871cru4Q-1; Sat, 08 Oct 2022 23:08:05 +0100
X-MC-Unique: KtAFQuLTPeKLVd871cru4Q-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Sat, 8 Oct
 2022 23:08:03 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Sat, 8 Oct 2022 23:08:03 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
 <patches@lists.linux.dev>
Subject: RE: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Thread-Topic: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Thread-Index: AQHY2ncm2NigVNsUqkWyNH5TWnqFQK4FDn2g
Date: Sat, 8 Oct 2022 22:08:03 +0000
Message-ID: <01fafe0e56554b1c9c934c458b93473a@AcuMS.aculab.com>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-3-Jason@zx2c4.com>
In-Reply-To: <20221007180107.216067-3-Jason@zx2c4.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>,
 Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 KP Singh <kpsingh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Florian Westphal <fw@strlen.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gQS4gRG9uZW5mZWxkDQo+IFNlbnQ6IDA3IE9jdG9iZXIgMjAyMiAxOTowMQ0K
PiANCj4gUmF0aGVyIHRoYW4gaW5jdXJyaW5nIGEgZGl2aXNpb24gb3IgcmVxdWVzdGluZyB0b28g
bWFueSByYW5kb20gYnl0ZXMgZm9yDQo+IHRoZSBnaXZlbiByYW5nZSwgdXNlIHRoZSBwcmFuZG9t
X3UzMl9tYXgoKSBmdW5jdGlvbiwgd2hpY2ggb25seSB0YWtlcw0KPiB0aGUgbWluaW11bSByZXF1
aXJlZCBieXRlcyBmcm9tIHRoZSBSTkcgYW5kIGF2b2lkcyBkaXZpc2lvbnMuDQo+IA0KLi4uDQo+
IC0tLSBhL2xpYi9jbWRsaW5lX2t1bml0LmMNCj4gKysrIGIvbGliL2NtZGxpbmVfa3VuaXQuYw0K
PiBAQCAtNzYsNyArNzYsNyBAQCBzdGF0aWMgdm9pZCBjbWRsaW5lX3Rlc3RfbGVhZF9pbnQoc3Ry
dWN0IGt1bml0ICp0ZXN0KQ0KPiAgCQlpbnQgcmMgPSBjbWRsaW5lX3Rlc3RfdmFsdWVzW2ldOw0K
PiAgCQlpbnQgb2Zmc2V0Ow0KPiANCj4gLQkJc3ByaW50ZihpbiwgIiV1JXMiLCBwcmFuZG9tX3Uz
Ml9tYXgoMjU2KSwgc3RyKTsNCj4gKwkJc3ByaW50ZihpbiwgIiV1JXMiLCBnZXRfcmFuZG9tX2lu
dCgpICUgMjU2LCBzdHIpOw0KPiAgCQkvKiBPbmx5IGZpcnN0ICctJyBhZnRlciB0aGUgbnVtYmVy
IHdpbGwgYWR2YW5jZSB0aGUgcG9pbnRlciAqLw0KPiAgCQlvZmZzZXQgPSBzdHJsZW4oaW4pIC0g
c3RybGVuKHN0cikgKyAhIShyYyA9PSAyKTsNCj4gIAkJY21kbGluZV9kb19vbmVfdGVzdCh0ZXN0
LCBpbiwgcmMsIG9mZnNldCk7DQo+IEBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyB2b2lkIGNtZGxp
bmVfdGVzdF90YWlsX2ludChzdHJ1Y3Qga3VuaXQgKnRlc3QpDQo+ICAJCWludCByYyA9IHN0cmNt
cChzdHIsICIiKSA/IChzdHJjbXAoc3RyLCAiLSIpID8gMCA6IDEpIDogMTsNCj4gIAkJaW50IG9m
ZnNldDsNCj4gDQo+IC0JCXNwcmludGYoaW4sICIlcyV1Iiwgc3RyLCBwcmFuZG9tX3UzMl9tYXgo
MjU2KSk7DQo+ICsJCXNwcmludGYoaW4sICIlcyV1Iiwgc3RyLCBnZXRfcmFuZG9tX2ludCgpICUg
MjU2KTsNCj4gIAkJLyoNCj4gIAkJICogT25seSBmaXJzdCBhbmQgbGVhZGluZyAnLScgbm90IGZv
bGxvd2VkIGJ5IGludGVnZXINCj4gIAkJICogd2lsbCBhZHZhbmNlIHRoZSBwb2ludGVyLg0KDQpT
b21ldGhpbmcgaGFzIGdvbmUgYmFja3dhcmRzIGhlcmUuLi4uDQpBbmQgZ2V0X3JhbmRvbV91OCgp
IGxvb2tzIGEgYmV0dGVyIGZpdC4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBM
YWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBU
LCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

