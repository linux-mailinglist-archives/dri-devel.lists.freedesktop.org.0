Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E48BA59
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF3A6E147;
	Tue, 13 Aug 2019 13:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7BF6E137
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:33:21 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A10DF9DA;
 Tue, 13 Aug 2019 15:33:19 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
Date: Tue, 13 Aug 2019 16:33:05 +0300
Message-Id: <20190813133311.26441-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813133311.26441-1-laurent.pinchart@ideasonboard.com>
References: <20190813133311.26441-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565703200;
 bh=mB3B4SiX6b2GN4T7smCgiANRIkYwQ4wWZHI5yIyA+eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CFTfUxFmIUhLay3u57vYQO7O4fAsaMNQGkM1E3tcyb/0Jf6jesQheS2cS214MKLgw
 x0mfVhXMWTDGsTZ06538Gnj4CG9KCm57rfwJCXJ28j2mAcOSj0rN+7v7N9zkf+tAQO
 DLiF+Vuh73bu1XiNgxjGR3cokQFCE1ftwzoX1pPw=
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
YXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYyOgoKLSBBZGQgcmVnIGFu
ZCBzcGktbWF4LWZyZXF1ZW5jeSBwcm9wZXJ0aWVzCi0gTWFrZSB0aGUgZXhhbXBsZSBwYXNzIHRo
ZSBjaGVja3MKCkNoYW5nZXMgc2luY2UgdjE6CgotIENvbnZlcnQgdG8gWUFNTAotLS0KIC4uLi9k
aXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwgICAgICAgICB8IDYyICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbmVj
LG5sODA0OGhsMTEueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYWE3ODhlYWEyZjcxCi0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvbmVjLG5sODA0OGhsMTEueWFtbApAQCAtMCwwICsxLDYyIEBACisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwjCiskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0
bGU6IE5FQyBOTDgwNDhITDExIDQuMSIgV1ZHQSBURlQgTENEIHBhbmVsCisKK2Rlc2NyaXB0aW9u
OgorICBUaGUgTkVDIE5MODA0OEhMMTEgaXMgYSA0LjEiIFdWR0EgVEZUIExDRCBwYW5lbCB3aXRo
IGEgMjQtYml0IFJHQiBwYXJhbGxlbAorICBkYXRhIGludGVyZmFjZSBhbmQgYW4gU1BJIGNvbnRy
b2wgaW50ZXJmYWNlLgorCittYWludGFpbmVyczoKKyAgLSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVs
LWNvbW1vbi55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBu
ZWMsbmw4MDQ4aGwxMQorCisgIGxhYmVsOiB0cnVlCisgIHBvcnQ6IHRydWUKKyAgcmVnOiB0cnVl
CisgIHJlc2V0LWdwaW9zOiB0cnVlCisKKyAgc3BpLW1heC1mcmVxdWVuY3k6CisgICAgbWF4aW11
bTogMTAwMDAwMDAKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIHJl
c2V0LWdwaW9zCisgIC0gcG9ydAorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhh
bXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKwor
ICAgIHNwaTAgeworICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAjc2l6ZS1jZWxs
cyA9IDwwPjsKKworICAgICAgbGNkX3BhbmVsOiBwYW5lbEAwIHsKKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJuZWMsbmw4MDQ4aGwxMSI7CisgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgc3BpLW1h
eC1mcmVxdWVuY3kgPSA8MTAwMDAwMDA+OworCisgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlv
NyA3IEdQSU9fQUNUSVZFX0xPVz47CisKKyAgICAgICAgcG9ydCB7CisgICAgICAgICAgbGNkX2lu
OiBlbmRwb2ludCB7CisgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+Owor
ICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgICB9OworICAgIH07CisKKy4uLgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
