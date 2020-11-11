Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D572AE498
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 01:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F6789D60;
	Wed, 11 Nov 2020 00:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85089D66;
 Wed, 11 Nov 2020 00:05:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d142so206494wmd.4;
 Tue, 10 Nov 2020 16:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4aRvj5frq2x2Ig3VTHGXWjNecxTnIxom7+px4DcCz0c=;
 b=FO2M7uTurZnh4C3vREryU20s0FpeQM2WbJtlUXhCEVef4AooWpyc8Azm/Ynt1SU023
 HcLuFI3eaj5Svi/jKo1njI77J+5aWkA9uKZsDM7Xkd/ATHbG921QkZrptNLhjN8UhL2J
 3LQtp4U1eDD3+ibbK+DVX3Zp7YQ/+dHRO1kXPUWSvcr/qlsMHcB0c952jpTsxqZhB/K0
 AOEWFGK9sakRTGNv4FzUBu5xIB7uC3zyY82UmKZmcfRvLSsjg7rliVWLPoQ0YJ3CwOLQ
 0bmsxlvfYPIP4r9FNLVkxrttl91vaeBUelEIrNcHBqKelZ8o9hjs5KIt2XYG7OJQeWqJ
 s12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4aRvj5frq2x2Ig3VTHGXWjNecxTnIxom7+px4DcCz0c=;
 b=ig0ROk0DPlC7hYUXq4pj1LAGR1Ytxc5KMqyNbcjhkjfSdpeAZnlbLOjIXZxVPRVPO7
 UkxT/noDrGOzAuOK8SimTv7/qWg7+03/qjIRZrSliPxXrPEyoiGZ8T37g7/mwaxlMtoz
 pp/3YIWTXkDrZdHoIhk8oeLlv7WdG93g3nx/0hDuB4FeTIZayguoRKDdRWWp+RUf8mT6
 ybsjOP9B9tQ+U9s4aKfDn2VD3p4aeMCHFk+kjiAagUoTstBez/ZHwN60Qbkt+vY1I2bR
 rkFdFDBRJyaXlY8Zw2yylaWVRzEhfnyIImuYeJV3l5C9E2+9rKLfAMeoUazx/wM3pi/n
 U6jw==
X-Gm-Message-State: AOAM530Sx0uUATeY7QoeS+10CLvLH5FHumkrvhK9cicfFzkfzOp8Gwx8
 tfeOZ5LjMpYMmLfQaqXwCEQTdzwyPoaKImSjSz8=
X-Google-Smtp-Source: ABdhPJyM77nEspqaxvn9OWN0UGEKlPqHVnIO+WXkoMEHq47+GSyGrP9fYmwOW3uqOWzKMJY3a9TwutaLObHNCt5r9YI=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr629819wmb.39.1605053114850;
 Tue, 10 Nov 2020 16:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-26-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-26-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 19:05:03 -0500
Message-ID: <CADnq5_M4rN9gOZaC_FEVBd_XtpMxKNzG7X3dzCd49gRUirFH-Q@mail.gmail.com>
Subject: Re: [PATCH 25/30] drm/radeon/sumo_dpm: Move 'sumo_get_pi()'s
 prototype into shared header
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMiBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc3Vtb19kcG0uYzo4MToyNTog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhzdW1vX2dldF9waeKAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCj4gIDgxIHwgc3RydWN0IHN1bW9fcG93ZXJfaW5mbyAqc3Vtb19n
ZXRfcGkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gIHwgXn5+fn5+fn5+fn4KPgo+IENj
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9zdW1vX2RwbS5oIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc3Vt
b19zbWMuYyB8IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fZHBt
LmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fZHBtLmgKPiBpbmRleCBmMTY1MTEzNWE0
N2FiLi5kYjI5ZDM3YWUyNzAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
c3Vtb19kcG0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc3Vtb19kcG0uaAo+IEBA
IC0yMDcsNiArMjA3LDcgQEAgdTMyIHN1bW9fZ2V0X3NsZWVwX2RpdmlkZXJfZnJvbV9pZCh1MzIg
aWQpOwo+ICB1MzIgc3Vtb19nZXRfc2xlZXBfZGl2aWRlcl9pZF9mcm9tX2Nsb2NrKHN0cnVjdCBy
YWRlb25fZGV2aWNlICpyZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTMyIHNjbGssCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1MzIgbWluX3NjbGtfaW5fc3IpOwo+ICtzdHJ1Y3Qgc3Vtb19wb3dlcl9pbmZvICpzdW1vX2dl
dF9waShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4KPiAgLyogc3Vtb19zbWMuYyAqLwo+
ICB2b2lkIHN1bW9faW5pdGlhbGl6ZV9tM19hcmIoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYp
Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fc21jLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3N1bW9fc21jLmMKPiBpbmRleCBkNzgxNDA3MDU3MzY2Li43OGQ4
NzE2MDY3MzE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc3Vtb19zbWMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc3Vtb19zbWMuYwo+IEBAIC0zMCw4ICsz
MCw2IEBACj4gICNkZWZpbmUgU1VNT19TTVVfU0VSVklDRV9ST1VUSU5FX0FMVFZERE5CX05PVElG
WSAgMjcKPiAgI2RlZmluZSBTVU1PX1NNVV9TRVJWSUNFX1JPVVRJTkVfR0ZYX1NSVl9JRF8yMCAg
MjAKPgo+IC1zdHJ1Y3Qgc3Vtb19wb3dlcl9pbmZvICpzdW1vX2dldF9waShzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7Cj4gLQo+ICBzdGF0aWMgdm9pZCBzdW1vX3NlbmRfbXNnX3RvX3NtdShz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdTMyIGlkKQo+ICB7Cj4gICAgICAgICB1MzIgZ2Z4
X2ludF9yZXE7Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
