Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A617A3C773
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 11:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4D89083;
	Tue, 11 Jun 2019 09:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD9389177
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:42:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g13so19076254edu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 02:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PX6RKB+aNiXuwc2tkgg7wZYFO8PUdcQOHP+CCQKfWic=;
 b=J6QCQvVc3ycMWTpNR/Ezrc26bsWSZZ3bhhSz01xpC/O/68lvKQTFvl3+2/6hSinZpG
 xtxeG8b2QZ4vBCezotJAc54YeFZ3ZHulfEtrR3pOW/aIdFQLfJt7OY6QVwWUi0oxiKKX
 r6wWET3Ywliis0ZNSn4Zs24vn5N1fjTgmTcl/oH12E41PnrOZk/rzsjYjiGNMCTe5g/e
 uCg8fIIC/ZXzB2ASxCzcUT4fLegxlFHy+lcVxwfO+gzb3eicxXFztL/ZpiEH1neQ/NH4
 Wy3CzLAB8Ni8Lqrhy+biIoDzr0ZU+HX2BUuEfXrrKR2owJG/uJX5S+bOZKmg2Qkqs5k5
 aJTw==
X-Gm-Message-State: APjAAAVbTeDwuWpdjALjMR2qvjYs8bnXm/t9ITjaoW2VcOa9AfQZAgDW
 kxjoq4BnKmBVp3YMb79S5H3Fcg==
X-Google-Smtp-Source: APXvYqxtcMiIxgZywWHT7FOUGyVkgMxOmyCXmrHMBsD17xfz1XHFMgjhlN0S7lUfPzb9XDWgbnGMrg==
X-Received: by 2002:a17:906:451:: with SMTP id
 e17mr9219107eja.161.1560246147372; 
 Tue, 11 Jun 2019 02:42:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm2836182edd.49.2019.06.11.02.42.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 02:42:26 -0700 (PDT)
Date: Tue, 11 Jun 2019 11:42:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/10] drm: fix build errors with drm_print.h
Message-ID: <20190611094224.GA21222@phenom.ffwll.local>
References: <20190609220757.10862-1-sam@ravnborg.org>
 <20190609220757.10862-2-sam@ravnborg.org>
 <20190611083911.GT21222@phenom.ffwll.local>
 <20190611091107.GA29656@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611091107.GA29656@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PX6RKB+aNiXuwc2tkgg7wZYFO8PUdcQOHP+CCQKfWic=;
 b=a3WcHnUh4hY+3q33vgI4EdO09m4xZwEnxGcULxCDXFLD6t+XzYeMg5IKzCWfInyhsu
 huSNcToCRbshAcZUU/u9gWTE5+fCD96jwR4wwq58IjJFkMDUV0RbQWcmZEiD/Lgmy7Bd
 s+q06aqTTGjPJ0Erl4zhMEvu6/NL/XnYRYQow=
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6MTE6MDdBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbmllbC4KPiAKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMDozOToxMUFN
ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMTAsIDIwMTkgYXQg
MTI6MDc6NDhBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gPiBkcm1fcHJpbnQuaCBy
ZXF1aXJlcyA8ZHJtL2RybS5oPiB0byBmaXggYnVpbGQgd2hlbiBtYWNyb3MgYXJlIHVzZWQuCj4g
PiA+IFB1bGwgaW4gdGhlIGhlYWRlciBmaWxlIGluIGRybV9wcmludC5oIHNvIHVzZXJzIGRvIG5v
dCBoYXZlIHRvIGRvIGl0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KPiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gLS0tCj4gPiA+ICBpbmNsdWRlL2Ry
bS9kcm1fcHJpbnQuaCB8IDIgKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9wcmludC5oCj4gPiA+IGluZGV4IDNhNDI0NzMxOWU2My4uYTVkNmYyZjNl
NDMwIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ID4gPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ID4gPiBAQCAtMzIsNiArMzIsOCBAQAo+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMu
aD4KPiA+ID4gIAo+ID4gPiArI2luY2x1ZGUgPGRybS9kcm0uaD4KPiA+IAo+ID4gV2hhdCBnb2Vz
IGJvb20gd2l0aG91dCB0aGlzPyBPbmx5IGRybS9kcm0uaCB0aGF0IEkgY291bGQgZmluZCB3YXMg
dGhlIG9uZQo+ID4gaW4gdWFwaS9kcm0vZHJtLmgsIGFuZCB0aGF0IG9uZSBsb29rcyB2ZXJ5IGZp
c2h5IHRvIGluY2x1ZGUgZnJvbSBhbgo+ID4gaW50ZXJuYWwgaGVscGVyIGhlYWRlciBsaWtlIHBy
aW50LmguCj4gCj4gZHJtX3ByaW50LmggdXNlcyBEUk1fTkFNRSAtIHdoaWNoIGlzIGRlZmluZWQg
b25seSBpbiB1YXBpL2RybS9kcm0uaC4KPiBUaGUgZXJyb3IgaXMgc2VlbiB3aGVuIHlvdSBpbmNs
dWRlIGRybV9wcmludC5oIGFuZCBub3QgbXVjaCBvdGhlciBkcm0KPiBoZWFkZXIgZmlsZXMuCj4g
VGlkYXkgd2UgcmVseSBvbiBvdGhlciBkcm0gaGVhZGVyIGZpbGVzIHRvIHB1bGwgaW4gZHJtLmgu
Cj4gCj4gTm90aWNlIC0gdGhlIGVycm9yIG9ubHkgbWFuaWZlc3QgaXRzZWxmIHdoZW4gdGhlIG1h
Y3JvcyBhcmUgdXNlZC4KPiBJbmNsdWRpbmcgdGhlIGRybV9wcmludC5oIHdpbGwgbm90IGRvIGl0
LgoKVWgsIEkgdGhpbmsgbGV0J3MganVzdCBpbmxpbmUgRFJNX05BTUUsIHRoYXQgYWxzbyBjbGVh
bnMgdXAgdGhlIGNvZGUuIEFuZApkcm9wIHRoZSB1YXBpIGluY2x1ZGUgZnJvbSBkcm0gaW50ZXJu
YWwgaGVhZGVycywgdGhhdCBmZWVscyBiYWQuIEluCmdlbmVyYWwgSSB0aGluayB1YXBpIGhlYWRl
cnMgc2hvdWxkIG9ubHkgYmUgaW5jbHVkZWQgYnkgdGhlIC5jIGZpbGVzIHRoYXQKYWN0dWFsbHkg
aW1wbGVtZW50IGlvY3RscyBhbmQgc3R1ZmYgbGlrZSB0aGF0LgoKQ2FuIHlvdSBwbHMgZG8gdGhh
dCBwYXRjaCBmb3IgZHJtX3ByaW50Lmg/CgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
