Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C514101AEA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF1C6EBCD;
	Tue, 19 Nov 2019 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807BD6E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f18so2543067lfj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cN+cTWmw5IKMObEA3Y8HAg9N2AlhbhuoYmAREYZlw/4=;
 b=MkYLVfSm8rBIJXpLhnQtAbXYPaJ5tPJXUONxyGFdakIGIWfyjhfLtTRFMSEPeLsjm4
 lob+hfPFJzM9+XiEgWFXPBjXBG55vJSRSiOGGUC7ER92gvIdkg3lTEqzlf6TnSv+W5j5
 4xBLJ2yuZhukJfKFkhjdch+mNxF/Jjp4A7uQy4JzbdkBuSkv2zljjllYfW7EJRi7ku3v
 mrqODrjN1umSfXAi13/VS78F+XsPb1kxQOABTNAvD/gPS+Up1eFJcVILXGmgrS/djjla
 sb3MZ0dXwWhGPOpjXxn73In53T8PsAe77g7ktJ07px8ezDYdz67RKUWUmYR1PQoC/AjI
 58rg==
X-Gm-Message-State: APjAAAW2e+lb26PGH9Ebl45Bg9AQveKKURCiracot4YoTSybKDMa9hj3
 PRUlhFzOLgYoz89+lIlmlEU=
X-Google-Smtp-Source: APXvYqzB8U5iYQKp+sDOt/38fnNxpmw9MZAc1mV8GBofStkZ8gBPo5XdpUpQbn0VIyJos6GrWdV34A==
X-Received: by 2002:a19:8c1c:: with SMTP id o28mr840663lfd.105.1574107533034; 
 Mon, 18 Nov 2019 12:05:33 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:32 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 03/29] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Date: Mon, 18 Nov 2019 23:02:21 +0300
Message-Id: <20191118200247.3567-4-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cN+cTWmw5IKMObEA3Y8HAg9N2AlhbhuoYmAREYZlw/4=;
 b=gKpR3deFRHA9H6ebC9kq34DBn0/xxJSWvPVo3+J7x4cjq8pqJK5o6LsjRx7NySw4FD
 BrOFnOqghNGiDsg2KrHCg+TI3DIIX6GiMeEIEQQ+snUi6B6O0ZOHhtNIrZPBskzLiDPu
 7ZxX+VrcMINUEQ9jmxUPjJ/FZP2o3uEfcGIbJO+BqXZB2KsZwxKlXKtu5l7yvCksMCXR
 jo7P3bhnHMSqE5eVuYsTyBJAC9xDWicmBbnnA31isZWe5MfiLeSdugeXgEf0gE04p62Z
 au42a/HgriX8s4ini4zGtXm84ircbKlRZD13Ag12spQcku6Qqz5JZVqSWldGS8BuFdtp
 wTaw==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBtZW1vcnkgY2xpZW50cyBh
bmQgd2l0aCB0aGUKZXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIuIERvY3VtZW50IG5ldyBpbnRl
cmNvbm5lY3QgcHJvcGVydHkgd2hpY2gKZGVzaWduYXRlcyBtZW1vcnkgY29udHJvbGxlciBhcyBp
bnRlcmNvbm5lY3QgcHJvdmlkZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlk
aWEsdGVncmEzMC1tYy55YW1sICAgICAgIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtbWMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAt
bWMueWFtbAppbmRleCA4NGZkNTdiY2YwZGMuLjU0MzZlNmQ0MjBiYyAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEs
dGVncmEzMC1tYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtbWMueWFtbApAQCAtNTcsNiArNTcsOSBA
QCBwcm9wZXJ0aWVzOgogICAiI2lvbW11LWNlbGxzIjoKICAgICBjb25zdDogMQogCisgICIjaW50
ZXJjb25uZWN0LWNlbGxzIjoKKyAgICBjb25zdDogMQorCiBwYXR0ZXJuUHJvcGVydGllczoKICAg
Il5lbWMtdGltaW5ncy1bMC05XSskIjoKICAgICB0eXBlOiBvYmplY3QKQEAgLTEyMCw2ICsxMjMs
NyBAQCByZXF1aXJlZDoKICAgLSBjbG9jay1uYW1lcwogICAtICIjcmVzZXQtY2VsbHMiCiAgIC0g
IiNpb21tdS1jZWxscyIKKyAgLSAiI2ludGVyY29ubmVjdC1jZWxscyIKIAogYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlCiAKQEAgLTEzNSw2ICsxMzksNyBAQCBleGFtcGxlczoKIAogICAgICAg
ICAjaW9tbXUtY2VsbHMgPSA8MT47CiAgICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsKKyAgICAg
ICAgI2ludGVyY29ubmVjdC1jZWxscyA9IDwxPjsKIAogICAgICAgICBlbWMtdGltaW5ncy0xIHsK
ICAgICAgICAgICAgIG52aWRpYSxyYW0tY29kZSA9IDwxPjsKLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
