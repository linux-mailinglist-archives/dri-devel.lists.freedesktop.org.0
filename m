Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B1347A0C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 14:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155CF6E9D6;
	Wed, 24 Mar 2021 13:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6EA6EB8D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 13:58:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id b7so33043656ejv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eZdHp0SQXZhMJxBBXj91pk7sAcxzP0E/Oo1NOUzp1qM=;
 b=NgXEUuEyTx7mKr8iKtRoF4jaGFO3fbPbEhnuxN1t6qlxKQy8vB8nN5ZUKYUKW9IB3u
 y56OulDBR8J/W38MVsCbHQimDilr3d4fL6Y0mc5tMWwQJ1Mq5oZEAlO/UoJxo/R+8vkP
 MntKTbha5qa4OLWoP1ijCuCRJGDhLY0nHtu39C3jzI6HgPIXII8A1Hx6v2Na0K35+nOf
 4LIDi8Hr3V87n+oIeiFFhcDQ5uKQKZhA0lxpgLrUhs34/7oXqpneT7CaSHq3tjOU7zM2
 3y1pl2R8ehebKxf5JYw3WPnDvm5zgx4vy+oaDE61EPoKoOMkc7Vmt1CuEWQspgNJ3Kf8
 v+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eZdHp0SQXZhMJxBBXj91pk7sAcxzP0E/Oo1NOUzp1qM=;
 b=NLgZxrHPMS0Q7nO1Bh9X6hH8ijPgElAphMdlCeM53LprmxD5DijoROpsmkZC25mI/f
 5XltRsKPkqXhY2qvXpo9ROA+BWZbzg72MIloqFYUH3SjmVin3sVuXdrKp61ZCAgG78XM
 cMi4i1AzDJFEEil+QDMSzE+aosXYhl35Ori2pFy3XkZBc5vCM2Fk0n+cIadfmwzG0Yvs
 znsYMpj6A3wugFM/Azouxd9ftpZLj6psATwpj7mF2DVirZh35ckycEvdmITVU45AMMUr
 M4kX9OhZZ3lB6VWAcgmieWU7Vqv8GmwTn6TSKGgYsQ13Swqz63Fi6XRK6PPykexS/EmT
 IFVg==
X-Gm-Message-State: AOAM5300tpG5vlNLdlEZu3ks5ioSHRA3tSVstzvxm8Sqp6fabD8HwSPj
 sri2yNGbe/tdDzQg+GbrAAvcSYwbdW2HK4IB2eS8XQ==
X-Google-Smtp-Source: ABdhPJwtzPg6UDg/TOiiybTguPVCcKirUlE7SV36nE2zOoRP+q++Fvpaq8c69NjxvqgvnezaurPzHW6D6tilspT24hg=
X-Received: by 2002:a17:906:f2d2:: with SMTP id
 gz18mr3826900ejb.454.1616594286686; 
 Wed, 24 Mar 2021 06:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-12-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210323155059.628690-12-maarten.lankhorst@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 24 Mar 2021 08:57:55 -0500
Message-ID: <CAOFGe96E5FmnS3SMVanT20LQHbQDL+bDX4vNZQDmZN0jJBQ4nQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v9 11/70] drm/i915: Disable userptr
 pread/pwrite support.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmV2ZXIgdXNlZCBieSBNZXNhIEFGQUlLCgpBY2tlZC1ieTogSmFzb24gRWtzdHJhbmQgPGphc29u
QGpsZWtzdHJhbmQubmV0PgoKT24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMTA6NTEgQU0gTWFhcnRl
biBMYW5raG9yc3QKPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4K
PiBVc2VycHRyIHNob3VsZCBub3QgbmVlZCB0aGUga2VybmVsIGZvciBhIHVzZXJzcGFjZSBtZW1j
cHksIHVzZXJzcGFjZQo+IG5lZWRzIHRvIGNhbGwgbWVtY3B5IGRpcmVjdGx5Lgo+Cj4gU3BlY2lm
aWNhbGx5LCBkaXNhYmxlIGk5MTVfZ2VtX3B3cml0ZV9pb2N0bCgpIGFuZCBpOTE1X2dlbV9wcmVh
ZF9pb2N0bCgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgo+Cj4gLS0gU3RpbGwgbmVlZHMg
YW4gYWNrIGZyb20gcmVsZXZhbnQgdXNlcnNwYWNlIHRoYXQgaXQgd29uJ3QgYnJlYWssIGJ1dCBz
aG91bGQgYmUgZ29vZC4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X3VzZXJwdHIuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZ2VtLmMgICAgICAgICAgICAgfCAgNSArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fdXNlcnB0ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X3VzZXJwdHIuYwo+IGluZGV4IDBmOTAyNGM2MmMwNi4uNWExOTY5OWMyZDdlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCj4gQEAgLTcwMCw2ICs3
MDAsMjQgQEAgaTkxNV9nZW1fdXNlcnB0cl9kbWFidWZfZXhwb3J0KHN0cnVjdCBkcm1faTkxNV9n
ZW1fb2JqZWN0ICpvYmopCj4gICAgICAgICByZXR1cm4gaTkxNV9nZW1fdXNlcnB0cl9pbml0X19t
bXVfbm90aWZpZXIob2JqLCAwKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQKPiAraTkxNV9nZW1fdXNl
cnB0cl9wd3JpdGUoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX3B3cml0ZSAqYXJncykKPiAr
ewo+ICsgICAgICAgZHJtX2RiZyhvYmotPmJhc2UuZGV2LCAicHdyaXRlIHRvIHVzZXJwdHIgbm8g
bG9uZ2VyIGFsbG93ZWRcbiIpOwo+ICsKPiArICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW50Cj4gK2k5MTVfZ2VtX3VzZXJwdHJfcHJlYWQoc3RydWN0IGRybV9pOTE1
X2dlbV9vYmplY3QgKm9iaiwKPiArICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBk
cm1faTkxNV9nZW1fcHJlYWQgKmFyZ3MpCj4gK3sKPiArICAgICAgIGRybV9kYmcob2JqLT5iYXNl
LmRldiwgInByZWFkIGZyb20gdXNlcnB0ciBubyBsb25nZXIgYWxsb3dlZFxuIik7Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2k5MTVfZ2VtX29iamVjdF9vcHMgaTkxNV9nZW1fdXNlcnB0cl9vcHMgPSB7Cj4gICAgICAgICAu
bmFtZSA9ICJpOTE1X2dlbV9vYmplY3RfdXNlcnB0ciIsCj4gICAgICAgICAuZmxhZ3MgPSBJOTE1
X0dFTV9PQkpFQ1RfSVNfU0hSSU5LQUJMRSB8Cj4gQEAgLTcwOCw2ICs3MjYsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3Rfb3BzIGk5MTVfZ2VtX3VzZXJwdHJfb3Bz
ID0gewo+ICAgICAgICAgLmdldF9wYWdlcyA9IGk5MTVfZ2VtX3VzZXJwdHJfZ2V0X3BhZ2VzLAo+
ICAgICAgICAgLnB1dF9wYWdlcyA9IGk5MTVfZ2VtX3VzZXJwdHJfcHV0X3BhZ2VzLAo+ICAgICAg
ICAgLmRtYWJ1Zl9leHBvcnQgPSBpOTE1X2dlbV91c2VycHRyX2RtYWJ1Zl9leHBvcnQsCj4gKyAg
ICAgICAucHdyaXRlID0gaTkxNV9nZW1fdXNlcnB0cl9wd3JpdGUsCj4gKyAgICAgICAucHJlYWQg
PSBpOTE1X2dlbV91c2VycHRyX3ByZWFkLAo+ICAgICAgICAgLnJlbGVhc2UgPSBpOTE1X2dlbV91
c2VycHRyX3JlbGVhc2UsCj4gIH07Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMKPiBpbmRleCAy
NTQ0NGQzNjBmN2YuLmRkZTEyY2U0ZjkwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYwo+
IEBAIC00MDMsNiArNDAzLDExIEBAIGk5MTVfZ2VtX3ByZWFkX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gICAgICAgICB9Cj4KPiAgICAgICAgIHRyYWNlX2k5MTVf
Z2VtX29iamVjdF9wcmVhZChvYmosIGFyZ3MtPm9mZnNldCwgYXJncy0+c2l6ZSk7Cj4gKyAgICAg
ICByZXQgPSAtRU5PREVWOwo+ICsgICAgICAgaWYgKG9iai0+b3BzLT5wcmVhZCkKPiArICAgICAg
ICAgICAgICAgcmV0ID0gb2JqLT5vcHMtPnByZWFkKG9iaiwgYXJncyk7Cj4gKyAgICAgICBpZiAo
cmV0ICE9IC1FTk9ERVYpCj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Cj4gICAgICAgICBy
ZXQgPSAtRU5PREVWOwo+ICAgICAgICAgaWYgKG9iai0+b3BzLT5wcmVhZCkKPiAtLQo+IDIuMzEu
MAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBJ
bnRlbC1nZnggbWFpbGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
