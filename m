Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F535809A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA926EA77;
	Thu,  8 Apr 2021 10:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B20F6EA69;
 Thu,  8 Apr 2021 10:28:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id v140so3112128lfa.4;
 Thu, 08 Apr 2021 03:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LPO107UIELXUmTFJZW08o8GLzDXjGWIzyy9s4oTQ7A4=;
 b=ceUInljVwZGtFb7hgE6t0F8ZLV2SfegCa5eJtrMQioCkgjRy66CUvai16iVQce++hO
 nhfn7/LkX7iw75WuwUS+vMJ32hkcYDp9YV+SxEQQfhByhxlDktku/HFZTX76E9qwEBGN
 8ZOJModwAIERW/LEDupj0RPpkD8OE/AdQRrzrtGWBm12Qrm07WIVlkQXBtSE6Hut8eKM
 yh034Gj4d53m4uxiKlDaU2JwM/BrYZi/pkP7tU6jAIPR8ql3VbRijI6fxh/K+UbY/xz3
 QKOr683QS93LDaMpzbfYbloxzJI6iLbKUeUtE6unEAMRuoImfJwrjSijaDbvQtj71w2u
 /JjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LPO107UIELXUmTFJZW08o8GLzDXjGWIzyy9s4oTQ7A4=;
 b=AlkH1uhmSHEqC0BRhElkcZb3byEww6I81Z0oVJHAmIn166Q/WykDQ0okllXkb78D1g
 A9Q4Mjz8l//jVbQ1nBZ8Sjy4PZaq11XYgepEPVPXtNrybz4chvB+wrpE+yfWLpLzdCFi
 BgSLGlnGfhnzAAm/GWlz8SiNrwmAdPdYbHaZWD3zYt0osi9+BG1skHqXnUmUpf+odN9J
 /4ic/HBzR7d09u25iXj3nkMK2noRYEWDPKUtgYwNR9zkO9hn1kXJroPSfCSfwAwuSCql
 QmHN9h7ISU+nUsHSTExYqJPTMlT0dxsAL3bPFdAtj6c6eraPlZX0Wxfz/6DvP0620syu
 5NBA==
X-Gm-Message-State: AOAM531PVHHlYaI3ysPiKjgedalFfeDVMiIqSgw3b8uVCeCbetY5IM7V
 7J29R3Nj+J58zvbX2psqcdletVhEyns=
X-Google-Smtp-Source: ABdhPJy6dTJXnwB9Q7PHkJirj6xPaCisPylt8Qt8fhVimMbTgjytDXE34bVuWMzNQyBBuI8t2EQPPQ==
X-Received: by 2002:a05:6512:1147:: with SMTP id
 m7mr1415045lfg.337.1617877686995; 
 Thu, 08 Apr 2021 03:28:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:db83:c532:1fa2:b0cc?
 ([2a02:908:1252:fb60:db83:c532:1fa2:b0cc])
 by smtp.gmail.com with ESMTPSA id q26sm2781966lfm.53.2021.04.08.03.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 03:28:06 -0700 (PDT)
Subject: Re: [pull] amdgpu, radeon, ttm, sched drm-next-5.13
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@gmail.com>,
 "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
References: <20210401222931.3823-1-alexander.deucher@amd.com>
 <0fa472a5-08b4-87cd-c295-7502bd30c2c0@gmail.com>
 <CADnq5_NXz-B3BjQdP1x7P3tPC160EO906_TZObJhx85CHt6b2A@mail.gmail.com>
 <CAPM=9twymi8Emi+GpDW0Gz_OQ63BGwwzKwF_Jxq8=i_VC9U=3w@mail.gmail.com>
 <CADnq5_Ored1NxmDP5=_-5BXstsTdUPB31upM2AVFLXM1EXKQzQ@mail.gmail.com>
 <d5cf9d27-471c-f89d-375a-be4a76a5debc@gmail.com>
Message-ID: <18a67a9f-4199-ba39-d2a7-419d7993aac4@gmail.com>
Date: Thu, 8 Apr 2021 12:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d5cf9d27-471c-f89d-375a-be4a76a5debc@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDQuMjEgdW0gMDk6MTMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDA3LjA0
LjIxIHVtIDIxOjA0IHNjaHJpZWIgQWxleCBEZXVjaGVyOgo+PiBPbiBXZWQsIEFwciA3LCAyMDIx
IGF0IDM6MjMgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPj4+IE9u
IFdlZCwgNyBBcHIgMjAyMSBhdCAwNjo1NCwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFp
bC5jb20+IAo+Pj4gd3JvdGU6Cj4+Pj4gT24gRnJpLCBBcHIgMiwgMjAyMSBhdCAxMjoyMiBQTSBD
aHJpc3RpYW4gS8O2bmlnCj4+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3
cm90ZToKPj4+Pj4gSGV5IEFsZXgsCj4+Pj4+Cj4+Pj4+IHRoZSBUVE0gYW5kIHNjaGVkdWxlciBj
aGFuZ2VzIHNob3VsZCBhbHJlYWR5IGJlIGluIHRoZSBkcm0tbWlzYy1uZXh0Cj4+Pj4+IGJyYW5j
aCAobm90IDEwMCUgc3VyZSBhYm91dCB0aGUgVFRNIHBhdGNoLCBuZWVkIHRvIGRvdWJsZSBjaGVj
ayAKPj4+Pj4gbmV4dCB3ZWVrKS4KPj4+Pj4KPj4+PiBUaGUgVFRNIGNoYW5nZSBpcyBub3QgaW4g
ZHJtLW1pc2MgeWV0Lgo+Pj4+Cj4+Pj4+IENvdWxkIHRoYXQgY2F1c2UgcHJvYmxlbXMgd2hlbiBi
b3RoIGFyZSBtZXJnZWQgaW50byBkcm0tbmV4dD8KPj4+PiBEYXZlLCBEYW5pZWwsIGhvdyBkbyB5
b3Ugd2FudCB0byBoYW5kbGUgdGhpcz/CoCBUaGUgZHVwbGljYXRlZCBwYXRjaCAKPj4+PiBpcyB0
aGlzIG9uZToKPj4+PiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9j
b21taXQvP2lkPWFjNGViODNhYjI1NWRlOWMzMTE4NGRmNTFmZDE1MzRiYTM2ZmQyMTIgCj4+Pj4K
Pj4+PiBhbWRncHUgaGFzIGNoYW5nZXMgd2hpY2ggZGVwZW5kIG9uIGl0LsKgIFRoZSBzYW1lIHBh
dGNoIGlzIGluY2x1ZGVkIAo+Pj4+IGluIHRoaXMgUFIuCj4+PiBPdWNoIG5vdCBzdXJlIGhvdyBi
ZXN0IHRvIHN5bmMgdXAgaGVyZSwgbWF5YmUgZ2V0IG1pc2MtbmV4dCBpbnRvIG15Cj4+PiB0cmVl
IHRoZW4gcmViYXNlIHlvdXIgdHJlZSBvbiB0b3Agb2YgaXQ/Cj4+IEkgY2FuIGRvIHRoYXQuCj4K
PiBQbGVhc2UgbGV0IG1lIGRvdWJsZSBjaGVjayBsYXRlciB0b2RheSB0aGF0IHdlIGhhdmUgZXZl
cnl0aGluZyB3ZSBuZWVkIAo+IGluIGRybS1taXNjLW5leHQuCgpUaGVyZSB3aGVyZSB0d28gcGF0
Y2ggZm9yIFRUTSAob25lIGZyb20gRmVsaXggYW5kIG9uZSBmcm9tIE9haykgd2hpY2ggCnN0aWxs
IG5lZWRlZCB0byBiZSBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4gSSd2ZSBkb25lIHRoYXQganVz
dCBhIG1pbnV0ZSAKYWdvLgoKClRoZW4gd2UgaGF2ZSB0aGlzIHBhdGNoIHdoaWNoIGZpeGVzIGEg
YnVnIGluIGNvZGUgcmVtb3ZlZCBvbiAKZHJtLW1pc2MtbmV4dC4gSSB0aGluayBpdCBzaG91bGQg
YmUgZHJvcHBlZCB3aGVuIGFtZC1zdGFnaW5nLWRybS1uZXh0IGlzIApiYXNlZCBvbiBkcm0tbmV4
dC9kcm0tbWlzYy1uZXh0LgoKQXV0aG9yOiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+
CkRhdGU6wqDCoCBXZWQgRmViIDI0IDExOjI4OjA4IDIwMjEgKzA4MDAKCiDCoMKgwqAgZHJtL3R0
bTogRG8gbm90IGFkZCBub24tc3lzdGVtIGRvbWFpbiBCTyBpbnRvIHN3YXAgbGlzdAoKCkkndmUg
YWxzbyBmb3VuZCB0aGUgZm9sbG93aW5nIHBhdGNoIHdoaWNoIGlzIHByb2JsZW1hdGljIGFzIHdl
bGw6Cgpjb21taXQgYzhhOTIxZDQ5NDQzMDI1ZTEwNzk0MzQyZDQ0MzNiM2YyOTYxNjQwOQpBdXRo
b3I6IEphY2sgWmhhbmcgPEphY2suWmhhbmcxQGFtZC5jb20+CkRhdGU6wqDCoCBNb24gTWFyIDgg
MTI6NDE6MjcgMjAyMSArMDgwMAoKIMKgwqDCoCBkcm0vYW1kL2FtZGdwdSBpbXBsZW1lbnQgdGRy
IGFkdmFuY2VkIG1vZGUKCiDCoMKgwqAgW1doeV0KIMKgwqDCoCBQcmV2aW91cyB0ZHIgZGVzaWdu
IHRyZWF0cyB0aGUgZmlyc3Qgam9iIGluIGpvYl90aW1lb3V0IGFzIHRoZSBiYWQgam9iLgogwqDC
oMKgIEJ1dCBzb21ldGltZXMgYSBsYXRlciBiYWQgY29tcHV0ZSBqb2IgY2FuIGJsb2NrIGEgZ29v
ZCBnZnggam9iIGFuZAogwqDCoMKgIGNhdXNlIGFuIHVuZXhwZWN0ZWQgZ2Z4IGpvYiB0aW1lb3V0
IGJlY2F1c2UgZ2Z4IGFuZCBjb21wdXRlIHJpbmcgc2hhcmUKIMKgwqDCoCBpbnRlcm5hbCBHQyBI
VyBtdXR1YWxseS4KCiDCoMKgwqAgW0hvd10KIMKgwqDCoCBUaGlzIHBhdGNoIGltcGxlbWVudHMg
YW4gYWR2YW5jZWQgdGRyIG1vZGUuSXQgaW52b2x2ZXMgYW4gYWRkaXRpbmFsCiDCoMKgwqAgc3lu
Y2hyb25vdXMgcHJlLXJlc3VibWl0IHN0ZXAoU3RlcDAgUmVzdWJtaXQpIGJlZm9yZSBub3JtYWwg
cmVzdWJtaXQKIMKgwqDCoCBzdGVwIGluIG9yZGVyIHRvIGZpbmQgdGhlIHJlYWwgYmFkIGpvYi4K
CiDCoMKgwqAgMS4gQXQgU3RlcDAgUmVzdWJtaXQgc3RhZ2UsIGl0IHN5bmNocm9ub3VzbHkgc3Vi
bWl0cyBhbmQgcGVuZHMgZm9yIHRoZQogwqDCoMKgIGZpcnN0IGpvYiBiZWluZyBzaWduYWxlZC4g
SWYgaXQgZ2V0cyB0aW1lb3V0LCB3ZSBpZGVudGlmeSBpdCBhcyBndWlsdHkKIMKgwqDCoCBhbmQg
ZG8gaHcgcmVzZXQuIEFmdGVyIHRoYXQsIHdlIHdvdWxkIGRvIHRoZSBub3JtYWwgcmVzdWJtaXQg
c3RlcCB0bwogwqDCoMKgIHJlc3VibWl0IGxlZnQgam9icy4KCiDCoMKgwqAgMi4gRm9yIHdob2xl
IGdwdSByZXNldCh2cmFtIGxvc3QpLCBkbyByZXN1Ym1pdCBhcyB0aGUgb2xkIHdheS4KCiDCoMKg
wqAgU2lnbmVkLW9mZi1ieTogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4KIMKgwqDC
oCBSZXZpZXdlZC1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+CgpUaGF0IG9uZSBpcyBtb2RpZnlpbmcgYm90aCBhbWRncHUgYXMgd2VsbCBhcyB0aGUgc2No
ZWR1bGVyIGNvZGUuIElJUkMgSSAKYWN0dWFsbHkgcmVxdWVzdGVkIHRoYXQgdGhlIHBhdGNoIGlz
IHNwbGl0IGludG8gdHdvLCBidXQgdGhhdCB3YXMgCnNvbWVob3cgbm90IGRvbmUuCgpIb3cgc2hv
dWxkIHdlIHByb2NlZWQgaGVyZT8gU2hvdWxkIEkgc2VwYXJhdGUgdGhlIHBhdGNoLCBwdXNoIHRo
ZSAKY2hhbmdlcyB0byBkcm0tbWlzYy1uZXh0IGFuZCB0aGVuIHdlIG1lcmdlIHdpdGggZHJtLW5l
eHQgYW5kIHJlYmFzZSAKYW1kLXN0YWdpbmctZHJtLW5leHQgb24gdG9wIG9mIHRoYXQ/CgpUaGF0
J3MgbW9zdCBsaWtlbHkgdGhlIGNsZWFuZXN0IG9wdGlvbiBhcHByb2FjaCBhcyBmYXIgYXMgSSBj
YW4gc2VlLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4K
Pj4KPj4gQWxleAo+Pgo+Pgo+Pj4gRGF2ZS4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
