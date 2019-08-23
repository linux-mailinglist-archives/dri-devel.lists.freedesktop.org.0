Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19D9A423
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 02:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29A76EB8B;
	Fri, 23 Aug 2019 00:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11C6EB8B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 00:03:45 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 870272A09AE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 00:03:45 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id p56so8271312qtb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 17:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=OLkuF9xJpH0PBSiwps7iuRIvm5TkojFLpeg+0nBpFN4=;
 b=hGerdc3On1Ol3L/KLTKz5LSpAKkTdE59WkAX2GvfTYy75TSEJlfWP1YlO5+AJZFCF1
 Wd0fZQQGh9F3JpgVAKNT/22L71QOQnLx3cHg6LxWtY2W/1bUi7ReQuFLind4iR+OoCjc
 QbdnbK0McH+rSUTrgSlsC8pYRma4d/JbSWSm1MBeOjb+cCby5n2XYiZdd+Noqi8S6wNk
 gr5wECGRcNaKbQ1JInybFFeBhmWxgH3nrZgztV1mnh5xVTRNOEnYblL9EHbHSGoforQ+
 MBq2Ko0WD5DQNvSAN05GorbkhyfUgabHKRQzcvxMov2BESKsMH0RPxdPBCayYiZTgPrW
 X83A==
X-Gm-Message-State: APjAAAXU1sz1w03ibvLG3EG7Jo6BYpdWLnBdPCfD8JJ2Ngd3MjnMJcSL
 le9Z18Ptzm30cuNoKy2AFXCd2janfC6bRiCZu62GnUtbzcxMtXWYbnNspR+b0SNZnsWMylbxk5O
 CN9UvNfLpmEF8R8JO9Mz4IZC9oAF6
X-Received: by 2002:a37:c49:: with SMTP id 70mr1672600qkm.429.1566518624697;
 Thu, 22 Aug 2019 17:03:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0I7zfYTwisiZleTljF9gexQu8kC9KmKD49exHzGl71T39Ok4Dyfwx2mVDtpb8rwVl5N7PUg==
X-Received: by 2002:a37:c49:: with SMTP id 70mr1672587qkm.429.1566518624515;
 Thu, 22 Aug 2019 17:03:44 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id f23sm619736qkk.80.2019.08.22.17.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 17:03:43 -0700 (PDT)
Message-ID: <f9d4069b4ff7818db49177527820ebcb5e8b8dc1.camel@redhat.com>
Subject: Re: [PATCH v4 0/5] MST DSC support in drm-mst
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org, 
 Manasi Navare <manasi.d.navare@intel.com>
Date: Thu, 22 Aug 2019 20:03:42 -0400
In-Reply-To: <20190822135741.12923-1-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T0stZG9uZSByZXZpZXdpbmcsIGJ1dCB0aGVyZSdzIHNvbWUgc3R1ZmYgbWlzc2luZyBoZXJlLiBU
aGUgUEJOIGJhbmR3aWR0aApjaGVja3MgaW4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoLzMyNTYwNC8/c2VyaWVzPTY1NDIzJnJldj0zCm5lZWQgdG8gYmUgbW92ZWQgaW50
byBkcm1fZHBfbXN0X2F0b21pY19jaGVjaygpLCBhbG9uZyB3aXRoIG1vdmluZyBhbWRncHUgb3Zl
ciB0byB1c2luZyBkcm1fZHBfbXN0X2F0b21pY19jaGVjaygpLiBEb2luZyBzbyB3aWxsIGFsc28g
Z2l2ZSB1cyBQQk4gYmFuZHdpZHRoIGNoZWNrcyBpbiBib3RoIGk5MTUgYW5kIG5vdXZlYXUgYXMg
d2VsbCwgYW5kIGtlZXBzIHRoZSBiYW5kd2lkdGggY2FsY3VsYXRpb24gd2hlcmUgaXQgc2hvdWxk
IGJlLgoKQWRkaXRpb25hbGx5LCB5b3Ugc3RpbGwgbmVlZCB0byBtb3ZlIHRoZSBjb2RlIGhlcmUg
aW50byBhbiBNU1QgYXRvbWljIGhlbHBlcgpvciBkcm1fZHBfbXN0X2F0b21pY19jaGVjaygpIGFz
IHdlbGw6CgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzI1NjExLz9z
ZXJpZXM9NjU0MjMmcmV2PTMKClVubGVzcyBJJ20gbWlzdGFrZW4sIGFkZGluZyBlYWNoIENSVEMg
d2hpY2ggaGFzIGEgY29ubmVjdG9yIHdob3NlIFBCTiByZXF1aXJlcwpyZWNhbGN1bGF0aW9uIGlu
dG8gdGhlIGF0b21pYyBzdGF0ZSBpcyBzb21ldGhpbmcgZXZlcnkgRFJNIGRyaXZlciBpcyBnb2lu
ZyB0bwpuZWVkIHRvIGRvLiBBbmQsIHlvdSBjYW4gZG8gdGhpcyBtb3JlIGVhc2lseSBieSBhZGRp
bmcgUEJOIGluZm9ybWF0aW9uIGludG8KZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZS4gWWVzLWl0
J3MgYSBsb3Qgb2YgbG9ja3MsIGJ1dCBzaW5jZSBldmVyeSBjb25uZWN0b3IKaW4gYW4gTVNUIHRv
cG9sb2d5IGlzIHNoYXJpbmcgdGhlIGJhbmR3aWR0aCBvbiB0aGUgc2FtZSBsaW5rIGl0J3Mga2lu
ZCBvZgpleHBlY3RlZC4gSSBhbHJlYWR5IGtub3cgSSdtIGdvaW5nIHRvIGhhdmUgdG8gZG8gYmFz
aWNhbGx5IHRoZSBzYW1lIHRoaW5nIHdpdGgKZXZlcnkgZHJpdmVyIG9uY2UgSSd2ZSBnb3QgdGhl
IHRpbWUgdG8gYWN0dWFsbHkgaW1wbGVtZW50IGZhbGxiYWNrIGxpbmsgcmF0ZQpyZXRyYWluaW5n
IHdpdGggTVNUIHRvcG9sb2dpZXMuCgpJZiB5b3UgbmVlZCBoZWxwIGZpZ3VyaW5nIG91dCBob3cg
dG8gc3RydWN0dXJlIHRoaXMgaW4gYSB3YXkgdGhhdCB3b3JrcyBmb3IKYWxsIGRyaXZlcnMsIEkn
bSB3aWxsaW5nIHRvIGhlbHAgYW5kIEknbSBzdXJlIE1hbmFzaSBpcyBhcyB3ZWxsLgoKT24gVGh1
LCAyMDE5LTA4LTIyIGF0IDA5OjU3IC0wNDAwLCBEYXZpZCBGcmFuY2lzIHdyb3RlOgo+IEFkZCBu
ZWNlc3Nhcnkgc3VwcG9ydCBmb3IgTVNUIERTQy4KPiAoRGlzcGxheSBTdHJlYW0gQ09tcHJlc3Np
b24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQo+IAo+IHY0OiBTcGxpdCBwYXRjaHNldCBh
bmQgcmViYXNlIG9udG8gZHJtLXRpcAo+IAo+IERhdmlkIEZyYW5jaXMgKDUpOgo+ICAgZHJtL2Rw
LW1zdDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1vZGVzCj4gICBkcm0vZHAtbXN0OiBQ
YXJzZSBGRUMgY2FwYWJpbGl0eSBvbiBNU1QgcG9ydHMKPiAgIGRybS9kcC1tc3Q6IEFkZCBNU1Qg
c3VwcG9ydCB0byBEUCBEUENEIFIvVyBmdW5jdGlvbnMKPiAgIGRybS9kcC1tc3Q6IEZpbGwgYnJh
bmNoLT5udW1fcG9ydHMKPiAgIGRybS9kcC1tc3Q6IEFkZCBoZWxwZXJzIGZvciBxdWVyeWluZyBh
bmQgZW5hYmxpbmcgTVNUIERTQwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYu
YyAgICAgIHwgIDEyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAg
fCAgMTAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDI0MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBl
ci5oICAgICAgIHwgICA4ICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjYwIGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQo+IAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
