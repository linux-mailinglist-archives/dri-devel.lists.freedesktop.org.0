Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B3BF6CB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 18:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA836EDE0;
	Thu, 26 Sep 2019 16:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1D6EDDD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 16:34:38 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AA6697FDF4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 16:34:37 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id x62so2980807qkb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 09:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xYpQbAZ63HiQipNKU9hbHHvrV87zgfju5zk/UzLiZz0=;
 b=eB6pdPp5UoNNWwFK/FbDDS3JI+oVcGpusLqGZeUwnkoC5maF0O2fF4qUEuYZ4PgvDx
 KWT/uPe2v9FAGUYynI/Yoz+Cy2tLFcyY5fXOTRf9h0D0XYZWJ9h7ZpM+5v8O4d3u6RQx
 3o1hMnx22YhtRV4aANRnL7XpzAfxpi8umGFbZW6I8ARwrw3TwbmG5qjY5fYPwPzLlfVT
 2eqX450kpbchA0/JRl+4al8O4GFpcrJdy1B4SZq1cU4MglOnFaotWY3P27gFdPoNKUO5
 D7aagQHFC/YOnVzjwu9ZsYQ4S/Bysj+IzVNiENlmj7P+UL+xwzoOHohsb8Whej16pknL
 96ng==
X-Gm-Message-State: APjAAAWXv1yCDNZKWRnRXdNFQK+vmlVLXuMoNbghUFeAMF11EjfBliZL
 Ag7ysZo1/UVqYVuk2sgEGsezXiWJzKUifSKL/vp3J3XOcb2Rj8JPRswe7v5zTI3rwEtEqqzM+7A
 /XiHeALB8/e756wNUrN1Fe9oo1OJd
X-Received: by 2002:a05:620a:7d0:: with SMTP id
 16mr4225372qkb.172.1569515676807; 
 Thu, 26 Sep 2019 09:34:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgvMksAUeMSKglqrr6wMg/jDjg1P4PUat2/rOqsNuIgfv4m7zMnjeA8NuQDz90Tw/MvOd6Qg==
X-Received: by 2002:a05:620a:7d0:: with SMTP id
 16mr4225313qkb.172.1569515676499; 
 Thu, 26 Sep 2019 09:34:36 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id v23sm1108658qto.89.2019.09.26.09.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 09:34:35 -0700 (PDT)
Date: Thu, 26 Sep 2019 12:34:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V2 5/8] mdev: introduce device specific ops
Message-ID: <20190926123031-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-6-jasowang@redhat.com>
 <20190924170638.064d85f7@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F754@SHSMSX104.ccr.corp.intel.com>
 <CAJPjb1+i7jb0aVfr=7CDuUBpeo_w3wAfTrnmuLVJ-h+qOV+1hw@mail.gmail.com>
 <20190925103028.1f2edf03@x1.home>
 <20190926113958-mutt-send-email-mst@kernel.org>
 <20190926102608.5ec81923@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926102608.5ec81923@x1.home>
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Rob Miller <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6MjY6MDhBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFRodSwgMjYgU2VwIDIwMTkgMTE6NDY6NTUgLTA0MDAKPiAiTWljaGFlbCBT
LiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+IAo+ID4gT24gV2VkLCBTZXAgMjUs
IDIwMTkgYXQgMTA6MzA6MjhBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+ID4gPiBP
biBXZWQsIDI1IFNlcCAyMDE5IDEwOjExOjAwIC0wNDAwCj4gPiA+IFJvYiBNaWxsZXIgPHJvYi5t
aWxsZXJAYnJvYWRjb20uY29tPiB3cm90ZTogIAo+ID4gPiA+ID4gPiBPbiBUdWUsIDI0IFNlcCAy
MDE5IDIxOjUzOjI5ICswODAwCj4gPiA+ID4gPiA+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+IHdyb3RlOiAgCj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9t
ZGV2L3ZmaW9fbWRldi5jICAgIAo+ID4gPiA+ID4gPiBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9f
bWRldi5jICAgIAo+ID4gPiA+ID4gPiA+IGluZGV4IDg5MWNmODNhMmQ5YS4uOTVlZmEwNTQ0NDJm
IDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5j
Cj4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKPiA+ID4g
PiA+ID4gPiBAQCAtMTQsNiArMTQsNyBAQAo+ID4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgv
c2xhYi5oPgo+ID4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvdmZpby5oPgo+ID4gPiA+ID4g
PiA+ICAjaW5jbHVkZSA8bGludXgvbWRldi5oPgo+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGlu
dXgvdmZpb19tZGV2Lmg+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgI2luY2x1ZGUgIm1k
ZXZfcHJpdmF0ZS5oIgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQEAgLTI0LDE2ICsyNSwx
NiBAQAo+ID4gPiA+ID4gPiA+ICBzdGF0aWMgaW50IHZmaW9fbWRldl9vcGVuKHZvaWQgKmRldmlj
ZV9kYXRhKQo+ID4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ID4gICAgIHN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldiA9IGRldmljZV9kYXRhOwo+ID4gPiA+ID4gPiA+IC0gICBzdHJ1Y3QgbWRldl9w
YXJlbnQgKnBhcmVudCA9IG1kZXYtPnBhcmVudDsKPiA+ID4gPiA+ID4gPiArICAgY29uc3Qgc3Ry
dWN0IHZmaW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSAgICAKPiA+ID4gPiA+ID4gbWRldl9nZXRf
ZGV2X29wcyhtZGV2KTsgICAgCj4gPiA+ID4gPiA+ID4gICAgIGludCByZXQ7Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiAtICAgaWYgKHVubGlrZWx5KCFwYXJlbnQtPm9wcy0+b3BlbikpCj4g
PiA+ID4gPiA+ID4gKyAgIGlmICh1bmxpa2VseSghb3BzLT5vcGVuKSkKPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAg
ICBpZiAoIXRyeV9tb2R1bGVfZ2V0KFRISVNfTU9EVUxFKSkKPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICByZXR1cm4gLUVOT0RFVjsgICAgCj4gPiA+ID4gPiAgICAKPiA+ID4gPiAgIAo+ID4gPiA+
IFJKTT5dIE15IHVuZGVyc3RhbmRpbmcgbGF0ZWx5IGlzIHRoYXQgdGhpcyBjYWxsIHRvICAgIAo+
ID4gPiA+IHRyeV9tb2R1bGVfZ2V0KFRISVNfTU9EVUxFKSBpcyBubyBsb25nZXIgbmVlZGVkIGFz
IGlzIGNvbnNpZGVyZWQgYXMgYQo+ID4gPiA+IGxhdGVudCBidWcuCj4gPiA+ID4gUXVvdGUgZnJv
bQo+ID4gPiA+IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzE3NDE0MTUvbGlu
dXgta2VybmVsLW1vZHVsZXMtd2hlbi10by11c2UtdHJ5LW1vZHVsZS1nZXQtbW9kdWxlLXB1dAo+
ID4gPiA+ICA6Cj4gPiA+ID4gVGhlcmUgYXJlIGEgbnVtYmVyIG9mIHVzZXMgb2YgdHJ5X21vZHVs
ZV9nZXQoVEhJU19NT0RVTEUpIGluIHRoZSBrZXJuZWwKPiA+ID4gPiBzb3VyY2UgYnV0IG1vc3Qg
aWYgbm90IGFsbCBvZiB0aGVtIGFyZSBsYXRlbnQgYnVncyB0aGF0IHNob3VsZCBiZSBjbGVhbmVk
Cj4gPiA+ID4gdXAuICAKPiA+ID4gCj4gPiA+IFRoaXMgdXNlIHNlZW1zIHRvIGZhbGwgZXhhY3Rs
eSBpbnRvIHRoZSBjYXNlIHdoZXJlIGl0IGlzIG5lY2Vzc2FyeSwgdGhlCj4gPiA+IG9wZW4gaGVy
ZSBpcyBub3QgYSBkaXJlY3QgVkZTIGNhbGwsIGl0J3MgYW4gaW50ZXJuYWwgaW50ZXJmYWNlIGJl
dHdlZW4KPiA+ID4gbW9kdWxlcy4gIFRoZSB1c2VyIGlzIGludGVyYWN0aW5nIHdpdGggZmlsZXN5
c3RlbSBvYmplY3RzIGZyb20gdGhlIHZmaW8KPiA+ID4gbW9kdWxlIGFuZCB0aGUgbW9kdWxlIHJl
ZmVyZW5jZSB3ZSdyZSB0cnlpbmcgdG8gYWNxdWlyZSBoZXJlIGlzIHRvIHRoZQo+ID4gPiB2Zmlv
LW1kZXYgbW9kdWxlLiAgVGhhbmtzLAo+ID4gPiAKPiA+ID4gQWxleCAgCj4gPiAKPiA+IAo+ID4g
SSB0aGluayB0aGUgbGF0ZW50IGJ1ZyByZWZlcnMgbm90IHRvIG1vZHVsZSBnZXQgcGVyIHNlLAo+
ID4gYnV0IHRvIHRoZSBtb2R1bGVfcHV0IHRpZWQgdG8gaXQuIEUuZy46Cj4gPiAKPiA+ICBzdGF0
aWMgdm9pZCB2ZmlvX21kZXZfcmVsZWFzZSh2b2lkICpkZXZpY2VfZGF0YSkKPiA+ICB7Cj4gPiAg
ICAgICAgIHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IGRldmljZV9kYXRhOwo+ID4gICAgICAg
ICBzdHJ1Y3QgbWRldl9wYXJlbnQgKnBhcmVudCA9IG1kZXYtPnBhcmVudDsKPiA+IAo+ID4gICAg
ICAgICBpZiAobGlrZWx5KHBhcmVudC0+b3BzLT5yZWxlYXNlKSkKPiA+ICAgICAgICAgICAgICAg
ICBwYXJlbnQtPm9wcy0+cmVsZWFzZShtZGV2KTsKPiA+IAo+ID4gICAgICAgICBtb2R1bGVfcHV0
KFRISVNfTU9EVUxFKTsKPiA+IAo+ID4gRG9lcyBhbnl0aGluZyBwcmV2ZW50IHRoZSBtb2R1bGUg
ZnJvbSB1bmxvYWRpbmcgYXQgdGhpcyBwb2ludD8KPiA+IGlmIG5vdCB0aGVuIC4uLgo+ID4gCj4g
PiAKPiA+ICB9Cj4gPiAKPiA+IGl0IGxvb2tzIGxpa2UgdGhlIGltcGxpY2l0IHJldHVybiAod2l0
aCBpbnN0cnVjdGlvbnMgZm9yIGFyZ3VtZW50IHBvcAo+ID4gYW5kIGZ1bmN0dW9uIHJldHVybikg
aGVyZSBjYW4gZ2V0IG92ZXJ3cml0dGVuIG9uIG1vZHVsZQo+ID4gdW5sb2FkLCBjYXVzaW5nIGEg
Y3Jhc2ggd2hlbiBleGVjdXRlZC4KPiA+IAo+ID4gSU9XIHRoZXJlJ3MgZ2VuZXJhbGx5IG5vIHdh
eSBmb3IgbW9kdWxlIHRvIGtlZXAgYSByZWZlcmVuY2UKPiA+IHRvIGl0c2VsZjogaXQgY2FuIHRh
a2UgYSByZWZlcmVuY2UgYnV0IGl0IG5lZWRzIHNvbWVvbmUgZWxzZQo+ID4gdG8ga2VlcCBpdCBh
bmQgcHV0Lgo+IAo+IEknZCBhbHdheXMgYXNzdW1lZCB0aGlzIHdvdWxkIGV4aXQgY2xlYW5seSwg
YnV0IHBlcmhhcHMgdGhlcmUgaXMgYQo+IGxhdGVudCByYWNlIHRoZXJlLiAgSW4gYW55IGNhc2Us
IHRha2luZyBhIG1vZHVsZSByZWZlcmVuY2Ugd2l0aGluIHRoZQo+IG1vZHVsZSBpbiB0aGlzIGNh
c2UgaXMgYmV0dGVyIHRoYW4gbm90IGRvaW5nIHNvLCBhcyB0aGUgbGF0dGVyIHdvdWxkCj4gcG90
ZW50aWFsbHkgYWxsb3cgdGhlIG1vZHVsZSB0byBiZSByZW1vdmVkIGF0IGFueSBwb2ludCBpbiB0
aW1lLCB3aGlsZQo+IHRoZSBmb3JtZXIgb25seSBzZWVtcyB0byBleHBvc2UgYWNxdWlyZSBhbmQg
cmVsZWFzZSBnYXBzLiAgQWRkIGl0IHRvCj4gdGhlIHRvZG8gbGlzdC4gIFRoYW5rcywKPiAKPiBB
bGV4CgpSaWdodC4gSSBhZ3JlZSB3aXRoIHRoZSBzdGFjayBvdmVyZmxvdyBxdW90ZTogYXMgdGhp
cyBleGFtcGxlIHNlZW1zIHRvIHNob3cKdGhpcyBpcyBhIGxhdGVudCBidWcuCgpCdXQgSSBhbHNv
IGFncmVlIHRoYXQganVzdCByZW1vdmluZyB0aGUgcmVmZXJlbmNlIGlzbid0IHRoZSByaWdodCB3
YXkKdG8gY2xlYW4gaXQgdXAuCgotLSAKTVNUCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
