Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2D92A07D1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 15:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B82B6EDE5;
	Fri, 30 Oct 2020 14:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399AC6EDE5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 14:27:06 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a71so1496243edf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KOq05ZTVAZUwFn2z0r1O/ls+g1XNm19DnWV0oi3UGUA=;
 b=UzpOn9EjVdf9x3ZHzJ2GMA2wxoWSLjbeDHYFuMCQnrONfQV8XoujwlQIjq/RcbKbVv
 JnlAYqzg2IgtEt+BWzffmLS+7izCRVuCnDutuUksT7NcHKBm2hWgAg1a+ijCg+MzAoGv
 qj/IMvY+mLKP9gL6e0SOpKLGgyMzLitIOQcxfX2JB1FS6eCRX7Asagj+aO8vFMg5PODb
 53Dggl8pzTBnamtWTyOqim5dmG+b3Y0ng/PNsqVnV3oy/S679+SnvIPQYvgQlfVWRvU5
 6NxkN6E6a/paIdWcOWpABLXtszwSXwAZeE76U5Oc+6vaRX3pDB9Uz8kqO8rikFwaLC9m
 TNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=KOq05ZTVAZUwFn2z0r1O/ls+g1XNm19DnWV0oi3UGUA=;
 b=Z7wwvgKk3nOIOihuhlDF6yb+bbKa5IoFLz/a5/gzC6nDPS6Q3ykHGuOo2bA/CJ95ut
 gfmXA3d1nSU++qIfx7dhMrX3VUDjZK5ccdNtZgXe2EhezNnWTgZ00388KKj15mKFlur5
 jHN1vWeV0sLUD4ku8lqFc963fbk/J5vpsJs5+73YKNHNTNLLOYxvpRDHvpx+jxemuvyu
 hT8VfbsmSiv6R3WTVS8gQ0ifKjEn6erqf/yOU5AXWHlAKp90NtrhBU8wpiyLsZBNymdJ
 sTe+/NAPAipdCBMH5f/scZe4mCmxuBXpeaztloiDbEJHoYj8gb/J4S5o33Tz567jkqbN
 fSmg==
X-Gm-Message-State: AOAM533N8m5zR5evOhePwCLCRsaTLDLH0EHgXQ9tfLvbUQUCsJLe6yq1
 7mH82XjrSAYaJuPl8sAL//N/9tUG6OU=
X-Google-Smtp-Source: ABdhPJwQRoa3Yt/5/dwGY5HrUjvZl49KG1xfmg6AJs6xIciFvbSFPziyTGiG2pz6wvtvpaGkL7Xpyw==
X-Received: by 2002:a50:dac1:: with SMTP id s1mr2687113edj.74.1604068024899;
 Fri, 30 Oct 2020 07:27:04 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s12sm3133565edu.28.2020.10.30.07.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 07:27:04 -0700 (PDT)
Subject: Re: [PATCH] drm/nouveu: fix swiotlb include
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20201030111301.13458-1-christian.koenig@amd.com>
 <CAKMK7uFXKksw1F4cKRgKFfsNbVWo4VNt0-+-nu7+cv9OPD14Yg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5fe038e5-fe6c-fb67-8668-8cde0ccf52d0@gmail.com>
Date: Mon, 2 Nov 2020 11:27:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFXKksw1F4cKRgKFfsNbVWo4VNt0-+-nu7+cv9OPD14Yg@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMTAuMjAgdW0gMTM6MDggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgT2N0
IDMwLCAyMDIwIGF0IDEyOjEzIFBNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBUaGUgY2hlY2sgZm9yIHN3aW90bGIgaGFzIG1v
dmVkIHRvIG5vdXZldV90dG0uYywgYnV0IHdlIGZvcmdvdCB0byBtb3ZlCj4+IHRoZSBpbmNsdWRl
IGFzIHdlbGwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBIbSBkcm0tbWlzYy1uZXh0IGNvbXBpbGVzIGZpbmUgd2l0aCBz
d2lvdGxiIGVuYWJsZWQgaW4gY29uZmlnLiBBbSBJCj4gYmxpbmQgb3IgaXMgdGhpcyBhIG1lcmdl
IHByb2JsZW0gd2l0aCAtcmMxPyBJZiB0aGUgbGF0dGVyIG5lZWQgdG8gZ2l2ZQo+IFRob21hcyBh
IGhlYWRzLXVwIGFib3V0IHRoYXQgZm9yIHRoZSBiYWNrbWVyZ2Ugb2YgLXJjMi4KCkl0J3MgYSBt
ZXJnZSBwcm9ibGVtIHdpdGggbGludXgtbmV4dCBTdGVwaGVuIHBvaW50ZWQgb3V0LgoKQW5kIGJl
Zm9yZSB5b3UgYXNrOiBOb3BlLCBJIGhhdmUgbm8gaWRlYSB3aHkgZHJtLW1pc2MtbmV4dCBhbG9u
ZSAKY29tcGlsZXMgZmluZSBlaXRoZXIuCgpBbnl3YXkgdGFraW5nIG92ZXIgdGhlIGluY2x1ZGUg
aXMgdGhlIHJpZ2h0IHRoaW5nIHRvLWRvLiBDYW4gSSBwbGVhc2UgCmdldCBhbiByYj8KClRoYW5r
cywKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmMgIHwgMSAtCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV90dG0uYyB8IDMgKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+
PiBpbmRleCA3NDZjMDZlZDE5NWIuLjgxMzMzNzdkODY1ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfYm8uYwo+PiBAQCAtMjgsNyArMjgsNiBAQAo+PiAgICAqLwo+Pgo+PiAg
ICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+PiAtI2luY2x1ZGUgPGxpbnV4L3N3aW90
bGIuaD4KPj4KPj4gICAjaW5jbHVkZSAibm91dmVhdV9kcnYuaCIKPj4gICAjaW5jbHVkZSAibm91
dmVhdV9jaGFuLmgiCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+PiBpbmRl
eCBkNjk2ZDg4MmM5ZWIuLjJiZjM2MjI5ZGQ1NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3R0bS5jCj4+IEBAIC0yMiw2ICsyMiw5IEBACj4+ICAgICogT1RIRVJXSVNFLCBB
UklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9S
IFRIRQo+PiAgICAqIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCj4+ICAg
ICovCj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+Cj4+ICsKPj4gICAjaW5jbHVk
ZSAibm91dmVhdV9kcnYuaCIKPj4gICAjaW5jbHVkZSAibm91dmVhdV9nZW0uaCIKPj4gICAjaW5j
bHVkZSAibm91dmVhdV9tZW0uaCIKPj4gLS0KPj4gMi4xNy4xCj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4KPiAtLQo+IERhbmll
bCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8v
YmxvZy5mZndsbC5jaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
