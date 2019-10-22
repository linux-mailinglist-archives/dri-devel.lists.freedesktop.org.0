Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD6E13CA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D106E9B9;
	Wed, 23 Oct 2019 08:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B99C89260
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 11:46:45 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id w16so13181943pfj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 04:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+WgkN+jFywmJXVgKU05Ya5YyFfdneuxiMlHIArCBK5c=;
 b=mbWDrErF6wgmKI/UoEBBFbcbHDY73h2iQ0HjhoUsboiEMFULX4mF8CD3GMHay93p+y
 SKkDG09EYX24t7r4M4+53WS/oWIb+gchfzGJXRUx+8sHbyuJEy9H+ox5mn1gKwBMHrA7
 R4OLIgMGUv5ZOxgrOgykdh7hS09ZeyrN0wJn6kbNP5ohrti7MClfZ9mV0os8TBsqA8gr
 qgrh4ywLNA6/Sp4GsOIcWNRoUFmxUIz+GHZLAPPOvxqn/7paezA/uekyxZGhhGNpfaER
 BqqMk00GHxJZALRkZwqx0yh/V3FSkf5AM2oMtPIE0UE5FyPrJHUz5hhvWyGxzJ4JBh0y
 8XiA==
X-Gm-Message-State: APjAAAXi7VmCaBP+PZ04NdkCSa/1/A2kwmho8VwPqnQNWhiC9IAgMnSA
 Kg3jkjWQBhwLlzpmUgEZQ4x6tRlaUoQN
X-Google-Smtp-Source: APXvYqy/ziqoEer4WzV0Nf0anG6/SXW8LGXGMhUoQ0nDrgt9a/HYV7SzXWbn1s5tu4qK4rUZHL44Bfeti+4c
X-Received: by 2002:a63:9751:: with SMTP id d17mr3414778pgo.427.1571744804770; 
 Tue, 22 Oct 2019 04:46:44 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:44:59 +0800
Message-Id: <20191022114505.196852-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 0/6] ASoC: mediatek: mt8183: support DP audio
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+WgkN+jFywmJXVgKU05Ya5YyFfdneuxiMlHIArCBK5c=;
 b=spSSgg67SiV5zrSWNM7crPZfxyUeNONQ5ZefWzhiBj0HxsRoKAiVIj19ZUUeQ6gfsT
 p+4Vx3dMtOzHcYor+2y11h4PSstY+dErlPoSK4VwkFChu2pMI6IlE4ajoQs/dHLWdMNI
 KqExQndtAmV3SvQUgvYYsUgqjBIpMHH7N1SWBPaU3e4ZX2knnBIgyjUmmn3mU88wGa/7
 UNLtAgnl6E1XT8FDLbZOvvXCXoLG5Rm389sBg1+HX3AmafYXJ8qcPdbZm8yQ2dAhQ0xB
 5f16NXoRuTKjugNcj1Gi8Mo7mKo8ikqrtIeHvhyoy6DMBBkzaDYvBgqKqWkFBU0jE/hl
 JskQ==
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KFRoaXMgc2VyaWVzIGRlcGVuZHMgb24gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3Jr
L3BhdGNoLzExMjY4MTkvCiB3aGljaCBoYXMgbm90IGFwcGxpZWQgdG8gdGhlIG1haW50YWluZXIn
cyB0cmVlIHlldC4pCgpUaGlzIHNlcmllcyBtYWtlcyBtdDgxODMtbXQ2MzU4LXRzM2EyMjctbWF4
OTgzNTcgc3VwcG9ydCBEUCAoZGlzcGxheSBwb3J0KQphdWRpbyBvdXRwdXQuCgpBU29DOiBoZG1p
LWNvZGVjOiBhZGQgUENNIHRyaWdnZXIgb3BlcmF0b3IKLSBhZGQgYSBQQ00gdHJpZ2dlciBjYWxs
YmFjayBpZiBjb2RlYyBkcml2ZXIgaXMgaW50ZXJlc3RlZCBpbiBQQ00gZXZlbnRzLgoKZHJtOiBi
cmlkZ2U6IGl0NjUwNTogYnJpZGdlIHRvIGhkbWktY29kZWMKLSBhZGQgYXVkaW8gZmVhdHVyZSBz
dXBwb3J0IG9mIGl0NjUwNS4KLSBicmlkZ2UgdG8gaGRtaS1jb2RlYyBzbyB0aGF0IEFTb0MgY2Fu
IHVzZSB0aGUgYXVkaW8gZmVhdHVyZS4gCi0gZGVmZXIgdGhlICJlbmFibGluZyIgYWZ0ZXIgcmVj
ZWl2aW5nIFBDTSBTVEFSVCBvciBSRVNVTUUgZXZlbnQuCgpBU29DOiBkdC1iaW5kaW5nczogbXQ4
MTgzOiBhZGQgYSBwcm9wZXJ0eSAibWVkaWF0ZWssaGRtaS1jb2RlYyIKQVNvQzogbWVkaWF0ZWs6
IG10ODE4MzogdXNlIGhkbWktY29kZWMKLSBiaW5kIHRvIGhkbWktY29kZWMgaW4gbXQ4MTgzLW10
NjM1OC10czNhMjI3LW1heDk4MzU3LgoKZHJtOiBicmlkZ2U6IGl0NjUwNTogcmVwb3J0IGNvbm5l
Y3RvciBzdGF0dXMKQVNvQzogbWVkaWF0ZWs6IG10ODE4Mzogc3VwcG9ydCBIRE1JIGphY2sgcmVw
b3J0aW5nCi0gdXNlIHRoZSBtZWNoYW5pc20gZnJvbSB0aGUgZm9sbG93aW5nIHBhdGNoCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL3BpcGVybWFpbC9hbHNhLWRldmVsLzIwMTktU2Vw
dGVtYmVyLzE1NTMwMi5odG1sCiAgdG8gcmVwb3J0IGphY2sgc3RhdHVzIChmcm9tIERSTSB0byBB
U29DKS4KCkFsbGVuIENoZW4gKDEpOgogIGRybTogYnJpZGdlOiBpdDY1MDU6IGJyaWRnZSB0byBo
ZG1pLWNvZGVjCgpUenVuZy1CaSBTaGloICg1KToKICBBU29DOiBoZG1pLWNvZGVjOiBhZGQgUENN
IHRyaWdnZXIgb3BlcmF0b3IKICBBU29DOiBkdC1iaW5kaW5nczogbXQ4MTgzOiBhZGQgYSBwcm9w
ZXJ0eSAibWVkaWF0ZWssaGRtaS1jb2RlYyIKICBBU29DOiBtZWRpYXRlazogbXQ4MTgzOiB1c2Ug
aGRtaS1jb2RlYwogIGRybTogYnJpZGdlOiBpdDY1MDU6IHJlcG9ydCBjb25uZWN0b3Igc3RhdHVz
CiAgQVNvQzogbWVkaWF0ZWs6IG10ODE4Mzogc3VwcG9ydCBIRE1JIGphY2sgcmVwb3J0aW5nCgog
Li4uL3NvdW5kL210ODE4My1tdDYzNTgtdHMzYTIyNy1tYXg5ODM1Ny50eHQgIHwgICAyICsKIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jICAgICAgICAgICB8IDE5MSArKysrKysr
KysrKysrKysrKy0KIGluY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oICAgICAgICAgICAgICAgICAg
ICB8ICAxMyArKwogc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMgICAgICAgICAgICAgICAg
IHwgIDMxICsrKwogc291bmQvc29jL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgICAg
IHwgICAzICstCiAuLi4vbXQ4MTgzL210ODE4My1tdDYzNTgtdHMzYTIyNy1tYXg5ODM1Ny5jICAg
fCAgMzYgKysrLQogNiBmaWxlcyBjaGFuZ2VkLCAyNjYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCgotLSAKMi4yMy4wLjg2Ni5nYjg2OWI5OGQ0Yy1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
