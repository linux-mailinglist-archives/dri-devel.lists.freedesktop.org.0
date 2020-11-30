Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC02C91E2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D44B89CE2;
	Mon, 30 Nov 2020 23:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB5A89CE2;
 Mon, 30 Nov 2020 23:03:15 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id h3so16093781oie.8;
 Mon, 30 Nov 2020 15:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pbLBATuyJ3oCMMqucu/E4nnHTUnE5GYSa2HahZ+nUMY=;
 b=N1sX3O1jLFNPsM+czYCS21z3e62Kchen6incjTpRzoK62lv9/g/JPxExhzCsNf5LPf
 iVYQJDPSBiK1NE9VOMvjCjlqkC6IsUgZfRI6EK5SmGqHNSCnFc9zyHXuMQsu7Z+JPgmQ
 hnl/GNMRWS4/EhS5URciA1m18YHqWVXI2RHbreKQEYUhbBP2NNsC0zguYEQxGXd4D8zy
 JZGZxXSBYqKdieUKASmeVksBrU0U5/c3+EfMGFUwV3MhqjIucjeTvuAo+XUmLJgKvZrC
 2F73/Ukl89DcV0JJiirW5qvlTyST1wotbPgXDRS8gPslhaYHdSGd1Sa4EdA/wtySQdMK
 jrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pbLBATuyJ3oCMMqucu/E4nnHTUnE5GYSa2HahZ+nUMY=;
 b=qfLyFRNLmDH6ezFXZisM1m4RpG1eOgy+2/rSCMKhADZ5zMTlGP6Dz3t6AixlbC8kjX
 MDErRVjGTJcLAq3BtQMlFiqBddzhxs3R8clmBFK1LhZXNNifIysESbuTTCSM96qv1SB2
 Ai7PoNeVlXQ4k/S7VdViEU/SRoZiNNUu2K8gdan2Qi737XgGr+xBDzBd7mnaMorwLGif
 XP64tmdS8rWlM2c10ajJwRjbXFENDSIfjnsDgvl1e65kmRy8qylq7D1UOUhd92dliG7F
 WNkX2O4XkOccUP88NlncFT3S8g4oXnfHmbT1ZOZ5smSkuRihE7osC1iQMRcGXkHqqQMO
 0vcw==
X-Gm-Message-State: AOAM533gp/mQ+dMXd7PMoznlLDyvctpDQqzszHGnCPrs37+Z16l4uKbH
 MFq/a32B8yDxZcNUF4rRl9Dy3XEjFyTwitDSEf6iwFBP
X-Google-Smtp-Source: ABdhPJyryqlUQ3q+jCwYtIZCuMTd9ebkXmhYBFh7xQINE5nHfAmLqnQlscgBCJBx8EV/1R0m5PLqL3eEmwr+BmNpifk=
X-Received: by 2002:a54:4608:: with SMTP id p8mr60646oip.5.1606777394955; Mon,
 30 Nov 2020 15:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-40-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-40-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:03:03 -0500
Message-ID: <CADnq5_Pf-LD7gpzrp+TqpnhFYETjouSWKCp7ZnbnAN80NVKA1A@mail.gmail.com>
Subject: Re: [PATCH 39/40] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove
 unused variable 'result'
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

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxh
eS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYzogSW4gZnVuY3Rpb24g4oCYZmlqaV9wb3B1bGF0ZV9zbWNf
Ym9vdF9sZXZlbOKAmToKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJw
bGF5L3NtdW1nci9maWppX3NtdW1nci5jOjE2MDM6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmVz
dWx04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBD
YzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4g
IFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211
bWdyL2Zpamlfc211bWdyLmMgICB8IDEzICsrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jCj4gaW5kZXggZmVm
OWQzOTA2ZmNjZC4uZmVhMDA4Y2MxZjI1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jCj4gQEAgLTE2MDAsMjAg
KzE2MDAsMTkgQEAgc3RhdGljIGludCBmaWppX3BvcHVsYXRlX3NtY191dmRfbGV2ZWwoc3RydWN0
IHBwX2h3bWdyICpod21nciwKPiAgc3RhdGljIGludCBmaWppX3BvcHVsYXRlX3NtY19ib290X2xl
dmVsKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCj4gICAgICAgICAgICAgICAgIHN0cnVjdCBTTVU3
M19EaXNjcmV0ZV9EcG1UYWJsZSAqdGFibGUpCj4gIHsKPiAtICAgICAgIGludCByZXN1bHQgPSAw
Owo+ICAgICAgICAgc3RydWN0IHNtdTdfaHdtZ3IgKmRhdGEgPSAoc3RydWN0IHNtdTdfaHdtZ3Ig
KikoaHdtZ3ItPmJhY2tlbmQpOwo+Cj4gICAgICAgICB0YWJsZS0+R3JhcGhpY3NCb290TGV2ZWwg
PSAwOwo+ICAgICAgICAgdGFibGUtPk1lbW9yeUJvb3RMZXZlbCA9IDA7Cj4KPiAgICAgICAgIC8q
IGZpbmQgYm9vdCBsZXZlbCBmcm9tIGRwbSB0YWJsZSAqLwo+IC0gICAgICAgcmVzdWx0ID0gcGht
X2ZpbmRfYm9vdF9sZXZlbCgmKGRhdGEtPmRwbV90YWJsZS5zY2xrX3RhYmxlKSwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBkYXRhLT52Ymlvc19ib290X3N0YXRlLnNjbGtfYm9vdHVwX3ZhbHVl
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICh1aW50MzJfdCAqKSYodGFibGUtPkdyYXBoaWNz
Qm9vdExldmVsKSk7Cj4gKyAgICAgICBwaG1fZmluZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3Rh
YmxlLnNjbGtfdGFibGUpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLT52Ymlv
c19ib290X3N0YXRlLnNjbGtfYm9vdHVwX3ZhbHVlLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodWludDMyX3QgKikmKHRhYmxlLT5HcmFwaGljc0Jvb3RMZXZlbCkpOwo+Cj4gLSAgICAg
ICByZXN1bHQgPSBwaG1fZmluZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLm1jbGtfdGFi
bGUpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPnZiaW9zX2Jvb3Rfc3RhdGUubWNs
a19ib290dXBfdmFsdWUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgKHVpbnQzMl90ICopJih0
YWJsZS0+TWVtb3J5Qm9vdExldmVsKSk7Cj4gKyAgICAgICBwaG1fZmluZF9ib290X2xldmVsKCYo
ZGF0YS0+ZHBtX3RhYmxlLm1jbGtfdGFibGUpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkYXRhLT52Ymlvc19ib290X3N0YXRlLm1jbGtfYm9vdHVwX3ZhbHVlLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAodWludDMyX3QgKikmKHRhYmxlLT5NZW1vcnlCb290TGV2ZWwpKTsK
Pgo+ICAgICAgICAgdGFibGUtPkJvb3RWZGRjICA9IGRhdGEtPnZiaW9zX2Jvb3Rfc3RhdGUudmRk
Y19ib290dXBfdmFsdWUgKgo+ICAgICAgICAgICAgICAgICAgICAgICAgIFZPTFRBR0VfU0NBTEU7
Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
