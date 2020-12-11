Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603292D7117
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 08:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034A46EC6F;
	Fri, 11 Dec 2020 07:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0366EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 07:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D95B43F4C5;
 Fri, 11 Dec 2020 08:50:56 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=PIHLSTtD; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpi_L901FfAT; Fri, 11 Dec 2020 08:50:56 +0100 (CET)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 9E0793F439;
 Fri, 11 Dec 2020 08:50:54 +0100 (CET)
Received: from [192.168.0.110] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 14826360070;
 Fri, 11 Dec 2020 08:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1607673054; bh=U3qKQa/7MGG5lGrXKjgSbYXjQ6fpweq8MGu5ZXjVx2Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PIHLSTtDDZ6edwGEwwUo3gS2RuiPOayJemXVEMZqPA1ooXp0oMK4ZQVvBXye9/uKg
 kEsrHihfWQKmuHo9A3nW3Ay96FQageIVNQLKpGDaWqvnoRmhoRGTDW/0JPpexqbDWX
 jxBLAfC0j1vS/LAFEexrIaZRK8daBKirB00zkYQ4=
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
 <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
Date: Fri, 11 Dec 2020 08:50:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENocmlzdGlhbgoKVGhhbmtzIGZvciB0aGUgcmVwbHkuCgpPbiAxMi8xMC8yMCAxMTo1MyBB
TSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwOS4xMi4yMCB1bSAxNzo0NiBzY2hyaWVi
IFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6Cj4+Cj4+IE9uIDEyLzkvMjAgNTozNyBQTSwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24gV2VkLCBEZWMgMDksIDIwMjAgYXQgMDU6MzY6MTZQ
TSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSAKPj4+IHdyb3RlOgo+Pj4+IEphc29u
LCBDaHJpc3RpYW4KPj4+Pgo+Pj4+IEluIG1vc3QgaW1wbGVtZW50YXRpb25zIG9mIHRoZSBjYWxs
YmFjayBtZW50aW9uZWQgaW4gdGhlIHN1YmplY3QgCj4+Pj4gdGhlcmUncyBhCj4+Pj4gZmVuY2Ug
d2FpdC4KPj4+PiBXaGF0IGV4YWN0bHkgaXMgaXQgbmVlZGVkIGZvcj8KPj4+IEludmFsaWRhdGUg
bXVzdCBzdG9wIERNQSBiZWZvcmUgcmV0dXJuaW5nLCBzbyBwcmVzdW1hYmx5IGRyaXZlcnMgdXNp
bmcKPj4+IGEgZG1hIGZlbmNlIGFyZSByZWx5aW5nIG9uIGEgZG1hIGZlbmNlIG1lY2hhbmlzbSB0
byBzdG9wIERNQS4KPj4KPj4gWWVzLCBzbyBmYXIgSSBmb2xsb3csIGJ1dCB3aGF0J3MgdGhlIHJl
YXNvbiBkcml2ZXJzIG5lZWQgdG8gc3RvcCBETUE/Cj4KPiBXZWxsIGluIGdlbmVyYWwgYW4gaW52
YWxpZGF0aW9uIG1lYW5zIHRoYXQgdGhlIHNwZWNpZmllZCBwYXJ0IG9mIHRoZSAKPiBwYWdlIHRh
YmxlcyBhcmUgdXBkYXRlZCwgZWl0aGVyIHdpdGggbmV3IGFkZHJlc3NlcyBvciBuZXcgYWNjZXNz
IGZsYWdzLgo+Cj4gSW4gYm90aCBjYXNlcyB5b3UgbmVlZCB0byBzdG9wIHRoZSBETUEgYmVjYXVz
ZSB5b3UgY291bGQgb3RoZXJ3aXNlIAo+IHdvcmsgd2l0aCBzdGFsZSBkYXRhLCBlLmcuIHJlYWQv
d3JpdGUgd2l0aCB0aGUgd3JvbmcgYWRkcmVzc2VzIG9yIAo+IHdyaXRlIHRvIGEgcmVhZCBvbmx5
IHJlZ2lvbiBldGMuLi4KClllcy4gVGhhdCdzIGNsZWFyLiBJJ20ganVzdCB0cnlpbmcgdG8gdW5k
ZXJzdGFuZCB0aGUgY29tcGxldGUgCmltcGxpY2F0aW9ucyBvZiBkb2luZyB0aGF0LgoKPgo+PiBJ
cyBpdCBmb3IgaW52bGlkYXRpb24gYmVmb3JlIGJyZWFraW5nIENPVyBhZnRlciBmb3JrIG9yIHNv
bWV0aGluZyAKPj4gcmVsYXRlZD8KPgo+IFRoaXMgaXMganVzdCBvbmUgb2YgbWFueSB1c2UgY2Fz
ZXMgd2hpY2ggY291bGQgaW52YWxpZGF0ZSBhIHJhbmdlLiBCdXQgCj4gdGhlcmUgYXJlIG1hbnkg
bW9yZSwgYm90aCBmcm9tIHRoZSBrZXJuZWwgYXMgd2VsbCBhcyB1c2Vyc3BhY2UuCj4KPiBKdXN0
IGltYWdpbmcgdGhhdCB1c2Vyc3BhY2UgZmlyc3QgbW1hcHMoKSBzb21lIGFub255bW91cyBtZW1v
cnkgci93LCAKPiBzdGFydHMgYSBETUEgdG8gaXQgYW5kIHdoaWxlIHRoZSBETUEgaXMgb25nb2lu
ZyBkb2VzIGEgcmVhZG9ubHkgbW1hcCgpIAo+IG9mIGxpYmMgdG8gdGhlIHNhbWUgbG9jYXRpb24u
CgpNeSB1bmRlcnN0YW5kaW5nIG9mIHRoaXMgcGFydGljdWxhciBjYXNlIGlzIHRoYXQgaGFyZHdh
cmUgd291bGQgY29udGludWUgCnRvIERNQSB0byBvcnBoYW5lZCBwYWdlcyB0aGF0IGFyZSBwaW5u
ZWQgdW50aWwgdGhlIGRyaXZlciBpcyBkb25lIHdpdGggCkRNQSwgdW5sZXNzIGhhcmR3YXJlIHdv
dWxkIHNvbWVob3cgaW4tZmxpZ2h0IHBpY2sgdXAgdGhlIG5ldyBQVEUgCmFkZHJlc3NlcyBwb2lu
dGluZyB0byBsaWJjIGJ1dCBub3QgdGhlIHByb3RlY3Rpb24/CgpUaGFua3MsCgpUaG9tYXMKCgo+
Cj4gU2luY2UgbW9zdCBoYXJkd2FyZSBkb2Vzbid0IGhhdmUgcmVjb3ZlcmFibGUgcGFnZSBmYXVs
dHMgZ3Vlc3Mgd2hhdCAKPiB3b3VsZCBoYXBwZW4gaWYgd2UgZG9uJ3Qgd2FpdCBmb3IgdGhlIERN
QSB0byBmaW5pc2g/IFRoYXQgd291bGQgYmUgYSAKPiBzZWN1cml0eSBob2xlIHlvdSBjYW4gcHVz
aCBhbiBlbGVwaGFudCB0aHJvdWdoIDopCj4KPiBDaGVlcnMsCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+
IFRoYW5rcywKPj4KPj4gVGhvbWFzCj4+Cj4+Pgo+Pj4gSmFzb24KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
