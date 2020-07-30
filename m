Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA9233500
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 17:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AFB6E24E;
	Thu, 30 Jul 2020 15:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19136E24E;
 Thu, 30 Jul 2020 15:06:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 9so5998851wmj.5;
 Thu, 30 Jul 2020 08:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5BIl9z33VV2injGUNVpaS5GiRrVtRiF98Z2D8xQ04Jw=;
 b=DcTP+N6cfZvhOPai1Y5UD5khSIjA/rg/8P9pPm6m8SOL7QWBht9N1bNI5uHijfiZCS
 31L+zrpqpP6JO4UVDLX162T/+aqAMtOgTyTPOX8ZFtwnSGl12H2PjIx052H8lGQ0MDjq
 Cm7KkCiAzqv1T8scm9ZdTWMzJyo+hB8OU/p4DZ+ZH1E/fwn3VPDr9WXW060xIPccCwWC
 d8QfOQCDMgHQMTvM2u3mYUqffNYnMk1Hj1VpViQUyVCmTHQI+wb7cKou11qpTPBMBles
 si2864xS4/5ADW/SFcMnSAGFL05upDnHc8Z9kg1blI60xeb0HiO/EHLqklRXS/57n3i2
 oyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5BIl9z33VV2injGUNVpaS5GiRrVtRiF98Z2D8xQ04Jw=;
 b=Wctun/c3bd6SpwBN8ln9dKCcy+2Ah6Bz9b2wi9OcXFFzoeFA1z0VnC7esafJg/Aq2b
 1BJPCQmBXgMEqS9h4nxYrm4Z516vfpysOxIi1XfC6QNQBlXMc6jVrmNMjUUuar4XzuIP
 0sqNioUS4rtpHpWhIfsmBGYK0xWFtTu8B8ziIb7X04Vt4bk0ZJ0+FslpX7RB03LJT+E0
 ZvLVpxUr09viuarg/JINh6ces74bI/h7lRKil3VCCQzeIOJD0boS0qZ1BKzHwxQF1i/U
 6mSKJFeTAg8hB6erPoik5j8gAMN8juIlqseVJDXtf3XMDIpLOZgTAiGCmqEvUkJPXFhj
 bDtA==
X-Gm-Message-State: AOAM5331vByt18ArrYiNPDlJmNXOiqrimM0jM921QwwP7mqtzZuD4dH3
 NSxjV02AJd6hnuhZVjlAFe7bZ1wGhOZ3Nj7DrqgR+Q==
X-Google-Smtp-Source: ABdhPJwUaxovexG0gh+zxWWAdKKSW5J4nuwrMrgQwB1imBAo/Ix+dIuO+T2ltHFyJrWRpSQ0nj55aMV7xVmceidccO8=
X-Received: by 2002:a05:600c:2209:: with SMTP id
 z9mr13517372wml.70.1596121594171; 
 Thu, 30 Jul 2020 08:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200730033630.4455-1-alexander.deucher@amd.com>
In-Reply-To: <20200730033630.4455-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Jul 2020 11:06:23 -0400
Message-ID: <CADnq5_MrVoF6=Nwx3COj9OnJ1-LiR_jj3GiqpEqUaC+RrtwZ-Q@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.8
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjksIDIwMjAgYXQgMTE6MzYgUE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwgRGFuaWVsLAo+Cj4gQSBmZXcgZml4ZXMg
Zm9yIDUuOC4gIEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHRoZXNlIGluIGZvciA1LjggZmluYWws
IGJ1dCBpZgo+IGl0J3MgdG9vIGxhdGUsIHRoZXkgY2FuIGdvIGJhY2sgdmlhIHN0YWJsZSBmcm9t
IDUuOS4KCklnbm9yZSB0aGlzIG9uZS4gIFRoZSBOVUxMIHBvaW50ZXIgcmVncmVzc2lvbiBmaXgg
ZGlkbid0IGZ1bGx5IGZpeCB0aGUKaXNzdWUsIHNvIEknbSBnb2luZyB0byBzZW5kIGEgbmV3IFBS
IHdpdGggYSByZXZlcnQgb2YgdGhlIG9yaWdpbmFsCnBhdGNoLgoKU29ycnkgZm9yIHRoZSBjb25m
dXNpb24uCgpBbGV4Cgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhNGEy
NzM5YmViODkzM2ExOTI4MWJjYTA3N2ZkYjg1MjU5ODgwM2VkOgo+Cj4gICBNZXJnZSB0YWcgJ2Ry
bS1taXNjLWZpeGVzLTIwMjAtMDctMjgnIG9mIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3Jn
L2RybS9kcm0tbWlzYyBpbnRvIGRybS1maXhlcyAoMjAyMC0wNy0yOSAxMjo0Njo1OCArMTAwMCkK
Pgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBnaXQ6Ly9w
ZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCB0YWdzL2FtZC1kcm0tZml4ZXMtNS44
LTIwMjAtMDctMjkKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhNGY4Yjk1M2E0
MmVmNmYzNjU1ZGNmODNkNTYwNTI4YjlmNDE2MmRjOgo+Cj4gICBkcm0vYW1kL2Rpc3BsYXk6IENs
ZWFyIGRtX3N0YXRlIGZvciBmYXN0IHVwZGF0ZXMgKDIwMjAtMDctMjkgMjM6MTc6MjMgLTA0MDAp
Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gYW1kLWRybS1maXhlcy01LjgtMjAyMC0wNy0yOToKPgo+IGFtZGdwdToK
PiAtIEZpeCBhIHJlZ3Jlc3Npb24gY2F1c2VkIGJ5IGEgTlVMTCBwb2ludGVyIGZpeAo+IC0gRml4
IHBvdGVudGlhbCBrZXJuZWwgaW5mbyBsZWFrCj4gLSBGaXggYSB1c2UtYWZ0ZXItZnJlZSBidWcg
dGhhdCB3YXMgdW5jb3ZlcmVkIGJ5IGFub3RoZXIgY2hhbmdlIGluIDUuNwo+Cj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IE1hemluIFJlemsgKDEpOgo+ICAgICAgIGRybS9hbWQvZGlzcGxheTogQ2xlYXIgZG1fc3RhdGUg
Zm9yIGZhc3QgdXBkYXRlcwo+Cj4gUGF3ZcWCIEdyb25vd3NraSAoMSk6Cj4gICAgICAgZHJtL2Ft
ZGdwdTogRml4IHJlZ3Jlc3Npb24gaW4gYWRqdXN0aW5nIHBvd2VyIHRhYmxlL3Byb2ZpbGUKPgo+
IFBlaWxpbiBZZSAoMSk6Cj4gICAgICAgZHJtL2FtZGdwdTogUHJldmVudCBrZXJuZWwtaW5mb2xl
YWsgaW4gYW1kZ3B1X2luZm9faW9jdGwoKQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9rbXMuYyAgICAgICAgICAgfCAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcG0uYyAgICAgICAgICAgIHwgIDkgKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzNiArKysrKysrKysrKysrKysr
Ky0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
