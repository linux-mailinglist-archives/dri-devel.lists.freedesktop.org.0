Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4CA3281
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F246C6E2D4;
	Fri, 30 Aug 2019 08:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663E56E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 18:13:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b16so4373946wrq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RPsLG/DrK7S1cxjIO5hGM68Nnjx0F1HKA9t1kfnQ74g=;
 b=QHvkjv1JOeTfLJWOKSA0Hn3NcAL/v+93IdlFmUTbxPsnVNFR/jMySu2dmpkNw2J7gB
 jQCofVZyGgxLTatSHk7hdXXeJe56L9JjpkaNgV074n3PTA1mACjRSp4/5DMQfpzAaX45
 z8ps6EdDCnDzLkfKLyu4zXae0xoVoyTQjFDLEHSZsvTEGbbQDd5Ua/wXrMW1MJCQTPdy
 krqbpyo1eDJj3wI4u7ZeloozcnafgS2CvZn9lccni7X/uYuJiAxdcNV5MVhpTjNoqm2n
 bQVgpn9IPI3u3V1kj8XexvBLxbytLY79uHCccprljmbiX4r3X3X33ZEe7mSgdNEvA5jp
 elvA==
X-Gm-Message-State: APjAAAUzbeQo6mf98pz1n1Q4llrJu6Z23IO4V8OCrluXt5zEXnj163Uz
 IAnlp49rXTPM0xFzIjaQVhg=
X-Google-Smtp-Source: APXvYqy1uxVuFfDhzw4yGsrOUQ2QbCfYyf87sHmmw2aETiCiZrcIYn0Sg8IyQ3jHuwk4Lpp7ZJbASg==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr5361628wrw.18.1567102415082; 
 Thu, 29 Aug 2019 11:13:35 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net.
 [86.58.59.25])
 by smtp.gmail.com with ESMTPSA id i18sm5078699wrp.91.2019.08.29.11.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 11:13:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/4] drm/modes: Add a switch to differentiate free
 standing options
Date: Thu, 29 Aug 2019 20:13:32 +0200
Message-ID: <22387920.Sc3jdxZotC@jernej-laptop>
In-Reply-To: <20190827115850.25731-1-mripard@kernel.org>
References: <20190827115850.25731-1-mripard@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RPsLG/DrK7S1cxjIO5hGM68Nnjx0F1HKA9t1kfnQ74g=;
 b=IFBGH8dggFMomXYlBGLrpeKP+qkOSPflDPK1BpIyWuoxL9cs2Jzf6T22TwRD3JpiH4
 bpppSC6V6uBmSp0RcuNPF/WKmGnP2jlpOq0YZOCKoQScQTFY9bp9tDQ+l+QtxUWV2d8j
 PD6lnlPyrjEqeJPgwyMt3wdmIhuL+bngeZNKD3q4aBiqXQRAfRV5VmLI0zH6AOrZw/f4
 kLiLD9khHnpskJyzKAnFWY4A6CI82Deo0+GbhCjVcg8ms8wWix5A1aq+r/fOreG0PVX0
 6CoyCCijweyWRV3YCDzd7uCmZin9hT1r3zxfamYMynZndKyLJ0B5nQbioSA+HGcWGRqr
 qMAA==
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
Cc: thomas.graichen@googlemail.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgdG9yZWssIDI3LiBhdmd1c3QgMjAxOSBvYiAxMzo1ODo0NyBDRVNUIGplIE1heGlt
ZSBSaXBhcmQgbmFwaXNhbChhKToKPiBGcm9tOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgo+IAo+IFNvbWUgZXh0cmEgY29tbWFuZCBsaW5lIG9wdGlvbnMgY2FuIGJl
IGVpdGhlciBzcGVjaWZpZWQgd2l0aG91dCBhbnl0aGluZwo+IGVsc2Ugb24gdGhlIGNvbW1hbmQg
bGluZSAoYmFzaWNhbGx5IGFsbCB0aGUgZm9yY2UgY29ubmVjdGlvbiBvcHRpb25zKSwgYnV0Cj4g
c29tZSBvdGhlciBhcmUgb25seSByZWxldmFudCB3aGVuIG1hdGNoZWQgd2l0aCBhIHJlc29sdXRp
b24gKG1hcmdpbiBhbmQKPiBpbnRlcmxhY2UpLgo+IAo+IExldCdzIGFkZCBhIHN3aXRjaCB0byBy
ZXN0cmljdCBpZiBuZWVkZWQgdGhlIGF2YWlsYWJsZSBvcHRpb24gc2V0Lgo+IAo+IEZpeGVzOiBl
MDhhYjc0YmQ0YzcgKCJkcm0vbW9kZXM6IFJld3JpdGUgdGhlIGNvbW1hbmQgbGluZSBwYXJzZXIi
KQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+CgpSZXZpZXdlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0
PgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
