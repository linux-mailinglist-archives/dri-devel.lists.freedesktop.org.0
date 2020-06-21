Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E420302C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F29A6E578;
	Mon, 22 Jun 2020 07:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0B96E40A
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 04:00:26 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id g139so6948378lfd.10
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JltmKVlnuo/vC27A3oTu5+r3QU8IRKlE54WmVpTd+6k=;
 b=s8LYsDYdjxem9SLD1lfB4S3L0wgiHScLHWSjUkMidXktbmXmoFoTDBs1IbY2RwA2F1
 EXug365lNfpf1c5EIkE19nWURBfp1SgHgRH1JFN1Y73oUrRxuyh3mU1EYkLaX1ivi8bq
 UmiKqb7y0GNzxSjVlDxQiNIe0bJDKEUNZ35GUG6kdqE8kpW7gGT86lBkEgHc1ctOXksG
 mWPblnYPDRqHCY8twJXwNrXzYVqGeCSxNOFjQ44nD5tzTN/b1DWhf9g3x2Ck0oI78twV
 JgTgWEfLztztE4ybodOqRtpugw1CA0r/7k5o8A4kXuiMuFEbV34XN4QHJrAWORLAzTqH
 wMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JltmKVlnuo/vC27A3oTu5+r3QU8IRKlE54WmVpTd+6k=;
 b=sXbXe/hDibwN8yrqhl9UkpU0EbMQvP5TyRZdJFij5p0UrJcBoIGPeVNOWOnNKR1Dkm
 XSzBJ0uIfAGOAL8Sf/deou2EvG8Wixfgtn4YDC29SAHbpP2iogmXZVfT420o30ns2UVO
 LyaktAEJPV1GWlpMH9upxSvYge6OlzrPbMPmjRaxspJbtuUndMVtJyhCI4Tp3iyA4yoZ
 NwRi+3K5XZHLwSd/hEDwSXFjiKDutElVBCZiPaIoj5MrTDmrWUUpxyZ4Xn4XkZ2kM7MM
 zD9E0/kEtgvVu6SJRQu+WOf2zq9eqr6Pqrwaju8DhwanUFrAEdTGf/ydW7oauaJGm9Xf
 7QRA==
X-Gm-Message-State: AOAM530/3/gT9SEZo+tUmlXi1ZWlw1ogAEjtWbGryTr7dnV4n4Zl2F3a
 iGL3k7kG5UmKPoYd0dEc3Z0=
X-Google-Smtp-Source: ABdhPJwGO/7Iq+BmdzJ4PpOIxZuoSlejYAADJkdbMtQDjpHquFlMxJiDBs2BDDHDfF88d7fV7xZ03Q==
X-Received: by 2002:ac2:44cd:: with SMTP id d13mr5970328lfm.13.1592712024386; 
 Sat, 20 Jun 2020 21:00:24 -0700 (PDT)
Received: from dimatab (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id b25sm1977654ljo.16.2020.06.20.21.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 21:00:24 -0700 (PDT)
Date: Sun, 21 Jun 2020 07:00:15 +0300
From: Dmitry Osipenko <digetx@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v7 31/36] staging: tegra-vde: fix common struct sg_table
 related issues
Message-ID: <20200621070015.0cf833ab@dimatab>
In-Reply-To: <20200619103636.11974-32-m.szyprowski@samsung.com>
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa@eucas1p1.samsung.com>
 <20200619103636.11974-32-m.szyprowski@samsung.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: devel@driverdev.osuosl.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

0JIgRnJpLCAxOSBKdW4gMjAyMCAxMjozNjozMSArMDIwMApNYXJlayBTenlwcm93c2tpIDxtLnN6
eXByb3dza2lAc2Ftc3VuZy5jb20+INC/0LjRiNC10YI6Cgo+IFRoZSBEb2N1bWVudGF0aW9uL0RN
QS1BUEktSE9XVE8udHh0IHN0YXRlcyB0aGF0IHRoZSBkbWFfbWFwX3NnKCkKPiBmdW5jdGlvbiBy
ZXR1cm5zIHRoZSBudW1iZXIgb2YgdGhlIGNyZWF0ZWQgZW50cmllcyBpbiB0aGUgRE1BIGFkZHJl
c3MKPiBzcGFjZS4gSG93ZXZlciB0aGUgc3Vic2VxdWVudCBjYWxscyB0byB0aGUKPiBkbWFfc3lu
Y19zZ19mb3Jfe2RldmljZSxjcHV9KCkgYW5kIGRtYV91bm1hcF9zZyBtdXN0IGJlIGNhbGxlZCB3
aXRoCj4gdGhlIG9yaWdpbmFsIG51bWJlciBvZiB0aGUgZW50cmllcyBwYXNzZWQgdG8gdGhlIGRt
YV9tYXBfc2coKS4KPiAKPiBzdHJ1Y3Qgc2dfdGFibGUgaXMgYSBjb21tb24gc3RydWN0dXJlIHVz
ZWQgZm9yIGRlc2NyaWJpbmcgYQo+IG5vbi1jb250aWd1b3VzIG1lbW9yeSBidWZmZXIsIHVzZWQg
Y29tbW9ubHkgaW4gdGhlIERSTSBhbmQgZ3JhcGhpY3MKPiBzdWJzeXN0ZW1zLiBJdCBjb25zaXN0
cyBvZiBhIHNjYXR0ZXJsaXN0IHdpdGggbWVtb3J5IHBhZ2VzIGFuZCBETUEKPiBhZGRyZXNzZXMg
KHNnbCBlbnRyeSksIGFzIHdlbGwgYXMgdGhlIG51bWJlciBvZiBzY2F0dGVybGlzdCBlbnRyaWVz
Ogo+IENQVSBwYWdlcyAob3JpZ19uZW50cyBlbnRyeSkgYW5kIERNQSBtYXBwZWQgcGFnZXMgKG5l
bnRzIGVudHJ5KS4KPiAKPiBJdCB0dXJuZWQgb3V0IHRoYXQgaXQgd2FzIGEgY29tbW9uIG1pc3Rh
a2UgdG8gbWlzdXNlIG5lbnRzIGFuZAo+IG9yaWdfbmVudHMgZW50cmllcywgY2FsbGluZyBETUEt
bWFwcGluZyBmdW5jdGlvbnMgd2l0aCBhIHdyb25nIG51bWJlcgo+IG9mIGVudHJpZXMgb3IgaWdu
b3JpbmcgdGhlIG51bWJlciBvZiBtYXBwZWQgZW50cmllcyByZXR1cm5lZCBieSB0aGUKPiBkbWFf
bWFwX3NnKCkgZnVuY3Rpb24uCj4gCj4gVG8gYXZvaWQgc3VjaCBpc3N1ZXMsIGxldHMgdXNlIGEg
Y29tbW9uIGRtYS1tYXBwaW5nIHdyYXBwZXJzIG9wZXJhdGluZwo+IGRpcmVjdGx5IG9uIHRoZSBz
dHJ1Y3Qgc2dfdGFibGUgb2JqZWN0cyBhbmQgdXNlIHNjYXR0ZXJsaXN0IHBhZ2UKPiBpdGVyYXRv
cnMgd2hlcmUgcG9zc2libGUuIFRoaXMsIGFsbW9zdCBhbHdheXMsIGhpZGVzIHJlZmVyZW5jZXMg
dG8gdGhlCj4gbmVudHMgYW5kIG9yaWdfbmVudHMgZW50cmllcywgbWFraW5nIHRoZSBjb2RlIHJv
YnVzdCwgZWFzaWVyIHRvIGZvbGxvdwo+IGFuZCBjb3B5L3Bhc3RlIHNhZmUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+IFJl
dmlld2VkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvc3RhZ2luZy9tZWRpYS90ZWdyYS12ZGUvaW9tbXUuYyB8IDQgKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lvbW11LmMKPiBiL2RyaXZlcnMvc3Rh
Z2luZy9tZWRpYS90ZWdyYS12ZGUvaW9tbXUuYyBpbmRleAo+IDZhZjg2M2Q5MjEyMy4uYWRmOGRj
N2VlMjVjIDEwMDY0NCAtLS0KPiBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS90ZWdyYS12ZGUvaW9t
bXUuYyArKysKPiBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS90ZWdyYS12ZGUvaW9tbXUuYyBAQCAt
MzYsOCArMzYsOCBAQCBpbnQKPiB0ZWdyYV92ZGVfaW9tbXVfbWFwKHN0cnVjdCB0ZWdyYV92ZGUg
KnZkZSwgCj4gIAlhZGRyID0gaW92YV9kbWFfYWRkcigmdmRlLT5pb3ZhLCBpb3ZhKTsKPiAgCj4g
LQlzaXplID0gaW9tbXVfbWFwX3NnKHZkZS0+ZG9tYWluLCBhZGRyLCBzZ3QtPnNnbCwgc2d0LT5u
ZW50cywKPiAtCQkJICAgIElPTU1VX1JFQUQgfCBJT01NVV9XUklURSk7Cj4gKwlzaXplID0gaW9t
bXVfbWFwX3NndGFibGUodmRlLT5kb21haW4sIGFkZHIsIHNndCwKPiArCQkJCSBJT01NVV9SRUFE
IHwgSU9NTVVfV1JJVEUpOwo+ICAJaWYgKCFzaXplKSB7Cj4gIAkJX19mcmVlX2lvdmEoJnZkZS0+
aW92YSwgaW92YSk7Cj4gIAkJcmV0dXJuIC1FTlhJTzsKCkFoaCwgSSBzYXcgdGhlIGJ1aWxkIGZh
aWx1cmUgcmVwb3J0LiBZb3UncmUgY2hhbmdpbmcgdGhlIERNQSBBUEkgaW4KdGhpcyBzZXJpZXMs
IHdoaWxlIERNQSBBUEkgaXNuJ3QgdXNlZCBieSB0aGlzIGRyaXZlciwgaXQgdXNlcyBJT01NVQpB
UEkuIEhlbmNlIHRoZXJlIGlzIG5vIG5lZWQgdG8gdG91Y2ggdGhpcyBjb2RlLiBTaW1pbGFyIHBy
b2JsZW0gaW4gdGhlCmhvc3QxeCBkcml2ZXIgcGF0Y2guCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
