Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD52C9251
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822568973E;
	Mon, 30 Nov 2020 23:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088AD8973E;
 Mon, 30 Nov 2020 23:17:08 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id c80so16162706oib.2;
 Mon, 30 Nov 2020 15:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0z0SXE8CVPIChDmKOmwTsYRaoR8qX/fK8KklCW+N/l8=;
 b=JToaLIuO/p7X7k6oHV5a/TjdCpmD6sO7yrjy4OYXDtYmvBFEzKGRTkTai2AYYp5Uyj
 O9GYoPtFHbbzWe0Bg5PB652fZDDIljPi+i+9TcGPGu+VycL4NdjSlFY2ep7LWaa8nVur
 8cheF6iw3PCN6TDwHzNVHmc06dCEDdjr3XHo2lnHn1OWiFAzTUuCPYpSok3qZb8ON0LB
 3+lETbFpb01TlQIBTxDcbZpXCnPfHQ7JqL3XOE9i4f/eexcTjTXlhTAU3z4EQXtsO/Xa
 ievk6N7AaqW57Mi0iSqU7Gumso8Ccs/XredO27WBg2E0pAAMvsOrSy9BijmNQDt/fUfj
 U4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0z0SXE8CVPIChDmKOmwTsYRaoR8qX/fK8KklCW+N/l8=;
 b=VNcXL22j89QFylll1NlHbH1NGI2fzH0Ty4MW/u3SE6AKFoYlspBwLmQvvJyodBatbt
 mgJwKbUDb/93Y3S+D0DeuJdaYtdS/BKrpkBtZZxftKvirlFnvD6kuVIsbfPLj+AKqhyr
 knSZHcq/v75lt1082teW0nV39P5LT6EC8IZayepaFjjwu9bUqz6ccena9I5vTFpgKa2Y
 RHf7LA4XlUvZBSpmj9kAkKwd5gdvl5QdzVcyX0YBsd0rOFCqHrweZsFtg6LcElcQC9vQ
 RivOWhvCzYhgitipV2AEGJCupRG7lxXhHBvITJQWDpP3GW/4DBNtgnoLgoVTea9S+rcW
 In5A==
X-Gm-Message-State: AOAM530+qphGWVvPofV+nedWdEVl+y4AR5h0rB7W2qVd8pHRsrldaE5P
 teQeYvoVhGnVZyNWMooTKBovf33aCFNn18mfSK0=
X-Google-Smtp-Source: ABdhPJwylG4/WrqmfM33rZKNpP1ekm16r2XICleifSiU/CfyOhbqgaz+wcFex7cFkK3t0YkVczLNTTDWgadxoyonD84=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr118887oib.120.1606778227470; 
 Mon, 30 Nov 2020 15:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-6-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:16:56 -0500
Message-ID: <CADnq5_MWwix=tbV_BZ-hrmVfYKw=xpXgUU2U2htL1roxvTbtYg@mail.gmail.com>
Subject: Re: [PATCH 05/40] drm/amd/pm/powerplay/smumgr/vegam_smumgr: Make
 function called by reference static
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9zbXVtZ3IvdmVnYW1fc211bWdyLmM6MjI0OTo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmHZlZ2FtX3RoZXJtYWxfYXZmc19lbmFibGXigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+Cj4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4gQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYwo+IGluZGV4
IDM4YTVjZGNmNTg5NjcuLjdkMDI0ZDNmYWNlZjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jCj4gQEAgLTIy
NDYsNyArMjI0Niw3IEBAIHN0YXRpYyBpbnQgdmVnYW1fdXBkYXRlX3NjbGtfdGhyZXNob2xkKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IpCj4gICAgICAgICByZXR1cm4gcmVzdWx0Owo+ICB9Cj4KPiAt
aW50IHZlZ2FtX3RoZXJtYWxfYXZmc19lbmFibGUoc3RydWN0IHBwX2h3bWdyICpod21ncikKPiAr
c3RhdGljIGludCB2ZWdhbV90aGVybWFsX2F2ZnNfZW5hYmxlKHN0cnVjdCBwcF9od21nciAqaHdt
Z3IpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzbXU3X2h3bWdyICpkYXRhID0gKHN0cnVjdCBzbXU3
X2h3bWdyICopKGh3bWdyLT5iYWNrZW5kKTsKPiAgICAgICAgIGludCByZXQ7Cj4gLS0KPiAyLjI1
LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
