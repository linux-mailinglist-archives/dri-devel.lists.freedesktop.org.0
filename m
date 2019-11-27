Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073310AD2D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 11:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE91489D30;
	Wed, 27 Nov 2019 10:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666089D30
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:06:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b11so6384631wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 02:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7L9Wk/FKnkC/Zlgs/brH2Y9L4gw6e7ePkqKzatJyV5M=;
 b=IR/QmyF2aom9e6zaUs40PxyGlsptX1dO+2M9HOeEmhQ+JamMffPLe5pampdm3nqjYT
 FHmEdOXYAL5R00c+h6YYHajjAJRfU0sDi9gF4J1WGi5gb8GMtOWy9gx+9SeJRiadozwX
 HeAEeyZKu5znd2En+mv8Or6R6vG4MA9mGSs/F0Z5V7oag77+f+2xVzT0mRXDpS7x4UtR
 he6qgrJR/QuOQZDp97CflSyRrysR3ZqPVmNifPF5rNpoEzPKzbDrPDez74cD5qfUpAVo
 wtwlm4DnjVIeQQ3QJ7jAM0OeC7DhoVvBisfKt9QsZl70pj2lpSlcqBV21S/LejPhUHPg
 crlQ==
X-Gm-Message-State: APjAAAVSWj/AF+ETT2vW7JvZXLGO0jz0WnV+zCAYMivNBKF9B9Hjr0mI
 m7fVkRWdpLsF8kYaWWWi6JQRJw==
X-Google-Smtp-Source: APXvYqzGMkDTLgkJPNAZe0OvTL1yVegf7OXXJJD2YqJrrUrWDZej0Pz1/vqbXU243kH6lwj1D9/G/g==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr3571133wme.125.1574849197255; 
 Wed, 27 Nov 2019 02:06:37 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u1sm6150282wmc.3.2019.11.27.02.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 02:06:36 -0800 (PST)
Date: Wed, 27 Nov 2019 11:06:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [GIT PULL] drm/arc: Yet another set of minor fixes
Message-ID: <20191127100634.GE29965@phenom.ffwll.local>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7L9Wk/FKnkC/Zlgs/brH2Y9L4gw6e7ePkqKzatJyV5M=;
 b=OBAJB64VnmKGCTfGn3SW8x4eg/DvfWol9yiUX+vOlSDEA4CGelx6yGSUoehrrm4MI5
 SFTTWfhg7dxBVQKOxfuOEgb6NAL5Nes6YuirdLTE37IKlDmmhQk/YZ8EA1pdlwnNia0x
 NcRo6nn/C+sPc9InSPJuf31TBSRb7iG7h2Dto=
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
Cc: David Airlie <airlied@linux.ie>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDc6NDg6MDRBTSArMDAwMCwgQWxleGV5IEJyb2RraW4g
d3JvdGU6Cj4gSGkgRGF2aWQsIERhbmllbCEKPiAKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IDgwODI3MzE4MzBhMGI5NWY3ZjdhNjNiNzhkZTY3ZGU0NDYwMTNjODA6Cj4gCj4g
ICBkcm0vdnJhbTogcmVtb3ZlIHVudXNlZCBkZWNsYXJhdGlvbiAoMjAxOS0xMS0yNyAwNzo1MTo0
OSArMDEwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAK
PiAgIGdpdEBnaXRodWIuY29tOmFicm9ka2luL2xpbnV4LmdpdCB0YWdzL2FyY3BndS11cGRhdGVz
LTIwMTkuMTEuMjcKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYjJjNjhmYjE1
YTRjMmUyN2Y4MDM1M2QzMDY3ZGNlMzA4ODJhMDk3MjoKPiAKPiAgIERSTTogQVJDOiBQR1U6IGFk
ZCBBUkdCODg4OCBmb3JtYXQgdG8gc3VwcG9ydGVkIGZvcm1hdCBsaXN0ICgyMDE5LTExLTI3IDEw
OjM4OjI0ICswMzAwKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBDbGVhbi11cCBhbmQgZml4ZXMgZm9yIEZvdXJD
QyBoYW5kbGluZyBpbiBBUkMgUEdVLgo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBFdWdlbml5IFBhbHRzZXYgKDQp
Ogo+ICAgICAgIERSTTogQVJDOiBQR1U6IGZpeCBmcmFtZWJ1ZmZlciBmb3JtYXQgc3dpdGNoaW5n
Cj4gICAgICAgRFJNOiBBUkM6IFBHVTogY2xlYW51cCBzdXBwb3J0ZWQgZm9ybWF0IGxpc3QgY29k
ZQo+ICAgICAgIERSTTogQVJDOiBQR1U6IHJlcGxhY2UgdW5zdXBwb3J0ZWQgYnkgSFcgUkdCODg4
IGZvcm1hdCBieSBYUkdCODg4Cj4gICAgICAgRFJNOiBBUkM6IFBHVTogYWRkIEFSR0I4ODg4IGZv
cm1hdCB0byBzdXBwb3J0ZWQgZm9ybWF0IGxpc3QKClVoLCB0aGlzIHNlZW1zIHRvIGJlIGJhc2Vk
IG9uIHNvbWUgcmFuZG9tIHNuYXBzaG90IG9mIGRybS1taXNjLW5leHQsIHNvCmNvbnRhaW5zIGEg
X2xvdF8gbW9yZSB0aGFuIGp1c3QgdGhlc2UgNCBwYXRjaGVzIChjb21wYXJlZCB0byBkcm0tbmV4
dCkuCgpJZiB5b3Ugd2FudCB0byBtb3ZlIGFyY3BndSB0byBkcm0tbWlzYyAod2hpY2ggd291bGQg
bWFrZSB0b25zIG9mIHNlbnNlCmltbykgdGhlbjoKLSBjcmVhdGUgYSBNQUlOVEFJTkVSIHBhdGNo
IHRvIGFkZCBkcm0tbWlzYyBhcyB0aGUgZ2l0IHJlcG8gZm9yIGl0Ci0gcmVxdWVzdCB5b3VyIGFj
Y291bnQgZm9yIGRybS1taXNjLCBzZWUgaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kv
QWNjb3VudFJlcXVlc3RzLwotIGFuZCBzZXQgdXAgdGhlIHNjcmlwdHMgaHR0cHM6Ly9kcm0ucGFn
ZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvZ2V0dGluZy1zdGFydGVkLmh0bWwK
Ck9yIHJlc3BpbiB0aGlzIG9uZSwgYnV0IHRoZXNlIHNtYWxsIHB1bGxzIGhhdmUgYSBoYWJpdCBv
ZiBvY2Nhc2lvbmFsbHkKZ2V0dGluZyBsb3N0IDotLwoKQ2hlZXJzLCBEYW5pZWwKCj4gCj4gIGRy
aXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYyB8IDM2ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJjL2FyY3BndV9yZWdzLmggfCAg
MiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQo+IAo+IFRoYW5rcywKPiBBbGV4ZXkKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
