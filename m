Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2717D3D08
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 12:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1684C6E072;
	Fri, 11 Oct 2019 10:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7BA6E072;
 Fri, 11 Oct 2019 10:12:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 03:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="188273034"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 11 Oct 2019 03:12:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Oct 2019 13:12:43 +0300
Date: Fri, 11 Oct 2019 13:12:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: John Maguire <jmaguire2013@gmail.com>
Subject: Re: Kernel crash on 4.19.77-1-lts (Arch Linux / ThinkPad T470p)
Message-ID: <20191011101243.GI1208@intel.com>
References: <CAEk+mvvz1SJQD0Yo8s0oB8=jN4yh2ZbURmZ8Ln1VKxcfBE96DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEk+mvvz1SJQD0Yo8s0oB8=jN4yh2ZbURmZ8Ln1VKxcfBE96DQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDE6MTU6MDlQTSAtMDQwMCwgSm9obiBNYWd1aXJlIHdy
b3RlOgo+IEhpIHRoZXJlLAo+IAo+IEkgd2Fzbid0IHN1cmUgd2hpY2ggbWFpbGluZyBsaXN0IHRv
IHVzZSBzbyBJIEJDQydkCj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyBhbmQgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwoKSnVzdCB1c2UgQ2MuIFdlIHdhbnQgYWxsIHJl
cGxpZXMgdG8gZ28gdG8gdGhlIGxpc3QocykgYXMgd2VsbC4KCj4gCj4gSSdtIHVzaW5nIGEgTGVu
b3ZvIFRoaW5rcGFkIFQ0NzBwIGFuZCBydW5uaW5nIHRoZSA0LjE5Ljc3LTEtbHRzIGtlcm5lbCBv
bgo+IEFyY2ggTGludXguIFJlY2VudGx5LCBJJ3ZlIHN0YXJ0ZWQgZ2V0dGluZyBmcmVlemVzIGVh
Y2ggZGF5LiBBdWRpbyBjYW4KPiBzdGlsbCBiZSBoZWFyZCwgYnV0IHZpZGVvIG91dHB1dCBzdG9w
cy4gSSB3YXMgYWJsZSB0byByZXRyaWV2ZSBhIGNhbGwgdHJhY2UKPiBmcm9tIGpvdXJuYWxkLgo+
IAo+IEkndmUgYXR0YWNoZWQgdGhlIG91dHB1dCBvZiAic3VkbyBsc3BjaSAtdnZ2IiBhcyB3ZWxs
IGFzIHRoZSBtZXNzYWdlIGZyb20KPiBqb3VybmFsZCAobnVsbCBwb2ludGVyIGRlcmVmZXJlbmNl
KS4KCk9jdCAxMCAxMjo1MzozMCBzY29ycGlvbiBrZXJuZWw6IFJJUDogMDAxMDpkbWFfZmVuY2Vf
c2lnbmFsX2xvY2tlZCsweDMwLzB4ZTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAoKTG9va3MgbGlrZSBpdCBjb3VsZCBiZQpodHRwczovL2J1Z3MuZnJlZWRlc2t0
b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTEzODEKCmluIHdoaWNoIGNhc2UgeW91IGp1c3QgbmVl
ZCB0byB1cGdyYWRlIHRvIDQuMTkuNzggYW5kIGl0IHNob3VsZCBiZQpmaXhlZC4KCi0tIApWaWxs
ZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
