Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC02AE472
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D968189BD5;
	Tue, 10 Nov 2020 23:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE3089B95;
 Tue, 10 Nov 2020 23:54:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so415966wrp.3;
 Tue, 10 Nov 2020 15:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AZu6XPMSl4sNdMFeam8YLAmi7IJLk3RLAZr9T6pEy+0=;
 b=fUSzbPNd0tO2Gzm4vcTZ8zt25ZmGES+U0kOlXwbx/9kA1KVO/LjWnENIz/ypmwx3Pl
 prJI63oEHo4t9W6CoudckPSLmn/3+IyQthZQmRsdgT69fB9TEc1yNCn1SJuNMmvb8YHD
 v/o5cBKfcBOYy+2mqNdvpAOEEzilnHqNcwwJGiRGVRXEpe7QCb25u2wDMCrG96gCmc+D
 jeD+LANz5mnVAFnaAaAzzdWVDsg00Q/KQIyxhNxGXNKpZD8f7+QWHJiDe8aB9iYaqjg2
 xI15m1dfVgjGlMnk0LNH3f3gKhGwFBkelDLUxWrSjmF9VaeobkcHMvYBcvkChccOUWd5
 7LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AZu6XPMSl4sNdMFeam8YLAmi7IJLk3RLAZr9T6pEy+0=;
 b=ezm+o+NfmzrrTNi5jmTKouMg1hRywvCruAOHBvQoS68wyM5ovzpbmwQ+L+4+WIdj9w
 rzpQwnWXG+UGbtSBqCnSX4DRGqICReE4pUfcGP1j3aj/JhCYK+fLvEi/5oYDnVH3+8Nq
 0yhk4SDYU1T9es1WSG/eT6zLGLpqSK6MoLTCUNRH/b4YCkUdnFUCWcGtTSLqfCjqU3Lv
 +tcLx7ziGXdKJ2/FU4xpfH89Pp88dF3Y5/BpLZSf8hES5NWocyr+h0KjhnoKUJAKVQqG
 QDPLxV+iVobytJCo9nyqRpZgmD7Rl9gqqK7pGVGMQRXw6fq18dN0NcTzPRXbFaHlEJXH
 1OHg==
X-Gm-Message-State: AOAM533Kamkh9B5URsE40HqWeUKo0fbwMKJNEY3av5Kw8OV0JtcBd+hH
 MuC4Aj6JsghiiPly3YBBhm58xx4cYsN4tTNfpkI=
X-Google-Smtp-Source: ABdhPJzP9e5pjH5sCd486bVfOquouBS2v0wH/GmC2ZsacUkp/PcNOrTUbD6snndk/K3H9t7uWbLLbIQPc0ik2RzapKM=
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr26295254wrn.362.1605052477294; 
 Tue, 10 Nov 2020 15:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-17-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:54:25 -0500
Message-ID: <CADnq5_NACtb19H26ruPKOJ2ZBv3WT+o5LQnMtreWp1qsx-w3Fw@mail.gmail.com>
Subject: Re: [PATCH 16/30] drm/radeon/r100: Fix some kernel-doc formatting,
 misnaming and missing issues
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jOjE2Mzogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYXN5bmMnIG5vdCBkZXNjcmliZWQgaW4g
J3IxMDBfcGFnZV9mbGlwJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYzo4NDg6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3JkZXYnIG5vdCBkZXNjcmliZWQg
aW4gJ3IxMDBfcmluZ19oZHBfZmx1c2gnCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5j
Ojg0ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmluZycgbm90IGRl
c2NyaWJlZCBpbiAncjEwMF9yaW5nX2hkcF9mbHVzaCcKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yMTAwLmM6MTQyNTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncCcg
bm90IGRlc2NyaWJlZCBpbiAncjEwMF9jc19wYWNrZXRfcGFyc2VfdmxpbmUnCj4gIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcjEwMC5jOjE0MjU6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJh
bWV0ZXIgJ3BhcnNlcicgZGVzY3JpcHRpb24gaW4gJ3IxMDBfY3NfcGFja2V0X3BhcnNlX3ZsaW5l
Jwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5h
cm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZCB3aXRoIG1pbm9yIGZpeHVwLiBUaGFua3MhCgpB
bGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYyB8IDcgKysrKy0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yMTAwLmMKPiBpbmRleCAyNGM4ZGI2NzM5MzFhLi45MjA3NWRlZGYyY2IyIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yMTAwLmMKPiBAQCAtMTUzLDYgKzE1Myw3IEBAIHZvaWQgcjEwMF93YWl0
X2Zvcl92Ymxhbmsoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIGludCBjcnRjKQo+ICAgKiBA
cmRldjogcmFkZW9uX2RldmljZSBwb2ludGVyCj4gICAqIEBjcnRjX2lkOiBjcnRjIHRvIGNsZWFu
dXAgcGFnZWZsaXAgb24KPiAgICogQGNydGNfYmFzZTogbmV3IGFkZHJlc3Mgb2YgdGhlIGNydGMg
KEdQVSBNQyBhZGRyZXNzKQo+ICsgKiBAYXN5bmM6IHVudXNlZAo+ICAgKgo+ICAgKiBEb2VzIHRo
ZSBhY3R1YWwgcGFnZWZsaXAgKHIxeHgtcjR4eCkuCj4gICAqIER1cmluZyB2Ymxhbmsgd2UgdGFr
ZSB0aGUgY3J0YyBsb2NrIGFuZCB3YWl0IGZvciB0aGUgdXBkYXRlX3BlbmRpbmcKPiBAQCAtODQx
LDggKzg0Miw4IEBAIHUzMiByMTAwX2dldF92YmxhbmtfY291bnRlcihzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwgaW50IGNydGMpCj4KPiAgLyoqCj4gICAqIHIxMDBfcmluZ19oZHBfZmx1c2gg
LSBmbHVzaCBIb3N0IERhdGEgUGF0aCB2aWEgdGhlIHJpbmcgYnVmZmVyCj4gLSAqIHJkZXY6IHJh
ZGVvbiBkZXZpY2Ugc3RydWN0dXJlCj4gLSAqIHJpbmc6IHJpbmcgYnVmZmVyIHN0cnVjdCBmb3Ig
ZW1pdHRpbmcgcGFja2V0cwo+ICsgKiBAcmRldjogcmFkZW9uIGRldmljZSBzdHJ1Y3R1cmUKPiAr
ICogQHJpbmc6IHJpbmcgYnVmZmVyIHN0cnVjdCBmb3IgZW1pdHRpbmcgcGFja2V0cwo+ICAgKi8K
PiAgc3RhdGljIHZvaWQgcjEwMF9yaW5nX2hkcF9mbHVzaChzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldiwgc3RydWN0IHJhZGVvbl9yaW5nICpyaW5nKQo+ICB7Cj4gQEAgLTE0MDksNyArMTQxMCw3
IEBAIGludCByMTAwX2NzX3BhcnNlX3BhY2tldDAoc3RydWN0IHJhZGVvbl9jc19wYXJzZXIgKnAs
Cj4KPiAgLyoqCj4gICAqIHIxMDBfY3NfcGFja2V0X25leHRfdmxpbmUoKSAtIHBhcnNlIHVzZXJz
cGFjZSBWTElORSBwYWNrZXQKPiAtICogQHBhcnNlcjogICAgICAgICAgICBwYXJzZXIgc3RydWN0
dXJlIGhvbGRpbmcgcGFyc2luZyBjb250ZXh0Lgo+ICsgKiBAcDogICAgICAgICBwYXJzZXIgc3Ry
dWN0dXJlIGhvbGRpbmcgcGFyc2luZyBjb250ZXh0Lgo+ICAgKgo+ICAgKiBVc2Vyc3BhY2Ugc2Vu
ZHMgYSBzcGVjaWFsIHNlcXVlbmNlIGZvciBWTElORSB3YWl0cy4KPiAgICogUEFDS0VUMCAtIFZM
SU5FX1NUQVJUX0VORCArIHZhbHVlCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
