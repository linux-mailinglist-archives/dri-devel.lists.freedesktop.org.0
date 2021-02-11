Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253233190E9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 18:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B318E6E3D0;
	Thu, 11 Feb 2021 17:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612946E3D0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 17:22:57 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id q4so5842404otm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 09:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bqd9qGZaexiIQNqrsno9HS2pI7qikrVpmA3lH+Y0LDk=;
 b=eQTvdVDYACJ/N2l4uMXz/fzng3NkvOsj3tNm8dLXa3CqkFKlCAT/ZZR3yXgJVvhUhz
 KgTQOM/9dVw4Uk78jdzaJ7VQobTh/bQfbWnGyhsCJ2rlNXdpXjsbQrmyRhQA4NGhWpxU
 agx+neQha/On5AKaucnI7BATHpka78TcS1VWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bqd9qGZaexiIQNqrsno9HS2pI7qikrVpmA3lH+Y0LDk=;
 b=A1AP0HiTUlFshoSTrctXLkGJ5k1ViyMmX4onfpg+1EQIzRKVXpBsEEwnZ7qOsslDvN
 oFOwUlcA6fKUXXS51zLHjJs18kQCwKC+gwp0lFzlIlE9n6T8TTp54dkcXvw0Q8GBw2Q1
 7rKZRYKSdPLxa8C7GqLT2rfuZeqdowCWRFTpKNUUf0G5ZTtSopuL/VxpK43jnKHmcvDq
 G5ioVAXYDudAnIthpdkdDZjnyimJhKD1NCaltVIrDhn6SH3GrdWSRzKM9FC94n3ocgsp
 XydhUR25ExxuVVOQVSz+dA1cIRibqTAbJxwBzepdPHuX8EjjP+UxSKTXrrlmjY7JvKDK
 T6FQ==
X-Gm-Message-State: AOAM5328F+g2IINP28KLbcDlaGT9OqPRbu9oYA6ty9IjyK3lYPDsrKQ1
 OoMdK5Mbv1fB4LJsfajBehzb3q1PGjtPnSNrsjDa425OfH3vPw==
X-Google-Smtp-Source: ABdhPJwycinxSV+ITNBSHA4rqTchp4IfJwF+7aazowMLxc77nRYRYhPRGY57KnYEwOKzAPAdBNk7z+6kkb42gzrgt0M=
X-Received: by 2002:a9d:2270:: with SMTP id o103mr6271092ota.303.1613064175256; 
 Thu, 11 Feb 2021 09:22:55 -0800 (PST)
MIME-Version: 1.0
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
 <87o8gqd4vw.fsf@intel.com>
 <3b20fc5a-e6ff-d1f9-a4f6-6b5c21ca94fc@amd.com>
In-Reply-To: <3b20fc5a-e6ff-d1f9-a4f6-6b5c21ca94fc@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 11 Feb 2021 18:22:42 +0100
Message-ID: <CAKMK7uEAMST0dOzFDuRYoDh=QgGDQm-7qepfaF+wAnJwbSTGzw@mail.gmail.com>
Subject: Re: Not 100% sure if I correctly fixed drm-tip
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMTEsIDIwMjEgYXQgNDoyNyBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4KPgo+IEFtIDExLjAyLjIxIHVtIDE2OjAyIHNj
aHJpZWIgSmFuaSBOaWt1bGE6Cj4gPiBPbiBUaHUsIDExIEZlYiAyMDIxLCBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4+IEhpIGd1eXMsCj4gPj4K
PiA+PiBJIGhhZCBhIGNvbmZsaWN0IHRoaXMgbW9ybmluZyBpbiB0aGUgdHRtIHBvb2wgd2hpbGUg
cHVzaGluZyBhbiBpbXBvcnRhbnQKPiA+PiBmaXggdG8gZHJtLW1pc2MtZml4ZXMuCj4gPj4KPiA+
PiBJJ20gbm90IDEwMCUgc3VyZSBpZiBJIGNvcnJlY3RseSBmaXhlZCB1cCBkcm0tdGlwLiBIb3cg
Y2FuIHRoaXMgYmUKPiA+PiBkb3VibGUgY2hlY2tlZD8gQW5kIGhvdyBjYW4gaXQgYmUgZml4ZWQg
aWYgdGhlIG1lcmdlIGhhcyBnb25lIGJhZD8KPiA+IEknbSBhZnJhaWQgdGhlcmUncyBhIHByb2Js
ZW07IGJiNTJjYjBkZWM4ZCAoImRybS90dG06IG1ha2UgdGhlIHBvb2wKPiA+IHNocmlua2VyIGxv
Y2sgYSBtdXRleCIpIGluIHVwc3RyZWFtIGFuZCBkcm0tbWlzYy1maXhlcyBjcmVhdGVzIGEgc2ls
ZW50Cj4gPiBjb25mbGljdCB3aXRoIGJhMDUxOTAxZDEwZiAoImRybS90dG06IGFkZCBhIGRlYnVn
ZnMgZmlsZSBmb3IgdGhlIGdsb2JhbAo+ID4gcGFnZSBwb29scyIpIGluIGRybS1taXNjLW5leHQs
IGNhdXNpbmcgdGhlIGxhdHRlciB0byB1c2UKPiA+IHNwaW5fbG9jay91bmxvY2sgb24gYSBtdXRl
eC4KPiA+Cj4gPiBCdXQgd2hpbGUgeW91IGhpdCBhIGNvbmZsaWN0LCBpdCBkb2VzIGxvb2sgbGlr
ZSB0aGUgY29uZmxpY3QgYnJlYWtpbmcKPiA+IHRoZSBidWlsZCBpcyBzaWxlbnQsIEFGQUlDVCB0
aGUgc3BpbmxvY2sgcGFydCBkb2VzIG5vdCBjb25mbGljdC4gU28gYQo+ID4gZml4dXAgcGF0Y2gg
aW4gZHJtLXJlcmVyZSBpcyBwcm9iYWJseSBuZWVkZWQgdW50aWwgdGhlcmUgYXJlIHNvbWUKPiA+
IGJhY2ttZXJnZXMuCj4KPiBXZWxsIGV4YWN0bHkgdGhhdCdzIHRoZSBpc3N1ZS4gSSd2ZSBhbHJl
YWR5IGhhZCBhIGZpeHVwIGluIGRybS1yZXJlcmUKPiBmb3IgdGhpcy4KPgo+IEJ1dCB0b2RheSBJ
J3ZlIHB1c2hlZCBhbm90aGVyIGZpeCB0byBkcm0tbWlzYy1maXhlcyB3aGljaCBhbHNvIGNvbmZs
aWN0cwo+IHdpdGggYmEwNTE5MDFkMTBmICgiZHJtL3R0bTogYWRkIGEgZGVidWdmcyBmaWxlIGZv
ciB0aGUgZ2xvYmFsIHBhZ2UgcG9vbHMiKS4KPgo+IEkndmUgZml4ZWQgdGhpcyB1cCBhcyB3ZWxs
IGFuZCBjb21taXR0ZWQgdGhlIHNvbHV0aW9uLiBCdXQgZGltIHRoZW4KPiBjb21wbGFpbmVkIHRo
YXQgdGhlIG9yaWdpbmFsIGZpeHVwIGlzIG5vdyBub3QgYXBwbGljYWJsZSBhbnkgbW9yZSAod2hp
Y2gKPiBpcyB0cnVlIGFzIGZhciBhcyBJIGtub3cpLgo+Cj4gVGhpcyBzb21laG93IHdlbnQgYXdh
eSB3aGVuIEkgc2FpZCB0aGF0IGRpbSBzaG91bGQgYXNzdW1lIHBhdGNoCj4gcmV2ZXJzYWwsIGJ1
dCBJJ20gbm90IHN1cmUgaWYgdGhhdCdzIHRoZSByaWdodCB0aGluZyB0byBkby4KCk5vdGhpbmcs
IGl0J3MgYWxsIHN0aWxsIGJyb2tlbi4gWW91IG5lZWQgdG8gZGVsZXRlIHRoZSBub3cgdW5lY2Vz
c2FyeQpmaXh1cC4gQXMgYSBydWxlLCB3aGVuIHJlYnVpbGRpbmcgZHJtLXRpcCBmYWlsZWQgYWx3
YXlzIHRyeSBhZ2FpbiB0bwpjb25maXJtIHRoYXQgd2hhdCB5b3UndmUgZG9uZSBhY3R1YWxseSBm
aXhlZCB0aGluZ3MgKHNpbmNlIHNvbWV0aW1lcwpnaXQgY2FuIGFsc28gbm90IHJlbWVtYmVyIHdo
ZXJlIHRvIGFwcGx5IHRoZSByZXNvbHV0aW9uIGZvciBzb21lIG9kZApyZWFzb25zKS4KCkknbSBm
aXhpbmcgdGhpcyBub3cuCi1EYW5pZWwKCj4KPiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+Cj4gPgo+
ID4KPiA+IEJSLAo+ID4gSmFuaS4KPiA+Cj4gPgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
