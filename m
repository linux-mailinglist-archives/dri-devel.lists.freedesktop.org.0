Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDFF1A08FB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED986E5BD;
	Tue,  7 Apr 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-49.consmr.mail.gq1.yahoo.com
 (sonic310-49.consmr.mail.gq1.yahoo.com [98.137.69.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E996E02F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 00:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1586220039; bh=WqkBupthajN/wVNjyMab6WjNkJYjZbWKiQLkiDzGuL8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=M1ZyPm84VdFE7nGdaCFwWB9dJFOU2AswpxkEQomEJzw9T0vV4NJG9RNfVmohcSg8mL2bEJEquJ6QW5EgoDGrp9iZ03c/41vIOhn4a2yr4ECZ5b3thfguhpBSoAgaRGyP/3OcAfwV68h5MKIs5s1fVsyEaZtue93megk8RR3qJOeIx9nagkd+ieOQt+ujWesq7Lyjr5Lhnx60jXnqQC7gWlOLqKpJMJN+Lf1pidgM/Eupa/RnUjTs3CRltdACwJPpUvLgoWVk3+RNL3reAYJDhtOKgw6/8MG+WEs6K8OmcOQh2WoVMVRftK1HBov8RLWQi2slsPgLLXfVFPQiBICMNw==
X-YMail-OSG: N_6BpMEVRDvd.miR6A7lED5GPdAEx7ojsA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Tue, 7 Apr 2020 00:40:39 +0000
Received: by smtp426.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 56102bb25bec285dc24cdcfca4dac9a3; 
 Tue, 07 Apr 2020 00:38:38 +0000 (UTC)
Date: Mon, 06 Apr 2020 20:38:34 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: Bad rss-counter state from drm/ttm, drm/vmwgfx: Support huge TTM
 pagefaults
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Thomas =?iso-8859-1?q?Hellstr=F6m?= "(VMware)"
 <thomas_os@shipmail.org>
References: <1586138158.v5u7myprlp.none.ref@localhost>
 <1586138158.v5u7myprlp.none@localhost>
 <0b12b28c-5f42-b56b-ea79-6e3d1052b332@shipmail.org>
In-Reply-To: <0b12b28c-5f42-b56b-ea79-6e3d1052b332@shipmail.org>
MIME-Version: 1.0
Message-Id: <1586219716.1a3fyi6lh5.none@localhost>
X-Mailer: WebService/1.1.15620 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:31 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 =?iso-8859-1?b?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXhjZXJwdHMgZnJvbSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSdzIG1lc3NhZ2Ugb2YgQXBy
aWwgNiwgMjAyMCA1OjA0IHBtOgo+IEhpLAo+IAo+IE9uIDQvNi8yMCA5OjUxIFBNLCBBbGV4IFh1
IChIZWxsbzcxKSB3cm90ZToKPj4gVXNpbmcgMzE0YjY1OCB3aXRoIGFtZGdwdSwgc3RhcnRpbmcg
c3dheSBhbmQgZmlyZWZveCBjYXVzZXMgIkJVRzogQmFkCj4+IHJzcy1jb3VudGVyIHN0YXRlIiBh
bmQgIkJVRzogbm9uLXplcm8gcGd0YWJsZXNfYnl0ZXMgb24gZnJlZWluZyBtbSIgdG8KPj4gc3Rh
cnQgZmlsbGluZyBkbWVzZywgYW5kIHRoZW4gY2xvc2luZyBwcm9ncmFtcyBjYXVzZXMgbW9yZSBC
VUdzIGFuZAo+PiBoYW5ncywgYW5kIHRoZW4gZXZlcnl0aGluZyBncmluZHMgdG8gYSBoYWx0IChj
YW4ndCBzdGFydCBtb3JlIHByb2dyYW1zLAo+PiBjYW4ndCBldmVuIHJlYm9vdCB0aHJvdWdoIHN5
c3RlbWQpLgo+Pgo+PiBVc2luZyBtYXN0ZXIgYW5kIHJldmVydGluZyB0aGF0IGJyYW5jaCB1cCB0
byB0aGF0IHBvaW50IGZpeGVzIHRoZQo+PiBwcm9ibGVtLgo+Pgo+PiBJJ20gdXNpbmcgYSBSeXpl
biAxNjAwIGFuZCBBTUQgUmFkZW9uIFJYIDQ4MCBvbiBhbiBBU1JvY2sgQjQ1MCBQcm80Cj4+IGJv
YXJkIHdpdGggSU9NTVUgZW5hYmxlZC4KPiAKPiBJZiB5b3UgY291bGQgdHJ5IHRoZSBhdHRhY2hl
ZCBwYXRjaCwgdGhhdCdkIGJlIGdyZWF0IQo+IAo+IFRoYW5rcywKPiAKPiBUaG9tYXMKPiAKClll
YWgsIHRoYXQgd29ya3MgdG9vLiBLZXJuZWwgY29uZmlnIHNlbnQgb2ZmLWxpc3QuCgpSZWdhcmRz
LApBbGV4LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
