Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C4A7678
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07F8920F;
	Tue,  3 Sep 2019 21:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9A98920F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 21:46:40 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CB752377B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 21:46:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id b16so19005937wrq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 14:46:39 -0700 (PDT)
X-Gm-Message-State: APjAAAUFnv5gaPsQ0epZ3aEF8d+Fa2aDxdHmg68b2QPkjBw3ILO09VRz
 BH38nwrJRy1PAufzHykMOuxHnZBH+eJ2CXHeMjpFwg==
X-Google-Smtp-Source: APXvYqz4RxECik3SSeHnQ6uGsdoUHoPvfoX8v95tD35kbPoLbUJAHEgyU34VuuCfEWn1rCU4+4Q1Ye17KG1ilOuoQ0w=
X-Received: by 2002:adf:eec5:: with SMTP id a5mr45408830wrp.352.1567547198323; 
 Tue, 03 Sep 2019 14:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
In-Reply-To: <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 3 Sep 2019 14:46:27 -0700
X-Gmail-Original-Message-ID: <CALCETrVnNpPwmRddGLku9hobE7wG30_3j+QfcYxk09hZgtaYww@mail.gmail.com>
Message-ID: <CALCETrVnNpPwmRddGLku9hobE7wG30_3j+QfcYxk09hZgtaYww@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567547200;
 bh=OP29gy/q+Cu68z+EtjpWoGyc83iGnUe1WahW7rKmtJU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CD6/9CM1nKcIzrbPVDQFlgnKevgZNXmRfLLC6PyzUU/mCHfU3iVEH4CGTWufDJwfm
 qS1yJoSThByNKWmHG8XrhXhForrSoQrkKjc/rwJBxAjJDMqkBbjYony0DU8r71kWro
 3KTryIXmbZM88cQ6U4i08+KJlFlSkKvQ8zduc6hY=
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Andy Lutomirski <luto@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCAyOjA1IFBNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
Cjx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPgo+IE9uIDkvMy8xOSAxMDo1MSBQTSwg
RGF2ZSBIYW5zZW4gd3JvdGU6Cj4gPiBPbiA5LzMvMTkgMTozNiBQTSwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gPj4gU28gdGhlIHF1ZXN0aW9uIGhlcmUgc2hvdWxkIHJlYWxs
eSBiZSwgY2FuIHdlIGRldGVybWluZSBhbHJlYWR5IGF0IG1tYXAKPiA+PiB0aW1lIHdoZXRoZXIg
YmFja2luZyBtZW1vcnkgd2lsbCBiZSB1bmVuY3J5cHRlZCBhbmQgYWRqdXN0IHRoZSAqcmVhbCoK
PiA+PiB2bWEtPnZtX3BhZ2VfcHJvdCB1bmRlciB0aGUgbW1hcF9zZW0/Cj4gPj4KPiA+PiBQb3Nz
aWJseSwgYnV0IHRoYXQgcmVxdWlyZXMgcG9wdWxhdGluZyB0aGUgYnVmZmVyIHdpdGggbWVtb3J5
IGF0IG1tYXAKPiA+PiB0aW1lIHJhdGhlciB0aGFuIGF0IGZpcnN0IGZhdWx0IHRpbWUuCj4gPiBJ
J20gbm90IGNvbm5lY3RpbmcgdGhlIGRvdHMuCj4gPgo+ID4gdm1hLT52bV9wYWdlX3Byb3QgaXMg
dXNlZCB0byBjcmVhdGUgYSBWTUEncyBQVEVzIHJlZ2FyZGxlc3Mgb2YgaWYgdGhleQo+ID4gYXJl
IGNyZWF0ZWQgYXQgbW1hcCgpIG9yIGZhdWx0IHRpbWUuICBJZiB3ZSBlc3RhYmxpc2ggYSBnb29k
Cj4gPiB2bWEtPnZtX3BhZ2VfcHJvdCwgY2FuJ3Qgd2UganVzdCB1c2UgaXQgZm9yZXZlciBmb3Ig
ZGVtYW5kIGZhdWx0cz8KPgo+IFdpdGggU0VWIEkgdGhpbmsgdGhhdCB3ZSBjb3VsZCBwb3NzaWJs
eSBlc3RhYmxpc2ggdGhlIGVuY3J5cHRpb24gZmxhZ3MKPiBhdCB2bWEgY3JlYXRpb24gdGltZS4g
QnV0IHRoaW5raW5nIG9mIGl0LCBpdCB3b3VsZCBhY3R1YWxseSBicmVhayB3aXRoCj4gU01FIHdo
ZXJlIGJ1ZmZlciBjb250ZW50IGNhbiBiZSBtb3ZlZCBiZXR3ZWVuIGVuY3J5cHRlZCBzeXN0ZW0g
bWVtb3J5Cj4gYW5kIHVuZW5jcnlwdGVkIGdyYXBoaWNzIGNhcmQgUENJIG1lbW9yeSBiZWhpbmQg
dXNlci1zcGFjZSdzIGJhY2suIFRoYXQKPiB3b3VsZCBpbXBseSBraWxsaW5nIGFsbCB1c2VyLXNw
YWNlIGVuY3J5cHRlZCBQVEVzIGFuZCBhdCBmYXVsdCB0aW1lIHNldAo+IHVwIG5ldyBvbmVzIHBv
aW50aW5nIHRvIHVuZW5jcnlwdGVkIFBDSSBtZW1vcnkuLgo+Cj4gPgo+ID4gT3IsIGFyZSB5b3Ug
Y29uY2VybmVkIHRoYXQgaWYgYW4gYXR0ZW1wdCBpcyBtYWRlIHRvIGRlbWFuZC1mYXVsdCBwYWdl
Cj4gPiB0aGF0J3MgaW5jb21wYXRpYmxlIHdpdGggdm1hLT52bV9wYWdlX3Byb3QgdGhhdCB3ZSBo
YXZlIHRvIFNFR1Y/Cj4gPgo+ID4+IEFuZCBpdCBzdGlsbCByZXF1aXJlcyBrbm93bGVkZ2Ugd2hl
dGhlciB0aGUgZGV2aWNlIERNQSBpcyBhbHdheXMKPiA+PiB1bmVuY3J5cHRlZCAob3IgaWYgU0VW
IGlzIGFjdGl2ZSkuCj4gPiBJIG1heSBiZSBnZXR0aW5nIG1peGVkIHVwIG9uIE1LVE1FICh0aGUg
SW50ZWwgbWVtb3J5IGVuY3J5cHRpb24pIGFuZAo+ID4gU0VWLiAgSXMgU0VWIHN1cHBvcnRlZCBv
biBhbGwgbWVtb3J5IHR5cGVzPyAgUGFnZSBjYWNoZSwgaHVnZXRsYmZzLAo+ID4gYW5vbnltb3Vz
PyAgT3IganVzdCBhbm9ueW1vdXM/Cj4KPiBTRVYgQUZBSUsgZW5jcnlwdHMgKmFsbCogbWVtb3J5
IGV4Y2VwdCBETUEgbWVtb3J5LiBUbyBkbyB0aGF0IGl0IHVzZXMgYQo+IFNXSU9UTEIgYmFja2Vk
IGJ5IHVuZW5jcnlwdGVkIG1lbW9yeSwgYW5kIGl0IGFsc28gZmxpcHMgY29oZXJlbnQgRE1BCj4g
bWVtb3J5IHRvIHVuZW5jcnlwdGVkICh3aGljaCBpcyBhIHZlcnkgc2xvdyBvcGVyYXRpb24gYW5k
IHBhdGNoIDQgZGVhbHMKPiB3aXRoIGNhY2hpbmcgc3VjaCBtZW1vcnkpLgo+CgpJJ20gc3RpbGwg
bG9zdC4gIFlvdSBoYXZlIHNvbWUgZmFuY3kgVk1BIHdoZXJlIHRoZSBiYWNraW5nIHBhZ2VzCmNo
YW5nZSBiZWhpbmQgdGhlIGFwcGxpY2F0aW9uJ3MgYmFjay4gIFRoaXMgaXNuJ3QgcGFydGljdWxh
cmx5IG5vdmVsCi0tIHBsYWluIG9sZCBhbm9ueW1vdXMgbWVtb3J5IGFuZCBwbGFpbiBvbGQgbWFw
cGVkIGZpbGVzIGRvIHRoaXMgdG9vLgpDYW4ndCB5b3UgYWxsIHRoZSBpbnNlcnRfcGZuIEFQSXMg
YW5kIGNhbGwgaXQgYSBkYXk/ICBXaGF0J3Mgc28Kc3BlY2lhbCB0aGF0IHlvdSBuZWVkIGFsbCB0
aGlzIG1hZ2ljPyAgSVNUTSB5b3Ugc2hvdWxkIGJlIGFibGUgdG8KYWxsb2NhdGUgbWVtb3J5IHRo
YXQncyBhZGRyZXNzYWJsZSBieSB0aGUgZGV2aWNlIChkbWFfYWxsb2NfY29oZXJlbnQoKQpvciB3
aGF0ZXZlcikgYW5kIHRoZW4gbWFwIGl0IGludG8gdXNlciBtZW1vcnkganVzdCBsaWtlIHlvdSdk
IG1hcCBhbnkKb3RoZXIgcGFnZS4KCkkgZmVlbCBsaWtlIEknbSBtaXNzaW5nIHNvbWV0aGluZyBo
ZXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
