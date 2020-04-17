Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361A1AE0F9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8376EC3A;
	Fri, 17 Apr 2020 15:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FD06EC3A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:24:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d17so3470558wrg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=CgcNS7wVJx/cYNun6VjX20ZMzfaQsrimyYkXrWNoBus=;
 b=BKJl2UErpEu+NCY9uO9Lommds4DyzAm/iPucAVPnMLsQR63OHetIN0V662rSMjFT+O
 ukCQfenaTNg7x3n+oIzre3kDQrPHxB50BEIKsdqAZ9oFmtbbaDLhpr43UKqZuvlI8J+T
 aMljbWOC8YGA9LydrAhqBKclch1+eX66x/kgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=CgcNS7wVJx/cYNun6VjX20ZMzfaQsrimyYkXrWNoBus=;
 b=lgwZ7PeS3D05BIoRGdUqQWsjmunRurHi1+c+5+q9nlo5x6nxUiRgnIDXWLuM4naisV
 ahK0+cmBscnxIrUSpalCrtJoFp3+wkE0ceYwbogXS9ZjPBlMUcLnoBDF0yrZejYELxVU
 F54PyOKqqJqDZdvjeOAJeygMWy7Mq6ZjA44Nzkn00+WbrieW53kmdQ8s9lEtVcX3JfzK
 5HW2qVwdHmyilM//Z6NCIyDhKaYQQugzKLjDUmQfgHYDD1mi1L9pEouG0GwJKP9yprcn
 0+hyMllauAWhKCnkOw0iQcpjYVjRIfUZPiznm2EQto1rNtm6auvtu9nwhg8EuVXCXeXa
 4KsQ==
X-Gm-Message-State: AGi0PuYSa4Oeyt5Fy3O3hzFsmkRMRvCrSYTW2lfjwD/Kna4oXxTlXPKl
 c2kx5nB6B3c/MDwuv0ngs6qdEw==
X-Google-Smtp-Source: APiQypJ8TBKIbcM3sKU/AyEJfbOuZ02z9cZR91tRn6zeSl5vO8A9C4sU0ld0N/OBcLS5RBjM3z1S1w==
X-Received: by 2002:a05:6000:162c:: with SMTP id
 v12mr4747537wrb.313.1587137056871; 
 Fri, 17 Apr 2020 08:24:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t63sm2703843wmt.37.2020.04.17.08.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:24:15 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:24:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/gma500: remove unused variable 'hdmi_ids'
Message-ID: <20200417152414.GR3456981@phenom.ffwll.local>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
 patrik.r.jakobsson@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200417101032.8140-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417101032.8140-1-yuehaibing@huawei.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDY6MTA6MzJQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2hkbWkuYzo2NzY6MzU6IHdhcm5p
bmc6IOKAmGhkbWlfaWRz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12
YXJpYWJsZT1dCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBoZG1pX2lkc1td
ID0gewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KPiAKPiBJ
dCBpcyBuZXZlciB1c2VkLCByZW1vdmUgaXQuCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3Qg
PGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJp
bmdAaHVhd2VpLmNvbT4KClF1ZXVlZCBmb3IgNS44LCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1E
YW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5jIHwg
NSAtLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL29ha3RyYWlsX2hkbWkuYwo+IGluZGV4IGIyNTA4NmYyNTJhZS4uYTA5N2E1OWE5
ZWFlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmMKPiBAQCAtNjYz
LDExICs2NjMsNiBAQCB2b2lkIG9ha3RyYWlsX2hkbWlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+ICAJa2ZyZWUoZ21hX2VuY29kZXIpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3Ry
dWN0IHBjaV9kZXZpY2VfaWQgaGRtaV9pZHNbXSA9IHsKPiAtCXsgUENJX0RFVklDRShQQ0lfVkVO
RE9SX0lEX0lOVEVMLCAweDA4MGQpIH0sCj4gLQl7IDAgfQo+IC19Owo+IC0KPiAgdm9pZCBvYWt0
cmFpbF9oZG1pX3NldHVwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gIHsKPiAgCXN0cnVjdCBk
cm1fcHNiX3ByaXZhdGUgKmRldl9wcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKPiAtLSAKPiAyLjE3
LjEKPiAKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
