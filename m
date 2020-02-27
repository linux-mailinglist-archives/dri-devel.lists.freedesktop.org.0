Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD611719F5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B2289EA3;
	Thu, 27 Feb 2020 13:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A72B89EA3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 13:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 6B47C3FFFF;
 Thu, 27 Feb 2020 14:49:29 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=EPN81Roz; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZpp5hhf_Jwg; Thu, 27 Feb 2020 14:49:28 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id F34FB3FFFE;
 Thu, 27 Feb 2020 14:49:26 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 27F77360058;
 Thu, 27 Feb 2020 14:49:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582811366; bh=dmA9EfEpLrguT6/Rljc0wE4Ag8/EI49OnW2QETp6mtc=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=EPN81Roz7tXs9Cw/4be9SSLQmZWi4wtXZXK8p54udnai4pfbkoaZUMngr+TBklMRJ
 itDjoZliExsMqXjg1lPzPokhPUoX02CsCemuGE5kxLWAwYn5e9IHj3DWoTfO3uAA6o
 PytqXJA4og9dpjaDtHGYEMZOhE/OuUlVCv0WQhvE=
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
 <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
 <20200227105643.h4klc3ybhpwv2l3x@sirius.home.kraxel.org>
 <68a05ace-40bc-76d6-5464-2c96328874b9@shipmail.org>
 <20200227132137.irruicvlkxpdo3so@sirius.home.kraxel.org>
 <78eb099e-020f-91d1-672e-15176bf12cd4@shipmail.org>
Organization: VMware Inc.
Message-ID: <b6f21041-d114-96c5-8f86-13eafd102c5d@shipmail.org>
Date: Thu, 27 Feb 2020 14:49:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <78eb099e-020f-91d1-672e-15176bf12cd4@shipmail.org>
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, yuq825@gmail.com, tzimmermann@suse.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8yNy8yMCAyOjQ0IFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPiBI
aSwKPgo+IE9uIDIvMjcvMjAgMjoyMSBQTSwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPj4gwqDCoCBI
aSwKPj4KPj4+PiBTbyBJJ2QgbGlrZSB0byBwdXNoIHBhdGNoZXMgMSsyIHRvIC1maXhlcyBhbmQg
c29ydCBldmVyeXRoaW5nIGVsc2UgCj4+Pj4gbGF0ZXIKPj4+PiBpbiAtbmV4dC7CoCBPSz8KPj4+
IE9LIHdpdGggbWUuCj4+IERvbmUuCj4+Cj4+Pj4gWyBjb250ZXh0OiB3aHkgc2htZW0gaGVscGVy
cyB1c2UgcGdwcm90X3dyaXRlY29tYmluZSArIAo+Pj4+IHBncHJvdF9kZWNyeXB0ZWQ/Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3ZSBnZXQgY29uZmxpY3RpbmcgbWFwcGluZ3MgYmVjYXVz
ZSBvZiB0aGF0LCBsaW5lYXIga2VybmVsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAg
dnMuIGdlbSBvYmplY3Qgdm1hcC9tbWFwIF0KPj4+IERvIHdlIGhhdmUgYW55IGlkZWEgd2hhdCBk
cml2ZXJzIGFyZSBhY3R1YWxseSB1c2luZwo+Pj4gd3JpdGUtY29tYmluZSBhbmQgZGVjcnlwdGVk
Pwo+PiBkcml2ZXJzL2dwdS9kcm0jIGZpbmQgLW5hbWUgS2NvbmZpZyogLXByaW50IHwgeGFyZ3Mg
Z3JlcCAtbCAKPj4gRFJNX0dFTV9TSE1FTV9IRUxQRVIKPj4gLi9saW1hL0tjb25maWcKPj4gLi90
aW55L0tjb25maWcKPj4gLi9jaXJydXMvS2NvbmZpZwo+PiAuL0tjb25maWcKPj4gLi9wYW5mcm9z
dC9LY29uZmlnCj4+IC4vdWRsL0tjb25maWcKPj4gLi92M2QvS2NvbmZpZwo+PiAuL3ZpcnRpby9L
Y29uZmlnCj4+Cj4+IHZpcnRpbyBuZWVkcyBjYWNoZWQuCj4+IGNpcnJ1cyt1ZGwgc2hvdWxkIGJl
IG9rIHdpdGggY2FjaGVkIHRvby4KPj4KPj4gTm90IGNsdWUgYWJvdXQgdGhlIG90aGVycyAobGlt
YSwgdGlueSwgcGFuZnJvc3QsIHYzZCkuwqAgTWF5YmUgdGhleSB1c2UKPj4gd3JpdGUtY29tYmlu
ZSBqdXN0IGJlY2F1c2UgdGhpcyBpcyB3aGF0IHRoZXkgZ290IGJ5IGRlZmF1bHQgZnJvbQo+PiBk
cm1fZ2VtX21tYXBfb2JqKCkuwqAgTWF5YmUgdGhleSBhY3R1YWxseSBuZWVkIHRoYXQuwqAgVHJ5
aW5nIHRvIENjOgo+PiBtYWludGFpbnRlcnMgKGFuZCBkcm9wIHN0YWJsZUApLgo+Pgo+PiBPbiBk
ZWNyeXB0ZWQ6IEkgZ3Vlc3MgdGhhdCBpcyBvbmx5IHJlbGV2YW50IGZvciB2aXJ0dWFsIG1hY2hp
bmVzLCBpLmUuCj4+IHZpcnRpby1ncHUgYW5kIGNpcnJ1cz8KPj4KPj4gdmlydGlvLWdwdSBuZWVk
cyBpdCwgb3RoZXJ3aXNlIHRoZSBob3N0IGNhbid0IHNob3cgdGhlIHZpcnR1YWwgZGlzcGxheS4K
Pj4gY2lycnVzIGJvdW5jZXMgZXZlcnl0aGluZyB2aWEgYmxpdHMgdG8gdnJhbSwgc28gaXQgc2hv
dWxkIGJlIG9rIHdpdGhvdXQKPj4gZGVjcnlwdGVkLsKgIEkgZ3Vlc3MgdGhhdCBpbXBsaWVzIHdl
IHNob3VsZCBtYWtlIGRlY3J5cHRlZCBjb25maWd1cmFibGUuCj4KPiBEZWNyeXB0ZWQgaGVyZSBp
cyBjbGVhcmx5IGluY29ycmVjdCBhbmQgdmlvbGF0ZXMgdGhlIFNFViBzcGVjLCAKPiByZWdhcmRs
ZXNzIG9mIGEgY29uZmlnIG9wdGlvbi4KPiBUaGUgb25seSBjb3JyZWN0IHdheSBpcyBjdXJyZW50
bHkgdG8gdXNlIGRtYV9hbGxvY19jb2hlcmVudCgpIGFuZCAKPiBtbWFwX2NvaGVyZW50KCkgdG8g
YWxsb2NhdGUgZGVjcnlwdGVkIG1lbW9yeSBhbmQgdGhlbiB1c2UgdGhlIAo+IHBncHJvdF9kZWNy
eXB0ZWQgZmxhZy4KPgo+IFNpbmNlIHRoZSBzYW1lIHBhZ2UgaXMgYWxpYXNlZCB3aXRoIHR3byBw
aHlzaWNhbCBhZGRyZXNzZXMgKG9uZSAKPiBlbmNyeXB0ZWQgYW5kIG9uZSBkZWNyeXB0ZWQpIHN3
aXRjaGluZyBtZW1vcnkgZnJvbSBvbmUgdG8gdGhlIG90aGVyIAo+IG5lZWRzIGV4dGVuc2l2ZSBo
YW5kbGluZyBldmVuIHRvIGZsdXNoIHN0YWxlIHZtYXBzLi4uCj4KPiBTbyBpZiB2aXJ0aW8tZ3B1
IG5lZWRzIGl0IGZvciBzb21lIGJvcywgaXQgc2hvdWxkIG1vdmUgYXdheSBmcm9tIHNobWVtIAo+
IGZvciB0aG9zZSBib3MuCgooQnV0IHRoaXMgaXMgb2YgY291cnNlIHVwIHRvIHRoZSB2aXJ0aW8t
Z3B1IGFuZCBkcm0gbWFpbnRhaW5lcnMpLCBidXQgCklNTywgYWdhaW4sIHBncHJvdF9kZWNyeXB0
ZWQoKSBzaG91bGRuJ3QgYmUgcGFydCBvZiBnZW5lcmljIGhlbHBlcnMuCgovVGhvbWFzCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
