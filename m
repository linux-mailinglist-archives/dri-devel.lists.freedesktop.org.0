Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9F2B31F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 13:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E157E89873;
	Mon, 27 May 2019 11:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D9589873
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:21:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id i3so15775180wml.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 04:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wdUayi15yccy1ziKqdtfwpM4ptzpv1f4RC4mxkjbWJU=;
 b=D/iLxPC++RLiSpIpnkOGMfYJMlshIKrl4V36Qsy97Os/2obFxd6ImRghU64cUkfwrX
 qOF/OA75NY9oVAh16DeWdNxh3Cg9Q/aeTxs7n4MMek+khK8gdgl4gYMpCiE1K0yEc1/n
 gFULZS600gR9O/4yjvIgnAt3+4kkTUvgUWRCSO5E574MMC8C3uXwBEUoVSJHFnrUC6ng
 IvDwpFTleK/gBe1x8J/NoTDPFcq5lkUFk6EWuxHfCX6X3xEP/Fnnx3/pjZMv0PGpfeuU
 AGI2HBozey2+5qRj5IymtxmyME23iz9JcUU80vicFLe1Qz1uKa9GyKH4N3WIt61SxjVm
 HqHg==
X-Gm-Message-State: APjAAAVc47/WkpNNx449K/A9Kvn+q6dIK2gqpMc0021VPi3BOObrQYVy
 fNQG6rZyIPgOZQB2bOKjJJs=
X-Google-Smtp-Source: APXvYqwK7NQGKbmRo906d3h9EmNKvxNxM5VZp0y8SYArexxTJ2q8k4VHuSgfslLovoqPTMeFMCdqhw==
X-Received: by 2002:a1c:9616:: with SMTP id y22mr9518308wmd.73.1558956097608; 
 Mon, 27 May 2019 04:21:37 -0700 (PDT)
Received: from smart-ThinkPad-T410 ([89.187.177.74])
 by smtp.gmail.com with ESMTPSA id p6sm1637555wrn.67.2019.05.27.04.21.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 04:21:35 -0700 (PDT)
Date: Mon, 27 May 2019 15:51:29 +0430
From: Nasser <afshin.nasser@gmail.com>
To: vikasmpatil@gmail.com
Subject: [ADV7393] DRM Encoder Slave or DRM Bridge
Message-ID: <20190527112129.GA6635@smart-ThinkPad-T410>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+kt3u11xsbjhZ2mNRfJUBbqtrPaUJHsEMk9CfzLdEED=xBXSw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=wdUayi15yccy1ziKqdtfwpM4ptzpv1f4RC4mxkjbWJU=;
 b=gcKOUfHVhXdg2HTdAPx/TRim7e+7Ca/RodybArl+9AguFnQjQtYHgL7oGr/yJ55ETQ
 IKk4E//BwwfIpXymrClS080IbnSSq1qGTskkSa4sM6frCGson8+kc9Ci6KDGOJ2mEZPW
 Jk3h7jGJZNl1xS3Y6dbk642l3GKOoq9FKWGQ4IZKDpdPM8sbqSY1uE7Hlz1WslmLqj6w
 nJ96aA2rXMMu5xgKF9SVfjMfiyhSbD6Z2+WDz5PoQ4VG7Bf4HGAv+xNPQatuRfwQJrQd
 c8oMmM4m9SjkXMeMxqPacVfpPtORV2TwH/SEWu7LVcmU8lY2UMS7N1til7uWMu19nK2t
 quJQ==
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
Cc: tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IFZpa2FzaCwKCiBBcyBpdCdzIGJlZW4gcXVpdGUgYSB3aGlsZSwgSSB3YW50IHRvIGtub3cgaWYg
dGhlIHByb2JsZW0gaXMgc29sdmVkCiBzdWNjZXNzZnVsbHkgSWYgc28sIGNvdWxkIHlvdSBwbGVh
c2Ugc2hlZCBzb21lIGxpZ2h0IG9uIHRoZSBwcm9ibGVtCiBzb2x2aW5nIHBhdGg/CgogV29ya2lu
ZyBvbiBhIGN1c3RvbSBoYXJkd2FyZSBiYXNlZCBvbiBUSSBBTTU3MjgsIGFuZCBoYXZpbmcgdGhl
IHNhbWUKIHByb2JsZW0gYXQgaGFuZCwgSSBqdXN0IHdhcyBjdXJpb3VzIGlmIHNvbWUgb25lIGhh
cyBiZWVuIGFibGUgdG8gd3JpdGUKIGEgb21hcGRybSBiYXNlZCBkcml2ZXIgZm9yIEFEVjczOTMu
CgogQW55IGhlbHAgd291bGQgZ3JlYXRseSBiZSBhcHByZWNpYXRlZC4KCiBLaW5kIFJlZ2FyZHMs
CiBOYXNzZXIgQWZzaGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
