Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B488EC5
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 01:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1A6E181;
	Sat, 10 Aug 2019 23:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E84B6E17E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2019 23:10:59 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37A6772E;
 Sun, 11 Aug 2019 01:10:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/9] dt-bindings: Add legacy 'toppoly' vendor prefix
Date: Sun, 11 Aug 2019 02:10:41 +0300
Message-Id: <20190810231048.1921-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565478656;
 bh=Ug3yWFOOgQzT+CS1p770Upkgsu/Mxl1CwnEtn6i4NvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tf1DOk4+0Lh09QIDfvdQGBJSjKjOadAFUNtD+8rqBCgf0cvPuhkivwYIGdmJCUnw8
 DBGNgGSjWOxAPcat+C0AcNW+Eo5uDEc+6ZtA/MuhgF0H/ZBgp6bgTZSBiXPr8da8Y1
 mAz9nWiKa4PgEiYzw8eifvJ9eDoI/yuxoUNEh5K4=
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

VGhlICd0b3Bwb2x5JyB2ZW5kb3IgcHJlZml4IGlzIGluIHVzZSBhbmQgcmVmZXJzIHRvIFRQTywg
d2hvc2UgRFQgdmVuZG9yCnByZWZpeCBpcyBhbHJlYWR5IGRlZmluZWQgYXMgJ3RwbycuIEFkZCAn
dG9wcG9seScgYXMgYW4gYWx0ZXJuYXRpdmUgYW5kCmRvY3VtZW50IGl0IGFzIGxlZ2FjeS4KClNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CgotIE1hcmsgdGhlIHByZWZpeCBhcyBkZXBy
ZWNhdGVkCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVm
aXhlcy55YW1sIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwKaW5kZXggNWVmZGRiZmYyNDMwLi4yOWRjYzZmOGE2NGEgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAg
LTkzNSw2ICs5MzUsOSBAQCBwYXR0ZXJuUHJvcGVydGllczoKICAgICBkZXNjcmlwdGlvbjogVGVj
b24gTWljcm9wcm9jZXNzb3IgVGVjaG5vbG9naWVzLCBMTEMuCiAgICJedG9wZWV0LC4qIjoKICAg
ICBkZXNjcmlwdGlvbjogVG9wZWV0CisgICJedG9wcG9seSwuKiI6CisgICAgZGVzY3JpcHRpb246
IFRQTyAoZGVwcmVjYXRlZCwgdXNlIHRwbykKKyAgICBkZXByZWNhdGVkOiB0cnVlCiAgICJedG9y
YWRleCwuKiI6CiAgICAgZGVzY3JpcHRpb246IFRvcmFkZXggQUcKICAgIl50b3NoaWJhLC4qIjoK
LS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
