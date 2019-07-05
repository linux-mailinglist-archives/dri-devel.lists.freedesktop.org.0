Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8460A6C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 18:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45C36E506;
	Fri,  5 Jul 2019 16:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044956E506
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:42:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k20so20317430ios.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsofIvvvlgyPGjRrCqOhd2B5EfQ76NdrYwJSPILmUYU=;
 b=IpEFF4TqfvAQO5K9KNEwxkBYlMHwHJVtuanTqMBVsnPcWVOgkGFhwxdImjGAWOPoI2
 VKbox8nf/JsPH7Lk2PN+fXfW8z81pJd7zeI3i4Hy1djWR+RQDs5TkCokBTKa7xpMkTPp
 9N2oyomF3TZChgIkt8Q1I+qe49WjzEgZbRloUz/A/FGFW4L4u1+jHz2J69UsgvB12Nhf
 j4EMFniBihIGpEj1eFzADQfK3Zi5M2HzuloNidJKrH7jAKsB2sJg4W90vMUPIceZr6OL
 /TPU7QWfFUOE65Zs5axICWShFk/eRzjFIGyAciOUq870SgjLIpJMOFZ+iW6kJC4Du8ow
 0eCw==
X-Gm-Message-State: APjAAAVhcejjbvzgMtP4qltaPoEPuP0TbVmaNpxw4rzwddv6eXSNEQv2
 mzT6PcOr4mO2AXb2PT0ahYda5Jo=
X-Google-Smtp-Source: APXvYqxj4IttrNLgYXfcBVNobwfb+KUKqyRv0sq9vrDvePX9xWww2ZDDrFdc58G7d3dvFLUuY0ZR9g==
X-Received: by 2002:a6b:dd18:: with SMTP id f24mr3652278ioc.97.1562344946800; 
 Fri, 05 Jul 2019 09:42:26 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id b8sm6878104ioj.16.2019.07.05.09.42.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:42:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 02/13] dt-bindings: display: Convert ampire,
 am-480272h3tmqw-t01h panel to DT schema
Date: Fri,  5 Jul 2019 10:42:10 -0600
Message-Id: <20190705164221.4462-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705164221.4462-1-robh@kernel.org>
References: <20190705164221.4462-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoIHBhbmVsIGJpbmRpbmcgdG8g
RFQgc2NoZW1hLgoKQ2M6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CkNj
OiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpSZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
QWNrZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL3BhbmVsL2FtcGlyZSxh
bS00ODAyNzJoM3RtcXctdDAxaC50eHQgICAgIHwgMjYgLS0tLS0tLS0tLS0tCiAuLi4vcGFuZWwv
YW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnlhbWwgICAgfCA0MiArKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2FtcGlyZSxhbS00ODAyNzJoM3RtcXctdDAxaC50eHQKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBp
cmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxhbS00ODAyNzJoM3RtcXct
dDAxaC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9hbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCA2ODEyMjgwY2IxMDkuLjAwMDAwMDAwMDAwMAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQw
MWgudHh0CisrKyAvZGV2L251bGwKQEAgLTEsMjYgKzAsMCBAQAotQW1waXJlIEFNLTQ4MDI3Mkgz
VE1RVy1UMDFIIDQuMyIgV1FWR0EgVEZUIExDRCBwYW5lbAotCi1UaGlzIGJpbmRpbmcgaXMgY29t
cGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVk
Ci1pbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5LgotCi1SZXF1aXJlZCBwcm9w
ZXJ0aWVzOgotLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImFtcGlyZSxhbS00ODAyNzJoM3RtcXct
dDAxaCIKLQotT3B0aW9uYWwgcHJvcGVydGllczoKLS0gcG93ZXItc3VwcGx5OiByZWd1bGF0b3Ig
dG8gcHJvdmlkZSB0aGUgc3VwcGx5IHZvbHRhZ2UKLS0gZW5hYmxlLWdwaW9zOiBHUElPIHBpbiB0
byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgcGFuZWwKLS0gYmFja2xpZ2h0OiBwaGFuZGxlIG9mIHRo
ZSBiYWNrbGlnaHQgZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbAotCi1PcHRpb25hbCBub2Rl
czoKLS0gVmlkZW8gcG9ydCBmb3IgUkdCIGlucHV0LgotCi1FeGFtcGxlOgotCXBhbmVsX3JnYjog
cGFuZWwtcmdiIHsKLQkJY29tcGF0aWJsZSA9ICJhbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgi
OwotCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW9hIDggMT47Ci0JCXBvcnQgewotCQkJcGFuZWxfaW5f
cmdiOiBlbmRwb2ludCB7Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZjb250cm9sbGVyX291dF9y
Z2I+OwotCQkJfTsKLQkJfTsKLQl9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBp
cmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLmM2ZTMzZTdmMzZkMAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxhbS00ODAyNzJoM3Rt
cXctdDAxaC55YW1sCkBAIC0wLDAgKzEsNDIgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Rpc3BsYXkvcGFuZWwvYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnlhbWwjCiskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0
bGU6IEFtcGlyZSBBTS00ODAyNzJIM1RNUVctVDAxSCA0LjMiIFdRVkdBIFRGVCBMQ0QgcGFuZWwK
KworbWFpbnRhaW5lcnM6CisgIC0gWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNv
bT4KKyAgLSBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgorCithbGxPZjoKKyAg
LSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToK
KyAgICBjb25zdDogYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoCisKKyAgcG93ZXItc3VwcGx5
OiB0cnVlCisgIGVuYWJsZS1ncGlvczogdHJ1ZQorICBiYWNrbGlnaHQ6IHRydWUKKyAgcG9ydDog
dHJ1ZQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgcGFuZWxfcmdiOiBwYW5lbCB7CisgICAg
ICBjb21wYXRpYmxlID0gImFtcGlyZSxhbS00ODAyNzJoM3RtcXctdDAxaCI7CisgICAgICBlbmFi
bGUtZ3Bpb3MgPSA8JmdwaW9hIDggMT47CisgICAgICBwb3J0IHsKKyAgICAgICAgcGFuZWxfaW5f
cmdiOiBlbmRwb2ludCB7CisgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZjb250cm9sbGVy
X291dF9yZ2I+OworICAgICAgICB9OworICAgICAgfTsKKyAgICB9OworCisuLi4KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
