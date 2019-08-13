Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A38C1DE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 22:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865036E153;
	Tue, 13 Aug 2019 20:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461B6E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 20:11:13 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F3749DA;
 Tue, 13 Aug 2019 22:11:10 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
Date: Tue, 13 Aug 2019 23:10:55 +0300
Message-Id: <20190813201101.30980-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813201101.30980-1-laurent.pinchart@ideasonboard.com>
References: <20190813201101.30980-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565727070;
 bh=x63JtW2hb3Ko38PYZjWa/B253ZNtH21d1c/93J8I+yc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hztVNnTqOCXOuFouIjsBNbpdY+TuvrKs0P12XXfZNw6OoI15K1TP3hEKYG8lg5OXO
 3DWCjCFqVsHyYFuyie+kIBIEs3eS8K6cHZqTp5owSHerTUTBAjC4BeHCe0q9E20JwS
 C5FNanjtpSBmz955mWxIg+ExMf6/D1X9RRcS1efk=
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE5FQyBOTDgwNDhITDExIGlzIGEgMTAuNGNtIFdWR0EgKDgwMHg0ODApIHBhbmVsIHdpdGgg
YSAyNC1iaXQgUkdCCnBhcmFsbGVsIGRhdGEgaW50ZXJmYWNlIGFuZCBhbiBTUEkgY29udHJvbCBp
bnRlcmZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKCi0gQWRkIHJlZyBhbmQgc3BpLW1heC1mcmVx
dWVuY3kgcHJvcGVydGllcwotIE1ha2UgdGhlIGV4YW1wbGUgcGFzcyB0aGUgY2hlY2tzCgpDaGFu
Z2VzIHNpbmNlIHYxOgoKLSBDb252ZXJ0IHRvIFlBTUwKLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9u
ZWMsbmw4MDQ4aGwxMS55YW1sICAgICAgICAgfCA2MiArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlh
bWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbmVjLG5sODA0OGhsMTEueWFtbApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmFhNzg4ZWFhMmY3MQotLS0gL2Rldi9udWxsCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxubDgw
NDhobDExLnlhbWwKQEAgLTAsMCArMSw2MiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sIworJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBORUMgTkw4MDQ4
SEwxMSA0LjEiIFdWR0EgVEZUIExDRCBwYW5lbAorCitkZXNjcmlwdGlvbjoKKyAgVGhlIE5FQyBO
TDgwNDhITDExIGlzIGEgNC4xIiBXVkdBIFRGVCBMQ0QgcGFuZWwgd2l0aCBhIDI0LWJpdCBSR0Ig
cGFyYWxsZWwKKyAgZGF0YSBpbnRlcmZhY2UgYW5kIGFuIFNQSSBjb250cm9sIGludGVyZmFjZS4K
KworbWFpbnRhaW5lcnM6CisgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMK
KworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogbmVjLG5sODA0OGhsMTEK
KworICBsYWJlbDogdHJ1ZQorICBwb3J0OiB0cnVlCisgIHJlZzogdHJ1ZQorICByZXNldC1ncGlv
czogdHJ1ZQorCisgIHNwaS1tYXgtZnJlcXVlbmN5OgorICAgIG1heGltdW06IDEwMDAwMDAwCisK
K3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSByZXNldC1ncGlvcworICAt
IHBvcnQKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwK
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+CisKKyAgICBzcGkwIHsKKyAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAg
ICAgIGxjZF9wYW5lbDogcGFuZWxAMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAibmVjLG5sODA0
OGhsMTEiOworICAgICAgICByZWcgPSA8MD47CisgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0g
PDEwMDAwMDAwPjsKKworICAgICAgICByZXNldC1ncGlvcyA9IDwmZ3BpbzcgNyBHUElPX0FDVElW
RV9MT1c+OworCisgICAgICAgIHBvcnQgeworICAgICAgICAgIGxjZF9pbjogZW5kcG9pbnQgewor
ICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkcGlfb3V0PjsKKyAgICAgICAgICB9Owor
ICAgICAgICB9OworICAgICAgfTsKKyAgICB9OworCisuLi4KLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
