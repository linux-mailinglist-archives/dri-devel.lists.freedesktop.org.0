Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBAEE13D7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805AD89C6E;
	Wed, 23 Oct 2019 08:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7AE89C6E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 08:16:18 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x3so16646682oig.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 01:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvLb09uYoUD5JN3nIaVCZPM65f/MJPN9T/Jdc09H/00=;
 b=pRHGfw1wGKUdpeAD4urprDTdNGn7nsLVkBEjU0OJ31o8U3ETiMhbnlYXjvB7E5z6c4
 cSLXPy3SYZRnj+ZOClH37y4LWFN4y9Cy6c7KMsY10KKD29ERlUyk3bPhPFY1EfPxAhVQ
 Zq+jFF07TKG6W9cyXEN8n9fnufHa8ZuWnK41fHgIntABcKvfIO9Xpd0tZQFLMdnLr0PI
 FE9Ynv78VK0QFfuq4aVpi95PYvFkr01P2lteP08qjn2MqTGBboSUj7t2s1YPS1snQq+V
 FPtD0OyhliNT6wTe3ziSDSXsEktQYbEcMbuQMhS5oDXIsaJHcNtr8ZzBgwyz49d66B1S
 noWA==
X-Gm-Message-State: APjAAAWwUMu1Qy45W1SqAfbujv718PDjF4Lwz8jIXakGnpR58QZ48W0I
 mAOEojfSirpk9jaujlnlO1NFbeYB5+doXkdgZR/jlQ==
X-Google-Smtp-Source: APXvYqwp5jsjKg8uMFEm4kTJL9EFLWSJeU0kQtc5+hnC+Y1M/Vn3/VN/8gtmymthZCHgGwdF+99B/CRsbjrV07NbE3E=
X-Received: by 2002:aca:3a55:: with SMTP id h82mr6719571oia.128.1571818578002; 
 Wed, 23 Oct 2019 01:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <1571806802-17987-1-git-send-email-bhanusreemahesh@gmail.com>
In-Reply-To: <1571806802-17987-1-git-send-email-bhanusreemahesh@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 23 Oct 2019 10:16:06 +0200
Message-ID: <CAKMK7uG5Ux897aXtrEtfE4KHK29Y-0FD4C==gV-Ar2niigucfA@mail.gmail.com>
Subject: Re: [PATCH] drm/gpu: Add comment for memory barrier
To: Bhanusree <bhanusreemahesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pvLb09uYoUD5JN3nIaVCZPM65f/MJPN9T/Jdc09H/00=;
 b=K40DbZaYnVP6+sIGk/tfV/NgmNzJHsNSHLEKFvhDUl813tmdIntJVPgoDCyREuWINo
 XqTcmJXcFsIEN74QusaN4N66Sq4/i7oBjKNfrYWoLXnKzS1vpC14r7WNItyxPHCUUkdy
 pOkAtx4afkqYsyOPbiGt6qJj2bdnptvEhB970=
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgNzowMCBBTSBCaGFudXNyZWUgPGJoYW51c3JlZW1haGVz
aEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gLUFkZCBjb21tZW50IGZvciBtZW1vcnkgYmFycmllcgo+
IC1Jc3N1ZSBmb3VuZCB1c2luZyBjaGVja3BhdGNoLnBsCj4KPiBTaWduZWQtb2ZmLWJ5OiBCaGFu
dXNyZWUgPGJoYW51c3JlZW1haGVzaEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fY2FjaGUuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2Fj
aGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYwo+IGluZGV4IDNiZDc2ZTkuLjM5OTEw
ZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jYWNoZS5jCj4gQEAgLTYyLDEwICs2MiwxMCBAQCBzdGF0aWMgdm9p
ZCBkcm1fY2FjaGVfZmx1c2hfY2xmbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZXNbXSwKPiAgewo+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBpOwo+Cj4gLSAgICAgICBtYigpOwo+ICsgICAgICAgbWIoKTsg
LyptYWtlIHN1cmUgcGFnZSBhZGRyZXNzIGlzIHJlYWQqLwoKVGhhdCdzIG5vdCB3aGF0J3MgZ29p
bmcgb24gaGVyZS4gV2UgbmVlZCB0aGUgYmFycmllcnMgYmVjYXVzZToKLSBjbGZsdXNoIGlzIGFu
IHVub3JkZXJlZCBpbnN0cnVjdGlvbiAodmVyeSByYXJlIG9uIHg4NiwgYnV0IHRoZXkgZXhpc3Qp
Ci0gaGVuY2Ugd2UgbmVlZCB0IGhhdmUgYSBiYXJyaWVyIGJlZm9yZSZhZnRlciB0byBtYWtlIHN1
cmUgdGhlIGNsZmx1c2gKYWN0dWFsbHkgaGFwcGVucyB3aGVuIHdlIHdhbnQgaXQgdG8gaGFwcGVu
LgotIGNsZmx1c2ggZmx1c2hlcyB0aGUgY3B1IGNhY2hlLCBfdGhhdF8gaXMgd2hhdCB3ZSB3YW50
IHRvIHN5bmNocm9uaXplCmFnYWluc3QuIG5vdCB0aGUgbWVtb3J5IGFkZHJlc3MgaXRzZWxmLiBI
ZW5jZSB3ZSBuZWVkIHRvIG1ha2Ugc3VyZQp0aGF0IGJlZm9yZSBhbGwgcmVhZHMvd3JpdGVzIGhh
dmUgaGl0IHRoZSBjcHUgY2FjaGUsIGFuZCBhZnRlcndhcmRzCnRoYXQgYWxsIHRoZSBjYWNoZSBs
aW5lcyB3ZSB3YW50ZWQgdG8gZmx1c2ggYXJlIGZsdXNoZWQuCi0gaHR0cHM6Ly9jOXgubWUveDg2
L2h0bWwvZmlsZV9tb2R1bGVfeDg2X2lkXzMwLmh0bWwgZm9yIG1vcmUgaW5mbyBvbiBjbGZsdXNo
CgpTbyB1c2VmdWwgY29tbWVudCAoc2VlIGFsc28gdGhlIGxpbmspIHdvdWxkIGJlOgoKLyogQ0xG
TFVTSCBpcyBvbmx5IG9yZGVyZWQgd2l0aCBhIGZ1bGwgbWVtb3J5IG1iYXJyaWVyIChNRkVOQ0UK
aW5zdHJ1Y3Rpb24pIGJlZm9yZSAuLi4qLwoKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBudW1f
cGFnZXM7IGkrKykKPiAgICAgICAgICAgICAgICAgZHJtX2NsZmx1c2hfcGFnZSgqcGFnZXMrKyk7
Cj4gLSAgICAgICBtYigpOwo+ICsgICAgICAgbWIoKTsgLyptYWtlIHN1cmUgYWxsIGFkZHJlc3Nl
cyBvZiBwYWdlcyBhcmUgcmVhZCBzZXF1ZW50aWFsbHkqLwoKLyogLi4uIGFuZCBhZnRlciB0aGUg
Q0xGTFVTSCBpbnN0cnVjdGlvbiBpdHNlbGYgKi8KCklmIHlvdSBkaWcgdGhyb3VnaCBhbGwgdGhl
IG1hY3JvcyBmb3IgbWIoKSBldmVudHVhbGx5IHlvdSBzaG91bGQgZmluZAp0aGUgaW5saW5lIGFz
c2VtYmxlciBmb3IgTUZFTkNFLiBUaGF0J3MgYWxzbyB3aHkgd2UgbmVlZCB0byBoYXZlIHRoaXMK
YmFycmllciBldmVuIG9uIHNpbmdsZS1wcm9jZXNzb3IgYnVpbGRzIChzbyBubyBzbXBfbWIoKSku
CgpDYW4geW91IHBscyByZXNwaW4/CgpUaGFua3MsIERhbmllbAo+ICB9Cj4gICNlbmRpZgo+Cj4g
LS0KPiAyLjcuNAo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
