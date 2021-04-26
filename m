Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B5B36B210
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 13:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FCD6E5CF;
	Mon, 26 Apr 2021 11:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2289 seconds by postgrey-1.36 at gabe;
 Mon, 26 Apr 2021 11:00:08 UTC
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF68C6E5CF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CG7DEi1oNK3ORCuH31x/4n/r7pIK5z5dwj8sGoLJoKk=; b=gvIbw3nJUagwFMWIG4jRoH0EJ0
 2xGdzR4tJrj+biy34nixCXAePU6VrigVdmxcSTIivXStF3siVf2Avuq1BMPUcY9XSgWc9CCXjoduD
 zbK51GvStUoFUI+70UOjfGiAOD7T80xZZJ7Iwa4Gi+pTtNknKYOIch9XHroIRgo3arjn2Lirfuf6+
 ZqfIoqMFDLvyffzAvduhTslEAUGz8b4ou4mY3R68VFtO9bdW2+gdpPpVp4t3xZZyg61NvqRpXcE+X
 cO2cywB1hsEwIlIjzizOCJGbPUR5BMXRrrzQeIEsiVTD6f/oU4LFnblh3pS0lH7iXLXGtKv9KLTbG
 5J6xpXyQ==;
Received: from [89.212.21.243] (port=45702 helo=[192.168.69.116])
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <primoz.fiser@norik.com>)
 id 1layNE-00GEDq-Lk; Mon, 26 Apr 2021 12:21:52 +0200
To: dri-devel@lists.freedesktop.org
From: Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [REGRESSION] drm/etnaviv: command buffer outside valid memory
 window
Message-ID: <bd7858a6-fab3-c0c6-6e6e-5f61881ac762@norik.com>
Date: Mon, 26 Apr 2021 12:21:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Mon, 26 Apr 2021 11:08:32 +0000
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
Cc: linux@armlinux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKd2UgYXJlIHN0aWxsIGFmZmVjdGVkIGJ5IHRoaXMgaXNzdWUgZnJvbSAyMDE5IG9u
IDUuMTAuCgpGb3IgZXhhbXBsZSB3aGVuIHNldHRpbmcgImNtYT0yNTZNIiBvbiBwaHljb3JlIGlt
eDZxIHdpdGggMkcgcmFtIHdlIGdldDoKCj4gW8KgwqAgMTIuNTczMjc2XSBldG5hdml2IGV0bmF2
aXY6IGNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5IHdpbmRvdwo+IFvCoMKgIDEy
LjYxNjQ2MF0gZXRuYXZpdiBldG5hdml2OiBjb21tYW5kIGJ1ZmZlciBvdXRzaWRlIHZhbGlkIG1l
bW9yeSB3aW5kb3cKPiBbwqDCoCAxMi42NjI1MTddIGV0bmF2aXYgZXRuYXZpdjogY29tbWFuZCBi
dWZmZXIgb3V0c2lkZSB2YWxpZCBtZW1vcnkgd2luZG93Cj4gW8KgwqAgMTIuNzE0ODU5XSBldG5h
dml2IGV0bmF2aXY6IGNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5IHdpbmRvdwoK
T24gdGhlIG90aGVyIGhhbmQsIHdoZW4gd2Ugc2V0ICJjbWE9MTI4TSIgdGhpcyBkb2Vzbid0IGhh
cHBlbi4KCkZvciBub3csIHdlIHdlcmUgYWJsZSB0byBnZXQgYXJvdW5kIHRoaXMgaXNzdWUgYnkg
YXBwbHlpbmcgTHVjYXMnIHBhdGNoZXM6Cgo+ICJbUEFUQ0ggMS8yXSBtbTogY21hOiBleHBvcnQg
ZnVuY3Rpb25zIHRvIGdldCBDTUEgYmFzZSBhbmQgc2l6ZSIKPiAiW1BBVENIIDIvMl0gZHJtL2V0
bmF2aXY6IHVzZSBDTUEgYXJlYSB0byBjb21wdXRlIGxpbmVhciB3aW5kb3cgb2Zmc2V0IAo+IGlm
IHBvc3NpYmxlIgoKSG93ZXZlciB0aG9zZSBkaWRuJ3QgZ2V0IGFjY2VwdGVkIGludG8gbWFpbmxp
bmU/CgpIYXMgdGhlcmUgYmVlbiBhbnkgcHJvZ3Jlc3Mgb24gdGhpcz8KCkFueSB0aXBzIG9uIGhv
dyB0byBwcm9wZXJseSBmaXggdGhpcyBpbiBtYWlubGluZT8KCkJSLAoKUHJpbW96CgoKPiBBbSBT
YW1zdGFnLCBkZW4gMjIuMDYuMjAxOSwgMTc6MTYgKzAxMDAgc2NocmllYiBSdXNzZWxsIEtpbmcg
LSBBUk0gTGludXggYWRtaW46Cj4gPi9XaGlsZSB1cGRhdGluZyBteSB2YXJpb3VzIHN5c3RlbXMg
Zm9yIHRoZSBUQ1AgU0FDSyBpc3N1ZSwgSSBub3RpY2UgLz4vdGhhdCB3aGlsZSBtb3N0IHBsYXRm
b3JtcyBhcmUgaGFwcHksIHRoZSBDdWJveC1pNCBpcyBub3QuwqDCoER1cmluZyAvPi9ib290LCB3
ZSBnZXQ6IC8+Ly8+L1vCoMKgwqDCoDAuMDAwMDAwXSBjbWE6IFJlc2VydmVkIDI1NiBNaUIgYXQg
MHgzMDAwMDAwMCAvPi8uLi4gLz4vW8KgwqDCoMKgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxp
bmU6IGNvbnNvbGU9dHR5bXhjMCwxMTUyMDBuOCAKPiBjb25zb2xlPXR0eTEgdmlkZW89bXhjZmIw
OmRldj1oZG1pIHJvb3Q9L2Rldi9uZnMgcncgY21hPTI1Nk0gCj4gYWhjaV9pbXguaG90cGx1Zz0x
IHNwbGFzaCByZXN1bWU9L2Rldi9zZGExIC8+L1vCoMKgwqDCoDAuMDAwMDAwXSBEZW50cnkgY2Fj
aGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMzEwNzIgKG9yZGVyOiA3LCAKPiA1MjQyODggYnl0ZXMp
IC8+L1vCoMKgwqDCoDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDY1
NTM2IChvcmRlcjogNiwgCj4gMjYyMTQ0IGJ5dGVzKSAvPi9bwqDCoMKgwqAwLjAwMDAwMF0gTWVt
b3J5OiAxNzkwOTcySy8yMDk3MTUySyBhdmFpbGFibGUgKDg0NzFLIGtlcm5lbCAKPiBjb2RlLCA2
OTNLIHJ3ZGF0YSwgMjg0NEsgcm9kYXRhLCA1MDBLIGluaXQsIDgwNjJLIGJzcywgNDQwMzZLIAo+
IHJlc2VydmVkLCAyNjIxNDRLIGNtYS1yZXNlcnZlZCwgMTMxMDcyMEsgaGlnaG1lbSkgLz4vLi4u
IC8+L1vCoMKgwqAxMy4xMDEwOThdIGV0bmF2aXYtZ3B1IDEzMDAwMC5ncHU6IGNvbW1hbmQgYnVm
ZmVyIG91dHNpZGUgdmFsaWQgCj4gbWVtb3J5IHdpbmRvdyAvPi9bwqDCoMKgMTMuMTcxOTYzXSBl
dG5hdml2LWdwdSAxMzQwMDAuZ3B1OiBjb21tYW5kIGJ1ZmZlciBvdXRzaWRlIHZhbGlkIAo+IG1l
bW9yeSB3aW5kb3cgLwo+IFllcywgdGhhdCdzIGEgcmVncmVzc2lvbiBkdWUgdG8gZGlmZmVyZW50
IGRlZmF1bHQgQ01BIGFyZWEgcGxhY2VtZW50Cj4gYW5kIGV0bmF2aXYgbm90IGJlaW5nIHNtYXJ0
IGVub3VnaCB0byBtb3ZlIHRoZSBsaW5lYXIgd2luZG93IHRvIHRoZQo+IHJpZ2h0IG9mZnNldC4K
Pgo+IFBhdGNoZXMgdG8gZml4IHRoaXMgKGJ1dCBoYXZlIHJpZ2h0ZnVsbHkgYmVlbiBzaG90IGRv
d24sIGR1ZSB0bwo+IGxheWVyaW5nIHZpb2xhdGlvbnMpIGFyZSAiW1BBVENIIDEvMl0gbW06IGNt
YTogZXhwb3J0IGZ1bmN0aW9ucyB0byBnZXQKPiBDTUEgYmFzZSBhbmQgc2l6ZSIgYW5kICJbUEFU
Q0ggMi8yXSBkcm0vZXRuYXZpdjogdXNlIENNQSBhcmVhIHRvCj4gY29tcHV0ZSBsaW5lYXIgd2lu
ZG93IG9mZnNldCBpZiBwb3NzaWJsZSIuCj4KPiA+L2FuZCBzaG9ydGx5IGFmdGVyIHRoZSBsb2dp
biBwcm9tcHQgYXBwZWFycywgdGhlIGVudGlyZSBTb0MgYXBwZWFycyB0byAvPi9sb2NrIHVwIC0g
aXQgYmVjb21lcyB1bnJlc3BvbnNpdmUgb24gdGhlIG5ldHdvcmssIG9yIHZpYSBzZXJpYWwgY29u
c29sZSAvPi90byBzeXNycSByZXF1ZXN0cy4gLz4vLz4vSSBzdXNwZWN0IHRoZSBHUFUgZW5kcyB1
cCBzY3JpYmJsaW5nIG92ZXIgdGhlIENQVSdzIHZlY3RvciBwYWdlL2tlcm5lbCAvPi9hcyBhIHJl
c3VsdCBvZiB0aGUgYWJvdmUgdHdvIGV0bmF2aXYgZXJyb3JzIHdoZW4gWG9yZyBhdHRlbXB0cyB0
byBzdGFydCAvPi91c2luZyB0aGUgR1BVLiAvCj4gVGhpcyBzaG91bGQgbm90IGJlIHBvc3NpYmxl
LiBUaGUgZHJpdmVyIG5vdGljZXMgdGhhdCB0aGUgY29tbWFuZCBidWZmZXIKPiBpc24ndCBhY2Nl
c3NpYmxlIHRvIHRoZSBHUFUsIHdoaWNoIGFib3J0cyB0aGUgR1BVIGluaXQuIFdoaWxlIHRoZQo+
IGV0bmF2aXYgRFJNIGRldmljZSBpcyBzdGlsbCBhY2Nlc3NpYmxlLCBpdCB3aWxsIG5vdCBleHBv
c2UgYW55Cj4gZW51bWVyYWJsZSBHUFUgY29yZXMgdG8gdXNlcnNwYWNlLiBTbyB0aGVyZSBpcyBu
byB3YXkgZm9yIHVzZXJzcGFjZSB0bwo+IGFjdHVhbGx5IHN1Ym1pdCBHUFUgY29tbWFuZHMuCj4K
PiBSZWdhcmRzLAo+IEx1Y2FzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
