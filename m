Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5E2354B1
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 02:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90B6E03D;
	Sun,  2 Aug 2020 00:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBAC6E03D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 00:08:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2353A208B3
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 00:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596326938;
 bh=oCx/GR0RX1huNTjbv/4QOj0BuphlW+WSIv710+yID1o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=auSXa5Kl4kZmf41UMcsHVRiDTL85kbbPlpxVkVFQ7kWooytCoMrwGXLSHsoRDdwJv
 xF/3YFiTpEPCuGF/rFnjd68Phkka9RwUgLkY0C5OL8mSPZFJdulDE16Q4HL+mBKiQZ
 2aWsNLP3xq0tkonqfRAa1bYYq38KoR6z2FFtMzIc=
Received: by mail-ed1-f51.google.com with SMTP id bs17so6055208edb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 17:08:58 -0700 (PDT)
X-Gm-Message-State: AOAM533sEKEg5F3Ntm0moUgr0PEYRbGHh/X0MEzELNzQn2aC7lBiXk6Q
 iqb6ESTgJprH5RVhCz3QfPa987kjzdXIvrPmtg==
X-Google-Smtp-Source: ABdhPJw+2iH5+3kHHpb6k2cVa4JH26tuia/OYDRUWLfZx9UmtxOcJ2m2snfcRquwm1ycO+1YX3mUPz/vKyDmnugHutE=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr9749512edb.48.1596326936640; 
 Sat, 01 Aug 2020 17:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-3-frank-w@public-files.de>
In-Reply-To: <20200728111800.77641-3-frank-w@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Aug 2020 08:08:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
Message-ID: <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/mediatek: fix boot up for 720 and 480 but 1080
To: Frank Wunderlich <frank-w@public-files.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0N+aciDI45pelIOmAseS6jCDkuIvljYg3OjE55a+r6YGT77yaCj4KPiBGcm9tOiBj
aHVuaHVpIGRhaSA8Y2h1bmh1aS5kYWlAbWVkaWF0ZWsuY29tPgo+Cj4gLSBkaXNhYmxlIHRtZHMg
b24gcGh5IG9uIG10MjcwMQo+IC0gc3VwcG9ydCBvdGhlciByZXNvbHV0aW9ucyBsaWtlIDEyODB4
MTAyNAoKSWYgdGhpcyBwYXRjaCBkb2VzIHR3byB0aGluZ3MsIGl0IHNob3VsZCBiZSBicm9rZW4g
aW50byB0d28gcGF0Y2hlcy4KCj4KPiB3aXRob3V0IHRoaXMgUGF0Y2ggaSBzZWUgZmxpY2tlcmlu
ZyBvbiBteSBURlQgKDEyODB4MTAyNCksCj4gc28gaSBndWVzcyBjbG9jayBpcyB3cm9uZy4KPgo+
IFNpZ25lZC1vZmYtYnk6IGNodW5odWkgZGFpIDxjaHVuaHVpLmRhaUBtZWRpYXRlay5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+
Cj4gVGVzdGVkLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3BoeS5jICAgICAgICB8
IDMgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuaCAgICAgICAg
fCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYyB8
IDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaV9waHkuYwo+IGluZGV4IDUyMjM0OTg1MDJjNC4uZWRhZGI3YTcw
MGYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHku
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuYwo+IEBAIC0x
ODQsNiArMTg0LDkgQEAgc3RhdGljIGludCBtdGtfaGRtaV9waHlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocGh5X3By
b3ZpZGVyKTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgaWYgKGhkbWlfcGh5LT5jb25mLT5wbGxf
ZGVmYXVsdF9vZmYpCj4gKyAgICAgICAgICAgICAgIGhkbWlfcGh5LT5jb25mLT5oZG1pX3BoeV9k
aXNhYmxlX3RtZHMoaGRtaV9waHkpOwoKSSB0aGluayBldmVyeSBwbGwgaXMgZGVmYXVsdCBvZmYs
IHNvIHlvdSBzaG91bGQgdHVybiBvbiBwbGwgcmF0aGVyCnRoYW4gZGlzYWJsZSB0bWRzLgoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4gKwo+ICAgICAgICAgcmV0dXJuIG9mX2Nsa19hZGRfcHJvdmlk
ZXIoZGV2LT5vZl9ub2RlLCBvZl9jbGtfc3JjX3NpbXBsZV9nZXQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBoZG1pX3BoeS0+cGxsKTsKPiAgfQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmggYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiBpbmRleCAyZDhiMzE4MjQ3MGQuLmY0NzJmZGViNjNk
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiBAQCAtMjIs
NiArMjIsNyBAQCBzdHJ1Y3QgbXRrX2hkbWlfcGh5Owo+ICBzdHJ1Y3QgbXRrX2hkbWlfcGh5X2Nv
bmYgewo+ICAgICAgICAgYm9vbCB0el9kaXNhYmxlZDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3M7Cj4gKyAgICAgICBib29sIHBsbF9kZWZhdWx0X29mZjsKPiAgICAgICAgIGNvbnN0IHN0
cnVjdCBjbGtfb3BzICpoZG1pX3BoeV9jbGtfb3BzOwo+ICAgICAgICAgdm9pZCAoKmhkbWlfcGh5
X2VuYWJsZV90bWRzKShzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3BoeSk7Cj4gICAgICAgICB2
b2lkICgqaGRtaV9waHlfZGlzYWJsZV90bWRzKShzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3Bo
eSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hk
bWlfcGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1pX3BoeS5j
Cj4gaW5kZXggZDNjYzQwMjJlOTg4Li42ZmJlZGFjZmMxZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfbXQyNzAxX2hkbWlfcGh5LmMKPiBAQCAtMjM5LDYgKzIzOSw3
IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX3BoeV9kaXNhYmxlX3RtZHMoc3RydWN0IG10a19oZG1p
X3BoeSAqaGRtaV9waHkpCj4gIHN0cnVjdCBtdGtfaGRtaV9waHlfY29uZiBtdGtfaGRtaV9waHlf
MjcwMV9jb25mID0gewo+ICAgICAgICAgLnR6X2Rpc2FibGVkID0gdHJ1ZSwKPiAgICAgICAgIC5m
bGFncyA9IENMS19TRVRfUkFURV9HQVRFLAo+ICsgICAgICAgLnBsbF9kZWZhdWx0X29mZiA9IHRy
dWUsCj4gICAgICAgICAuaGRtaV9waHlfY2xrX29wcyA9ICZtdGtfaGRtaV9waHlfcGxsX29wcywK
PiAgICAgICAgIC5oZG1pX3BoeV9lbmFibGVfdG1kcyA9IG10a19oZG1pX3BoeV9lbmFibGVfdG1k
cywKPiAgICAgICAgIC5oZG1pX3BoeV9kaXNhYmxlX3RtZHMgPSBtdGtfaGRtaV9waHlfZGlzYWJs
ZV90bWRzLAo+IC0tCj4gMi4yNS4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
