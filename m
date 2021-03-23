Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A83345AE6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB31D6E867;
	Tue, 23 Mar 2021 09:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1506E867
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:34:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h10so22600242edt.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tTpXq5PUWIqX4hPmnIy2Ebapp61tLCl5gNQ4F1z/chY=;
 b=TNAB+pss73oHQ0QY6wXA30Om65d0gL0aeIHBCFOk3CPqvHPRnnK4QRFP7SGztJPHLl
 moJkX27GJrSknpDeDTFKd/kUZj7xJrS0Y0nF8cNGfHetxCLjleifYCzl8becBmOCgEoZ
 jVT6XETkXUpmfJANhCN1wnO3v90XU1347aaeICKefMdjFUlN3e23stBSL08GopcesT8M
 c3mGnxxNSXQu4ElTDtXZLxo9nDvPT5WK8ZAixzcqcmDcf/uSam8+YbffgHjnVh42hIEp
 KzSYKmG04FyT9UkHXN5+V0Zw6ms12V8a4igrSpVxmYB0UpJD5T29oKcFA8SxylbP5eri
 ZTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tTpXq5PUWIqX4hPmnIy2Ebapp61tLCl5gNQ4F1z/chY=;
 b=KXseyOPgpIcEJH8zLdSPeJreXNlYVjXicWrOm+wCaKSejS0uXAetdxtWUX0zRiS7yF
 ea9a0LBk13BCnSe4AF+vhrz1QE0SI0EvkHrcWjhQr35s/PjtFPI8su8TDxC5v5ZT+7YS
 /j4T7G0wPKo1rdvbVX9ct0ZVG/omApNUzlqFFWwZyJeuGFWdAZLJ1GvIA7ykWFjuNR4h
 Rmpid04M3QTRjPWbFblAtrGDKXP01Axs2qNy4+D4UFrpUzNmC+xgmhJfMnKMe5Gnr9Dd
 YHjT0zTFHfYxW0DJHUtsQ4+EhFCs9AqMbAhYygtMcgcr+89ySvD1fUkAIsSJGNp5w2vQ
 aD/w==
X-Gm-Message-State: AOAM5320i4qXDJhKqKya0ux/U5O6M48+oW0TWSprQlxoOQnFiGLVb+d1
 MRyk4O14yRqi9m5daoLnkmpLYA==
X-Google-Smtp-Source: ABdhPJyTUR1gRvZuc0hYkZFukQlamkHYSvNsVGRcUySLVY+CIKooPuVEiEfhmlu4Mqr53FQZjxpogQ==
X-Received: by 2002:a05:6402:b31:: with SMTP id
 bo17mr3643742edb.113.1616492047679; 
 Tue, 23 Mar 2021 02:34:07 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id da17sm12803300edb.83.2021.03.23.02.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:34:07 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:34:05 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] backlight: journada720: fix Wmisleading-indentation
 warning
Message-ID: <20210323093405.dp37pgnmxbpqsiif@maple.lan>
References: <20210322164134.827091-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322164134.827091-1-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Richard Purdie <rpurdie@linux.intel.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDU6NDE6MjhQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFdpdGggZ2Nj
LTExLCB3ZSBnZXQgYSB3YXJuaW5nIGFib3V0IGNvZGUgdGhhdCBsb29rcyBjb3JyZWN0Cj4gYnV0
IGJhZGx5IGluZGVudGVkOgo+IAo+IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2pvcm5hZGE3MjBf
YmwuYzogSW4gZnVuY3Rpb24g4oCYam9ybmFkYV9ibF91cGRhdGVfc3RhdHVz4oCZOgo+IGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2pvcm5hZGE3MjBfYmwuYzo2NjoxMTogZXJyb3I6IHRoaXMg4oCY
ZWxzZeKAmSBjbGF1c2UgZG9lcyBub3QgZ3VhcmQuLi4gWy1XZXJyb3I9bWlzbGVhZGluZy1pbmRl
bnRhdGlvbl0KPiAgICA2NiB8ICAgICAgICAgfSBlbHNlICAvKiB0dXJuIG9uIGJhY2tsaWdodCAq
Lwo+ICAgICAgIHwgICAgICAgICAgIF5+fn4KPiAKPiBDaGFuZ2UgdGhlIGZvcm1hdHRpbmcgYWNj
b3JkaW5nIHRvIG91ciBub3JtYWwgY29udmVudGlvbnMuCj4gCj4gRml4ZXM6IDEzYTdiNWRjMGQx
NyAoImJhY2tsaWdodDogQWRkcyBIUCBKb3JuYWRhIDcwMCBzZXJpZXMgYmFja2xpZ2h0IGRyaXZl
ciIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkknbSBk
dWJpb3VzIHRoYXQgdGhlIHJlLWluZGVudCBtYXRjaGVzIHRoZSBvcmlnaW5hbCBhdXRob3JzIGlu
dGVudC4uLgpidXQgaXQgY2VydGFpbmx5IGRvZXMgbWF0Y2ggd2hhdCB3YXMgYWN0dWFsbHkgd3Jp
dHRlbiBhbmQgdGVzdGVkIHNvCm9uIHRoYXQgYmFzaXM6CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRo
b21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCgpEYW5pZWwuCgoKIC0tLQo+ICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9qb3JuYWRhNzIwX2JsLmMgfCA0NCArKysrKysrKysrKyst
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvam9ybmFk
YTcyMF9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvam9ybmFkYTcyMF9ibC5jCj4gaW5k
ZXggOTk2ZjdiYTNiMzczLi4wNjZkMGRjOThmNjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvam9ybmFkYTcyMF9ibC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvam9ybmFkYTcyMF9ibC5jCj4gQEAgLTY2LDMwICs2NiwzMCBAQCBzdGF0aWMgaW50IGpvcm5h
ZGFfYmxfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmQpCj4gIAl9IGVs
c2UgIC8qIHR1cm4gb24gYmFja2xpZ2h0ICovCj4gIAkJUFBTUiB8PSBQUENfTEREMTsKPiAgCj4g
LQkJLyogc2VuZCBjb21tYW5kIHRvIG91ciBtY3UgKi8KPiAtCQlpZiAoam9ybmFkYV9zc3BfYnl0
ZShTRVRCUklHSFRORVNTKSAhPSBUWERVTU1ZKSB7Cj4gLQkJCWRldl9pbmZvKCZiZC0+ZGV2LCAi
ZmFpbGVkIHRvIHNldCBicmlnaHRuZXNzXG4iKTsKPiAtCQkJcmV0ID0gLUVUSU1FRE9VVDsKPiAt
CQkJZ290byBvdXQ7Cj4gLQkJfQo+ICsJLyogc2VuZCBjb21tYW5kIHRvIG91ciBtY3UgKi8KPiAr
CWlmIChqb3JuYWRhX3NzcF9ieXRlKFNFVEJSSUdIVE5FU1MpICE9IFRYRFVNTVkpIHsKPiArCQlk
ZXZfaW5mbygmYmQtPmRldiwgImZhaWxlZCB0byBzZXQgYnJpZ2h0bmVzc1xuIik7Cj4gKwkJcmV0
ID0gLUVUSU1FRE9VVDsKPiArCQlnb3RvIG91dDsKPiArCX0KPiAgCj4gLQkJLyoKPiAtCQkgKiBh
dCB0aGlzIHBvaW50IHdlIGV4cGVjdCB0aGF0IHRoZSBtY3UgaGFzIGFjY2VwdGVkCj4gLQkJICog
b3VyIGNvbW1hbmQgYW5kIGlzIHdhaXRpbmcgZm9yIG91ciBuZXcgdmFsdWUKPiAtCQkgKiBwbGVh
c2Ugbm90ZSB0aGF0IG1heGltdW0gYnJpZ2h0bmVzcyBpcyAyNTUsCj4gLQkJICogYnV0IGR1ZSB0
byBwaHlzaWNhbCBsYXlvdXQgaXQgaXMgZXF1YWwgdG8gMCwgc28gd2Ugc2ltcGx5Cj4gLQkJICog
aW52ZXJ0IHRoZSB2YWx1ZSAoTUFYIFZBTFVFIC0gTkVXIFZBTFVFKS4KPiAtCQkgKi8KPiAtCQlp
ZiAoam9ybmFkYV9zc3BfYnl0ZShCTF9NQVhfQlJJR0hUIC0gYmQtPnByb3BzLmJyaWdodG5lc3Mp
Cj4gLQkJCSE9IFRYRFVNTVkpIHsKPiAtCQkJZGV2X2VycigmYmQtPmRldiwgInNldCBicmlnaHRu
ZXNzIGZhaWxlZFxuIik7Cj4gLQkJCXJldCA9IC1FVElNRURPVVQ7Cj4gLQkJfQo+ICsJLyoKPiAr
CSAqIGF0IHRoaXMgcG9pbnQgd2UgZXhwZWN0IHRoYXQgdGhlIG1jdSBoYXMgYWNjZXB0ZWQKPiAr
CSAqIG91ciBjb21tYW5kIGFuZCBpcyB3YWl0aW5nIGZvciBvdXIgbmV3IHZhbHVlCj4gKwkgKiBw
bGVhc2Ugbm90ZSB0aGF0IG1heGltdW0gYnJpZ2h0bmVzcyBpcyAyNTUsCj4gKwkgKiBidXQgZHVl
IHRvIHBoeXNpY2FsIGxheW91dCBpdCBpcyBlcXVhbCB0byAwLCBzbyB3ZSBzaW1wbHkKPiArCSAq
IGludmVydCB0aGUgdmFsdWUgKE1BWCBWQUxVRSAtIE5FVyBWQUxVRSkuCj4gKwkgKi8KPiArCWlm
IChqb3JuYWRhX3NzcF9ieXRlKEJMX01BWF9CUklHSFQgLSBiZC0+cHJvcHMuYnJpZ2h0bmVzcykK
PiArCQkhPSBUWERVTU1ZKSB7Cj4gKwkJZGV2X2VycigmYmQtPmRldiwgInNldCBicmlnaHRuZXNz
IGZhaWxlZFxuIik7Cj4gKwkJcmV0ID0gLUVUSU1FRE9VVDsKPiArCX0KPiAgCj4gLQkJLyoKPiAt
CQkgKiBJZiBpbmZhY3Qgd2UgZ2V0IGFuIFRYRFVNTVkgYXMgb3V0cHV0IHdlIGFyZSBoYXBweSBh
bmQgZG9udAo+IC0JCSAqIG1ha2UgYW55IGZ1cnRoZXIgY29tbWVudHMgYWJvdXQgaXQKPiAtCQkg
Ki8KPiArCS8qCj4gKwkgKiBJZiBpbmZhY3Qgd2UgZ2V0IGFuIFRYRFVNTVkgYXMgb3V0cHV0IHdl
IGFyZSBoYXBweSBhbmQgZG9udAo+ICsJICogbWFrZSBhbnkgZnVydGhlciBjb21tZW50cyBhYm91
dCBpdAo+ICsJICovCj4gIG91dDoKPiAgCWpvcm5hZGFfc3NwX2VuZCgpOwo+ICAKPiAtLSAKPiAy
LjI5LjIKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
