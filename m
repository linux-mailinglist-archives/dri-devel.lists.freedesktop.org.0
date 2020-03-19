Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25DF18C88E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492D16EAEB;
	Fri, 20 Mar 2020 08:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BBE6E081
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 19:35:53 +0000 (UTC)
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Mar 2020 12:35:52 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 19 Mar 2020 12:35:52 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id 267874BBA; Thu, 19 Mar 2020 12:35:52 -0700 (PDT)
Date: Thu, 19 Mar 2020 12:35:52 -0700
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v9 01/11] drm/i915: Use 64-bit division macro
Message-ID: <20200319193551.GA23396@codeaurora.org>
References: <cover.1584473399.git.gurus@codeaurora.org>
 <19661821c8eb32291e72ec091c267f915c365c52.1584473399.git.gurus@codeaurora.org>
 <87h7yleb0i.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7yleb0i.fsf@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:24 +0000
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
Cc: linux-pwm@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTgsIDIwMjAgYXQgMDk6MDg6NDVQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVHVlLCAxNyBNYXIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIDxndXJ1c0Bjb2Rl
YXVyb3JhLm9yZz4gd3JvdGU6Cj4gPiBTaW5jZSB0aGUgUFdNIGZyYW1ld29yayBpcyBzd2l0Y2hp
bmcgc3RydWN0IHB3bV9zdGF0ZS5kdXR5X2N5Y2xlJ3MKPiA+IGRhdGF0eXBlIHRvIHU2NCwgcHJl
cGFyZSBmb3IgdGhpcyB0cmFuc2l0aW9uIGJ5IHVzaW5nIERJVl9ST1VORF9VUF9VTEwKPiA+IHRv
IGhhbmRsZSBhIDY0LWJpdCBkaXZpZGVuZC4KPiA+Cj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5s
YWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IENjOiAiVmlsbGUgU3ly
asOkbMOkIiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogaW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4gPiBD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdXJ1IERhcyBTcmluYWdlc2ggPGd1cnVzQGNvZGVhdXJv
cmEub3JnPgo+IAo+IFJldmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwu
Y29tPgoKVGhhbmtzIQoKPiBBbHNvIGFjayBmb3IgbWVyZ2luZyB0aGlzIHZpYSB3aGljaGV2ZXIg
dHJlZSB5b3UgcHJlZmVyOyBwbGVhc2UgbGV0IG1lCj4ga25vdyBpZiB5b3Ugd2FudCBtZSB0byB0
YWtlIHRoaXMgdmlhIGRybS1pbnRlbC4KCkknbSBub3Qgc3VyZSBpZiB0aGlzIHBhdGNoIGNhbiBi
ZSB0YWtlbiB2aWEgZHJtLWludGVsIGluIGlzb2xhdGlvbiBhcyBpdAppcyBwYXJ0IG9mIGEgc2Vy
aWVzLi4uIFdpbGwgbGV0IHlvdSBrbm93IGlmIEkgbmVlZCB0byBtYWtlIHN1Y2ggYQpyZXF1ZXN0
LgoKVGhhbmsgeW91LgoKR3VydSBEYXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
