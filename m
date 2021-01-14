Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7662F66D4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4DE6E113;
	Thu, 14 Jan 2021 17:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D67E6E0FB;
 Thu, 14 Jan 2021 17:08:35 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id n42so5794396ota.12;
 Thu, 14 Jan 2021 09:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JJ76hElPviEmL0kai1yU1qfanE+KP56ktX49es7QOLA=;
 b=VLRraNpf8Uod0P+jXq5oUWVhmv0tHCnpj0PBAkhb6VVRbTd2M0G6yfOhWlavZ0DaBy
 Q7UCBBLeB/dNUjXghVaJ6FQTgmtOJJ0YOwo5NG5pSau2j5NtBgrsbMLJGIP8aM5dqIed
 KKopZzR9oU90sGzZ64oGsA8W9NGW82xUs0qzXl41Fak4fpMJKG1nS8bnjrdig/lY648c
 CO2FCHr16UTj8tSXZSYNFO1OCo431r789AdSBcqR5W5d+FZ1pvYZbDQT/x6a5lAfB+aD
 uogwcRMteU08B0zE5XEGT6lUPBTnoF72sJW8I35Z5XxEDlSbTlvKtm+PmhMDCFRmhjJO
 rB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JJ76hElPviEmL0kai1yU1qfanE+KP56ktX49es7QOLA=;
 b=ujNI3AQ9TbhWr6sCDCpGwMe4Js4ydaJrzEqxV9plr1B257NF0sadllhwkYfk+OHlV+
 1G4ZQhKlZtGQ0BCdn7cpLKufbKT51Nz9EeL2DtnO1/wRUffeHiY5UVtJ5/3zk2M5boUO
 KUa4VyatBNLIxB0w+YZcrW1MX6oUEPqdExbS4Bh6oUCl6bs9Y0WrnmgO4DaLfK8+GYwP
 PLRx+2YBUersuld6qIyTm9jwvto3KjbuksnDb3IQHX5HTeVaJ0eX6+YVUduqrd1pbby6
 hCXkPodW3SD1VT9X065sHXp6jhufIph5b+KYtVzZc9qUlAd+23qSGoWESsiHHxifylSr
 4rNw==
X-Gm-Message-State: AOAM530sxuNQbSyZkplDYRUUug8ptuTJIO3kUHMY9pmIdn3qgNqP11Kx
 ruSKs4Su9nJUWxDyVpGU69Tj0JpgNr58t2dPCoc=
X-Google-Smtp-Source: ABdhPJxEO/hs3H3eMB9abvpHfAIzUeDjeNa8BAjSdlHYHxcsp6EAq+lPgPgEsgv3I5tRm4PXiz2ZMDNoCq+6fbPxl/g=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr5449231ote.132.1610644114763; 
 Thu, 14 Jan 2021 09:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-8-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:08:23 -0500
Message-ID: <CADnq5_OO8xcFHzmnN2-=k9sC8Fb3UnLy4EGeHu6Dh_kmJxkXgw@mail.gmail.com>
Subject: Re: [PATCH 07/30] drm/amd/display/dc/core/dc_link: Remove unused
 variable 'status'
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmM6IEluIGZ1bmN0aW9uIOKAmHF1ZXJ5X2hkY3BfY2FwYWJpbGl0eeKAmToK
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsu
Yzo1OTk6Mjg6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHN0YXR1c+KAmSBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCj4gaW5kZXggZjRhMjA4OGFiMTc5Mi4u
OGNjZGE4YjlhYzJlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMKPiBAQCAtNTk2LDggKzU5Niw2IEBAIHN0YXRpYyB2b2lkIHF1ZXJ5X2hk
Y3BfY2FwYWJpbGl0eShlbnVtIHNpZ25hbF90eXBlIHNpZ25hbCwgc3RydWN0IGRjX2xpbmsgKmxp
bmspCj4gICAgICAgICBkY19wcm9jZXNzX2hkY3BfbXNnKHNpZ25hbCwgbGluaywgJm1zZzIyKTsK
Pgo+ICAgICAgICAgaWYgKHNpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQgfHwgc2ln
bmFsID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVF9NU1QpIHsKPiAtICAgICAgICAgICAgICAg
ZW51bSBoZGNwX21lc3NhZ2Vfc3RhdHVzIHN0YXR1cyA9IEhEQ1BfTUVTU0FHRV9VTlNVUFBPUlRF
RDsKPiAtCj4gICAgICAgICAgICAgICAgIG1zZzE0LmRhdGEgPSAmbGluay0+aGRjcF9jYXBzLmJj
YXBzLnJhdzsKPiAgICAgICAgICAgICAgICAgbXNnMTQubGVuZ3RoID0gc2l6ZW9mKGxpbmstPmhk
Y3BfY2Fwcy5iY2Fwcy5yYXcpOwo+ICAgICAgICAgICAgICAgICBtc2cxNC5tc2dfaWQgPSBIRENQ
X01FU1NBR0VfSURfUkVBRF9CQ0FQUzsKPiBAQCAtNjA1LDcgKzYwMyw3IEBAIHN0YXRpYyB2b2lk
IHF1ZXJ5X2hkY3BfY2FwYWJpbGl0eShlbnVtIHNpZ25hbF90eXBlIHNpZ25hbCwgc3RydWN0IGRj
X2xpbmsgKmxpbmspCj4gICAgICAgICAgICAgICAgIG1zZzE0LmxpbmsgPSBIRENQX0xJTktfUFJJ
TUFSWTsKPiAgICAgICAgICAgICAgICAgbXNnMTQubWF4X3JldHJpZXMgPSA1Owo+Cj4gLSAgICAg
ICAgICAgICAgIHN0YXR1cyA9IGRjX3Byb2Nlc3NfaGRjcF9tc2coc2lnbmFsLCBsaW5rLCAmbXNn
MTQpOwo+ICsgICAgICAgICAgICAgICBkY19wcm9jZXNzX2hkY3BfbXNnKHNpZ25hbCwgbGluaywg
Jm1zZzE0KTsKPiAgICAgICAgIH0KPgo+ICB9Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
