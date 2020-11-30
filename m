Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492102C925C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60774897B5;
	Mon, 30 Nov 2020 23:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAE28973E;
 Mon, 30 Nov 2020 23:19:02 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id h19so13104997otr.1;
 Mon, 30 Nov 2020 15:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sDj8+eA3XzCGTPEcZqsXANYYErSR6D60R/FMQNZhI8Q=;
 b=GCokUG2Vos/8YIH2ozrpiXqKT+XifoavuGNKAo+UTzjldhW2+cYmsm2TG9ZM1P7l2o
 QxXqNIXiOCGSbQuTf5oKrj4ZzTxJS+YZB+Litse2iIvPu5dEcSEapeBqAME4g625b06+
 ZZZ9/BFxnoxHLK7ORHVQ6Q3MYfD//L2CnZfwsBdKidoAOeCX30FjH8Ki0uKylS2WNg2Y
 08RVp8jYemiEDetAmdY6mR0j902aNAMcBLER82jDMM49TIBbq2A4gr5LVZYg0noQJ5yq
 QD561xfTka1jFcN8QoP6SjZD9Ge/l4EnYu6xSU0wvk5KS6MTZSvMILQf0bgQMnQp1OTu
 AX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sDj8+eA3XzCGTPEcZqsXANYYErSR6D60R/FMQNZhI8Q=;
 b=OLpGPviRQ+VGjoK9UEwVJ40FL/YwrLoKk/WPMLSbbe48WkIElH+ZEUsGFhMunib9w3
 I2z6IXxwWsgAQn56IKGVhTxSO5l1VSoEe4g5M/dks/MPvjbUNuJe4e3Cjsn3PrgNx6Z+
 li+DN9x+IPxoeD0MJ7DF27dr8e6W/dcpyGhC9UgPbF+4PkQ3bP1ClUJSbFb6bDIJqVjB
 LKVryHQEDwHgkL3Sp5wg1NttugJQcDSuC3F9/V/RIybYhE8DmfP6YqGu8ICwetmPNUtV
 fMZJSsp/lCr29VSXx+yC3Ce7Oo4LOAXYAwaN30/N+LNr3Nsh8FnTQVgbf2pYMuwiPcgs
 LSxA==
X-Gm-Message-State: AOAM531JRMuXp1I3lW6TI29xdrYP5xxuWdciUSywAWdIXtyUZEZ6Kl1F
 WfM5WfOrAuyzS0fyDt4zH3FZ03d4l6QbBlHDnEbBukmb
X-Google-Smtp-Source: ABdhPJyMRNKB10VZELvZJOkmhj/54W+6hIen4Tqd4lQGadPUj9bd/ahylxC2LJQz7vhb0rdxcrz1XRDeFqMIEvKcxN0=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr18918840otg.311.1606778340333; 
 Mon, 30 Nov 2020 15:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-8-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:18:48 -0500
Message-ID: <CADnq5_P4rYdFuK-_iaWmD+ZGk8ECs9PsOrVhRXMNWGWnXvuGZA@mail.gmail.com>
Subject: Re: [PATCH 07/40] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Demote
 kernel-doc format abuse
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
eS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYzoxMTA3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdtZW1fY2xvY2snIG5vdCBkZXNjcmliZWQgaW4gJ2ZpamlfZ2V0X21jbGtfZnJl
cXVlbmN5X3JhdGlvJwo+Cj4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4gQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYwo+IGlu
ZGV4IGZlYTAwOGNjMWYyNTQuLjAyYzA5NGEwNjYwNWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYwo+IEBAIC0x
MDkwLDcgKzEwOTAsNyBAQCBzdGF0aWMgaW50IGZpamlfcG9wdWxhdGVfYWxsX2dyYXBoaWNfbGV2
ZWxzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCj4gIH0KPgo+Cj4gLS8qKgo+ICsvKgo+ICAgKiBN
Q0xLIEZyZXF1ZW5jeSBSYXRpbwo+ICAgKiBTRVFfQ0dfUkVTUCAgQml0WzMxOjI0XSAtIDB4MAo+
ICAgKiBCaXRbMjc6MjRdIFw5NiBERFIzIEZyZXF1ZW5jeSByYXRpbwo+IC0tCj4gMi4yNS4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
