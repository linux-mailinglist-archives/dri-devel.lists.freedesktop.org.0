Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176112B377C
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 18:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2A96E9AA;
	Sun, 15 Nov 2020 17:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A546E9AA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 17:55:48 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d3so6967517plo.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 09:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=4ZKYP9WM6ChkWhkP0GmUsL6ukd8dkPbB8lLfkJ7ST7g=;
 b=pwbokRPpD7EnoAVqkxtNpPHVcSDgjn0OhuANuk4SE5WNZcgegeIci/c1nJrBGCFf7B
 Bqvh8p3PKqDCbBmjoOyyz3BF5TanBYQerKDiQLBsPkMBCZWttGK3zxf55ZYzlGyNc3xP
 QiuYu/nYDdbpK1l0oIMTQFAedVKlRqQO1v/LoKMpftrY3oTdu8AH/KACtNdLS421rTcx
 kl6ycSEy503bmJCFKrq+xQmnhiDmMmNs3jAM+1pbjLCFLjoRx1yBiZcDUAJYYDzUJubb
 XcxBYEskkDTKAOsJ8m1G8aueATOimjCd8/+7GYu1fMnUQ/yR9gVaU0KfbtfpMe0LbbvH
 Sr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=4ZKYP9WM6ChkWhkP0GmUsL6ukd8dkPbB8lLfkJ7ST7g=;
 b=BydB5N/tNy+8l6U3f06EnD/1Utaem8X4uoCF4UKjCo2EWg1ZGXmAnaeiB2imjjzZOx
 WeF+E1r2SifraWpxRZMkOE4DTJPp0k4epL9T53g1N7L86wia2G9AmxFe2AbiSyAzb83Z
 2Lv+YDK5TYUBhBSIhYKvYI/cmxsQeVXJH7TmRmD18/9IKMZg/e01F1M+m3mYeMVWUacX
 /J8CWyXy3JZda/BOiW/vicKaMyDd1Kkpx8H5y+gdSqlmg+4GU/oABLLO+UcworXTBrhJ
 X04bBM3gyYVXzV5KOdI5sU1lN78j/N3aa050NRqGDhH3u2AUK3kkOIpFhEqzIyRr0dpP
 +JIQ==
X-Gm-Message-State: AOAM530OjzcpTYzPzpFqgMlp6kVx0n4QPRTw+uVjgStYuxWegZtLegCw
 xcojmwru3h2DcUL6vQ8C+Yg=
X-Google-Smtp-Source: ABdhPJz9oooaGW05g4gOzoU5egGdQTzmZy1dNsKOhjTSyxdzznbEpc8a/lU/QekgSJBc5h6vKx4ayg==
X-Received: by 2002:a17:90a:d3d8:: with SMTP id
 d24mr11809747pjw.164.1605462947815; 
 Sun, 15 Nov 2020 09:55:47 -0800 (PST)
Received: from [192.168.1.8] (50-47-106-83.evrt.wa.frontiernet.net.
 [50.47.106.83])
 by smtp.gmail.com with ESMTPSA id q14sm14273630pfl.163.2020.11.15.09.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 09:55:47 -0800 (PST)
Message-ID: <2a46700700085e7e2588bb8120595968aae7f8a6.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "Tang, Shaofeng"
 <shaofeng.tang@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Sun, 15 Nov 2020 09:55:46 -0800
In-Reply-To: <45960d1f-5304-1d5a-53fd-9896e4c322aa@suse.de>
References: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
 <121f5f8df1e56294ade98f08a943b9fbb514c5e0.camel@gmail.com>
 <45960d1f-5304-1d5a-53fd-9896e4c322aa@suse.de>
User-Agent: Evolution 3.38.1 
MIME-Version: 1.0
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
Cc: "Huang, Yuanjun" <yuanjun.huang@intel.com>, "Jiang,
 Fei" <fei.jiang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIwLTExLTE1IGF0IDEwOjE0ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToKPiBIaSBEZWVwYWsKPiAKPiBBbSAxMS4wOS4yMCB1bSAwMjozOCBzY2hyaWViIERlZXBhayBS
YXdhdDoKPiA+IE9uIFRodSwgMjAyMC0wOS0xMCBhdCAwODoxOSArMDAwMCwgVGFuZywgU2hhb2Zl
bmcgd3JvdGU6Cj4gPiA+IEhpIERlZXBhaywKPiA+ID4gwqAKPiA+ID4gRG8geW91IGhhdmUgYSBu
ZXcgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIG5vdz8KPiA+ID4gSSB0YWtlIGEgdHJ5IHdpdGggaXQu
IGFuZCBtZWV0IHNvbWUgdHlwbyBhbmQg4oCcaW5jb21wYXRpYmxlCj4gPiA+IHBvaW50ZXLigJ0K
PiA+ID4gZXJyb3IuCj4gPiA+IElmIHlvdSBoYXZlIGEgbmV3IHZlcnNpb24sIGNvdWxkIHlvdSBz
aGFyZSBpdCB3aXRoIHVzPwo+ID4gPiAKPiA+IAo+ID4gSGkgU2hhb2ZlbmcsCj4gPiAKPiA+IEl0
IHNlZW1zIHlvdSBhcmUgcnVubmluZyB0aGlzIHdpdGggZ2VuIDIgVk0sIEkgaGF2ZSBhIHBhdGNo
IHRvCj4gPiBzdXBwb3J0Cj4gPiBnZW4gMiBWTSdzIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9kZWVw
YWstcmF3YXQvbGludXguZ2l0wqBicmFuY2gKPiA+IGh5cGVydl90Cj4gPiBpbnkuCj4gCj4gSSdt
IGludGVyZXN0ZWQgaW4gbWVyZ2luZyB0aGlzIGRyaXZlciBpbnRvIHRoZSBEUk0gdXBzdHJlYW0u
IFdoYXQncwo+IHRoZQo+IHN0YXR1cz8gQXJlIHlvdSBzdGlsbCB3b3JraW5nIG9uIGl0PwoKSGkg
VGhvbWFzLAoKSSBhbSB3b3JraW5nIG9uIGFkZGluZyBnZW4yIFZNIHN1cHBvcnQgYW5kIGN1cnNv
ciBzdXBwb3J0LiBBbHNvIGZvciBteQpuZXh0IGludGVyYXRpb24gbW92aW5nIHRoZSBkcml2ZXIg
b3V0IG9mIHRpbnkuIFByb2dyZXNzIGlzIHNsb3cgbGF0ZWx5CmFzIGJ1c3kgd2l0aCBvdGhlciBz
dHVmZiBhdCB3b3JrLiBIb3BlZnVsbHkgSSB3aWxsIGJlIGFibGUgdG8gZmluaXNoCmR1cmluZyBj
b21pbmcgaG9saWRheXMuCgpEZWVwYWsKCj4gCj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4gCj4g
PiAKPiA+IElmIHlvdSBzdGlsbCBydW4gaW50byBlcnJvciBhZnRlciBhcHBseWluZyBnZW4yIHBh
dGNoLCBmZWVsIGZyZWUgdG8KPiA+IHJlYWNoIG91dCB3aXRoIGRldGFpbHMuCj4gPiAKPiA+IERl
ZXBhawo+ID4gCj4gPiA+IMKgCj4gPiA+IEJSLCBTaGFvZmVuZwo+ID4gCj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
