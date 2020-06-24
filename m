Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE882077CF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024ED6E0F7;
	Wed, 24 Jun 2020 15:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467816E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:43:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a6so4781235wmm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QM8WHNX4JVzp1tT3alZnq1KeTZs+/wuqZ6hsAIKxcMA=;
 b=Olmv6gOFR6NbOAqgFzCBJx/sCYV/IREx2uVFDnyNUpwSY/mDxH4RQEaIIqwkxB4ICw
 OmlyLQtUPS7BKq9rjxqW7PsmSayRlxNsp3CBwqOphzrTJesmqsd/9oNQrA3IlpYUW0PZ
 fudSy31IumvzQrnLbUbjZSN5JGU9DP5XWjcMbAryKvmqsYifSefNVUqu2Su8OXQvPMVE
 dsVZolchYV5cK7gk0/DRSho+Ia0WuTzYBvKGvhRhtgPUURP4Ndkk9KgCqzQ81nwD7C0z
 CNpkJgEMvLNJ4qfZ1RFZnaKXBpWwSTDYACp0W4/tSjgSY9pUvicATh27hnBP4HKau3Ho
 XwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QM8WHNX4JVzp1tT3alZnq1KeTZs+/wuqZ6hsAIKxcMA=;
 b=bBQucfvj/797M6PjY2RSFeQ8/4uqugVNMoEeElQ6z/T9mOKyUXGcNHzLG1U5uPU/6g
 l/YFvMwVAJUyZqE+GyQjWg3BhiLjzZE1oIpPWLDEihnbi3PrQ6zWWCkbNCC6xm7o1hN0
 zhWKtvCEh9Qq8i5N4KdZnI+WVDgyt+mSN36FO4cDUVFw/RJuqBP8I7nygMcwAsV8VzLX
 uWBZz8sPupz/7UBRMX97/4LgeVbGlz0knHmL3WIPq2QEOAcW0x2DpJonQTzz+bdzBoEN
 FJ7vF9Bk8Hh0e5nY1HHeVuEW/k6ZjDKu493ToL5KskEr6q+J0aR3gX8MaOd1GnUJIUnE
 dEhQ==
X-Gm-Message-State: AOAM530aC+4srV+Wu4/XoSTbWMryFUETIVjxfE043yg5VQYbb6Szv5rc
 aCyYHi1YPqixsHS9NkKoocC9eA==
X-Google-Smtp-Source: ABdhPJwj67zlK538LD9M3+i8IFmwRhOZYaUWn/TQagj8Vmc62JySmFUQKYtWcbTLacIAWDoe1q9dnA==
X-Received: by 2002:a7b:c345:: with SMTP id l5mr32069049wmj.31.1593013403867; 
 Wed, 24 Jun 2020 08:43:23 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id c143sm8597840wmd.1.2020.06.24.08.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:43:23 -0700 (PDT)
Date: Wed, 24 Jun 2020 16:43:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Message-ID: <20200624154321.GH954398@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624153216.GA1814806@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624153216.GA1814806@ravnborg.org>
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBKdW4gMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUuCj4gCj4g
T24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDM6NTc6MTNQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gQXR0ZW1wdGluZyB0byBjbGVhbi11cCBXPTEga2VybmVsIGJ1aWxkcywgd2hpY2ggYXJl
IGN1cnJlbnRseQo+ID4gb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoIG5pZ2dseSBsaXR0bGUg
d2FybmluZ3MuCj4gPiAKPiA+IExlZSBKb25lcyAoOCk6Cj4gPiAgIGJhY2tsaWdodDogbG1zNTAx
a2YwMzogUmVtb3ZlIHVudXNlZCBjb25zdCB2YXJpYWJsZXMKPiA+ICAgYmFja2xpZ2h0OiBsY2Q6
IEFkZCBtaXNzaW5nIGtlcm5lbGRvYyBlbnRyeSBmb3IgJ3N0cnVjdCBkZXZpY2UgcGFyZW50Jwo+
IAo+IAo+ID4gICBiYWNrbGlnaHQ6IGlsaTkyMng6IEFkZCBtaXNzaW5nIGtlcm5lbGRvYyBkZXNj
cmlwdGlvbnMgZm9yCj4gPiAgICAgQ0hFQ0tfRlJFUV9SRUcoKSBhcmdzCj4gPiAgIGJhY2tsaWdo
dDogaWxpOTIyeDogUmVtb3ZlIGludmFsaWQgdXNlIG9mIGtlcm5lbGRvYyBzeW50YXgKPiA+ICAg
YmFja2xpZ2h0OiBpbGk5MjJ4OiBBZGQgbWlzc2luZyBrZXJuZWxkb2MgZGVzY3JpcHRpb24gZm9y
Cj4gPiAgICAgaWxpOTIyeF9yZWdfZHVtcCgpJ3MgYXJnCj4gSSB3b25kZXIgd2h5IHRoZXNlIHdh
cm5pbmdzIHNob3cgdXAgYXMgbm90aGluZyBwdWxscyBpbiB0aGlzIC5jIGZpbGUuCj4gQW55d2F5
IEkgd291bGQgc3VnZ2VzdCB0byBkcm9wIHVzaW5nIGtlcm5lbGRvYyBzeW50YXggZm9yIHNpbmds
ZSBkcml2ZXJzCj4gbGlrZSB0aGlzIC0gYW5kIHRoZSBiZW5lZml0IGhlcmUgaXMgbG93Lgo+IE5v
dyB0aGV5IGFyZSB0eXBlZCwgb3RoZXJ3aXNlIHRoaXMgYWhkIGJlZW4gZmluZSBpbiBhIHNpbmds
ZSBwYXRjaC4KCldoYXQgZG8geW91IG1lYW4gYnkgJ25vdGhpbmcgcHVsbHMgaXQgaW4nPwoKPiA+
ICAgYmFja2xpZ2h0OiBiYWNrbGlnaHQ6IFN1cHBseSBkZXNjcmlwdGlvbiBmb3IgZnVuY3Rpb24g
YXJncyBpbiBleGlzdGluZwo+ID4gICAgIEtlcm5lbGRvY3MKPiA+ICAgYmFja2xpZ2h0OiBsbTM2
MzBhX2JsOiBSZW1vdmUgaW52YWxpZCBjaGVja3MgZm9yIHVuc2lnbmVkIGludCA8IDAKPiA+ICAg
YmFja2xpZ2h0OiBxY29tLXdsZWQ6IFJlbW92ZSB1bnVzZWQgY29uZmlncyBmb3IgTEVEMyBhbmQg
TEVENAo+IAo+IFRoZSBvdGhlciBmaXhlcyBsb29rcyBnb29kLgo+IFRoZXkgYXJlIGFsbDoKPiBB
Y2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKVGhhbmtzIChhbHRob3Vn
aCB0aGlzIHNob3VsZCBiZSBSZXZpZXdlZC1ieSkuCgo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2JhY2tsaWdodC5jICB8IDIgKysKPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pbGk5
MjJ4LmMgICAgfCA4ICsrKysrKy0tCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGNkLmMg
ICAgICAgIHwgMSArCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIHwg
NCArKy0tCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG1zNTAxa2YwMy5jIHwgOCAtLS0t
LS0tLQo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jICB8IDggLS0tLS0t
LS0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygt
KQo+ID4gCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAt
IERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
