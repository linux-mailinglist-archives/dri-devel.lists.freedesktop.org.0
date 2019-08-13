Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E88AEE3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F616E041;
	Tue, 13 Aug 2019 05:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 967 seconds by postgrey-1.36 at gabe;
 Tue, 13 Aug 2019 05:40:35 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4A6E041;
 Tue, 13 Aug 2019 05:40:35 +0000 (UTC)
Received: from [192.168.178.60] ([109.104.47.130]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPGiR-1hevT50O45-00PbYR; Tue, 13 Aug 2019 07:23:46 +0200
Subject: Re: [PATCH v2 15/34] staging/vc04_services: convert put_page() to
 put_user_page*()
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
 <20190804224915.28669-16-jhubbard@nvidia.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <f92a9b35-072c-a452-3248-ded047a9ee7e@i2se.com>
Date: Tue, 13 Aug 2019 07:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190804224915.28669-16-jhubbard@nvidia.com>
Content-Language: en-US
X-Provags-ID: V03:K1:WLtnGHSdIdsSOgSCw9gLWN/He07a3vhG8P/jw9q/ZsKCLbsJUeS
 5llVNlt7KE/tvHn+5EOmDYYv4pX1cHVWKOXHtrw4HQWAHuCkTohFsgxlEY0fExapDm8vR8t
 zVIsUr/Bms6Kvxj5sCY8IbKiNL01LBum+j6x95pPZHXG9iG9KDUI7QIiVK2/58tc3NB1jnX
 y7VHJG/KIA+fGCfAbINIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6It6nEr622I=:4jmfBBNg8JeI+fVpUCP3CZ
 BI65IiHMrek8tR9A4b9XC/wpz/h+QAbr4W/xRR42HUM5kE4ZWjhHKQg4cP7V7aFyQ0r4BZk4z
 6OADogg0y2TUlQLKRSS2fxEQI9C/KbHShd7kgSgbUMIYi0UmHdrMKYvWBBMUGPTA7lHuVgMKf
 4sdPFphDkZ+Y6BAEqIJlSmHYLgGDn3LPMVKTc+JSa1VKf8Dzp3/vydG0qa3r+xOePLtomhF0i
 YvhVczDb0+9rnSyhX4qy7S8Q4nO2A4u3sCJy6MHenS3ymTB6UZQzlj4Ec9WrA/iQCHbwx6IrP
 5SvUEUjIRn4KZzJC/MmwUq927dVyjZ1v8R+hOz5eOy50kc0I5c2PhIsggEyt/oS2HaoPQ2xcy
 4D4DsiggNXktw1Fn3n2B4ZZrOzzVwiRO6WbBhN/nRnH+fDWWNZ0+3SLH+fYTPy3jvhbqXHKIL
 jP0b5p9CKyhk1bpOWGYggs/qi/uPx17vP92m4pApNBBpcovlQcO6lJafP63iUW+cHJOgH2ylQ
 3naCKyqIz0ECqeP3XTInK4NBcheCqQrqHLtvgF6zN/jd6+ymk0ux2u8qBdrmbOTTywW9XKVz8
 qeHB4Pu+7ZL52du7thyALEcDzhNwIDHxdMr+fvQ+QxV4ODmqN7G7bY9/Hg2tDQ1kVJEgr8hKi
 jKTorBFeVSQAZXdVyxrVYucdqnJZcZeUGNp4+0ZUdRjzFz0ZeX2pNELPiOy5vu7lWFXAqRBGP
 sQ9OTxp85NBaTUww0ACCmgKBAA6twPpOTDdrY25lhIEz0NBqehqiX1Tmk0ZOpqtoD9I+xg013
 rODwvDGgCpVqVFZ0TmfVwxI22nlZCMXkIDnIonvIIlS9+4m4tt8D51HIDqzVU2bB6mw5PhXVF
 ZXIMeoOIIaR1lEfzRFa/l53kN/oOHJbhMsk9Fd73ZDB68Z05Fc2HyBTCGbks2C9eaigUx2Rc/
 tlG+0PywSeiVO0hXkG5a1SZchISlNFmE=
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Suniel Mahesh <sunil.m@techveda.org>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Mihaela Muraru <mihaela.muraru21@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Kishore KP <kishore.p@techveda.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUuMDguMTkgMDA6NDgsIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+Cj4gRm9yIHBhZ2VzIHRoYXQgd2Vy
ZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMKPiB2
aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRpbmVzLCBpbnN0ZWFkIG9mIHZpYSBwdXRf
cGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+Cj4gVGhpcyBpcyBwYXJ0IGEgdHJlZS13aWRl
IGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMxZDhlN2NjYTJkCj4gKCJtbTog
aW50cm9kdWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCj4KPiBB
Y2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4K
Pgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBTdGVmYW4gV2FocmVu
IDxzdGVmYW4ud2FocmVuQGkyc2UuY29tPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBNaWhhZWxhIE11cmFydSA8bWloYWVsYS5tdXJh
cnUyMUBnbWFpbC5jb20+Cj4gQ2M6IFN1bmllbCBNYWhlc2ggPHN1bmlsLm1AdGVjaHZlZGEub3Jn
Pgo+IENjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KPiBDYzogU2lkb25nIFlh
bmcgPHJlYWx3YWtrYUBnbWFpbC5jb20+Cj4gQ2M6IEtpc2hvcmUgS1AgPGtpc2hvcmUucEB0ZWNo
dmVkYS5vcmc+Cj4gQ2M6IGxpbnV4LXJwaS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogZGV2ZWxAZHJpdmVy
ZGV2Lm9zdW9zbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+CkFja2VkLWJ5OiBTdGVmYW4gV2FocmVuIDxzdGVmYW4ud2FocmVuQGkyc2UuY29t
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
