Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC32D8E24
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 16:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0487D89C55;
	Sun, 13 Dec 2020 15:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7A589C55
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 15:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 6C00A3F3A4;
 Sun, 13 Dec 2020 16:09:27 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=BtTGWjBo; 
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
 with ESMTP id b8MrLjVMarb0; Sun, 13 Dec 2020 16:09:26 +0100 (CET)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 056793F26D;
 Sun, 13 Dec 2020 16:09:25 +0100 (CET)
Received: from [192.168.0.110] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 743743601D5;
 Sun, 13 Dec 2020 16:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1607872165; bh=TPw3vbZAu372oaSlTLbVGXRvcXPa8FUhbBFxlhwtdSw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BtTGWjBo3HiNajfx7wpfTlx4U1ewvN9Vk7KC+wDOyTroEk92g5SBGafJXaDNtp98U
 M/B+HnHp5hxbyvYhULbT4z7rd6kPylBsPgpFURDHTI6zIaytUTAHgGY9Fh4OY124lY
 XJdWY88lzViuJ3y9UVhgEb8Zus1OyYwKmvtTb+5g=
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
To: Jason Gunthorpe <jgg@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
 <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
 <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
 <20201211124618.GC552508@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <ae0e1e69-6550-94fb-c2b2-1ea04a0ae936@shipmail.org>
Date: Sun, 13 Dec 2020 16:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211124618.GC552508@nvidia.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzExLzIwIDE6NDYgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBGcmksIERl
YyAxMSwgMjAyMCBhdCAwODo1MDo1M0FNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwp
IHdyb3RlOgo+Cj4+IE15IHVuZGVyc3RhbmRpbmcgb2YgdGhpcyBwYXJ0aWN1bGFyIGNhc2UgaXMg
dGhhdCBoYXJkd2FyZSB3b3VsZCBjb250aW51ZSB0bwo+PiBETUEgdG8gb3JwaGFuZWQgcGFnZXMg
dGhhdCBhcmUgcGlubmVkIHVudGlsIHRoZSBkcml2ZXIgaXMgZG9uZSB3aXRoCj4+IERNQSwKPiBt
bXUgbm90aWZpZXIgcmVwbGFjZXMgcGlubmluZyBhcyB0aGUgbG9ja2luZyBtZWNoYW5pc20uIERy
aXZlcnMgdXNpbmcKPiBtbXUgbm90aWZpZXIgc2hvdWxkIG5vdCBiZSB0YWtpbmcgcGlucy4KPgo+
IEtlZXAgaW4gbWluZCB0aGlzIHdhcyBhbGwgYnVpbHQgZm9yIEhXIHdpdGggcmVhbCBzaGFkb3cg
cGFnZSB0YWJsZXMKPiB0aGF0IGNhbiBkbyBmaW5lIGdyYWluZWQgbWFuaXB1bGF0aW9uLgpPSyB5
ZXMsIHRoYXQgbWFrZXMgc2Vuc2UgYW5kIGluIHRoYXQgY29udGV4dCB0aGUgZmVuY2Ugd2FpdCBp
cyBlYXNpZXIgdG8gCnVuZGVyc3RhbmQuIExvb2tzIGxpa2UgZm9yIGV4YW1wbGUgdGhlIHJhZGVv
biBkcml2ZXIgaXMgdXNpbmcgdGhlIApub3RpZmllciArIGdldF91c2VyX3BhZ2VzKCkgYnV0IHRo
ZXJlIGl0IGxvb2tzIGxpa2UgaXQncyB1c2VkIHRvIGF2b2lkIApoYXZpbmcgZ2V0X3VzZXJfcGFn
ZXMoKSBjbGFzaCB3aXRoIGludmFsaWRhdGlvbi4KCi9UaG9tYXMKCgo+Cj4gVGhlIEdQVSB2ZXJz
aW9uIG9mIHRoaXMgdG8gaW5zdGVhZCBtYW5pcHVsYXRlIGEgY29tbWFuZCBxdWV1ZSBpcyBhIGJp
Zwo+IGFiZXJyYXRpb24gZnJvbSB3aGF0IHdhcyBpbnRlbmRlZC4KPgo+IEphc29uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
