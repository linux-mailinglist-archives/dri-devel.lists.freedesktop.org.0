Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0221049A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653586E81B;
	Wed,  1 Jul 2020 07:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E550C6E1BC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 06:42:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z24so712587ljn.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NyiY6LCbJOGlJn7q4DsF++6lUZNdDAhhofQm6gmCEgE=;
 b=gfZa8LOiRAlSm62lj9RtYmP3Tdvbt7VXnH8W1mmOJsHLME2QjEj0tNe6P6xB+RwGOJ
 C5/Db+Dx4Hfc7jZxX29rqo+oSYwRwh6b2dGTJ7NSDStqI9RJ3vpRnjhH+A3SDD/XaDub
 BRSuO9kWCq7XzO55zK+haH4wKH9hnETCrF94Nw1/3/iaBGklEPVTKyUEiFnXYwAEnxnN
 lynyoFsfBGIe97HaqJ+8LhZXWo39KoKPSwWgn1/phkpmJ05ufRo0BDY+eOsWQ+652myh
 Iul0Ney+yIjU+WQaxGnTROK8UXmiMuOLHnI33mKX4Ib5NC8e5H3kdr7pj+NDRruQfM9Y
 Rsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NyiY6LCbJOGlJn7q4DsF++6lUZNdDAhhofQm6gmCEgE=;
 b=FPxkSEnOliE7L6WGo+k5fae8cb6t0EA6rEDqLhmy94vybmBb/GPWNmC3z9veKiWm3B
 Gn1F9TlPQ3kvGqtTMu9PQzKd7s542tGsGDEfXwt+cgDouW8WfDykqo3+psAJPCXDHyUQ
 csOHowaes7+3B8YeGNFSZN9fcjmjvTouFQeSx6aPVjP6iiojEuCngrkpkRWqGiaWsjdf
 rYAqJhuRJf5QhSxwE8MkxVqHh2gJTPjvPn1BDvBERLU/I/PTCwyHCpOp7GNBtzx8ARY6
 oSUf7yid+K20XZGNX2BHjAAyWNvuT5/D58jkunvHN/Pds+Su0u2HaghLC9AZopoOkdrV
 LjOg==
X-Gm-Message-State: AOAM532Wf1QAkDdx5dzLXX84mX4pf/5q5YyiBV3bWCZDqoLr5GP6Iy/H
 Jr8d2r1HBsOJLcA1IR8TOUs=
X-Google-Smtp-Source: ABdhPJwnfvPM9Z0IHOBuk3PCfnWLRD3JRcFcWBcZcFIo3AdmsHbEgbmJo49UPIN0jd10KhzPKCpqcQ==
X-Received: by 2002:a2e:b04c:: with SMTP id d12mr11424580ljl.256.1593585774925; 
 Tue, 30 Jun 2020 23:42:54 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id u7sm1874014lfi.45.2020.06.30.23.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 23:42:53 -0700 (PDT)
Subject: Re: [PATCH v9 1/2] of_graph: add of_graph_is_present()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200701021617.12030-1-digetx@gmail.com>
 <20200701021617.12030-2-digetx@gmail.com>
 <20200701054543.GA5963@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c39beae6-34d4-84c3-07c0-e6639ab0b367@gmail.com>
Date: Wed, 1 Jul 2020 09:42:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200701054543.GA5963@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMDcuMjAyMCAwODo0NSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBXZWQsIEp1bCAwMSwgMjAy
MCBhdCAwNToxNjoxNkFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEluIHNvbWUg
Y2FzZSwgbGlrZSBhIERSTSBkaXNwbGF5IGNvZGUgZm9yIGV4YW1wbGUsIGl0J3MgdXNlZnVsIHRv
IHNpbGVudGx5Cj4+IGNoZWNrIHdoZXRoZXIgcG9ydCBub2RlIGV4aXN0cyBhdCBhbGwgaW4gYSBk
ZXZpY2UtdHJlZSBiZWZvcmUgcHJvY2VlZGluZwo+PiB3aXRoIHBhcnNpbmcgb2YgdGhlIGdyYXBo
Lgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgb2ZfZ3JhcGhfaXNfcHJlc2VudCgpIHdoaWNoIHJldHVy
bnMgdHJ1ZSBpZiBnaXZlbgo+PiBkZXZpY2UtdHJlZSBub2RlIGNvbnRhaW5zIE9GIGdyYXBoIHBv
cnQuCj4+Cj4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+PiBT
aWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+
PiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jICAgIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLQo+PiAgaW5jbHVkZS9saW51eC9vZl9ncmFwaC5oIHwgIDYgKysrKysK
Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYyBiL2RyaXZlcnMvb2YvcHJvcGVy
dHkuYwo+PiBpbmRleCA2YTU3NjBmMGQ2Y2QuLmUxMmI4YjQ5MTgzNyAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4+ICsrKyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+PiBA
QCAtMjksNiArMjksNDggQEAKPj4gIAo+PiAgI2luY2x1ZGUgIm9mX3ByaXZhdGUuaCIKPj4gIAo+
PiArLyoqCj4+ICsgKiBvZl9ncmFwaF9nZXRfZmlyc3RfbG9jYWxfcG9ydCgpIC0gZ2V0IGZpcnN0
IGxvY2FsIHBvcnQgbm9kZQo+PiArICogQG5vZGU6IHBvaW50ZXIgdG8gYSBsb2NhbCBlbmRwb2lu
dCBkZXZpY2Vfbm9kZQo+IAo+IEl0J3Mgbm90IGFuIGVuZHBvaW50LgoKQWxyaWdodCwgc29tZWhv
dyBJIHdhcyByZWFkaW5nIHRoaXMgYXMgYSAiZGV2aWNlX25vZGUgdGhhdCBjb250YWlucwplbmRw
b2ludCAob2YgdGhlIGdyYXBoKSIuIEJ1dCBhZnRlciByZS1yZWFkaW5nIHR3aWNlIEkgY2FuIHNl
ZSB0aGF0IGl0J3MKbm90IHRoZSBjYXNlLgoKSXQgc2hvdWxkIGJlIGEgInBvaW50ZXIgdG8gZGV2
aWNlX25vZGUgY29udGFpbmluZyBncmFwaCBwb3J0IiwganVzdCBsaWtlCnRoZSBvZl9ncmFwaF9n
ZXRfcmVtb3RlX25vZGUoKSBzYXlzIGl0LiBUaGFuayB5b3UgOikKCj4+ICsgKgo+PiArICogUmV0
dXJuOiBGaXJzdCBsb2NhbCBwb3J0IG5vZGUgYXNzb2NpYXRlZCB3aXRoIGxvY2FsIGVuZHBvaW50
IG5vZGUgbGlua2VkCj4+ICsgKgkgICB0byBAbm9kZS4gVXNlIG9mX25vZGVfcHV0KCkgb24gaXQg
d2hlbiBkb25lLgo+PiArICovCj4+ICtzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICoKPj4gK29m
X2dyYXBoX2dldF9maXJzdF9sb2NhbF9wb3J0KGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSkKPj4gK3sKPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKnBvcnRzLCAqcG9ydDsKPj4gKwo+PiAr
CXBvcnRzID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUobm9kZSwgInBvcnRzIik7Cj4+ICsJaWYgKHBv
cnRzKQo+PiArCQlub2RlID0gcG9ydHM7Cj4+ICsKPj4gKwlwb3J0ID0gb2ZfZ2V0X2NoaWxkX2J5
X25hbWUobm9kZSwgInBvcnQiKTsKPj4gKwlvZl9ub2RlX3B1dChwb3J0cyk7Cj4+ICsKPj4gKwly
ZXR1cm4gcG9ydDsKPj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiBvZl9ncmFwaF9pc19wcmVzZW50
KCkgLSBjaGVjayBncmFwaCdzIHByZXNlbmNlCj4+ICsgKiBAbm9kZTogcG9pbnRlciB0byBhIGRl
dmljZV9ub2RlIGNoZWNrZWQgZm9yIHRoZSBncmFwaCdzIHByZXNlbmNlCj4+ICsgKgo+PiArICog
UmV0dXJuOiBUcnVlIGlmIEBub2RlIGhhcyBhIHBvcnQgb3IgcG9ydHMgc3ViLW5vZGUsIGZhbHNl
IG90aGVyd2lzZS4KPj4gKyAqLwo+PiArYm9vbCBvZl9ncmFwaF9pc19wcmVzZW50KGNvbnN0IHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPj4gK3sKPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmxv
Y2FsOwo+PiArCj4+ICsJbG9jYWwgPSBvZl9ncmFwaF9nZXRfZmlyc3RfbG9jYWxfcG9ydChub2Rl
KTsKPj4gKwlpZiAoIWxvY2FsKQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwlvZl9ub2Rl
X3B1dChsb2NhbCk7Cj4+ICsKPj4gKwlyZXR1cm4gdHJ1ZTsKPj4gK30KPj4gK0VYUE9SVF9TWU1C
T0wob2ZfZ3JhcGhfaXNfcHJlc2VudCk7Cj4+ICsKPj4gIC8qKgo+PiAgICogb2ZfcHJvcGVydHlf
Y291bnRfZWxlbXNfb2Zfc2l6ZSAtIENvdW50IHRoZSBudW1iZXIgb2YgZWxlbWVudHMgaW4gYSBw
cm9wZXJ0eQo+PiAgICoKPj4gQEAgLTYwOCwxNSArNjUwLDcgQEAgc3RydWN0IGRldmljZV9ub2Rl
ICpvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBh
cmVudCwKPj4gIAkgKiBwYXJlbnQgcG9ydCBub2RlLgo+PiAgCSAqLwo+PiAgCWlmICghcHJldikg
ewo+PiAtCQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7Cj4+IC0KPj4gLQkJbm9kZSA9IG9mX2dl
dF9jaGlsZF9ieV9uYW1lKHBhcmVudCwgInBvcnRzIik7Cj4+IC0JCWlmIChub2RlKQo+PiAtCQkJ
cGFyZW50ID0gbm9kZTsKPj4gLQo+PiAtCQlwb3J0ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUocGFy
ZW50LCAicG9ydCIpOwo+PiAtCQlvZl9ub2RlX3B1dChub2RlKTsKPj4gLQo+PiArCQlwb3J0ID0g
b2ZfZ3JhcGhfZ2V0X2ZpcnN0X2xvY2FsX3BvcnQocGFyZW50KTsKPiAKPiBJIHRoaW5rIHRoaXMg
aW50cm9kdWNlcyBhIGJ1ZyBiZWxvdyBpbiB0aGUgZnVuY3Rpb24sIHdoZXJlIHBhcmVudCBpcwo+
IHVzZWQgYW5kIGlzIGV4cGVjdGVkIHRvIHBvaW50IHRvIHRoZSBwb3J0cyBub2RlIGlmIGF2YWls
YWJsZS4gSSdkIGxlYXZlCj4gdGhpcyBwYXJ0IG9mIHRoZSBjaGFuZ2Ugb3V0LCBhbmQgaW5saW5l
ICtvZl9ncmFwaF9nZXRfZmlyc3RfbG9jYWxfcG9ydCgpCj4gaW4gb2ZfZ3JhcGhfaXNfcHJlc2Vu
dCgpLgoKR29vZCBjYXRjaCEgSSdsbCBjb3JyZWN0IHRoaXMuCgpUaGFuayB5b3UgZm9yIHRoZSBy
ZXZpZXcgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
