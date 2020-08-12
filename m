Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33725242B6F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 16:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F85E6E13B;
	Wed, 12 Aug 2020 14:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0C489D2F;
 Wed, 12 Aug 2020 14:36:41 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id o23so2543129ejr.1;
 Wed, 12 Aug 2020 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oup0ovJVk0ZzLFn1WFt+Fd6kUmlpI1Q5XsgroeR5poY=;
 b=KfP8+LStZaPc5Z+kDwKBbf3a3PVcSEbFW9YQWnzb2ElK6LQrgREOBBD0OVufN2AGhz
 R9blIm3AcWsvYq3uhNlwIA9SARzAoMl0OSLYBYPJsDuevSTlZ5Fh0UHeTpoPIzyKi1N3
 BsGgEYk955QLOnC0FWMjt2OCpALHYSgk3t9zM4SAZ6ujzFN2DKbcbru2Q//CssA+mIOw
 IXfJMtg34u/gDJojAf94by279UTzeVv+LIcg4Ks2lubF0GldE/KSGNv90ATkdBkZ9EhY
 8WoXcfEq0uCIj7xFvirx6myWruJxK276cy7pJIZYtqNESxGvsWZlCVeDgQqiJcrehcgY
 nhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=oup0ovJVk0ZzLFn1WFt+Fd6kUmlpI1Q5XsgroeR5poY=;
 b=BGWwVJKru01YLgyVATXjfFaeGJfoaj1eKi8LzitSBQXqZkt4doHaCtWPgCj2GXn2z7
 3eokx5kN1eSMqgI/bXt0a4lN4w5QLhpuNDCvxRlQBxSC0esJpYhMatmxHTlblLWa2KCZ
 g1Wsm5uJ4UccH1ZJykdxj7nmQoc/G+1+D/JeNuIJ/9u7w1QbTgyhCVCMNkJ1bUoUEib6
 wTHaauounUEkHdELqlBLTucRoqCgoRblZHzOn4BZfDW0cCSP5Q0W7LIfuj8UpZUvHJ90
 EoDfdfNliyMNY+vF5GhOylluPFhr5Z7/okeiabPU2jmAt80XRRL+rvhC/iM6poYSQPaF
 ME2Q==
X-Gm-Message-State: AOAM533ERSlnSRE0R+ayS3Biza31iCeOC3rydaK28QZAXG6XTF1ieSay
 1FHJzmL4F26bXHKNg0HrNMk=
X-Google-Smtp-Source: ABdhPJysEoEMFd2mgwOJBkeM4ZYhPcKueFh0f2ifqETzuCgD9ec1eNIUPqGaAlnjposVrUwWwh4sxw==
X-Received: by 2002:a17:906:3ac4:: with SMTP id z4mr71162ejd.65.1597243000527; 
 Wed, 12 Aug 2020 07:36:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p16sm1681003ejd.27.2020.08.12.07.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 07:36:39 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: adjust the pid in the grab_id trace point
To: Steven Rostedt <rostedt@goodmis.org>
References: <20200807133658.1866-1-christian.koenig@amd.com>
 <20200807133658.1866-2-christian.koenig@amd.com>
 <20200812141755.GA8136@home.goodmis.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e48b6300-7ba7-f2fc-b7f7-a205d32607a4@gmail.com>
Date: Wed, 12 Aug 2020 16:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812141755.GA8136@home.goodmis.org>
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
Cc: Shashank.Sharma@amd.com, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDguMjAgdW0gMTY6MTcgc2NocmllYiBTdGV2ZW4gUm9zdGVkdDoKPiBPbiBGcmksIEF1
ZyAwNywgMjAyMCBhdCAwMzozNjo1OFBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
PiBUcmFjZSBzb21ldGhpbmcgdXNlZnVsIGluc3RlYWQgb2YgdGhlIHBpZCBvZiBhIGtlcm5lbCB0
aHJlYWQgaGVyZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHJhY2UuaCB8IDEgKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Ry
YWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHJhY2UuaAo+PiBpbmRl
eCA1ZGEyMGZjMTY2ZDkuLjA3Zjk5ZWY2OWQ5MSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKPj4gQEAgLTIyOCw2ICsyMjgsNyBAQCBUUkFDRV9FVkVO
VChhbWRncHVfdm1fZ3JhYl9pZCwKPj4gICAJCQkgICAgICksCj4+ICAgCj4+ICAgCSAgICBUUF9m
YXN0X2Fzc2lnbigKPj4gKwkJCSAgIF9fZW50cnktPmVudC5waWQgPSB2bS0+dGFza19pbmZvLnBp
ZDsKPiBJZiB0aGUgZW50LnBpZCBpcyBub3QgdGhlIHBpZCB5b3UgYXJlIGludGVyZXN0ZWQgaW4g
Zm9yIHRoaXMgdHJhY2UgZXZlbnQsIGp1c3QKPiBhZGQgYSAicGlkIiBmaWVsZCB0byB0aGUgdHJh
Y2UgZXZlbnQgYW5kIHBsYWNlIGl0IHRoZXJlLiBEbyBub3QgbW9kaWZ5IHRoZQo+IGdlbmVyaWMg
cGlkIHRoYXQgaXMgcmVjb3JkZWQsIGFzIHdlIHdvdWxkIGxpa2UgdGhhdCB0byBiZSBjb25zaXN0
ZW50IGZvciBhbGwKPiB0cmFjZSBldmVudHMuCgpUaGUgcHJvYmxlbSBteSB1c2Vyc3BhY2UgZ3V5
cyBoYXZlIGlzIHRoYXQgdGhpcyBkb2Vzbid0IHdvcmsgd2l0aCAKInRyYWNlLWNtZCAtUCAkcGlk
Ii4KCkJ1dCBJIHRoaW5rIEkgY2FuIHRlYWNoIHRoZW0gaG93IGZpbHRlcnMgd29yayA6KQoKPiBU
aGUgImVudC5waWQiIHR1cm5zIGludG8gImNvbW1vbl9waWQiIGluIHRoZSBmaWVsZCwgbGVhdmlu
ZyAicGlkIiBmcmVlIHRvIHVzZS4KPiBPdGhlciB0cmFjZSBldmVudHMgKGxpa2Ugc2NoZWRfd2Fr
aW5nKSByZWNvcmQgYSBwaWQgZmllbGQgdGhhdCBpcyBub3QgdGhlIHNhbWUKPiBhcyB0aGUgcGlk
IG9mIHRoZSBleGVjdXRpbmcgdGFzay4KClllcywgd2UgdGhvdWdodCBhYm91dCB0aGlzIGFsdGVy
bmF0aXZlIGFzIHdlbGwuCgo+IFRoZSAiZW50LnBpZCIgc2hvdWxkIGFsd2F5cyBiZSB0aGUgcGlk
IG9mIHRoZSB0YXNrIHRoYXQgZXhlY3V0ZWQgdGhlIGV2ZW50LgoKV2h5PyBGb3IgdGhlIGNhc2Ug
aGVyZSB3ZSBqdXN0IGV4ZWN1dGUgYSB3b3JrIGl0ZW0gaW4gdGhlIGJhY2tncm91bmQgZm9yIAph
biB1c2Vyc3BhY2UgcHJvY2Vzcy4KClRyYWNpbmcgdGhlIHBpZCBvZiB0aGUgd29ya2VyIHBvb2wg
d2hpY2ggZXhlY3V0ZXMgaXQgZG9lc24ndCBzZWVtIHRvIAptYWtlIHRvIG11Y2ggc2Vuc2UuCgpU
aGFua3MgZm9yIHRoZSBxdWljayByZXBseSwKQ2hyaXN0aWFuLgoKPgo+IC0tIFN0ZXZlCj4KPgo+
PiAgIAkJCSAgIF9fZW50cnktPnBhc2lkID0gdm0tPnBhc2lkOwo+PiAgIAkJCSAgIF9fYXNzaWdu
X3N0cihyaW5nLCByaW5nLT5uYW1lKQo+PiAgIAkJCSAgIF9fZW50cnktPnZtaWQgPSBqb2ItPnZt
aWQ7Cj4+IC0tIAo+PiAyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
