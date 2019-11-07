Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECFF306F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E666E2DC;
	Thu,  7 Nov 2019 13:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B0D6E2DC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:51:01 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C5089C04BE1B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:51:00 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id h39so2641762qth.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 05:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nkZBN+5zxQ42o26GlAg4Gu8zR9MU5cE0CTJ+GrFRdeo=;
 b=QUm2VlS+0DeNI0d3BEcXd68HrC9htqyCAk1Pp+a8E98c6y57I7X7ntuPdiHtRB0H8P
 6Gvk3yLkkxhn4yvz7760uqqmoJYMxLcLpwlFHchY9r7qFcL46S3vQtUlnryzh6R44I1v
 8mjkknulSoeKWOSCo4celpj+uo5HxteAOGwaOxlvoLl1K0CHTR+gvXpPpUzuJFnhFbbW
 36O+kTJf6akvLh0WmdRy8NKyEJg9eOzirNOJpCaZ2efRanx74v2r1a+VwPnSte1OzWFr
 fw9wItFzCalWYRuoRnJv++53Xda0VUrLZg53Bz0mKbhF0S4Nm2P0YtoVL7o5e+p5GgXU
 642A==
X-Gm-Message-State: APjAAAXg0JjdDMe6tR4H0ZED6r7pX2WjNKIUBgwUld25EXrYqxSds3eD
 W+pek9uWjD1dmwvPsICW94c2J9Ln7Lb0eINe08RouXz7+Me6dXFGSxd2V/rnrETlj4yiIBUPBcc
 gnIBAksNtLmqK0JGlsUOI2/K6zA+O
X-Received: by 2002:a37:f605:: with SMTP id y5mr2957978qkj.288.1573134659998; 
 Thu, 07 Nov 2019 05:50:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwR0XN8Xkg7npgZmypT2TC+6FrvcOeN+9aUQy/VsChc7srS+8pQqGTXKUbO8NQlTjtab+Vs0A==
X-Received: by 2002:a37:f605:: with SMTP id y5mr2957932qkj.288.1573134659680; 
 Thu, 07 Nov 2019 05:50:59 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id p3sm1052072qkf.107.2019.11.07.05.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:50:58 -0800 (PST)
Date: Thu, 7 Nov 2019 08:50:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191107085013-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
 <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
 <20191107080834-mutt-send-email-mst@kernel.org>
 <b2265e3a-6f86-c21a-2ebd-d0e4eea2886f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2265e3a-6f86-c21a-2ebd-d0e4eea2886f@redhat.com>
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 airlied@linux.ie, heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6MzI6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzExLzcg5LiL5Y2IOTowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6NDM6MjlQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS8xMS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNjoxODo0NVBNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAxOS8xMS83IOS4i+WNiDU6MDgsIE1p
Y2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkg
YXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBUaGlz
IHNhbXBsZSBkcml2ZXIgY3JlYXRlcyBtZGV2IGRldmljZSB0aGF0IHNpbXVsYXRlIHZpcnRpbyBu
ZXQgZGV2aWNlCj4gPiA+ID4gPiA+ID4gb3ZlciB2aXJ0aW8gbWRldiB0cmFuc3BvcnQuIFRoZSBk
ZXZpY2UgaXMgaW1wbGVtZW50ZWQgdGhyb3VnaCB2cmluZ2gKPiA+ID4gPiA+ID4gPiBhbmQgd29y
a3F1ZXVlLiBBIGRldmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMg
dXNlZAo+ID4gPiA+ID4gPiA+IGRpcmVjdGx5IGFzIHRoZSBJT1ZBLiBUaGlzIHNob3VsZCBiZSBz
dWZmaWNpZW50IGZvciBrZXJuZWwgdmlydGlvCj4gPiA+ID4gPiA+ID4gZHJpdmVyIHRvIHdvcmsu
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBv
cnRlZCByaWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4gPiA+ID4gPiA+ID4g
b24gdG9wIHdoaWNoIHJlcXVpcmVzIHNvbWUgdmlydHVhbCBJT01NVSBpbXBsZW1lbnRlZCBpbiB0
aGlzIHNhbXBsZQo+ID4gPiA+ID4gPiA+IGRyaXZlci4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiBBY2tlZC1ieTogQ29ybmVsaWEgSHVjazxjb2h1Y2tAcmVkaGF0LmNvbT4KPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+
ID4gPiA+IEknZCBwcmVmZXIgaXQgdGhhdCB3ZSBjYWxsIHRoaXMgc29tZXRoaW5nIGVsc2UsIGUu
Zy4KPiA+ID4gPiA+ID4gbXZuZXQtbG9vcGJhY2suIEp1c3Qgc28gcGVvcGxlIGRvbid0IGV4cGVj
dCBhIGZ1bGx5Cj4gPiA+ID4gPiA+IGZ1bmN0aW9uYWwgZGV2aWNlIHNvbWVob3cuIENhbiBiZSBy
ZW5hbWVkIHdoZW4gYXBwbHlpbmc/Cj4gPiA+ID4gPiBBY3R1YWxseSwgSSBwbGFuIHRvIGV4dGVu
ZCBpdCBhcyBhbm90aGVyIHN0YW5kYXJkIG5ldHdvcmsgaW50ZXJmYWNlIGZvcgo+ID4gPiA+ID4g
a2VybmVsLiBJdCBjb3VsZCBiZSBlaXRoZXIgYSBzdGFuZGFsb25lIHBzZXVkbyBkZXZpY2Ugb3Ig
YSBzdGFjayBkZXZpY2UuCj4gPiA+ID4gPiBEb2VzIHRoaXMgc291bmRzIGdvb2QgdG8geW91Pwo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiBUaGF0J3MgYSBiaWcgY2hhbmdlIGlu
IGFuIGludGVyZmFjZSBzbyBpdCdzIGEgZ29vZCByZWFzb24KPiA+ID4gPiB0byByZW5hbWUgdGhl
IGRyaXZlciBhdCB0aGF0IHBvaW50IHJpZ2h0Pwo+ID4gPiA+IE9oZXJ3aXNlIHVzZXJzIG9mIGFu
IG9sZCBrZXJuZWwgd291bGQgZXhwZWN0IGEgc3RhY2tlZCBkcml2ZXIKPiA+ID4gPiBhbmQgZ2V0
IGEgbG9vcGJhY2sgaW5zdGVhZC4KPiA+ID4gPiAKPiA+ID4gPiBPciBkaWQgSSBtaXNzIHNvbWV0
aGluZz8KPiA+ID4gCj4gPiA+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBpdCB3YXMgYSBzYW1w
bGUgZHJpdmVyIGluIC9kb2MuIEl0IHNob3VsZCBub3QgYmUKPiA+ID4gdXNlZCBpbiBwcm9kdWN0
aW9uIGVudmlyb25tZW50LiBPdGhlcndpc2Ugd2UgbmVlZCB0byBtb3ZlIGl0IHRvCj4gPiA+IGRy
aXZlci92aXJ0aW8uCj4gPiA+IAo+ID4gPiBCdXQgaWYgeW91IGluc2lzdCwgSSBjYW4gcG9zdCBh
IFYxMS4KPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gdGhpcyBjYW4gYmUgYSBwYXRjaCBvbiB0b3Au
Cj4gCj4gCj4gVGhlbiBtYXliZSBpdCdzIGJldHRlciBqdXN0IGV4dGVuZCBpdCB0byB3b3JrIGFz
IGEgbm9ybWFsIG5ldHdvcmtpbmcgZGV2aWNlCj4gb24gdG9wPwo+IAo+IFRoYW5rcwoKVGhhdCB3
b3VsZCBiZSBhIHN1YnN0YW50aWFsIGNoYW5nZS4gTWF5YmUgZHJvcCA2LzYgZm9yIG5vdyB1bnRp
bAp3ZSBoYXZlIGEgYmV0dGVyIGhhbmRsZSBvbiB0aGlzPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
