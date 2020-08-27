Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E0253E6F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE456EB55;
	Thu, 27 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4F66E227
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 05:05:02 +0000 (UTC)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kBA5s-0007kv-Ol
 for dri-devel@lists.freedesktop.org; Thu, 27 Aug 2020 05:05:01 +0000
Received: by mail-pg1-f199.google.com with SMTP id h3so3158302pgc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 22:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YdElzvEEzIZMoY70IuBjuGvXpacb2hD+V+ygH2R0Kww=;
 b=Yn7G1ye4WX5oEnMpQa0y6koci481gl6ajVA2vA7nwO1AoJQE6bBB09WAhu+qSins0x
 ETZVE3W83rS8D825eN73yU2xro0t34VadFTZITqHzv9NFQEao2ich7jaA/M989itxx2F
 IakGX5qnuAvddrEKEap6GY/64T3E5FSDSTlI9R0ihiYarcwQ4w7NJ0/4G0sZEpaep7G/
 wROFMAMt3+k37HMNFs+srUBmd4CD8dsbtlNMsHDuV5Y8ZlcZcoxozAj3A/+Do9h129rS
 ed3SNhTrpw1P0moRwQ2x/TkgROWwP8LtJHO/TuXSc9k/w54TW7wdVdFBXPEVdctgMn6R
 qQtw==
X-Gm-Message-State: AOAM531iWZ0BXUaliDakk453Js3PW4pnR4j6ynmP86QDQeWjNyW00mOr
 Jcj9hDtI/OP9JBptmcHzFWM3hpx+7iQXIvio1oKpwA/W9/6TWq4sF9Vp/a8nccl4lob5fMcT958
 n3NVEMqe9LXqFt56XCJ24cPLLdhJ8JziNwFEDoF5i+JFIKQ==
X-Received: by 2002:a17:902:6901:: with SMTP id
 j1mr13760849plk.324.1598504699131; 
 Wed, 26 Aug 2020 22:04:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+UGqUliAa1+G+gZIQl310W3J/Ylr5FD4q1saGLt0R+NEWvYJ1bqF+bGNBf4XTpqrtBbJ9xg==
X-Received: by 2002:a17:902:6901:: with SMTP id
 j1mr13760821plk.324.1598504698624; 
 Wed, 26 Aug 2020 22:04:58 -0700 (PDT)
Received: from [10.101.46.234] (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id e18sm706862pgr.53.2020.08.26.22.04.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 22:04:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] drm/i915/lspcon: Limits to 8 bpc for RGB/YCbCr444
From: Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200826162458.GP6112@intel.com>
Date: Thu, 27 Aug 2020 13:04:54 +0800
Message-Id: <6D40F1E0-AFF6-4D38-BB9B-C52B43F83266@canonical.com>
References: <20200826052143.17607-1-kai.heng.feng@canonical.com>
 <20200826162458.GP6112@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgo+IE9uIEF1ZyAyNywgMjAyMCwgYXQgMTI6MjQgQU0sIFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IAo+IE9uIFdlZCwgQXVn
IDI2LCAyMDIwIGF0IDAxOjIxOjE1UE0gKzA4MDAsIEthaS1IZW5nIEZlbmcgd3JvdGU6Cj4+IExT
UENPTiBvbmx5IHN1cHBvcnRzIDggYnBjIGZvciBSR0IvWUNiQ3I0NDQuCj4+IAo+PiBTZXQgdGhl
IGNvcnJlY3QgYnBwIG90aGVyd2lzZSBpdCByZW5kZXJzIGJsYW5rIHNjcmVlbi4KPiAKPiBIbW0u
IERvZXMgCj4gZ2l0Oi8vZ2l0aHViLmNvbS92c3lyamFsYS9saW51eC5naXQgZHBfZG93bnN0cmVh
bV9wb3J0c181Cj4gd29yaz8KPiAKPiBBY3R1YWxseSBiZXR0ZXIgbWFrZSB0aGF0IGRwX2Rvd25z
dHJlYW1fcG9ydHNfNV5eXl5eXl5eXl5eIGFrYS4KPiA1NGQ4NDZjZTYyYTIgKCJkcm0vaTkxNTog
RG8gWUNiQ3IgNDQ0LT40MjAgY29udmVyc2lvbiB2aWEgRFAgcHJvdG9jb2wKPiBjb252ZXJ0ZXJz
IikgdG8gYXZvaWQgdGhlIGV4cGVyaW1lbnRzIGFuZCBoYWNrcyBJIGhhdmUgc2l0dGluZyBvbiB0
b3AuCgpDYW4geW91IHBsZWFzZSByZWJhc2UgaXQgdG8gbWFpbmxpbmUgbWFzdGVyIG9yIGRybS10
aXA/CgpJIGFtIGdldHRpbmcgZXJyb3JzIG9uIHRoZSBicmFuY2g6CgogIERFU0NFTkQgIG9ianRv
b2wKICBDQUxMICAgIHNjcmlwdHMvYXRvbWljL2NoZWNrLWF0b21pY3Muc2gKICBDQUxMICAgIHNj
cmlwdHMvY2hlY2tzeXNjYWxscy5zaAogIENISyAgICAgaW5jbHVkZS9nZW5lcmF0ZWQvY29tcGls
ZS5oCiAgQnVpbGRpbmcgbW9kdWxlcywgc3RhZ2UgMi4KICBNT0RQT1NUIDE2NiBtb2R1bGVzCiAg
TEQgICAgICBhcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvdm1saW51eApsZDogYXJjaC94ODYvYm9v
dC9jb21wcmVzc2VkL3BndGFibGVfNjQubzooLmJzcysweDApOiBtdWx0aXBsZSBkZWZpbml0aW9u
IG9mIGBfX2ZvcmNlX29yZGVyJzsgYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2thc2xyXzY0Lm86
KC5ic3MrMHgwKTogZmlyc3QgZGVmaW5lZCBoZXJlCmxkOiBhcmNoL3g4Ni9ib290L2NvbXByZXNz
ZWQvaGVhZF82NC5vOiB3YXJuaW5nOiByZWxvY2F0aW9uIGluIHJlYWQtb25seSBzZWN0aW9uIGAu
aGVhZC50ZXh0JwpsZDogd2FybmluZzogY3JlYXRpbmcgRFRfVEVYVFJFTCBpbiBhIFBJRQptYWtl
WzJdOiAqKiogW2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9NYWtlZmlsZToxMTk6IGFyY2gveDg2
L2Jvb3QvY29tcHJlc3NlZC92bWxpbnV4XSBFcnJvciAxCm1ha2VbMV06ICoqKiBbYXJjaC94ODYv
Ym9vdC9NYWtlZmlsZToxMTM6IGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC92bWxpbnV4XSBFcnJv
ciAyCm1ha2U6ICoqKiBbYXJjaC94ODYvTWFrZWZpbGU6Mjg0OiBiekltYWdlXSBFcnJvciAyCm1h
a2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCgpLYWktSGVuZwoKPiAKPj4g
Cj4+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lz
c3Vlcy8yMTk1Cj4+IFNpZ25lZC1vZmYtYnk6IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdA
Y2Fub25pY2FsLmNvbT4KPj4gLS0tCj4+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfbHNwY29uLmMgfCAzICsrLQo+PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9sc3Bjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
bHNwY29uLmMKPj4gaW5kZXggYjc4MWJmNDY5NjQ0Li5jN2E0NGZjYWFkZTggMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNwY29uLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sc3Bjb24uYwo+PiBAQCAtMTk2LDcg
KzE5Niw4IEBAIHZvaWQgbHNwY29uX3ljYmNyNDIwX2NvbmZpZyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLAo+PiAJCWNydGNfc3RhdGUtPnBvcnRfY2xvY2sgLz0gMjsKPj4gCQljcnRj
X3N0YXRlLT5vdXRwdXRfZm9ybWF0ID0gSU5URUxfT1VUUFVUX0ZPUk1BVF9ZQ0JDUjQ0NDsKPj4g
CQljcnRjX3N0YXRlLT5sc3Bjb25fZG93bnNhbXBsaW5nID0gdHJ1ZTsKPj4gLQl9Cj4+ICsJfSBl
bHNlCj4+ICsJCWNydGNfc3RhdGUtPnBpcGVfYnBwID0gMjQ7Cj4+IH0KPj4gCj4+IHN0YXRpYyBi
b29sIGxzcGNvbl9wcm9iZShzdHJ1Y3QgaW50ZWxfbHNwY29uICpsc3Bjb24pCj4+IC0tIAo+PiAy
LjE3LjEKPiAKPiAtLSAKPiBWaWxsZSBTeXJqw6Rsw6QKPiBJbnRlbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
