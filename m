Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E762C2C73
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0A46E488;
	Tue, 24 Nov 2020 16:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E0A6E488;
 Tue, 24 Nov 2020 16:12:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p19so2354960wmg.0;
 Tue, 24 Nov 2020 08:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cQHz4OVR739zwNES/8J50WC7NsAjzj5OIMmr/Jzv4QE=;
 b=ImbVpBGlG4hg9rU3HPv8rI53cXcpsM/EWXoa7Xooo6XIZXGhqkvuUSzbUGcG+erfPM
 ly4Mrszc/wKqjCk6Q2F7dog1bCuRtmci7uyWrPX+MqrJbIaguIzyBmp0HTRwArOyxa6q
 H9FzkoD89zxjwipG7cWymeQ8EejGXmHN+AOg1snNJ55YGAJkRtDnRrKw50KwtCPSsEXX
 06nYYVxfaIWPI53pR3wbcD0G1MFYUdHa/8LsJaYHpfszYMM1CUKVYbJDakoBcMnIEBxr
 trNbq0mgC0EKQ8H4XcYZrtUM1IRCWWZJhL9/3MnZJThpXR98JSz20HBMzs2NQtlkYZ1y
 aIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cQHz4OVR739zwNES/8J50WC7NsAjzj5OIMmr/Jzv4QE=;
 b=sEMKlPmoG4S6NUZTxj0cHsFlnUXXUV7JmPjKVi8GAnSbA6e5cIaAMaDAZoKrA4WanD
 /XUTPnlNwiKzNaqXvmk03Ks3ZXPqb/Bchg9Ii5MNbhZ8t/U05tK2Rk0j1r1ArXHVSxHk
 9FlHKXuDqKxWbHMPvTz5JJ8raiPKewmjhkaJ75H1N8HqdjKuDG0O1eWlBA+9MLvMv7Ix
 40os6BRHgNus6ckXW4kFku02TBA+KXvtcg8aoRt7lNhggsh3Y4SKUfA+as7GurzNjyn6
 O83XFQ/PkFFjH74l63zWrIixXrBKbWZnOrcvA1z6Cz0pZdSII3aRVbj786XLBd4d2oD+
 pKFg==
X-Gm-Message-State: AOAM53030VLokbKG7RNcFLcViL0x+i7mM/6sM6u4QpIfhvY8kKYZ3+PL
 +bMV+gy9Ev8ZZFaUZ+EzeHiG2i9AJQF+vFAsdDQ=
X-Google-Smtp-Source: ABdhPJwD8IyowhIYRqZII2g1HWePbg2xvy5Ec1D2IrSi0hVC9dUtfvGE9Njtgv6yU+WbjxItaoBGuwwDI9D6C4epdg4=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr5235248wmb.56.1606234346379; 
 Tue, 24 Nov 2020 08:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-25-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-25-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:12:15 -0500
Message-ID: <CADnq5_MhNj7X3mOiBGX0AcDbmRALOafzfUCBGuLU6hW_WXOt6Q@mail.gmail.com>
Subject: Re: [PATCH 24/40] drm/amd/include/navi10_ip_offset: Mark top-level
 IP_BASE as __maybe_unused
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9uYXZpMTBfcmVnX2luaXQuYzoyNzoKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vaW5jbHVkZS9uYXZpMTBfaXBfb2Zmc2V0Lmg6MTI3OjI5OiB3YXJuaW5nOiDigJhVTUNf
QkFTReKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+
ICAxMjcgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgVU1DX0JBU0UgPXsgeyB7IHsgMHgw
MDAxNDAwMCwgMCwgMCwgMCwgMCwgMCB9IH0sCj4gIHwgXn5+fn5+fn4KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9uYXZpMTBfaXBfb2Zmc2V0Lmg6MTA5OjI5OiB3YXJu
aW5nOiDigJhSU01VX0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0
LXZhcmlhYmxlPV0KPiAgMTA5IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIFJTTVVfQkFT
RSA9IHsgeyB7IHsgMHgwMDAxMjAwMCwgMCwgMCwgMCwgMCwgMCB9IH0sCj4gIHwgXn5+fn5+fn5+
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvbmF2aTEwX2lwX29mZnNl
dC5oOjYxOjI5OiB3YXJuaW5nOiDigJhGVVNFX0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgNjEgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQ
X0JBU0UgRlVTRV9CQVNFID17IHsgeyB7IDB4MDAwMTc0MDAsIDAsIDAsIDAsIDAsIDAgfSB9LAo+
ICB8IF5+fn5+fn5+fgo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEwX2lwX29mZnNldC5oIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEwX2lwX29mZnNl
dC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMF9pcF9vZmZzZXQuaAo+IGlu
ZGV4IGQ0YTlkZGM3NzgyZmYuLmQ2ODI0YmI2MTM5ZGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMF9pcF9vZmZzZXQuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvaW5jbHVkZS9uYXZpMTBfaXBfb2Zmc2V0LmgKPiBAQCAtMzEsNyArMzEsNyBAQCBz
dHJ1Y3QgSVBfQkFTRV9JTlNUQU5DRSB7Cj4KPiAgc3RydWN0IElQX0JBU0Ugewo+ICAgICAgICAg
c3RydWN0IElQX0JBU0VfSU5TVEFOQ0UgaW5zdGFuY2VbTUFYX0lOU1RBTkNFXTsKPiAtfTsKPiAr
fSBfX21heWJlX3VudXNlZDsKPgo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBBVEhV
Ql9CQVNFICAgICAgICAgICAgPXsgeyB7IHsgMHgwMDAwMEMwMCwgMCwgMCwgMCwgMCwgMCB9IH0s
Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
