Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA438595
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C8E89C1F;
	Fri,  7 Jun 2019 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5200F8967F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:47 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so3878554qtk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tcl38YCYPEHxtG59vS1/laf3LqY602AZ9Gwml32ANEI=;
 b=Fu6Sw5l18jYEDz+K/BAyxwDLBar93gsimN0MiKHD82sHkOPLR+nYMLRF6L8Etyunwb
 EK+bqfj0C1pIZpr1qCr8q86QTEhSvyjOU3HTosvSH7t5+KvelEpnpyFvFM7wU61ybAQJ
 vbqg884Y5+6Ay5RH7nAm89FHi6fkBWFtSKL6SBROZ6Gok757BHL/ryisapiJB1o1+gKl
 wiJ3lCh/wLoLv23lVgvubM4gnxwp9NUMj7ck6sXBPqzypAOqjD2SdqRmezhQ9bEsHDZx
 3L/IQomYariHQd1e8r4HVuHUkArqfAS0AQuUi/ze+4JjjWihcsQFU9xjeX7KQqKhSvJb
 wCQg==
X-Gm-Message-State: APjAAAV00LdBFNLi1H8OI8rr2tqjZwbjU9NyVh6nvjCnwDmW0X32STDp
 YAsA2abx8jSoWLuI1b5RgjxO7w==
X-Google-Smtp-Source: APXvYqwHsJyTk4fQz5PZYwBgzdqZtwH6jrE0uJFj5aHZhZ7tQwHTh6bgGfHk1coLRSMVlHO0bDCdZQ==
X-Received: by 2002:ac8:1a39:: with SMTP id v54mr42610485qtj.21.1559846686346; 
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c184sm1290839qkf.82.2019.06.06.11.44.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:45 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008Hz-CZ; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 00/11] Various revisions from a locking/code review
Date: Thu,  6 Jun 2019 15:44:27 -0300
Message-Id: <20190606184438.31646-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tcl38YCYPEHxtG59vS1/laf3LqY602AZ9Gwml32ANEI=;
 b=hlrXri4CeEqiio7H/zfky6NMR7c65pBi/F8pbkmeJr2seEsfBd9qQbAyoCdHKPCuAC
 qOjGVsCwywsrQAs8F8f7bXbvI4mxQXMaLzXfL+nD0jx3Re+FpvedlkosN9s82eEcILOF
 jjkWSF5MrKwcYO1kxfxzkGpH5jfkehCo7dr1F9ZVwxWOtEG3YD724vwOMu83c6AsplFV
 wapKpAfXNKW3ibR5Yp3tsVpjC565fxndhwuL+Aw71vwHim7yGiO0p7XecLABBh9kjhYa
 RBziZbveeMFL4Dvyn731jLuoNH1SB7mJwtOsx5v/oKmqUFczBchHp49QeSTBXmd1v1Dv
 415Q==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKRm9yIGhtbS5naXQ6CgpU
aGlzIHBhdGNoIHNlcmllcyBhcmlzZWQgb3V0IG9mIGRpc2N1c3Npb25zIHdpdGggSmVyb21lIHdo
ZW4gbG9va2luZyBhdCB0aGUKT0RQIGNoYW5nZXMsIHBhcnRpY3VsYXJseSBpbmZvcm1lZCBieSB1
c2UgYWZ0ZXIgZnJlZSByYWNlcyB3ZSBoYXZlIGFscmVhZHkKZm91bmQgYW5kIGZpeGVkIGluIHRo
ZSBPRFAgY29kZSAodGhhbmtzIHRvIHN5emthbGxlcikgd29ya2luZyB3aXRoIG1tdQpub3RpZmll
cnMsIGFuZCB0aGUgZGlzY3Vzc2lvbiB3aXRoIFJhbHBoIG9uIGhvdyB0byByZXNvbHZlIHRoZSBs
aWZldGltZSBtb2RlbC4KCk92ZXJhbGwgdGhpcyBicmluZ3MgaW4gYSBzaW1wbGlmaWVkIGxvY2tp
bmcgc2NoZW1lIGFuZCBlYXN5IHRvIGV4cGxhaW4KbGlmZXRpbWUgbW9kZWw6CgogSWYgYSBobW1f
cmFuZ2UgaXMgdmFsaWQsIHRoZW4gdGhlIGhtbSBpcyB2YWxpZCwgaWYgYSBobW0gaXMgdmFsaWQg
dGhlbiB0aGUgbW0KIGlzIGFsbG9jYXRlZCBtZW1vcnkuCgogSWYgdGhlIG1tIG5lZWRzIHRvIHN0
aWxsIGJlIGFsaXZlIChpZSB0byBsb2NrIHRoZSBtbWFwX3NlbSwgZmluZCBhIHZtYSwgZXRjKQog
dGhlbiB0aGUgbW1nZXQgbXVzdCBiZSBvYnRhaW5lZCB2aWEgbW1nZXRfbm90X3plcm8oKS4KCkxv
Y2tpbmcgb2YgbW0tPmhtbSBpcyBzaGlmdGVkIHRvIHVzZSB0aGUgbW1hcF9zZW0gY29uc2lzdGVu
dGx5IGZvciBhbGwKcmVhZC93cml0ZSBhbmQgdW5sb2NrZWQgYWNjZXNzZXMgYXJlIHJlbW92ZWQu
CgpUaGUgdXNlIHVubG9ja2VkIHJlYWRzIG9uICdobW0tPmRlYWQnIGFyZSBhbHNvIGVsaW1pbmF0
ZWQgaW4gZmF2b3VyIG9mIHVzaW5nCnN0YW5kYXJkIG1tZ2V0KCkgbG9ja2luZyB0byBwcmV2ZW50
IHRoZSBtbSBmcm9tIGJlaW5nIHJlbGVhc2VkLiBNYW55IG9mIHRoZQpkZWJ1Z2dpbmcgY2hlY2tz
IG9mICFyYW5nZS0+aG1tIGFuZCAhaG1tLT5tbSBhcmUgZHJvcHBlZCBpbiBmYXZvdXIgb2YgcG9p
c29uIC0Kd2hpY2ggaXMgbXVjaCBjbGVhcmVyIGFzIHRvIHRoZSBsaWZldGltZSBpbnRlbnQuCgpU
aGUgdHJhaWxpbmcgcGF0Y2hlcyBhcmUganVzdCBzb21lIHJhbmRvbSBjbGVhbnVwcyBJIG5vdGlj
ZWQgd2hlbiByZXZpZXdpbmcKdGhpcyBjb2RlLgoKVGhpcyB2MiBpbmNvcnBvcmF0ZXMgYWxvdCBv
ZiB0aGUgZ29vZCBvZmYgbGlzdCBjaGFuZ2VzICYgZmVlZGJhY2sgSmVyb21lIGhhZCwKYW5kIGFs
bCB0aGUgb24tbGlzdCBjb21tZW50cyB0b28uIEhvd2V2ZXIsIG5vdyB0aGF0IHdlIGhhdmUgdGhl
IHNoYXJlZCBnaXQgSQpoYXZlIGtlcHQgdGhlIG9uZSBsaW5lIGNoYW5nZSB0byBub3V2ZWF1X3N2
bS5jIHJhdGhlciB0aGFuIHRoZSBjb21wYXQKZnVudGlvbnMuCgpJIGJlbGlldmUgd2UgY2FuIHJl
c29sdmUgdGhpcyBtZXJnZSBpbiB0aGUgRFJNIHRyZWUgbm93IGFuZCBrZWVwIHRoZSBjb3JlCm1t
L2htbS5jIGNsZWFuLiBEUk0gbWFpbnRhaW5lcnMsIHBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3
cm9uZy4KCkl0IGlzIG9uIHRvcCBvZiBobW0uZ2l0LCBhbmQgSSBoYXZlIGEgZ2l0IHRyZWUgb2Yg
dGhpcyBzZXJpZXMgdG8gZWFzZSB0ZXN0aW5nCmhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vamd1
bnRob3JwZS9saW51eC90cmVlL2htbQoKVGhlcmUgYXJlIHN0aWxsIHNvbWUgb3BlbiBsb2NraW5n
IGlzc3VlcywgYXMgSSB0aGluayB0aGlzIHJlbWFpbnMgdW5hZGRyZXNzZWQ6CgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tbS8yMDE5MDUyNzE5NTgyOS5HQjE4MDE5QG1lbGxhbm94LmNv
bS8KCkknbSBsb29raW5nIGZvciBzb21lIG1vcmUgYWNrcywgcmV2aWV3cyBhbmQgdGVzdHMgc28g
dGhpcyBjYW4gbW92ZSBhaGVhZCB0bwpobW0uZ2l0LgoKRGV0YWlsZWQgbm90ZXMgb24gdGhlIHYy
IGNoYW5nZXMgYXJlIGluIGVhY2ggcGF0Y2guIFRoZSBiaWcgY2hhbmdlczoKIC0gbW1nZXQgaXMg
aGVsZCBzbyBsb25nIGFzIHRoZSByYW5nZSBpcyByZWdpc3RlcmVkCiAtIHRoZSBsYXN0IHBhdGNo
ICdSZW1vdmUgY29uZnVzaW5nIGNvbW1lbnQgYW5kIGxvZ2ljIGZyb20gaG1tX3JlbGVhc2UnIGlz
IG5ldwoKVGhhbmtzIGV2ZXJ5b25lLApKYXNvbgoKSmFzb24gR3VudGhvcnBlICgxMSk6CiAgbW0v
aG1tOiBmaXggdXNlIGFmdGVyIGZyZWUgd2l0aCBzdHJ1Y3QgaG1tIGluIHRoZSBtbXUgbm90aWZp
ZXJzCiAgbW0vaG1tOiBVc2UgaG1tX21pcnJvciBub3QgbW0gYXMgYW4gYXJndW1lbnQgZm9yIGht
bV9yYW5nZV9yZWdpc3RlcgogIG1tL2htbTogSG9sZCBhIG1tZ3JhYiBmcm9tIGhtbSB0byBtbQog
IG1tL2htbTogU2ltcGxpZnkgaG1tX2dldF9vcl9jcmVhdGUgYW5kIG1ha2UgaXQgcmVsaWFibGUK
ICBtbS9obW06IFJlbW92ZSBkdXBsaWNhdGUgY29uZGl0aW9uIHRlc3QgYmVmb3JlIHdhaXRfZXZl
bnRfdGltZW91dAogIG1tL2htbTogSG9sZCBvbiB0byB0aGUgbW1nZXQgZm9yIHRoZSBsaWZldGlt
ZSBvZiB0aGUgcmFuZ2UKICBtbS9obW06IFVzZSBsb2NrZGVwIGluc3RlYWQgb2YgY29tbWVudHMK
ICBtbS9obW06IFJlbW92ZSByYWN5IHByb3RlY3Rpb24gYWdhaW5zdCBkb3VibGUtdW5yZWdpc3Ry
YXRpb24KICBtbS9obW06IFBvaXNvbiBobW1fcmFuZ2UgZHVyaW5nIHVucmVnaXN0ZXIKICBtbS9o
bW06IERvIG5vdCB1c2UgbGlzdCpfcmN1KCkgZm9yIGhtbS0+cmFuZ2VzCiAgbW0vaG1tOiBSZW1v
dmUgY29uZnVzaW5nIGNvbW1lbnQgYW5kIGxvZ2ljIGZyb20gaG1tX3JlbGVhc2UKCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgICAyICstCiBpbmNsdWRlL2xpbnV4L2ht
bS5oICAgICAgICAgICAgICAgICAgIHwgIDQ5ICstLS0tLS0KIGtlcm5lbC9mb3JrLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgLQogbW0vaG1tLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIwNCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2Vk
LCA4NyBpbnNlcnRpb25zKCspLCAxNjkgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
