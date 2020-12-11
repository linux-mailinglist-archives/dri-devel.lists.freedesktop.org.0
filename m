Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83BB2D93EF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D47C6E086;
	Mon, 14 Dec 2020 08:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293B6E14B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 15:15:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c198so7852000wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 07:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OECze9Jt9lBpL1kXAkGtCIUVYABJ/DIpOTJhLsdDY8Q=;
 b=mrA6CS98fHBqM2F7o5CkOmxR/FQ+0Frv9IROTP+aTdgdOKW3sZ8kkUy7plP/W4wORj
 +rHz6KGlUU7OfBbY/0S5Vyy/7AfBSCRvracsKrdX8KjTZdZX/57FMlggiM7qpV/EuO43
 3g3nIUZNVcIt7GzQ0QUv0jK4OQXkdMLVN8e9BHwk+ZtOMuj42NXigfKlpyEIqHuDDwEn
 IcRz09qkmh3lrrOGdwLaHNXGsysOHnxU1ygfA23Yg+yP3+lulT2yyrVaNXF9BPLAynHt
 UiIx7iAWky2G2z9RYC3/TANyW7JT9pwR+VQofv/CwvcPwy8cw/tfUC5QpPufsmZouZqr
 TVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OECze9Jt9lBpL1kXAkGtCIUVYABJ/DIpOTJhLsdDY8Q=;
 b=CC7wSzgxv0PpGsyLUMsD18EE1YwQMhzjRrzOpNZIQ9YisZnQ0m2neuTWjedkIzAR9F
 Od+L0hPPfI26WoBN8aDzyAfKlz6POyBYnZbOCH0LiahnnGGzJChfuyoRmrcQjgSI32H9
 JOXVPC64Nf/l7dI62fPekzzJlvBLdTu+fUswC0qGPpVNXYJv4PLdzVDvjjgn5aK3PCtw
 ikxLcwGDc/rY3NjbuqsaL5aaGlFCwXftMG9EDhnqOMF2fsi8uMzwM52jpR9X0rCAObRD
 Jm5DmBzFtIE1JNjV8H43xjfa1dxldeWq3qJ4X/JZ1id+6+rTBdWIix4Ax6MpoOQjARf3
 OwyQ==
X-Gm-Message-State: AOAM530jBJAWE76dKnAsprswYZXeQ/jlnBZNMFK+3FQC+kLuqdeyd90I
 dqhJ8jHUZIjLsFyfgBfC+mOkaA==
X-Google-Smtp-Source: ABdhPJwSw9KfkzNQCIW2g9OwTZ6Gio2UXdfnhkPfemMqHExICDIocG5KQHD4pDxGZcYwrfywZBxGMg==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr14076638wmb.83.1607699710411; 
 Fri, 11 Dec 2020 07:15:10 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:fc92:290c:960a:52ef?
 ([2a01:e34:ed2f:f020:fc92:290c:960a:52ef])
 by smtp.googlemail.com with ESMTPSA id b9sm15302235wmd.32.2020.12.11.07.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 07:15:09 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Thermal devfreq cooling improvements with Energy
 Model
To: Lukasz Luba <lukasz.luba@arm.com>
References: <20201210143014.24685-1-lukasz.luba@arm.com>
 <04bdcc7a-c264-ffd2-89a2-5606e59ff786@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7545df9d-9cbc-d35c-6d32-39c4f96cc216@linaro.org>
Date: Fri, 11 Dec 2020 16:15:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04bdcc7a-c264-ffd2-89a2-5606e59ff786@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, rui.zhang@intel.com,
 ionela.voinescu@arm.com, orjan.eide@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTIvMjAyMCAxNjoxMSwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+
IERvIHlvdSB0aGluayBpdCBoYXMgY2hhbmNlIHRvIGdvIHRvIGFzIG1hdGVyaWFsIGZvciB2NS4x
MT8KClllcywgaXQgaXMgaW4gdGhlIHRoZXJtYWwvbGludXgtbmV4dCBtYXRlcmlhbCBBVE0uCgoK
PiBPbiAxMi8xMC8yMCAyOjMwIFBNLCBMdWthc3ogTHViYSB3cm90ZToKPj4gSGkgYWxsLAo+Pgo+
PiBUaGlzIHBhdGNoIHNldCBpcyBhIGNvbnRpbnVhdGlvbiBvZiBteSBwcmV2aW91cyB3b3JrLCB3
aGljaCBhaW1lZAo+PiB0byBhZGQgRW5lcmd5IE1vZGVsIHRvIGFsbCBkZXZpY2VzIFsxXS4gVGhp
cyBzZXJpZXMgaXMgYSBmb2xsb3cgdXAKPj4gZm9yIHRoZSBwYXRjaGVzIHdoaWNoIGdvdCBtZXJn
ZWQgdG8gdjUuOS1yYzEuIEl0IGFpbXMgdG8gY2hhbmdlCj4+IHRoZSB0aGVybWFsIGRldmZyZXEg
Y29vbGluZyBhbmQgdXNlIHRoZSBFbmVyZ3kgTW9kZWwgaW5zdGVhZCBvZgo+PiBwcml2YXRlIHBv
d2VyIHRhYmxlIGFuZCBzdHJ1Y3R1cmVzLiBUaGUgcG93ZXIgbW9kZWwgaXMgbm93IHNpbXBsaWZp
ZWQsCj4+IHN0YXRpYyBwb3dlciBhbmQgZHluYW1pYyBwb3dlciBhcmUgcmVtb3ZlZC4gVGhlIG5l
dyByZWdpc3RyYXRpb24KPj4gaW50ZXJmYWNlCj4+IGluIHRoZSBwYXRjaCAzLzUgaGVscHMgdG8g
cmVnaXN0ZXIgZGV2ZnJlcSBjb29saW5nIGFuZCB0aGUgRU0gaW4gb25lCj4+IGNhbGwuCj4+IFRo
ZXJlIGlzIGFsc28gc21hbGwgaW1wcm92ZW1lbnQsIHBhdGNoIDIvNSBpcyBjaGFuZ2luZyB0aGUg
d2F5IGhvdwo+PiB0aGVybWFsIGdldHMgdGhlIGRldmljZSBzdGF0dXMgKG5vdyB1c2VzIGEgY29w
eSkgYW5kIG5vcm1hbGl6ZSB0aGUKPj4gdmFsdWVzLgo+PiBUaGUgbGFzdCBwYXRjaCBpcyBoZXJl
IGZvciBjb25zaXN0ZW5jeSBhbmQgd2lsbCBwcm9iYWJseSBnbyB0aHJvdWdoCj4+IGRybSB0cmVl
Lgo+Pgo+PiBUaGUgcGF0Y2ggc2V0IHNob3VsZCBhcHBseSBvbiB0b3Agb2YgdGhlcm1hbC90ZXN0
aW5nLiBJdCBkb2VzIG5vdAo+PiBkZXBlbmQgb24KPj4gbmV3IEVNIEFQSSBjaGFuZ2Ugd2hpY2gg
aXMgcXVldWVkIGluIHRoZSBwbS9saW51eC1uZXh0IHRyZWUgYXMgdjUuMTEKPj4gbWF0ZXJpYWwu
Cj4+IFRodXMsIGNvdWxkIGdvIGluIHBhcmFsbGVsLiBUaGF0IHdhcyB0aGUgbWFpbiBtb3Rpdmlh
dGlvbiBmb3IgdGhpcyB2NC4KPj4KPj4gY2hhbmdlczoKPj4gdjQ6Cj4+IC0gcGF0Y2ggMy81IC0g
cmVtb3ZlZCBkZXBlbmRlbmN5IG9uIHRoZSBFTSBBUEkgY2hhbmdlCj4+IC0tIHJlbW92ZWQgZW1f
ZGV2X3JlZ2lzdGVyX3BlcmZfZG9tYWluKCkgYW5kIGp1c3QgdXNlCj4+IMKgwqDCoCBkZXZfcG1f
b3BwX29mX3JlZ2lzdGVyX2VtKCkgd2hpY2ggQVBJIGhhcyBub3QgY2hhbmdlZAo+PiAtLSByZW1v
dmVkIGEgaGVscGVyIHJlZ2lzdHJhdGlvbiBmdW5jdGlvbiBhbmQgcmVuYW1lZAo+PiDCoMKgwqAg
ZGV2ZnJlcV9jb29saW5nX2VtX3JlZ2lzdGVyX3Bvd2VyKCkgdG8gZGV2ZnJlcV9jb29saW5nX2Vt
X3JlZ2lzdGVyKCkKPj4gwqDCoMKgICh3YXMgYWN0dWFsbHkgc3VnZ2VzdGVkIGJ5IElvbmVsYSBk
dXJpbmcgcmV2aWV3KQo+PiAtLSBtb3ZlZCBlbmVyZ3lfbW9kZWwuaCB0byBpbmNsdWRlIGluIGRl
dmZyZXFfY29vbGluZy5jIG5vdCAuaCwgc2luY2UKPj4gwqDCoMKgIHRoZXJlIGlzIG5vIEVNIHN0
cnVjdHVyZSBpbiB0aGVyZSBhbnltb3JlCj4+IC0gYWRqdXN0ZWQgY29tbWVudHMgYW5kIGNvbW1p
dCBtZXNzYWdlcwo+PiB2MyBbNF06Cj4+IC0gZHJvcHBlZCBkaXJlY3QgY2hlY2sgb2YgZGV2aWNl
IHN0YXR1cyBhbmQgdXNlZCBqdXN0IGEgY29weSBvZiAnc3RhdHVzJzsKPj4gwqDCoCBhIHNlcGFy
YXRlIHBhdGNoIHNldCB3aWxsIGJlIHByb3Bvc2VkIHRvIGFkZHJlc3MgdGhpcyBpc3N1ZQo+PiAt
IG1vZGlmaWVkIF9ub3JtYWxpemVfbG9hZCgpIGFuZCB1c2VkIDEwMjQgc2NhbGUgdG8gaGFuZGxl
IG1zLCB1cywgbnMKPj4gLSByZW1vdmVkICdlbV9yZWdpc3RlcmVkJyBhbmQgY2FsbGVkIGVtX2Rl
dl91bnJlZ2lzdGVyX3BlcmZfZG9tYWluKCkKPj4gwqDCoCB1bmNvbmRpdGlvbmFsbHksIHNvIHRo
ZSBkcml2ZXJzIHdpbGwgaGF2ZSB0byBtYWtlIHN1cmUgdGhlIHJpZ2h0Cj4+IG9yZGVyIG9mCj4+
IMKgwqAgYWxsIHVucmVnaXN0ZXIgY2FsbHMgdG8gZnJhbWV3b3JrcyB3aGljaCBtaWdodCB1c2Ug
RU07IHRoaXMgY2FsbAo+PiBtdXN0IGJlIGxhc3QKPj4gwqDCoCBvbmU7IGEgcHJvcGVyIGNvbW1l
bnQgYWRkZWQKPj4gLSByZW1vdmVkICdlbScgcG9pbnRlciBmcm9tIHN0cnVjdCBkZXZmcmVxX2Nv
b2xpbmdfZGV2aWNlLAo+PiAnZGV2LT5lbV9wZCcgaXMgdXNlZAo+PiAtIHJlbW92ZWQgb2Zfbm9k
ZV9nZXQvcHV0KCksIHNpbmNlIHRoZSBjb2RlIGNhbiBoYW5kbGUgaXQKPj4gLSByZW1vdmVkIGRm
Y19lbV9nZXRfcmVxdWVzdGVkX3Bvd2VyKCkgKGFzIG1pc3NlZCB0byBkbyBpdCBpbiB2MikKPj4g
LSBjb2xsZWN0ZWQgYWxsIFJldmlld2VkLWJ5IHRhZ3MKPj4gdjIgWzNdOgo+PiAtIHJlbmFtZWQg
ZnJlcV9nZXRfc3RhdGUoKSBhbmQgcmVsYXRlZCB0byBwZXJmX2lkeCBwYXR0ZXJuIGFzCj4+IMKg
wqAgc3VnZ2VzdGVkIGJ5IElvbmVsYQo+PiB2MSBbMl0KPj4KPj4gUmVnYXJkcywKPj4gTHVrYXN6
IEx1YmEKPj4KPj4gTHVrYXN6IEx1YmEgKDUpOgo+PiDCoMKgIHRoZXJtYWw6IGRldmZyZXFfY29v
bGluZzogY2hhbmdlIHRyYWNpbmcgZnVuY3Rpb24gYW5kIGFyZ3VtZW50cwo+PiDCoMKgIHRoZXJt
YWw6IGRldmZyZXFfY29vbGluZzogdXNlIGEgY29weSBvZiBkZXZpY2Ugc3RhdHVzCj4+IMKgwqAg
dGhlcm1hbDogZGV2ZnJlcV9jb29saW5nOiBhZGQgbmV3IHJlZ2lzdHJhdGlvbiBmdW5jdGlvbnMg
d2l0aCBFbmVyZ3kKPj4gwqDCoMKgwqAgTW9kZWwKPj4gwqDCoCB0aGVybWFsOiBkZXZmcmVxX2Nv
b2xpbmc6IHJlbW92ZSBvbGQgcG93ZXIgbW9kZWwgYW5kIHVzZSBFTQo+PiDCoMKgIGRybS9wYW5m
cm9zdDogUmVnaXN0ZXIgZGV2ZnJlcSBjb29saW5nIGFuZCBhdHRlbXB0IHRvIGFkZCBFbmVyZ3kg
TW9kZWwKPj4KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEu
YyB8wqDCoCAyICstCj4+IMKgIGRyaXZlcnMvdGhlcm1hbC9kZXZmcmVxX2Nvb2xpbmcuY8KgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMzkxICsrKysrKysrKy0tLS0tLS0tLS0tCj4+IMKgIGluY2x1ZGUv
bGludXgvZGV2ZnJlcV9jb29saW5nLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI3ICst
Cj4+IMKgIGluY2x1ZGUvdHJhY2UvZXZlbnRzL3RoZXJtYWwuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAxOSArLQo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDE5OCBpbnNlcnRpb25zKCsp
LCAyNDEgZGVsZXRpb25zKC0pCj4+CgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5h
cm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cjxo
dHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
