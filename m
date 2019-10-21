Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809DDE97F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 12:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E35089C8D;
	Mon, 21 Oct 2019 10:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642889C8D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 10:31:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so2510026wrw.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 03:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fQUvlL0V3Iz6E4Ap+lDL6E5wl3Ji5YJZ7TElhvimK6s=;
 b=m/4HEBNynNLziq0e836/wQ32CRW8jiCB/1R/cWz1iT5Wbf9P7KYrukvSW8Jy8mNR2T
 SreUs6uxDBc9DCI4RT2CynC8rjPlQ3dLTBdcN6A6EjGzCKggI6pvAZ4MvmSnZOIf5TR1
 xCVD8JTSZb79yix8M9aYA4fwfQfxFzUbm76kF65tjze74tSMqxn8KpsVUv7NFfpG4CtU
 uf0e4TBUyPETTIUQ2BVt2VxtUbDtrO48uA77Q4akCH8aRzrxAqv0ULllPg3TeYME1kjt
 P6tkbQ+PLnFEBf67Xjkjx7v6Vw1jJrDtccJSb+wnPAideCj/YUl6/qG78NDga+WdmNn2
 UpgA==
X-Gm-Message-State: APjAAAUkqAArAq5ZXiemWXKEQ7HyhHfqr90rJ9ELJHHT3KT2mWPu+39E
 ZZGyU8MF7tCBw3tpCX/GHdedAw==
X-Google-Smtp-Source: APXvYqyy4Oux2tNP8V/BSFAyhpaClSr0k2FeVWZej2dR57qFLk+u7vifjBbJudZPXvQKK+XBBOZNeQ==
X-Received: by 2002:adf:e702:: with SMTP id c2mr17251611wrm.70.1571653912695; 
 Mon, 21 Oct 2019 03:31:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f143sm27637543wme.40.2019.10.21.03.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 03:31:52 -0700 (PDT)
Date: Mon, 21 Oct 2019 11:31:50 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V8 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191021103150.ta7qalltldofouh4@holly.lan>
References: <1571402009-8706-1-git-send-email-kgunda@codeaurora.org>
 <1571402009-8706-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571402009-8706-7-git-send-email-kgunda@codeaurora.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fQUvlL0V3Iz6E4Ap+lDL6E5wl3Ji5YJZ7TElhvimK6s=;
 b=sNQbgSe6MW9Sf188uOBYTA+NasNjY7oDNNSVRg80tBE27c9oTBKOeTOMBhKbIfSnFo
 9fkgnUIi2Drnm02trdz8ueWMyzH7rb45BJPDAsHxAC/uVs45kb4m9g09Pvcas5OGWFzf
 DWH9vGPLNAryoDnEviIkDk+cuhXVfHBR3FK+/IkRRLTVbLQ4eRInplmskDLz0elRyE2X
 tAAQe/vc0QIYP8i8VqLixnry7C+73poCoC+aSEnJYUbKzt+ax6O/itJJr1sCUStytl3u
 gbMqKpuJQWKu/lh1fykZ1lIpc5ZxKzp1T0h77Op17uH6xYjSi9/TCYQ9yy8bIxKylSQ4
 Zq0g==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDY6MDM6MjlQTSArMDUzMCwgS2lyYW4gR3VuZGEgd3Jv
dGU6Cj4gVGhlIGF1dG8gc3RyaW5nIGRldGVjdGlvbiBhbGdvcml0aG0gY2hlY2tzIGlmIHRoZSBj
dXJyZW50IFdMRUQKPiBzaW5rIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQuIEl0IHRyaWVzIGVuYWJs
aW5nIGV2ZXJ5IHNpbmsgYW5kCj4gY2hlY2tzIGlmIHRoZSBPVlAgZmF1bHQgaXMgb2JzZXJ2ZWQu
IEJhc2VkIG9uIHRoaXMgaW5mb3JtYXRpb24KPiBpdCBkZXRlY3RzIGFuZCBlbmFibGVzIHRoZSB2
YWxpZCBzaW5rIGNvbmZpZ3VyYXRpb24uCj4gQXV0byBjYWxpYnJhdGlvbiB3aWxsIGJlIHRyaWdn
ZXJlZCB3aGVuIHRoZSBPVlAgZmF1bHQgaW50ZXJydXB0cwo+IGFyZSBzZWVuIGZyZXF1ZW50bHkg
dGhlcmVieSBpdCB0cmllcyB0byBmaXggdGhlIHNpbmsgY29uZmlndXJhdGlvbi4KPiAKPiBUaGUg
YXV0by1kZXRlY3Rpb24gYWxzbyBraWNrcyBpbiB3aGVuIHRoZSBjb25uZWN0ZWQgTEVEIHN0cmlu
Zwo+IG9mIHRoZSBkaXNwbGF5LWJhY2tsaWdodCBtYWxmdW5jdGlvbnMgKGJlY2F1c2Ugb2YgZGFt
YWdlKSBhbmQKPiByZXF1aXJlcyB0aGUgZGFtYWdlZCBzdHJpbmcgdG8gYmUgdHVybmVkIG9mZiB0
byBwcmV2ZW50IHRoZQo+IGNvbXBsZXRlIHBhbmVsIGFuZC9vciBib2FyZCBmcm9tIGJlaW5nIGRh
bWFnZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2lyYW4gR3VuZGEgPGtndW5kYUBjb2RlYXVyb3Jh
Lm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgfCAzOTgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
OTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9x
Y29tLXdsZWQuYwo+IGluZGV4IDY1OGIxZTAuLmIyZTY3NTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9xY29tLXdsZWQuYwo+IEBAIC0xOTMsNyArMjE2LDIzIEBAIHN0YXRpYyBpbnQgd2xlZF9t
b2R1bGVfZW5hYmxlKHN0cnVjdCB3bGVkICp3bGVkLCBpbnQgdmFsKQo+ICAJCQkJV0xFRDNfQ1RS
TF9SRUdfTU9EX0VOLAo+ICAJCQkJV0xFRDNfQ1RSTF9SRUdfTU9EX0VOX01BU0ssCj4gIAkJCQl2
YWwgPDwgV0xFRDNfQ1RSTF9SRUdfTU9EX0VOX1NISUZUKTsKPiAtCXJldHVybiByYzsKPiArCWlm
IChyYyA8IDApCj4gKwkJcmV0dXJuIHJjOwo+ICsKPiArCWlmICh3bGVkLT5vdnBfaXJxID4gMCkg
ewo+ICsJCWlmICh2YWwpIHsKPiArCQkJLyoKPiArCQkJICogV2FpdCBmb3IgYXQgbGVhc3QgMTBt
cyBiZWZvcmUgZW5hYmxpbmcgT1ZQIGludGVycnVwdAo+ICsJCQkgKiBhZnRlciBtb2R1bGUgZW5h
YmxlIHNvIHRoYXQgc29mdCBzdGFydCBpcyBjb21wbGV0ZWQuCj4gKwkJCSAqLwoKQ29tbWVudHMg
c2hvdWxkIG5vdCBzYXkgd2hhdCBpcyBkb2VzICh3ZSBjYW4gcmVhZCB0aGF0KS4gSXQgc2hvdWxk
IGJlCnNheWluZyB3aGF0IGlzIHdlaXJkIGFib3V0IHRoZSBoYXJkd2FyZSB0aGUgcmVzdWx0cyBp
biB1cyBlbmFibGluZyB0aGUKaW50ZXJydXB0IGluIGFuIHVudXN1YWwgd2F5LgoKTW9yZSBsaWtl
OgoKIlRoZSBoYXJkd2FyZSBnZW5lcmF0ZXMgYSBzdG9ybSBvZiBzcHVyaW91cyBPVlAgaW50ZXJy
dXB0cyBkdXJpbmcgc29mdApzdGFydCBvcGVyYXRpb25zIHNvIGRlZmVyIGVuYWJsaW5nIHRoZSBJ
UlEgZm9yIDEwbXMgdG8gZW5zdXJlIHRoYXQKdGhlIHNvZnQgc3RhcnQgaXMgY29tcGxldGUuIgoK
Tm90ZSB0aGF0IEkgYW0gb25seSBndWVzc2luZyB0aGF0IGlzIGFuIHNwdXJpb3VzIGludGVycnVw
dCBzdG9ybSB0aGF0CmNhdXNlZCB5b3UgdG8gZGVmZXIgdGhlIGludGVycnVwdCBlbmFibGUuLi4g
SSBkb24ndCB3YW50IHRvIGhhdmUgdG8KZ3Vlc3Mgd2hpY2ggaXMgd2h5IEkgYW0gYXNraW5nIGZv
ciBhIGdvb2QgcXVhbGl0eSBjb21tZW50IQoKCkRhbmllbC4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
