Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64702152EA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441B89BFE;
	Mon,  6 Jul 2020 07:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0654D89BFE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 07:13:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z13so39614220wrw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 00:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RMGnvxquvbu4QyMyyHqPaCsBLX3LZtSdXGrqjMwfS7E=;
 b=AAikv23ZIqKM8pfJvjReSBC3OGv4L4hsLmToMzvt7T4/lJmoiQ+k4CdAGRb0cV7S2W
 5X8g98k0ELBNX7r3ltxzvzV7Us/w7LOjcAmp/SXbx8utOSJSEuFc7U0259FgO+PDubaM
 k24kALm57sxDO8COLitP2s3SUPG757vsPnwL9+lCTMT28+RB1XbGNbSOw46k+xJDdaBB
 VuFjAMTV3L6YEJCKAgb19Z1QDdVmigQUrNGym9PJiCpMP5CfkmNXCk2xvhJegjTQQ3vX
 WUTgp7t8gDULlaBYcJc9JBvRnTkdKprktwjq6xQVSs0pSfm931CCLVe8qirXmhGyS+aQ
 R6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RMGnvxquvbu4QyMyyHqPaCsBLX3LZtSdXGrqjMwfS7E=;
 b=MEa7U+tyNgwZ68QYTfz+YxewIgsdA5sU6e8/+nlcfjOS259ioXyHbWPMMxtW6pSm+6
 G2ty+p50CHAlIjUwtHZ0pFjb1h9ZW5CEMfUB5dlwWDEUpRr1VO97mcyHCUSndCtlDwAk
 +5G7npP4/7xYKFzaZgIQOeE1gIxYC4OwzTmg58QYyUzTO2y2wnniOObZDRwQxYDfg6On
 VkeJz31ST7F0TJP4vplOSdmijmYmK16Cmryxu9fu0oH0qaQhC6FBJuoDn4RwtDIL4A+W
 PaNukAIMYKTqxtRGObkK2gstACfJAmqdTJTYzsFh5Rbt94j5Ef6ZZ8jZpLFwApmnfrVt
 uV0w==
X-Gm-Message-State: AOAM532mBUBfjarNqWlE9j5HWN6VdOxJ4DEw/V/gXSaD2/lhD8jIehTP
 mqEmlwTWHmO0KkDqkZf57OtT1A==
X-Google-Smtp-Source: ABdhPJzbRa4dAsAzugKpjzOIhWptwA1zAERFnuxhOgrcEveqI1bRWNiT7yGNRTf9jNNznRD5lbePTw==
X-Received: by 2002:adf:ed02:: with SMTP id a2mr46518594wro.110.1594019605697; 
 Mon, 06 Jul 2020 00:13:25 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id d13sm22969218wrq.89.2020.07.06.00.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 00:13:24 -0700 (PDT)
Date: Mon, 6 Jul 2020 08:13:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 5/8] backlight: ili922x: Add missing kerneldoc
 description for ili922x_reg_dump()'s arg
Message-ID: <20200706071322.GB2821869@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-6-lee.jones@linaro.org>
 <20200625094318.h6t22gkgi5d7wbv4@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625094318.h6t22gkgi5d7wbv4@holly.lan>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Software Engineering <sbabic@denx.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdW4gMjAyMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBXZWQsIEp1
biAyNCwgMjAyMCBhdCAwMzo1NzoxOFBNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBLZXJu
ZWxkb2Mgc3ludGF4IGlzIHVzZWQsIGJ1dCBub3QgY29tcGxldGUuICBEZXNjcmlwdGlvbnMgcmVx
dWlyZWQuCj4gPiAKPiA+IFByZXZlbnRzIHdhcm5pbmdzIGxpa2U6Cj4gPiAKPiA+ICBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmM6Mjk4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdzcGknIG5vdCBkZXNjcmliZWQgaW4gJ2lsaTkyMnhfcmVnX2R1bXAnCj4g
PiAKPiA+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiA+IENjOiBCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gPiBDYzogU29mdHdhcmUg
RW5naW5lZXJpbmcgPHNiYWJpY0BkZW54LmRlPgo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2lsaTkyMnguYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmMg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmMKPiA+IGluZGV4IGNkNDE0MzNiODdh
ZWIuLjI2MTkzZjM4MjM0ZTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9pbGk5MjJ4LmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lsaTkyMnguYwo+
ID4gQEAgLTI5NSw2ICsyOTUsOCBAQCBzdGF0aWMgaW50IGlsaTkyMnhfd3JpdGUoc3RydWN0IHNw
aV9kZXZpY2UgKnNwaSwgdTggcmVnLCB1MTYgdmFsdWUpCj4gPiAgI2lmZGVmIERFQlVHCj4gPiAg
LyoqCj4gPiAgICogaWxpOTIyeF9yZWdfZHVtcCAtIGR1bXAgYWxsIHJlZ2lzdGVycwo+ID4gKyAq
Cj4gPiArICogQHNwaTogcG9pbnRlciB0byB0aGUgY29udHJvbGxlciBzaWRlIHByb3h5IGZvciBh
biBTUEkgc2xhdmUgZGV2aWNlCj4gCj4gU2ltaWxhciB0byBwcmV2aW91cy4uLiBhbmQgSSBhbHNv
IG5vdGljZWQgdGhhdCB0aGVyZSBhcmUgc2V2ZXJhbCBvdGhlcgo+IGV4aXN0aW5nIEBzcGkgZGVz
Y3JpcHRpb25zIGluIHRoaXMgZmlsZSBhbmQgaXQgd291bGQgYmUgZ29vZCB0byBtYWtlCj4gdGhl
bSBjb25zaXN0ZW50LgoKSSd2ZSBmaXhlZCB0aGlzIGFuZCBhcHBsaWVkIHRoZSBwYXRjaC4KCi0t
IApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVy
IFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
