Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10091C8321
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7244C6E942;
	Thu,  7 May 2020 07:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517456E8F0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 21:10:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id x4so4078206wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMNrkV2+34A5tU5bw9M2aiiNB9ppVQmACDjtc/0mJbI=;
 b=n+Efog31QV6ez/KjorI5h7hOkEwrYGV/Z4y6Xn6a6an0AVGpBvY+WBuIMwNG4AmGUV
 WOmBf0421+EEyuQXTlP+/alLSTU/ZnAwrU3zsyBuUxia17seA5y6xEY9290kLA+F32nH
 gGdwVr6WR3lpDlE4S9W0QFwk3fd5ueVZ3KIUwkhDpFy1wss91Tl8Mme0w8PZPYS0JU/+
 tjlvmjhyvEEMGSbvDh8U/FGj/4corc/JW8yJ+7zu/oGZMow+9w/7+3mMdYQkkRRVVNJf
 dQfrnm71ONxvh6bcGyPePETn2cDWhWcTxjHhBN4/iRLACBBaRH5m4BRR5JbMiU2/d+vx
 PMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMNrkV2+34A5tU5bw9M2aiiNB9ppVQmACDjtc/0mJbI=;
 b=rD4Y8TaBrnN1AKt5H4makIYLJe5ew186LUzoj0D9V9fTx97IEiNjjGnzMipwECkWz1
 bmp39NtghnqJ0mFHXytYWdIcB4LQ0j3OaqfAGoI/gMQuimkU8SHI+3rEHr6S3aK/AS6Q
 u9PEK8hmmlkQ/inQFx9MEIR2w+s9JDGF5BDlgLhxXDRPHl5HYh/W8zXM9RKVuH7Q++nB
 pPN3/AcUXbbR49p5yYzDpc4IWmLXB0A9w+KQf8LzQTbs/7EdEYe5fS6B33hwU+skDGDn
 XWAgd66ziI8BmxnkyCWeP0UnnVUuP6lH2pCVNDwpm6VYyy63z2ZzaH+SOJ0qIAAiWYsE
 DfEg==
X-Gm-Message-State: AGi0Puainv3MiCMExIC6wA4cuIG9zms93QBE69L124V9+QzonCmY6PNT
 cEY0rBKFw5yuUOxoNNBnDgs=
X-Google-Smtp-Source: APiQypL4m7E2xC6OA9pFcUttY9Vf1hjVi1QM/2nX2qkMTl0FqSgkCHyIQtUOthcYMrM+4gOMI+7RAg==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr6297060wme.174.1588799410947; 
 Wed, 06 May 2020 14:10:10 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id b191sm5135056wmd.39.2020.05.06.14.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 14:10:10 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: 
Subject: [v4 PATCH 2/2] dt-bindings: display: Document ASUS Z00T TM5P5 NT35596
 panel compatible
Date: Wed,  6 May 2020 23:09:56 +0200
Message-Id: <20200506210957.344590-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506210957.344590-1-konradybcio@gmail.com>
References: <20200506210957.344590-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkeWJjaW9AZ21haWwuY29tPgotLS0K
IC4uLi9wYW5lbC9hc3VzLHowMHQtdG01cDUtbnQzNTU5Ni55YW1sICAgICAgICB8IDU2ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvYXN1cyx6MDB0LXRtNXA1LW50MzU1OTYueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FzdXMsejAwdC10bTVwNS1udDM1
NTk2LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9hc3VzLHowMHQtdG01cDUtbnQzNTU5Ni55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMDAuLjA4M2QyYjlkMGM2OWEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hc3VzLHowMHQtdG01cDUt
bnQzNTU5Ni55YW1sCkBAIC0wLDAgKzEsNTYgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9hc3VzLHowMHQtdG01cDUt
bnQzNTU5Ni55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCisKK3RpdGxlOiBBU1VTIFowMFQgVE01UDUgTlQzNTU5NiA1LjUiIDEwODDD
lzE5MjAgTENEIFBhbmVsCisKK21haW50YWluZXJzOgorICAtIEtvbnJhZCBEeWJjaW8gPGtvbnJh
ZHliY2lvQGdtYWlsLmNvbT4KKworZGVzY3JpcHRpb246IHwrCisgIFRoaXMgcGFuZWwgc2VlbXMg
dG8gb25seSBiZSBmb3VuZCBpbiB0aGUgQXN1cyBaMDBUCisgIHNtYXJ0cGhvbmUgYW5kIHdlIGhh
dmUgbm8gc3RyYWlnaHRmb3J3YXJkIHdheSBvZgorICBhY3R1YWxseSBnZXR0aW5nIHRoZSBjb3Jy
ZWN0IG1vZGVsIG51bWJlciwKKyAgYXMgbm8gc2NoZW1hdGljcyBhcmUgcmVsZWFzZWQgcHVibGlj
bHkuCisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIworCitwcm9wZXJ0aWVz
OgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBhc3VzLHowMHQtdG01cDUtbjM1NTk2CisgIHJl
ZzogdHJ1ZQorICByZXNldC1ncGlvczogdHJ1ZQorICB2ZGQtc3VwcGx5OgorICAgICBkZXNjcmlw
dGlvbjogY29yZSB2b2x0YWdlIHN1cHBseQorICB2ZGRpby1zdXBwbHk6CisgICAgIGRlc2NyaXB0
aW9uOiB2ZGRpbyBzdXBwbHkKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZwor
ICAtIHZkZC1zdXBwbHkKKyAgLSB2ZGRpby1zdXBwbHkKKyAgLSByZXNldC1ncGlvcworCithZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKworICAgIGRzaSB7CisgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAg
ICAgICAgcGFuZWxAMCB7CisgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKKworICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFzdXMsejAwdC10bTVwNS1uMzU1OTYiOworCisg
ICAgICAgICAgICAgICAgICAgIHZkZC1zdXBwbHkgPSA8JnBtODkxNl9sOD47CisgICAgICAgICAg
ICAgICAgICAgIHZkZGlvLXN1cHBseSA9IDwmcG04OTE2X2w2PjsKKyAgICAgICAgICAgICAgICAg
ICAgcmVzZXQtZ3Bpb3MgPSA8Jm1zbWdwaW8gMjUgR1BJT19BQ1RJVkVfSElHSD47CisgICAgICAg
ICAgICB9OworICAgIH07Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
