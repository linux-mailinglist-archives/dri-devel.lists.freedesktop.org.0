Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370D0214FA
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0498990D;
	Fri, 17 May 2019 07:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F768982F;
 Fri, 17 May 2019 06:13:45 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t1so1362127pgc.2;
 Thu, 16 May 2019 23:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=kUjckoiL4hcazmpiRVYWRXZ1+byR8V6/hc2uWj9Ysig=;
 b=bs5/NKxu/mbYSvqgqprnJTh/23/Gix2oZpk4M7t4XE75pyvz6gbDhASt3A+VrRSOcT
 lYI6kZpsLpo/33ddPNTE9kzwAAKiUSHw8wuZTcmkeIh376Zjh3vGJbFcjtRVhkIqngF3
 sx4DFt8igkV5fnRpBRjXJyx4CCXUbAgDOY4JyeDAJ0gzSxYrJDfVNsVd2Y+eqI52PIo1
 eBi3DcvWQIJq2+Z6KKn0k8RPvSvH8tqheXMkz0QmLSAqMV3qhBdeKhD8/neqR0sT2c4t
 c/LfexaRXmsh4/jTUY6NskSQ7Wm/PstDpZeMvhEHWeVm+0AFOdPPqaqv59yprORsT5XX
 47qw==
X-Gm-Message-State: APjAAAXlkVi1TPF/Bu/qS8WD3/JP+PXsq+q0iYysIHrJlr0q2c3zlNET
 79UBY4a0HW2hb4sdrFGKJvg=
X-Google-Smtp-Source: APXvYqxnnFmrplpftkM7cxoI/lh030At8OG7CfCN9dr3kjxbHY3VuCVSsn2e2V4tGmNN0DpfBDcmSA==
X-Received: by 2002:a62:640e:: with SMTP id y14mr39509744pfb.109.1558073624914; 
 Thu, 16 May 2019 23:13:44 -0700 (PDT)
Received: from localhost ([175.223.38.122])
 by smtp.gmail.com with ESMTPSA id s24sm9246940pfe.57.2019.05.16.23.13.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 23:13:44 -0700 (PDT)
Date: Fri, 17 May 2019 15:13:40 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Message-ID: <20190517061340.GA709@jagdpanzerIV>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=kUjckoiL4hcazmpiRVYWRXZ1+byR8V6/hc2uWj9Ysig=;
 b=t/Ag4ohx5G5C8vnn5fyJXM4y0k89Op7ZWxUgsxV1Xd145aByUYxDEcZte/PTwB+pun
 ggfpKQTMWuvkQT+SdpuaDMqVOrX7JHIqa2JN+4SF21hFgFsa0yEsNpbj6g3lb9AevSVv
 jxOfHa1kwBVZv+IHcrbdJ3QtKzAKVUVgHqtoZdIWXlvfFuMoS4rEICsLqzX57xvmDTcG
 L5V+7EEKbEfXpxT+yzZMFHOcS4dbYlwuoxgH185T92qnWXRBdPDs/XWxXXBXXYpTfWSV
 iaBPKXUlVcSqPdsAl8E/dgUMRpZRV1oEqdlhY/IWloYEBRJ7z3aScnzW5ALwCiWpHRyK
 b3ag==
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
Cc: nouveau@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgo1LjEuMC1uZXh0LTIwMTkwNTE3CgpJJ20gbG9va2luZyBhdCBxdWl0ZSBhIGxvdCBv
ZiBrbWVtbGVhayByZXBvcnRzIGNvbWluZyBmcm9tCmRybS9ub3V2ZWF1L2NvcmUvbWVtb3J5LCBh
bGwgb2Ygd2hpY2ggYXJlOgoKICAgIHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmOGRlZWMyN2M0
YWMwIChzaXplIDE2KToKICAgICAgY29tbSAiV2ViIENvbnRlbnQiLCBwaWQgNTMwOSwgamlmZmll
cyA0MzA5Njc1MDExIChhZ2UgNjguMDc2cykKICAgICAgaGV4IGR1bXAgKGZpcnN0IDE2IGJ5dGVz
KToKICAgICAgICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAgLi4uLi4uLi4uLi4uLi4uLgogICAgICBiYWNrdHJhY2U6CiAgICAgICAgWzwwMDAwMDAwMDgx
ZjI4OTRmPl0gbnZrbV9tZW1vcnlfdGFnc19nZXQrMHg4ZS8weDEzMAogICAgICAgIFs8MDAwMDAw
MDA3Y2Q3YzBiYz5dIGdmMTAwX3ZtbV92YWxpZCsweDE5Ni8weDJmMAogICAgICAgIFs8MDAwMDAw
MDA3MGNjNmQ2Nz5dIG52a21fdm1tX21hcCsweGE4LzB4MzYwCiAgICAgICAgWzwwMDAwMDAwMGFi
Njc4NjQ0Pl0gbnZrbV92cmFtX21hcCsweDQ4LzB4NTAKICAgICAgICBbPDAwMDAwMDAwZDgxNzYz
Nzg+XSBudmttX3V2bW1fbXRoZCsweDY1OC8weDc3MAogICAgICAgIFs8MDAwMDAwMDA0NjNmY2E1
YT5dIG52a21faW9jdGwrMHhkZi8weDE3NwogICAgICAgIFs8MDAwMDAwMDAwYWZjNDk5Nj5dIG52
aWZfb2JqZWN0X210aGQrMHhkNC8weDEwMAogICAgICAgIFs8MDAwMDAwMDAyZjdhNzM4NT5dIG52
aWZfdm1tX21hcCsweGViLzB4MTAwCiAgICAgICAgWzwwMDAwMDAwMGVmMjUzN2VkPl0gbm91dmVh
dV9tZW1fbWFwKzB4NzkvMHhkMAogICAgICAgIFs8MDAwMDAwMDAxNGRkYzBjZj5dIG5vdXZlYXVf
dm1hX25ldysweDE5ZC8weDFjMAogICAgICAgIFs8MDAwMDAwMDBmOTk4ODhhMT5dIG5vdXZlYXVf
Z2VtX29iamVjdF9vcGVuKzB4ZDQvMHgxNDAKICAgICAgICBbPDAwMDAwMDAwOWNkMjU4NjE+XSBk
cm1fZ2VtX2hhbmRsZV9jcmVhdGVfdGFpbCsweGUzLzB4MTYwCiAgICAgICAgWzwwMDAwMDAwMDE5
MTc4NGQ5Pl0gbm91dmVhdV9nZW1faW9jdGxfbmV3KzB4NmUvMHhkMAogICAgICAgIFs8MDAwMDAw
MDAxNTk2NzhkZj5dIGRybV9pb2N0bF9rZXJuZWwrMHg4Yy8weGQwCiAgICAgICAgWzwwMDAwMDAw
MGZiYWE2MTU0Pl0gZHJtX2lvY3RsKzB4MWM0LzB4MzYwCiAgICAgICAgWzwwMDAwMDAwMDY4MzNm
ZTE1Pl0gbm91dmVhdV9kcm1faW9jdGwrMHg2My8weGIwCgpXb25kZXJpbmcgaWYgdGhvc2UgYXJl
IHJlYWwgbGVha3Mgb3IganVzdCBmYWxzZSBwb3NpdGl2ZXMuCgpGb3Igbm93IEkgbWFya2VkIGB0
YWdzJyBhcyBrbWVtbGVha19ub3RfbGVhaygpOyBidXQgbW9zdApsaWtlbHkgaXQncyB1dHRlcmx5
IHdyb25nLgoKQW55IHRob3VnaHRzPwoKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L2NvcmUvbWVtb3J5LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9jb3JlL21lbW9yeS5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9jb3JlL21lbW9yeS5jCmluZGV4IGU4NWEwOGVj
ZDlkYS4uY2Q0NmY1NGM1YzMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2NvcmUvbWVtb3J5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9jb3Jl
L21lbW9yeS5jCkBAIC0yNSw2ICsyNSw3IEBACiAjaW5jbHVkZSA8Y29yZS9tbS5oPgogI2luY2x1
ZGUgPHN1YmRldi9mYi5oPgogI2luY2x1ZGUgPHN1YmRldi9pbnN0bWVtLmg+CisjaW5jbHVkZSA8
bGludXgva21lbWxlYWsuaD4KIAogdm9pZAogbnZrbV9tZW1vcnlfdGFnc19wdXQoc3RydWN0IG52
a21fbWVtb3J5ICptZW1vcnksIHN0cnVjdCBudmttX2RldmljZSAqZGV2aWNlLApAQCAtOTIsNiAr
OTMsNyBAQCBudmttX21lbW9yeV90YWdzX2dldChzdHJ1Y3QgbnZrbV9tZW1vcnkgKm1lbW9yeSwg
c3RydWN0IG52a21fZGV2aWNlICpkZXZpY2UsCiAKIAlyZWZjb3VudF9zZXQoJnRhZ3MtPnJlZmNv
dW50LCAxKTsKIAltdXRleF91bmxvY2soJmZiLT5zdWJkZXYubXV0ZXgpOworCWttZW1sZWFrX25v
dF9sZWFrKHRhZ3MpOwogCSpwdGFncyA9IHRhZ3M7CiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
