Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E57B093E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4656EBD8;
	Thu, 12 Sep 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E786E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:41:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u184so18753030qkd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=25JRBoGwbNqZ8ZbbR+1c/cAOmRYTY0r1W7kYmacXxVo=;
 b=RfKj5CR/WE2yIqy+QaXg188q3NTBE+zsjmlf+o6+WsV0A34ue4HSUnX5d6wD7xB6Sb
 CbGQl20LWnmPW73iMLeU48Opib+BB2xQrYawd91Mu8cwX2qfkQQWa8ZrEfY2Rq1i0W27
 ACSmRk40/AIYoNiZkrSfcoGRffZ/Q9a418C1g20Ye8v71zd+ksC90l2HgR5xbvMzQOk9
 1gVHesHFoCopuCpERi73QoVGoUhNucC+KIVrlQqV033UXmVwrVJpBLotiuSy8xL8+jE6
 lfFYiJ84TinXH1cg2mA6MBNN2ysu90fIrbX5so9PxK6anl2GmYU7cTJ20oFUDPxHCPQw
 zY0w==
X-Gm-Message-State: APjAAAXDB5Jqi7lDIDLVCwLzTSGlksV4cjrBY0KKgCFQfb20TloIyeJ1
 pqgB2AtA4npvXwOUgbo0BgUyKg==
X-Google-Smtp-Source: APXvYqwRPN13iIetO6Wdur/IeaTIoSzIQ9r9ATrh7EP/53AQPhMtw6dHKFMi/Xdr6uoIk3W9ikvjOg==
X-Received: by 2002:a37:541:: with SMTP id 62mr7007670qkf.371.1568223695653;
 Wed, 11 Sep 2019 10:41:35 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id d127sm10590761qke.54.2019.09.11.10.41.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 10:41:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
From: Qian Cai <cai@lca.pw>
In-Reply-To: <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
Date: Wed, 11 Sep 2019 13:41:33 -0400
Message-Id: <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
References: <20190911173453.958-1-cai@lca.pw>
 <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@anandra.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=25JRBoGwbNqZ8ZbbR+1c/cAOmRYTY0r1W7kYmacXxVo=;
 b=WrMnaL3Xuka4oZaXmJIo2WSIwuL2P1+DUFq3nOHLuWVF/+2jQl5Oee0dLhKstwt6sg
 3K3NBriWe2s0xVrhqJpY48vzHy+845CJCkLYXOu4bL/KxHAkVKOsq/Ah4vrFoF/e5hov
 iTYSMYKKVFK63FjFMfShG5O/82tioYFSSYbxsvI6fI/XdRZkpaMGwh3ctaApfURzvupt
 ksmy7yBuJSZJHNpK+ZULajI4JeNGpafSCmvbvgIix4BKrUk4LhAlwfpCLJ5niyiTLkXm
 SfmVe2Io4WLDlBBjXb+izlbIEb7XKmRRhllJco/fpw8nL69/VUrhskbaKyFmaEpopfh/
 NfuQ==
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
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, airlied@linux.ie,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yamada.masahiro@socionext.com,
 mripard@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIFNlcCAxMSwgMjAxOSwgYXQgMTozNyBQTSwgTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBhbmFuZHJhLm9yZz4gd3JvdGU6Cj4gCj4gSGksCj4gCj4gTGUgbWVyLiAxMSBzZXB0LiAy
MDE5IMOgIDE5OjM1LCBRaWFuIENhaSA8Y2FpQGxjYS5wdz4gYSDDqWNyaXQgOgo+IFRoZSBjb21t
aXQgYzBlMDkyMDBkYzA4ICgiZHJtOiByZW9yZ2FuaXNlIGRybSB0cmVlIHRvIGJlIG1vcmUgZnV0
dXJlCj4gcHJvb2YuIikgY2hhbmdlZCB0aGUgYmVoYXZpb3IgZnJvbSBvbmx5IGNvbXBpbGluZyBk
cm0vIGlmIENPTkZJR19EUk09eQo+IHRvIGFsd2F5cyBjb21waWxpbmcgZHJtLy4gVGhpcyByZXN0
b3JlcyB0aGUgYmVoYXZpb3IsIHNvIHBlb3BsZSBkb24ndAo+IG5lZWQgdG8gd2FzdGUgdGltZSBj
b21waWxpbmcgc3R1ZmYgdGhleSBkb24ndCBuZWVkLgo+IAo+IEZpeGVzOiBjMGUwOTIwMGRjMDgg
KCJkcm06IHJlb3JnYW5pc2UgZHJtIHRyZWUgdG8gYmUgbW9yZSBmdXR1cmUgcHJvb2YuIikKPiAK
PiBZb3UgYXJlIG1pc3NpbmcgeW91ciBzaWduZWQtb2ZmLWJ5CgpUaGF0IGlzIGludGVudGlvbmFs
IGJlY2F1c2UgdGhpcyBpcyBhIFJGQyBwYXRjaCB0byBnYXRoZXIgdGhlIGZlZWRiYWNrIGFzIEkg
YW0gbm8KZXhwZXJ0IGluIERSTSBhbmQgbWF5IG1pc3Mgc29tZXRoaW5nIGltcG9ydGFudC4KCk9u
Y2UgcGVvcGxlIGFyZSBoYXBweSB3aXRoIGl0LCBJIHBsYW4gdG8gc2VuZCBhIGZvcm1hbCBwYXRj
aCB3aXRoIFNpZ25lZC1vZmYtYnkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
