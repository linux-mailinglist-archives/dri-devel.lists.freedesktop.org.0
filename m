Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2E245654
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 09:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7816E0E5;
	Sun, 16 Aug 2020 07:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECBE6E0E5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 07:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 55563FB02;
 Sun, 16 Aug 2020 09:13:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUS8qpNbV_7t; Sun, 16 Aug 2020 09:13:44 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id D5083457CB; Sun, 16 Aug 2020 09:13:43 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: panel: rocktech,jh057n00900: Modernize
Date: Sun, 16 Aug 2020 09:13:42 +0200
Message-Id: <60639e670028af7e8ab31379256ba331a1bdf6cc.1597561897.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597561897.git.agx@sigxcpu.org>
References: <cover.1597561897.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSBVc2UgY29tbW9uIHByb3BlcnRpZXMgZnJvbSBwYW5lbC1jb21tb24ueWFtbAotIEluZGVudCBj
b21tZW50IGxpa2UgY29udGVudAotIERvbid0IHByZXNlcnZlIG5ld2xpbmVzIGluIGRlc2NyaXB0
aW9uCi0gSW5kZW50IGV4YW1wbGUgYnkgZm91ciBzcGFjZXMKClNpZ25lZC1vZmYtYnk6IEd1aWRv
IEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvcm9ja3Rl
Y2gsamgwNTduMDA5MDAueWFtbCAgIHwgMzkgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpo
MDU3bjAwOTAwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkwMC55YW1sCmluZGV4IGQ1NzMzZWYzMDk1NDkuLmM5
N2U4OTcwNzM0MmUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gsamgwNTduMDA5
MDAueWFtbApAQCAtOSw5ICs5LDkgQEAgdGl0bGU6IFJvY2t0ZWNoIEpIMDU3TjAwOTAwIDUuNSIg
NzIweDE0NDAgVEZUIExDRCBwYW5lbAogbWFpbnRhaW5lcnM6CiAgIC0gT25kcmVqIEppcm1hbiA8
bWVnaUB4ZmYuY3o+CiAKLWRlc2NyaXB0aW9uOiB8Ci0gICAgICAgICAgICAgUm9ja3RlY2ggSkgw
NTdOMDA5MDAgaXMgYSA3MjB4MTQ0MCBURlQgTENEIHBhbmVsCi0gICAgICAgICAgICAgY29ubmVj
dGVkIHVzaW5nIGEgTUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNlLgorZGVzY3JpcHRpb246CisgIFJv
Y2t0ZWNoIEpIMDU3TjAwOTAwIGlzIGEgNzIweDE0NDAgVEZUIExDRCBwYW5lbAorICBjb25uZWN0
ZWQgdXNpbmcgYSBNSVBJLURTSSB2aWRlbyBpbnRlcmZhY2UuCiAKIGFsbE9mOgogICAtICRyZWY6
IHBhbmVsLWNvbW1vbi55YW1sIwpAQCAtMTksOSArMTksOSBAQCBhbGxPZjoKIHByb3BlcnRpZXM6
CiAgIGNvbXBhdGlibGU6CiAgICAgZW51bToKLSAgICAgICAgIyBSb2NrdGVjaCBKSDA1N04wMDkw
MCA1LjUiIDcyMHgxNDQwIFRGVCBMQ0QgcGFuZWwKKyAgICAgICMgUm9ja3RlY2ggSkgwNTdOMDA5
MDAgNS41IiA3MjB4MTQ0MCBURlQgTENEIHBhbmVsCiAgICAgICAtIHJvY2t0ZWNoLGpoMDU3bjAw
OTAwCi0gICAgICAgICMgWGluZ2JhbmdkYSBYQkQ1OTkgNS45OSIgNzIweDE0NDAgVEZUIExDRCBw
YW5lbAorICAgICAgIyBYaW5nYmFuZ2RhIFhCRDU5OSA1Ljk5IiA3MjB4MTQ0MCBURlQgTENEIHBh
bmVsCiAgICAgICAtIHhpbmdiYW5nZGEseGJkNTk5CiAKICAgcG9ydDogdHJ1ZQpAQCAtMzUsMTMg
KzM1LDkgQEAgcHJvcGVydGllczoKICAgaW92Y2Mtc3VwcGx5OgogICAgIGRlc2NyaXB0aW9uOiBJ
L08gdm9sdGFnZSBzdXBwbHkKIAotICByZXNldC1ncGlvczoKLSAgICBkZXNjcmlwdGlvbjogR1BJ
TyB1c2VkIGZvciB0aGUgcmVzZXQgcGluCi0gICAgbWF4SXRlbXM6IDEKKyAgcmVzZXQtZ3Bpb3M6
IHRydWUKIAotICBiYWNrbGlnaHQ6Ci0gICAgZGVzY3JpcHRpb246IEJhY2tsaWdodCB1c2VkIGJ5
IHRoZSBwYW5lbAotICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9w
aGFuZGxlIgorICBiYWNrbGlnaHQ6IHRydWUKIAogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQpA
QCAtNTcsMTUgKzUzLDE2IEBAIGV4YW1wbGVzOgogICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9n
cGlvL2dwaW8uaD4KIAogICAgIGRzaSB7Ci0gICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKLSAg
ICAgICNzaXplLWNlbGxzID0gPDA+OwotICAgICAgcGFuZWxAMCB7Ci0gICAgICAgIGNvbXBhdGli
bGUgPSAicm9ja3RlY2gsamgwNTduMDA5MDAiOwotICAgICAgICByZWcgPSA8MD47Ci0gICAgICAg
IHZjYy1zdXBwbHkgPSA8JnJlZ18ydjhfcD47Ci0gICAgICAgIGlvdmNjLXN1cHBseSA9IDwmcmVn
XzF2OF9wPjsKLSAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW8zIDEzIEdQSU9fQUNUSVZFX0xP
Vz47Ci0gICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKLSAgICAgIH07CisgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAg
ICAgcGFuZWxAMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gInJvY2t0ZWNoLGpoMDU3bjAw
OTAwIjsKKyAgICAgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgICAgIHZjYy1zdXBwbHkgPSA8
JnJlZ18ydjhfcD47CisgICAgICAgICAgICBpb3ZjYy1zdXBwbHkgPSA8JnJlZ18xdjhfcD47Cisg
ICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmZ3BpbzMgMTMgR1BJT19BQ1RJVkVfTE9XPjsKKyAg
ICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKKyAgICAgICAgfTsKICAgICB9Owor
CiAuLi4KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
