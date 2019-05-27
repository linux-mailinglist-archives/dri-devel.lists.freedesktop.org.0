Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952472B3BE
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 13:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED1389956;
	Mon, 27 May 2019 11:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C5989948;
 Mon, 27 May 2019 11:58:36 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s17so16690410wru.3;
 Mon, 27 May 2019 04:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rH+9EBjX0zw+bxpeFNxdzsCkmTUVnh2eHDvaF0MhnE4=;
 b=tgp48gMSurvSBkE7zslmmgpEjXTQou1d01MRUUFJEVvWbyFR+bpfIQtw0GD/3y8/CS
 VyCZM30X6u2WGC5FROMrajbiPllryCPVpIy1eQbIlyBAGGmoiEqcEHTHkXWepnuSiATN
 IciIFNHmh9r9LZsPAX3Loz5EdGGjM4Afvot+zDtB34GCl7dp6LbzPzYAV3++LMHGLmlm
 TdrRE8DO/8Zh32u1t8KfvaD87nuyGNyOn38cKtzCs9kYgtxVhOMKO1Wr46oK4J6MKkXR
 ZfMYmdKkYqX0O99DIe7oKT3IvObMy2PLZZmX4cQPtrkQjcPuJhaiq4OkWZHU+Xro+/ei
 PFPA==
X-Gm-Message-State: APjAAAWoCbjifBcwm8JmErzDZtt/NBlbnqSJq5xIV0zzxWbbtLMFbWWw
 /dutmj/2FccJprVZsDlV4fI=
X-Google-Smtp-Source: APXvYqxlSJNb9Fq1NFAhx9dONfOia3qdxiVIDbcbrnfBfqB0rkLL/sHjPpCU/gN3fZQRm+9yyUlQXw==
X-Received: by 2002:a5d:574a:: with SMTP id q10mr40834308wrw.118.1558958314780; 
 Mon, 27 May 2019 04:58:34 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id n3sm7770032wrt.44.2019.05.27.04.58.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 04:58:33 -0700 (PDT)
Date: Mon, 27 May 2019 12:57:09 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 05/13] drm/i915: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
Message-ID: <20190527115709.GA15067@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-5-emil.l.velikov@gmail.com>
 <871s0k70kj.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871s0k70kj.fsf@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=rH+9EBjX0zw+bxpeFNxdzsCkmTUVnh2eHDvaF0MhnE4=;
 b=m3Lvv+IwqbiyTblnp4qI4kFIXMEoHTNja91p014u/RQeVzTfAocFUgcTUd2vNPNqM/
 oENu52a4a1awbXQQmZAZr0xvvbah/FqYJXLEsA6K0Ednim7CSCzhpo3NigNfh1MEedun
 Mc1b1ctomvBdikfOCRY2AnHi4Ylw7YbcKKTPhHwnlq6rIahzqlqfJGtWRUlEDAwU2N8X
 BzE/IZsOy5quHDyhqOVCzRMwkc2ckL9Rg8ImFX0IbgPEHC1RIhOCwgO+7xqh1YJRz34j
 AY07/tLo99gGZf+YsNZUmgCcTfqYjvHmvLWtR0tqkkkEtqWTkcsN7byLiz6ALtW0q6lG
 m6mA==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNywgSmFuaSBOaWt1bGEgd3JvdGU6Cj4gT24gTW9uLCAyNyBNYXkgMjAxOSwg
RW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gRnJvbTog
RW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+Cj4gPiBUaGUgYXV0
aGVudGljYXRpb24gY2FuIGJlIGNpcmN1bXZlbnRlZCwgYnkgZGVzaWduLCBieSB1c2luZyB0aGUg
cmVuZGVyCj4gPiBub2RlLgo+ID4KPiA+IEZyb20gdGhlIGRyaXZlciBQT1YgdGhlcmUgaXMgbm8g
ZGlzdGluY3Rpb24gYmV0d2VlbiBwcmltYXJ5IGFuZCByZW5kZXIKPiA+IG5vZGVzLCB0aHVzIHdl
IGNhbiBkcm9wIHRoZSB0b2tlbi4KPiA+Cj4gPiBOb3RlOiB0aGUgb3V0c3RhbmRpbmcgRFJNX0FV
VEggaW5zdGFuY2VzIGFyZToKPiA+ICAtIGxlZ2FjeSBEUkkxIGlvY3Rscywgd2hpY2ggYXJlIGFs
cmVhZHkgbmV1dGVyZWQKPiA+ICAtIG1vZGVybiBidXQgZGVwcmVjYXRlZCBpb2N0bHMKPiA+Cj4g
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBK
b29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzog
Um9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+ID4gQ2M6IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiAKPiBQbGVh
c2Ugc2VlCj4gCj4gY29tbWl0IGI5NzJmZmZhMTE0YjE4YTEyMGE3YmJkZTEwNWQ2OWEwODBkMjQ5
NzAKPiBBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21h
aWwuY29tPgo+IERhdGU6ICAgV2VkIEFwciAxNyAxMzoyNToyNCAyMDE5ICswMjAwCj4gCj4gICAg
IGRybS9pOTE1OiByZW1vdmUgRFJNX0FVVEggZnJvbSBJT0NUTHMgd2hpY2ggYWxzbyBoYXZlIERS
TV9SRU5ERVJfQUxMT1cKPiAKPiBJdCdzIGhlYWRlZCB0byBkcm0tbmV4dCBpbiBbMV0uCj4gClJp
Z2h0IG15IHNlcmllcyBpcyBiYXNlZCBvbiBkcm0tbWlzYy1uZXh0LCB3aGljaCBkb2VzIG5vdCAo
eWV0KSBoYXZlCnRoZSBwYXRjaC4gSSdsbCBkcm9wIG15IHBhdGNoIHdoZW4gdGhlIGVxdWl2YWxl
bnQsIHNob3dzIHVwIGluCmRybS1taXNjLW5leHQuCgpUaGFua3MKRW1pbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
