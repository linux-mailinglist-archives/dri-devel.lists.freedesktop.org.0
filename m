Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7681C4EAB
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F8E6E546;
	Tue,  5 May 2020 06:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD856E488
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 19:40:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id g13so499501wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 12:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEW76UZB/sZtEFwmy764PGyYDv4AC7eZ6iGbT8XBec0=;
 b=sVKlAInB9QaiGr8TxrDwVwGVUTMk3Z2sanuBv38O6D7p5wDtfW4OTPur0/IqpcUlFU
 k2HH34g5fWr6DkHSmByla0c2aSeqrAJ3pjufHlf4EhwUZFb26j4GM7c4K9vIc1sWEKv3
 ru1D26JuI3qPR9ITDCBTxONyYXPeKHCagzRRoKl95IYfpopUPoKm0lc6UC2eX3RtgWsK
 /NG29twXUdSZ7qQobLBM6MRFaOdoKV5s2llvFFFe2fulgMYe5E/FXpK6nDTSLSDylxgs
 FlDk/TpcItC2FWJ18TEsMfi0kUh+L8tIXYr/QLtZOmRbM1mVzMLq19Ru2tJLheZffZNv
 RVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEW76UZB/sZtEFwmy764PGyYDv4AC7eZ6iGbT8XBec0=;
 b=dZM2iZS7NpRKNUpqYT/vOKjMdoPuovCkReuS1BSBuwaKqHZqlRoprT01IqjRUzP0vp
 4HXm59YvplZHhs68xBzle+8S5YRfaHOvC+loW3EWx2mHtINSOlVYgE5yIKaztUJVXzQo
 ur8JhC5mQ0MSI8wahk/fwtVwBE6KlNtR1qpYToqmyRLntD9Yqe833yZGkQFnwS5w0Oxr
 j7s+fdzCqEpQil9fDxH8dJ4fnCB5AkkYHKBIV154KClEqR5L6vgK6cwvR5Qti2QzYHEW
 wryrOaOrSpfuooUGAoxlL60UErWq83dFqcsVksDC09ETcpLREbTIQTh6K3+sX4LhxP3L
 s6kg==
X-Gm-Message-State: AGi0Pub5FAOLABDMNz8c3vRKV+/0yKLRhJ1JsDB1rLgoojn6272OYz/m
 6VGZamcHOXlpw82jhOQ1vjg=
X-Google-Smtp-Source: APiQypIW3ogpPeWwO8fPmBAkiTyDt7oumahho6djwlkn0Hrgx03BjpfCvOGxXwqYYxpGHyc3gI9yOw==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr1011368wru.390.1588621206417; 
 Mon, 04 May 2020 12:40:06 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id p7sm20631312wrf.31.2020.05.04.12.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 12:40:06 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: 
Subject: [v2 PATCH 2/2] dt-bindings: display: Document ASUS Z00T TM5P5 NT35596
 panel compatible
Date: Mon,  4 May 2020 21:38:14 +0200
Message-Id: <20200504193816.126299-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200504193816.126299-1-konradybcio@gmail.com>
References: <20200504193816.126299-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
IC4uLi9kaXNwbGF5L3BhbmVsL2FzdXMsejAwdC10bTVwNS1uMzU1OTYueWFtbCB8IDU2ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvYXN1cyx6MDB0LXRtNXA1LW4zNTU5Ni55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXN1cyx6MDB0LXRtNXA1LW4zNTU5
Ni55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
YXN1cyx6MDB0LXRtNXA1LW4zNTU5Ni55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMDAuLmFhODk0MGU0OTNlYjEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hc3VzLHowMHQtdG01cDUtbjM1
NTk2LnlhbWwKQEAgLTAsMCArMSw1NiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3RtNXA1LG50MzU1OTYueWFtbCMK
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwor
Cit0aXRsZTogQVNVUyBaMDBUIFRNNVA1IE5UMzU1OTYgNS41IiAxMDgww5cxOTIwIExDRCBQYW5l
bAorCittYWludGFpbmVyczoKKyAgLSBLb25yYWQgRHliY2lvIDxrb25yYWR5YmNpb0BnbWFpbC5j
b20+CisKK2Rlc2NyaXB0aW9uOiB8KworICBUaGlzIHBhbmVsIHNlZW1zIHRvIG9ubHkgYmUgZm91
bmQgaW4gdGhlIEFzdXMgWjAwVAorICBzbWFydHBob25lIGFuZCB3ZSBoYXZlIG5vIHN0cmFpZ2h0
Zm9yd2FyZCB3YXkgb2YKKyAgYWN0dWFsbHkgZ2V0dGluZyB0aGUgY29ycmVjdCBtb2RlbCBudW1i
ZXIsCisgIGFzIG5vIHNjaGVtYXRpY3MgYXJlIHJlbGVhc2VkIHB1YmxpY2x5LgorCithbGxPZjoK
KyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJs
ZToKKyAgICBjb25zdDogYXN1cyx6MDB0LXRtNXA1LW4zNTU5NgorICByZWc6IHRydWUKKyAgcmVz
ZXQtZ3Bpb3M6IHRydWUKKyAgdmRkLXN1cHBseToKKyAgICAgZGVzY3JpcHRpb246IGNvcmUgdm9s
dGFnZSBzdXBwbHkKKyAgdmRkaW8tc3VwcGx5OgorICAgICBkZXNjcmlwdGlvbjogdmRkaW8gc3Vw
cGx5CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSB2ZGQtc3VwcGx5
CisgIC0gdmRkaW8tc3VwcGx5CisgIC0gcmVzZXQtZ3Bpb3MKKworYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Z3Bpby9ncGlvLmg+CisKKyAgICBkc2kgeworICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgICAgIHBhbmVsQDAg
eworICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47CisKKyAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJhc3VzLHowMHQtdG01cDUtbjM1NTk2IjsKKworICAgICAgICAgICAgICAg
ICAgICB2ZGQtc3VwcGx5ID0gPCZwbTg5MTZfbDg+OworICAgICAgICAgICAgICAgICAgICB2ZGRp
by1zdXBwbHkgPSA8JnBtODkxNl9sNj47CisgICAgICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9z
ID0gPCZtc21ncGlvIDI1IEdQSU9fQUNUSVZFX0hJR0g+OworICAgICAgICAgICAgfTsKKyAgICB9
OwotLSAKMi4yNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
