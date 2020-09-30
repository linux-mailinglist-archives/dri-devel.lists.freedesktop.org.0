Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3427DE96
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 04:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA236E4CA;
	Wed, 30 Sep 2020 02:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A796E4CA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:50:28 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id lo4so570197ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 19:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dEgZ9Px7d9DMiyN8GNGV730mtI30RJInot+Gt8gMC7M=;
 b=szt328sTHVBZn5OgUVwGmNxfzdj4N/ujIb3U5FUQ01fv3TJRpoXagWlWEObToFPQCS
 B6mjZf6jLugOhTNVyrT/Qe85gjo8P3RKxMBiUmBQfupwL7S6eHs/YRtgxQZnVRnhr8ow
 DX1SRVwYZ23UYJHB4ULhDaCXxkuovkZ7hcfjBB7VQGJJtsFTUPu0wkTjwpjEPNFIqXYr
 kkU7D/L0Ed958GzAhb1+U/JoQp1jlYqAq+vjW9s5VkZhYswqctA74SCPgyXMJq0h9DCx
 xNRaX6EVDjNGV+UO+9Gve1jr/qQ90j4Go3YWGeADjwcyKLXIG0pJqQ05iGolPf3e7A4T
 u3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dEgZ9Px7d9DMiyN8GNGV730mtI30RJInot+Gt8gMC7M=;
 b=ctWSMw9efWO3LYiKxTd56zvtxv6ZeaPyaOQnhsJ0dIaukKbNn02vxAWHm4xXP8qgv4
 p5xwcvySJzoFCNxh3+aMY97m+9dBBKAB4hTHU1/3zRr6hm63IOVA2m481k76jw3Y+1Cm
 3bS3jxWfWR1lFIxoIZcqb+I3TtgKFxXq4Y/ver4QKdaZYjKcP9qCOKEcvfLh18pA83Xr
 tax71XYcV6hVw3FyM+X25yN6WdTO+dmCcmMVxP9zMABLUUNQdZEd/ZmCjIXUKoYjWAWD
 zkTdgSXm/6jzv01wLZ9TQown31o42Yriz+O4ksTGeswcojdTxWh9N43bbBI6B3I8u5l/
 XqIg==
X-Gm-Message-State: AOAM531TLmVgLDjeRjsSCLCz3fsC8Nm53RRqtHvdh2n1vMuWCpzoraW+
 23tf4oTbnYyG7ouuqQo8SOdagSXOUr/bzHY53CE=
X-Google-Smtp-Source: ABdhPJyxWRztB/Ru+kOajIZ1oAYueo+WWTHA2nWaPsZ0dAAR5BWo/GvK2XNz5brKT1325NQsaePePQDKLfXE6ANktOY=
X-Received: by 2002:a17:906:d787:: with SMTP id
 pj7mr653044ejb.340.1601434226715; 
 Tue, 29 Sep 2020 19:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200930020738.786609-1-airlied@gmail.com>
 <FA4856C5-AB9D-454D-96EE-AE60AFDAD06A@vmware.com>
In-Reply-To: <FA4856C5-AB9D-454D-96EE-AE60AFDAD06A@vmware.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Sep 2020 12:50:15 +1000
Message-ID: <CAPM=9tw+jVJvcLnqGDhsqXB4x8RtXgoN6Ym=3yWXAGm-2fc7NA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: return value from inserting in thp mode.
To: Zack Rusin <zackr@vmware.com>
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "rscheidegger.oss@gmail.com" <rscheidegger.oss@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzMCBTZXAgMjAyMCBhdCAxMjoxNywgWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNv
bT4gd3JvdGU6Cj4KPgo+ID4gT24gU2VwIDI5LCAyMDIwLCBhdCAyMjowNywgRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWly
bGllZEByZWRoYXQuY29tPgo+ID4KPiA+IFRoaXMgc2VlbXMgdG8gZml4IHRoZSBmYWlsdXJlIEkn
bSBzZWVpbmcgd2l0aCA1LjktcmM3IHVuZGVyCj4gPiB2bXBsYXllci4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiBkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90aHAuYyB8IDIgKy0KPiA+IDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90aHAuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X3RocC5jCj4gPiBpbmRleCBiN2M4MTZiYTcxNjYuLmM4YjkzMzViY2NkOCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3RocC5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90aHAuYwo+ID4gQEAgLTk1LDcgKzk1LDcgQEAg
c3RhdGljIGludCB2bXdfdGhwX2dldF9ub2RlKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAq
bWFuLAo+ID4gICAgICAgICAgICAgICBtZW0tPnN0YXJ0ID0gbm9kZS0+c3RhcnQ7Cj4gPiAgICAg
ICB9Cj4gPgo+ID4gLSAgICAgcmV0dXJuIDA7Cj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4gfQo+
Cj4gVGhhdOKAmXMgcGFydCBvZiBpdC4gUm9sYW5kLCBoYXMgYSBwYXRjaCBmcm9tIG1lIGluIGhp
cyB0cmVlIHRoYXQgZml4ZXMgaXQuIFJvbGFuZCwgY2FuIHlvdSBwbGVhc2Ugc3VibWl0IGl0IHRv
IERhdmUgZm9yIG1lcmdlPwo+CgpQbGVhc2UgQVNBUC4gSSdtIHRyeWluZyB0byB0ZXN0IFRUTSBj
aGFuZ2VzLCBzbyBJJ2QgbGlrZSB0byBrbm93IEkndmUKaGFkIGEgc3RhYmxlIGJhc2UgaGVyZS4K
CkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
