Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCAB300474
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362556E9FC;
	Fri, 22 Jan 2021 13:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7316E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:45:17 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id h192so6030564oib.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uByiq5cbxTpSuvq2dpFMAGIUx/D6lyIcvK4e7oH4Et0=;
 b=Rao+LsSodoixu1h+xH5TQKiHUjloJupKyKmRSVnDWWqHgbaAzIDOMlxrwy8NO0jg/S
 OpKWhxRVo/EYlQPUsSzGXQ3mCS0f4cqqquoTwQX0M5jkqLEIGDJYWZQCkaHw1bZuxiJS
 THW5aGICustUhVdocuMhwIvJE04QhFmnVEM7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uByiq5cbxTpSuvq2dpFMAGIUx/D6lyIcvK4e7oH4Et0=;
 b=GgbukmbK7679/nmy06DDTLM6+ydA3A2fJwT7UFC8FzvRgwTWgk3pynb8oJO3WpMfWG
 I6wlvMRmQi2MkRMYGaVW+GFJiNnOMtlrTalmXGLJNzV8DXOK1ZPn5/i8jwLs5D+tyyTf
 KfGNyt3pOnsNo91uXPDUsLI3j8riZFmjXlspTpxIVqU7dDF3lGnu1PnL902ipo1yHnTr
 XqVMrMxs/RVW8y97cd44T53UpkTQCa9n6oDIFUnhC4jCvRI+tfWb+bZLjkAtTFKQSUqX
 Q8lmJsdzk1iCUdP6PHdjrz/NK259APDftWLmXRSIqaK9QE5c0kYAmLt3X5P+OOxB7w38
 Ejew==
X-Gm-Message-State: AOAM530w/i3E9IhKiP78ygoIeaiESbZi0afG7YnZ9Cf4Zua0JEXg4GCC
 Yl8nrOKilXDrR38b1WOFjR5L1/E6PHGEFUU8OuzOiw==
X-Google-Smtp-Source: ABdhPJxz3O350DQ11ZlOU6GmrY3buaxmy6LR/RtW9IFfVrOcib3cNaKEJhK8wAgnqyB7AOn3634+wOz8pj0ozrIb0Ew=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr3289220oie.128.1611323116465; 
 Fri, 22 Jan 2021 05:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
 <2282a592-8e19-b5ae-68ba-cf1ad6dda768@gmail.com>
In-Reply-To: <2282a592-8e19-b5ae-68ba-cf1ad6dda768@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 22 Jan 2021 14:45:05 +0100
Message-ID: <CAKMK7uHAB4eBn486umdyBqMkht172kwOP1fFXhcJQw0LrH5FFw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/todo: Add entry for moving to
 dma_resv_lock
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMjIsIDIwMjEgYXQgMjo0MCBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAyMi4wMS4yMSB1bSAxNDoz
NiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBSZXF1ZXN0ZWQgYnkgVGhvbWFzLiBJIHRoaW5r
IGl0IGp1c3RpZmllcyBhIG5ldyBsZXZlbCwgc2luY2UgSSB0cmllZAo+ID4gdG8gbWFrZSBzb21l
IGZvcndhcmQgcHJvZ3Jlc3Mgb24gdGhpcyBsYXN0IHN1bW1lciwgYW5kIGdhdmUgdXAgKGZvcgo+
ID4gbm93KS4gVGhpcyBpcyB2ZXJ5IHRyaWNreS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiA+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IFN1bWl0IFNl
bXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnCj4gPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gPiAtLS0KPiA+
ICAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCAxOSArKysrKysrKysrKysrKysrKysrCj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QK
PiA+IGluZGV4IGRlYTkwODJjMGU1Zi4uZjg3MmQzZDMzMjE4IDEwMDY0NAo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8u
cnN0Cj4gPiBAQCAtMjMsNiArMjMsOSBAQCBBZHZhbmNlZDogVHJpY2t5IHRhc2tzIHRoYXQgbmVl
ZCBmYWlybHkgZ29vZCB1bmRlcnN0YW5kaW5nIG9mIHRoZSBEUk0gc3Vic3lzdGVtCj4gPiAgIGFu
ZCBncmFwaGljcyB0b3BpY3MuIEdlbmVyYWxseSBuZWVkIHRoZSByZWxldmFudCBoYXJkd2FyZSBm
b3IgZGV2ZWxvcG1lbnQgYW5kCj4gPiAgIHRlc3RpbmcuCj4gPgo+ID4gK0V4cGVydDogT25seSBh
dHRlbXB0IHRoZXNlIGlmIHlvdSd2ZSBzdWNjZXNzZnVsbHkgY29tcGxldGVkIHNvbWUgdHJpY2t5
Cj4gPiArcmVmYWN0b3JpbmdzIGFscmVhZHkgYW5kIGFyZSBhbiBleHBlcnQgaW4gdGhlIHNwZWNp
ZmljIGFyZWEKPiA+ICsKPiA+ICAgU3Vic3lzdGVtLXdpZGUgcmVmYWN0b3JpbmdzCj4gPiAgID09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4KPiA+IEBAIC0xNjgsNiArMTcxLDIyIEBAIENv
bnRhY3Q6IERhbmllbCBWZXR0ZXIsIHJlc3BlY3RpdmUgZHJpdmVyIG1haW50YWluZXJzCj4gPgo+
ID4gICBMZXZlbDogQWR2YW5jZWQKPiA+Cj4gPiArTW92ZSBCdWZmZXIgT2JqZWN0IExvY2tpbmcg
dG8gZG1hX3Jlc3ZfbG9jaygpCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gPiArCj4gPiArTWFueSBkcml2ZXJzIGhhdmUgdGhlaXIgb3duIHBlci1v
YmplY3QgbG9ja2luZyBzY2hlbWUsIHVzdWFsbHkgdXNpbmcKPiA+ICttdXRleF9sb2NrKCkuIFRo
aXMgY2F1c2VzIGFsbCBraW5kcyBvZiB0cm91YmxlIGZvciBidWZmZXIgc2hhcmluZywgc2luY2UK
PiA+ICtkZXBlbmRpbmcgd2hpY2ggZHJpdmVyIGlzIHRoZSBleHBvcnRlciBhbmQgaW1wb3J0ZXIs
IHRoZSBsb2NraW5nIGhpZXJhcmNoeSBpcwo+ID4gK3JldmVyc2VkLgo+ID4gKwo+ID4gK1RvIHNv
bHZlIHRoaXMgd2UgbmVlZCBvbmUgc3RhbmRhcmQgcGVyLW9iamVjdCBsb2NraW5nIG1lY2hhbmlz
bSwgd2hpY2ggaXMKPiA+ICtkbWFfcmVzdl9sb2NrKCkuIFRoaXMgbG9jayBuZWVkcyB0byBiZSBj
YWxsZWQgYXMgdGhlIG91dGVybW9zdCBsb2NrLCB3aXRoIGFsbAo+ID4gK290aGVyIGRyaXZlciBz
cGVjaWZpYyBwZXItb2JqZWN0IGxvY2tzIHJlbW92ZWQuIFRoZSBwcm9ibGVtIGlzIHRoYSByb2xs
aW5nIG91dAo+ID4gK3RoZSBhY3R1YWwgY2hhbmdlIHRvIHRoZSBsb2NraW5nIGNvbnRyYWN0IGlz
IGEgZmxhZyBkYXksIGR1ZSB0byBzdHJ1Y3QgZG1hX2J1Zgo+ID4gK2J1ZmZlciBzaGFyaW5nLgo+
ID4gKwo+ID4gK0xldmVsOiBFeHBlcnQKPiA+ICsKPgo+IENvdWxkIHlvdSBuYW1lIHNvbWUgZXhh
bXBsZXMgb2YgZHJpdmVyIGxvY2tzIGhlcmU/IEknbSBub3QgYXdhcmUgaW4KPiBhbnl0aGluZyBs
aWtlIHRoaXMgaW4gYW1kZ3B1LCByYWRlb24gb3IgbmV2ZWF1LgoKdHRtIGJhc2VkIGRyaXZlcnMg
YXJlIGFsbCBmaW5lLiBJdCdzIGV2ZXJ5dGhpbmcgZWxzZSB3aGljaCBpcyBhCnByb2JsZW0sIGFu
ZCBpdCBnZXRzIHdvcnNlIGlmIHlvdSBtaXggaGVscGVycyAobGlrZSBzaG1lbSBoZWxwZXJzLAp3
aGljaCBoYXZlIHRoZWlyIG93biBsb2NrcyBpbnRlcm5hbGx5KSB3aXRoIHJlbmRlciBkcml2ZXJz
IChhZ2FpbiB3aXRoCnRoZWlyIG93biBtdXRleGVzKS4KCj4gQW5kIHllcyBzb3VuZHMgbGlrZSBh
IGpvYiBmb3IgdGhlIGFwcHJvcHJpYXRlIGRyaXZlciBtYWludGFpbmVyLgoKVGhlIHByb2JsZW0g
aXMsIHRoaXMgb25lIHlvdSBjYW4ndCBkbyBkcml2ZXItYnktZHJpdmVyIGJlY2F1c2Ugb2YgdGhl
CmRtYS1idWYgY29udHJhY3QuIEkgbWVhbiB3ZSB0cmllZCBmb3IgcDJwIGF0IGZpcnN0LCBpdCdz
IGp1c3QgdG9vCm11Y2guIEkgdHJpZWQgdG8gZG8gaXQgbGFzdCBzdW1tZXIganVzdCBmb3Igc2ht
ZW0gZ2VtIGhlbHBlcnMsIGFuZCB5b3UKcmVhbGx5IGhhdmUgdG8gdGFja2xlIGFsbCB0aGUgZHJp
dmVycyBpbiBvbmUgZ28gKGV2ZW4gaWYgeW91IGlnbm9yZQpkbWEtYnVmIGZvciBub3csIHdoZXJl
IHdlIHNpZGUtc3RlcHBlZCB0aGUgcHJvYmxlbSB3aXRoIHBpbm5pbmcpLiBUaGlzCmlzICJzY2Fy
ZXMgZGFudmV0IiBsZXZlbHMgb2YgbmFzdHkuCi1EYW5pZWwKCj4gVGhhbmtzLAo+IENocmlzdGlh
bi4KPgo+ID4gICBDb252ZXJ0IGxvZ2dpbmcgdG8gZHJtXyogZnVuY3Rpb25zIHdpdGggZHJtX2Rl
dmljZSBwYXJhbWF0ZXIKPiA+ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
