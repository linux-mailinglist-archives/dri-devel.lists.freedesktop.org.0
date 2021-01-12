Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBCB2F3C72
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E465A899B3;
	Tue, 12 Jan 2021 22:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E969898A7;
 Tue, 12 Jan 2021 22:41:46 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id 9so81339oiq.3;
 Tue, 12 Jan 2021 14:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=egLrKEU1+M6eAj0Z3txs3WRoaKHxixfD2FW+3sjJsMs=;
 b=gifWfHeko7/e125zS2LykJ6IUQNIlOifVLfAMtiHXiEpanVmAlXPW6e4ekqAN/+wCi
 gjk9FMwU4E3u5RRUtFDxWjZA4xppAfv9nRY6n5D6u4lERofTX5BmSda9OPZQ6ujHSgNs
 s37US8Y7u7CU1Q+h/z78j3X20PX7jJ5JMGHgt5SBrDOa4cSGxBHOjciOdBB5vOovlkM0
 bxiFEVObKbOqgk6A1qLqFS31O4hVd8GrspvUXfVtZprhGXVwM/7iiHwX7C96aFewGiPo
 RE/ws0fPHoBzww/JKMN1Ex6QOJ4wU9pQktjz+BjU5mqgmU8iNK4gFKGAMkXYO1vg+OfE
 Ti8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=egLrKEU1+M6eAj0Z3txs3WRoaKHxixfD2FW+3sjJsMs=;
 b=q6htjiQBoZ6bWqOGrtqUaiGllekJlVZ11ZhFVy6prEULyF9f+jVjaZBOU7rzETh6kS
 C51Z6ly/UtCKOHRSi+4PYkSxcvivfONkbMByEJYTygIwPQj/v01eMb9OzJHRb1BRsqa9
 czfHHKULfIR1hmpkfA9KNkoKIP8m6FmF24OSXGsZKcBF4zc85TwtHLbBKtaa7XjFSdCj
 e8UdTjmYSqTh8PNi8dNncRxVLy1uDRxPwbZlx+oUqFSlxEKv+DmehYuIvLSFdqSZ169E
 QFVtoSNA8h39u+LcyYXQzVlbVpKdGqy84AE77De4XsZlFOqhOpGFEin0tfAVtAqD5/o8
 przw==
X-Gm-Message-State: AOAM531LqA/hocxSAgX8OtBjrJsLgpTFsvRid9LrwsjMevxqsw2OoWei
 np2L+ExEK0tKcGGQ9qKhPMnQkg5t9f9/jwggHjA=
X-Google-Smtp-Source: ABdhPJyjY8vBtqVnv5kIj0aWlMnuP5o+sSEBluFePKl8c52Zye1ZawN65sp00GumXkPQNFdod6To7+zi023mnjbpMNE=
X-Received: by 2002:aca:6202:: with SMTP id w2mr807550oib.5.1610491305563;
 Tue, 12 Jan 2021 14:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-40-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-40-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:41:33 -0500
Message-ID: <CADnq5_O-zFFSAQHtsCuz+ktm6X8sy-0nxjDh8mDUDZLvPH6hBg@mail.gmail.com>
Subject: Re: [PATCH 39/40] drm/amd/display/dc/core/dc_surface: Demote
 kernel-doc abuse
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y29yZS9kY19zdXJmYWNlLmM6MTE5OiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBBdXJhYmlu
ZG8gUGlsbGFpIDxhdXJhYmluZG8ucGlsbGFpQGFtZC5jb20+Cj4gQ2M6IEpvc2lwIFBhdmljIDxK
b3NpcC5QYXZpY0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3VyZmFjZS5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19z
dXJmYWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdXJmYWNl
LmMKPiBpbmRleCAzZDdkMjc0MzVmMTVlLi5lNmI5YzZhNzE4NDEzIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N1cmZhY2UuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N1cmZhY2UuYwo+IEBAIC0xMTUs
NyArMTE1LDcgQEAgc3RydWN0IGRjX3BsYW5lX3N0YXRlICpkY19jcmVhdGVfcGxhbmVfc3RhdGUo
c3RydWN0IGRjICpkYykKPiAgICAgICAgIHJldHVybiBwbGFuZV9zdGF0ZTsKPiAgfQo+Cj4gLS8q
Kgo+ICsvKgo+ICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgICogIEZ1bmN0aW9uOiBkY19wbGFu
ZV9nZXRfc3RhdHVzCj4gICAqCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
