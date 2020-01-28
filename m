Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A376A14C228
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 22:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620F16F420;
	Tue, 28 Jan 2020 21:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B0B6F41E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 21:22:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so17807115wru.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TNZ+SSLqzvEPvCmc6ZS7s1Y6NNb3j1RHj22o6lXsxaI=;
 b=CnD93n/LQrsrioMyckoGeMEjKzQO7hcIwwWXh2o7qKtwU04tHnrqEedayIjNhI99WY
 3GcszAImGOHSY96eoT131W7rB6O3zkDQkyfym8NGihqtXiW7MSj39BEUJ0haTALR486+
 wlg59+dBmpbB1bYDwyTXjn848EhxMX7jAWOSkqVavx/Z2Lw+7sFNzww4a2RzNL/hq2gs
 onq7z/rr7y3L0nUD1vyNiOJjOWmzZ3UZpJhKm11ep45KMvW9yDNe8LWhT4SXxHLTYFsz
 9SRHNoWau5HCRom9ing0xIzl0J8H4uBJ+fWMHByy5TIvQQevb4a9JNOTupxYn4J1Nfz2
 gDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TNZ+SSLqzvEPvCmc6ZS7s1Y6NNb3j1RHj22o6lXsxaI=;
 b=sP1DdRwhJkDSM/ViizysADsx80M9o3b3nbPrPU60khXipj5Kj3s5ir4kxQsWDh3p6i
 6MkYNDhgGXGsoi7LzxW+U0VkYpq55P0Ejgcbu+4PSbKcddiaiYtH2IcbsE+BjZdDyhCU
 G0AxWT6mNMFvOOWCdQ4G7+Kh2hV9LJGAtu75bCtJvELVs4EgQRGdJ+XBGi64MITdhNQc
 6QH0Y9zEyOhMDfKgvWj0wdIRl2FH1Mh8Z3uM93E4nT4nJ+qG7cPWwIpYNLz6tDzem7oZ
 3og1XZXs2dUY/yqWUNeWsXcMrLyb8X6H8IWFrsLe8gWh1dS+tZx6E6V5SZ5yed/pPbqz
 9T0g==
X-Gm-Message-State: APjAAAWjp+ixMhz/7EaqBZ8rqIJ9E13OQWm8b0btmxtNBilAYVVYUUX2
 SXHb+D7GuP13BBgBWzwKkJK9tUCYGNO6F1gDZiQ=
X-Google-Smtp-Source: APXvYqyvCy7LlgJGpGhqalO1NBsx/YMYaCG+rOIwCKAELPJdv9yZdy0ZgxI1MldtndjKz/wAkCf7q1GID3Pg+Acl1FM=
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr32048007wrq.419.1580246532647; 
 Tue, 28 Jan 2020 13:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20200128160952.1628146-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200128160952.1628146-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jan 2020 16:21:59 -0500
Message-ID: <CADnq5_PhFRASAC62axW9yV_Dq96NonNkw_nvjmRffUYMJa3xCQ@mail.gmail.com>
Subject: Re: [PATCH] radeon: insert 10ms sleep in dce5_crtc_load_lut
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMTE6MTAgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBQZXIgYXQgbGVhc3Qgb25lIHRlc3RlciB0aGlzIGlz
IGVub3VnaCBtYWdpYyB0byByZWNvdmVyIHRoZSByZWdyZXNzaW9uCj4gaW50cm9kdWNlZCBmb3Ig
c29tZSBwZW9wbGUgKGJ1dCBub3QgYWxsKSBpbgo+Cj4gY29tbWl0IGI4ZTJiMDE5OWNjMzc3NjE3
ZGMyMzhmNTEwNjM1MmMwNmRjZDNmYTIKPiBBdXRob3I6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50
aWEuc2U+Cj4gRGF0ZTogICBUdWUgSnVsIDQgMTI6MzY6NTcgMjAxNyArMDIwMAo+Cj4gICAgIGRy
bS9mYi1oZWxwZXI6IGZhY3RvciBvdXQgcHNldWRvLXBhbGV0dGUKPgo+IHdoaWNoIGZvciByYWRl
b24gaGFkIHRoZSBzaWRlLWVmZmVjdCBvZiByZWZhY3RvcmluZyBvdXQgYSBzZWVtaW5nbHkKPiBy
ZWR1ZGFudCB3cml0aW5nIG9mIHRoZSBjb2xvciBwYWxldHRlLgo+Cj4gMTBtcyBpbiBhIGZhaXJs
eSBzbG93IG1vZGVzZXQgcGF0aCBmZWVscyBsaWtlIGFuIGFjY2VwdGFibGUgZm9ybSBvZgo+IGR1
Y3QtdGFwZSwgc28gbWF5YmUgd29ydGggYSBzaG90IGFuZCBzZWUgd2hhdCBzdGlja3MuCj4KPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBNaWNoZWwg
RMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KPiBSZWZlcmVuY2VzOiBodHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTE5ODEyMwo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgoKV29ya3MgZm9yIG1lLiAg
QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9kaXNwbGF5LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKPiBpbmRleCAzNTQ3
NTZlMDBmZTEuLmQwN2M3ZGIwYzgxNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kaXNwbGF5LmMKPiBAQCAtMTI3LDYgKzEyNyw4IEBAIHN0YXRpYyB2b2lkIGRjZTVfY3J0Y19s
b2FkX2x1dChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4KPiAgICAgICAgIERSTV9ERUJVR19LTVMo
IiVkXG4iLCByYWRlb25fY3J0Yy0+Y3J0Y19pZCk7Cj4KPiArICAgICAgIG1zbGVlcCgxMCk7Cj4g
Kwo+ICAgICAgICAgV1JFRzMyKE5JX0lOUFVUX0NTQ19DT05UUk9MICsgcmFkZW9uX2NydGMtPmNy
dGNfb2Zmc2V0LAo+ICAgICAgICAgICAgICAgIChOSV9JTlBVVF9DU0NfR1JQSF9NT0RFKE5JX0lO
UFVUX0NTQ19CWVBBU1MpIHwKPiAgICAgICAgICAgICAgICAgTklfSU5QVVRfQ1NDX09WTF9NT0RF
KE5JX0lOUFVUX0NTQ19CWVBBU1MpKSk7Cj4gLS0KPiAyLjI0LjEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
