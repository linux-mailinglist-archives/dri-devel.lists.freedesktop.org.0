Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E0F0331
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 17:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7DA6E0B8;
	Tue,  5 Nov 2019 16:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5336E0B8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 16:42:58 +0000 (UTC)
Received: from [94.134.91.242] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iS1uw-0000AX-It; Tue, 05 Nov 2019 17:42:54 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: philippe.cornu@st.com
Subject: dw-dsi dphy timing calculations
Date: Tue, 05 Nov 2019 17:42:53 +0100
Message-ID: <19189086.sEj5AHWfUf@phil>
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGhpbGlwcGUsCgp3aGVuIHlvdSBkaWQgdGhlIGRkIHRoZSBkdy1kc2kgZ2VuZXJhbGl6YXRp
b24sCmR3X21pcGlfZHNpX2RwaHlfdGltaW5nX2NvbmZpZygpIGRpZCBlbmQgdXAgd2l0aCBzdGF0
aWMgdmFsdWVzIGFuZCBhCmNvbW1lbnQgc3RhdGluZyAiZGF0YSAmIGNsb2NrIGxhbmUgdGltZXJz
IHNob3VsZCBiZSBjb21wdXRlZCBhY2NvcmRpbmcKdG8gcGFuZWwgYmxhbmtpbmdzIGFuZCB0byB0
aGUgYXV0b21hdGljIGNsb2NrIGxhbmUgY29udHJvbCBtb2RlLi4uIi4KCkVzcGVjaWFsbHkgd2l0
aCB0aGUgUEhZX0hTMkxQX1RJTUUoMHg2MCkgSSByYW4gaW50byBwcm9ibGVtcy4KT24gdGhlIEdv
b2dsZS1HcnUtU2NhcmxldCAoQ2hyb21lT1MgdGFibGV0IHdpdGggYSBoaWdocmVzIGRpc3BsYXkp
CmV2ZXJ5dGhpbmcgd29ya3MgbmljZWx5IChwYW5lbCBjbG9jayAyMjlNSHopIGJ1dCBvbiB0aGUg
ZGV2aWNlIEknbQpvbiByaWdodCBub3cgKHBhbmVsIGNsb2NrIDY0TUh6KSBJIGVuZCB1cCB3aXRo
IGJyb2tlbiBvdXRwdXQgKHBpeGVsCmdhcmJhZ2UpLgoKV2hlbiBJIHNldCBpdCB0byB0aGUgdmFs
dWUgZm91bmQgaW4gdGhlIFJvY2tjaGlwIHZlbmRvciBrZXJuZWwKUEhZX0hTMkxQX1RJTUUoMHgx
NCkgdGhhdCBkaXNwbGF5IHdvcmtzIGFzIGV4cGVjdGVkLgoKVGhlIFJvY2tjaGlwIFNvQyBtYW51
YWwgaXMgcHJldHR5IHNwYXJzZSBvbiB3aGF0IHRoaXMgdmFsdWUgc2hvdWxkCmFjdHVhbGx5IGJl
LCBzbyBJJ20gaG9waW5nIHRoYXQgeW91IG1heSBoYXZlIHNvbWUgaW5zaWdodHMgOy0pIC4KClNv
IGZhciBJIGhhdmUgZm91bmQgCglodHRwczovL2dpdGh1Yi5jb20vc3VyZHVwZXRydS9odWF3ZWkt
cDYvYmxvYi9tYXN0ZXIva2VybmVsL2h1YXdlaS9od3A2X3UwNi9kcml2ZXJzL3ZpZGVvL2szL21p
cGlfZHNpLmMjTDk3CmFuZAoJaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2Iv
bWFzdGVyL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vZHdfZHJtX2RzaS5jI0wyNzYK
CmJ1dCBzaW1wbHkgY29weWluZyBzdHJhbmdlIGNhbGN1bGF0b25zIHNlZW1zIHdyb25nLCBzaW1p
bGFybHkKdG8ganVzdCBzd2FwcGluZyB0aGUgaGFyZGNvZGVkIHZhbHVlIGZyb20gMHg0MCB0byBt
eSBuZWVkZWQgMHgxNCA7LSkgLgoKU28gaWYgeW91IGhhdmUgc29tZSBpbnNpZ2h0cyBJIHdvdWxk
IGJlIG1vc3QgZ3JhdGVmdWwgOi1EIC4KClRoYW5rcwpIZWlrbwoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
