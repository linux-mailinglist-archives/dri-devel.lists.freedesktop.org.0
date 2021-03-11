Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8A33805F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 23:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F26EE83;
	Thu, 11 Mar 2021 22:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77F46EE83
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 22:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2426341648;
 Thu, 11 Mar 2021 23:35:31 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="LfDrSms2";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xr6KSZ2zNe6Y; Thu, 11 Mar 2021 23:35:30 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 8C1C73F74C;
 Thu, 11 Mar 2021 23:35:28 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 19BE436016B;
 Thu, 11 Mar 2021 23:35:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615502128; bh=cIY+66T7AQC6wG8EIWSRKQCH6obhIO28sZwNAh6y/oU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LfDrSms2JbDnqQDVmpXPLclp2fB7kgoJXncb7RXo3tR/Jkf5UoiuRbQmjXbpLSPaD
 t44AfLF/BX/HxxU/auZNq/06d0we5VhC2uW52GSdJoCzXj5ZwaanIPXG/f3sOk2NfA
 9e1FPsc+StHz3CXmF6a/bNYKTm9VGX2QQ9mZKpOo=
Subject: Re: vmwgfx leaking bo pins?
To: Zack Rusin <zackr@vmware.com>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
Date: Thu, 11 Mar 2021 23:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFphY2sKCk9uIDMvMTEvMjEgMTA6MDcgUE0sIFphY2sgUnVzaW4gd3JvdGU6Cj4+IE9uIE1h
ciAxMSwgMjAyMSwgYXQgMDU6NDYsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgPHRob21hc19v
c0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gSSB0cmllZCBsYXRlc3QgZHJt
LWZpeGVzIHRvZGF5IGFuZCBzYXcgYSBsb3Qgb2YgdGhlc2U6IEZhbGxvdXQgZnJvbSB0dG0gcmV3
b3JrPwo+IFllcywgSSBmaXhlZCB0aGlzIGluIGQxYTczYzY0MWFmZDI2MTdiZDgwYmNlOGI3MWEw
OTZmYzViNzRiN2UgaXQgd2FzIGluIGRybS1taXNjLW5leHQgaW4gdGhlIGRybS1taXNjIHRyZWUg
Zm9yIGEgd2hpbGUgYnV0IGhhc27igJl0IGJlZW4gbWVyZ2VkIGZvciA1LjEyLgo+Cj4gego+Ckht
bSwgeWVzIGJ1dCBkb2Vzbid0IHRoYXQgZml4IHRyaXAgdGhlIHR0bV9ib191bnBpbigpIApkbWFf
cmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KT8KClRha2luZyB0aGUgcmVzZXJ2YXRpb24g
dG8gdW5waW4gYXQgVFRNIGJvIGZyZWUgaGFzIGFsd2F5cyBiZWVuIGF3a3dhcmQgCmFuZCB0aGF0
J3Mgd2h5IHZtd2dmeCBhbmQgSSBndWVzcyBvdGhlciBUVE0gZHJpdmVycyBoYXZlIGJlZW4gc2xv
cHB5IApkb2luZyB0aGF0IGFzIFRUTSBuZXZlciBjYXJlZC4gUGVyaGFwcyBUVE0gY291bGQgY2hh
bmdlIHRoZSBwaW5fY291bnQgdG8gCmFuIGF0b21pYyBhbmQgYWxsb3cgdW5sb2NrZWQgdW5waW5u
aW5nPyBzdGlsbCByZXF1aXJpbmcgdGhlIHJlc2VydmF0aW9uIApsb2NrIGZvciBwaW5fY291bnQg
dHJhbnNpdGlvbiAwLT4xLCB0aG91Z2guCgpBbHNvLCBwaW5uaW5nIGF0IGJvIGNyZWF0aW9uIGlu
IHZtd2dmeCBoYXMgYmVlbiB0byBkbyB0aGUgZXF1aXZhbGVudCBvZiAKdHRtX2JvX2luaXRfcmVz
ZXJ2ZWQoKSAod2hpY2ggYXBpIHdhcyBhZGRlZCBsYXRlcikuIENyZWF0aW5nIHBpbm5lZCAKd291
bGQgbWFrZSB0aGUgb2JqZWN0IGlzb2xhdGVkIGFuZCBhbGxvd2luZyB0aGUgcmVzZXJ2ZSB0cnls
b2NrIHRoYXQgCmZvbGxvd2VkIHRvIGFsd2F5cyBzdWNjZWVkLiBXaXRoIHRoZSBpbnRyb2R1Y3Rp
b24gb2YgdGhlIFRUTSBwaW5fY291bnQsIAppdCBzZWVtcyB0dG1fYm9faW5pdF9yZXNlcnZlZCgp
IGlzIHVzZWQgdG8gZW5hYmxlIHBpbm5lZCBjcmVhdGlvbiB3aGljaCAKaXMgdXNlZCB0byBlbXVs
YXRlIHR0bV9ib19pbml0X3Jlc2VydmVkKCkgOikKCi9UaG9tYXMKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
