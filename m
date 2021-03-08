Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE033183E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 21:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8103F89F4F;
	Mon,  8 Mar 2021 20:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1903689F2D;
 Mon,  8 Mar 2021 20:12:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id mm21so22840360ejb.12;
 Mon, 08 Mar 2021 12:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/W4otkmmjwcr/fDPTjV2MzMqweHNYI9SQRwwtT6wDVc=;
 b=UaP8Yjn41znjF/ge9BA49yawCJaal6NgtQjQPA52V4/2Yh5nXawOiI3EqYCqHTCV04
 YGY9hnEM0A+BPJBlKG/hE2SncTDlauMKxDomCTGVMt1HAOsGE6f7KFn+LKri6h/vW7tx
 Pf5LZ57yxjwvIIbcWs/CuI2R3WvYtMj1jrC8B7xsI9lqvn2fxwnNwqo4JUxLy/8o6CaR
 NaO/yqdjVRwEhn2S+Vo6ZNBrbO7zZn1eM3mheIRoWSlmvUuZlr6y7tTyVAZfMryBwkkX
 1JzNgIt25PkIteY2sxLMFLu7cfUS8Lidu1zEJBLIU9sL+ov+jNYZpuFI80SJxiJD+Vqh
 CUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/W4otkmmjwcr/fDPTjV2MzMqweHNYI9SQRwwtT6wDVc=;
 b=RMm/sC/Cj0MKc14rHxkf0GaonqL1Ve7HA/asBy87U1XIOJsktACaPuCIq5ZMt0Egcs
 VKYhCiIARIGUJ0DcYLkw3j0xsu27b47XrTlepknra8jyEAqkD8acWBffE2kpubT9WTDJ
 ZJjEj06qkvbmBu7jBAtHnNy311VCHHVDPykiWJwf7SV2nyFZOwKZE8uF4WMCkJLuPoji
 +nov+paHGgev9VHdHVEOyX6meYv76o4l2ulXqj6FUdmYIbuBLzC7BeV3+UcKT8Siz/hQ
 2ClLbVWLIYRlXp2QNw8nCtRrnB/wW7oASV9o/gI8mRjg/yC/ZdV1hw/XtT70FkgZgLJb
 DUcA==
X-Gm-Message-State: AOAM532ZINU1nDFzb0o/gIZMEACaO1+s1Zl/+op1rNRcgi6E0KTw7vhZ
 JfE5l6NoQzZOQCcvFPXWCjbn+nI1qaA=
X-Google-Smtp-Source: ABdhPJwfchN8hYHdQjUxA+RM+VV1rd5tt90jMxASWsGgdOMaCpDzs9dlA8KRQRBWgXjsgH3HODwV1Q==
X-Received: by 2002:a17:906:1d44:: with SMTP id
 o4mr15626192ejh.130.1615234364672; 
 Mon, 08 Mar 2021 12:12:44 -0800 (PST)
Received: from ?IPv6:2a01:c23:6c03:dc00:772e:c5dc:d360:4620?
 (dynamic-2a01-0c23-6c03-dc00-772e-c5dc-d360-4620.c23.pool.telefonica.de.
 [2a01:c23:6c03:dc00:772e:c5dc:d360:4620])
 by smtp.gmail.com with ESMTPSA id t15sm8264111edc.34.2021.03.08.12.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 12:12:44 -0800 (PST)
Subject: Re: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
To: Felix Kuehling <felix.kuehling@amd.com>, Arnd Bergmann <arnd@kernel.org>
References: <20210308153359.2513446-1-arnd@kernel.org>
 <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
 <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
 <92a6c999-c20a-2311-4e31-209a2d9229ed@amd.com>
 <CAK8P3a1SRubvaPzn2020Nc_SsL8xBW7ODGOGtF_4UYASGqTq-w@mail.gmail.com>
 <f2829f2e-6498-53d4-93fa-1613e988803f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <71d1bd79-881c-062c-0b41-4be0cdf3c4d5@gmail.com>
Date: Mon, 8 Mar 2021 21:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f2829f2e-6498-53d4-93fa-1613e988803f@amd.com>
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
Cc: Philip Yang <philip.yang@amd.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDMuMjEgdW0gMjE6MDIgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBBbSAyMDIxLTAz
LTA4IHVtIDI6MzMgcC5tLiBzY2hyaWViIEFybmQgQmVyZ21hbm46Cj4+IE9uIE1vbiwgTWFyIDgs
IDIwMjEgYXQgODoxMSBQTSBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4g
d3JvdGU6Cj4+PiBBbSAyMDIxLTAzLTA4IHVtIDI6MDUgcC5tLiBzY2hyaWViIEFybmQgQmVyZ21h
bm46Cj4+Pj4gT24gTW9uLCBNYXIgOCwgMjAyMSBhdCA1OjI0IFBNIEZlbGl4IEt1ZWhsaW5nIDxm
ZWxpeC5rdWVobGluZ0BhbWQuY29tPiB3cm90ZToKPj4+Pj4gVGhlIGRyaXZlciBidWlsZCBzaG91
bGQgd29yayB3aXRob3V0IElPTU1VdjIuIEluIGFtZGtmZC9NYWtlZmlsZSwgd2UKPj4+Pj4gaGF2
ZSB0aGlzIGNvbmRpdGlvbjoKPj4+Pj4KPj4+Pj4gaWZuZXEgKCQoQ09ORklHX0FNRF9JT01NVV9W
MiksKQo+Pj4+PiBBTURLRkRfRklMRVMgKz0gJChBTURLRkRfUEFUSCkva2ZkX2lvbW11Lm8KPj4+
Pj4gZW5kaWYKPj4+Pj4KPj4+Pj4gSW4gYW1ka2ZkL2tmZF9pb21tdS5oIHdlIGRlZmluZSBpbmxp
bmUgc3R1YnMgb2YgdGhlIGZ1bmN0aW9ucyB0aGF0IGFyZQo+Pj4+PiBjYXVzaW5nIHlvdXIgbGlu
ay1mYWlsdXJlcyBpZiBJT01NVV9WMiBpcyBub3QgZW5hYmxlZDoKPj4+Pj4KPj4+Pj4gI2lmIGRl
ZmluZWQoQ09ORklHX0FNRF9JT01NVV9WMl9NT0RVTEUpIHx8IGRlZmluZWQoQ09ORklHX0FNRF9J
T01NVV9WMikKPj4+Pj4gLi4uIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyAuLi4KPj4+Pj4gI2Vsc2UK
Pj4+Pj4gLi4uIHN0dWJzIC4uLgo+Pj4+PiAjZW5kaWYKPj4+PiBSaWdodCwgdGhhdCBpcyB0aGUg
cHJvYmxlbSBJIHRyaWVkIHRvIGV4cGxhaW4gaW4gbXkgcGF0Y2ggZGVzY3JpcHRpb24uCj4+Pj4K
Pj4+PiBTaG91bGQgd2UganVzdCBkcm9wIHRoZSAnaW1wbHknIHRoZW4gYW5kIGFkZCBhIHByb3Bl
ciBkZXBlbmRlbmN5IGxpa2UgdGhpcz8KPj4+Pgo+Pj4+ICAgICAgICBkZXBlbmRzIG9uIERSTV9B
TURHUFUgJiYgKFg4Nl82NCB8fCBBUk02NCB8fCBQUEM2NCkKPj4+PiAgICAgICAgZGVwZW5kcyBv
biBBTURfSU9NTVVfVjI9eSB8fCBEUk1fQU1ER1BVPW0KPj4+Pgo+Pj4+IEkgY2FuIHNlbmQgYSB2
MiBhZnRlciBzb21lIHRlc3RpbmcgaWYgeW91IHByZWZlciB0aGlzIHZlcnNpb24uCj4+PiBOby4g
TXkgcG9pbnQgaXMsIHRoZXJlIHNob3VsZCBub3QgYmUgYSBoYXJkIGRlcGVuZGVuY3kuIFRoZSBi
dWlsZCBzaG91bGQKPj4+IHdvcmsgd2l0aG91dCBDT05GSUdfQU1EX0lPTU1VX1YyLiBJIGRvbid0
IHVuZGVyc3RhbmQgd2h5IGl0J3Mgbm90Cj4+PiB3b3JraW5nIGZvciB5b3UuIEl0IGxvb2tzIGxp
a2UgeW91J3JlIGJ1aWxkaW5nIGtmZF9pb21tdS5vLCB3aGljaCBzaG91bGQKPj4+IG5vdCBiZSBo
YXBwZW5pbmcgd2hlbiBBTURfSU9NTVVfVjIgaXMgbm90IGVuYWJsZWQuIFRoZSBjb25kaXRpb24g
aW4KPj4+IGFtZGtmZC9NYWtlZmlsZSBzaG91bGQgbWFrZSBzdXJlIHRoYXQga2ZkX2lvbW11Lm8g
ZG9lc24ndCBnZXQgYnVpbHQgd2l0aAo+Pj4geW91ciBrZXJuZWwgY29uZmlnLgo+PiBBZ2Fpbiwg
YXMgSSBleHBsYWluZWQgaW4gdGhlIGNoYW5nZWxvZyB0ZXh0LCBBTURfSU9NTVVfVjIgY29uZmln
dXJlZCBhcwo+PiBhIGxvYWRhYmxlIG1vZHVsZSwgd2hpbGUgQU1ER1BVIGlzIGNvbmZpZ3VyZWQg
YXMgYnVpbHQtaW4uCj4gSSdtIHNvcnJ5LCBJIGRpZG4ndCByZWFkIGl0IGNhcmVmdWxseS4gQW5k
IEkgdGhvdWdodCAiaW1wbHkiIHdhcyBtZWFudAo+IHRvIGZpeCBleGFjdGx5IHRoaXMga2luZCBv
ZiBpc3N1ZS4KPgo+IEkgZG9uJ3Qgd2FudCB0byBjcmVhdGUgYSBoYXJkIGRlcGVuZGVuY3kgb24g
QU1EX0lPTU1VX1YyIGlmIEkgY2FuIGF2b2lkCj4gaXQsIGJlY2F1c2UgaXQgaXMgb25seSByZWFs
bHkgbmVlZGVkIGZvciBhIHNtYWxsIG51bWJlciBvZiBBTUQgQVBVcywgYW5kCj4gZXZlbiB0aGVy
ZSBpdCBpcyBub3cgb3B0aW9uYWwgZm9yIG1vcmUgcmVjZW50IG9uZXMuCj4KPiBJcyB0aGVyZSBh
IGJldHRlciB3YXkgdG8gYXZvaWQgYnVpbGQgZmFpbHVyZXMgd2l0aG91dCBjcmVhdGluZyBhIGhh
cmQKPiBkZXBlbmRlbmN5PwoKV2hhdCB5b3UgbmVlZCBpcyB0aGUgc2FtZSB0cmljayB3ZSB1c2Vk
IGZvciBBR1Agb24gcmFkZW9uL25vdXZlYXU6CgpkZXBlbmRzIG9uIEFNRF9JT01NVV9WMiB8fCAh
QU1EX0lPTU1VX1YyCgpUaGlzIHdheSB3aGVuIEFNRF9JT01NVV9WMiBpcyBidWlsZCBhcyBhIG1v
ZHVsZSBEUk1fQU1ER1BVIHdpbGwgYmUgYnVpbGQgCmFzIGEgbW9kdWxlIGFzIHdlbGwuIFdoZW4g
aXQgaXMgZGlzYWJsZWQgY29tcGxldGVseSB3ZSBkb24ndCBjYXJlLgoKUmVnYXJkcywKQ2hyaXN0
aWFuLgoKPiAgwqAgVGhlIGRvY3VtZW50YXRpb24gaW4KPiBEb2N1bWVudGF0aW9uL2tidWlsZC9r
Y29uZmlnLWxhbmd1YWdlLnJzdCBzdWdnZXN0cyB1c2luZyBpZgo+IChJU19SRUFDSEFCTEUoQ09O
RklHX0FNRF9JT01NVV9WMikpIHRvIGd1YXJkIHRob3NlIHByb2JsZW1hdGljIGZ1bmN0aW9uCj4g
Y2FsbHMuIEkgdGhpbmsgbW9yZSBnZW5lcmFsbHksIHdlIGNvdWxkIGd1YXJkIGFsbCBvZiBrZmRf
aW9tbXUuYyB3aXRoCj4KPiAgwqDCoMKgICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX0FNRF9JT01N
VV9WMikKPgo+IEFuZCB1c2UgdGhlIHNhbWUgY29uZGl0aW9uIHRvIGRlZmluZSB0aGUgc3R1YnMg
aW4ga2ZkX2lvbW11LmguCj4KPiBSZWdhcmRzLAo+ICDCoCBGZWxpeAo+Cj4KPj4gVGhlIGNhdXNl
cyBhIGxpbmsgZmFpbHVyZSBmb3IgdGhlIHZtbGludXggZmlsZSwgYmVjYXVzZSB0aGUgbGlua2Vy
IGNhbm5vdAo+PiByZXNvbHZlIGFkZHJlc3NlcyBvZiBsb2FkYWJsZSBtb2R1bGVzIGF0IGNvbXBp
bGUgdGltZSAtLSB0aGV5IGhhdmUKPj4gbm90IGJlZW4gbG9hZGVkIHlldC4KPj4KPj4gICAgICAg
IEFybmQKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
