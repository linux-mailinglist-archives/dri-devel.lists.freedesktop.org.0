Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B6143368
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0C389321;
	Thu, 13 Jun 2019 07:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ABD891CC;
 Thu, 13 Jun 2019 02:49:02 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d30so10016127pgm.7;
 Wed, 12 Jun 2019 19:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2kfw74gaPiQLBivN6WnAdASClOTarpBowH5hE17A4dU=;
 b=qRf3p9CJF1zIYY3kjKwsBc8YgOsOoKYJ7tDqwNRzkAh783WTWgxJe5s7NpRARXkpD4
 0g7Um8k5zRmUF03eNM00Tu/7Ldwppg9O+AVqTVqPBgjounFbc2lUaePGkoTKm/6YVTR6
 uBz1McMiFaFZk7oiAf7g1LwUCgb5CLW8OWJm1BOQVvcEfX42HcGiiwjORH27151rZNAu
 sBJmZaXAvNv4XLvcMzElZVWzCRokagdYKTTio6CAsrv8uA1ebFUjZlEHNqn9fYuAZTXM
 wJ+WARTKuO5AFIlH4rIoNSS/QZqyKJY1nv7FTSLv+fwVO8PAF5jhP0nyCK9WhbgPkV8i
 RXVQ==
X-Gm-Message-State: APjAAAWhJ+r4IGUvNzKlp7/7OCA2CBRKu64kdJQf/BIuq9c8/paoPL+g
 ffG2UPVoT6ZnuubLMnehyUA=
X-Google-Smtp-Source: APXvYqy7N3/apEzke72gAXr2P0AbPFJhZcmBqH52rWR9JzsFn/eGdg3Ub81yBSOKIDg4uEckTBEePw==
X-Received: by 2002:a65:4306:: with SMTP id j6mr27990148pgq.418.1560394141664; 
 Wed, 12 Jun 2019 19:49:01 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.89.153])
 by smtp.gmail.com with ESMTPSA id y5sm781057pgv.12.2019.06.12.19.48.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 19:49:01 -0700 (PDT)
Date: Thu, 13 Jun 2019 08:18:54 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Tony Cheng <tony.cheng@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Charlene Liu <charlene.liu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Gloria Li <geling.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: fix compilation error
Message-ID: <20190613024854.GA25104@hari-Inspiron-1545>
References: <20190613023208.GA29690@hari-Inspiron-1545>
 <CADnq5_PU_jvOskC-=+oRQdvYXZvu_n26ogoWTxLRxnW+ke4wDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PU_jvOskC-=+oRQdvYXZvu_n26ogoWTxLRxnW+ke4wDw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=2kfw74gaPiQLBivN6WnAdASClOTarpBowH5hE17A4dU=;
 b=mlff+T0EI3xPNdUTq8+8uEb3J8W+RDh37tnQqBQJXniyQlQ9E+5o/Zv7YgMkxdBb/e
 V/9kn+Z4oq7ipWZSeVf/S7tAdZzMryM/tIeV8BNnJShHmE1QEm8dLZiiHnuhdajxwwuI
 boACWHwcLQUTS/4l11AC8ZQcwniFXKKQH0J8SHKF9M+c+TLLlVQ4ni3xRWq2/U9njKkr
 CUPrnaIw/0FBBiljnWpU8pTgoZGeb/b8Z9Gt5nfPX/YV3IsgRNNyq/tuQ1Ey/eXMKy9X
 NHOqoVmk+Yr19mGOTiRBel66idcIpQP8lL1chpDXGMCksduSYpj/o5lx6q772k6Vm0s8
 oVJQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTA6MzU6MjZQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDEwOjM0IFBNIEhhcmlwcmFzYWQgS2VsYW0K
PiA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IHRoaXMgcGF0Y2gg
Zml4ZXMgYmVsb3cgY29tcGlsYXRpb24gZXJyb3IKPiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jOiBJbgo+ID4g
ZnVuY3Rpb24g4oCYZGNuMTBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNl4oCZOgo+ID4gZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIu
YzoyMzc4OjM6Cj4gPiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCY
dWRlbGF54oCZCj4gPiBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+
ICAgIHVkZWxheSh1bmRlcmZsb3dfY2hlY2tfZGVsYXlfdXMpOwo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEhhcmlwcmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgo+IAo+IFdo
YXQgYnJhbmNoIGlzIHRoaXMgcGF0Y2ggYmFzZWQgb24/Cj4gCj4gQWxleAoKSGkgQWxleCwKCkl0
IGlzIG9uIGxpbnV4LW5leHQKClRoYW5rcywKSGFyaXByYXNhZCBrCj4gPiAtLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCAx
ICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVl
bmNlci5jCj4gPiBpbmRleCBkMjM1Mjk0OS4uMWFjOWE0ZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVl
bmNlci5jCj4gPiBAQCAtMjMsNiArMjMsNyBAQAo+ID4gICAqCj4gPiAgICovCj4gPgo+ID4gKyNp
bmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4gICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgo+ID4g
ICNpbmNsdWRlICJjb3JlX3R5cGVzLmgiCj4gPiAgI2luY2x1ZGUgInJlc291cmNlLmgiCj4gPiAt
LQo+ID4gMi43LjQKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
