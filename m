Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD782C90
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B50889D8D;
	Tue,  6 Aug 2019 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 933 seconds by postgrey-1.36 at gabe;
 Mon, 05 Aug 2019 18:28:44 UTC
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E4F89D7D;
 Mon,  5 Aug 2019 18:28:44 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1huhik-00088X-Fk; Mon, 05 Aug 2019 18:28:34 +0000
Date: Mon, 5 Aug 2019 19:28:34 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
Message-ID: <20190805182834.GI1131@ZenIV.linux.org.uk>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
 <20190805181255.GH1131@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805181255.GH1131@ZenIV.linux.org.uk>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDc6MTI6NTVQTSArMDEwMCwgQWwgVmlybyB3cm90ZToK
PiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwMTowMzowNkFNICswOTAwLCBTZXJnZXkgU2Vub3po
YXRza3kgd3JvdGU6Cj4gPiB0bXBmcyBkb2VzIG5vdCBzZXQgLT5yZW1vdW50X2ZzKCkgYW55bW9y
ZSBhbmQgaXRzIHVzZXJzIG5lZWQKPiA+IHRvIGJlIGNvbnZlcnRlZCB0byBuZXcgbW91bnQgQVBJ
Lgo+IAo+IENvdWxkIHlvdSBleHBsYWluIHdoeSB0aGUgZGV2aWwgZG8geW91IGJvdGhlciB3aXRo
IHJlbW91bnQgYXQgYWxsPwo+IFdoeSBub3QgcGFzcyB0aGUgcmlnaHQgb3B0aW9ucyB3aGVuIG1v
dW50aW5nIHRoZSBkYW1uIHRoaW5nPwoKLi4uIGFuZCB3aGlsZSB3ZSBhcmUgYXQgaXQsIEkgcmVh
bGx5IHdvbmRlciB3aGF0J3MgZ29pbmcgb24gd2l0aAp0aGF0IGdlbWZzIHRoaW5nIC0gYW1vbmcg
dGhlIG90aGVyIHRoaW5ncywgdGhpcyBpcyB0aGUgb25seQp1c2VyIG9mIHNobWVtX2ZpbGVfc2V0
dXBfd2l0aF9tbnQoKS4gIFN1cmUsIHlvdSB3YW50IHlvdXIgb3duCm9wdGlvbnMsIGJ1dCB0aGF0
IGJyaW5ncyBhbm90aGVyIHF1ZXN0aW9uIC0gaXMgdGhlcmUgYW55IHJlYXNvbgpmb3IgaGF2aW5n
IHRoZSBodWdlPS4uLiBwZXItc3VwZXJibG9jayByYXRoZXIgdGhhbiBwZXItZmlsZT8KCkFmdGVy
IGFsbCwgdGhlIHJlYWRlcnMgb2YgLT5odWdlIGluIG1tL3NobWVtLmMgYXJlCm1tL3NobWVtLmM6
NTgyOiAgICAgKHNobWVtX2h1Z2UgPT0gU0hNRU1fSFVHRV9GT1JDRSB8fCBzYmluZm8tPmh1Z2Up
ICYmCglpc19odWdlX2VuYWJsZWQoKSwgc2JpbmZvIGlzIGFuIGV4cGxpY2l0IGFyZ3VtZW50Cgpt
bS9zaG1lbS5jOjE3OTk6ICAgICAgICBzd2l0Y2ggKHNiaW5mby0+aHVnZSkgewoJc2htZW1fZ2V0
cGFnZV9nZnAoKSwgc2JpbmZvIGNvbWVzIGZyb20gaW5vZGUKCm1tL3NobWVtLmM6MjExMzogICAg
ICAgICAgICAgICAgaWYgKFNITUVNX1NCKHNiKS0+aHVnZSA9PSBTSE1FTV9IVUdFX05FVkVSKQoJ
c2htZW1fZ2V0X3VubWFwcGVkX2FyZWEoKSwgc2IgY29tZXMgZnJvbSBmaWxlCgptbS9zaG1lbS5j
OjM1MzE6ICAgICAgICBpZiAoc2JpbmZvLT5odWdlKQptbS9zaG1lbS5jOjM1MzI6ICAgICAgICAg
ICAgICAgIHNlcV9wcmludGYoc2VxLCAiLGh1Z2U9JXMiLCBzaG1lbV9mb3JtYXRfaHVnZShzYmlu
Zm8tPmh1Z2UpKTsKCS0+c2hvd19vcHRpb25zKCkKbW0vc2htZW0uYzozODgwOiAgICAgICAgc3dp
dGNoIChzYmluZm8tPmh1Z2UpIHsKCXNobWVtX2h1Z2VfZW5hYmxlZCgpLCBzYmluZm8gY29tZXMg
ZnJvbSBhbiBpbm9kZQoKQW5kIHRoZSBvbmx5IGNhbGxlciBvZiBpc19odWdlX2VuYWJsZWQoKSBp
cyBzaG1lbV9nZXRhdHRyKCksIHdpdGggc2JpbmZvCnBpY2tlZCBmcm9tIGlub2RlLgoKU28gaXMg
dGhlcmUgYW55IHJlYXNvbiB3aHkgdGhlIGh1Z2VwYWdlIHBvbGljeSBjYW4ndCBiZSBwZXItZmls
ZSwgd2l0aAp0aGUgY3VycmVudCBiZWluZyBvdmVycmlkYWJsZSBkZWZhdWx0PwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
