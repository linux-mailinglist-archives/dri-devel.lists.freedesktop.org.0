Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D22524B9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30196E091;
	Tue, 25 Jun 2019 07:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF3D89DE1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:06 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z23so696713wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TXg+V1PV7qytX0xwqixrcBsIlYVASLMn0QfVVkViw4=;
 b=CszUMSBiH7Tm6miinHLqK4owlXDnNB9NzeHJguC3dJDqsJ+jTKfVNqVEGD3awH1XRe
 xCPgilkxAEmi427ZhWTJTX8FSSewjzmsSDZbL+Qr7Ht5oK97Dw7kqAkWaOdlRCzGG1NZ
 dOSt3GtHWYUQPDm2d2uF/Y4p7cSSL50QbmNrHZezIxkYfjOmz2P5zZVLaxR/JgmtJH7B
 o3sTXNW8AhN0OVg3Xd97f0uUPwWrLNE7hFXDuO49zn0JyzrgD3qpZf+FgrjZIM3TG8gE
 ly+MOR7tvF1SLbTjXcIl7h5VLcg74VG99rs7fB4JMFg7jqT0nMlxZCppxrEKfBsquO7a
 5irA==
X-Gm-Message-State: APjAAAVsv7LbBIndlRyh1NHdAta+RYi1LXITk+JOhmccVolAcsSKGSYd
 jOZY8pcBbKOL/tHdOFEFRe88vA==
X-Google-Smtp-Source: APXvYqzG1w8w/MlwN4mNnTDNK32BkM+Kopo5HpXOnXXh6GBim1Uqm95bmEpjBPM4rzRFOIIj8zgSlQ==
X-Received: by 2002:a7b:cc93:: with SMTP id p19mr16950467wma.12.1561410125331; 
 Mon, 24 Jun 2019 14:02:05 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id l124sm464451wmf.36.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6C-0001Lx-Mk; Mon, 24 Jun 2019 18:02:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 00/12] 
Date: Mon, 24 Jun 2019 18:00:58 -0300
Message-Id: <20190624210110.5098-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TXg+V1PV7qytX0xwqixrcBsIlYVASLMn0QfVVkViw4=;
 b=RTldUZCA/ujlOPqeFpIG1/oq7I0MMWuhfuWJToHG67t3OQXfVVzK17LY3kJ6F+Brer
 lnz/th7nTkxS/2R+LqhfZEwU5MvrsZIu821B9utLccmxMdrak8HYApdsHFF6X5Hm9BeZ
 Vo8kf7gnh3yt+gibgQeVYXuNFbbhYpUZLvfs+XYPYbnhZ2hu/dNSj1xBfyMpQjtX1doH
 EZDWsi96WfqzpwW/fpPX43H1AiRarnXcaSLJUUvqCyT81nbN45aacsBUof6bL1BIOqTB
 ajwQSV/zBBYiXqc83fyuqH5/tTOsWhrpi8aDboRkZhx14nYt1qY3C4UY4GvtasO88w1a
 gS5g==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBwYXRjaCBzZXJp
ZXMgYXJpc2VkIG91dCBvZiBkaXNjdXNzaW9ucyB3aXRoIEplcm9tZSB3aGVuIGxvb2tpbmcgYXQg
dGhlCk9EUCBjaGFuZ2VzLCBwYXJ0aWN1bGFybHkgaW5mb3JtZWQgYnkgdXNlIGFmdGVyIGZyZWUg
cmFjZXMgd2UgaGF2ZSBhbHJlYWR5CmZvdW5kIGFuZCBmaXhlZCBpbiB0aGUgT0RQIGNvZGUgKHRo
YW5rcyB0byBzeXprYWxsZXIpIHdvcmtpbmcgd2l0aCBtbXUKbm90aWZpZXJzLCBhbmQgdGhlIGRp
c2N1c3Npb24gd2l0aCBSYWxwaCBvbiBob3cgdG8gcmVzb2x2ZSB0aGUgbGlmZXRpbWUgbW9kZWwu
CgpPdmVyYWxsIHRoaXMgYnJpbmdzIGluIGEgc2ltcGxpZmllZCBsb2NraW5nIHNjaGVtZSBhbmQg
ZWFzeSB0byBleHBsYWluCmxpZmV0aW1lIG1vZGVsOgoKIElmIGEgaG1tX3JhbmdlIGlzIHZhbGlk
LCB0aGVuIHRoZSBobW0gaXMgdmFsaWQsIGlmIGEgaG1tIGlzIHZhbGlkIHRoZW4gdGhlIG1tCiBp
cyBhbGxvY2F0ZWQgbWVtb3J5LgoKIElmIHRoZSBtbSBuZWVkcyB0byBzdGlsbCBiZSBhbGl2ZSAo
aWUgdG8gbG9jayB0aGUgbW1hcF9zZW0sIGZpbmQgYSB2bWEsIGV0YykKIHRoZW4gdGhlIG1tZ2V0
IG11c3QgYmUgb2J0YWluZWQgdmlhIG1tZ2V0X25vdF96ZXJvKCkuCgpUaGUgdXNlIG9mIHVubG9j
a2VkIHJlYWRzIG9uICdobW0tPmRlYWQnIGFyZSBhbHNvIGVsaW1pbmF0ZWQgaW4gZmF2b3VyIG9m
CnVzaW5nIHN0YW5kYXJkIG1tZ2V0KCkgbG9ja2luZyB0byBwcmV2ZW50IHRoZSBtbSBmcm9tIGJl
aW5nIHJlbGVhc2VkLiBNYW55IG9mCnRoZSBkZWJ1Z2dpbmcgY2hlY2tzIG9mICFyYW5nZS0+aG1t
IGFuZCAhaG1tLT5tbSBhcmUgZHJvcHBlZCBpbiBmYXZvdXIgb2YKcG9pc29uIC0gd2hpY2ggaXMg
bXVjaCBjbGVhcmVyIGFzIHRvIHRoZSBsaWZldGltZSBpbnRlbnQuCgpUaGUgdHJhaWxpbmcgcGF0
Y2hlcyBhcmUganVzdCBzb21lIHJhbmRvbSBjbGVhbnVwcyBJIG5vdGljZWQgd2hlbiByZXZpZXdp
bmcKdGhpcyBjb2RlLgoKSSdsbCBhcHBseSB0aGlzIGluIHRoZSBuZXh0IGZldyBkYXlzIC0gdGhl
IG9ubHkgcGF0Y2ggdGhhdCBkb2Vzbid0IGhhdmUgZW5vdWdoClJldmlld2VkLWJ5cyBpcyAnbW0v
aG1tOiBSZW1vdmUgY29uZnVzaW5nIGNvbW1lbnQgYW5kIGxvZ2ljIGZyb20gaG1tX3JlbGVhc2Un
LAp3aGljaCBoYWQgYWxvdCBvZiBxdWVzdGlvbnMsIEkgc3RpbGwgdGhpbmsgaXQgaXMgZ29vZC4g
SWYgcGVvcGxlIHJlYWxseSBkb24ndApsaWtlIGl0IEknbGwgZHJvcCBpdC4KClRoYW5rcyB0byBl
dmVyeW9uZSB3aG8gdG9vayB0aW1lIHRvIGxvb2sgYXQgdGhpcyEKCkphc29uIEd1bnRob3JwZSAo
MTIpOgogIG1tL2htbTogZml4IHVzZSBhZnRlciBmcmVlIHdpdGggc3RydWN0IGhtbSBpbiB0aGUg
bW11IG5vdGlmaWVycwogIG1tL2htbTogVXNlIGhtbV9taXJyb3Igbm90IG1tIGFzIGFuIGFyZ3Vt
ZW50IGZvciBobW1fcmFuZ2VfcmVnaXN0ZXIKICBtbS9obW06IEhvbGQgYSBtbWdyYWIgZnJvbSBo
bW0gdG8gbW0KICBtbS9obW06IFNpbXBsaWZ5IGhtbV9nZXRfb3JfY3JlYXRlIGFuZCBtYWtlIGl0
IHJlbGlhYmxlCiAgbW0vaG1tOiBSZW1vdmUgZHVwbGljYXRlIGNvbmRpdGlvbiB0ZXN0IGJlZm9y
ZSB3YWl0X2V2ZW50X3RpbWVvdXQKICBtbS9obW06IERvIG5vdCB1c2UgbGlzdCpfcmN1KCkgZm9y
IGhtbS0+cmFuZ2VzCiAgbW0vaG1tOiBIb2xkIG9uIHRvIHRoZSBtbWdldCBmb3IgdGhlIGxpZmV0
aW1lIG9mIHRoZSByYW5nZQogIG1tL2htbTogVXNlIGxvY2tkZXAgaW5zdGVhZCBvZiBjb21tZW50
cwogIG1tL2htbTogUmVtb3ZlIHJhY3kgcHJvdGVjdGlvbiBhZ2FpbnN0IGRvdWJsZS11bnJlZ2lz
dHJhdGlvbgogIG1tL2htbTogUG9pc29uIGhtbV9yYW5nZSBkdXJpbmcgdW5yZWdpc3RlcgogIG1t
L2htbTogUmVtb3ZlIGNvbmZ1c2luZyBjb21tZW50IGFuZCBsb2dpYyBmcm9tIGhtbV9yZWxlYXNl
CiAgbW0vaG1tOiBGaXggZXJyb3IgZmxvd3MgaW4gaG1tX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQK
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgICAyICstCiBpbmNsdWRl
L2xpbnV4L2htbS5oICAgICAgICAgICAgICAgICAgIHwgIDUyICstLS0tCiBrZXJuZWwvZm9yay5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0KIG1tL2htbS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyNzUgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMg
Y2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKyksIDIwMCBkZWxldGlvbnMoLSkKCi0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
