Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E34912A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB476E094;
	Mon, 17 Jun 2019 20:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F271E6E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 98259404EC;
 Mon, 17 Jun 2019 22:18:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMzdDbcLcI35; Mon, 17 Jun 2019 22:18:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3E26F3F806;
 Mon, 17 Jun 2019 22:18:04 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BA38A360195;
 Mon, 17 Jun 2019 22:18:04 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/9] Emulated coherent graphics memory
Date: Mon, 17 Jun 2019 22:17:47 +0200
Message-Id: <20190617201756.12587-1-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560802684; bh=PScipI5AHw+qLkcTJBwlmyceItjajNZI6ZkbYCpIp5o=;
 h=From:To:Cc:Subject:Date:From;
 b=mnafpFmeQNH0EL9PxDDtoS88L4EEKidwRycfzY5O4F6w5cYXRS9jQd/8Sp41m7vbP
 IGa3xwnPcNIRFsIpwMtIL54qlzHImXSrhOKD0YrKYP4PMF8OYntCihTR0BEOx6vTCo
 WT3MhJYxH40T/yuSsoFkU1z+efK2N3j+ckFX8dPU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=mnafpFme; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, linux-graphics-maintainer@vmware.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxhbm5pbmcgdG8gbWVyZ2UgdGhpcyB0aHJvdWdoIHRoZSBkcm0vdm13Z2Z4IHRyZWUgc29vbiwg
c28gaWYgdGhlcmUKYXJlIGFueSBvYmplY3Rpb25zLCBwbGVhc2Ugc3BlYWsgdXAuCgpHcmFwaGlj
cyBBUElzIGxpa2UgT3BlbkdMIDQuNCBhbmQgVnVsa2FuIHJlcXVpcmUgdGhlIGdyYXBoaWNzIGRy
aXZlcgp0byBwcm92aWRlIGNvaGVyZW50IGdyYXBoaWNzIG1lbW9yeSwgbWVhbmluZyB0aGF0IHRo
ZSBHUFUgc2VlcyBhbnkKY29udGVudCB3cml0dGVuIHRvIHRoZSBjb2hlcmVudCBtZW1vcnkgb24g
dGhlIG5leHQgR1BVIG9wZXJhdGlvbiB0aGF0CnRvdWNoZXMgdGhhdCBtZW1vcnksIGFuZCB0aGUg
Q1BVIHNlZXMgYW55IGNvbnRlbnQgd3JpdHRlbiBieSB0aGUgR1BVCnRvIHRoYXQgbWVtb3J5IGlt
bWVkaWF0ZWx5IGFmdGVyIGFueSBmZW5jZSBvYmplY3QgdHJhaWxpbmcgdGhlIEdQVQpvcGVyYXRp
b24gaGFzIHNpZ25hbGVkLgoKUGFyYXZpcnR1YWwgZHJpdmVycyB0aGF0IG90aGVyd2lzZSByZXF1
aXJlIGV4cGxpY2l0IHN5bmNocm9uaXphdGlvbgpuZWVkcyB0byBkbyB0aGlzIGJ5IGhvb2tpbmcg
dXAgZGlydHkgdHJhY2tpbmcgdG8gcGFnZWZhdWx0IGhhbmRsZXJzCmFuZCBidWZmZXIgb2JqZWN0
IHZhbGlkYXRpb24uIFRoaXMgaXMgYSBmaXJzdCBhdHRlbXB0IHRvIGRvIHRoYXQgZm9yCnRoZSB2
bXdnZnggZHJpdmVyLgoKVGhlIG1tIHBhdGNoZXMgaGFzIGJlZW4gb3V0IGZvciBSRkMuIEkgdGhp
bmsgSSBoYXZlIGFkZHJlc3NlZCBhbGwgdGhlCmZlZWRiYWNrIEkgZ290LCBleGNlcHQgYSBwb3Nz
aWJsZSBzb2Z0ZGlydHkgYnJlYWthZ2UuIEJ1dCBhbHRob3VnaCB0aGUKZGlydHktdHJhY2tpbmcg
YW5kIHNvZnRkaXJ0eSBtYXkgd3JpdGUtcHJvdGVjdCBQVEVzIGJvdGggY2FyZSBhYm91dCwKdGhh
dCBzaG91bGRuJ3QgcmVhbGx5IGNhdXNlIGFueSBvcGVyYXRpb24gaW50ZXJmZXJlbmNlLiBJbiBw
YXJ0aWN1bGFyCnNpbmNlIHdlIHVzZSB0aGUgaGFyZHdhcmUgZGlydHkgUFRFIGJpdHMgYW5kIHNv
ZnRkaXJ0eSB1c2VzIG90aGVyIFBURSBiaXRzLgoKRm9yIHRoZSBUVE0gY2hhbmdlcyB0aGV5IGFy
ZSBob3BlZnVsbHkgaW4gbGluZSB3aXRoIHRoZSBsb25nLXRlcm0Kc3RyYXRlZ3kgb2YgbWFraW5n
IGhlbHBlcnMgb3V0IG9mIHdoYXQncyBsZWZ0IG9mIFRUTS4KClRoZSBjb2RlIGhhcyBiZWVuIHRl
c3RlZCBhbmQgZXhlcmNpc2VkIGJ5IGEgdGFpbG9yZWQgdmVyc2lvbiBvZiBtZXNhCndoZXJlIHdl
IGRpc2FibGUgYWxsIGV4cGxpY2l0IHN5bmNocm9uaXphdGlvbiBhbmQgYXNzdW1lIGdyYXBoaWNz
IG1lbW9yeQppcyBjb2hlcmVudC4gVGhlIHBlcmZvcm1hbmNlIGxvc3MgdmFyaWVzIG9mIGNvdXJz
ZTsgYSB0eXBpY2FsIG51bWJlciBpcwphcm91bmQgNSUuCgpDaGFuZ2VzIHYxLXYyOgotIEFkZHJl
c3NlZCBhIG51bWJlciBvZiB0eXBvcyBhbmQgZm9ybWF0dGluZyBpc3N1ZXMuCi0gQWRkZWQgYSB1
c2FnZSB3YXJuaW5nIGZvciBhcHBseV90b19wZm5fcmFuZ2UoKSBhbmQgYXBwbHlfdG9fcGFnZV9y
YW5nZSgpCi0gUmUtZXZhbHVhdGVkIHRoZSBkZWNpc2lvbiB0byB1c2UgYXBwbHlfdG9fcGZuX3Jh
bmdlKCkgcmF0aGVyIHRoYW4KICBtb2RpZnlpbmcgdGhlIHBhZ2V3YWxrLmMuIEl0IHN0aWxsIGxv
b2tzIGxpa2UgZ2VuZXJpY2FsbHkgaGFuZGxpbmcgdGhlCiAgdHJhbnNwYXJlbnQgaHVnZSBwYWdl
IGNhc2VzIHJlcXVpcmVzIHRoZSBtbWFwX3NlbSB0byBiZSBoZWxkIGF0IGxlYXN0CiAgaW4gcmVh
ZCBtb2RlLCBzbyBzdGlja2luZyB3aXRoIGFwcGx5X3RvX3Bmbl9yYW5nZSgpIGZvciBub3cuCi0g
VGhlIFRUTSBwYWdlLWZhdWx0IGhlbHBlciB2bWEgY29weSBhcmd1bWVudCB3YXMgc2NyYXRjaGVk
IGluIGZhdm91ciBvZgogIGEgcGFnZXByb3RfdCBhcmd1bWVudC4KQ2hhbmdlcyB2MzoKLSBBZGFw
dGVkIHRvIHVwc3RyZWFtIEFQSSBjaGFuZ2VzLgpDaGFuZ2VzIHY0OgotIEFkYXB0ZWQgdG8gdXBz
dHJlYW0gbW11X25vdGlmaWVyIGNoYW5nZXMuIChKZXJvbWU/KQotIEZpeGVkIGEgY291cGxlIG9m
IHdhcm5pbmdzIG9uIDMyLWJpdCB4ODYKLSBGaXhlZCBpbWFnZSBvZmZzZXQgY29tcHV0YXRpb24g
b24gbXVsdGlzYW1wbGUgaW1hZ2VzLgpDaGFuZ2VzIHY1OgotIFVwZGF0ZWQgdXNhZ2Ugd2Fybmlu
ZyBpbiBwYXRjaCAzLzkgYWZ0ZXIgcmV2aWV3IGNvbW1lbnRzIGZyb20gTmFkYXYgQW1pdC4KQ2hh
bmdlcyB2NjoKLSBVcGRhdGVkIGV4cG9ydHMgb2YgbmV3IGZ1bmN0aW9uYWxpdHkgaW4gcGF0Y2gg
My85IHRvIEVYUE9SVF9TWU1CT0xfR1BMCiAgYWZ0ZXIgcmV2aWV3IGNvbW1lbnRzIGZyb20gQ2hy
aXN0b3BoIEhlbGx3aWcuCkNoYW5nZXMgdjc6Ci0gUmUtYWRkZWQgcmVtb3ZlZCBjb21tZW50IGlu
IHR0bV9ib192bS5jIChSZXZpZXcgYnkgSGlsbGYgRGFudG9uKQotIEZpeGVkIGFuIGVycm9yIHBh
dGggcmVncmVzc2lvbiBpbiB0dG1fYm9fdm0uYwogIApDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBs
aW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQu
b3JnPgpDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+CkNjOiBQZXRlciBaaWps
c3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBSaWsgdmFuIFJpZWwgPHJpZWxAc3Vycmll
bC5jb20+CkNjOiBNaW5jaGFuIEtpbSA8bWluY2hhbkBrZXJuZWwub3JnPgpDYzogTWljaGFsIEhv
Y2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiBIdWFuZyBZaW5nIDx5aW5nLmh1YW5nQGludGVsLmNv
bT4KQ2M6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgpDYzogIkrDqXLD
tG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
