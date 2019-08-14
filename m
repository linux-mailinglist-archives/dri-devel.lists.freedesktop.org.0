Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17928CD09
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 09:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C589689823;
	Wed, 14 Aug 2019 07:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8DD89823
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:38:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 00:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,384,1559545200"; d="scan'208";a="194442150"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2019 00:38:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Best practice for embedded code samles? [Was: drm/drv: Use // for
 comments in example code]
In-Reply-To: <20190813160726.3f9eb8c8@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190808163629.14280-1-j.neuschaefer@gmx.net>
 <20190811213215.GA26468@ravnborg.org> <20190813160726.3f9eb8c8@lwn.net>
Date: Wed, 14 Aug 2019 10:37:59 +0300
Message-ID: <8736i4gpt4.fsf@intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Jonathan =?utf-8?Q?Neusch?= =?utf-8?Q?=C3=A4fer?= <j.neuschaefer@gmx.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4gd3Jv
dGU6Cj4gT24gU3VuLCAxMSBBdWcgMjAxOSAyMzozMjoxNSArMDIwMAo+IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4KPj4gSSB3b25kZXIgaWYgdGhlcmUgaXMgYSBiZXR0
ZXIgd2F5IHRvIGVtYmVkIGEgY29kZSBzYW1wbGUKPj4gdGhhbiByZXZlcnRpbmcgdG8gLy8gc3R5
bGUgY29tbWVudHMuCj4+IAo+PiBBcyB0aGUga2VybmVsIGRvIG5vdCBsaWtlIC8vIGNvbW1lbnRz
IHdlIHNob3VsZCB0cnkgdG8gYXZvaWQgdGhlbSBpbgo+PiBleGFtcGxlcy4KPgo+IElmIHlvdSdy
ZSBlbWJlZGRpbmcgYSBjb2RlIHNhbXBsZSAqaW50byBhIGNvZGUgY29tbWVudCogdGhlbiBJIHN1
c3BlY3QKPiB0aGlzIGlzIGFib3V0IGFzIGdvb2QgYXMgaXQgZ2V0cy4gIFRoZSBhbHRlcm5hdGl2
ZSBpcyB0byBwdXQgaXQgaW4gYXMgYQo+IHBsYWluIGxpdGVyYWwgdGV4dCBibG9jay4gIFRoYXQg
d291bGQgbG9zZSB0aGUgc3ludGF4IGhpZ2hsaWdodGluZzsgSQo+IHRoaW5rIHRoYXQncyBhbiBl
bnRpcmVseSBiZWFyYWJsZSBjb3N0LCBidXQgb3RoZXJzIHNlZW0gdG8gZmVlbAo+IGRpZmZlcmVu
dGx5IGFib3V0IGl0LgoKTm90IHJlYWxseSBhIFNwaGlueCBsaW1pdGF0aW9uLCBpcyBpdD8gWW91
IGNhbid0IGVtYmVkIGEgLyogKi8gYmxvY2sKY29tbWVudCB3aXRoaW4gYSAvKiAqLyBibG9jayBj
b21tZW50IGFueXdheSwgU3BoaW54IG9yIG5vdC4KCkJSLApKYW5pLgoKLS0gCkphbmkgTmlrdWxh
LCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
