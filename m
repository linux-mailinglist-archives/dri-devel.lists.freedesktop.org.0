Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2C26854C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246606E1CE;
	Mon, 14 Sep 2020 07:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA56C6EAA8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 16:30:29 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b19so12909565lji.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IcDKPKQjae9Ro3rXGSlRF2IuFhtLWaHivCIWCC2bPic=;
 b=fZ8PivuLW/v30la5mx5KgmHJCdW5pIBEnUESjzd2Vt55sgs5isUqO1VdsPcqLEfQZ2
 H9a7KLla3MrwnrM1c5tmoP5FZCFrvizoGUvG2AnZhoyjzdaxE0n40LFaW/8/SJlLGrh/
 YQIZ2J6hKDgm3Q9IKTiwt5jkJG6v9+On9m1ofTLgctxglAaVf7KUWm35l2y8VUrAVftl
 DP1zjSsLzlEC0oyo29aGRhUOBy3O/+C+xkm2LahZJQYua1OMsE2K4IrDCZWLjeG+5SIx
 Xp+doEYnKLVE4PKDkR5AqkLeXNNfuTkrJ7ob3+0lFOcGW6USlZZ0G322yrTZ3gVQjQGg
 aopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IcDKPKQjae9Ro3rXGSlRF2IuFhtLWaHivCIWCC2bPic=;
 b=t2g9ja0GplA7sUgeC/mWpJoZH6aRWDh/kAqV9sMTrFQYHaoEx7Xo2TUREiGwTqkI03
 GneJmFA+y6BtBeHCYxd32eHWeRT0vBILnAfz/gMDlZajhlm77i0He4hxB+3dpNiAnaSH
 z3ZN1zA54G0uL3T6j8eL7uHUuv6ElXfORKSYB98cP7AW4mMCla24zBtM7mKLtsxiMmeU
 NUVo9xtET4vCzNDOBkcPYLEQObwsDT0MyQwVaD6ydEwBSbogVblcHHOSe5zdqZ4V4jnI
 AFdQUep7Deu4BuT1znCt2t4Cq9z6LpuB3EwiaoeUp/E4+PYWPITpM9oqdbS+q/f3IFbD
 hOqg==
X-Gm-Message-State: AOAM533nc4y5PbZIZAeZykC0IptLmvRQpcUHg7VuNsPXUJrGBQecJY6B
 E6cxwhPcgDrh2KVm1KCoTqU=
X-Google-Smtp-Source: ABdhPJxXnv6m9Ghb9dVQVkPoQZTcG00J4WYFduoJccKHNT/zUPRVSpA+cLLlYSUg0nEvfznQC55MHQ==
X-Received: by 2002:a2e:b531:: with SMTP id z17mr1213009ljm.30.1599841827894; 
 Fri, 11 Sep 2020 09:30:27 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id u17sm139485lfl.283.2020.09.11.09.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 09:30:27 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
 <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
 <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
 <27ee1096-d7fa-da63-f60e-93dbdd679893@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7244cec7-a1e5-e3ad-f4f5-31f8034fb270@gmail.com>
Date: Fri, 11 Sep 2020 19:30:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <27ee1096-d7fa-da63-f60e-93dbdd679893@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMDkuMjAyMCAxMjo1OSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gOS8xMS8y
MCAxMjo1NyBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAwOS4wOS4yMDIwIDExOjM2LCBN
aWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4gLi4uCj4+Pj4KPj4+PiBEb2VzIGl0IG1ha2Ug
c2Vuc2UgdG8gaGF2ZSB0aW1lb3V0IGluIG1pY3Jvc2Vjb25kcz8KPj4+Pgo+Pj4KPj4+IE5vdCBz
dXJlLCBidXQgYmV0dGVyIGhhdmUgaXQgYSBiaXQgbW9yZSBmaW5lLWdyYWluZWQgcmF0aGVyIHRo
YW4KPj4+IGNvYXJzZS1ncmFpbmVkLiBUaGlzIHN0aWxsIGdpdmVzIGEgbWF4aW11bSB0aW1lb3V0
IG9mIDcxIG1pbnV0ZXMgc28gSQo+Pj4gZG9uJ3QgdGhpbmsgaXQgaGFzIGFueSBuZWdhdGl2ZXMg
Y29tcGFyZWQgdG8gbWlsbGlzZWNvbmRzLgo+Pgo+PiBJZiB0aGVyZSBpcyBubyBnb29kIHJlYXNv
biB0byB1c2UgbWljcm9zZWNvbmRzIHJpZ2h0IG5vdywgdGhlbiBzaG91bGQgYmUKPj4gYmV0dGVy
IHRvIGRlZmF1bHQgdG8gbWlsbGlzZWNvbmRzLCBJTU8uIEl0IHNob3VsZG4ndCBiZSBhIHByb2Js
ZW0gdG8KPj4gZXh0ZW5kIHRoZSBJT0NMVCB3aXRoIGEgbWljcm9zZWNvbmRzIGVudHJ5LCBpZiBl
dmVyIGJlIG5lZWRlZC4KPj4KPj4gewo+PiDCoMKgwqDCoF9fdTMyIHRpbWVvdXRfbXM7Cj4+IC4u
Lgo+PiDCoMKgwqDCoF9fdTMyIHRpbWVvdXRfdXM7Cj4+IH0KPj4KPj4gdGltZW91dCA9IHRpbWVv
dXRfbXMgKyAxMDAwICogdGltZW91dF91czsKPj4KPj4gVGhlcmUgc2hvdWxkbid0IGJlIGEgbmVl
ZCBmb3IgYSBsb25nIHRpbWVvdXRzLCBzaW5jZSBhIGpvYiB0aGF0IHRha2VzCj4+IG92ZXIgMTAw
bXMgaXMgcHJvYmFibHkgdG9vIHVucHJhY3RpY2FsLiBJdCBhbHNvIHNob3VsZCBiZSBwb3NzaWJs
ZSB0bwo+PiBkZXRlY3QgYSBwcm9ncmVzc2luZyBqb2IgYW5kIHRoZW4gZGVmZXIgdGltZW91dCBp
biB0aGUgZHJpdmVyLiBBdCBsZWFzdAo+PiB0aGlzIGlzIHdoYXQgb3RoZXIgZHJpdmVycyBkbywg
bGlrZSBldG5hdml2IGRyaXZlciBmb3IgZXhhbXBsZToKPj4KPj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuOS1yYzQvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfc2NoZWQuYyNMMTA3Cj4+Cj4+Cj4gCj4gSSBzdGlsbCBkb24ndCBxdWl0ZSB1bmRlcnN0
YW5kIHdoeSBpdCdzIGJldHRlciB0byBkZWZhdWx0IHRvCj4gbWlsbGlzZWNvbmRzPyBBcyB5b3Ug
c2F5LCB0aGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgYSBsb25nIHRpbWVvdXQsIGFuZAo+IGlmIHdl
IGdvIG1pY3Jvc2Vjb25kcyBub3csIHRoZW4gdGhlcmUgd291bGRuJ3QgYmUgYSBuZWVkIHRvIGV4
dGVuZCBpbgo+IHRoZSBmdXR1cmUuCgpJdCB3aWxsIG5pY2VyIHRvIGF2b2lkIHVubmVjZXNzYXJ5
IHVuaXQtY29udmVyc2lvbnMgaW4gdGhlIGNvZGUgaW4gb3JkZXIKdG8ga2VlcCBpdCBjbGVhbmVy
LgoKSSdtIG5vdyBhbHNvIGEgYml0IGR1YmlvdXMgYWJvdXQgdGhhdCB0aGUgdGltZW91dCBmaWVs
ZCBvZiB0aGUgc3VibWl0CklPQ1RMIHdpbGwgYmUgaW4gdGhlIGZpbmFsIFVBUEkgdmVyc2lvbiBi
ZWNhdXNlIGl0IHNob3VsZCBiZWNvbWUKb2Jzb2xldGUgb25jZSBkcm0tc2NoZWR1bGVyIHdpbGwg
YmUgaG9va2VkIHVwLCBzaW5jZSB0aGUgaHVuZy1jaGVjawp0aW1lb3V0IHdpbGwgYmUgc3BlY2lm
aWVkIHBlci1oYXJkd2FyZSBlbmdpbmUgd2l0aGluIHRoZSBrZXJuZWwgZHJpdmVyCmFuZCB0aGVy
ZSB3b24ndCBiZSBtdWNoIHVzZSBmb3IgdGhlIHVzZXItZGVmaW5lZCB0aW1lb3V0LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
