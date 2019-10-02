Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA04C8977
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 15:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEE26E0EF;
	Wed,  2 Oct 2019 13:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E056E0E1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 13:18:22 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r16so15181236edq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 06:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=E4uXiPQh5CilHJLER4hocaBvsNcCWt7kA1fG1frc5KM=;
 b=ITQB4CGWd9RteSw80q2nVNo4TenIq29zHQEbuiDJCuZmnIbCw7HKn5asNwYZOGbFBJ
 HuLofYWDV2KC2oxV+xAxo1dfgsUaIS4mQwP4rBdcU29O9v3xDEkMaLBINicqV9nj5Eki
 sKaGidKkEnM1P1GPtZ4JFIbrwsDm/e4aVdoG8gj670ghq5qnGReirwPBrJxIl+1y0uV4
 iT9uajz/eD6Oh0I5N4z4SoGQM1/7iDbJawbKgcZtEVhaZV2Rg3wfe8AWSASVvtn0lmfr
 SuwLH4toFbDojdULgSQgqW3p2eJnuCzoPCek5Wqfd22EMwXqDEwsp2ARmvv3kO6wJAWB
 PCXQ==
X-Gm-Message-State: APjAAAWlu1gOzNqL3vgFrZ17eOj61BSDbIZ/XXUVLYS0NtQu0IeoPItd
 feoLjD66eJtskg6yFqwAyVDM9A==
X-Google-Smtp-Source: APXvYqwgwVGc3f1EL8dgSureN2TvxxLp+I/HhbuxR51KekTRd69Ckz2y0aHsSMpQwO9ILaz3/UazVw==
X-Received: by 2002:a17:906:e288:: with SMTP id
 gg8mr2976209ejb.24.1570022301120; 
 Wed, 02 Oct 2019 06:18:21 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id v22sm3895662edm.89.2019.10.02.06.18.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 06:18:20 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id F209310410D; Wed,  2 Oct 2019 16:18:19 +0300 (+03)
Date: Wed, 2 Oct 2019 16:18:19 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
Message-ID: <20191002131819.asjr2tsx6lcmmbof@box>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <50e83aeb-e971-f0ad-f034-ed592588eba7@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50e83aeb-e971-f0ad-f034-ed592588eba7@shipmail.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=E4uXiPQh5CilHJLER4hocaBvsNcCWt7kA1fG1frc5KM=;
 b=gq5itDKj0IoY9IxPzNtP49jnszJZvvR5zSQzt0qcvhvxVJYqvyjMY6d1LgRComtIEl
 ci5AdTu+8f7b3d69LbYjcnaw+orJSp9tCPY5UgU48BuoHyV/WnQLniehfDoPZmyTrh61
 R0hLu2Zqn94/IW5L3S0BWeF8GErkHbw8pho+sxjuQvaki2o5xzPT4x35UIKOz4ZCuyI6
 2QL0u44JtF1ladY9H0VI4Z8nCwv2etE58/Ohp3bfp1AhjIrYRa+Tc8VzomYVaaiNgmrA
 Pyr32xZwmkbmD3XUhhM9I1ZDs4PXhn59CcRBI1xU0VTclpmI2X7d0e0j0wEpuZiDk8Lr
 F3PA==
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMTE6MjE6MDFBTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gT24gOS8yNi8xOSAxMDoxNiBQTSwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAxOjA5IFBNIFRob21hcyBIZWxsc3Ry
w7ZtIChWTXdhcmUpCj4gPiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4gPiA+IFRo
YXQgc2FpZCwgaWYgcGVvcGxlIGFyZSBPSyB3aXRoIG1lIG1vZGlmeWluZyB0aGUgYXNzZXJ0IGlu
Cj4gPiA+IHB1ZF90cmFuc19odWdlX2xvY2soKSBhbmQgbWFrZSBfX3dhbGtfcGFnZV9yYW5nZSBu
b24tc3RhdGljLCBpdCBzaG91bGQKPiA+ID4gcHJvYmFibHkgYmUgcG9zc2libGUgdG8gbWFrZSBp
dCB3b3JrLCB5ZXMuCj4gPiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRvIG1vZGlmeSB0aGF0IGFz
c2VydCBhdCBhbGwuCj4gPiAKPiA+IFRoYXQgdGhpbmcgb25seSBleGlzdHMgd2hlbiB0aGVyZSdz
IGEgInB1ZF9lbnRyeSIgb3AgaW4gdGhlIHdhbGtlciwKPiA+IGFuZCB0aGVuIHlvdSBhYnNvbHV0
ZWx5IG5lZWQgdG8gaGF2ZSB0aGF0IG1tYXBfbG9jay4KPiA+IAo+ID4gQXMgZmFyIGFzIEkgY2Fu
IHRlbGwsIHlvdSBmdW5kYW1lbnRhbGx5IG9ubHkgZXZlciB3b3JrIG9uIGEgcHRlIGxldmVsCj4g
PiBpbiB5b3VyIGFkZHJlc3Mgc3BhY2Ugd2Fsa2VyIGFscmVhZHkgYW5kIGFjdHVhbGx5IGhhdmUg
YSBXQVJOX09OKCkgb24KPiA+IHRoZSBwdWRfaHVnZSB0aGluZywgc28gbm8gcHVkIGVudHJ5IGNh
biBwb3NzaWJseSBhcHBseS4KPiA+IAo+ID4gU28gbm8sIHRoZSBhc3NlcnQgaW4gcHVkX3RyYW5z
X2h1Z2VfbG9jaygpIGRvZXMgbm90IHNlZW0gdG8gYmUgYQo+ID4gcmVhc29uIG5vdCB0byBqdXN0
IHVzZSB0aGUgZXhpc3RpbmcgcGFnZSB0YWJsZSB3YWxrZXJzLgo+ID4gCj4gPiBBbmQgb25jZSB5
b3UgZ2V0IHJpZCBvZiB0aGUgd2Fsa2luZywgd2hhdCBpcyBsZWZ0PyBKdXN0IHRoZSAiaXRlcmF0
ZQo+ID4gb3ZlciB0aGUgaW5vZGUgbWFwcGluZ3MiIHBhcnQuIFdoaWNoIGNvdWxkIGp1c3QgYmUg
ZG9uZSBpbgo+ID4gbW0vcGFnZXdhbGsuYywgYW5kIHRoZW4geW91IGRvbid0IGV2ZW4gbmVlZCB0
byByZW1vdmUgdGhlIHN0YXRpYy4KPiA+IAo+ID4gU28gbWFraW5nIGl0IGJlIGp1c3QgYW5vdGhl
ciB3YWxraW5nIGluIHBhZ2V3YWxrLmMgd291bGQgc2VlbSB0byBiZQo+ID4gdGhlIHNpbXBsZXN0
IG1vZGVsLgo+ID4gCj4gPiBDYWxsIGl0ICJ3YWxrX3BhZ2VfbWFwcGluZygpIi4gQW5kIHRhbGsg
ZXh0ZW5zaXZlbHkgYWJvdXQgaG93IHRoZQo+ID4gbG9ja2luZyBkaWZmZXJzIGEgbG90IGZyb20g
dGhlIHVzdWFsICJ3YWxrX3BhZ2Vfdm1hKCkiIHRoaW5ncy4KPiA+IAo+ID4gVGhlIHRoZW4gYWN0
dWFsICJhcHBseSIgZnVuY3Rpb25zICh3aGF0IGEgaG9ycmlkIG5hbWUpIGNvdWxkIGJlIGluIHRo
ZQo+ID4gdXNlcnMuIFRoZXkgc2hvdWxkbid0IGJlIG1peGVkIGluIHdpdGggdGhlIHdhbGtpbmcg
ZnVuY3Rpb25zIGFueXdheS4KPiA+IFRoZXkgYXJlIGNhbGxiYWNrcywgbm90IHdhbGtlcnMuCj4g
PiAKPiA+ICAgICAgICAgICAgICAgTGludXMKPiAKPiBMaW51cywgS2lyaWxsCj4gCj4gSSd2ZSBw
dXNoZWQgYSByZXdvcmtlZCB2ZXJzaW9uIGJhc2VkIG9uIHRoZSBwYWdld2FsayBjb2RlIGhlcmU6
Cj4gCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eC9sb2cvP2g9
cGFnZXdhbGsKPiAKPiAodG9wIHRocmVlIHBhdGNoZWQpCj4gCj4gd2l0aCB1c2VycyBpbmNsdWRl
ZCBoZXJlOgo+IAo+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvfnRob21hc2gvbGludXgv
bG9nLz9oPWNvaGVyZW50LXJlYmFzZWQKPiAKPiBEbyB5b3UgdGhpbmsgdGhpcyBjb3VsZCB3b3Jr
PyBUaGUgcmVhc29uIHRoYXQgdGhlICJtbTogQWRkIHdyaXRlLXByb3RlY3QgYW5kCj4gY2xlYW4u
LiIgY29kZSBpcyBzdGlsbCBpbiBtbSBhcyBhIHNldCBvZiBoZWxwZXJzLCBpcyBvZiBjb3Vyc2Ug
dGhhdCBtdWNoIG9mCj4gdGhlIG5lZWRlZCBmdW5jdGlvbmFsaXR5IGlzIG5vdCBleHBvcnRlZCwg
cHJlc3VtYWJseSBzaW5jZSB3ZSB3YW50IHRvIGtlZXAKPiBwYWdlIHRhYmxlIG1hbmlwdWxhdGlv
biBpbiBtbS4KCkNvdWxkIHlvdSBwb3N0IGl0IHRvIHRoZSBtYWlsaW5nIGxpc3Q/IEl0J3MgZWFz
aWVyIHRvIHJldmlldyB0aGlzIHdheS4KCi0tIAogS2lyaWxsIEEuIFNodXRlbW92Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
