Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A715D378
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CF36F8C6;
	Fri, 14 Feb 2020 08:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEF26E422
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 22:43:33 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id d6so3887500pgn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 14:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1uz4onwD02FQH4e/dvdb1FjZu1rFnkl+4ltvHCVnzHQ=;
 b=Mu7RaWQT57rbjsEgWQeug20f4GIX77GFzc3qAC7n2UMwytWFBLui8a1qKbHPGKy1kO
 9qHZUeD/Ig7Ke5Azt9yZuWIB3ilP30QdJLPVilNqofkViyiWVw9yHK13NFR7WQruhaev
 K9iZutEjIZ9rx6lvKFO6X2nTrfMLXqseES2VUtMF39yTdsb2GbDCvpgsBONkdsB8nnA5
 MUo5zjOT/BmVDI9DZ/Hr6pq80Tpe5d2g9iwzD+aJyP/o8jZWLS7JhIi11/cydPIK6Nly
 ZZyDKTNDANgpYqFoT7sqnemXJg3T6yPh2tbZSI2Aim3r5vYBVqiLMFEqe5+3ngmFACR/
 q5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1uz4onwD02FQH4e/dvdb1FjZu1rFnkl+4ltvHCVnzHQ=;
 b=ucNpRwAHWIZhqqIWwtxwJgk97FBLd4nTbGFkAMWeVZ9KuIN77EMvMHCF+FDZNzVvAw
 D7lLGVc/Fm0Sw+A7YQpgz3dLiRXosopwbjsfydGaw3qdFJkkVuPmvkD1nVI1Z83mIsOa
 ea0YfXq0/td/Hdvb2zKrbr6i+0quSgK8fYxzejVn2xdHIaRVMAFrrPRAGTjbyWlvWKjj
 PLT4BNYKHrwzgyHSthKf1ytxeJFrbieZvy88IkTpkOvLJaRfX8sMFjnksyKXXW5y3jzJ
 ++NXtHRXZ31s6pg2T6GvndYz/U2gAWKSbb09isS1isG0F9H63K9mNlLVV6Ys+dDzcECW
 8/+Q==
X-Gm-Message-State: APjAAAWzfUqKIfyPXS09wmEkh9GW7Tlm22QuPLXtzrKSsQ0Kqb9QIqtP
 cNXOcKJHNFZtETrIxaIZRPncmJPf/CxtPxd+S4soAg==
X-Google-Smtp-Source: APXvYqz+I/Aj0lLNkEM0HAfbgend/2rNUCga5zdKKKJWLstIs2KmGzFR4k/LVIzrSDVahxXfq6sw1G//SGyOO9dV1IY=
X-Received: by 2002:a63:64c5:: with SMTP id y188mr195696pgb.10.1581633812546; 
 Thu, 13 Feb 2020 14:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
 <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
 <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
 <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net>
In-Reply-To: <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 13 Feb 2020 14:43:21 -0800
Message-ID: <CAKwvOdm4eS19-D3pEkKsyZw7VjJP9Jeh5gMZaszwgjrJe63yUg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgOToxNyBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMDItMTIgNjowNyBwLm0uLCBOYXRoYW4gQ2hh
bmNlbGxvciB3cm90ZToKPiA+IE9uIFdlZCwgRmViIDEyLCAyMDIwIGF0IDA5OjUyOjUyQU0gKzAx
MDAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+ID4+IE9uIDIwMjAtMDItMTEgOTozOSBwLm0uLCBO
YXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+Pj4gT24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMTA6
NDE6NDhBTSArMDEwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gPj4+PiBPbiAyMDIwLTAyLTEx
IDc6MTMgYS5tLiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPj4+Pj4gQSByZWNlbnQgY29t
bWl0IGluIGNsYW5nIGFkZGVkIC1XdGF1dG9sb2dpY2FsLWNvbXBhcmUgdG8gLVdhbGwsIHdoaWNo
IGlzCj4gPj4+Pj4gZW5hYmxlZCBmb3IgaTkxNSBzbyB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3YXJu
aW5nOgo+ID4+Pj4+Cj4gPj4+Pj4gLi4vZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X2V4ZWNidWZmZXIuYzoxNDg1OjIyOiB3YXJuaW5nOgo+ID4+Pj4+IHJlc3VsdCBvZiBjb21wYXJp
c29uIG9mIGNvbnN0YW50IDU3NjQ2MDc1MjMwMzQyMzQ4NyB3aXRoIGV4cHJlc3Npb24gb2YKPiA+
Pj4+PiB0eXBlICd1bnNpZ25lZCBpbnQnIGlzIGFsd2F5cyBmYWxzZQo+ID4+Pj4+IFstV3RhdXRv
bG9naWNhbC1jb25zdGFudC1vdXQtb2YtcmFuZ2UtY29tcGFyZV0KPiA+Pj4+PiAgICAgICAgIGlm
ICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkpKQo+ID4+Pj4+ICAgICAgICAg
ICAgIH5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+Pj4+Pgo+ID4+Pj4+
IFRoaXMgd2FybmluZyBvbmx5IGhhcHBlbnMgb24geDg2XzY0IGJ1dCB0aGF0IGNoZWNrIGlzIHJl
bGV2YW50IGZvcgo+ID4+Pj4+IDMyLWJpdCB4ODYgc28gd2UgY2Fubm90IHJlbW92ZSBpdC4KPiA+
Pj4+Cj4gPj4+PiBUaGF0J3Mgc3VwcmlzaW5nLiBBRkFJQ1QgTl9SRUxPQyhVTE9OR19NQVgpIHdv
cmtzIG91dCB0byB0aGUgc2FtZSB2YWx1ZQo+ID4+Pj4gaW4gYm90aCBjYXNlcywgYW5kIHJlbWFp
biBpcyBhIDMyLWJpdCB2YWx1ZSBpbiBib3RoIGNhc2VzLiBIb3cgY2FuIGl0IGJlCj4gPj4+PiBs
YXJnZXIgdGhhbiBOX1JFTE9DKFVMT05HX01BWCkgb24gMzItYml0IChidXQgbm90IG9uIDY0LWJp
dCk/Cj4gPj4+Pgo+ID4+Pgo+ID4+PiBIaSBNaWNoZWwsCj4gPj4+Cj4gPj4+IENhbid0IHRoaXMg
Y29uZGl0aW9uIGJlIHRydWUgd2hlbiBVSU5UX01BWCA9PSBVTE9OR19NQVg/Cj4gPj4KPiA+PiBP
aCwgcmlnaHQsIEkgdGhpbmsgSSB3YXMgd3JvbmdseSB0aGlua2luZyBsb25nIGhhZCA2NCBiaXRz
IGV2ZW4gb24gMzItYml0Lgo+ID4+Cj4gPj4KPiA+PiBBbnl3YXksIHRoaXMgc3VnZ2VzdHMgYSBw
b3NzaWJsZSBiZXR0ZXIgc29sdXRpb246Cj4gPj4KPiA+PiAjaWYgVUlOVF9NQVggPT0gVUxPTkdf
TUFYCj4gPj4gICAgICBpZiAodW5saWtlbHkocmVtYWluID4gTl9SRUxPQyhVTE9OR19NQVgpKSkK
PiA+PiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4gI2VuZGlmCj4gPj4KPiA+Pgo+
ID4+IE9yIGlmIHRoYXQgY2FuJ3QgYmUgdXNlZCBmb3Igc29tZSByZWFzb24sIHNvbWV0aGluZyBs
aWtlCj4gPj4KPiA+PiAgICAgIGlmICh1bmxpa2VseSgodW5zaWduZWQgbG9uZylyZW1haW4gPiBO
X1JFTE9DKFVMT05HX01BWCkpKQo+ID4+ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
Pgo+ID4+IHNob3VsZCBzaWxlbmNlIHRoZSB3YXJuaW5nLgo+ID4KPiA+IEkgZG8gbGlrZSB0aGlz
IG9uZSBiZXR0ZXIgdGhhbiB0aGUgZm9ybWVyLgo+Cj4gRldJVywgb25lIGRvd25zaWRlIG9mIHRo
aXMgb25lIGNvbXBhcmVkIHRvIGFsbCBhbHRlcm5hdGl2ZXMgKHByZXN1bWFibHkpCj4gaXMgdGhh
dCBpdCBtaWdodCBlbmQgdXAgZ2VuZXJhdGluZyBhY3R1YWwgY29kZSBldmVuIG9uIDY0LWJpdCwg
d2hpY2gKPiBhbHdheXMgZW5kcyB1cCBza2lwcGluZyB0aGUgcmV0dXJuLgoKVGhlIHdhcm5pbmcg
aXMgcG9pbnRpbmcgb3V0IHRoYXQgdGhlIGNvbmRpdGlvbmFsIGlzIGFsd2F5cyBmYWxzZSwKd2hp
Y2ggaXMgY29ycmVjdCBvbiA2NGIuICBUaGUgY2hlY2sgaXMgb25seSBhY3RpdmUgZm9yIDMyYi4K
aHR0cHM6Ly9nb2Rib2x0Lm9yZy96L29RcmdUXwpUaGUgY2FzdCBzaWxlbmNlcyB0aGUgd2Fybmlu
ZyBmb3IgNjRiLiAgKE5vdGUgdGhhdCBHQ0MgYW5kIENsYW5nIGFsc28KZ2VuZXJhdGUgcHJlY2lz
ZWx5IHRoZSBzYW1lIGluc3RydWN0aW9uIHNlcXVlbmNlcyBpbiBteSBleGFtcGxlLCBqdXN0CkdD
QyBkb2Vzbid0IHdhcm4gb24gc3VjaCB0YXV0b2xvZ2llcykuCi0tIApUaGFua3MsCn5OaWNrIERl
c2F1bG5pZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
