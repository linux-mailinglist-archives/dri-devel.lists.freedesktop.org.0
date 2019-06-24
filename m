Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD350D38
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 16:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1389B3C;
	Mon, 24 Jun 2019 14:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE0289B3C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:03:26 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so21911301edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ITIVfyYdGLQXsQvACad1IFSWadYciq4Nhq18ht4mzp8=;
 b=TTMD4j4RRCC5AZWAw7DP1lagBs6+rQ2wWnBf8yhuTx3RuhpCsHq7r2IhIa22rPbXj2
 1iVQKgoANeG2i4Tgofm3IrNdJzZOWDpbNY5JXi7XvduXrX455AEG/K1iegoAs0RE8VDn
 swqdFJ5srortta7ALJfvQ6yXdv7NVN2x0olXtT4u4WATTjjBDt1IQSXJXW3D+O3H9T4a
 6Iefj/WoxjqLT/JbgargdqJmqKGGAYSLsE7Fo1/zib8Y40qIUMskFp4FzsMe1jexg0PK
 PWbjvxyTz/gj19Tug6Vavs+tU8FF36Fz9bgeP1z3AAs6T4u4SiRG9DtF11PkkUIYq755
 6XLw==
X-Gm-Message-State: APjAAAUfkYeWFIdNtNxrxTQgbBFMmnGmx+fBuEKglqgDPuHLEcx+XQPR
 uaOgjonUu8aAj8fymuvY93C+yQ==
X-Google-Smtp-Source: APXvYqzxnL+Xl5reAeH+rUJdFFyoVEW/siq8vuMybwR21YiIOsAWJv2ACm362HpRylywlELzH96R8A==
X-Received: by 2002:a50:86dc:: with SMTP id 28mr137404229edu.132.1561385005419; 
 Mon, 24 Jun 2019 07:03:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d44sm3824802eda.75.2019.06.24.07.03.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 07:03:24 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:03:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
Message-ID: <20190624140321.GP12905@phenom.ffwll.local>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
 <8cb8c728-3ace-04e0-f6d5-215ffd7879c9@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cb8c728-3ace-04e0-f6d5-215ffd7879c9@linux.intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ITIVfyYdGLQXsQvACad1IFSWadYciq4Nhq18ht4mzp8=;
 b=GVbX59gh6iy7o+C5nPPlIE/LbjCrsbO20/xPgdgUid3EX3iVB1ATYvod6UXq5IdYjl
 xFkozHJPQrl8no4swm5Og7ZhVw+sKYJz76lYX582qJSoLLlxW4pIpSDmAw62XHLUPc/o
 Bt5HsEgErqrC+PJu1Xps6eK4obRHOB3SR8y0k=
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
Cc: Sean Paul <sean@poorly.run>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Yisheng Xie <ysxie@foxmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDM6MDc6MjZQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMjQtMDYtMjAxOSBvbSAxMToyMSBzY2hyZWVmIERhbmllbCBWZXR0ZXI6
Cj4gPiBGaXhlcyBsaW5raW5nIGZhaWwgd2hlbiBmYmNvbi9mYmRldiBpcyBtb2R1bGFyIGFuZCB2
Z2Fzd2l0Y2hlcm9vIGlzCj4gPiBlbmFibGVkOgo+ID4KPiA+IHg4Nl82NC1saW51eC1nbnUtbGQ6
IGRyaXZlcnMvZ3B1L3ZnYS92Z2Ffc3dpdGNoZXJvby5vOiBpbiBmdW5jdGlvbiBgdmdhX3N3aXRj
aHRvX3N0YWdlMic6Cj4gPiB2Z2Ffc3dpdGNoZXJvby5jOigudGV4dCsweDk5Nyk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYGZiY29uX3JlbWFwX2FsbCcKPiA+Cj4gPiB2MjogSSBmaXJzdCB0cmll
ZCB0byBmaXggdGhpcyB3aXRoIGFuIEVYUE9SVF9TWU1CT0wsIGJ1dCB2Z2Ffc3dpdGNoZXJvbyBp
cwo+ID4gbmV2ZXIgYSBtb2R1bGUsIHNvIHRoaXMgZG9lc24ndCB3b3JrLgo+ID4KPiA+IFJlcG9y
dGVkLWJ5OiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KPiA+IFJlcG9y
dGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IEZpeGVzOiAxY2Q1
MWI1ZDIwMGQgKCJ2Z2Fzd2l0Y2hlcm9vOiBjYWxsIGZiY29uX3JlbWFwX2FsbCBkaXJlY3RseSIp
Cj4gPiBDYzogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4gPiBDYzog
THVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+ID4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1z
dW5nLmNvbT4KPiA+IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+ID4g
Q2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4KPiA+IENjOiBsaW51eC1mYmRldkB2
Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBs
aW5hcm8ub3JnPgo+ID4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGxpbnV4LWZiZGV2QHZn
ZXIua2VybmVsLm9yZwo+ID4gLS0KPiA+IHdydCBtZXJnaW5nIHByb2JhYmx5IGJlc3QgaWYgTWFh
cnRlbiBhZGRzIHRoaXMgdG8gdGhlIHRvcGljIGJyYW5jaCB3ZQo+ID4gaGF2ZSBhbHJlYWR5IGFu
ZCBzZW5kcyBvdXQgYW4gdXBkYXRlZCBwdWxsIHJlcXVlc3QuCj4gPgo+ID4gQXBvbG9naWVzIGZv
ciB0aGUgbWVzcy4KPiA+IC1EYW5pZWwKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L3ZnYS9LY29u
ZmlnIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnIGIvZHJpdmVycy9ncHUvdmdhL0tjb25m
aWcKPiA+IGluZGV4IDg0YWI0ODJkMGRiNi4uYzhjNzcwYjA1ZWQ5IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvdmdhL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmln
Cj4gPiBAQCAtMjMsNiArMjMsNyBAQCBjb25maWcgVkdBX1NXSVRDSEVST08KPiA+ICAJZGVwZW5k
cyBvbiBYODYKPiA+ICAJZGVwZW5kcyBvbiBBQ1BJCj4gPiAgCWRlcGVuZHMgb24gUENJCj4gPiAr
CWRlcGVuZHMgb24gKEZSQU1FQlVGRkVSX0NPTlNPTEU9biB8fCBGQj15KQo+ID4gIAlzZWxlY3Qg
VkdBX0FSQgo+ID4gIAloZWxwCj4gPiAgCSAgTWFueSBsYXB0b3BzIHJlbGVhc2VkIGluIDIwMDgv
OS8xMCBoYXZlIHR3byBHUFVzIHdpdGggYSBtdWx0aXBsZXhlcgo+IAo+IEluIGEgZGVmYXVsdCBh
bGxtb2Rjb25maWcgd2UgZGlzYWJsZSB2Z2Fzd2l0Y2hlcm9vIHRoZW4uIE5vdCBzdXJlIGl0J3Mg
YW4gaXNzdWUuIEp1c3Qgd29ydGggbm90aW5nLiA6KQoKSWYgeW91IGhhdmVuJ3QgYXBwbGllZCB5
ZXQsIG1pZ2h0IGJlIGdvb2QgdG8gYWRkIHRoYXQgbm90ZSB0byB0aGUgY29tbWl0Cm1lc3NhZ2Ug
d2hlbiB5b3UgbWVyZ2UuCgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
