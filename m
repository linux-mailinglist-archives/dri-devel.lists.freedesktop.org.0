Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9898E30D8FB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 12:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046BE6EA59;
	Wed,  3 Feb 2021 11:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B16EA59
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:42:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l12so4104495wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 03:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cgpZfuZr2SJft3uC9lIbX9i8wXPRLzgaCvn6F6h99Io=;
 b=J7WV84daNeAoEl2OYeL+2PXNbxRoREoyuumU1bTgoBdZ2MGZHEmQyW2+YMOABFdynI
 xuUp+/emlPoaGjNOEzOXW8fUkNkFZCYOZasG7y/OehCzsShqOIb5Kv6tZQPUiYXipF0m
 FvA8SWbHevNznZMVy5u2u1eiyo5ps5FUXe046T6zJTyQ5m1vSye1dvq5gDLmgKK8omlu
 KfnFtQ2ELibWuv1V/d67BDkzzYuzFUzuHt3g3uyuc3mlb7nXnz99Ys5yuXBlugvCxll2
 n8S2ojS+0TIWAApjgt4ukDW6rhcBzR5JGdiOMrPwho2aWnWBiOVNMhjZvjs+HdInrE+0
 KQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cgpZfuZr2SJft3uC9lIbX9i8wXPRLzgaCvn6F6h99Io=;
 b=Kwijo48yHr4waf4tG7MN+SUjpLn3NR1i5zygJg+GF/Sa7FwjXiep+CqQClGnB6+eJ6
 ZOCwCsvAYZfvwFvE/Me9mHUtzgj4OUmJfbmiIA02fYkeFUOqGh3xBEeEfrZOGpn0EK7W
 elnno5THK5F9nz43hzm9pbnHrWJ7xsXCMN4RiFDB1gyOUZDoodD3CkUSUsTPT51miLY6
 Lyye1P7WtXuShIlPOsOkWed62hQLrtFZUsTP5oIhTJ2EhsjKEqpzIjn6I0CZpncrW5RR
 HhhQZ+QQOqZajykFdmhA3FO2wGoZVXaNx4RpM3gR2rdH8j12Z+ND1lyDxLoHoQJsmihP
 u6Tg==
X-Gm-Message-State: AOAM531ltBS9mbpOBjb7pXjImLNnUSOVLXhMSQxTYLXuAPdcqdpl5bUZ
 rG79/hwZcRJXppWgc3af5yOTfw==
X-Google-Smtp-Source: ABdhPJyNBeYILeVQnQ6x/pjaKcCiQpLKlGxAmpNNQG2sGdx3Bnxf8IZSS2NrrCMnLCEZR6FsrVTtRQ==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
 g6mr2488809wmq.2.1612352551160; 
 Wed, 03 Feb 2021 03:42:31 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id d16sm3152065wrr.59.2021.02.03.03.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:42:30 -0800 (PST)
Date: Wed, 3 Feb 2021 11:42:28 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: FUZZ DR <driverfuzzing@gmail.com>
Subject: Re: [PATCH] backlight: pcf50633: pdata may be a null pointer, null
 pointer dereference cause crash
Message-ID: <20210203114228.4tr4j6hxukayo4ei@maple.lan>
References: <1612190499-73818-1-git-send-email-driverfuzzing@gmail.com>
 <20210202092541.2wvzpe53mavrd47x@maple.lan>
 <CABF6pWFar726YKG9y_wVZoX9fd7DxBQce0AZKAibmmzU9qZpMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABF6pWFar726YKG9y_wVZoX9fd7DxBQce0AZKAibmmzU9qZpMA@mail.gmail.com>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgMDIsIDIwMjEgYXQgMDM6MjU6NDlQTSAtMDYwMCwgRlVaWiBEUiB3cm90ZToK
PiBTb3JyeSBhYm91dCB0aGUgbWlzc2luZyBkZXNjcmlwdGlvbiwgSSBoYXZlIGEgZGVzY3JpcHRp
b24gYXQgbXkgbG9jYWwKPiBjb21taXQuIEJ1dCB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGRpc2Fw
cGVhcmVkIHdoZW4gSSB1c2VkIGdpdCBzZW5kLWVtYWlsCj4gdG8gc3VibWl0IHRoaXMgcGF0Y2gu
Cj4gCj4gYmFja2xpZ2h0OiBwY2Y1MDYzMzogcGRhdGEgbWF5IGJlIGEgbnVsbCBwb2ludGVyLCBu
dWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UKPiBjYXVzZXMgY3Jhc2gKPiBwZGF0YSBoYXMgYmVlbiBj
aGVja2VkICBhdCBsaW5lIDEyMCBiZWZvcmUgZGVyZWZlcmVuY2UuIEhvd2V2ZXIsIGl0IGlzIHVz
ZWQKPiB3aXRob3V0IGNoZWNrIGF0IGxpbmUgMTMwLiBTbyBqdXN0IGFkZCB0aGUgY2hlY2ssCgpU
byBiZSBjbGVhciB3aGF0IHlvdXIgYW5hbHl6ZXIgaXMgcmVwb3J0aW5nIGlzIGEgbWlzbWF0Y2gg
b2YgcHJvZ3JhbW1lcgppbnRlbnQuCgpJbiBsaW5lIDEyMCBzdWdnZXN0cyBhIGJlbGllZiB0aGF0
IHBkYXRhIGNvdWxkIGJlIE5VTEwgd2hpbHN0IGxpbmUgMTMwCnN1Z2dlc3RzIGEgYmVsaWVmIHRo
YXQgcGRhdGEgaXMgbmV2ZXIgTlVMTC4gWW91ciBhbmFseXplciBjYW5ub3Qgbm90IHRlbGwKeW91
IHdoaWNoIGJlbGllZiBpcyBpbmNvcnJlY3QsIG9ubHkgdGhhdCB0aGVyZSBpcyBhIG1pc21hdGNo
LgoKCj4gSXQgaXMgYmV0dGVyIHRvIHdyaXRlIGEgZGVmYXVsdCB2YWx1ZSB0byB0aGUgcmVnaXN0
ZXIgaWYgdGhlIHJhbXBfdGltZSBoYXMKPiBhIGRlZmF1bHQgdmFsdWUuIFRoZW4gaXQgZG9lcyBu
b3QgbmVlZCB0byByZXR1cm4gLUVJTlZBTC4gSXQgd2lsbCBrZWVwCj4gY29uc2lzdGVudCB3aXRo
IHRoZSBiZWhhdmlvciBhdCBsaW5lIDEyMC4KCkkgZGlzYWdyZWUuCgpZb3UgaGF2ZSBhc3N1bWVk
IHRoYXQgbGluZSAxMjAgaXMgY29ycmVjdCBhbmQgdGhhdCB0aGlzIGNvZGUgbmVlZHMgdG8Kc3Vw
cG9ydCB0aGUgY2FzZSB3aGVyZSBwZGF0YSBpcyBOVUxMLiBIb3dldmVyIGVsZXZlbiB5ZWFycyBv
ZiBoaXN0b3J5CmRpc3Byb3ZlIHRoaXMhIFRoaXMgY29kZSBpcyBuZXZlciBjYWxsZWQgd2l0aG91
dCB2YWxpZCBwbGF0Zm9ybSBkYXRhLgoKVGhlcmVmb3JlIHdlIHNob3VsZCBmaXggdGhlIGFzc3Vt
cHRpb24gb24gbGluZSAxMjAgYnkgbWFraW5nIGl0IGNsZWFyCnRoYXQgdGhpcyBjb2RlIGNvZGUg
ZXhwZWN0cyBub24tTlVMTCBwbGF0Zm9ybSBkYXRhLiBHaXZlbiB0aGVyZSBhcmUKZGV2ZWxvcGVy
cyB3b3JraW5nIHRvIGVsaW1pbmF0ZSB0aGlzIGtpbmQgb2YgcGxhdGZvcm0gZGF0YSBzdHJ1Y3R1
cmUKKGJ5IGFkb3B0aW5nIGRldmljZSBwcm9wZXJ0aWVzIGluc3RlYWQpIEkgZG9uJ3Qgd2FudCB0
byBtYWtlIHRoZWlyCmxpZmUgaGFyZGVyIGJ5IGltcGxlbWVudGluZyB1bnVzZWQgYW5kIHVudGVz
dGVkIHNwZWNpYWwgY2FzZXMgdGhhdAp0aGV5IHdvdWxkIGhhdmUgdG8gcmVhc29uIGFib3V0LgoK
CkRhbmllbC4KCgo+IAo+IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5v
cmc+IOS6jjIwMjHlubQy5pyIMuaXpeWRqOS6jCDkuIrljYgzOjI15YaZ6YGT77yaCj4gCj4gPiBP
biBNb24sIEZlYiAwMSwgMjAyMSBhdCAwODo0MTozOEFNIC0wNjAwLCBXZW5qaWEgWmhhbyB3cm90
ZToKPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VuamlhIFpoYW8gPGRyaXZlcmZ1enppbmdAZ21haWwu
Y29tPgo+ID4KPiA+IFRoZXJlIHNob3VsZCBiZSBhIHBhdGNoIGRlc2NyaXB0aW9uIGhlcmUgZXhw
bGFpbmluZyB3aHkgdGhlIHBhdGNoCj4gPiBpcyBuZWVkZWQgYW5kIGhvdyBpdCB3b3Jrcy4KPiA+
Cj4gPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3BjZjUwNjMzLWJh
Y2tsaWdodC5jIHwgMyArKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3BjZjUwNjMzLWJhY2tsaWdodC5jCj4gPiBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3BjZjUwNjMzLWJhY2tsaWdodC5jCj4gPiA+IGluZGV4IDU0MGRkMzM4Li40MzI2N2FmIDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wY2Y1MDYzMy1iYWNrbGlnaHQu
Ywo+ID4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wY2Y1MDYzMy1iYWNrbGlnaHQu
Ywo+ID4gPiBAQCAtMTI3LDcgKzEyNyw4IEBAIHN0YXRpYyBpbnQgcGNmNTA2MzNfYmxfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZQo+ID4gKnBkZXYpCj4gPiA+Cj4gPiA+ICAgICAgIHBsYXRm
b3JtX3NldF9kcnZkYXRhKHBkZXYsIHBjZl9ibCk7Cj4gPiA+Cj4gPiA+IC0gICAgIHBjZjUwNjMz
X3JlZ193cml0ZShwY2ZfYmwtPnBjZiwgUENGNTA2MzNfUkVHX0xFRERJTSwKPiA+IHBkYXRhLT5y
YW1wX3RpbWUpOwo+ID4gPiArICBpZiAocGRhdGEpCj4gPiA+ICsgICAgcGNmNTA2MzNfcmVnX3dy
aXRlKHBjZl9ibC0+cGNmLCBQQ0Y1MDYzM19SRUdfTEVERElNLAo+ID4gcGRhdGEtPnJhbXBfdGlt
ZSk7Cj4gPgo+ID4gQXNzdW1pbmcgeW91IGZvdW5kIHRoaXMgaXNzdWUgdXNpbmcgYSBzdGF0aWMg
YW5hbHl6ZXIgdGhlbiBJIHRoaW5rIGl0Cj4gPiBtaWdodCBiZSBiZXR0ZXIgdG8gaWYgYW4gImlm
ICghcGRhdGEpIHJldHVybiAtRUlOVkFMIiBmdXJ0aGVyIHVwIHRoZQo+ID4gZmlsZSBpbnN0ZWFk
Lgo+ID4KPiA+IEluIG90aGVyIHdvcmRzIGl0IGlzIGJldHRlciB0byAiZG9jdW1lbnQiICh2aWEg
dGhlIHJldHVybiBjb2RlKSB0aGF0IHRoZQo+ID4gY29kZSBkb2VzIG5vdCBzdXBwb3J0IHBkYXRh
ID09IE5VTEwgdGhhbiB0byBhZGQgYW5vdGhlciB1bnRlc3RlZCBjb2RlCj4gPiBwYXRoLgo+ID4K
PiA+Cj4gPiBEYW5pZWwuCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
