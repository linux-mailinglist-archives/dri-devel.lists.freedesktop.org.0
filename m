Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DF1CC602
	for <lists+dri-devel@lfdr.de>; Sun, 10 May 2020 03:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097CA6E3E3;
	Sun, 10 May 2020 01:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923F96E3E3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 01:31:01 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3367724955
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 01:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589074261;
 bh=ZFWESm7BCWR/1W4jYyjzg2GMZbin6TOpjGg+VzUNEZw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WixNi7vGq6fwF+jXK+YId/1rB8G+PTd4s4v9spXxhIej/fIqTIBM7l1xQ622g4SRs
 FJK4xHHtNzpB3AfmcDFaDThmjEcrTB2GPoJXeccEy7GlFLAUL4Jefturov6uDNdr0O
 F2R3x80oOncFEJNRshjB7qwvtjunQXppRuJOHWW0=
Received: by mail-ej1-f50.google.com with SMTP id pg17so4786691ejb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 18:31:01 -0700 (PDT)
X-Gm-Message-State: AGi0Pua7L7sI7odJ++fyD8Lgj3TYo3DxkFnepb6VMGcb3VrHB6TASDGS
 7wcW8GptLAqBU3XJS6hMi+y5IPuIX8MV75r84g==
X-Google-Smtp-Source: APiQypLLpbjrFxVDPm7x548/daha8AvlKc41zGr1ENz1S4CiuA/k3u8aVFCV/n89pbH/JXLI098lhHIujmbMaZ4UR7k=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr7553000ejb.293.1589074259573; 
 Sat, 09 May 2020 18:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200506124255.9477-1-bernard@vivo.com>
In-Reply-To: <20200506124255.9477-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 10 May 2020 09:30:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY__L44OeoDeyhbSRQRiTSksDsW-H5c0VZNv_1h7yXC3Oww@mail.gmail.com>
Message-ID: <CAAOTY__L44OeoDeyhbSRQRiTSksDsW-H5c0VZNv_1h7yXC3Oww@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: eliminate the magic number in array size
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NeaciDbml6Ug6YCx5LiJIOS4i+WNiDg6NDPlr6vpgZPvvJoKPgo+IEVpbWluYXRlIHRoZSBtYWdp
YyBudW1iZXIgaW4gYXJyYXkgc2l6ZSwgdGhlcmUgbWFjcm8gZGVmaW5lcyBpbgo+IGhkbWkuaC4K
CkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4
LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcKCj4KPiBT
aWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jCj4gaW5kZXggZmY0M2EzZDgwNDEwLi40Yzk2MmM3ZjA2ZTUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC05ODIsNyArOTgyLDcgQEAgc3Rh
dGljIGludCBtdGtfaGRtaV9zZXR1cF9hdmlfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRt
aSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJh
bWUgZnJhbWU7Cj4gLSAgICAgICB1OCBidWZmZXJbMTddOwo+ICsgICAgICAgdTggYnVmZmVyW0hE
TUlfSU5GT0ZSQU1FX0hFQURFUl9TSVpFICsgSERNSV9BVklfSU5GT0ZSQU1FX1NJWkVdOwo+ICAg
ICAgICAgc3NpemVfdCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGRybV9oZG1pX2F2aV9pbmZvZnJh
bWVfZnJvbV9kaXNwbGF5X21vZGUoJmZyYW1lLAo+IEBAIC0xMDA4LDcgKzEwMDgsNyBAQCBzdGF0
aWMgaW50IG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1p
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpw
cm9kdWN0KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaGRtaV9zcGRfaW5mb2ZyYW1lIGZyYW1lOwo+
IC0gICAgICAgdTggYnVmZmVyWzI5XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9GUkFN
RV9IRUFERVJfU0laRSArIEhETUlfU1BEX0lORk9GUkFNRV9TSVpFXTsKPiAgICAgICAgIHNzaXpl
X3QgZXJyOwo+Cj4gICAgICAgICBlcnIgPSBoZG1pX3NwZF9pbmZvZnJhbWVfaW5pdCgmZnJhbWUs
IHZlbmRvciwgcHJvZHVjdCk7Cj4gQEAgLTEwMzEsNyArMTAzMSw3IEBAIHN0YXRpYyBpbnQgbXRr
X2hkbWlfc2V0dXBfc3BkX2luZm9mcmFtZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksCj4gIHN0YXRp
YyBpbnQgbXRrX2hkbWlfc2V0dXBfYXVkaW9faW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRt
aSkKPiAgewo+ICAgICAgICAgc3RydWN0IGhkbWlfYXVkaW9faW5mb2ZyYW1lIGZyYW1lOwo+IC0g
ICAgICAgdTggYnVmZmVyWzE0XTsKPiArICAgICAgIHU4IGJ1ZmZlcltIRE1JX0lORk9GUkFNRV9I
RUFERVJfU0laRSArIEhETUlfQVVESU9fSU5GT0ZSQU1FX1NJWkVdOwo+ICAgICAgICAgc3NpemVf
dCBlcnI7Cj4KPiAgICAgICAgIGVyciA9IGhkbWlfYXVkaW9faW5mb2ZyYW1lX2luaXQoJmZyYW1l
KTsKPiAtLQo+IDIuMjYuMgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
