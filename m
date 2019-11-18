Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40BB100A02
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 18:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295E76E750;
	Mon, 18 Nov 2019 17:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD1D6E750;
 Mon, 18 Nov 2019 17:14:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l7so20443763wrp.6;
 Mon, 18 Nov 2019 09:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/YLB10p7lVDV11aheuLz2UpMv6bWi3m7FpYmaq3Tyig=;
 b=DNXr/dpRZVeKA7Ckye5/HHJddtirHE2IMJCd8ceNbrEtFlOkorhTbQfxNARexF4CSz
 927lD7fWlaT8VvZsdFASiVU3crVvPu2/wTlAW4IZPF1CdToiEbe3nkbHRnv+/E2lDrjt
 BhaJz5KJm5qpLKvKixs/0rAOOMyN7KeRH5r55dEzu0q/Mq1er+jV4Cq6Hu/8pv4EiQfG
 2d7DLBSo5j2CbJm4/0wpS6D5688chD38M5SSCA4O3D7+mGyAfYmQFdU9oKiacF7jtD5u
 b7shrjUuaCyJjhwUbeuI1DCX2qpX99DeoVA8kWR/aFhYsshnUI6ZskIXeI+qbieYyDHb
 RAsA==
X-Gm-Message-State: APjAAAWtlwGiWzbC4sgy5ESAiAoQ4lOBi38YzDQ47zSj1851PV4f0pxs
 oEELk/aplHZrtr2mJxhtxy/Y/aSoLmeGM6bnH9ILsQ==
X-Google-Smtp-Source: APXvYqxliWEUJSNwFceJESLXlD+zwKlM0bKy72QssTDfJrwxZReMRYdETBLJpCbvjoXnN7do0Xl2rrzWop8iCS387HU=
X-Received: by 2002:adf:f010:: with SMTP id j16mr32765714wro.206.1574097267286; 
 Mon, 18 Nov 2019 09:14:27 -0800 (PST)
MIME-Version: 1.0
References: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2019 12:14:15 -0500
Message-ID: <CADnq5_MiVUNkP4e9bFWMZ0TVq3Nrr-HNpg7uONs6pLRGoFwiog@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/radeon: remove some set but not used variables
To: zhengbin <zhengbin13@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/YLB10p7lVDV11aheuLz2UpMv6bWi3m7FpYmaq3Tyig=;
 b=KN1888Qi7GY6XeqcAeKOcw6EwK6vmiyNFFC6fPVP6b2i3PtuT/6k5M20StBgumIAl+
 u26Z4BiV5Yo7pPDA4zjJdn7Cm3SjNtaGK6GwcZTale2C5R1uarCgs/vlJoEagtCS2R29
 gITEmgGY54+htsl5bbcOo6LBXmkWSfw38MA9rA9AZvv+xHEKgYvn9oJ4ADCKp1UQyn6m
 P1WyNTxeMb9fcDA+hSeLT5c9wXFvsGD1Z/KoeROmTrQTZhePoSGN80wL/5VGLrV8oaOn
 LvM3+IS7JN0Qnvj5GSxnm3kL9qMivXBiapBRbjPAd11G5M0o82YXrtFRykcsZgFNxbu7
 2tVw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZCB0aGUgc2VyaWVzLiAgVGhhbmtzIQoKQWxleAoKT24gRnJpLCBOb3YgMTUsIDIwMTkg
YXQgOTo1NiBBTSB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPiB3cm90ZToKPgo+IHpo
ZW5nYmluICg2KToKPiAgIGRybS9yYWRlb246IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlICdzaXplJywncmVsb2NzX2NodW5rJwo+ICAgZHJtL3JhZGVvbjogcmVtb3ZlIHNldCBidXQg
bm90IHVzZWQgdmFyaWFibGUgJ2JhY2tiaWFzX3Jlc3BvbnNlX3RpbWUnCj4gICBkcm0vcmFkZW9u
OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAnZGlnX2Nvbm5lY3RvcicKPiAgIGRy
bS9yYWRlb246IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdyYWRlb25fY29ubmVj
dG9yJwo+ICAgZHJtL3JhZGVvbjogcmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ2Js
b2NrcycKPiAgIGRybS9yYWRlb246IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICd0
dl9wbGxfY250bDEnCj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19kcC5jICAg
ICAgfCAzIC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYyAgICAgICAgICB8
IDggKystLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5jICAg
fCAzICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgICB8IDIg
LS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X3R2LmMgfCA4ICstLS0t
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmMgICAgICAgICAgIHwgMyArLS0K
PiAgNiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+Cj4g
LS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
