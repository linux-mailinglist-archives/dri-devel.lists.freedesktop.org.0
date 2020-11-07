Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1582AA61F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 16:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987986E0FF;
	Sat,  7 Nov 2020 15:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF396E2D8
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 15:13:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so4002387wmh.4
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Nov 2020 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Fe6CFZHB4eN2243CFprUL/n+G4vxgYInJJ6wj8YKWBk=;
 b=yxte38245MaYCKkeFpeoucGOLM90V4xE3nz3Cnj3+Pam0t1F1fbMS9wC9MundIMK2H
 UPpv/s3qUlbyQ01axD3II1Z2BuBIDINgXKwK2bhp+vaisZiHk8VTRAbqY8tzzKxgEU9M
 E3GiuyMz1aPvkPSGfy0Rw0HBumWxid8ptFtJOzcgegABv758cPFg4Fi2/SarChNNob1s
 E2C//PdsYp1Sok8XurQ1QdtUexRfPcjHbcN37l8HpHhDpfsyGgWi5n0VtIOA0z+mpBhk
 yTJVLKMMUL/ibfnKoPsTUVZ+PiKhaeuOMpHLv2gghWo190HmeMHu687awnTuITzS+hTM
 Fouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Fe6CFZHB4eN2243CFprUL/n+G4vxgYInJJ6wj8YKWBk=;
 b=sKUORfZzcOh8hv8EPre9cZNfPb0U5vXWO3yzZtT8veKa/NCQ/u9r8f55VW7Yhg+NzI
 rAu7mzjEP7TF9KDnLDENH+liM0PjmTOnYDSBY8iYDPr+aS4aBAx8evcC1gDzbn+KAAdx
 PIlzH3V44qXq4uT2SBr7WQeACG3DkkvyTQGZaGB0IKB2+FUkJ1ZULLPIaHlQH+3F5fds
 ZgM72JBVYWC4nyTT1G+1c3XI+WQNUh8+/57PK+QK+OU+agqeYLOapufrEGA8dz2MbIo9
 ESFrXMPphDuBXUBsAhC9bgvCC/5KBccRXLc4DtcYBCs/+OrEc1ecgGcXTBbk6WIbTzny
 EA4A==
X-Gm-Message-State: AOAM533tY76u815g7VQM6k+WZZibnvwiQPXCjU01evdYzgjO4807nq6/
 kqsyWz+UHae0X2JdS5mas1MuJA==
X-Google-Smtp-Source: ABdhPJy6Ii661kV3KJTNGTIaBkDIcEjLcbtut88fwfWuPoGhumpi22jfpd/9QuNPLMHXcJ8vc855nQ==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr4969499wma.57.1604762026726; 
 Sat, 07 Nov 2020 07:13:46 -0800 (PST)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id l16sm6447087wrr.83.2020.11.07.07.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 07:13:46 -0800 (PST)
Date: Sat, 7 Nov 2020 15:13:42 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 17/19] drm/radeon/radeon_kms: Fix misnaming of
 'radeon_info_ioctl's dev param
Message-ID: <20201107151342.GQ2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-18-lee.jones@linaro.org>
 <20201107142919.GB1014611@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107142919.GB1014611@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAwNyBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
T24gRnJpLCBOb3YgMDYsIDIwMjAgYXQgMDk6NDk6NDdQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4g
PiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYzoyMjY6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2Rldicgbm90IGRlc2NyaWJlZCBpbiAncmFk
ZW9uX2luZm9faW9jdGwnCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmM6
MjI2OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdyZGV2JyBkZXNjcmlwdGlv
biBpbiAncmFkZW9uX2luZm9faW9jdGwnCj4gPiAKPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYyB8IDIgKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMKPiA+IGluZGV4IDBkOGZiYWJmZmNlYWQu
LjIxYzIwNjc5NWMzNjQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9rbXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMK
PiA+IEBAIC0yMTMsNyArMjEzLDcgQEAgc3RhdGljIHZvaWQgcmFkZW9uX3NldF9maWxwX3JpZ2h0
cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gIC8qKgo+ID4gICAqIHJhZGVvbl9pbmZvX2lv
Y3RsIC0gYW5zd2VyIGEgZGV2aWNlIHNwZWNpZmljIHJlcXVlc3QuCj4gPiAgICoKPiA+IC0gKiBA
cmRldjogcmFkZW9uIGRldmljZSBwb2ludGVyCj4gPiArICogQGRldjogcmFkZW9uIGRldmljZSBw
b2ludGVyCj4gPiAgICogQGRhdGE6IHJlcXVlc3Qgb2JqZWN0Cj4gPiAgICogQGZpbHA6IGRybSBm
aWxwCj4gPiAgICoKPiAKPiBEZWxldGUgYWxsIHRoZSBrZXJuZWwtZG9jIGFubm90YXRpb24gYXMg
d2UgZG8gbm90IHB1bGwgdGhpcyBmaWxlIGludG8KPiB0aGUga2VybmVsLWRvYyBhbnl3YXkuCj4g
Cj4gS2VlcCB0aGUgLyogQW5zd2VyIGEgZGV2aWNlIHNwZWNpZmljIHJlcXVlc3QgKi8gcGFydC4K
PiAKPiBBdCBsZWFzdCB0aGF0cyB3aGF0IEkgc2VlIGFzIHRoZSBiZXN0IHdheSB0byBkZWFsIHdp
dGggaXQuCgpEZW1vdGluZyBhbGwgaGVhZGVycywgZXZlbiBpZiB0aGV5IGFyZSBjb25mb3JtYW50
LCBpdCBub3QgdGhlIHdheSB0bwpnby4gIFNvbWUgY29udHJpYnV0b3JzL21haW50YWluZXJzIHBy
ZWZlciB0byBrZWVwIHRoZSBrZXJuZWwtZG9jCihwcmV0dHkgY29sb3VycywgYXV0b21hdGVkIGNo
ZWNraW5nIFthIGxhLCB0aGlzIHBhdGNoIV0gYW5kIHRoZS1saWtlKQpmb3JtYXR0aW5nLCBldmVu
IGlmIHRoZXkgYXJlIG5vdCBkaXJlY3RseSByZWZlcmVuY2VkIGZyb20KL0RvY3VtZW50YXRpb24u
CgpGb3Igbm93LCBzbyBsb25nIGFzIHRoZSBidWlsZCBpcyBoYXBweSwgSSBhbSBoYXBweS4KCklm
IHlvdSB3aXNoIHRvIG1ha2UgdGhlIGJ1aWxkIHVuaGFwcHkgYWJvdXQgdGhpcywgeW91IHNob3Vs
ZCB0YWtlIHVwCnRoZSBhcmd1bWVudCB0byBlbmNvbXBhc3MgYHNjcmlwdHMvZmluZC11bnVzZWQt
ZG9jcy5zaGAgaW50byBpdC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2hu
aWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIg
fCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
