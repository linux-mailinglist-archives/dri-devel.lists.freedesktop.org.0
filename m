Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78C88EC0
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 01:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23926E17E;
	Sat, 10 Aug 2019 23:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F319C6E162
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2019 23:10:59 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D36D5E17;
 Sun, 11 Aug 2019 01:10:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
Date: Sun, 11 Aug 2019 02:10:42 +0300
Message-Id: <20190810231048.1921-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565478657;
 bh=hxZ/GXHBi+qa4IwcSpC180c5YAUxNPLiehYoVo7tcg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WXk3oajK7IpU2sQN+oc1aFYAHnV9FIg1Ij1dCSz4Xr2pP+oWPzzyqzCV80lqpC4Lb
 UgisrLwGlPZgs42mubwB26cusv0WNSP67YYPhazMnk3fDLgYKQsErN4/8sSLwa1SI5
 TiTt1AaaqjKH3nU1AY78kKfCTZ1+VqUOTGR02j58=
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE5FQyBOTDgwNDhITDExIGlzIGEgMTAuNGNtIFdWR0EgKDgwMHg0ODApIHBhbmVsIHdpdGgg
YSAyNC1iaXQgUkdCCnBhcmFsbGVsIGRhdGEgaW50ZXJmYWNlIGFuZCBhbiBTUEkgY29udHJvbCBp
bnRlcmZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgoKLSBDb252ZXJ0IHRv
IFlBTUwKLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sICAgICAgICAg
fCA0OSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbmVjLG5s
ODA0OGhsMTEueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmNj
M2Q0MDk3NTgyOAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwKQEAgLTAsMCArMSw0OSBA
QAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4
aGwxMS55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCisKK3RpdGxlOiBORUMgTkw4MDQ4SEwxMSA0LjEiIFdWR0EgVEZUIExDRCBwYW5l
bAorCitkZXNjcmlwdGlvbjoKKyAgVGhlIE5FQyBOTDgwNDhITDExIGlzIGEgNC4xIiBXVkdBIFRG
VCBMQ0QgcGFuZWwgd2l0aCBhIDI0LWJpdCBSR0IgcGFyYWxsZWwKKyAgZGF0YSBpbnRlcmZhY2Ug
YW5kIGFuIFNQSSBjb250cm9sIGludGVyZmFjZS4KKworbWFpbnRhaW5lcnM6CisgIC0gTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgorCithbGxPZjoK
KyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJs
ZToKKyAgICBjb25zdDogbmVjLG5sODA0OGhsMTEKKworICBsYWJlbDogdHJ1ZQorICByZXNldC1n
cGlvczogdHJ1ZQorICBwb3J0OiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAg
LSByZXNldC1ncGlvcworICAtIHBvcnQKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisK
K2V4YW1wbGVzOgorICAtIHwKKyAgICBsY2RfcGFuZWw6IHBhbmVsIHsKKyAgICAgIGNvbXBhdGli
bGUgPSAibmVjLG5sODA0OGhsMTEiOworICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8MTAwMDAw
MDA+OworCisgICAgICByZXNldC1ncGlvcyA9IDwmZ3BpbzcgNyBHUElPX0FDVElWRV9MT1c+Owor
CisgICAgICBwb3J0IHsKKyAgICAgICAgbGNkX2luOiBlbmRwb2ludCB7CisgICAgICAgICAgcmVt
b3RlLWVuZHBvaW50ID0gPCZkcGlfb3V0PjsKKyAgICAgICAgfTsKKyAgICAgIH07CisgICAgfTsK
KworLi4uCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
