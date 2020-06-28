Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8220C712
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 10:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4C6895C8;
	Sun, 28 Jun 2020 08:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442E6895C8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 08:40:26 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89DDA207E8;
 Sun, 28 Jun 2020 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593333625;
 bh=sbpwUKMkAEYIjmKod52cizdsFab03jNLvQJZHLY8bFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FBnzurYQ+gwV1a0CtnAvSAd1iAikjfnWyUUJ0hvrWCAgNm96qxD1598Yt8hvhZAFZ
 u5sSHiPU2BkPONdZrVaPiKeQiydNBb8vJfQMkX15xVC7xZ9KzOEc7vx7DPT4VrQ+/B
 hZf8iQY9mkzGUuy8vASkq789PDjKLtFDkdRdomA0=
Date: Sun, 28 Jun 2020 10:40:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 0/7] Convert the remaining text files to ReST
Message-ID: <20200628104011.7f7e8814@coco.lan>
In-Reply-To: <20200626113459.413c3843@lwn.net>
References: <cover.1592918949.git.mchehab+huawei@kernel.org>
 <20200626113459.413c3843@lwn.net>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Kitt <steve@sk2.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pragat Pandya <pragat.pandya@gmail.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Harry Wei <harryxiyou@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Joel
 Fernandes \(Google\)" <joel@joelfernandes.org>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jason Gunthorpe <jgg@ziepe.ca>,
 Phong Tran <tranmanphong@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>,
 Harald Seiler <hws@denx.de>,
 Ricardo =?UTF-8?B?Q2HDsXVlbG8=?= <ricardo.canuelo@collabora.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Rob Herring <robh+dt@kernel.org>, Nitin Gupta <nigupta@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@linux.ibm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-mm@kvack.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Patrick Bellasi <patrick.bellasi@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gRnJpLCAyNiBKdW4gMjAyMCAxMTozNDo1OSAtMDYwMApKb25hdGhhbiBDb3JiZXQgPGNvcmJl
dEBsd24ubmV0PiBlc2NyZXZldToKCj4gT24gVHVlLCAyMyBKdW4gMjAyMCAxNTozMTozMyArMDIw
MAo+IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gCj4gPiBUaGUgbWFpbiBnb2FsIG9mIHRoaXMgc2VyaWVzIGlzIHRvIGZpbmlzaCB0aGUg
UmVTVCBjb252ZXJzaW9uLiBBZnRlciB0aGlzCj4gPiBzZXJpZXMsIHdlIGhhdmUganVzdCB0aG9z
ZSBmaWxlcyBzdGlsbCBpbiBwbGFpbiBvbGQgZm9ybWF0Ogo+ID4gCj4gPiAJLSBEb2N1bWVudGF0
aW9uL1JDVS9SVEZQLnR4dAo+ID4gCS0gRG9jdW1lbnRhdGlvbi9hdG9taWNfYml0b3BzLnR4dAo+
ID4gCS0gRG9jdW1lbnRhdGlvbi9tZW1vcnktYmFycmllcnMudHh0Cj4gPiAJLSBEb2N1bWVudGF0
aW9uL2F0b21pY190LnR4dAo+ID4gCS0gRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9kYXgudHh0
Cj4gPiAJLSBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3BhdGgtbG9va3VwLnR4dAo+ID4gCS0g
RG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9kZXZpY2VzL1JFQURNRSAgCj4gCj4gT0ssIEkndmUgYXBw
bGllZCB0aGlzIHNldCAtIGdsYWQgdG8gc2VlIHRoZSBsYXN0IG9uZSEKClllYWghIHdlIGNhbiBu
b3cgZm9jdXMgb24ga2VlcGluZyBpdCB1cGRhdGVkIGFuZCByZS1vcmdhbml6aW5nCnRoaW5ncywg
Zm9yIHRoZSBkb2NzIHRvIGxvb2sgbW9yZSBsaWtlIGEgcmVhbCBib29rLgoKPiBTdGlsbCAqbm90
KiBnbGFkIHRvIHNlZSB0aGUgTGFUZVggbWFya3VwIGluIHRoZSBzdGFnaW5nIHN0dWZmOyBob3Bl
ZnVsbHkKPiB3ZSBjYW4gZG8gc29tZXRoaW5nIGFib3V0IHRoYXQgc29vbi4KCkFncmVlZC4KClRo
ZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCwgdXNpbmcgdGhlIG5vcm1hbCBzaXplZCBtb25vc3BhY2Vk
IGZvbnQsIHRoZSBtYXhpbXVtCmxpbmUgd2lkdGggd2lsbCBiZSA2NyBjb2x1bW5zWzFdLiBUaGUg
d2F5IFNwaGlueCBkZWFscyB3aXRoIG1vbm8tc3BhY2VkCnRleHRzIGlzIHRoYXQgaXQgZG9lc24n
dCBhbGxvdyBMYVRlWCB0byBzcGxpdCBsaW5lcy4gU28sIFNwaGlueCBzZXRzIExhVGVYIHRvCnRy
dW5jYXRlIGxvbmcgbGluZXMsIGZvcmNpbmcgaXQgdG8gaG9ub3IgdGhlIGxpbmUgYnJlYWtzIGdl
bmVyYXRlZCBieSBTcGhpbnguCgpBdCBsZWFzdCBuZXdlciB2ZXJzaW9ucyBvZiBTcGhpbnggaGF2
ZSBhbiBvcHRpbWl6YXRpb24gdGhlIExhVGVYIG91dHB1dApjb2RlOiBvbiBzb21lIGNhc2VzIFNw
aGlueCBkZXRlY3QgbG9uZyBsaW5lcyBhbmQgYWRkcyBhbiBhcnRpZmljaWFsIGxpbmUKYnJlYWss
IHByZWNlZGVkIGJ5IGEgbWFya3VwIHRvIGluZGljYXRlIHRoYXQgdGhlIHRleHQgd291bGQgYmUg
b3RoZXJ3aXNlCnRydW5jYXRlZCBhdCB0aGUgTGFUZVggb3V0cHV0LiBZZXQsIGlmIGl0IGlzIGEg
c2luZ2xlIGxvbmcgd29yZCwgaXQgd2lsbApqdXN0IGxldCBpdCBnbyBwYXN0IHRoZSBtYXJnaW5z
IGFuZCBiZSB0cnVuY2F0ZWQuCgpGb3IgdGhlIGZpbGVzIHVuZGVyIHN0YWdpbmcsIHVzaW5nIHRo
aXMgb3B0aW1pemF0aW9uIHdpbGwgbG9vayByZWFsbHkgCndlaXJkLCBhcyB0aGUgdGV4dCBvdXRw
dXQgd291bGQgYmUgKHdpdGggdGhlIGVuY2xvc2VkIHBhdGgsIG1lYW50IHRvCnNob3cgdGhlIHNv
ZnQgYW5kIGhhcmQgbGluZSBzaXplIGxpbWl0cylbMl06CgoKCSIgICAgICAgICAxICAgICAgICAg
MiAgICAgICAgIDMgICAgICAgICA0ICAgICAgICAgNSAgICAgICAgIDYgICAgICAg4pCjCgkg4oaS
ICAgNyAgICAgICAgIDgKCSAxMjM0NTY3ODkwMTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkw
MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTIzNDU2Nzg5MAoJIOKGknRleHQgaGVyZQoK
CSBPbiBhdG9taWMgdHlwZXMgKGF0b21pY190IGF0b21pYzY0X3QgYW5kIGF0b21pY19sb25nX3Qp
LgoKCSBUaGUgYXRvbWljIHR5cGUgcHJvdmlkZXMgYW4gaW50ZXJmYWNlIHRvIHRoZSBhcmNoaXRl
Y3R1cmUncyBtZWFuc+KQowoJIOKGkiBvZiBhdG9taWMKCSBSTVcgb3BlcmF0aW9ucyBiZXR3ZWVu
IENQVXMgKGF0b21pYyBvcGVyYXRpb25zIG9uIE1NSU8gYXJlIG5vdOKQowoJIOKGkiBzdXBwb3J0
ZWQgYW5kCgkgY2FuIGxlYWQgdG8gZmF0YWwgdHJhcHMgb24gc29tZSBwbGF0Zm9ybXMpLiIKCldo
YXQgdGhlIExhVGVYIHJhdyBtYWNybyBkb2VzIGlzIHRvIHVzZSBhIHNtYWxsZXIgZm9udCB0aGF0
IHdpbGwgYWxsb3cgCmFuIDgwLWNvbHVtbnMgdGV4dCB0byBmaXQgd2l0aG91dCB0aG9zZSBhcnRp
ZmljaWFsIGJyZWFrcy4gSSBoYWQgdG8KbWFudWFsbHkgY2hlY2sgd2hhdCBmb250IHNpemUgd291
bGQgd29yaywgYW5kIHRoaXMgbWlnaHQgcmVxdWlyZSAKZnV0dXJlIGNoYW5nZXMsIGlmIFNwaGlu
eCBjaGFuZ2VzIHRoZSBkZWZhdWx0IG1vbm8tc3BhY2VkIGZvbnQgb3IKaXRzIGRlZmF1bHQgc2l6
ZS4KCkZvciB0aGUgZG9jdW1lbnRzIG9uIHN0YWdpbmcsIHRoZSBzb2x1dGlvbiBpcyByZWFsbHkg
c2ltcGxlIGZyb20KdGVjaG5pY2FsIHN0YW5kcG9pbnQ6IGp1c3QgY29udmVydCB0aGVtIHRvIFJl
U1QuIFRoaXMgd291bGQgYWxsb3cgClNwaGlueCB0byB1c2UgYSBwcm9wb3J0aW9uYWwgc3BhY2Vk
IGZvbnQgbW9zdCBvZiB0aGUgdGltZSwgd2hpY2gKcGFzc2VzIHRleHRzIGluIHBhcmFncmFwaHMg
dG8gTGFUZVguIFRoaXMgd2F5LCB0aGUgbGluZSBicmVha3MgCndpbGwgYmUgYXQgdGhlIHJpZ2h0
IHBsYWNlcy4KCkkgcmVtZW1iZXIgSSB0cmllZCBkb2luZyBpdCBhIGZldyB0aW1lcywgYnV0IHRo
ZXJlIHdlcmUgc3Ryb25nIApyZXNpc3RhbmNlLgoKSXQgY291bGQgYmUgcG9zc2libGUgdG8gZG8g
c29tZSB0cmlja3MgYXQgdGhlIGNvbmYucHkgdG8gY2hhbmdlCnNvbWUgZGVmYXVsdHMsIGJ1dCBh
bnlvbmUgd2lsbGluZyB0byBkbyB0aGF0IHdpbGwgYWxzbyBuZWVkIHRvIAp0ZXN0IHRoZSBQREYg
b3V0cHV0IHdpdGggYWxsIHN1cHBvcnRlZCBTcGhpbnggdmVyc2lvbnMsCmFzIHRoZSBMYVRlWCBv
dXRwdXQgbWFjcm9zIGlzIG5vdCBhbiBzdGFibGUgQVBJOiB3ZSBoYWQgdG8gYWRkCnNldmVyYWwg
dmVyc2lvbi1kZXBlbmRlbnQgc3R1ZmYgdGhlcmUsIGFuZCBldmVuIHJlbW92ZSBzb21lCmZlYXR1
cmVzIChsaWtlIC9yZXNpemVib3ggZm9yIHRhYmxlcyB3aXRoIG1hbnkgY29sdW1ucyksIGFzCm1h
aW50YWluaW5nIGl0IHdhcyBzcGVuZGluZyB0b28gbXVjaCB0aW1lIGFuZCBlZmZvcnRzLgoKLQoK
WzFdIElmIHlvdSB3YW50IHRvIGNoZWNrLCB0cnkgYnVpbGRpbmcgd2l0aCB0aGUgZW5jbG9zZWQg
cGF0Y2guCgpbMl0gVGhlIG91dHB1dCBvZiB0aGUgc2Vjb25kIGxpbmUgZnJvbSB0aGUgZmlsZSBz
aG93cyBzb21lIGFydGlmYWN0cwogICAgaW50cm9kdWNlZDogCgogICAgLSB0aGUgd29yZCAic29t
ZSIgZGlzYXBwZWFyZWQsIGFzIGl0IHdhcyB0cnVuY2F0ZWQgYXQgdGhlIG91dHB1dDsKICAgIC0g
dGhlIGxhc3QgIjAiIHdhcyBoYWxmLXRydW5jYXRlZDsKICAgIC0gdGhlIHN5bWJvbCBpbmRpY2F0
aW5nIHRoYXQgYSBjb25kaXRpb25hbCBsaW5lIHdvdWxkIGV4aXN0CiAgICAgICgi4pCjIikgd2Fz
IGFsc28gdHJ1bmNhdGVkLgoKClRoYW5rcywKTWF1cm8KCi0KCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2F0b21pY190LnR4dCBiL0RvY3VtZW50YXRpb24vYXRvbWljX3QudHh0CmluZGV4IDBm
MWZkZWRmMzZiYi4uOTQ4OGMzNWVjNjA4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2F0b21p
Y190LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2F0b21pY190LnR4dApAQCAtMSwzICsxLDUgQEAK
KyAgICAgICAgIDEgICAgICAgICAyICAgICAgICAgMyAgICAgICAgIDQgICAgICAgICA1ICAgICAg
ICAgNiAgICAgICAgIDcgICAgICAgICA4CisxMjM0NTY3ODkwMTIzNDU2Nzg5MDEyMzQ1Njc4OTAx
MjM0NTY3ODkwMTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTIzNDU2Nzg5MHNvbWUgdGV4
dCBoZXJlCiAKIE9uIGF0b21pYyB0eXBlcyAoYXRvbWljX3QgYXRvbWljNjRfdCBhbmQgYXRvbWlj
X2xvbmdfdCkuCiAKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc3RhZ2luZy9pbmRleC5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3N0YWdpbmcvaW5kZXgucnN0CmluZGV4IDE4NGU2YWVjZTBhNy4uMGMz
YWNmMjdlMWZmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3N0YWdpbmcvaW5kZXgucnN0Cisr
KyBiL0RvY3VtZW50YXRpb24vc3RhZ2luZy9pbmRleC5yc3QKQEAgLTE5LDE3ICsxOSw5IEBAIFVu
c29ydGVkIERvY3VtZW50YXRpb24KIEF0b21pYyBUeXBlcwogPT09PT09PT09PT09CiAKLS4uIHJh
dzo6IGxhdGV4Ci0KLSAgICBcZm9vdG5vdGVzaXplCi0KIC4uIGluY2x1ZGU6OiAuLi9hdG9taWNf
dC50eHQKICAgIDpsaXRlcmFsOgogCi0uLiByYXc6OiBsYXRleAotCi0gICAgXG5vcm1hbHNpemUK
LQogQXRvbWljIGJpdG9wcwogPT09PT09PT09PT09PQogCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
