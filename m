Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E231C207
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 19:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49666E91C;
	Mon, 15 Feb 2021 18:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715989FC5;
 Mon, 15 Feb 2021 18:57:09 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id l3so8787091oii.2;
 Mon, 15 Feb 2021 10:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0af+WuSCKKu/Gkao8Lc4ne4kj0xNUEww6DlbPnUDKhk=;
 b=NMlT+kWg96hgUcvIJOoGgvLjN7FstIeFJZXWH4AdON1ltmrsIvqJtTblNzY+cDXA50
 bMHOG80pUsuXUz/impsrJWKpD45Dpwkx8N5Ki2ecqOVPeZK/+Qw8vwpxKkw1C1DJEpld
 zU85b/WZYSoDlIxkb3gVtx2X1f7VeCmA7t/oeOHjNfOxJ7d+zR8qNpIPsbJVEs0OzS9d
 CQh35RePwBFPiloBxtmXYK0YQA9Dyn4BD9N5jZlDCbsZHsm/OE7oTSjU3p8gN/y9AbMf
 tT5CAmSliQVpsukjSvD5crMVwqUEZUyqCBW6uKVSo4Sx8va53e3QFOiwGyrVvq2SXS9c
 3z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0af+WuSCKKu/Gkao8Lc4ne4kj0xNUEww6DlbPnUDKhk=;
 b=DJ7m/t+3qAvaV+B77M5yIZ95ZMqkc+fdboiDz72tuLA5xWfTix2dNJ3SI5Os/LYkT2
 SS2+U8FsMLUAZ/VY+UNRtgm1Y35T6eyehXnpFM6KD3aGIyvtTD6An/mnu22ULA05mJ6W
 WTHNB0+0JFihK28kKE/0z/eHM/ezVgZOYPMN9cHmXpaKPF6FJLr6D07TjEieH6aLNRNu
 W+6VOuc/WfVCGGamQaX3muuFDbuD45ZH4biNUC6UzNnJmboKQels46QIQTJiDaOd7w6D
 i4fXJTGKPhGB1YColuVYenbKbEEfUwsWYOh7PfKoDN7xTnGcNbtRQw2v28jgYFbau/eo
 sQQQ==
X-Gm-Message-State: AOAM5335Zpy8S0BQ6X/NLsQKfO36BVw9qnwFId+qjARBlkeSAuDPZUiR
 vLcnnPxBGMNSjOBkzFVfGx9lkYYakY0JbpxxMlk=
X-Google-Smtp-Source: ABdhPJxL6zZIj+6kyNCLjENdlwv2Lhea/JfbdHl6sy5eSywH4TjKjHKdnOun7wD6LEYknuJ/MBbSTUuCPUJfG61bVN0=
X-Received: by 2002:aca:5404:: with SMTP id i4mr190631oib.123.1613415429195;
 Mon, 15 Feb 2021 10:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20210210232600.GA66488@embeddedor>
In-Reply-To: <20210210232600.GA66488@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Feb 2021 13:56:58 -0500
Message-ID: <CADnq5_MSZJYLRJ-A8jAzUWAaK-7N46wj4BQk=FWxrBkDgbojbg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: Replace one-element array with
 flexible-array in struct _ATOM_Vega10_GFXCLK_Dependency_Table
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgNjozNiBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4g
dGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRvIGRlY2xhcmUgaGF2aW5nCj4gYSBkeW5hbWlj
YWxseSBzaXplZCBzZXQgb2YgdHJhaWxpbmcgZWxlbWVudHMgaW4gYSBzdHJ1Y3R1cmUuIEtlcm5l
bCBjb2RlCj4gc2hvdWxkIGFsd2F5cyB1c2Ug4oCcZmxleGlibGUgYXJyYXkgbWVtYmVyc+KAnVsx
XSBmb3IgdGhlc2UgY2FzZXMuIFRoZSBvbGRlcgo+IHN0eWxlIG9mIG9uZS1lbGVtZW50IG9yIHpl
cm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4KPiBVc2UgZmxl
eGlibGUtYXJyYXkgbWVtYmVyIGluIHN0cnVjdCBfQVRPTV9WZWdhMTBfR0ZYQ0xLX0RlcGVuZGVu
Y3lfVGFibGUsCj4gaW5zdGVhZCBvZiBvbmUtZWxlbWVudCBhcnJheS4KPgo+IEFsc28sIHRoaXMg
aGVscHMgd2l0aCB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZSAtV2FycmF5LWJvdW5kcyBh
bmQKPiBmaXggdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOiBJbiBmdW5jdGlvbiDi
gJh2ZWdhMTBfZ2V0X3BwX3RhYmxlX2VudHJ5X2NhbGxiYWNrX2Z1bmPigJk6Cj4gZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOjMx
MTM6MzA6IHdhcm5pbmc6IGFycmF5IHN1YnNjcmlwdCA0IGlzIGFib3ZlIGFycmF5IGJvdW5kcyBv
ZiDigJhBVE9NX1ZlZ2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9SZWNvcmRbMV3igJkge2FrYSDigJhz
dHJ1Y3QgX0FUT01fVmVnYTEwX0dGWENMS19EZXBlbmRlbmN5X1JlY29yZFsxXeKAmX0gWy1XYXJy
YXktYm91bmRzXQo+ICAzMTEzIHwgICAgIGdmeGNsa19kZXBfdGFibGUtPmVudHJpZXNbNF0udWxD
bGs7Cj4gICAgICAgfCAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+fgo+Cj4gWzFdIGh0
dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0ZsZXhpYmxlX2FycmF5X21lbWJlcgo+IFsyXSBo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjkvcHJvY2Vzcy9kZXByZWNhdGVkLmh0
bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVtZW50LWFycmF5cwo+Cj4gTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzc5Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29t
L0tTUFAvbGludXgvaXNzdWVzLzEwOQo+IEJ1aWxkLXRlc3RlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82
MDIzZmYzZC5XWTNzU0NrR1JRUGRQbFZvJTI1bGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5
OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+CgpBcHBsaWVkLiAg
VGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9wcHRhYmxlLmggfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9wcHRhYmxlLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfcHB0YWJsZS5oCj4gaW5kZXggYzkz
NGU5NjEyYzFiLi45YzQ3OWJkOWE3ODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3BwdGFibGUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9wcHRhYmxlLmgKPiBAQCAtMTYxLDkg
KzE2MSw5IEBAIHR5cGVkZWYgc3RydWN0IF9BVE9NX1ZlZ2ExMF9NQ0xLX0RlcGVuZGVuY3lfUmVj
b3JkIHsKPiAgfSBBVE9NX1ZlZ2ExMF9NQ0xLX0RlcGVuZGVuY3lfUmVjb3JkOwo+Cj4gIHR5cGVk
ZWYgc3RydWN0IF9BVE9NX1ZlZ2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9UYWJsZSB7Cj4gLSAgICBV
Q0hBUiB1Y1JldklkOwo+IC0gICAgVUNIQVIgdWNOdW1FbnRyaWVzOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogTnVtYmVyIG9mIGVudHJpZXMuICovCj4gLSAgICBB
VE9NX1ZlZ2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9SZWNvcmQgZW50cmllc1sxXTsgICAgICAgICAg
ICAvKiBEeW5hbWljYWxseSBhbGxvY2F0ZSBlbnRyaWVzLiAqLwo+ICsgICAgICAgVUNIQVIgdWNS
ZXZJZDsKPiArICAgICAgIFVDSEFSIHVjTnVtRW50cmllczsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLyogTnVtYmVyIG9mIGVudHJpZXMuICovCj4gKyAgICAgICBBVE9NX1Zl
Z2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9SZWNvcmQgZW50cmllc1tdOyAgICAgICAgIC8qIER5bmFt
aWNhbGx5IGFsbG9jYXRlIGVudHJpZXMuICovCj4gIH0gQVRPTV9WZWdhMTBfR0ZYQ0xLX0RlcGVu
ZGVuY3lfVGFibGU7Cj4KPiAgdHlwZWRlZiBzdHJ1Y3QgX0FUT01fVmVnYTEwX01DTEtfRGVwZW5k
ZW5jeV9UYWJsZSB7Cj4gLS0KPiAyLjI3LjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
