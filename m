Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58159A3294
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE146E315;
	Fri, 30 Aug 2019 08:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id B367B6E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:38:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25249633"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 20:38:50 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BCCF4002C30;
 Thu, 29 Aug 2019 20:38:45 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Date: Thu, 29 Aug 2019 12:38:33 +0100
Message-Id: <1567078713-29361-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 ebiharaml@si-linux.co.jp, xu_shunji@hoperun.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEhpSG9wZSBSWi9HMk0gaXMgYWR2ZXJ0aXNlZCBhcyBjb21wYXRpYmxlIHdpdGggcGFuZWwg
aWRrLTExMTB3cgpmcm9tIEFkdmFudGVjaCwgaG93ZXZlciB0aGUgcGFuZWwgaXNuJ3Qgc29sZCBh
bG9uZ3NpZGUgdGhlIGJvYXJkLgpBIG5ldyBkdHMsIGFkZGluZyBldmVyeXRoaW5nIHRoYXQncyBy
ZXF1aXJlZCB0byBnZXQgdGhlIHBhbmVsIHRvCndvcmsgdGhlIEhpSG9wZSBSWi9HMk0sIGlzIHRo
ZSBtb3N0IGNvbnZlbmllbnQgd2F5IHRvIHN1cHBvcnQgdGhlCkhpSG9wZSBSWi9HMk0gd2hlbiBp
dCdzIGNvbm5lY3RlZCB0byB0aGUgaWRrLTExMTB3ci4KClNpZ25lZC1vZmYtYnk6IEZhYnJpemlv
IENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgotLS0KdjEtPnYyOgoqIGFk
ZGVkIHNwYWNlIGJldHdlZW4gbHZkcy1jb25uZWN0b3ItZW4tZ3BpbyBhbmQgY3VybHkgYnJhY2UK
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAx
ICsKIC4uLi9yOGE3NzRhMS1oaWhvcGUtcnpnMm0tZXgtaWRrLTExMTB3ci5kdHMgICAgICAgIHwg
ODYgKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
NGExLWhpaG9wZS1yemcybS1leC1pZGstMTExMHdyLmR0cwoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9NYWtlZmlsZQppbmRleCA0MmI3NGMyLi41ZDk0MzAxIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL01ha2VmaWxlCkBAIC0xLDYgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAogZHRiLSQoQ09ORklHX0FSQ0hfUjhBNzc0QTEpICs9IHI4YTc3NGExLWhpaG9wZS1y
emcybS5kdGIKIGR0Yi0kKENPTkZJR19BUkNIX1I4QTc3NEExKSArPSByOGE3NzRhMS1oaWhvcGUt
cnpnMm0tZXguZHRiCitkdGItJChDT05GSUdfQVJDSF9SOEE3NzRBMSkgKz0gcjhhNzc0YTEtaGlo
b3BlLXJ6ZzJtLWV4LWlkay0xMTEwd3IuZHRiCiBkdGItJChDT05GSUdfQVJDSF9SOEE3NzRDMCkg
Kz0gcjhhNzc0YzAtY2F0ODc0LmR0YiByOGE3NzRjMC1lazg3NC5kdGIKIGR0Yi0kKENPTkZJR19B
UkNIX1I4QTc3OTUpICs9IHI4YTc3OTUtc2FsdmF0b3IteC5kdGIgcjhhNzc5NS1oM3VsY2IuZHRi
CiBkdGItJChDT05GSUdfQVJDSF9SOEE3Nzk1KSArPSByOGE3Nzk1LWgzdWxjYi1rZi5kdGIKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS1oaWhvcGUtcnpn
Mm0tZXgtaWRrLTExMTB3ci5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0
YTEtaGlob3BlLXJ6ZzJtLWV4LWlkay0xMTEwd3IuZHRzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAuLjY3ZmUwNGMKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc0YTEtaGlob3BlLXJ6ZzJtLWV4LWlkay0xMTEwd3IuZHRzCkBAIC0w
LDAgKzEsODYgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvKgorICog
RGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgSGlIb3BlIFJaL0cyTSBzdWIgYm9hcmQgY29ubmVj
dGVkIHRvIGFuCisgKiBBZHZhbnRlY2ggSURLLTExMTBXUiAxMC4xIiBMVkRTIHBhbmVsCisgKgor
ICogQ29weXJpZ2h0IChDKSAyMDE5IFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4KKyAqLworCisj
aW5jbHVkZSAicjhhNzc0YTEtaGlob3BlLXJ6ZzJtLWV4LmR0cyIKKworLyB7CisJYmFja2xpZ2h0
IHsKKwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKKwkJcHdtcyA9IDwmcHdtMCAwIDUw
MDAwPjsKKworCQlicmlnaHRuZXNzLWxldmVscyA9IDwwIDIgOCAxNiAzMiA2NCAxMjggMjU1PjsK
KwkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDY+OworCX07CisKKwlwYW5lbC1sdmRzIHsK
KwkJY29tcGF0aWJsZSA9ICJhZHZhbnRlY2gsaWRrLTExMTB3ciIsICJwYW5lbC1sdmRzIjsKKwor
CQl3aWR0aC1tbSA9IDwyMjM+OworCQloZWlnaHQtbW0gPSA8MTI1PjsKKworCQlkYXRhLW1hcHBp
bmcgPSAiamVpZGEtMjQiOworCisJCXBhbmVsLXRpbWluZyB7CisJCQkvKiAxMDI0eDYwMCBANjBI
eiAqLworCQkJY2xvY2stZnJlcXVlbmN5ID0gPDUxMjAwMDAwPjsKKwkJCWhhY3RpdmUgPSA8MTAy
ND47CisJCQl2YWN0aXZlID0gPDYwMD47CisJCQloc3luYy1sZW4gPSA8MjQwPjsKKwkJCWhmcm9u
dC1wb3JjaCA9IDw0MD47CisJCQloYmFjay1wb3JjaCA9IDw0MD47CisJCQl2ZnJvbnQtcG9yY2gg
PSA8MTU+OworCQkJdmJhY2stcG9yY2ggPSA8MTA+OworCQkJdnN5bmMtbGVuID0gPDEwPjsKKwkJ
fTsKKworCQlwb3J0IHsKKwkJCXBhbmVsX2luOiBlbmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZsdmRzMF9vdXQ+OworCQkJfTsKKwkJfTsKKwl9OworfTsKKworJmdwaW8xIHsKKwkv
KgorCSAqIFdoZW4gR1AxXzIwIGlzIExPVyBMVkRTMCBpcyBjb25uZWN0ZWQgdG8gdGhlIExWRFMg
Y29ubmVjdG9yCisJICogV2hlbiBHUDFfMjAgaXMgSElHSCBMVkRTMCBpcyBjb25uZWN0ZWQgdG8g
dGhlIExUODkxOEwKKwkgKi8KKwlsdmRzLWNvbm5lY3Rvci1lbi1ncGlvIHsKKwkJZ3Bpby1ob2c7
CisJCWdwaW9zID0gPDIwIEdQSU9fQUNUSVZFX0hJR0g+OworCQlvdXRwdXQtbG93OworCQlsaW5l
LW5hbWUgPSAibHZkcy1jb25uZWN0b3ItZW4tZ3BpbyI7CisJfTsKK307CisKKyZsdmRzMCB7CisJ
c3RhdHVzID0gIm9rYXkiOworCisJcG9ydHMgeworCQlwb3J0QDEgeworCQkJbHZkczBfb3V0OiBl
bmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47CisJCQl9OworCQl9
OworCX07Cit9OworCismcGZjIHsKKwlwd20wX3BpbnM6IHB3bTAgeworCQlncm91cHMgPSAicHdt
MCI7CisJCWZ1bmN0aW9uID0gInB3bTAiOworCX07Cit9OworCismcHdtMCB7CisJcGluY3RybC0w
ID0gPCZwd20wX3BpbnM+OworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisKKwlzdGF0dXMg
PSAib2theSI7Cit9OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
