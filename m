Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F45EBBE9E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 00:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE36289C1B;
	Mon, 23 Sep 2019 22:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD0189C1B;
 Mon, 23 Sep 2019 22:49:51 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id z19so15462730ior.0;
 Mon, 23 Sep 2019 15:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=K/5/nBI2LwVM8sH5yu7LNoJ94uOcWWQp+DNw+x7Vdz4=;
 b=nCNUQsFLBDdL++STig95S1+CLa37bR5qXLut4v+nVOCROvUnCKecBBJOQEqy3cb9wj
 3vocCNXphCzfdee6VhVsVAPxZ6JosbJJVp2TepDj7Rxk8C2Pcrf5mQt2bVYln247anxk
 97jTeJ5Pc7NV6yHp42lwiLqGt0rjEWp606tR1aAojHDwjfJsXsWsIIDhfNA2JaL4xUrA
 9YZTm+7Qol7Qb1gvDZE/UuaMDA3Hdpu5EjAWi2v1L3xoHnnPu6O3kS7LI4A5RGJ9dI4O
 q3+stB8+fnwoVbSRbP3Dmvx8ItFfcjeKFb58EevwH3sbmHU4R7OujXc/GK7egOA1kNEg
 V0Yg==
X-Gm-Message-State: APjAAAVl+uCFObB9+RIYBMQbepuD0YmP2pAN39LBuX7GRFKwJAmkA6wQ
 /SKCrIgbA085ex1j9zByZZUyS8yEnqE18lIzc88=
X-Google-Smtp-Source: APXvYqwAFwVLlMGmxREpretxENWC42PqLSKJ375fNJWHO7xIqBoO4tdAjrPJtjnIeFyh7UFD+o9RLIdq8ZXTQeLztVE=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr2010394iof.58.1569278990853; 
 Mon, 23 Sep 2019 15:49:50 -0700 (PDT)
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Mon, 23 Sep 2019 17:49:39 -0500
Message-ID: <CAHCN7xKxNZ6DXcx5Vf=M+LDE3oXrufRT0yC72jtqEN1R=G3qfw@mail.gmail.com>
Subject: i.MX6Q Etnaviv errors
To: arm-soc <linux-arm-kernel@lists.infradead.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=K/5/nBI2LwVM8sH5yu7LNoJ94uOcWWQp+DNw+x7Vdz4=;
 b=tMuULmesdBErrEgUTz6TCE77Sc+sdedCbweOkmyVB4qYh3n6XqWqMnCgrmq4KjMYxb
 yWB7CjJVxdvIhGtpb1+G5CkVuoJA1I+gEMr9p1cdls7daMpxNpK4oLIyA0VB5gFHhaKQ
 AL3n4odgzAeaP+HCOIlQq3yu8B8B88Br8hGcTBJOERA/QlbsZdlOCy/MbxjtG1ykis6s
 7nak85xtf7bTWl3JcoT3Rw/rnGYhs+MjpdXDygLw4vj1NVexptZXJzB3tQY7A9ugk3S/
 nfPLLKKrYTf6Q44MnmgcvhD5xkexV8wwaeASK4DNIOSbsvH6XqWKKSuDnEhuEcTQMjd+
 4NGQ==
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

SSB0aXJlZCB0byBydW4gc29tZSB0ZXN0cyBvbiA1LjQgYW5kIEkgd2FzIGdldHRpbmcgZXJyb3Jz
LiAgSSB3ZW50IGFsbAp0aGUgd2F5IGJhY2sgdG8gNS4wIGFuZCBJIGdldCBlcnJvcnMuIDQuMTkg
c2VlbXMgdG8gd29yayBqdXN0IGZpbmUuCgpJIHdhcyBjdXJpb3VzIHRvIGtub3cgaWYgYW55b25l
IGlzIHNlZWluZyBlcnJvcnMuICBJJ2xsIGJpc2VjdAp0b21vcnJvdywgYnV0IEkgdGhvdWdodCBJ
J2QgYXNrIGJlZm9yZSBJIGdvdCB0b28gZmFyLgoKIyBMSUJHTF9ERUJVRz12ZXJib3NlIGdsbWFy
azItZXMyLWRybQoKZHJtT3BlbkRldmljZTogbm9kZSBuYW1lIGlzIC9kZXYvZHJpL2NhcmQwCmRy
bU9wZW5EZXZpY2U6IG9wZW4gcmVzdWx0IGlzIDMsIChPSykKZHJtT3BlbkRldmljZTogbm9kZSBu
YW1lIGlzIC9kZXYvZHJpL2NhcmQwCmRybU9wZW5EZXZpY2U6IG9wZW4gcmVzdWx0IGlzIDMsIChP
SykKZHJtT3BlbkRldmljZTogbm9kZSBuYW1lIGlzIC9kZXYvZHJpL2NhcmQxCmRybU9wZW5EZXZp
Y2U6IG9wZW4gcmVzdWx0IGlzIDMsIChPSykKZHJtT3BlbkRldmljZTogbm9kZSBuYW1lIGlzIC9k
ZXYvZHJpL2NhcmQyCmRybU9wZW5EZXZpY2U6IG5vZGUgbmFtZSBpcyAvZGV2L2RyaS9jYXJkMwpk
cm1PcGVuRGV2aWNlOiBub2RlIG5hbWUgaXMgL2Rldi9kcmkvY2FyZDQKZHJtT3BlbkRldmljZTog
bm9kZSBuYW1lIGlzIC9kZXYvZHJpL2NhcmQ1CmRybU9wZW5EZXZpY2U6IG5vZGUgbmFtZSBpcyAv
ZGV2L2RyaS9jYXJkNgpkcm1PcGVuRGV2aWNlOiBub2RlIG5hbWUgaXMgL2Rldi9kcmkvY2FyZDcK
ZHJtT3BlbkRldmljZTogbm9kZSBuYW1lIGlzIC9kZXYvZHJpL2NhcmQ4CmRybU9wZW5EZXZpY2U6
IG5vZGUgbmFtZSBpcyAvZGV2L2RyaS9jYXJkOQpkcm1PcGVuRGV2aWNlOiBub2RlIG5hbWUgaXMg
L2Rldi9kcmkvY2FyZDEwCmRybU9wZW5EZXZpY2U6IG5vZGUgbmFtZSBpcyAvZGV2L2RyaS9jYXJk
MTEKZHJtT3BlbkRldmljZTogbm9kZSBuYW1lIGlzIC9kZXYvZHJpL2NhcmQxMgpkcm1PcGVuRGV2
aWNlOiBub2RlIG5hbWUgaXMgL2Rldi9kcmkvY2FyZDEzCmRybU9wZW5EZXZpY2U6IG5vZGUgbmFt
ZSBpcyAvZGV2L2RyaS9jYXJkMTQKZHJtT3BlbkRldmljZTogbm9kZSBuYW1lIGlzIC9kZXYvZHJp
L2NhcmQxNQpkcm1PcGVuRGV2aWNlOiBub2RlIG5hbWUgaXMgL2Rldi9kcmkvY2FyZDAKZHJtT3Bl
bkRldmljZTogb3BlbiByZXN1bHQgaXMgMywgKE9LKQpkcm1PcGVuRGV2aWNlOiBub2RlIG5hbWUg
aXMgL2Rldi9kcmkvY2FyZDAKZHJtT3BlbkRldmljZTogb3BlbiByZXN1bHQgaXMgMywgKE9LKQpk
cm1HZXRCdXNpZCByZXR1cm5lZCAnJwpsaWJHTDogQ2FuJ3Qgb3BlbiBjb25maWd1cmF0aW9uIGZp
bGUgL2V0Yy9kcmlyYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeS4KbGliR0w6IENhbid0IG9w
ZW4gY29uZmlndXJhdGlvbiBmaWxlIC9yb290Ly5kcmlyYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeS4KTUVTQS1MT0FERVI6IGZhaWxlZCB0byBvcGVuIGlteC1kcm0gKHNlYXJjaCBwYXRocyAv
dXNyL2xpYi9kcmkpCmZhaWxlZCB0byBsb2FkIGRyaXZlcjogaW14LWRybQpsaWJHTDogQ2FuJ3Qg
b3BlbiBjb25maWd1cmF0aW9uIGZpbGUgL2V0Yy9kcmlyYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeS4KbGliR0w6IENhbid0IG9wZW4gY29uZmlndXJhdGlvbiBmaWxlIC9yb290Ly5kcmlyYzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeS4KbGliR0w6IENhbid0IG9wZW4gY29uZmlndXJhdGlv
biBmaWxlIC9ldGMvZHJpcmM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkuCmxpYkdMOiBDYW4n
dCBvcGVuIGNvbmZpZ3VyYXRpb24gZmlsZSAvcm9vdC8uZHJpcmM6IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkuCkVycm9yOiBlZ2xDcmVhdGVXaW5kb3dTdXJmYWNlIGZhaWxlZCB3aXRoIGVycm9y
OiAweDMwMDkKRXJyb3I6IGVnbENyZWF0ZVdpbmRvd1N1cmZhY2UgZmFpbGVkIHdpdGggZXJyb3I6
IDB4MzAwOQpFcnJvcjogQ2FudmFzR2VuZXJpYzogSW52YWxpZCBFR0wgc3RhdGUKRXJyb3I6IG1h
aW46IENvdWxkIG5vdCBpbml0aWFsaXplIGNhbnZhcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
