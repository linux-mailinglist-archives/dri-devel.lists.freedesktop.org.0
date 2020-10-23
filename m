Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30977297768
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 20:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1FD6E514;
	Fri, 23 Oct 2020 18:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7413D6E40A;
 Fri, 23 Oct 2020 18:59:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l15so3047492wmi.3;
 Fri, 23 Oct 2020 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kGkqH9RayqCwaKSb4jbmhvrrm7waUI/efA+P4m3EI/A=;
 b=Ai18QAkff99+Y1ZJzQMpA+Anvykc4ZYymMK2J/s5hjPl95FQW84WHFcY8Upll/PB0L
 FQORIO2+5xX2NKYt2s1o+sKJQxJD7ao1TfE30g5VIycE/MBx7tKIa9NvGXwdPxoKWTdU
 FyEz1t2qMYWGqhRNsuiY0e1gTacfBeLmibK6J530Ekg/2QASZhhlNqPg7vXKEi8OtUFS
 /9QSvfrntzRcajetWfOn1RaJKMsqs4uWKzMj3KlBYjCLSFWk60pjLbSJSr059e5ooKMk
 rNgxaWJvUXLA1H7viV3qKcNvpBFKPMLEmunu7piPFWxjz8CQF8eeu89+nPAElW78Hs4y
 RFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kGkqH9RayqCwaKSb4jbmhvrrm7waUI/efA+P4m3EI/A=;
 b=MjBzWmLju8C+U0ulgOv8NN2UOmJFqvYiyMRzYn3lBoerogxsf9wQETVSZrzjoIXL27
 1xsyZrUCZ5YOkluRib4HEsxQOGtoyOCtaSfTu4gaNouJmxWqbV3Gp1zF0STkdAEd3zZP
 pi6VZFL25dpO277CeYo1gMF+xzJ98ovDeikH7UI/2PuF8NHSm7gnLdxRQ9lJD5Oc2u9p
 x87+1q4ih9S8K2KeWNmk1rPGT6xsaH6ilCoyTe9CHHm738wK/ha5mM51fD0B0jyz64YP
 prP6WCLM3cYgHD+o9mn9dqHguR3mmHpl7tx5mV9jDAQ1bSvNySljVYNQvrF3iDb7JEUt
 8rQQ==
X-Gm-Message-State: AOAM530xtN5yNZqN0eGNNn/1jaKcqvAUr4QL/8+MeTkP0TfZvhpyss+r
 SSiIChE2oX/ohOju2z6AhYjVurthbQ4W1VFYR+c=
X-Google-Smtp-Source: ABdhPJzzbJD6wGGAD04pOulswiRx+ZOpFnJUnflRMa3fKNUhFj/+eewn0SpJHTIqxm9mtAGa6ZtfL2QZ/+5H8dUC/5w=
X-Received: by 2002:a1c:e4c1:: with SMTP id b184mr3024912wmh.73.1603479591132; 
 Fri, 23 Oct 2020 11:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <ffc1f2d59fd5005f365eb5d178a2d890112bb6bb.1603469755.git.mchehab+huawei@kernel.org>
 <5e7a3500-a84a-1dfb-0841-bb624eba30c8@amd.com>
In-Reply-To: <5e7a3500-a84a-1dfb-0841-bb624eba30c8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Oct 2020 14:59:38 -0400
Message-ID: <CADnq5_MK3YTpQB2qo5ms4E+tkB-So7vXdgj=-=OYO5yQTRaaRA@mail.gmail.com>
Subject: Re: [PATCH v3 11/56] drm/amdgpu: fix some kernel-doc markups
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bernard Zhao <bernard@vivo.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 xinhui pan <xinhui.pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Jacob He <jacob.he@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgT2N0IDIzLCAyMDIwIGF0IDEyOjUxIFBN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAyMy4xMC4yMCB1bSAxODozMiBzY2hyaWViIE1hdXJvIENhcnZhbGhvIENoZWhhYjoKPiA+IFNv
bWUgZnVuY3Rpb25zIGhhdmUgZGlmZmVyZW50IG5hbWVzIGJldHdlZW4gdGhlaXIgcHJvdG90eXBl
cwo+ID4gYW5kIHRoZSBrZXJuZWwtZG9jIG1hcmt1cC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBN
YXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIraHVhd2VpQGtlcm5lbC5vcmc+Cj4KPiBBY2tl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gPiAt
LS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgICAgICAgfCAy
ICstCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwg
MiArLQo+ID4gICBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCAgICAgICAgICAgICAgICB8
IDIgKy0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiA+IGluZGV4
IGRmMTEwYWZhOTdiZi4uYTVmNzNhMjY3ZmU1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4gPiBAQCAtMjE2Niw3ICsyMTY2LDcgQEAgc3RydWN0IGFtZGdw
dV9ib192YSAqYW1kZ3B1X3ZtX2JvX2FkZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiA+
Cj4gPgo+ID4gICAvKioKPiA+IC0gKiBhbWRncHVfdm1fYm9faW5zZXJ0X21hcHBpbmcgLSBpbnNl
cnQgYSBuZXcgbWFwcGluZwo+ID4gKyAqIGFtZGdwdV92bV9ib19pbnNlcnRfbWFwIC0gaW5zZXJ0
IGEgbmV3IG1hcHBpbmcKPiA+ICAgICoKPiA+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9p
bnRlcgo+ID4gICAgKiBAYm9fdmE6IGJvX3ZhIHRvIHN0b3JlIHRoZSBhZGRyZXNzCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+ID4gaW5kZXggMGM2
YjdjNWVjZmVjLi43OTViYWQzMDc0OTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiA+IEBAIC01MjgsNyArNTI4LDcgQEAgaW50IGFt
ZGdwdV92cmFtX21ncl9hbGxvY19zZ3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gPiAg
IH0KPiA+Cj4gPiAgIC8qKgo+ID4gLSAqIGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3QgLSBhbGxv
Y2F0ZSBhbmQgZmlsbCBhIHNnIHRhYmxlCj4gPiArICogYW1kZ3B1X3ZyYW1fbWdyX2ZyZWVfc2d0
IC0gYWxsb2NhdGUgYW5kIGZpbGwgYSBzZyB0YWJsZQo+ID4gICAgKgo+ID4gICAgKiBAYWRldjog
YW1kZ3B1IGRldmljZSBwb2ludGVyCj4gPiAgICAqIEBzZ3Q6IHNnIHRhYmxlIHRvIGZyZWUKPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFw
aS9kcm0vYW1kZ3B1X2RybS5oCj4gPiBpbmRleCBjNWZmMmIyNzVmY2QuLjc5MWExZDU5N2QyYSAx
MDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gPiArKysgYi9p
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+ID4gQEAgLTY2Nyw3ICs2NjcsNyBAQCBzdHJ1
Y3QgZHJtX2FtZGdwdV9jc19jaHVua19kYXRhIHsKPiA+ICAgICAgIH07Cj4gPiAgIH07Cj4gPgo+
ID4gLS8qKgo+ID4gKy8qCj4gPiAgICAqICBRdWVyeSBoL3cgaW5mbzogRmxhZyB0aGF0IHRoaXMg
aXMgaW50ZWdyYXRlZCAoYS5oLmEuIGZ1c2lvbikgR1BVCj4gPiAgICAqCj4gPiAgICAqLwo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
