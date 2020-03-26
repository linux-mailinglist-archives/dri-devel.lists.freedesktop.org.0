Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A345193A76
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 09:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDE16E33A;
	Thu, 26 Mar 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B87689683
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 07:20:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z5so5319008wml.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=udY4IxAu4+qBI0VVKoFSj5VQzPLtjOmL74dmx17lD1U=;
 b=BEpbLZ6XT3fHzXgdnVfXkTmNBXDa6UAEYn4FOV/LwqEXXg2tc6UbIV86xAZPGDiDrG
 1de7vV2LABFiGVyHP74oIuuzNqY1SLzxkyOZEVs9AqFqhdhoCL6ePEpOahO3pWNjY6rD
 YuxfREhfec8qU9JviGWcdntXLrNVFBj6hQZdsAakbJFYT4buJOOZEwvlkBNW4cIjInLd
 vfYQRytF5Y056gU124I4U51o1Dbhoe6O/jPPhjRNN+KbCXgBNwB1oeypmknKitdRZxL0
 rjtvwQncKst3+kgPdVubfMahgLp4wXYSC/QYoTFE+P3h53T/3C+aARhrdN9pBRKDKnmz
 Hjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=udY4IxAu4+qBI0VVKoFSj5VQzPLtjOmL74dmx17lD1U=;
 b=llKwLrfA9Hl9L11kV2KqX9d2lXw9vTZerSYRv2cDYwbR372VNeZJUQFD40ApipX98A
 kkdyQPDLR0ad+G4phfj98MtjPbXTtqOLy9ysMyuHdFPYVz1f00LmWI7jkV82VL9Z/BTQ
 75W4DxAQyedMM2ENsHE4GTOXTQGZQibZvH3oo1l9E1c9M0tibFdSoecAkfZDMFPLjdxB
 W8LdNX3OXeSpUOtFjeOAbYdktwSVELDRJ61ifm2rwKAZ7Bac63SA6zvE/c7xPESXev4L
 wktf17+5ulvCNtwf9EO8aEwFBIUfolZWXPb76Ir1x1CnYd9EdszQMtRRMrSXaYy7vp/v
 fqOg==
X-Gm-Message-State: ANhLgQ1egm4kAfcwU6qAXrqI8vSDMko024IEab/ciqpU/QN4K51X8SF9
 3jBFv7fG42mKFsid/vw/qi1yROpEPMUW7x8Nu4U=
X-Google-Smtp-Source: ADFU+vvQEBhAU7ND16P7NOyZPA8RvhuFNLqp7LcJBtkXT/DY6/gdim+O/mf1U6mhyqA/FLaGt5G65FqLM4fapjkUyAg=
X-Received: by 2002:a1c:5506:: with SMTP id j6mr1657330wmb.127.1585207198626; 
 Thu, 26 Mar 2020 00:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200324201123.3118-1-thomas_os@shipmail.org>
 <20200324201123.3118-2-thomas_os@shipmail.org>
In-Reply-To: <20200324201123.3118-2-thomas_os@shipmail.org>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 26 Mar 2020 08:19:47 +0100
Message-ID: <CAM9Jb+i=r5RuSruFgYomoDMBgkqw=+ff-VmBfVByY_DPT2_2VA@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] fs: Constify vma argument to vma_is_dax
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:08:32 +0000
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
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiAiVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSIgPHRob21hc19vc0BzaGlwbWFpbC5v
cmc+Cj4KPiBUaGUgZnVuY3Rpb24gaXMgdXNlZCBieSB1cGNvbWluZyB2bWFfaXNfc3BlY2lhbF9o
dWdlKCkgd2l0aCB3aGljaCB3ZSB3YW50Cj4gdG8gdXNlIGEgY29uc3Qgdm1hIGFyZ3VtZW50LiBT
aW5jZSBmb3Igdm1hX2lzX2RheCgpIHRoZSB2bWEgYXJndW1lbnQgaXMKPiBvbmx5IGRlcmVmZXJl
bmNlZCBmb3IgcmVhZGluZywgY29uc3RpZnkgaXQuCj4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5j
b20+Cj4gQ2M6ICJNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSIgPHdpbGx5QGluZnJhZGVhZC5vcmc+
Cj4gQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwu
Y29tPgo+IENjOiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4gQ2M6ICJK
w6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5q
LndpbGxpYW1zQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIChW
TXdhcmUpIDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPgo+IFJldmlld2VkLWJ5OiBSb2xhbmQgU2No
ZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2ZzLmgg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZnMuaCBiL2luY2x1ZGUvbGludXgvZnMuaAo+
IGluZGV4IDNjZDRmZTZiODQ1ZS4uMmIzOGNlNWI3M2FkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvZnMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZnMuaAo+IEBAIC0zMzkxLDcgKzMzOTEs
NyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaW9faXNfZGlyZWN0KHN0cnVjdCBmaWxlICpmaWxwKQo+
ICAgICAgICAgcmV0dXJuIChmaWxwLT5mX2ZsYWdzICYgT19ESVJFQ1QpIHx8IElTX0RBWChmaWxw
LT5mX21hcHBpbmctPmhvc3QpOwo+ICB9Cj4KPiAtc3RhdGljIGlubGluZSBib29sIHZtYV9pc19k
YXgoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2bWFf
aXNfZGF4KGNvbnN0IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gICAgICAgICBy
ZXR1cm4gdm1hLT52bV9maWxlICYmIElTX0RBWCh2bWEtPnZtX2ZpbGUtPmZfbWFwcGluZy0+aG9z
dCk7Cj4gIH0KPiAtLQpBY2tlZC1ieTogUGFua2FqIEd1cHRhIDxwYW5rYWouZ3VwdGEubGludXhA
Z21haWwuY29tPgoKPiAyLjIxLjEKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
