Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199947AA30
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABE86E526;
	Tue, 30 Jul 2019 13:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A906E526
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:53:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so40805439wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 06:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jb0dHU0CIvldAKay8nTmV8HpydUwJ76tdg98JkZMfhw=;
 b=HSmuetR7M6/xNBWoRPKFU6xi+9uV+3LvuqMzSAsH5o3pSkXKFTw3O3tHrmg0EfVcZN
 JFTnYzzkVTotsx+2Kdrcg5O7owwXyIlZo3riqBM98FKsGnkacJlLOPqCTBNbG2KIz7MS
 XosZNvvqKxUJWkXkiQRMV/aSepQD6gdwhqNA49oc0aHCuM76zRPtxNP8ixxT/1u+TGWC
 zaZbUtQnujlAefMSlYXc0d90gBsigrKTm2Tpe5IHRN7bHoh5FlX405gKeVpaAfvm3GqB
 tAzL+0Tu5ym4Nz5PwIbkWyMYJoWbmiZWTOubpD9wGithJyih+gHJtYcn2zWoVgFrPQ+4
 wOeA==
X-Gm-Message-State: APjAAAVYGDUU3ZWLSANPDvgCHh2yx7yq6JAZhusljbdIFt/fe2MFS2e7
 HWu1FLuJ9afjYJHWEPjVQSE=
X-Google-Smtp-Source: APXvYqxNafO+RFe2+PL2DljPZEA0xLZm4GEY66P99qIkAJQr/+nLfk4InTug907ubifopFP7pXAt3Q==
X-Received: by 2002:a5d:4ac3:: with SMTP id y3mr101499494wrs.187.1564494811440; 
 Tue, 30 Jul 2019 06:53:31 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id i66sm107570958wmi.11.2019.07.30.06.53.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 06:53:30 -0700 (PDT)
Date: Tue, 30 Jul 2019 14:53:02 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
Message-ID: <20190730135302.GA12424@arch-x1c3>
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725105132.22545-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725105132.22545-2-noralf@tronnes.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=jb0dHU0CIvldAKay8nTmV8HpydUwJ76tdg98JkZMfhw=;
 b=BBKFT5DRkDJhTY51o1t9+C7sml8ON/j7qX4UzzbU74zQpcM2qyXddUrB/LeURNZAS5
 q5EVYDKWrMMdwof90Qy/c0qMbUp6T49ZS6BHGfcrQDGdhLADU/dDWM7S8YnbXBVJhE2h
 RQ0ROqyJ1jnTkj/MWq+SuHKgMVeI325JZGEApXyEQ5jIlLH+3HlDbVoSxfwAdMsLLbOs
 4qzgIv36qMC3wGaHv2jhb+m73a946McVDwKGunaXFUTwJbGvKXqvgQXiLfRgKPxukYk9
 RZCGDCCqjCQDOFJjWbvtkCzbJhFkKcKR/T4w7C5aFHRjwBxFH9iUcO4R5ncpYJs+iqyn
 ql4w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8yNSwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IFRoaXMgbWFrZXMgdGhlIHRp
bnkgZHJpdmVycyB2aXNpYmxlIGJ5IGRlZmF1bHQgd2l0aG91dCBoYXZpbmcgdG8gZW5hYmxlIGEK
PiBrbm9iLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25u
ZXMub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgIHwgIDIgKy0K
PiAgZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZyB8IDM3ICsrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUg
Yi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPiBpbmRleCA5OGM3MzJmOTI1YzcuLjBiMzBhZmE3
NTI0ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPiBAQCAtMTEyLDcgKzExMiw3IEBAIG9iai0kKENPTkZJR19E
Uk1fQVJDUEdVKSs9IGFyYy8KPiAgb2JqLXkJCQkrPSBoaXNpbGljb24vCj4gIG9iai0kKENPTkZJ
R19EUk1fWlRFKQkrPSB6dGUvCj4gIG9iai0kKENPTkZJR19EUk1fTVhTRkIpCSs9IG14c2ZiLwo+
IC1vYmotJChDT05GSUdfRFJNX1RJTllEUk0pICs9IHRpbnlkcm0vCj4gK29iai15CQkJKz0gdGlu
eWRybS8KPiAgb2JqLSQoQ09ORklHX0RSTV9QTDExMSkgKz0gcGwxMTEvCj4gIG9iai0kKENPTkZJ
R19EUk1fVFZFMjAwKSArPSB0dmUyMDAvCj4gIG9iai0kKENPTkZJR19EUk1fWEVOKSArPSB4ZW4v
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcgYi9kcml2ZXJz
L2dwdS9kcm0vdGlueWRybS9LY29uZmlnCj4gaW5kZXggNDJiMDZmNGY4OTg5Li5mOGM5YTBlNzFk
ZGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcKPiBAQCAtMSwxNiArMSw5IEBACj4gICMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+IC1tZW51Y29uZmlnIERSTV9U
SU5ZRFJNCj4gLQl0cmlzdGF0ZSAiU3VwcG9ydCBmb3Igc2ltcGxlIGRpc3BsYXlzIgo+IC0JZGVw
ZW5kcyBvbiBEUk0KPiAtCXNlbGVjdCBEUk1fS01TX0hFTFBFUgo+IC0Jc2VsZWN0IERSTV9LTVNf
Q01BX0hFTFBFUgo+IC0JaGVscAo+IC0JICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUg
YSB0aW55ZHJtIHN1cHBvcnRlZCBkaXNwbGF5Lgo+IC0JICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBt
b2R1bGUgd2lsbCBiZSBjYWxsZWQgdGlueWRybS4KPiAtCkZ3aXcgSSB3b3VsZCBoYXZlIGdvbmUg
d2l0aCBIYW4ncyBpZGVhIG9mIG1ha2luZyB0aGlzIGhpZGRlbi4gVGhhdCBoYXMgYQpudW1iZXIg
b2YgYWR2YW50YWdlcywgZXZlbiBpZiB3ZSBkb24ndCBoYXZlIGEgc2VwYXJhdGUgdGlueWRybS5r
bzoKIC0gdGhlIHRpbnlkcm0gY29kZSBpcyBub3QgYnVpbGQgd2hlbiB0aGVyZSBhcmUgbm8gdXNl
cnMKIC0gdGhlIHRpbnlkcm0gZGVwZW5kZW5jaWVzIGFyZSBjb250YWluZWQgd2l0aGluIGl0c2Vs
ZiwgaW5zdGVhZCBvZgp1cGRhdGluZyA1LTEwIGluZGl2aWR1YWwgZHJpdmVycwoKVGhhdCBzYWlk
LCBJIHdvbid0IGdldCBpbiB0aGUgd2F5IGlmIHBlb3BsZSBsaWtlIHRoaXMgYXBwcm9hY2ggOy0p
CgpIVEgKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
