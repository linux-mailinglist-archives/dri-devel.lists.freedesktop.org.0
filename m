Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDC7B2E759
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C5310E290;
	Wed, 20 Aug 2025 21:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HuH7pQCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2D710E290
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 21:18:19 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-76e2e591846so289429b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755724699; x=1756329499;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:user-agent
 :references:mime-version:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2sI+EmkGPgxhQKQRdeihx9n+/PXLkEt2V+3lWG3atQ=;
 b=HuH7pQCvAQjipSTdMQw246z00VUFQYJh70Fj08IcYvvhmgr/WZpjfNSAGEXtXzTU1Y
 iYf3G7Is3E6obyM+dquciy+VLzCg/m0cw4lsfo2JSxC+Kx4TMiTPVg5uy1+4xu7ZHrrA
 ujeMRuzJGpYtp5ja5KmwRYxn9NvPSkQ3OE9tkMNQ/nAiPeB4vn9LruMvmE41F8q+M9Bk
 CQg41v0NclScuVUwC6p8VtWURiOWuYwZiS+nMMM3ng6wA7dhXgCrhMap4U5LL3O34JjO
 jAiQ1pKa4/EjGpMwxUgyuWCxldYUrtfP4JJ0teYuG7add8JN33liV/CIKsPP9FoHM66K
 fpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755724699; x=1756329499;
 h=content-transfer-encoding:cc:to:from:subject:message-id:user-agent
 :references:mime-version:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P2sI+EmkGPgxhQKQRdeihx9n+/PXLkEt2V+3lWG3atQ=;
 b=g9F1eJ2mhr6XW19S0SXxTwuSLYgUX8XctJqRYT6nPoFpSv0DcJfBXHkigbyP8vLruP
 1Cko10RRgOLVVUTeiT07rW/VUF5+kMS+EUvC4aBVhFA7I3DkQHSluNKbZiEkqhW4lsUc
 TDO2qoHRWtRJGrAAaqOWhOfzcTkkgbFbRoLvLQPpk+GIFYP4+0/LUZciKetE4s4As+dH
 YHyUpEfOiiNvEtnSI5qe+tjGRVJGaWWenGwI8apPcjME+b8q3g0A6iwjiGr91y0YkgLV
 72E3VvNG20X8Pv8O1KCgfIVtfh82ai0+S0tJS/eohyLESHpBGM4Id7EDjRCOEpLxt5cx
 fiaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4WCNBNDCjyCbNw7ujmHxorAgj8QTqrdqbc7/qhtbKHLmWjRc4SGp6dtz/Vg3won/FsmBVP2z5j2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMJYCIkl5PPHq9sa498LnjqaPIvF/hYasxDErqUIZ/MSafVewv
 y2vCEGFbHZGVnHpFO3sZD0KfTJQ2ejJZmnIrJX+AofVDyC969PT+TfLPJty1bhU1sQ9zgAMsnEl
 9lkD8HytV8w==
X-Google-Smtp-Source: AGHT+IGfZP+wKkOwbvIAFQDDRrNs531sY6ekAT/1sq8Dm++Un59KxoImN/CEr2ujCu8EtL5kcx22ioHf3ZVg
X-Received: from pfbhc8.prod.google.com ([2002:a05:6a00:6508:b0:76e:7044:f5e6])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2a8:b0:76e:8bb8:b1b8
 with SMTP id d2e1a72fcca58-76ea303345fmr42111b3a.7.1755724699067; Wed, 20 Aug
 2025 14:18:19 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:18:17 -0700
In-Reply-To: <20250820201612.2549797-1-cmllamas@google.com> (via kernel-team's
 message of "Wed, 20 Aug 2025 20:16:11 +0000")
Mime-Version: 1.0
References: <20250820201612.2549797-1-cmllamas@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Message-ID: <dbx8a53t7kva.fsf@ynaffit-alt.c.googlers.com>
Subject: Re: [PATCH] drm/xe: replace basename() with portable strrchr()
From: Tiffany Yang <ynaffit@google.com>
To: "'Carlos Llamas' via kernel-team" <kernel-team@android.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?utf-8?Q?Thomas_Hellstr?= =?utf-8?Q?=C3=B6m?="
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matt Atwood <matthew.s.atwood@intel.com>, Carlos Llamas <cmllamas@google.com>, 
 linux-kernel@vger.kernel.org, 
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IidDYXJsb3MgTGxhbWFzJyB2aWEga2VybmVsLXRlYW0iIDxrZXJuZWwtdGVhbUBhbmRyb2lkLmNv
bT4gd3JpdGVzOg0KDQo+IENvbW1pdCBiMGEyZWU1NTY3YWIgKCJkcm0veGU6IHByZXBhcmUgeGVf
Z2VuX3dhX29vYiB0byBiZSBtdWx0aS11c2UiKQ0KPiBpbnRyb2R1Y2VkIGEgY2FsbCB0byBiYXNl
bmFtZSgpLiBUaGUgR05VIHZlcnNpb24gb2YgdGhpcyBmdW5jdGlvbiBpcyBub3QNCj4gcG9ydGFi
bGUgYW5kIGZhaWxzIHRvIGJ1aWxkIHdpdGggYWx0ZXJuYXRpdmUgbGliYyBpbXBsZW1lbnRhdGlv
bnMgbGlrZQ0KPiBtdXNsIG9yIGJpb25pYy4gVGhpcyBjYXVzZXMgdGhlIGZvbGxvd2luZyBidWls
ZCBlcnJvcjoNCg0KPiAgICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ2VuX3dhX29vYi5jOjEzMDox
MjogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYY29uc3QgIA0KPiBjaGFyICrigJkgZnJvbSDigJhp
bnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgIA0KPiBbLVdp
bnQtY29udmVyc2lvbl0NCj4gICAgICAxMzAgfCAgICAgICAgIGZuID0gYmFzZW5hbWUoZm4pOw0K
PiAgICAgICAgICB8ICAgICAgICAgICAgXg0KDQo+IFdoaWxlIGEgUE9TSVggdmVyc2lvbiBvZiBi
YXNlbmFtZSgpIGNvdWxkIGJlIHVzZWQsIGl0IHdvdWxkIHJlcXVpcmUgYQ0KPiBzZXBhcmF0ZSBo
ZWFkZXIgcGx1cyB0aGUgYmVoYXZpb3IgZGlmZmVycyBmcm9tIEdOVSB2ZXJzaW9uIGluIHRoYXQg
aXQNCj4gbWlnaHQgbW9kaWZ5IGl0cyBhcmd1bWVudC4gTm90IGdyZWF0Lg0KDQo+IEluc3RlYWQg
cmVwbGFjZSBiYXNlbmFtZSgpIHdpdGggYSBzdHJyY2hyKCkgYmFzZWQgaW1wbGVtZW50YXRpb24g
d2hpY2gNCj4gcHJvdmlkZXMgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSBhbmQgYXZvaWQgcG9ydGFi
aWxpdHkgaXNzdWVzLg0KDQpOaXQ6IHMvYXZvaWQvYXZvaWRzLiBPdGhlciB0aGFuIHRoYXQsDQoN
Cg0KPiBGaXhlczogYjBhMmVlNTU2N2FiICgiZHJtL3hlOiBwcmVwYXJlIHhlX2dlbl93YV9vb2Ig
dG8gYmUgbXVsdGktdXNlIikNCj4gU2lnbmVkLW9mZi1ieTogQ2FybG9zIExsYW1hcyA8Y21sbGFt
YXNAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dlbl93YV9v
b2IuYyB8IDQgKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCg0KDQpSZXZpZXdlZC1ieTogVGlmZmFueSBZYW5nIDx5bmFmZml0QGdvb2dsZS5j
b20+DQoNCi0tIA0KVGlmZmFueSBZLiBZYW5nDQo=
