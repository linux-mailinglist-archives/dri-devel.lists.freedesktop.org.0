Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CD2CD991
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 15:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDE56EB79;
	Thu,  3 Dec 2020 14:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5DD6EB79
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:52:27 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id l10so572797ooh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 06:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BUnz/kAVGyPkvTW11igQHMR0usHZUVg78lAyQt9UXso=;
 b=Ddq+B/Ez1ATfGHcV3A4Bu1RbkbUKqvZsK4a+vREXtgora+39sgjfwu/kEuK7Wvi7cF
 coxolNqDbtV6lVJLRLbFdPrCS6H/JVbeappKd3Su1vUl47dxJOiM/AHPWA+7slbYWTqe
 v85VH7/ulyzGp/OOOD8z2Vn0/Cq5mx2l6EExM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BUnz/kAVGyPkvTW11igQHMR0usHZUVg78lAyQt9UXso=;
 b=BYMq1tJ/0UJRKUxbJS+MCgYv/fRln54dpYpFVBgdxDLNR54vkxTU8Qb1xEGjVFl0BZ
 MbA92CBvFKHxcY98hyWwC/OM7YnAw4oBO1EKyM9hyVRzeDA9WnC6CuB5Ly2rxqxVxFXk
 l6qtz00vfcpCJmWlTgqRYYXfx4ufMym+cdhBawCa9zPR4J1kbGIoE1P7lhA8lXZ0VMVA
 C0KemaLJGnSET/B6yXmGkNQWQKXdXhehkSB2PswLdoL1IQUDFek612l0FbsI+nM4wgrO
 KuCRec+5ke2N+rTeAu0x4AwqGYShmhzGNbTFv0DWLHstgmicWI2qPZVOuXiam0P8I61y
 necg==
X-Gm-Message-State: AOAM530gEX4Vyah0vzW8HdtKDVkcDZLTgwLzZvTiuDgEGuJCvHVxSnb6
 JZsBrD8sAgn4gHqu4K1iWkFrct2baUEoZ6XYqEKiYA==
X-Google-Smtp-Source: ABdhPJxKINpMIP9YJyDA/KRyyUFIuBVxyI01ANydQ1fb4Jv70svuqJxi1cKnGsenMO9r1QlakBzfqLC0jPMy2brV2Bw=
X-Received: by 2002:a4a:8582:: with SMTP id t2mr2338706ooh.89.1607007145621;
 Thu, 03 Dec 2020 06:52:25 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
In-Reply-To: <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Dec 2020 15:52:14 +0100
Message-ID: <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMywgMjAyMCBhdCA5OjE4IEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+IHdyb3RlOgo+Cj4gT24gMjAyMC0xMi0wMiA4OjQ3IHAubS4sIEphbWVzIFBhcmsg
d3JvdGU6Cj4gPgo+ID4gSWYgd2UncmUgdHJ5aW5nIHRvIGN1dCB0aWVzIHdpdGggdGhlIGRybS11
YXBpIGZvbGRlciBlbnRpcmVseSwgdGhlIHN0dWZmCj4gPiBhY19zdXJmYWNlLmMgbmVlZCBpbmNs
dWRlcyB0aGUgQU1EX0ZNVF9NT0Qgc3R1ZmYgaW4gZHJtX2ZvdXJjYy5oLAo+ID4gYW5kIEFNREdQ
VV9USUxJTkdfKiB1bmRlciBhbWRncHVfZHJtLmguIElzIHRoZXJlIGEgYmV0dGVyIHNwb3QgZm9y
IHRoZXNlCj4gPiBkZWZpbml0aW9ucz8KPgo+IFRoZSBNZXNhIHNyYy9hbWQvIGNvZGUgc2hvdWxk
IHVzZSBwbGF0Zm9ybS1uZXV0cmFsIGFic3RyYWN0aW9ucyBmb3IKPiB0aGVzZS4gVGhpcyB3YXNu
J3QgZGVlbWVkIG5lY2Vzc2FyeSBiZWZvcmUsIGJlY2F1c2Ugbm9ib2R5IHdhcyB0cnlpbmcgdG8K
PiBidWlsZCB0aGVzZSBkcml2ZXJzIGZvciBub24tVU5JWCBPU2VzLiBCdXQgbm93IHlvdSBhcmUu
CgpJIHRoaW5rIHRoYXQncyBhIGJpdCBtdWNoIGJ1c3kgd29yayBmb3Igbm90IG11Y2ggZ2Fpbi4g
ZHJtX2ZvdXJjYy5oIGlzCmV2ZW4gaW5jbHVkZWQgYXMgdGhlIG9mZmljaWFsIHNvdXJjZSBvZiB0
cnV0aCBvZiBzb21lIGtociBleHRlbnNpb25zLAptYWtpbmcgdGhhdCBoZWFkZXIgc3RhbmQtYWxv
bmUgYW5kIHVzZWFibGUgY3Jvc3MtcGxhdGZvcm0gc291bmRzIGxpa2UKYSBnb29kIGlkZWEgdG8g
bWUuIFNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyBpcyBpbW8gcGVyZmVjdGx5IGZpbmU6CgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJt
L2RybV9mb3VyY2MuaAppbmRleCBjYTQ4ZWQwZTZiYzEuLjBhMTIxYjNlZmI1OCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9k
cm1fZm91cmNjLmgKQEAgLTI0LDcgKzI0LDExIEBACiNpZm5kZWYgRFJNX0ZPVVJDQ19ICiNkZWZp
bmUgRFJNX0ZPVVJDQ19ICgorI2lmbmRlZiBEUk1fRk9VUkNDX1NUQU5EQUxPTkVfCisvKiBpbmNs
dWRlIHRoZSBsaW51eCB1YXBpIHR5cGVzIGhlcmUgKi8KKyNlbHNlCiNpbmNsdWRlICJkcm0uaCIK
KyNlbmRpZgoKI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpCmV4dGVybiAiQyIgewoKCkNoZWVycywg
RGFuaWVsCgo+Cj4KPiAtLQo+IEVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KPiBMaWJyZSBzb2Z0d2FyZSBlbnRo
dXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
