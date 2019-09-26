Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C43BF2AF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 14:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B5989FBC;
	Thu, 26 Sep 2019 12:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E39989FBC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:15:23 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF57C3A17F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:15:22 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id s3so2156868qkd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 05:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WoMvRKtykTYDsX19tL7CCxZ7vdSAP87++ul9jUPZqPM=;
 b=Q56JViW3D5Tw22Fno8f9EKSvhpaDR/N2P8HVnoWk7WYg75ACFvqIzciWhZP67voxtn
 dsbtGL8f8cwGWlSCDUQf3sHCkhwo6gEc6XXuQOoBwVa7vSaHg5ftikGsck5gDJc0ACiE
 pLwUaeyN93ZsQk0PTcIWefYHWrXJkn9/CYFTsqD5jVKMuRDslLb0vf6DSEhiFd+oEh2/
 b76gcJYS0Xsb4Ijg6GYIyl6O0Waq3eqVC62Wu2JCg6oWWrosTjR/0GQTvknIBZa0UwTf
 EP7meu8hkn7Cyiy46VTXmU7xnBFbrTB1Na5GSjeiUxYHB0eigLzCKCg813q/so9L/b5I
 pwyg==
X-Gm-Message-State: APjAAAWJZuuIRWRhNcUW10RjSKOPXGyQwm9p0lR/4eYDf3l1yOCtV98F
 RKYNlA+f3Su7C7SxKwY0Q9geRLw3UrqSEySLZ1zzISqFBRRgFPKzcTZuJbrw8e/cQ9ltodbU0vh
 s+UhSmSM6tXmsnq709VFSGOpabTdu
X-Received: by 2002:ac8:184:: with SMTP id x4mr3591129qtf.249.1569500122325;
 Thu, 26 Sep 2019 05:15:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPTpW78dOXtowZ8lrDddxbCYHPF7M3/HG68ZTdILYDvfvFJG+QYoihU1Xiv24jrNMXunrPAg==
X-Received: by 2002:ac8:184:: with SMTP id x4mr3591073qtf.249.1569500122133;
 Thu, 26 Sep 2019 05:15:22 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id o38sm1025365qtc.39.2019.09.26.05.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 05:15:21 -0700 (PDT)
Date: Thu, 26 Sep 2019 08:15:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Message-ID: <20190926081506-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
 <2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
 <20190925092044-mutt-send-email-mst@kernel.org>
 <eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
 <20190926042102-mutt-send-email-mst@kernel.org>
 <d6a66de5-5774-5ad6-8e9d-26bb6d8eaa8c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6a66de5-5774-5ad6-8e9d-26bb6d8eaa8c@redhat.com>
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
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDY6NDg6NTRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMjYg5LiL5Y2INDoyMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6MDQ6NDZQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gPiA+ID4gSSdtIG5vdCBzdXJlIGhvdyBzdGFibGUgYWJvdmUgb3BzIGFy
ZS4KPiA+ID4gPiA+IEl0J3MgdGhlIGtlcm5lbCBpbnRlcm5hbCBBUEksIHNvIHRoZXJlJ3Mgbm8g
c3RyaWN0IHJlcXVpcmVtZW50IGZvciB0aGlzLiBXZQo+ID4gPiA+ID4gd2lsbCBleHBvcnQgYSB2
ZXJzaW9uIHZhbHVlIGZvciB1c2Vyc3BhY2UgZm9yIGNvbXBhdGliaWxpdHkuCj4gPiA+ID4gR2l2
ZW4gaXQncyB0aWVkIHRvIHZpcnRpbyB3ZSBwcm9iYWJseSB3YW50IGtlcm5lbCt1c2Vyc3BhY2UK
PiA+ID4gPiBmZWF0dXJlIGJpdHM/Cj4gPiA+IAo+ID4gPiBZZXMsIHRoZW4gSSB0aGluayB3ZSBj
b3VsZCBwcm9iYWJseSBoYXZlIGEgdmVyc2lvbiBmaWVsZCBpbnNpZGUgZS5nCj4gPiA+IGRldmlj
ZV9vcHMgc3RydWN0dXJlLiBUaGVuIGl0IGNvdWxkIGJlIGZldGNoZWQgZnJvbSBib3RoIGtlcm5l
bCBhbmQKPiA+ID4gdXNlcnNwYWNlIGRyaXZlci4KPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gPiAK
PiA+IAo+ID4gbXkgcG9pbnQgd2FzIGZlYXR1cmUgYml0cyBub3QgYSB2ZXJzaW9uIG51bWJlci4K
PiAKPiAKPiBTb21ldGhpbmcgbGlrZSBiYWNrZW5kX2ZlYXR1cmUgdGhhdCBjdXJyZW50IHZob3N0
X25ldCBkaWQ/Cj4gCj4gVGhhbmtzCj4gCj4gCj4gPiAKCnJpZ2h0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
