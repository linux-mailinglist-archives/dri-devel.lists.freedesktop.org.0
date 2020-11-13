Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883102B222C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392616E5C6;
	Fri, 13 Nov 2020 17:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B206E5C6;
 Fri, 13 Nov 2020 17:26:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 23so10742817wrc.8;
 Fri, 13 Nov 2020 09:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8iS1C8UHBhMpLbbDu7TV/SpqEICX1ZS5TAuJhzzyFG8=;
 b=gvcwXsFdEOv/znI10i5jHI+3by1YLLsrRKnb3c7JXoRdbwpVMUsrdS8IHWU8SeWBLU
 AnX330YexS19lfyz2Wz7Zm+LfhRUiD7kJdUnGMeOPjjkjDmxyQa+wG24PbM8TG/EwjKk
 TUpB+KVvegwARH5HnMUN0/DrD6ON/NlFK0zYTDw1bfH6jj5JtA6NyhGIIVX/grVIMpIG
 +Q7WKUaNlq43db6/3HWvtHWgkETat2wfsp3d7NDtIp7+pSkEYDN5vacUEb9Lz9YHzFsE
 o93Vf1IGs0GgdxTTdOZ7dw0IOtPx4KNM96W0tPSxMnrkWQDJWki+r1JMbFugRwIp4jSd
 N1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8iS1C8UHBhMpLbbDu7TV/SpqEICX1ZS5TAuJhzzyFG8=;
 b=hTw7ttFgZTuzTF+pAjkuPWPcvlR3DQVTHWGt75DGHtABO5nIX653+ajMRUCrdbC1uE
 45+BMyTP6NbjIxOIgEMYusnw4JtRpW/xMZs9sC1pueX1v2kVwjz4Y3aFMuAK3SeCqYoC
 u8DiCihNNXY//6Qi6I5aDhN1JvAlAcnhkVOY5A1v4VjVLl4RwRdTL5qu9DDneUdqKlT1
 bLJDwTewUlu3r5woLoYj+9FFa7ExU9Sin9G2bE3zLG0LFK13aKNgQFyNeC/B4A46GG3l
 B3CwopxAaS7DNYWiYGutJPIA0nk0BCAKorP8LMJMbquX/vOku0yXkndIPymJe1gmsXbF
 UITw==
X-Gm-Message-State: AOAM530wsa3AV2nEAHPkZ6eBHNo4Ekl6mJbU1vSTm2aNsmWzXUZh2/eb
 vzDV0joRMYU/qU9qP+69q1Kp9LFJqob+qiVw36Q=
X-Google-Smtp-Source: ABdhPJw2y+1b413Jn+9zmNl1pSTWBVJVbiN4CtaDcHcoAKp0WI5kqKs1HII5R7BSA3JX8BC/e5jFUhTzaT4i/cboQ1c=
X-Received: by 2002:adf:e350:: with SMTP id n16mr4962082wrj.419.1605288403359; 
 Fri, 13 Nov 2020 09:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-25-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-25-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:26:32 -0500
Message-ID: <CADnq5_OL0taGuQFnzxZUSVm8yJ6yOA0fj9xW91WKsa8zYRMyeg@mail.gmail.com>
Subject: Re: [PATCH 24/40] drm/amd/amdgpu/amdgpu_ids: Supply missing docs for
 'id' and 'vmhub'
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYzoy
NzE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2lkJyBub3QgZGVzY3Jp
YmVkIGluICdhbWRncHVfdm1pZF9ncmFiX3Jlc2VydmVkJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWRzLmM6NTIzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICd2bWh1Yicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3ZtaWRfcmVzZXQnCj4KPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IEZlbGl4
IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxp
bmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9pZHMuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYwo+IGluZGV4IDZl
OWE5ZTVkYmVhMDcuLjYxYTEzMzFmNDgyYzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2lkcy5jCj4gQEAgLTI1OSw2ICsyNTksNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92
bWlkX2dyYWJfaWRsZShzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPiAgICogQHN5bmM6IHN5bmMgb2Jq
ZWN0IHdoZXJlIHdlIGFkZCBkZXBlbmRlbmNpZXMKPiAgICogQGZlbmNlOiBmZW5jZSBwcm90ZWN0
aW5nIElEIGZyb20gcmV1c2UKPiAgICogQGpvYjogam9iIHdobyB3YW50cyB0byB1c2UgdGhlIFZN
SUQKPiArICogQGlkOiByZXN1bHRpbmcgVk1JRAo+ICAgKgo+ICAgKiBUcnkgdG8gYXNzaWduIGEg
cmVzZXJ2ZWQgVk1JRC4KPiAgICovCj4gQEAgLTUxNCw2ICs1MTUsNyBAQCB2b2lkIGFtZGdwdV92
bWlkX2ZyZWVfcmVzZXJ2ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAqIGFtZGdw
dV92bWlkX3Jlc2V0IC0gcmVzZXQgVk1JRCB0byB6ZXJvCj4gICAqCj4gICAqIEBhZGV2OiBhbWRn
cHUgZGV2aWNlIHN0cnVjdHVyZQo+ICsgKiBAdm1odWI6IHZtaHViIHR5cGUKPiAgICogQHZtaWQ6
IHZtaWQgbnVtYmVyIHRvIHVzZQo+ICAgKgo+ICAgKiBSZXNldCBzYXZlZCBHRFcsIEdXUyBhbmQg
T0EgdG8gZm9yY2Ugc3dpdGNoIG9uIG5leHQgZmx1c2guCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
