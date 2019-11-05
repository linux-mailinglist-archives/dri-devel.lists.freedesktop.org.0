Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E68F024A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 17:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CB46EADF;
	Tue,  5 Nov 2019 16:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6956EADA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 16:07:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-xxav4DNQOUm0VqJwTE4V1w-1; Tue, 05 Nov 2019 11:07:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1422E107ACC3;
 Tue,  5 Nov 2019 16:07:25 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2F601FA;
 Tue,  5 Nov 2019 16:07:04 +0000 (UTC)
Date: Tue, 5 Nov 2019 17:06:59 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 2/6] modpost: add support for mdev class id
Message-ID: <20191105170659.766b84b0.cohuck@redhat.com>
In-Reply-To: <20191105093240.5135-3-jasowang@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105093240.5135-3-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xxav4DNQOUm0VqJwTE4V1w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572970053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aa7iRy6FRwmbshhu8lLwnGgjDhVFpAS/o0VXITjg6sQ=;
 b=d9zdeoGELCTx0B6NXBxkSr9T2og7xniyDYhjBU7id4moiU24r1mspOWrsBPv+b/rqoPl1+
 YLgcLcSlcShEQU/DCBTY9NC3H2o3U2qEQ3uMFlzPziYt2otxsNNGCxxQAz0wKbSxKl11lE
 pOGQ2KsdmU+CdPESeOlr4RX5+z4sloo=
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
 mst@redhat.com, airlied@linux.ie, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, alex.williamson@redhat.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNiArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gQWRkIHN1cHBvcnQgdG8gcGFyc2UgbWRldiBjbGFzcyBpZCB0
YWJsZS4KPiAKPiBSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgIHwgIDIgKysKPiAgc2NyaXB0cy9t
b2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jIHwgIDMgKysrCj4gIHNjcmlwdHMvbW9kL2ZpbGUyYWxp
YXMuYyAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
