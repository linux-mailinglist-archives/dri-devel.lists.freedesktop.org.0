Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E674FD9F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56628991E;
	Sun, 23 Jun 2019 18:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C036E8ED
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 16:07:46 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so7485468qtu.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eD/BLnKc8aB7UFd7f2A4xEVukUQnrHfUaMjiWMGt5Bg=;
 b=giX4ujem3dqyzZnhHpugVjDe1EzyBxTENR9TqRyXsT+8U3PBm+0M2+Ff50fqxXYxQF
 pQrUS764uqDroIahpcGlzCsb/fK8oWSUjH/4HYuobS2IdpkvrjfccVmsilAyCjl6aiar
 GAk8+o1LLy85mvyi0V4Ub59xfm6q4nhesulGhCHXoG97Rwy+WyTfHLvty/GyxrFDuNJD
 T+SQzbSEdnZdFMLgVBGfOu1mk/O7H6CBbpnVvfjhvFCiVC/pE130nKuD5q3/tZMMfwpP
 UE+XMPKkoAvZPWb9yAEoSSVuJNcg7WQgVO4EUfcyDF0LL5gWbiPGvo8lDLkRSW+ctECJ
 ybIg==
X-Gm-Message-State: APjAAAVSLIXvUo1MCuYI2Vb1xry437ctupHo7+kEF8dwFWfhVEsxllRS
 NlPbl8mA7Y+teblMWVF4dlGELg==
X-Google-Smtp-Source: APXvYqyN8obOgngjM1ze5NBpVwYlwPdgcCOGgC8RmHjBdQO3Jon9GXoaxA61odDCrTlCWZj2t2drbA==
X-Received: by 2002:ac8:1b8b:: with SMTP id z11mr16637125qtj.265.1561133265377; 
 Fri, 21 Jun 2019 09:07:45 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id u126sm1448570qkf.132.2019.06.21.09.07.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 09:07:44 -0700 (PDT)
Message-ID: <1561133263.5154.50.camel@lca.pw>
Subject: Re: [RESEND PATCH] gpu/drm_memory: fix a few warnings
From: Qian Cai <cai@lca.pw>
To: akpm@linux-foundation.org
Date: Fri, 21 Jun 2019 12:07:43 -0400
In-Reply-To: <1559934035-3330-1-git-send-email-cai@lca.pw>
References: <1559934035-3330-1-git-send-email-cai@lca.pw>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eD/BLnKc8aB7UFd7f2A4xEVukUQnrHfUaMjiWMGt5Bg=;
 b=Gbh3SafwOA2wOlQr064vPlr/uvl9hy55TuWzCf2mFi/owd+3k5RBD59Qgv3Iokxoky
 3saHokgDnzuHj0moTX+hbPMJCZJSIc2ePrGLoPbQeknba69GkmLsVBGL+Z95ssUj+0Bv
 ZA6h4d1Sj9sbPBSVOkQi3ZGlAZpWCKNmTXCX4hYXVzOv2EkuL6UOUo7Wnmrt0OnlchmX
 503QU3CfhMDCkCarEYg7h0q/NlbymD32YHS/a8WhD2ntb4Fc5ilgUkJHFfb/9R/6q38o
 dQNJK/WO59rKJ/4HAtNHshurZfPETmDHfC4Y9y6tMkywCxmf8GtOq8V3gYPwlW3xbzAT
 vz/Q==
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
Cc: Jonathan Corbet <corbet@lwn.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZy4KCk9uIEZyaSwgMjAxOS0wNi0wNyBhdCAxNTowMCAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6
Cj4gVGhlIG9wZW5pbmcgY29tbWVudCBtYXJrICIvKioiIGlzIHJlc2VydmVkIGZvciBrZXJuZWwt
ZG9jIGNvbW1lbnRzLCBzbwo+IGl0IHdpbGwgZ2VuZXJhdGUgYSB3YXJuaW5nIHdpdGggIm1ha2Ug
Vz0xIi4KPiAKPiBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jOjI6IHdhcm5pbmc6IENhbm5v
dCB1bmRlcnN0YW5kwqDCoCogXGZpbGUKPiBkcm1fbWVtb3J5LmMKPiAKPiBBbHNvLCBzaWxlbmNl
IGEgY2hlY2twYXRjaCB3YXJuaW5nIGJ5IGFkZGluZyBhIGxpY2Vuc2UgaWRlbnRmaXRlciB3aGVy
ZQo+IGl0IGluZGljYXRlcyB0aGUgTUlUIGxpY2Vuc2UgZnVydGhlciBkb3duIGluIHRoZSBzb3Vy
Y2UgZmlsZS4KPiAKPiBXQVJOSU5HOiBNaXNzaW5nIG9yIG1hbGZvcm1lZCBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllciB0YWcgaW4gbGluZSAxCj4gCj4gU2lnbmVkLW9mZi1ieTogUWlhbiBDYWkgPGNh
aUBsY2EucHc+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIHwgMyArKy0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbWVtb3J5LmMKPiBpbmRleCAxMzJmZWY4ZmYxYjYuLjY4MzA0MmM4ZWUyYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tZW1vcnkuYwo+IEBAIC0xLDQgKzEsNSBAQAo+IC0vKioKPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IE1JVAo+ICsvKgo+IMKgICogXGZpbGUgZHJtX21lbW9yeS5jCj4gwqAg
KiBNZW1vcnkgbWFuYWdlbWVudCB3cmFwcGVycyBmb3IgRFJNCj4gwqAgKgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
