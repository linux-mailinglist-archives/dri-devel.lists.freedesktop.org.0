Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09B7BA68
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1B46E6A6;
	Wed, 31 Jul 2019 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE436E67F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:26:19 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id i1so16733052ybo.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 23:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xzym8/dUuXuGiOMMezN5bW3u98W2F4vTa3EFglwr9Xk=;
 b=Q9xqAemdzr+FH8iDI/vk9nQgwBMVAfVuyGtkEbnhvVPGCOPN8f3NXHIyZxGOcn0l3o
 3mHaQ30YVlfVrEPBqimNhFXE+E+WcINWxVCavTi4Zatlg0zUBiO5XGvC4VPFUDEDzYDI
 B3GaBnMWIZ3i3RyE9zOqrOek6b+66kALVqXVW26Qxmc/jVre5JiAzWT/zy4wEqdJ8IL4
 ySjf2bZ7eGJqHuDmUYPQHxZ5787CWcCHn083Ou18c44rv85pNfGMVfpU9eGfEJf3tf7q
 zo+s0szoUNbMvxVQxz/EGdNzSLfFegyGGVx6k+lGz0PhqYdGc5j4vMmwlRcV353lyE/G
 c6bg==
X-Gm-Message-State: APjAAAVdVffboga65nGHmwYN3dVpgaheV/8JQCRxiLK9vz4rZfu1FrDM
 /oszpIkJ5Ap+ssG26/rtD/FKZz0JiOHClCDAwqsFzsyr
X-Google-Smtp-Source: APXvYqznqG7aFgKm5YjjvnDVVr8TB+M8SM5D/aHXde0NAfY/K2gnyHYZcnpShx7xnGA1X0yvO1v57Q8hnjSJc9s9BNQ=
X-Received: by 2002:a25:830e:: with SMTP id s14mr74917205ybk.500.1564554378800; 
 Tue, 30 Jul 2019 23:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190731024533.22264-1-huangfq.daxian@gmail.com>
 <520bd0f7367e77ffd2e0150187f6ffb64b0e8b71.camel@perches.com>
In-Reply-To: <520bd0f7367e77ffd2e0150187f6ffb64b0e8b71.camel@perches.com>
From: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Wed, 31 Jul 2019 14:26:07 +0800
Message-ID: <CABXRUiSYbyb8+bsvCb_+n1kLEA_ZSFxR5D7c+qatrW9KPGmeqw@mail.gmail.com>
Subject: Re: [PATCH] drm: use trace_printk rather than printk in drm_dbg.
To: Joe Perches <joe@perches.com>
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xzym8/dUuXuGiOMMezN5bW3u98W2F4vTa3EFglwr9Xk=;
 b=RlfDdsWwTMhs4L47y3YvK1IPZw4kW+5WVucupuREnMgiVDQyq+AyL3EVp7fWh23/wG
 qABS5+Ebz42PHuy3fYI4w2XUSESBZJIykM24cdwR25y1KLutNJ8Zo72oaMmiB9RUhHkX
 B4L+kxotm1UTrBAuWrKKV/xSFhQVD+Sy5XaD50zRbR3fqgAiSb6pXERpm/Pfk1K4CH6Z
 zUh2+YiKza+gZE075cQjGveh6Iq1ud9e9wzHGkHkF5IpZyHOfQRld5tV0JxqPHI8X8TT
 2UsrEud3np2irIlQkjf1UD+qGxCiSINhcqJmspatsmCjrKglau8M5UdxGaRDnrQyIto6
 rU+g==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4g5pa8IDIwMTnlubQ35pyIMzHml6XpgLHkuIkg
5LiL5Y2IMjowNuWvq+mBk++8mgo+Cj4gT24gV2VkLCAyMDE5LTA3LTMxIGF0IDEwOjQ1ICswODAw
LCBGdXFpYW4gSHVhbmcgd3JvdGU6Cj4gPiBJbiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaWguYywKPiA+IGFtZGdwdV9paF9wcm9jZXNzIGNhbGxzIERSTV9ERUJVRyB3aGljaCBj
YWxscyBkcm1fZGJnIGFuZAo+ID4gZmluYWxseSBjYWxscyBwcmludGsuCj4gPiBBcyBhbWRncHVf
aWhfcHJvY2VzcyBpcyBjYWxsZWQgZnJvbSBhbiBpbnRlcnJ1cHQgaGFuZGxlciwKPiA+IGFuZCBp
bnRlcnJ1cHQgaGFuZGxlciBzaG91bGQgYmUgc2hvcnQgYXMgcG9zc2libGUuCj4gPgo+ID4gQXMg
cHJpbnRrIG1heSBsZWFkIHRvIGJvZ2dpbmcgZG93biB0aGUgc3lzdGVtIG9yIGNhbiBldmVuCj4g
PiBjcmVhdGUgYSBsaXZlIGxvY2suIHByaW50ayBzaG91bGQgbm90IGJlIHVzZWQgaW4gSVJRIGNv
bnRleHQuCj4gPiBJbnN0ZWFkLCB0cmFjZV9wcmludGsgaXMgcmVjb21tZW5kZWQuCj4gPiBMaW5r
OiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvMzY1ODM1Cj4gW10KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMK
PiBbXQo+ID4gQEAgLTIzNiw3ICsyMzYsNyBAQCB2b2lkIGRybV9kYmcodW5zaWduZWQgaW50IGNh
dGVnb3J5LCBjb25zdCBjaGFyICpmb3JtYXQsIC4uLikKPiA+ICAgICAgIHZhZi5mbXQgPSBmb3Jt
YXQ7Cj4gPiAgICAgICB2YWYudmEgPSAmYXJnczsKPiA+Cj4gPiAtICAgICBwcmludGsoS0VSTl9E
RUJVRyAiWyIgRFJNX05BTUUgIjolcHNdICVwViIsCj4gPiArICAgICB0cmFjZV9wcmludGsoS0VS
Tl9ERUJVRyAiWyIgRFJNX05BTUUgIjolcHNdICVwViIsCj4gPiAgICAgICAgICAgICAgX19idWls
dGluX3JldHVybl9hZGRyZXNzKDApLCAmdmFmKTsKPiA+Cj4gPiAgICAgICB2YV9lbmQoYXJncyk7
Cj4KPiBUaGlzIG1ha2VzIGFsbCA0MDAwKyBkcm1fZGJnL0RSTV9ERUJVRyB1c2VzIGVtaXQKPiBh
IHRyYWNlX3ByaW50ay4KPgo+IEkgc3VnZ2VzdCBpbnN0ZWFkIHlvdSBtYWtlIG9ubHkgdGhlIGlu
dGVycnVwdCB1c2VzCj4gdXNlIGEgZGlmZmVyZW50IGZ1bmN0aW9uIGFuZCBub3QgZHJtX2RiZy4K
Pgo+IE9yIG1heWJlIGFkZCBhbiBpbl9pbnRlcnJ1cHQoKSBjaGVjayBsaWtlCj4KPiAgICAgICAg
IGlmIChpbl9pbnRlcnJ1cHQoKSkKPiAgICAgICAgICAgICAgICAgcHJpbnRrKEtFUk5fREVCVUcg
ZXRjLi4uKQo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICB0cmFjZV9wcmludGsoZXRj
Li4uKQoKSSB3aWxsIHNlbmQgYSB2MiBwYXRjaCB0byBmaXggdGhpcy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
