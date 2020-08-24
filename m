Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 791FA250169
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 17:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8343D6E2CF;
	Mon, 24 Aug 2020 15:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2776E287;
 Mon, 24 Aug 2020 15:46:34 +0000 (UTC)
IronPort-SDR: JyJSKlUtTNAAMYIyyeCh1XBTFguWTbb++q7kq9yOqgM1yzOOOSR7AEtLibKjKdXa0cpu7U1Vrw
 SexxyHAIMykA==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="153337271"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="153337271"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 08:46:33 -0700
IronPort-SDR: i7xHs3m94j+1i3c9HXOILdk4W9Z9gJTr27gBBejZQ8KOIcu6cMQhKqui/tQzcYc+PagzTKe9ht
 Q57pUhHYNWEw==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="443257291"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 08:46:29 -0700
Date: Mon, 24 Aug 2020 18:46:26 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC 13/20] drm/i915/dp: Extract drm_dp_downstream_read_info()
Message-ID: <20200824154626.GA19658@ideak-desk.fi.intel.com>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-14-lyude@redhat.com>
 <20200819151547.GB46474@art_vandelay>
 <4d74a74aefcd8d0ea048b70252efda18820bc911.camel@redhat.com>
 <20200820223754.GA17451@ideak-desk.fi.intel.com>
 <597b83ace909f97bfefbe15ffbb0370c2101ff0f.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <597b83ace909f97bfefbe15ffbb0370c2101ff0f.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjEsIDIwMjAgYXQgMDE6NDM6MzlQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBbLi4uXSAKPiA+IFRoZSB3b3JkaW5nIGlzIGEgYml0IHVuY2xlYXIsIGJ1dCBhcyBJIHVu
ZGVyc3RhbmQgdGhlIFN0YW5kYXJkIG9ubHkKPiA+IGNhbGxzIGZvciB0aGUgYWJvdmU6Cj4gPiAK
PiA+ICIiIgo+ID4gQSBEUCB1cHN0cmVhbSBkZXZpY2Ugc2hhbGwgcmVhZCB0aGUgY2FwYWJpbGl0
eSBmcm9tIERQQ0QgQWRkcmVzc2VzIDAwMDgwaAo+ID4gdGhyb3VnaCAwMDA4M2guIEEgRFAgQnJh
bmNoIGRldmljZSB3aXRoIG11bHRpcGxlIERGUHMgc2hhbGwgcmVwb3J0IHRoZQo+ID4gZGV0YWls
ZWQKPiA+IGNhcGFiaWxpdHkgaW5mb3JtYXRpb24gb2YgdGhlIGxvd2VzdCBERlAgbnVtYmVyIHRv
IHdoaWNoIGEgZG93bnN0cmVhbSBkZXZpY2UKPiA+IGlzIGNvbm5lY3RlZCwgY29uc2lzdGVudCB3
aXRoIHRoZSBEaXNwbGF5SUQgb3IgbGVnYWN5IEVESUQgYWNjZXNzIHJvdXRpbmcKPiA+IHBvbGlj
eQo+ID4gb2YgYW4gU1NULW9ubHkgRFAgQnJhbmNoIGRldmljZSBhcyBkZXNjcmliZWQgaW4gU2Vj
dGlvbiAyLjEuNC4xLgo+ID4gIiIiCj4gCj4gU28tSSBzYXcgdGhpcyB0b28sIGJ1dCBub3RpY2Ug
dGhlIHVzZSBvZiB0aGUgbGFuZ3VhZ2UgIkEgL0RQIEJyYW5jaC8gZGV2aWNlIHdpdGgKPiBtdWx0
aXBsZSBERlBzIHNoYWxsIHJlcG9ydCB0aGUgZGV0YWlsZWTigKYiLiBUaGlzIG1ha2VzIG1lIHRo
aW5rIGl0J3MgaW1wbHlpbmcKPiB0aGF0IHRoaXMgaXMgYSByZXF1aXJlbWVudCBmb3IgTVNUQnMg
YW5kIG5vdCBTU1Qgc2lua3MsIGp1c3QgYSBndWVzcy4KCk5vdCBzdXJlIGVpdGhlci4gVGhlIGFi
b3ZlIGNvdWxkIGFsc28gcmVmZXIgdG8gYW4gU1NUIGJyYW5jaCBkZXZpY2Ugd2l0aAptdWx0aXBs
ZSBERlBzIChmb3IgaW5zdGFuY2UgYSBEUCBSZXBsaWNhdG9yIGJyYW5jaCBkZXZpY2UpLgoKLS1J
bXJlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
