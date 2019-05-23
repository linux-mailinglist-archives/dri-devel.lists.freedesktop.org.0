Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3B276C3
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 09:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD41489C9A;
	Thu, 23 May 2019 07:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A24789C9A;
 Thu, 23 May 2019 07:17:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 00:17:12 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 23 May 2019 00:17:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v9 0/6] drm/i915/dp: Support for DP YCbCr4:2:0 outputs
In-Reply-To: <20190521121721.32010-1-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190521121721.32010-1-gwan-gyeong.mun@intel.com>
Date: Thu, 23 May 2019 10:20:26 +0300
Message-ID: <87imu17i2t.fsf@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMSBNYXkgMjAxOSwgR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50
ZWwuY29tPiB3cm90ZToKPiBPbiBHZW4gMTEgcGxhdGZvcm0sIHRvIGVuYWJsZSByZXNvbHV0aW9u
cyBsaWtlIDVLQDEyMCAob3IgaGlnaGVyKSB3ZSBuZWVkCj4gdG8gdXNlIERTQyAoRFAgMS40KSBv
ciBZQ2JDcjQ6MjowIChEUCAxLjMgb3IgMS40KSBvbiBEUC4KPiBJbiBvcmRlciB0byBzdXBwb3J0
IFlDYkNyNDoyOjAgb24gRFAgd2UgbmVlZCB0byBwcm9ncmFtIFlDQkNSIDQ6MjowCj4gdG8gTVNB
IGFuZCBWU0MgU0RQLgo+IEFuZCBMaW5rIE0vTiB2YWx1ZXMgYXJlIGNhbGN1bGF0ZWQgYW5kIGFw
cGxpZWQgYmFzZWQgb24gdGhlIEZ1bGwgQ2xvY2sKPiBmb3JZQ2JDcjQyMC4KPiBUaGUgQml0IHBl
ciBQaXhlbCBuZWVkcyB0byBiZSBhZGp1c3RlZCBmb3IgWVVWNDIwIG1vZGUgYXMgaXQgcmVxdWly
ZXMgb25seQo+IGhhbGYgb2YgdGhlIFJHQiBjYXNlLgo+ICAtIExpbmsgTS9OIHZhbHVlcyBhcmUg
Y2FsY3VsYXRlZCBhbmQgYXBwbGllZCBiYXNlZCBvbiB0aGUgRnVsbCBDbG9jawo+ICAtIERhdGEg
TS9OIHZhbHVlcyBuZWVkcyB0byBiZSBjYWxjdWxhdGVkIGNvbnNpZGVyaW5nIHRoZSBkYXRhIGlz
IGhhbGYKPiAgICBkdWUgdG8gc3Vic2FtcGxpbmcKPgo+IFRoZXNlIHBhdGNoZXMgYWRkIGEgVlND
IHN0cnVjdHVyZSBmb3IgaGFuZGxpbmcgUGl4ZWwgRW5jb2RpbmcvQ29sb3JpbWV0cnkKPiBGb3Jt
YXRzIGFuZCBwcm9ncmFtIFlDQkNSIDQ6MjowIHRvIE1TQSBhbmQgVlNDIFNEUC4gQW5kIGl0IGNo
YW5nZXMgYSBsaW5rCj4gYmFuZHdpZHRoIGNvbXB1dGF0aW9uIGZvciBEUC4KClRoYW5rcyBmb3Ig
dGhlIHBhdGNoZXMsIHB1c2hlZCB0byBkaW5xIHdpdGggTGF1cmVudCdzIGFuZCBNYWFydGVuJ3Mg
YWNrcwp0byBxdWV1ZSBwYXRjaCAyIHZpYSBkcm0taW50ZWwuCgpCUiwKSmFuaS4KCgotLSAKSmFu
aSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
