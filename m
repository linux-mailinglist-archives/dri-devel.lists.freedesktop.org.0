Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FED9701
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 18:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373AC6E9A1;
	Wed, 16 Oct 2019 16:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C7F6E9A1;
 Wed, 16 Oct 2019 16:22:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v17so3428290wml.4;
 Wed, 16 Oct 2019 09:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l/TRSD+YkWPaNUUn33x7sao3wMEgezx4EPVX8O4dORw=;
 b=hpcHs+pguzCWVb0sS7Hq4qW1Yclh+tfBY6JDEVBOSc6yqizVtVZfHSbBFHVG1niWNC
 LGCccdmRFQFaptOONtP1w7wq81HhM0gNAsa4zIjDun2kGtg+5NH+DAZTPzSkHADBvwvh
 PfraCOuDXOGSpusSheMUh3ycXgd3J89zNCtzW8A1q/5JtvLtXsxkarQv2y06kIp2nfK9
 pw8qLOv/zE6FIkjxjurUfKUZqUaUtjgQCJWXeDU4cqpu65d98uD4LHAN98JKtLPM+0an
 /Rtt/4dbyNSCaNi9rl7iVYugc4iyX8zKLWno6Hk/6aAhEgswpvVri0F1v6RVSaMvTkdZ
 FybQ==
X-Gm-Message-State: APjAAAXMUpLPj3Lgbhl771sjziE18GswGnyAV5xMGGSU0zg8QEcWtQ3N
 P+SJ7IExs8/Lufag+Ol5HOtw3l5fy/e/K5wpklk=
X-Google-Smtp-Source: APXvYqxfjSJnIf2HAoJqhYgjYiqvi3mdiZMozruMItnEd9McAZs3QLLYtUdqBaWHzBEfWer05MBD9psE9paKR+HKLDw=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr4412507wmb.127.1571242928310; 
 Wed, 16 Oct 2019 09:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191016112207.1ade14af@canb.auug.org.au>
In-Reply-To: <20191016112207.1ade14af@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Oct 2019 12:21:55 -0400
Message-ID: <CADnq5_OG5B6TJzkCwdLjR17G-7JEgf90pyC6NRCsjS7TZf8YBg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=l/TRSD+YkWPaNUUn33x7sao3wMEgezx4EPVX8O4dORw=;
 b=bckKbSoF+xwh3uLEe632e7xuUyKCRII4rfj1izMdfWtvt46KNOmXLb7S7QUiQQTXJy
 uW8wrd9/NBR3Qq1F0RJcG8JHjuw7c/+Z6ndq+BDzbc4KF2ve4G9+sjuIGT52zjA0tUJq
 BbkwlOPoBhg5svDSEdAIrXWLvIm3fFAUPy0tKQfWBpChhUSg55zlPkphHfXktZ+0QJWa
 iNcGbZxcxPA65yup7kbiFp0JxUhRyeN5e/svFSXjJMLOWern68JL5QPEyssbyxWG0LwS
 GyOvDyRbQn6+vrRbbgi17g70YiA12z+eywYrJjRrpfJzW1lnkCQrwLmmND9GL4257l8r
 KPWA==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDg6MjIgUE0g
U3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+Cj4gSGkgYWxs
LAo+Cj4gQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLW1pc2MgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0
IGJ1aWxkICh4ODZfNjQKPiBhbGxtb2Rjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6Cj4KPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmM6MjM6MTA6IGZhdGFsIGVycm9yOiBk
cm0vZHJtUC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgMjMgfCAjaW5jbHVkZSA8
ZHJtL2RybVAuaD4KPiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fgo+Cj4gQ2F1c2VkIGJ5
IGNvbW1pdAo+Cj4gICA0ZTk4Zjg3MWJjZmYgKCJkcm06IGRlbGV0ZSBkcm1QLmggKyBkcm1fb3Nf
bGludXguaCIpCj4KPiBpbnRlcmFjdGluZyB3aXRoIGNvbW1pdAo+Cj4gICA4YjhjMjk0YzVkMzcg
KCJkcm0vYW1kZ3B1OiBhZGQgZnVuY3Rpb24gdG8gY2hlY2sgdG16IGNhcGFiaWxpdHkgKHY0KSIp
Cj4KPiBmcm9tIHRoZSBhbWRncHUgdHJlZS4KPgo+IEkgYXBwbGllZCB0aGUgZm9sbG93aW5nIG1l
cmdlIGZpeCBwYXRjaCBmb3IgdG9kYXkgKHdoaWNoIHNob3VsZCBhbHNvCj4gYXBwbHkgdG8gdGhl
IGFtZGdwdSB0cmVlKS4KPgo+IEZyb206IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcu
b3JnLmF1Pgo+IERhdGU6IFdlZCwgMTYgT2N0IDIwMTkgMTE6MTc6MzIgKzExMDAKPiBTdWJqZWN0
OiBbUEFUQ0hdIGRybS9hbWRncHU6IGZpeCB1cCBmb3IgYW1kZ3B1X3Rtei5jIGFuZCByZW1vdmFs
IG9mIGRybS9kcm1QLmgKPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBj
YW5iLmF1dWcub3JnLmF1Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdG16LmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdG16LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMKPiBp
bmRleCAxNGE1NTAwM2RkODEuLjgyMzUyN2EwZmE0NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdG16LmMKPiBAQCAtMjAsNyArMjAsMTAgQEAKPiAgICogT1RIRVIgREVB
TElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+ICAgKi8KPgo+IC0jaW5jbHVkZSA8ZHJtL2RybVAuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICsKPiArI2luY2x1ZGUgPGRybS9hbWRfYXNp
Y190eXBlLmg+Cj4gKwo+ICAjaW5jbHVkZSAiYW1kZ3B1LmgiCj4gICNpbmNsdWRlICJhbWRncHVf
dG16LmgiCj4KPiAtLQo+IDIuMjMuMAo+Cj4gLS0KPiBDaGVlcnMsCj4gU3RlcGhlbiBSb3Rod2Vs
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
