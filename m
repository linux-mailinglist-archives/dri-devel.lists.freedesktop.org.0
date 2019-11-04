Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A23EE545
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1079D6E60C;
	Mon,  4 Nov 2019 16:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7CD6E60C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:55:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id c17so10115259wmk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 08:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=qbydSBqseaw/lQj0nQ/gQN6CVr9wzBelvAaWVLCPwUc=;
 b=fYB96GVmA+wUH3S9k86QATJdpDd27i/YJMF+ZQCBuipisMwL2D9wJBgclzwx7oGB/a
 4LfWtgtq0urmzHUMxxL0nZ5gRicsY6ChSwdYpHc7M9MTO4SH5Gfnly1Os7RXBGv9EHNf
 haNoGufcri9+SOjR7gMftR2NT5VyA6B61Aqh1BQebwivNZzlTmIlPoc69rB6z+u6nc1i
 7HotmDbU9qonRaIzU2WUczNq0eHbLa0n50uaMoi7Zz83mxCzzzWwJaksHCiL69xr1/o8
 pFKrYYxgsHeDVVDMjXTfWrCv8TeeZT/Nza5ngceewiTccpvIr7GeyoJt4C5/Mb1nEJdT
 TfMA==
X-Gm-Message-State: APjAAAWwxDqJh8mEHbhkOAuQFzTIMrouOBvTQtf5ryrxtg0jTgXSJ+Q7
 N6FZUCJO/+if4VKnU/TGi3ZBrw==
X-Google-Smtp-Source: APXvYqz94I0pfBllsuYuxRIRg5mazNojaJ6pU1GUBJRxZPr5hP+NbTslnm9nyaVAmkAjo/sjHk6k8A==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr86381wmb.18.1572886500036;
 Mon, 04 Nov 2019 08:55:00 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r19sm20025253wrr.47.2019.11.04.08.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 08:54:59 -0800 (PST)
Date: Mon, 4 Nov 2019 17:54:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Message-ID: <20191104165457.GH10326@phenom.ffwll.local>
Mail-Followup-To: Harry Wentland <hwentlan@amd.com>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
 <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
 <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
 <CAKMK7uH6EoY9MkzjSjU+Fe=E-XB4Tf9d2VsW=Tr=tFy1J-dJgg@mail.gmail.com>
 <53bf910b-5f9c-946b-17ee-602c24c0fa96@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53bf910b-5f9c-946b-17ee-602c24c0fa96@amd.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qbydSBqseaw/lQj0nQ/gQN6CVr9wzBelvAaWVLCPwUc=;
 b=aXylMG+y/bVQLTKpkPecMubi5xk8neo1TPugA58jbdUqDzUO5t+mCleDMf6m0aiXcc
 bd1rkbzogwK7Ja/TtVsHcU1F9zp1DzrDSw3c7t4IWSNcfO5XJJH8higwdCL15KW8ubpZ
 iDdcFEO7G4ECVLB2pdN8FjG2wQwn/hv1P+0Eg=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDM6MjM6MDlQTSArMDAwMCwgSGFycnkgV2VudGxhbmQg
d3JvdGU6Cj4gT24gMjAxOS0xMS0wNCA1OjUzIGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4g
PiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDEwOjU4IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4gd3JvdGU6Cj4gPj4gT24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDo0NiBQTSBMYWto
YSwgQmhhd2FucHJlZXQKPiA+PiA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6Cj4g
Pj4+Cj4gPj4+IEkgbWlzdW5kZXJzdG9vZCBhbmQgd2FzIHRhbGtpbmcgYWJvdXQgdGhlIGtzdiB2
YWxpZGF0aW9uIHNwZWNpZmljYWxseQo+ID4+PiAodXNhZ2Ugb2YgZHJtX2hkY3BfY2hlY2tfa3N2
c19yZXZva2VkKCkpLgo+ID4+Cj4gPj4gSG0gZm9yIHRoYXQgc3BlY2lmaWNhbGx5IEkgdGhpbmsg
eW91IHdhbnQgdG8gZG8gYm90aCwgaS5lLiBib3RoCj4gPj4gY29uc3VsdCB5b3VyIHBzcCwgYnV0
IGFsc28gY2hlY2sgZm9yIHJldm9rZWQga3N2cyB3aXRoIHRoZSBjb3JlCj4gPj4gaGVscGVyLiBB
dCBsZWFzdCBvbiBzb21lIHBsYXRmb3JtcyBvbmx5IHRoZSBjb3JlIGhlbHBlciBtaWdodCBoYXZl
IHRoZQo+ID4+IHVwZGF0ZWQgcmV2b2tlIGxpc3QuCj4gPj4KPiAKPiBJIHRoaW5rIGl0J3MgYW4g
ZWl0aGVyL29yLiBFaXRoZXIgd2UgdXNlIGFuIEhEQ1AgaW1wbGVtZW50YXRpb24gdGhhdCdzCj4g
ZnVsbHkgcnVubmluZyBpbiB4ODYga2VybmVsIHNwYWNlIChzdGlsbCBub3Qgc3VyZSBob3cgdGhh
dCdzIGNvbXBsaWFudCkKPiBvciB3ZSBmdWxseSByZWx5IG9uIG91ciBQU1AgRlcgdG8gZG8gd2hh
dCBpdCdzIGRlc2lnbmVkIHRvIGRvLiBJIGRvbid0Cj4gdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8g
bWl4IGFuZCBtYXRjaCBoZXJlLgoKVGhlbiB5b3UgbmVlZCB0byBzb21laG93IHRpZSB0aGUgcmV2
b2tlIGxpc3QgdGhhdCdzIGluIHRoZSBwc3AgdG8gdGhlCnJldm9rZSBsaXN0IHVwZGF0ZSBsb2dp
YyB3ZSBoYXZlLiBUaGF0J3Mgd2hhdCB3ZSd2ZSBkb25lIGZvciBoZGNwMiAod2hpY2gKaXMgc2lt
aWxhcmx5IHRvIHlvdXJzIGltcGxlbWVudGVkIGluIGh3KS4gVGhlIHBvaW50IGlzIHRoYXQgb24g
bGludXggd2UKbm93IGhhdmUgYSBzdGFuZGFyZCB3YXkgdG8gZ2V0IHRoZXNlIHJldm9rZSBsaXN0
cyB1cGRhdGVkL2hhbmRsZWQuCgpJIGd1ZXNzIGl0IHdhc24ndCBjbGVhciBob3cgZXhhY3RseSBJ
IHRoaW5rIHlvdSdyZSBzdXBwb3NlZCB0byBjb21iaW5lCnRoZW0/Ci1EYW5pZWwKCgo+IAo+ID4+
PiBGb3IgdGhlIGRlZmluZXMgSSB3aWxsIGNyZWF0ZSBwYXRjaGVzIHRvIHVzZSBkcm1faGRjcCB3
aGVyZSBpdCBpcyB1c2FibGUuCj4gPj4KPiA+PiBUaGFua3MgYSBsb3QuIEltZSBvbmNlIHdlIGhh
dmUgc2hhcmVkIGRlZmluaXRpb25zIGl0J3MgbXVjaCBlYXNpZXIgdG8KPiA+PiBhbHNvIHNoYXJl
IHNvbWUgaGVscGVycywgd2hlcmUgaXQgbWFrZXMgc2Vuc2UuCj4gPj4KPiA+PiBBc2lkZSBJIHRo
aW5rIHRoZSBoZGNwIGNvZGUgY291bGQgYWxzbyB1c2UgYSBiaXQgb2YgZGVtaWRsYXllcmluZy4g
QXQKPiA+PiBsZWFzdCBJJ20gbm90IHVuZGVyc3RhbmRpbmcgd2h5IHlvdSBhZGQgYSAybmQgYWJz
dHJhY3Rpb24gbGF5ZXIgZm9yCj4gPj4gaTJjL2RwY2QsIGRtX2hlbHBlciBhbHJlYWR5IGhhcyB0
aGF0LiBUaGF0IHNlZW1zIGxpa2Ugb25lIGFic3RyYWN0aW9uCj4gPj4gbGF5ZXIgdG9vIG11Y2gu
Cj4gPiAKPiA+IEkgaGF2ZW4ndCBzZWVuIGFueXRoaW5nIGZseSBieSBvciBpbiB0aGUgbGF0ZXN0
IHB1bGwgcmVxdWVzdCAuLi4geW91Cj4gPiBmb2xrcyBzdGlsbCB3b3JraW5nIG9uIHRoaXMgb3Ig
bW9yZSBwdXQgb24gdGhlICJtYXliZSwgcHJvYmFibHkgbmV2ZXIiCj4gPiBwaWxlPwo+ID4gCj4g
Cj4gRm9sbG93aW5nIHVwIHdpdGggQmhhd2FuLgo+IAo+IEhhcnJ5Cj4gCj4gPiAtRGFuaWVsCj4g
PiAKPiA+IAo+ID4+IC1EYW5pZWwKPiA+Pgo+ID4+Pgo+ID4+Pgo+ID4+PiBCaGF3YW4KPiA+Pj4K
PiA+Pj4gT24gMjAxOS0xMC0wOSAyOjQzIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPj4+
PiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDg6MjMgUE0gTGFraGEsIEJoYXdhbnByZWV0Cj4gPj4+
PiA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6Cj4gPj4+Pj4gSGksCj4gPj4+Pj4K
PiA+Pj4+PiBUaGUgcmVhc29uIHdlIGRvbid0IHVzZSBkcm1faGRjcCBpcyBiZWNhdXNlIG91ciBw
b2xpY3kgaXMgdG8gZG8gaGRjcAo+ID4+Pj4+IHZlcmlmaWNhdGlvbiB1c2luZyBQU1AvSFcgKG9u
Ym9hcmQgc2VjdXJlIHByb2Nlc3NvcikuCj4gPj4+PiBpOTE1IGFsc28gdXNlcyBodyB0byBhdXRo
LCB3ZSBzdGlsbCB1c2UgdGhlIHBhcnRzIGZyb20gZHJtX2hkY3AgLi4uCj4gPj4+PiBEaWQgeW91
IGFjdHVhbGx5IGxvb2sgYXQgd2hhdCdzIGluIHRoZXJlPyBJdCdzIGVzc2VudGlhbGx5IGp1c3Qg
c2hhcmVkCj4gPj4+PiBkZWZpbmVzIGFuZCBkYXRhIHN0cnVjdHVyZXMgZnJvbSB0aGUgc3RhbmRh
cmQsIHBsdXMgYSBmZXcgbWluaW1hbAo+ID4+Pj4gaGVscGVycyB0byBlbi9kZWNvZGUgc29tZSBi
aXRzLiBKdXN0IGZyb20gYSBxdWljayByZWFkIHRoZSBlbnRpcmUKPiA+Pj4+IHBhdGNoIHZlcnkg
bXVjaCBsb29rcyBsaWtlIG1pZGxheWVyIGV2ZXJ5d2hlcmUgZGVzaWduIHRoYXQgd2UKPiA+Pj4+
IGRpc2N1c3NlZCBiYWNrIHdoZW4gREMgbGFuZGVkIC4uLgo+ID4+Pj4gLURhbmllbAo+ID4+Pj4K
PiA+Pj4+PiBCaGF3YW4KPiA+Pj4+Pgo+ID4+Pj4+IE9uIDIwMTktMTAtMDkgMTI6MzIgcC5tLiwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+Pj4+Pj4gT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTE6
MDg6MDNQTSArMDEwMCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6Cj4gPj4+Pj4+PiBIaSwKPiA+Pj4+
Pj4+Cj4gPj4+Pj4+PiBTdGF0aWMgYW5hbHlzaXMgd2l0aCBDb3Zlcml0eSBoYXMgZGV0ZWN0ZWQg
YSBwb3RlbnRpYWwgaXNzdWUgd2l0aAo+ID4+Pj4+Pj4gZnVuY3Rpb24gdmFsaWRhdGVfYmtzdiBp
bgo+ID4+Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNw
MV9leGVjdXRpb24uYyB3aXRoIHJlY2VudAo+ID4+Pj4+Pj4gY29tbWl0Ogo+ID4+Pj4+Pj4KPiA+
Pj4+Pj4+IGNvbW1pdCBlZDlkOGUyYmNiMDAzZWM5NDY1OGNhZmU5YjFiYjM5NjBlMjEzOWVjCj4g
Pj4+Pj4+PiBBdXRob3I6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQu
Y29tPgo+ID4+Pj4+Pj4gRGF0ZTogICBUdWUgQXVnIDYgMTc6NTI6MDEgMjAxOSAtMDQwMAo+ID4+
Pj4+Pj4KPiA+Pj4+Pj4+ICAgICAgIGRybS9hbWQvZGlzcGxheTogQWRkIEhEQ1AgbW9kdWxlCj4g
Pj4+Pj4+IEkgdGhpbmsgdGhlIHJlYWwgcXVlc3Rpb24gaGVyZSBpcyAuLi4gd2h5IGlzIHRoaXMg
bm90IHVzaW5nIGRybV9oZGNwPwo+ID4+Pj4+PiAtRGFuaWVsCj4gPj4+Pj4+Cj4gPj4+Pj4+PiBU
aGUgYW5hbHlzaXMgaXMgYXMgZm9sbG93czoKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiAgICAyOCBzdGF0
aWMgaW5saW5lIGVudW0gbW9kX2hkY3Bfc3RhdHVzIHZhbGlkYXRlX2Jrc3Yoc3RydWN0IG1vZF9o
ZGNwICpoZGNwKQo+ID4+Pj4+Pj4gICAgMjkgewo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IENJRCA4OTg1
MiAoIzEgb2YgMSk6IE91dC1vZi1ib3VuZHMgcmVhZCAoT1ZFUlJVTikKPiA+Pj4+Pj4+Cj4gPj4+
Pj4+PiAxLiBvdmVycnVuLWxvY2FsOgo+ID4+Pj4+Pj4gT3ZlcnJ1bm5pbmcgYXJyYXkgb2YgNSBi
eXRlcyBhdCBieXRlIG9mZnNldCA3IGJ5IGRlcmVmZXJlbmNpbmcgcG9pbnRlcgo+ID4+Pj4+Pj4g
KHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdi4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+
PiAgICAzMCAgICAgICAgdWludDY0X3QgbiA9ICoodWludDY0X3QgKiloZGNwLT5hdXRoLm1zZy5o
ZGNwMS5ia3N2Owo+ID4+Pj4+Pj4gICAgMzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOwo+ID4+
Pj4+Pj4gICAgMzIKPiA+Pj4+Pj4+ICAgIDMzICAgICAgICB3aGlsZSAobikgewo+ID4+Pj4+Pj4g
ICAgMzQgICAgICAgICAgICAgICAgY291bnQrKzsKPiA+Pj4+Pj4+ICAgIDM1ICAgICAgICAgICAg
ICAgIG4gJj0gKG4gLSAxKTsKPiA+Pj4+Pj4+ICAgIDM2ICAgICAgICB9Cj4gPj4+Pj4+Pgo+ID4+
Pj4+Pj4gaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdiBpcyBhbiBhcnJheSBvZiA1IHVpbnQ4X3Qg
YXMgZGVmaW5lZCBpbgo+ID4+Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVs
ZXMvaGRjcC9oZGNwLmggYXMgZm9sbG93czoKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBzdHJ1Y3QgbW9k
X2hkY3BfbWVzc2FnZV9oZGNwMSB7Cj4gPj4+Pj4+PiAgICAgICAgICAgdWludDhfdCAgICAgICAg
IGFuWzhdOwo+ID4+Pj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBha3N2WzVdOwo+ID4+
Pj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBhaW5mbzsKPiA+Pj4+Pj4+ICAgICAgICAg
ICB1aW50OF90ICAgICAgICAgYmtzdls1XTsKPiA+Pj4+Pj4+ICAgICAgICAgICB1aW50MTZfdCAg
ICAgICAgcjBwOwo+ID4+Pj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBiY2FwczsKPiA+
Pj4+Pj4+ICAgICAgICAgICB1aW50MTZfdCAgICAgICAgYnN0YXR1czsKPiA+Pj4+Pj4+ICAgICAg
ICAgICB1aW50OF90ICAgICAgICAga3N2bGlzdFs2MzVdOwo+ID4+Pj4+Pj4gICAgICAgICAgIHVp
bnQxNl90ICAgICAgICBrc3ZsaXN0X3NpemU7Cj4gPj4+Pj4+PiAgICAgICAgICAgdWludDhfdCAg
ICAgICAgIHZwWzIwXTsKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiAgICAgICAgICAgdWludDE2X3QgICAg
ICAgIGJpbmZvX2RwOwo+ID4+Pj4+Pj4gfTsKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiB2YXJpYWJsZSBu
IGlzIGdvaW5nIHRvIGNvbnRhaW4gdGhlIGNvbnRhaW5zIG9mIHIwcCBhbmQgYmNhcHMuIEknbSBu
b3QKPiA+Pj4+Pj4+IHN1cmUgaWYgdGhhdCBpcyBpbnRlbnRpb25hbC4gSWYgbm90LCB0aGVuIHRo
ZSBjb3VudCBpcyBnb2luZyB0byBiZQo+ID4+Pj4+Pj4gaW5jb3JyZWN0IGlmIHRoZXNlIGFyZSBu
b24temVyby4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBDb2xpbgo+ID4+Pj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4+Pj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+ID4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4+PiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+
ID4+Pj4KPiA+Pj4+Cj4gPj4KPiA+Pgo+ID4+Cj4gPj4gLS0KPiA+PiBEYW5pZWwgVmV0dGVyCj4g
Pj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPj4gKzQxICgwKSA3OSAz
NjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAo+ID4gCj4gPiAKPiA+IAo+ID4gLS0KPiA+
IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+
ID4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaAo+ID4gCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
