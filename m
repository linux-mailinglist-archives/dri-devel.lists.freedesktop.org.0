Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE84C7F9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADCF6E500;
	Thu, 20 Jun 2019 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AF188A28;
 Wed, 19 Jun 2019 19:16:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d4so807109edr.13;
 Wed, 19 Jun 2019 12:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FBqq0iblXtu1oHyc7tuPgRLTw80COLgao0LSbxaVLpA=;
 b=rh+dXQL9QAPSRR5Q3Sxs7I9BJZiIDO+PpjEmCZ+q4l6dJyBMx5HCfF3WBmo7L/rMTr
 SiKnbSFwv0EwmbjrjjUjZTiYY953fACOls22H23pnOyyocWv/5yK6GNQ1+zS+W6o+nU8
 l3KRjpNqgA6vPWto66EWaAuYSDOHoTzp2FRB+WVIRa+fQ5Po6qVn0XJzXialAubbWT5R
 Snwwl7xYMCYoDxH6dtIOblSGjLp2tH0c28xiEoaPShNGbTqjxKx9QE0RMIZE43/cBd3n
 ga4adebhcoNS7EawR9m6AvNXm5v22EDlEBzZpQxfAvjB7ueeEZBjayRAlMjjpbNM9skT
 bdag==
X-Gm-Message-State: APjAAAWskMufmDc02T8vhggNvTtiJlPPXAMIc8zmfhp8jsfsjccqO8n8
 FsMGxv2ezeLSAdjS1/kyFInL8V7ZqmHtnw==
X-Google-Smtp-Source: APXvYqzq2Z91nxTu4Rtd/k9a3xu4CRqFYUmwH7FiWnAXMDDEFOH2JGLmuMDI9wofLoeawzTHsQ1oIQ==
X-Received: by 2002:a17:906:2191:: with SMTP id
 17mr1396151eju.280.1560971812710; 
 Wed, 19 Jun 2019 12:16:52 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id p3sm6161325eda.43.2019.06.19.12.16.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 12:16:52 -0700 (PDT)
Date: Wed, 19 Jun 2019 12:16:50 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/msm/dsi: Add parentheses to quirks check in
 dsi_phy_hw_v3_0_lane_settings
Message-ID: <20190619191650.GA25726@archlinux-epyc>
References: <20190619161913.102998-1-natechancellor@gmail.com>
 <CAMavQKK-yyrSBR0rD8+aXqNhgojzkSVpe=AE3EvUFxMcfcmE6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMavQKK-yyrSBR0rD8+aXqNhgojzkSVpe=AE3EvUFxMcfcmE6A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FBqq0iblXtu1oHyc7tuPgRLTw80COLgao0LSbxaVLpA=;
 b=s5SZWkMjUVanP6xaEW7UHQB5lIOnZX4QkhRWa6LtBUt8xEHuoU0U9h25jR4DeKZxsA
 Q+Y3QHEqF66L1Tz3pgY6SKJv6fk/3CvY3bQP00KZcspZe4ey6/Q91v25UEw4qeBjTM4D
 mxhiceOyd207OYbMmoI4tcuqdppbs7m+PDdFKlDU4BJFQk7mD/QposPbUzZYSBfMM/ZT
 CSHKhFX7+SBWNrB32ZmLEngTwyH4NOY++OU2SRcPlb3LTDxXehGcMUnyxtZ1RLdMSg3u
 zxf9iWDgXJZfwxhHWqRFevJbC+EWZCulOkl8vgeO2DR4IKusL1nQsejdjw02RGhuCA3H
 PrjQ==
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
Cc: kbuild test robot <lkp@intel.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux@googlegroups.com, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDM6MTM6NDBQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDEyOjE5IFBNIE5hdGhhbiBDaGFuY2VsbG9yCj4g
PG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ2xhbmcgd2FybnM6Cj4g
Pgo+ID4gZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jOjgwOjY6IHdh
cm5pbmc6IGxvZ2ljYWwgbm90IGlzCj4gPiBvbmx5IGFwcGxpZWQgdG8gdGhlIGxlZnQgaGFuZCBz
aWRlIG9mIHRoaXMgYml0d2lzZSBvcGVyYXRvcgo+ID4gWy1XbG9naWNhbC1ub3QtcGFyZW50aGVz
ZXNdCj4gPiAgICAgICAgIGlmICghcGh5LT5jZmctPnF1aXJrcyAmIFYzXzBfMF8xME5NX09MRF9U
SU1JTkdTX1FVSVJLKSB7Cj4gPiAgICAgICAgICAgICBeICAgICAgICAgICAgICAgICB+Cj4gPiBk
cml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmM6ODA6Njogbm90ZTogYWRk
IHBhcmVudGhlc2VzCj4gPiBhZnRlciB0aGUgJyEnIHRvIGV2YWx1YXRlIHRoZSBiaXR3aXNlIG9w
ZXJhdG9yIGZpcnN0Cj4gPiAgICAgICAgIGlmICghcGh5LT5jZmctPnF1aXJrcyAmIFYzXzBfMF8x
ME5NX09MRF9USU1JTkdTX1FVSVJLKSB7Cj4gPiAgICAgICAgICAgICBeCj4gPiAgICAgICAgICAg
ICAgKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKQo+ID4g
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jOjgwOjY6IG5vdGU6IGFk
ZCBwYXJlbnRoZXNlcwo+ID4gYXJvdW5kIGxlZnQgaGFuZCBzaWRlIGV4cHJlc3Npb24gdG8gc2ls
ZW5jZSB0aGlzIHdhcm5pbmcKPiA+ICAgICAgICAgaWYgKCFwaHktPmNmZy0+cXVpcmtzICYgVjNf
MF8wXzEwTk1fT0xEX1RJTUlOR1NfUVVJUkspIHsKPiA+ICAgICAgICAgICAgIF4KPiA+ICAgICAg
ICAgICAgICggICAgICAgICAgICAgICAgKQo+ID4gMSB3YXJuaW5nIGdlbmVyYXRlZC4KPiA+Cj4g
PiBBZGQgcGFyZW50aGVzZXMgYXJvdW5kIHRoZSBiaXR3aXNlIEFORCBzbyBpdCBpcyBldmFsdWF0
ZWQgZmlyc3QgdGhlbgo+ID4gbmVnYXRlZC4KPiA+Cj4gPiBGaXhlczogM2RiYmY4ZjA5ZTgzICgi
ZHJtL21zbS9kc2k6IEFkZCBvbGQgdGltaW5ncyBxdWlyayBmb3IgMTBubSBwaHkiKQo+ID4gTGlu
azogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC81NDcKPiAKPiBUaGlz
IGxpbmsgaXMgYnJva2VuLCBjb3VsZCB5b3UgcGxlYXNlIGZpeCBpdCB1cD8KClRoYW5rcyBmb3Ig
Y2F0Y2hpbmcgdGhpcywgdjIgb24gdGhlIHdheS4KCkNoZWVycywKTmF0aGFuCgo+IAo+IFRoZSBy
ZXN0IGlzOgo+IFJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiAKPiAK
PiAKPiA+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+
IFJldmlld2VkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5t
LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lf
cGh5XzEwbm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwo+
ID4gaW5kZXggZWIyODkzN2Y0YjM0Li40NzQwM2Q0ZjJkMjggMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwo+ID4gQEAgLTc3LDcgKzc3LDcgQEAg
c3RhdGljIHZvaWQgZHNpX3BoeV9od192M18wX2xhbmVfc2V0dGluZ3Moc3RydWN0IG1zbV9kc2lf
cGh5ICpwaHkpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0eF9kY3RybFtpXSk7
Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIGlmICghcGh5LT5jZmctPnF1aXJrcyAmIFYz
XzBfMF8xME5NX09MRF9USU1JTkdTX1FVSVJLKSB7Cj4gPiArICAgICAgIGlmICghKHBoeS0+Y2Zn
LT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykpIHsKPiA+ICAgICAgICAg
ICAgICAgICAvKiBUb2dnbGUgQklUIDAgdG8gcmVsZWFzZSBmcmVlemUgSS8wICovCj4gPiAgICAg
ICAgICAgICAgICAgZHNpX3BoeV93cml0ZShsYW5lX2Jhc2UgKyBSRUdfRFNJXzEwbm1fUEhZX0xO
X1RYX0RDVFJMKDMpLCAweDA1KTsKPiA+ICAgICAgICAgICAgICAgICBkc2lfcGh5X3dyaXRlKGxh
bmVfYmFzZSArIFJFR19EU0lfMTBubV9QSFlfTE5fVFhfRENUUkwoMyksIDB4MDQpOwo+ID4gLS0K
PiA+IDIuMjIuMAo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
