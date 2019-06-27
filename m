Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005458458
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 16:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E9C6E42D;
	Thu, 27 Jun 2019 14:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E20F6E42D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:18:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u8so5871463wmm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 07:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eJFhUv3FFI86NgZfIhT7YM85+S7+brFLKrng6/DKBFY=;
 b=WCKcxpKvfKl1M/8SNrcOzpd3LJLnEXo7C6iKDJECQApBYBz5DbZseGiNkx+egzdDLY
 wwX5Eip/SFr6wYNYZ8HVmLA97Hc15j2OjO9Ms+TDH6ww11Ty3VPNINOxaMBW8qlXRoTZ
 BO2kYGNt625Q3pjnwM1hvTnkvOt0opbGk4BKmkxxC0EsX/RoQoiWFeM9m2MSFHsPmfbT
 FysraCkf5IkXIpNYkaKxHa+wy/NZI0t2rbNX8vhI9tiD6a4XxMu6UmwswnRH0g0w8UFK
 XKGOlK+ipQIHofZIogRRb9S6W9KHpmFIh3wjqACmd9FG2sf+s1wENIMp2PI7P6I2GU02
 vsYw==
X-Gm-Message-State: APjAAAX9Zeyz9I29g557eNhgtL1idjMhwoYf1FmxGmo+J36zneZnxE1Q
 2kQvIP/oJRx4eIv16M5UJAeeBqX21/LeKdkb9KHeZdeboSw=
X-Google-Smtp-Source: APXvYqz0paGYlQXryHjGXxF4De2tWeCa7C6LYTy7KQZzri/FXjtl9NaWYg9TI2kczqGuzlHEh86okL7OHxTPSjNgFEM=
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr3591515wme.67.1561645130899; 
 Thu, 27 Jun 2019 07:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190626212212.25b41df4@canb.auug.org.au>
 <20190627133527.391ed0a1@canb.auug.org.au>
In-Reply-To: <20190627133527.391ed0a1@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Jun 2019 10:18:38 -0400
Message-ID: <CADnq5_MOb2Fg+S4igqUrtFrmd3xVHtaLZGc02nu-m=Jn-TVtBw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eJFhUv3FFI86NgZfIhT7YM85+S7+brFLKrng6/DKBFY=;
 b=k8KUZC0oV2wZ90NxHf7cJ7xBj6bE/MhH6EPsjYEz/IkPymiX6h2Cm4Dfue3Y9Yfx0S
 iQMtZiPqVdhEiSHCzHV8IDIDKazVSHe+YMBLsKc49HNiZnB031jvBgibbBHSoR7sM8EX
 PDmCjxY4brrvwch9MStB82V8iFo0zjdjs1mjGmxHXhQZvUzVte7vVm6EmxW5t9qdZdlC
 DZNbHR1guHmGFa5AATQcRHG5waDLh4FvMPhPWj9CF44M0A9JMD1CqKobV3uXejWPJW2F
 3NGNwl2QIFO7rLldx0SJSDYVwcYaGw/IA9lT/0SNiBYApQmpguGoeOhdyKJCYNT3HpjC
 Sx6w==
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
Cc: Dave Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6MzUgUE0gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwKPgo+IE9uIFdlZCwgMjYgSnVuIDIw
MTkgMjE6MjI6MTIgKzEwMDAgU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+
IHdyb3RlOgo+ID4KPiA+IEhpIEFsZXgsCj4gPgo+ID4gQWZ0ZXIgbWVyZ2luZyB0aGUgYW1kZ3B1
IHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAocG93ZXJwYwo+ID4gYWxseWVzY29uZmln
KSBmYWlsZWQgbGlrZSB0aGlzOgo+ID4KPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYzoyNToKPiA+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jOiBJbiBmdW5jdGlvbiAnZ2Z4X3YxMF8wX2NwX2dmeF9yZXN1
bWUnOgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmM6MjYyODoyNzog
ZXJyb3I6ICdDUF9SQjFfQ05UTF9fQlVGX1NXQVBfTUFTSycgdW5kZWNsYXJlZCAoZmlyc3QgdXNl
IGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ0NQX1JCX0NOVExfX0JVRl9TV0FQX01B
U0snPwo+ID4gICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfUkIxX0NOVEwsIEJVRl9TV0FQ
LCAxKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+Cj4gPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaDoxMDY3OjM2OiBub3RlOiBpbiBkZWZpbml0
aW9uIG9mIG1hY3JvICdSRUdfRklFTERfTUFTSycKPiA+ICAjZGVmaW5lIFJFR19GSUVMRF9NQVNL
KHJlZywgZmllbGQpIHJlZyMjX18jI2ZpZWxkIyNfTUFTSwo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYzoyNjI4Ojg6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnUkVHX1NFVF9GSUVM
RCcKPiA+ICAgdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQX1JCMV9DTlRMLCBCVUZfU1dBUCwg
MSk7Cj4gPiAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jOjI2Mjg6Mjc6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVy
IGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4g
PiAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBDUF9SQjFfQ05UTCwgQlVGX1NXQVAsIDEpOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KPiA+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oOjEwNjc6MzY6IG5vdGU6IGluIGRlZmluaXRpb24gb2Yg
bWFjcm8gJ1JFR19GSUVMRF9NQVNLJwo+ID4gICNkZWZpbmUgUkVHX0ZJRUxEX01BU0socmVnLCBm
aWVsZCkgcmVnIyNfXyMjZmllbGQjI19NQVNLCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
OjI2Mjg6ODogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdSRUdfU0VUX0ZJRUxEJwo+ID4g
ICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfUkIxX0NOVEwsIEJVRl9TV0FQLCAxKTsKPiA+
ICAgICAgICAgXn5+fn5+fn5+fn5+fgo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmM6MjYyODoyNzogZXJyb3I6ICdDUF9SQjFfQ05UTF9fQlVGX1NXQVBfX1NISUZUJyB1
bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnQ1Bf
UkIwX0NOVExfX0JVRl9TV0FQX19TSElGVCc/Cj4gPiAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1w
LCBDUF9SQjFfQ05UTCwgQlVGX1NXQVAsIDEpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oOjEw
NjY6Mzc6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gJ1JFR19GSUVMRF9TSElGVCcKPiA+
ICAjZGVmaW5lIFJFR19GSUVMRF9TSElGVChyZWcsIGZpZWxkKSByZWcjI19fIyNmaWVsZCMjX19T
SElGVAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgo+ID4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmM6MjYyODo4OiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8gJ1JFR19TRVRfRklFTEQnCj4gPiAgIHRtcCA9IFJFR19TRVRfRklFTEQo
dG1wLCBDUF9SQjFfQ05UTCwgQlVGX1NXQVAsIDEpOwo+ID4gICAgICAgICBefn5+fn5+fn5+fn5+
Cj4gPgo+ID4gQ2F1c2VkIGJ5IGNvbW1pdAo+ID4KPiA+ICAgYTY0NGQ4NWE1Y2Q0ICgiZHJtL2Ft
ZGdwdTogYWRkIGdmeCB2MTAgaW1wbGVtZW50YXRpb24gKHYxMCkiKQo+ID4KPiA+IEkgaGF2ZSBk
aXNhYmxlZCB0aGF0IGRyaXZlciBmb3IgdG9kYXkuICBQbGVhc2UgbGV0IG1lIGtub3cgd2hlbiBp
dCBpcwo+ID4gZml4ZWQgc28gdGhhdCBJIGNhbiBlbmFibGUgaXQgYWdhaW4uCj4KPiBJIGFzc3Vt
ZSB0aGF0IHRoaXMgaGFzIG5vdyBiZWVuIGluaGVyaXRlZCBieSB0aGUgZHJtIHRyZWUgKHNpbmNl
IHRoZXJlCj4gaGFzIGJlZW4gbm8gZml4KS4gIFNvIHRoZSBBTURfR1BVIGRyaXZlciB3aWxsIHN0
aWxsIGJlIGRpc2FibGVkIGluCj4gbGludXgtbmV4dCB0b2RheSBhcyBvZiB0aGUgZHJtIHRyZWUg
bWVyZ2UuCgpGaXhlZCBpbiB0aGlzIHBhdGNoOgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvMzE0NTI3Lz9zZXJpZXM9NjI4NjYmcmV2PTEKCkFsZXgKCj4KPiAtLQo+IENo
ZWVycywKPiBTdGVwaGVuIFJvdGh3ZWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
