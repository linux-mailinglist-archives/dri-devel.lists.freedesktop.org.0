Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B82B21E5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DE86E598;
	Fri, 13 Nov 2020 17:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0F6E593;
 Fri, 13 Nov 2020 17:19:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c16so9218156wmd.2;
 Fri, 13 Nov 2020 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Odh9S4GXnjRv304GJfgc5XVM032BtmrndNkaL6PWoQQ=;
 b=dqygrZ/7I0MeF6Ka1mhBuF0NzD/2dnGxkk/WTlSrEEOIvguKpPTJBZDqLC8jLJfGmz
 EVAStBt3qg27yKw2w1Evwiql94xjLxNxiy42VRxMemRbWkwZ4Qu3C9Uy2PnMWhfZeeEz
 t2HMTPLlinMl0+bN6lh5JJSxojtIjUyLLm6UmBZSs0acFBqae27wst1O8RLSGLS+h503
 XPR2pccjzGWAEONrr+OsEvbgSvScNsAYdX9WsVksKIAEkErcP+nYMhp7JUvgNwLsB384
 c9Qh3/DeGojEtsP8DIP+fboxRjd5CPU+tc15b1ZlMtxWyw5kZKhspxW6j4l8JJdz89SJ
 ZYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Odh9S4GXnjRv304GJfgc5XVM032BtmrndNkaL6PWoQQ=;
 b=LW3eoKw5NEbPB9V+YafD73pLeYctXLy+Vzn8HLuwnDwaWj0Kul5ym35RIwWSjsqzOc
 Ii56ttU8rdsckCTCIQoXuKNXF/ZO0VZ7edQoAH3mUJMVfFkO4qr5PYdR12VNuAQoyPzs
 YlkFBonSaFLP9RTej40tMlGIqfS9KgmA3xNyEgfQxtJ4/uPAAKM0X0jqrdok5TYbXEjN
 0SK6cfBSwj8esp26TQJpqy5qHl4SurJTmhuiIpJF/1yg/msbNzSLNSW6skAF3wLf7N85
 9rz6wI08CM4voijqSarT/fQbNW8i8KUmG+rjcl+REjF64zRAhhMESnnEfOQVnfOeuCvH
 KfQA==
X-Gm-Message-State: AOAM532SjrtsOPxxFriypTaYcrr53GPWYK/lgwAhCVi9WuzCGGTTlhgc
 cQ5i2oNexRcGWG3OPuq0t1bCP5IK1/1hOtBL+o8=
X-Google-Smtp-Source: ABdhPJw8aLTjdYh+1Z4YbylQ6OFrhzAqpIztbxmRHRPTy2NG/itvTCYemARbosA+4Fk6pXGQV6PdsyqChDTsqfogCyo=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr3502636wmi.70.1605287936955; 
 Fri, 13 Nov 2020 09:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-17-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:18:45 -0500
Message-ID: <CADnq5_PUE3Hiv6dngNwEgZ_3hX=RQaZxiFtudt6-zesYbuLYQQ@mail.gmail.com>
Subject: Re: [PATCH 16/40] drm/amd/amdgpu/amdgpu_sync: Fix misnamed, missing
 and extra param descriptions
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
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmM6
ODY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2YnIG5vdCBkZXNjcmli
ZWQgaW4gJ2FtZGdwdV9zeW5jX2dldF9vd25lcicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3N5bmMuYzo4Njogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAn
ZmVuY2UnIGRlc2NyaXB0aW9uIGluICdhbWRncHVfc3luY19nZXRfb3duZXInCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmM6MTgyOiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24gcGFyYW1ldGVyICdhZGV2JyBkZXNjcmlwdGlvbiBpbiAnYW1kZ3B1X3N5bmNfdm1fZmVu
Y2UnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmM6MjAzOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhZGV2JyBub3QgZGVzY3JpYmVkIGlu
ICdhbWRncHVfc3luY19yZXN2Jwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnPgo+IENjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc3luYy5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmMKPiBpbmRleCA4ZWE2YzQ5NTI5ZTdk
Li40ZTU1ODYzMmE1ZDJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9zeW5jLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
c3luYy5jCj4gQEAgLTc4LDcgKzc4LDcgQEAgc3RhdGljIGJvb2wgYW1kZ3B1X3N5bmNfc2FtZV9k
ZXYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gIC8qKgo+ICAgKiBhbWRncHVfc3luY19n
ZXRfb3duZXIgLSBleHRyYWN0IHRoZSBvd25lciBvZiBhIGZlbmNlCj4gICAqCj4gLSAqIEBmZW5j
ZTogZmVuY2UgZ2V0IHRoZSBvd25lciBmcm9tCj4gKyAqIEBmOiBmZW5jZSBnZXQgdGhlIG93bmVy
IGZyb20KPiAgICoKPiAgICogRXh0cmFjdCB3aG8gb3JpZ2luYWxseSBjcmVhdGVkIHRoZSBmZW5j
ZS4KPiAgICovCj4gQEAgLTE3Miw3ICsxNzIsNiBAQCBpbnQgYW1kZ3B1X3N5bmNfZmVuY2Uoc3Ry
dWN0IGFtZGdwdV9zeW5jICpzeW5jLCBzdHJ1Y3QgZG1hX2ZlbmNlICpmKQo+ICAvKioKPiAgICog
YW1kZ3B1X3N5bmNfdm1fZmVuY2UgLSByZW1lbWJlciB0byBzeW5jIHRvIHRoaXMgVk0gZmVuY2UK
PiAgICoKPiAtICogQGFkZXY6IGFtZGdwdSBkZXZpY2UKPiAgICogQHN5bmM6IHN5bmMgb2JqZWN0
IHRvIGFkZCBmZW5jZSB0bwo+ICAgKiBAZmVuY2U6IHRoZSBWTSBmZW5jZSB0byBhZGQKPiAgICoK
PiBAQCAtMTkwLDYgKzE4OSw3IEBAIGludCBhbWRncHVfc3luY192bV9mZW5jZShzdHJ1Y3QgYW1k
Z3B1X3N5bmMgKnN5bmMsIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQo+ICAvKioKPiAgICogYW1k
Z3B1X3N5bmNfcmVzdiAtIHN5bmMgdG8gYSByZXNlcnZhdGlvbiBvYmplY3QKPiAgICoKPiArICog
QGFkZXY6IGFtZGdwdSBkZXZpY2UKPiAgICogQHN5bmM6IHN5bmMgb2JqZWN0IHRvIGFkZCBmZW5j
ZXMgZnJvbSByZXNlcnZhdGlvbiBvYmplY3QgdG8KPiAgICogQHJlc3Y6IHJlc2VydmF0aW9uIG9i
amVjdCB3aXRoIGVtYmVkZGVkIGZlbmNlCj4gICAqIEBtb2RlOiBob3cgb3duZXIgYWZmZWN0cyB3
aGljaCBmZW5jZXMgd2Ugc3luYyB0bwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
