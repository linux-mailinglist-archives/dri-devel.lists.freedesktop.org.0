Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F9F17555F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1941D6E0EB;
	Mon,  2 Mar 2020 08:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3B6E3D2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 22:16:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48VLNk2qpPz1rQC1;
 Sat, 29 Feb 2020 23:16:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48VLNk21X3z1r0bh;
 Sat, 29 Feb 2020 23:16:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id aGq5kC_jf68O; Sat, 29 Feb 2020 23:16:52 +0100 (CET)
X-Auth-Info: WDpKlVTQBPcpmhOpnRbP8hWbVI4mHVuxtGRW2sTkeTo=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 29 Feb 2020 23:16:52 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/stm: repair runtime power management
Date: Sat, 29 Feb 2020 23:16:49 +0100
Message-Id: <20200229221649.90813-1-marex@denx.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Mar 2020 08:17:47 +0000
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
Cc: Marek Vasut <marex@denx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgcG1fcnVudGltZV9nZXRfc3luYygpIGludG8gbHRkY19jcnRjX2F0b21pY19l
bmFibGUoKSB0bwptYXRjaCBwbV9ydW50aW1lX3B1dF9zeW5jKCkgaW4gbHRkY19jcnRjX2F0b21p
Y19kaXNhYmxlKCksIG90aGVyd2lzZQp0aGUgTFREQyBtaWdodCBzdXNwZW5kIHZpYSBydW50aW1l
IFBNLCBkaXNhYmxlIGNsb2NrLCBhbmQgdGhlbiBmYWlsCnRvIHJlc3VtZSBsYXRlciBvbi4KClRo
ZSB0ZXN0IHdoaWNoIHRyaWdnZXJzIGl0IGlzIHJvdWdobHkgLS0gcnVuIHF0NSBhcHBsaWNhdGlv
biB3aGljaAp1c2VzIGVnbGZzIHBsYXRmb3JtIGFuZCBldG5hdml2LCBzdG9wIHRoZSBhcHBsaWNh
dGlvbiwgc2xlZXAgZm9yIDE1Cm1pbnV0ZXMsIHJ1biB0aGUgYXBwbGljYXRpb24gYWdhaW4uIFRo
aXMgbGVhZHMgdG8gYSB0aW1lb3V0IHdhaXRpbmcKZm9yIHZzeW5jLCBiZWNhdXNlIHRoZSBMVERD
IGhhcyBzdXNwZW5kZWQsIGJ1dCBkaWQgbm90IHJlc3VtZS4KCkZpeGVzOiAzNWFiNmNmYmYyMTEg
KCJkcm0vc3RtOiBzdXBwb3J0IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCIpClNpZ25lZC1vZmYt
Ynk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpDYzogWWFubmljayBGZXJ0csOpIDx5YW5u
aWNrLmZlcnRyZUBzdC5jb20+CkNjOiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3Qu
Y29tPgpDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+
CkNjOiBWaW5jZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgpDYzogTWF4aW1lIENv
cXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpDYzogQWxleGFuZHJlIFRvcmd1ZSA8
YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+ClRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCkNjOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKLS0tCi0tLS0tLS0tLS0tLVsgY3V0IGhl
cmUgXS0tLS0tLS0tLS0tLQpXQVJOSU5HOiBDUFU6IDAgUElEOiAyOTcgYXQgZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfaGVscGVyLmM6MTQ5NCBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92
YmxhbmtzKzB4MWRjLzB4MjAwCltDUlRDOjM1OmNydGMtMF0gdmJsYW5rIHdhaXQgdGltZWQgb3V0
Ck1vZHVsZXMgbGlua2VkIGluOgpDUFU6IDAgUElEOiAyOTcgQ29tbTogUVNHUmVuZGVyVGhyZWFk
IE5vdCB0YWludGVkIDUuNi4wLXJjMy1uZXh0LTIwMjAwMjI4LTAwMDEwLWczMThiZjBmYzA4ZWYg
IzIKSGFyZHdhcmUgbmFtZTogU1RNMzIgKERldmljZSBUcmVlIFN1cHBvcnQpCls8YzAxMGYxOGM+
XSAodW53aW5kX2JhY2t0cmFjZSkgZnJvbSBbPGMwMTBhZmI4Pl0gKHNob3dfc3RhY2srMHgxMC8w
eDE0KQpbPGMwMTBhZmI4Pl0gKHNob3dfc3RhY2spIGZyb20gWzxjMDdiMWQzYz5dIChkdW1wX3N0
YWNrKzB4YjQvMHhkMCkKWzxjMDdiMWQzYz5dIChkdW1wX3N0YWNrKSBmcm9tIFs8YzAxMWQ4Yjg+
XSAoX193YXJuKzB4ZDQvMHhmMCkKWzxjMDExZDhiOD5dIChfX3dhcm4pIGZyb20gWzxjMDExZGM0
Yz5dICh3YXJuX3Nsb3dwYXRoX2ZtdCsweDc4LzB4YTgpCls8YzAxMWRjNGM+XSAod2Fybl9zbG93
cGF0aF9mbXQpIGZyb20gWzxjMDRhMjY2Yz5dIChkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92
YmxhbmtzKzB4MWRjLzB4MjAwKQpbPGMwNGEyNjZjPl0gKGRybV9hdG9taWNfaGVscGVyX3dhaXRf
Zm9yX3ZibGFua3MpIGZyb20gWzxjMDRhNTEwYz5dIChkcm1fYXRvbWljX2hlbHBlcl9jb21taXRf
dGFpbCswCng1MC8weDYwKQpbPGMwNGE1MTBjPl0gKGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90
YWlsKSBmcm9tIFs8YzA0YTUyYTg+XSAoY29tbWl0X3RhaWwrMHgxMmMvMHgxM2MpCls8YzA0YTUy
YTg+XSAoY29tbWl0X3RhaWwpIGZyb20gWzxjMDRhNTNiND5dIChkcm1fYXRvbWljX2hlbHBlcl9j
b21taXQrMHhmNC8weDEwMCkKWzxjMDRhNTNiND5dIChkcm1fYXRvbWljX2hlbHBlcl9jb21taXQp
IGZyb20gWzxjMDRhMmQzOD5dIChkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnKzB4NTgvMHg2
YykKWzxjMDRhMmQzOD5dIChkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnKSBmcm9tIFs8YzA0
YjE5OTQ+XSAoZHJtX21vZGVfc2V0Y3J0YysweDQ1MC8weDU1MCkKWzxjMDRiMTk5ND5dIChkcm1f
bW9kZV9zZXRjcnRjKSBmcm9tIFs8YzA0YWQ1NzA+XSAoZHJtX2lvY3RsX2tlcm5lbCsweDkwLzB4
ZTgpCls8YzA0YWQ1NzA+XSAoZHJtX2lvY3RsX2tlcm5lbCkgZnJvbSBbPGMwNGFkOGFjPl0gKGRy
bV9pb2N0bCsweDJlNC8weDMyYykKWzxjMDRhZDhhYz5dIChkcm1faW9jdGwpIGZyb20gWzxjMDI0
Njc4ND5dICh2ZnNfaW9jdGwrMHgyMC8weDM4KQpbPGMwMjQ2Nzg0Pl0gKHZmc19pb2N0bCkgZnJv
bSBbPGMwMjQ3MGYwPl0gKGtzeXNfaW9jdGwrMHhiYy8weDdiMCkKWzxjMDI0NzBmMD5dIChrc3lz
X2lvY3RsKSBmcm9tIFs8YzAxMDEwMDA+XSAocmV0X2Zhc3Rfc3lzY2FsbCsweDAvMHg1NCkKRXhj
ZXB0aW9uIHN0YWNrKDB4ZWU4ZjNmYTggdG8gMHhlZThmM2ZmMCkKM2ZhMDogICAgICAgICAgICAg
ICAgICAgMDAwMDAwMDUgYWRjYmViMTggMDAwMDAwMDUgYzA2ODY0YTIgYWRjYmViMTggMDAwMDAw
MDEKM2ZjMDogMDAwMDAwMDUgYWRjYmViMTggYzA2ODY0YTIgMDAwMDAwMzYgMDAwMDAwMjkgMDAw
MDAwMjMgMDAwMDAwMjMgMDAwMDAwMDcKM2ZlMDogYjExM2IwOTggYWRjYmVhZmMgYjExMjU0MTMg
YjYxNTVjZjgKLS0tWyBlbmQgdHJhY2UgMmFkNWJhOTU0Y2ViNzY3YSBdLS0tCi0tLQogZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMKaW5kZXggOTliZjkzZThiMzZmLi4zMDFkZTA0OTgwNzggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jCkBAIC00MjUsOSArNDI1LDEyIEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9t
aWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQkgICAgc3RydWN0IGRybV9jcnRj
X3N0YXRlICpvbGRfc3RhdGUpCiB7CiAJc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190
b19sdGRjKGNydGMpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2OwogCiAJ
RFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKIAorCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRldi0+ZGV2
KTsKKwogCS8qIFNldHMgdGhlIGJhY2tncm91bmQgY29sb3IgdmFsdWUgKi8KIAlyZWdfd3JpdGUo
bGRldi0+cmVncywgTFREQ19CQ0NSLCBCQ0NSX0JDQkxBQ0spOwogCi0tIAoyLjI1LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
