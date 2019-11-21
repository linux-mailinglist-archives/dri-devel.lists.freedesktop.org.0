Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67331059AC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 19:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B7A6F4C3;
	Thu, 21 Nov 2019 18:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898C16F4C3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 18:37:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z7so2271958wrl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DP2863yACbff5i+RB3eZcwhNt5zRZsKWECbY34JBcgA=;
 b=hi2Sf8/TI/VoMDPnUUCsRNyQ9HbkjHt919MYfvM335jNOhw1Sxo/PSI5FwDDHm1MTf
 BonR+oAarAJlKklimrdxY4GTae4vIoD4IWs0ZX5oAKCsOYIflsCkLynvhnZtPH+/J6mB
 15ivbRQ8T12qO+cALUVSLJI2xmn3zlB1J7Rvk+nx5qkq5HM9wj3fURRw9m/DVN1ls1Lh
 wSG4Q71rVdWowifqxNJwdeKnqRPbc/eqWHzYwA5ewCc37UK/ONOwBCYD4SZR9aoOW8/z
 tb6eMMCaxHoVf6tEz43JTtaIK6Qh3ivtNQddISwFMoWXS0b2AJjRj4wCrO1/yts69zN0
 ecEg==
X-Gm-Message-State: APjAAAWlvOtYC/VXM97BaEhQcUbI/+hPeaM5mc/cvjj7jhaEpwWetyzH
 UXNTMMP4kRPC8Y1Byc529P7ZRI5T0mOlzG6JoG8=
X-Google-Smtp-Source: APXvYqw0gk8+IPXr82CnrP23ZVlU698/XaqMec5S9dwPM2xvZo/BgowQ0jIeqLBr0yaDtAygzcPKTGG5mcm9rFvHOmU=
X-Received: by 2002:a5d:4688:: with SMTP id u8mr12610035wrq.40.1574361441116; 
 Thu, 21 Nov 2019 10:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20191121145403.46789cb5@canb.auug.org.au>
In-Reply-To: <20191121145403.46789cb5@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Nov 2019 13:37:09 -0500
Message-ID: <CADnq5_O+J3pVR_SxP8cYnkwJo9LK8uQTXrFtpMbz9c8NYmOGnA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DP2863yACbff5i+RB3eZcwhNt5zRZsKWECbY34JBcgA=;
 b=TqCL0T6NAWRZxDvpie2AstfsSje6ENUuHqVWYhyMpDwMihvL3IVbv4lfh7bRYOxeDC
 OAm9kjeRqp63n1gZP92JqXyABQxJk8jE6A53cdPJQrQkGj33N9Ero1yWvfbsVVKFNa8/
 YPYJQDJuUetzBzUj/8coik4Q2EvmX5srQLQ+1B0pTx5XmNqsfKW8hPG9ErbIBTwhBj+F
 xUHwgCmXC8zwX+oKI5OGaLs4sumgIvpTk1LNPiHa7slWqezoG6W0nFdpwkkepiyeWUs/
 ob5zd1b/O3gBtP8EUCPpmOaj+AFABXFnyEyDUpJX7Lu6aADQ/QfrLWZzDLiw7isPBCdJ
 mMqw==
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
Cc: Peter Zijlstra <peterz@infradead.org>, Kevin Wang <kevin1.wang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTA6NTQgUE0gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gQWZ0ZXIgbWVyZ2luZyB0aGUg
dGlwIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0IGFsbG1vZGNvbmZpZykK
PiBmYWlsZWQgbGlrZSB0aGlzOgo+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvdHJh
Y2UvZGVmaW5lX3RyYWNlLmg6MTAyLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHJhY2UuaDo1MDIsCj4gICAgICAgICAgICAgICAgICBm
cm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZV9wb2ludHMuYzoyOToK
PiBpbmNsdWRlL3RyYWNlLy4uLy4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
cmFjZS5oOjQ3Njo1MjogZXJyb3I6IGV4cGVjdGVkIGV4cHJlc3Npb24gYmVmb3JlICc7JyB0b2tl
bgo+ICAgNDc2IHwgICAgICAgICBfX3N0cmluZyhyaW5nLCBzY2hlZF9qb2ItPmJhc2Uuc2NoZWQt
Pm5hbWUpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXgo+IGluY2x1ZGUvdHJhY2UvdHJhY2VfZXZlbnRzLmg6NDM1OjI6IG5vdGU6
IGluIGRlZmluaXRpb24gb2YgbWFjcm8gJ0RFQ0xBUkVfRVZFTlRfQ0xBU1MnCj4gICA0MzUgfCAg
dHN0cnVjdCAgICAgICAgXAo+ICAgICAgIHwgIF5+fn5+fn4KPiBpbmNsdWRlL3RyYWNlL3RyYWNl
X2V2ZW50cy5oOjc3Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnUEFSQU1TJwo+ICAg
IDc3IHwgICAgICAgICBQQVJBTVModHN0cnVjdCksICAgICAgICAgXAo+ICAgICAgIHwgICAgICAg
ICBefn5+fn4KPiBpbmNsdWRlL3RyYWNlLy4uLy4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90cmFjZS5oOjQ3MjoxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ1RSQUNF
X0VWRU5UJwo+ICAgNDcyIHwgVFJBQ0VfRVZFTlQoYW1kZ3B1X2liX3BpcGVfc3luYywKPiAgICAg
ICB8IF5+fn5+fn5+fn5+Cj4gaW5jbHVkZS90cmFjZS8uLi8uLi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHJhY2UuaDo0NzU6Njogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
ICdUUF9TVFJVQ1RfX2VudHJ5Jwo+ICAgNDc1IHwgICAgICBUUF9TVFJVQ1RfX2VudHJ5KAo+ICAg
ICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4KPiBDYXVzZWQgYnkgY29tbWl0Cj4KPiAgIDJj
MmZkYjhiY2EyOSAoImRybS9hbWRncHU6IGZpeCBhbWRncHUgdHJhY2UgZXZlbnQgcHJpbnQgc3Ry
aW5nIGZvcm1hdCBlcnJvciIpCj4KPiBmcm9tIHRoZSBkcm0gdHJlZSBpbnRlcmFjdGluZyB3aXRo
IGNvbW1pdAo+Cj4gICA2MGZkYWQwMDgyN2MgKCJmdHJhY2U6IFJld29yayBldmVudF9jcmVhdGVf
ZGlyKCkiKQo+Cj4gZnJvbSB0aGUgdGlwIHRyZWUuCj4KPiBJIGhhdmUgYWRkZWQgdGhlIGZvbGxv
d2luZyBtZXJnZSBmaXggcGF0Y2g6CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPgo+IEZyb206
IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IERhdGU6IFRodSwgMjEg
Tm92IDIwMTkgMTQ6NDY6MDAgKzExMDAKPiBTdWJqZWN0OiBbUEFUQ0hdIG1lcmdlIGZpeCBmb3Ig
ImZ0cmFjZTogUmV3b3JrIGV2ZW50X2NyZWF0ZV9kaXIoKSIKPgo+IFNpZ25lZC1vZmYtYnk6IFN0
ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHJhY2UuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHJhY2UuaAo+IGluZGV4IGY5NDA1MjZjNTg4OS4uNjNlNzM0YTEyNWZiIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKPiBAQCAtNDcz
LDcgKzQ3Myw3IEBAIFRSQUNFX0VWRU5UKGFtZGdwdV9pYl9waXBlX3N5bmMsCj4gICAgICAgICAg
ICAgVFBfUFJPVE8oc3RydWN0IGFtZGdwdV9qb2IgKnNjaGVkX2pvYiwgc3RydWN0IGRtYV9mZW5j
ZSAqZmVuY2UpLAo+ICAgICAgICAgICAgIFRQX0FSR1Moc2NoZWRfam9iLCBmZW5jZSksCj4gICAg
ICAgICAgICAgVFBfU1RSVUNUX19lbnRyeSgKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF9fc3RyaW5nKHJpbmcsIHNjaGVkX2pvYi0+YmFzZS5zY2hlZC0+bmFtZSk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfX3N0cmluZyhyaW5nLCBzY2hlZF9qb2ItPmJhc2Uuc2NoZWQt
Pm5hbWUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2ZpZWxkKHVpbnQ2NF90LCBp
ZCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZmllbGQoc3RydWN0IGRtYV9mZW5j
ZSAqLCBmZW5jZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZmllbGQodWludDY0
X3QsIGN0eCkKPiAtLQo+IDIuMjMuMAo+Cj4gLS0KPiBDaGVlcnMsCj4gU3RlcGhlbiBSb3Rod2Vs
bAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
