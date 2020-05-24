Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B81E07D1
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B1F89E9E;
	Mon, 25 May 2020 07:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6200A89DB7
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 18:41:19 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id l15so18126725lje.9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 11:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i8KyzXHKIumyKcOOKIQxQqqoRSvdhyjaN9Ou/p7liK8=;
 b=BqhRT/gd4E44riA6Wiy8Om0tHR69jQXMYmbdhNefaQphsk3H7v9+/R4I4EuLk/MrEP
 +Dv2TRzhLwOpCc0n597mnkqxjySzcoio4vs5V0pPN+M+sYCjBDcFbMxrCiCswJh0QY4N
 yzsg7iTNM4tTwkfFmmn7ZXuzXSy2ZcX8DNj+UBKpPMLu1EtZcgXxroyvdH7HPHp+ikfl
 xuNzKBCj3bziZCjoV8U5N5dXY4cxhsdWtcveEi52GXgaX1HidVQJ6mBoKvpmWhJ9bdrN
 oi9jyv6NLMP9rnzK+Vo6/cJGAr5sAL7GM95v2vLs0N70raolMn+Bml8LzNAeyqsIEKeX
 W8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i8KyzXHKIumyKcOOKIQxQqqoRSvdhyjaN9Ou/p7liK8=;
 b=i4WiBAyywYh0WytVq5iaVlMiCelasXoWJqm63+u1YNet7oL2R0JrlYoLbkMg/YkvFu
 EaWIXIGVDYEr2ok1KYuwDLWZruMlAFM7xZJzsFXVcfK9oFeAk8eatbtafkuSua/WbwyY
 ulrAeScsP4pDgQib9D1azquTfrHzUyQTWahy5NULsVXRqZ/WXDVrvz7PLn7WD/pY6uZy
 vrFgtMfxGdC5zHKaDnBdMw6T3czRcFK4ZB8jJ0rgBgoR0yh1spFpRzEzQmWiQG1np2du
 Vzs6JiKndlZhZnw6r4qS/qqqOPpYqe9iaR1owMlQbwOghWUsdqyW0u8fBSSRYPMTStgd
 h8Fg==
X-Gm-Message-State: AOAM532JJQSvGgomBgiEVdV25icJlbys17uxf3jGETWCboplKBTrdE1P
 +2+gVY1VBq+SMrs7AY8Zy0T39Kzw
X-Google-Smtp-Source: ABdhPJzswEHQjqu7AlJZeRjZr+f5jmG4PSyaBms0l5qUUhd3hzXmhpqNt+e61OpwIJBsdLbfxMAAbw==
X-Received: by 2002:a2e:9746:: with SMTP id f6mr12032867ljj.189.1590345677778; 
 Sun, 24 May 2020 11:41:17 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.googlemail.com with ESMTPSA id o4sm4063239lfb.75.2020.05.24.11.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 May 2020 11:41:17 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] Support DRM bridges on NVIDIA Tegra
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
Message-ID: <65a9c464-7031-586d-3b5e-d29ec01934ab@gmail.com>
Date: Sun, 24 May 2020 21:41:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418170703.1583-1-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTguMDQuMjAyMCAyMDowNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gSGVsbG8sCj4g
Cj4gVGhpcyBzZXJpZXMgYWRkcyBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBEUk0gYnJpZGdlcyB0
byBOVklESUEgVGVncmEgRFJNCj4gZHJpdmVyLiBUaGlzIGlzIHJlcXVpcmVkIGJ5IG5ld2VyIGRl
dmljZS10cmVlcyB3aGVyZSB3ZSBtb2RlbCB0aGUgTFZEUwo+IGVuY29kZXIgYnJpZGdlIHByb3Bl
cmx5Lgo+IAo+IENoYW5nZWxvZzoKPiAKPiB2NTogLSBBZGRlZCBuZXcgcGF0Y2hlcyB0aGF0IG1h
a2UgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgbW9yZSB1c2FibGUKPiAgICAgICBpZiBn
cmFwaCBpc24ndCBkZWZpbmVkIGluIGEgZGV2aWNlLXRyZWU6Cj4gCj4gICAgICAgICBvZl9ncmFw
aDogYWRkIG9mX2dyYXBoX2dldF9sb2NhbF9wb3J0KCkKPiAgICAgICAgIGRybS9vZjogTWFrZSBk
cm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoKSB0byBjaGVjayBncmFwaCdzIHByZXNlbmNlCj4g
Cj4gICAgIC0gVXBkYXRlZCAiU3VwcG9ydCBEUk0gYnJpZGdlcyIgcGF0Y2ggdG8gdXNlIGRybV9v
Zl9maW5kX3BhbmVsX29yX2JyaWRnZSgpCj4gICAgICAgZGlyZWN0bHkgYW5kIGFkZGVkIFdBUk5f
T04ob3V0cHV0LT5wYW5lbCB8fCBvdXRwdXQtPmJyaWRnZSkgc2FuaXR5LWNoZWNrLgo+IAo+ICAg
ICAtIEFkZGVkIG5ldyAiV3JhcCBkaXJlY3RseS1jb25uZWN0ZWQgcGFuZWwgaW50byBEUk0gYnJp
ZGdlIiBwYXRjaCwgYXMKPiAgICAgICB3YXMgc3VnZ2VzdGVkIGJ5IExhdXJlbnQgUGluY2hhcnQu
Cj4gCj4gdjQ6IC0gRm9sbG93aW5nIHJldmlldyBjb21tZW50cyB0aGF0IHdlcmUgbWFkZSBieSBM
YXVyZW50IFBpbmNoYXJ0IHRvIHRoZSB2MywKPiAgICAgICB3ZSBub3cgY3JlYXRlIGFuZCB1c2Ug
dGhlICJicmlkZ2UgY29ubmVjdG9yIi4KPiAKPiB2MzogLSBGb2xsb3dpbmcgcmVjb21tZW5kYXRp
b24gZnJvbSBTYW0gUmF2bmJvcmcsIHRoZSBuZXcgYnJpZGdlIGF0dGFjaG1lbnQKPiAgICAgICBt
b2RlbCBpcyBub3cgYmVpbmcgdXNlZCwgaS5lLiB3ZSBhc2sgYnJpZGdlIHRvICpub3QqIGNyZWF0
ZSBhIGNvbm5lY3Rvcgo+ICAgICAgIHVzaW5nIHRoZSBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05O
RUNUT1IgZmxhZy4KPiAKPiAgICAgLSBUaGUgYnJpZGdlIGlzIG5vdyBjcmVhdGVkIG9ubHkgZm9y
IHRoZSBSR0IgKExWRFMpIG91dHB1dCwgYW5kIG9ubHkKPiAgICAgICB3aGVuIG5lY2Vzc2FyeS4g
Rm9yIG5vdyB3ZSBkb24ndCBuZWVkIGJyaWRnZXMgZm9yIEhETUkgb3IgRFNJIG91dHB1dHMuCj4g
Cj4gICAgIC0gSSBub3RpY2VkIHRoYXQgd2UncmUgbGVha2luZyBPRiBub2RlIGluIHRoZSBwYW5l
bCdzIGVycm9yIGNvZGUgcGF0aCwKPiAgICAgICB0aGlzIGlzIGZpeGVkIG5vdyBieSB0aGUgbmV3
IHBhdGNoICJEb24ndCBsZWFrIE9GIG5vZGUgb24gZXJyb3IiLgo+IAo+IHYyOiAtIEFkZGVkIHRo
ZSBuZXcgInJnYjogRG9uJ3QgcmVnaXN0ZXIgY29ubmVjdG9yIGlmIGJyaWRnZSBpcyB1c2VkIgo+
ICAgICAgIHBhdGNoLCB3aGljaCBoaWRlcyB0aGUgdW51c2VkIGNvbm5lY3RvciBwcm92aWRlZCBi
eSB0aGUgVGVncmEgRFJNCj4gICAgICAgZHJpdmVyIHdoZW4gYnJpZGdlIGlzIHVzZWQsIHNpbmNl
IGJyaWRnZSBwcm92aWRlcyBpdHMgb3duIGNvbm5lY3Rvcgo+ICAgICAgIHRvIHVzLgo+IAo+ICAg
ICAtIFBsZWFzZSBub3RpY2UgdGhhdCB0aGUgZmlyc3QgIlN1cHBvcnQgRFJNIGJyaWRnZXMiIHBh
dGNoIHdhcyBwcmV2aW91c2x5Cj4gICAgICAgc2VudCBvdXQgYXMgYSBzdGFuZGFsb25lIHYxIGNo
YW5nZS4KPiAKPiBEbWl0cnkgT3NpcGVua28gKDYpOgo+ICAgb2ZfZ3JhcGg6IGFkZCBvZl9ncmFw
aF9nZXRfbG9jYWxfcG9ydCgpCj4gICBkcm0vb2Y6IE1ha2UgZHJtX29mX2ZpbmRfcGFuZWxfb3Jf
YnJpZGdlKCkgdG8gY2hlY2sgZ3JhcGgncyBwcmVzZW5jZQo+ICAgZHJtL3RlZ3JhOiBvdXRwdXQ6
IERvbid0IGxlYWsgT0Ygbm9kZSBvbiBlcnJvcgo+ICAgZHJtL3RlZ3JhOiBvdXRwdXQ6IFN1cHBv
cnQgRFJNIGJyaWRnZXMKPiAgIGRybS90ZWdyYTogb3V0cHV0OiByZ2I6IFN1cHBvcnQgTFZEUyBl
bmNvZGVyIGJyaWRnZQo+ICAgZHJtL3RlZ3JhOiBvdXRwdXQ6IHJnYjogV3JhcCBkaXJlY3RseS1j
b25uZWN0ZWQgcGFuZWwgaW50byBEUk0gYnJpZGdlCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
b2YuYyAgICAgICB8IDEzICsrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmggICAg
fCAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYyB8IDIxICsrKysrKystLQo+
ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvcmdiLmMgICAgfCA4NSArKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvb2YvcHJvcGVydHkuYyAgICAgICAgICB8IDMyICsr
KysrKysrKy0tLS0KPiAgaW5jbHVkZS9saW51eC9vZl9ncmFwaC5oICAgICAgIHwgIDcgKysrCj4g
IDYgZmlsZXMgY2hhbmdlZCwgMTE0IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQo+IAoK
SGVsbG8gVGhpZXJyeSwKCkRvIHlvdSB5b3UgaGF2ZSBhbnkgb2JqZWN0aW9ucyB0byB0aGlzIHNl
cmllcz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
