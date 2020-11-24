Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2C2C2BBE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50AD6E45C;
	Tue, 24 Nov 2020 15:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79776E44C;
 Tue, 24 Nov 2020 15:48:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i2so3758128wrs.4;
 Tue, 24 Nov 2020 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YQEzzUsi3ECVy0o2bywn3sPnPcyWGDcKqLpYqiqy8k0=;
 b=dkuQovPHqgYmce+xjSlOvfhq/8tm/S7wmfsf45pnSCSDwQiLIkzbmZ56hywbMGm+MH
 fxlrqrTEUEzqyu1kJW4fqyewc3mGf99GkcNDkKe0UWcm6VGoMj1Lq1Bc6kRjUVUqrvVg
 7p0XZKRRVLw0u3uUo7jrdM7g2/+6J2oJnpVMxSBmiOnBEh3ZmghtDYFRC5JpwVkcff/n
 W8y8z/deyqJBnpFjobuBBemvIn7+Yx6n/09Y6fzctUws8SYbEzEoh7pRi97nvf3tBRcg
 IXAGaK4t9TTI3YHoFqUldMcuHN2gPt/Rx9IP2rmMOCvh1oOQYqoc42bI9H1XJxUXkyRd
 HxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YQEzzUsi3ECVy0o2bywn3sPnPcyWGDcKqLpYqiqy8k0=;
 b=O1AG4F/fymKMa7ECS05DvzYWlQ1rdbynoO/vhdr6WqHI+gLFj6TG3KJn6lL6sUcymM
 ecVXlIMDLF1FvWkZLQNMKbR+uFmopwNV65mawNM7mN8DTEJmEeWVMgFGWkLiEshM0IIK
 rEQE5+/ArEylpU3Fwp6lVz9gx1vXzpE/E/a3WeIF+a7p6iVYXV0iJS1qzvtPHk9WmGWb
 F/v6BfTGqJlcVGCQkSsRUg5VOAMLMiK5d1BiGtFfP4ckVfEffaUC7ZcEl5q4l8VhAUKV
 E47QTl7yNwOXMHfM/KsbxLVpb4E24IdlFq2hbzte5M9G5tv3vDXVTRH49TvjCjES2JuD
 gESg==
X-Gm-Message-State: AOAM530VwTMcux9q4j+XBj/UKVnjseDCpDEZt9fcmszuW+d5dZmpyRB8
 cnBbwDQgI/4IHwOwNLfUq5xDmzfWBn08jyHsglEN29Xl
X-Google-Smtp-Source: ABdhPJwYgYr70cFFo0Y9krfbSn0C7YP63ewXVaD5K8+FsG7eicpQE/XYSITvz9BpjTRXjTOvgEAPxqqfmRX9vlrjQxU=
X-Received: by 2002:adf:8028:: with SMTP id 37mr6020956wrk.111.1606232932459; 
 Tue, 24 Nov 2020 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-3-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-3-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 10:48:41 -0500
Message-ID: <CADnq5_PsVND-G1_z++kv+A9B0xOig5XHW0R2nQrb68kCAe1-yA@mail.gmail.com>
Subject: Re: [PATCH 02/40] drm/amd/amdgpu/amdgpu_ttm: Add description for
 'page_flags'
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <glisse@freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoxOSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYzox
MjE0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdwYWdlX2ZsYWdzJyBu
b3QgZGVzY3JpYmVkIGluICdhbWRncHVfdHRtX3R0X2NyZWF0ZScKPgo+IENjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQg
U2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogSmVyb21lIEdsaXNzZSA8Z2xp
c3NlQGZyZWVkZXNrdG9wLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBU
aGFua3MhCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IDVmY2RkNjdlNWE5MTMuLmRl
YmJjZWY5NjFkZDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
Cj4gQEAgLTExOTksNiArMTE5OSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fYmFja2VuZF9k
ZXN0cm95KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgKiBhbWRncHVfdHRtX3R0X2Ny
ZWF0ZSAtIENyZWF0ZSBhIHR0bV90dCBvYmplY3QgZm9yIGEgZ2l2ZW4gQk8KPiAgICoKPiAgICog
QGJvOiBUaGUgYnVmZmVyIG9iamVjdCB0byBjcmVhdGUgYSBHVFQgdHRtX3R0IG9iamVjdCBhcm91
bmQKPiArICogQHBhZ2VfZmxhZ3M6IFBhZ2UgZmxhZ3MgdG8gYmUgYWRkZWQgdG8gdGhlIHR0bV90
dCBvYmplY3QKPiAgICoKPiAgICogQ2FsbGVkIGJ5IHR0bV90dF9jcmVhdGUoKS4KPiAgICovCj4g
LS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
