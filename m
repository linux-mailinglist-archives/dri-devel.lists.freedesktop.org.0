Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65312A77C4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 02:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3AA897EE;
	Wed,  4 Sep 2019 00:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E7D897EE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 00:12:39 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id y91so8625273ede.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 17:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTjuBkc+oWq17xqTxU6FgHpYQYtehLQoywSscUSeLK8=;
 b=qGRCawZKLNA+76hTfmJa7W0KP1XSsil62eKYgp+/7pfMF/q1EA8Rs/F/knuIKACuKP
 iMQ3cUJehxppaKI2onKxD6zmNWIkDe3Q3iC/T6Giqh8VF0qnKII91S7eHEvjv3nLUpqE
 6+/T0S+Cm5DtB6VyruXigB09FKWUcqUQk6eM+E+DhDo0P6kp2u07WPmVkun+DFjArSjs
 cBNa0Yx1ksQdTnibGIRR2esbO2WBTAyx8aSk3yLqsgNGO5djr30PK2MFrfmiVLfp0moQ
 F9bfyGQv9YEuz+i2mWAiK27DNqSC3V5EMZAGOAnJBkmIf8+sB3EmIVMlXVJQhOD9MVca
 vHmg==
X-Gm-Message-State: APjAAAXXx3dqZTS0go7qLq1OB/FSBDqocbThGUO+g6PFRsNdup+qh8b2
 Wj7r95eE+nVbiuWgEsFy8q2+OFRmx8PjDtt3wQ4=
X-Google-Smtp-Source: APXvYqwvnv6KovdUtqCRFvtQhQ76GcVDp4VlbUIVuEn3iC0LJGDkj4BT4buUBWdwXOVHfCQ5SEoH3gePM1aRcAG4dw0=
X-Received: by 2002:a17:906:c9c2:: with SMTP id
 hk2mr30298509ejb.164.1567555957490; 
 Tue, 03 Sep 2019 17:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
 <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
 <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
 <CAOMZO5C7m6ZfFVXna18ZSZDgiggyTygK5VXZLxkx5Hg6Sy6G4w@mail.gmail.com>
In-Reply-To: <CAOMZO5C7m6ZfFVXna18ZSZDgiggyTygK5VXZLxkx5Hg6Sy6G4w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Sep 2019 17:12:25 -0700
Message-ID: <CAF6AEGt5R34JBBY_X6kc5nSyGJexEy02ohijEtgoF=ff5o+-sQ@mail.gmail.com>
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CTjuBkc+oWq17xqTxU6FgHpYQYtehLQoywSscUSeLK8=;
 b=u2X1UXd3kKbIRV69AO/2vTxSnJ2E9I1fZrCn82Uh7M+a/3qYmmfmrd6rT6lnLQkAgd
 i5hb8rxZwG1F3NIhYgHuAe4aYNR6hc9dNPnj4wA0OpiVdNoeca5qyFkBiC9Q4UZpTKvN
 aoGoDz0+LV+swryq+BD8ZhvpTqNJ0aoeRwd6lbwQ1S2EeyXIOVKu/722ToqmbxxM5H/G
 vAuSW+DsS/PmXj1jqZy2DLPgpg9vjuNAOoDm0Y+1+jY9BIgee5m9ver8Vi+RLFayn3Ew
 s3iWPtY3ngI7su4JnQ9Ori4MdVQgHMsrr1U5vxKZ02NgmLg7uJHgz7+YPgNFJRIaJCIC
 m7Fg==
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>, Chris Healy <cphealy@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCAxMjozMSBQTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgSm9uYXRoYW4sCj4KPiBPbiBUdWUsIFNlcCAzLCAyMDE5
IGF0IDQ6MjUgUE0gSm9uYXRoYW4gTWFyZWsgPGpvbmF0aGFuQG1hcmVrLmNhPiB3cm90ZToKPiA+
Cj4gPiBIaSwKPiA+Cj4gPiBJIHRyaWVkIHRoaXMgYW5kIGl0IHdvcmtzIHdpdGggcGF0Y2hlcyA0
KzUgZnJvbSBSb2IncyBzZXJpZXMgYW5kCj4gPiBjaGFuZ2luZyBncHVtbXUgdG8gdXNlIHNnX3Bo
eXMoc2cpIGluc3RlYWQgb2Ygc2ctPmRtYV9hZGRyZXNzCj4gPiAoZG1hX2FkZHJlc3MgaXNuJ3Qg
c2V0IG5vdyB0aGF0IGRtYV9tYXBfc2cgaXNuJ3QgdXNlZCkuCj4KPiBUaGFua3MgZm9yIHRlc3Rp
bmcgaXQuIEkgaGF2ZW4ndCBoYWQgYSBjaGFuY2UgdG8gdGVzdCBpdCB5ZXQuCj4KPiBSb2IsCj4K
PiBJIGFzc3VtZSB5b3VyIHNlcmllcyBpcyB0YXJnZXRlZCB0byA1LjQsIGNvcnJlY3Q/CgptYXli
ZSwgYWx0aG91Z2ggQ2hyaXN0b3BoIEhlbGx3aWcgZGlkbid0IHNlZW0gbGlrZSBhIGJpZyBmYW4g
b2YKZXhwb3NpbmcgY2FjaGUgb3BzLCBhbmQgd291bGQgcmF0aGVyIGFkZCBhIG5ldyBhbGxvY2F0
aW9uIEFQSSBmb3IKdW5jYWNoZWQgcGFnZXMuLiBzbyBJJ20gbm90IGVudGlyZWx5IHN1cmUgd2hh
dCB0aGUgd2F5IGZvcndhcmQgd2lsbApiZS4KCkluIHRoZSBtZWFuIHRpbWUsIGl0IGlzIGEgYml0
IHVnbHksIGJ1dCBJIGd1ZXNzIHNvbWV0aGluZyBsaWtlIHRoaXMgc2hvdWxkIHdvcms6CgotLS0t
LS0tLS0tLS0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2Vt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYwppbmRleCA3MjYzZjQzNzNmMDcuLjVh
NmE3OWZiYzlkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKQEAgLTUyLDcgKzUyLDcgQEAgc3RhdGlj
IHZvaWQgc3luY19mb3JfZGV2aWNlKHN0cnVjdCBtc21fZ2VtX29iamVjdCAqbXNtX29iaikKIHsK
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtc21fb2JqLT5iYXNlLmRldi0+ZGV2OwoKLSAgICBp
ZiAoZ2V0X2RtYV9vcHMoZGV2KSkgeworICAgIGlmIChnZXRfZG1hX29wcyhkZXYpICYmIElTX0VO
QUJMRUQoQ09ORklHX0FSTTY0KSkgewogICAgICAgICBkbWFfc3luY19zZ19mb3JfZGV2aWNlKGRl
diwgbXNtX29iai0+c2d0LT5zZ2wsCiAgICAgICAgICAgICBtc21fb2JqLT5zZ3QtPm5lbnRzLCBE
TUFfQklESVJFQ1RJT05BTCk7CiAgICAgfSBlbHNlIHsKQEAgLTY1LDcgKzY1LDcgQEAgc3RhdGlj
IHZvaWQgc3luY19mb3JfY3B1KHN0cnVjdCBtc21fZ2VtX29iamVjdCAqbXNtX29iaikKIHsKICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtc21fb2JqLT5iYXNlLmRldi0+ZGV2OwoKLSAgICBpZiAo
Z2V0X2RtYV9vcHMoZGV2KSkgeworICAgIGlmIChnZXRfZG1hX29wcyhkZXYpICYmIElTX0VOQUJM
RUQoQ09ORklHX0FSTTY0KSkgewogICAgICAgICBkbWFfc3luY19zZ19mb3JfY3B1KGRldiwgbXNt
X29iai0+c2d0LT5zZ2wsCiAgICAgICAgICAgICBtc21fb2JqLT5zZ3QtPm5lbnRzLCBETUFfQklE
SVJFQ1RJT05BTCk7CiAgICAgfSBlbHNlIHsKLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkJSLAotUgoK
PiBJZiB0aGlzIGlzIHRoZSBjYXNlLCB3aGF0IHdlIHNob3VsZCBkbyBhYm91dCB0aGUgaS5NWDUg
cmVncmVzc2lvbiBvbiA1LjM/Cj4KPiBXb3VsZCBhIHJldmVydCBvZiB0aGUgdHdvIGNvbW1pdHMg
YmUgYWNjZXB0YWJsZSBpbiA1LjMgaW4gb3JkZXIgdG8KPiBhdm9pZCB0aGUgcmVncmVzc2lvbj8K
Pgo+IFBsZWFzZSBhZHZpc2UuCj4KPiBUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
