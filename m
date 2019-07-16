Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E6F6AD4A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 19:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D6288F1E;
	Tue, 16 Jul 2019 17:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2EE88F1E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 17:01:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17347807-1500050 for multiple; Tue, 16 Jul 2019 17:59:19 +0100
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190716164221.15436-2-robdclark@gmail.com>
References: <20190716164221.15436-1-robdclark@gmail.com>
 <20190716164221.15436-2-robdclark@gmail.com>
Message-ID: <156329635647.9436.7142001798245279241@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 2/2] drm/vgem: use normal cached mmap'ings
Date: Tue, 16 Jul 2019 17:59:16 +0100
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMDctMTYgMTc6NDI6MTUpCj4gRnJvbTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFNpbmNlIHRoZXJlIGlzIG5vIHJlYWwgZGV2
aWNlIGFzc29jaWF0ZWQgd2l0aCB2Z2VtLCBpdCBpcyBpbXBvc3NpYmxlIHRvCj4gZW5kIHVwIHdp
dGggYXBwcm9wcmlhdGUgZGV2LT5kbWFfb3BzLCBtZWFuaW5nIHRoYXQgd2UgaGF2ZSBubyB3YXkg
dG8KPiBpbnZhbGlkYXRlIHRoZSBzaG1lbSBwYWdlcyBhbGxvY2F0ZWQgYnkgdmdlbS4gIFNvLCBh
dCBsZWFzdCBvbiBwbGF0Zm9ybXMKPiB3aXRob3V0IGRybV9jZmx1c2hfcGFnZXMoKSwgd2UgZW5k
IHVwIHdpdGggY29ycnVwdGlvbiB3aGVuIGNhY2hlIGxpbmVzCj4gZnJvbSBwcmV2aW91cyB1c2Fn
ZSBvZiB2Z2VtIGJvIHBhZ2VzIGdldCBldmljdGVkIHRvIG1lbW9yeS4KPiAKPiBUaGUgb25seSBz
YW5lIG9wdGlvbiBpcyB0byB1c2UgY2FjaGVkIG1hcHBpbmdzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAtLS0KPiBQb3NzaWJseSB3ZSBj
b3VsZCBkbWFfc3luY18qX2Zvcl97ZGV2aWNlLGNwdX0oKSBvbiBkbWFidWYgYXR0YWNoL2RldGFj
aCwKPiBhbHRob3VnaCB0aGUgLT5nZW1fcHJpbWVfe3Bpbix1bnBpbn0oKSBBUEkgaXNuJ3QgcXVp
dGUgaWRlYWwgZm9yIHRoYXQgYXMKPiBpdCBpcy4gIEFuZCB0aGF0IGRvZXNuJ3QgcmVhbGx5IGhl
bHAgZm9yIGRyaXZlcnMgdGhhdCBkb24ndCBhdHRhY2gvCj4gZGV0YWNoIGZvciBlYWNoIHVzZS4K
PiAKPiBCdXQgQUZBSUNUIHZnZW0gaXMgbWFpbmx5IHVzZWQgZm9yIGRtYWJ1ZiB0ZXN0aW5nLCBz
byBtYXliZSB3ZSBkb24ndAo+IG5lZWQgdG8gY2FyZSB0b28gbXVjaCBhYm91dCB1c2Ugb2YgY2Fj
aGVkIG1tYXAnaW5ncy4KClNhZGx5IHRoaXMgcmVncmVzc2VzIHdpdGggaTkxNSBpbnRlcm9wLgoK
U3RhcnRpbmcgc3VidGVzdDogNEtpQi10aW55LXZnZW0tYmx0LWVhcmx5LXJlYWQtY2hpbGQKKGdl
bV9jb25jdXJyZW50X2JsaXQ6ODMwOSkgQ1JJVElDQUw6IFRlc3QgYXNzZXJ0aW9uIGZhaWx1cmUg
ZnVuY3Rpb24gZG1hYnVmX2NtcF9ibywgZmlsZSAuLi90ZXN0cy9pOTE1L2dlbV9jb25jdXJyZW50
X2FsbC5jOjQwODoKKGdlbV9jb25jdXJyZW50X2JsaXQ6ODMwOSkgQ1JJVElDQUw6IEZhaWxlZCBh
c3NlcnRpb246IHZbKCh5KSooYi0+d2lkdGgpICsgKCgoeSkgKyBwYXNzKSUoYi0+d2lkdGgpKSld
ID09IHZhbAooZ2VtX2NvbmN1cnJlbnRfYmxpdDo4MzA5KSBDUklUSUNBTDogZXJyb3I6IDAgIT0g
MHhkZWFkYmVlZgoKYW5kIGlndC9wcmltZV92Z2VtCgpDYW4geW91IHBsZWFzZSBjYyBpbnRlbC1n
Znggc28gQ0kgY2FuIHBpY2sgdXAgdGhlc2UgY2hhbmdlcz8KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
