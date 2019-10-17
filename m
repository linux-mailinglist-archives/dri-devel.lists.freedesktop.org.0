Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3247DAE69
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8D26EA97;
	Thu, 17 Oct 2019 13:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82336EA97
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:30:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o15so1943299wru.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rjaSf8zw6DTRcAsezcie89NERI7/xyB+gUZSDTVO6Jw=;
 b=Qfq5Q5VboKpIPzMX2n7ml0ksqkHvJC589aUyRGGWh8mSt+XsLcbJi9g+fPLmSKCnhS
 3kkymswF1nVK/czVrER1rHJ0ELvNSBaxSDVxTY6URG1XhumeKgM8nOaS0GT2EiPS4nA5
 ZVzPAR3sUE5l9jwPEV5PZvbxMvC3QeFGZEHfcH+gBTeDwzn5dTeVG3dqa3rBebyKZUYn
 Q7MfaVBG5TRJIEH/yc2ySwLw6/JihHk2foT2oGZ6iOlmMS8hN1wVGMEGdfhe9ms/jOJR
 fNd94BMAr/ZhekSEtccX8MQmXZawPTXEcqcADoo2wKU15XjhvWDnxPOYgnroaJAgVqwn
 9giA==
X-Gm-Message-State: APjAAAWONpFM8lsgncYcMAA5VlyvL7ghRMpcR6cKMrFd3d5TSE6Hk/9U
 WwioT/N4UXuJq/V9s8IZmLe8jA==
X-Google-Smtp-Source: APXvYqyd8CrMZlUf79wYbN2VsKW/LdfXSXPM7CJxz3i3MZV7iVso3CgHyzrYbH5WQbsQ5uYN92rbpQ==
X-Received: by 2002:a5d:5587:: with SMTP id i7mr2888198wrv.289.1571319026750; 
 Thu, 17 Oct 2019 06:30:26 -0700 (PDT)
Received: from dell ([95.149.164.47])
 by smtp.gmail.com with ESMTPSA id u83sm9732697wme.0.2019.10.17.06.30.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Oct 2019 06:30:26 -0700 (PDT)
Date: Thu, 17 Oct 2019 14:30:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: kgunda@codeaurora.org
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191017133024.GQ4365@dell>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
 <20191017122653.GO4365@dell>
 <689831a9d7561f51cdb7ea0a1760d472@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689831a9d7561f51cdb7ea0a1760d472@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=rjaSf8zw6DTRcAsezcie89NERI7/xyB+gUZSDTVO6Jw=;
 b=vMOx91oGQ6DpKfU+vZ+lrtK+QQ/NbAKKsNcwAKY96DPNR6C61fyhwFCNVCqYpEaaKG
 Wss/xzTdFC6uoYn9y9wcN5SbDMnYxnCjnI/7kmV8tGSdqdKZjYCmRDCl8Biuw1U1G8CM
 G1dLvfs36VWgLTFXGfUk6/7Nz2bUYbY60eEahfaTU3AFGTwbR9f4v7Ho9j7jEBORgqT3
 aivbaWB/CaU6RcfK9vgqfqLyS4Czt4lSu7kyX1HHYYThhI5aUHgYBCQhpQHbajG77wPp
 fQaVZQ/C+/qHzfAEN3u0Hx8aWwlUoWVZ7fJ/YVFSorJBdpnVY8SfDDvWq9WZi3KfeRev
 owBA==
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
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNyBPY3QgMjAxOSwga2d1bmRhQGNvZGVhdXJvcmEub3JnIHdyb3RlOgoKPiBPbiAy
MDE5LTEwLTE3IDE3OjU2LCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBXZWQsIDE2IE9jdCAyMDE5
LCBLaXJhbiBHdW5kYSB3cm90ZToKPiA+IAo+ID4gPiBUaGUgYXV0byBzdHJpbmcgZGV0ZWN0aW9u
IGFsZ29yaXRobSBjaGVja3MgaWYgdGhlIGN1cnJlbnQgV0xFRAo+ID4gPiBzaW5rIGNvbmZpZ3Vy
YXRpb24gaXMgdmFsaWQuIEl0IHRyaWVzIGVuYWJsaW5nIGV2ZXJ5IHNpbmsgYW5kCj4gPiA+IGNo
ZWNrcyBpZiB0aGUgT1ZQIGZhdWx0IGlzIG9ic2VydmVkLiBCYXNlZCBvbiB0aGlzIGluZm9ybWF0
aW9uCj4gPiA+IGl0IGRldGVjdHMgYW5kIGVuYWJsZXMgdGhlIHZhbGlkIHNpbmsgY29uZmlndXJh
dGlvbi4KPiA+ID4gQXV0byBjYWxpYnJhdGlvbiB3aWxsIGJlIHRyaWdnZXJlZCB3aGVuIHRoZSBP
VlAgZmF1bHQgaW50ZXJydXB0cwo+ID4gPiBhcmUgc2VlbiBmcmVxdWVudGx5IHRoZXJlYnkgaXQg
dHJpZXMgdG8gZml4IHRoZSBzaW5rIGNvbmZpZ3VyYXRpb24uCj4gPiA+IAo+ID4gPiBUaGUgYXV0
by1kZXRlY3Rpb24gYWxzbyBraWNrcyBpbiB3aGVuIHRoZSBjb25uZWN0ZWQgTEVEIHN0cmluZwo+
ID4gPiBvZiB0aGUgZGlzcGxheS1iYWNrbGlnaHQgbWFsZnVuY3Rpb25zIChiZWNhdXNlIG9mIGRh
bWFnZSkgYW5kCj4gPiA+IHJlcXVpcmVzIHRoZSBkYW1hZ2VkIHN0cmluZyB0byBiZSB0dXJuZWQg
b2ZmIHRvIHByZXZlbnQgdGhlCj4gPiA+IGNvbXBsZXRlIHBhbmVsIGFuZC9vciBib2FyZCBmcm9t
IGJlaW5nIGRhbWFnZWQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8
a2d1bmRhQGNvZGVhdXJvcmEub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3Fjb20td2xlZC5jIHwgNDEwCj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQwNCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3Fjb20td2xlZC5jCj4gPiA+IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVk
LmMKPiA+ID4gaW5kZXggYjViMTI1Yy4uZmY3YzQwOSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcWNvbS13bGVkLmMKClsuLi5dCgo+ID4gPiArCQlpZiAoaW50X3N0cyAmIFdMRUQz
X0NUUkxfUkVHX09WUF9GQVVMVF9TVEFUVVMpCj4gPiA+ICsJCQlkZXZfZGJnKHdsZWQtPmRldiwg
IldMRUQgT1ZQIGZhdWx0IGRldGVjdGVkIHdpdGggU0lOSyAlZFxuIiwKPiA+ID4gKwkJCQlpICsg
MSk7Cj4gPiAKPiA+IEkgaGF2ZW4ndCByZXZpZXdlZCB0aGUgd2hvbGUgcGF0Y2gsIGJ1dCB0aGlz
IGNhdWdodCBteSBleWUuCj4gPiAKPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgdXBncmFkZWQg
dG8gZGV2X3dhcm4oKS4KPiA+IAo+IFRob3VnaHQgb2Yga2VlcGluZyB0aGVzZSBtZXNzYWdlcyBz
aWxlbnQsIEJlY2F1c2UgdGhlIHN0cmluZyBjb25maWd1cmF0aW9uCj4gd2lsbCBiZSBjb3JyZWN0
ZWQgaW4gdGhpcwo+IGFuZCBpbmZvcm1pbmcgaXQgYXQgZW5kIG9mIHRoZSBhdXRvIHN0cmluZyBk
ZXRlY3Rpb24uCgpbLi4uXQoKPiA+ID4gKwl9IGVsc2Ugewo+ID4gPiArCQlkZXZfd2Fybih3bGVk
LT5kZXYsICJOZXcgV0xFRCBzdHJpbmcgY29uZmlndXJhdGlvbiBmb3VuZCAleFxuIiwKPiA+ID4g
KwkJCSBzaW5rX3ZhbGlkKTsKPiA+IAo+ID4gV2h5IHdvdWxkIHRoZSB1c2VyIGNhcmUgYWJvdXQg
dGhpcz8gIElzIGl0IG5vdCBub3JtYWw/Cj4gPiAKPiBBY3R1YWxseSwgaXQgY29tZXMgaGVyZSBp
ZiB0aGUgdXNlciBwcm92aWRlZCBzdHJpbmcgY29uZmlndXJhdGlvbiBpbiB0aGUKPiBkZXZpY2Ug
dHJlZSBpcyBpbi1jb3JyZWN0Lgo+IFRoYXQncyB3aHkganVzdCBpbmZvcm1pbmcgdGhlIHVzZXIg
YWJvdXQgdGhlIHJpZ2h0IHN0cmluZyBjb25maWd1cmF0aW9uLAo+IGFmdGVyIHRoZSBhdXRvIHN0
cmluZyBkZXRlY3Rpb24uCgpUaGVuIEkgdGhpbmsgd2UgbmVlZCB0byBiZSBtb3JlIGZvcnRoY29t
aW5nLiAgVGVsbCB0aGUgdXNlciB0aGUKY29uZmlndXJhdGlvbiBpcyBpbmNvcnJlY3QgYW5kIHdo
YXQgeW91J3ZlIGRvbmUgdG8gcmVjdGlmeSBpdC4KCiJYWFggaXMgbm90IGEgdmFsaWQgY29uZmln
dXJhdGlvbiAtIHVzaW5nIFlZWSBpbnN0ZWFkIgoKWy4uLl0KCj4gPiA+ICtzdGF0aWMgaW50IHds
ZWRfY29uZmlndXJlX292cF9pcnEoc3RydWN0IHdsZWQgKndsZWQsCj4gPiA+ICsJCQkJICBzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiArewo+ID4gPiArCWludCByYzsKPiA+ID4g
Kwl1MzIgdmFsOwo+ID4gPiArCj4gPiA+ICsJd2xlZC0+b3ZwX2lycSA9IHBsYXRmb3JtX2dldF9p
cnFfYnluYW1lKHBkZXYsICJvdnAiKTsKPiA+ID4gKwlpZiAod2xlZC0+b3ZwX2lycSA8IDApIHsK
PiA+ID4gKwkJZGV2X2RiZygmcGRldi0+ZGV2LCAib3ZwIGlycSBpcyBub3QgdXNlZFxuIik7Cj4g
PiAKPiA+IEkgYXNzdW1lIHRoaXMgaXMgb3B0aW9uYWwuICBXaGF0IGhhcHBlbnMgaWYgbm8gSVJR
IGlzIHByb3ZpZGVkPwo+ID4gCj4gSGVyZSBPVlAgSVJRIGlzIHVzZWQgdG8gZGV0ZWN0IHRoZSB3
cm9uZyBzdHJpbmcgZGV0ZWN0aW9uLiBJZiBpdCBpcyBub3QKPiBwcm92aWRlZCB0aGUgYXV0byBz
dHJpbmcgZGV0ZWN0aW9uIGxvZ2ljIHdvbid0IHdvcmsuCgoiT1ZQIElSUSBub3QgZm91bmQgLSBk
aXNhYmxpbmcgYXV0b21hdGljIHN0cmluZyBkZXRlY3Rpb24iCgo+ID4gSWYsIGZvciBpbnN0YW5j
ZSwgcG9sbGluZyBtb2RlIGlzIGVuYWJsZWQsIG1heWJlIHNvbWV0aGluZyBsaWtlIHRoaXMKPiA+
IHdvdWxkIGJlIGJldHRlcj8KPiA+IAo+ID4gICAgICAgZGV2X3dhcm4oJnBkZXYtPmRldiwgIk5v
IElSUSBmb3VuZCwgZmFsbGluZyBiYWNrIHRvIHBvbGxpbmcKPiA+IG1vZGVcbiIpOwoKLS0gCkxl
ZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
