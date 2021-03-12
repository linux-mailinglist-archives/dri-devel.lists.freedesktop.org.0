Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2533899F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 11:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F346E0D2;
	Fri, 12 Mar 2021 10:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7D6E0D2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 10:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 0A1B83F5D8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:06:23 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="WQIMkQBM";
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
 with ESMTP id oHpnwt1ARhy0 for <dri-devel@lists.freedesktop.org>;
 Fri, 12 Mar 2021 11:06:22 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6EC733F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:06:20 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A3B09360133
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615543580; bh=E10liZEeMVR4UvDQGmHZyF/HEl2hyJS7mgWs7m8zY+M=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=WQIMkQBMTSCOa/zBO+Iz1d1JMYiQ+zBl6PtWMl61QTP1iDFA5TScIXj5oK0mRaX9m
 VEM5h8R4D0elX5mnQQecuk/ONMA4pOxs5/GfoJlgNqcxK87J/aj4GrfJZOsTBDvdXv
 FzDsTa21NjHQJYceZZfqt+MWwrYInod7d48b13DA=
Subject: Re: vmwgfx leaking bo pins?
To: dri-devel@lists.freedesktop.org
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
 <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
 <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <48d5e3f3-0b42-a9e4-6e5c-591806e873ff@shipmail.org>
Date: Fri, 12 Mar 2021 11:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMTIvMjEgMTI6MDIgQU0sIFphY2sgUnVzaW4gd3JvdGU6Cj4KPj4gT24gTWFyIDExLCAy
MDIxLCBhdCAxNzozNSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSA8dGhvbWFzX29zQHNoaXBt
YWlsLm9yZz4gd3JvdGU6Cj4+Cj4+IEhpLCBaYWNrCj4+Cj4+IE9uIDMvMTEvMjEgMTA6MDcgUE0s
IFphY2sgUnVzaW4gd3JvdGU6Cj4+Pj4gT24gTWFyIDExLCAyMDIxLCBhdCAwNTo0NiwgVGhvbWFz
IEhlbGxzdHLDtm0gKEludGVsKSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Pj4K
Pj4+PiBIaSwKPj4+Pgo+Pj4+IEkgdHJpZWQgbGF0ZXN0IGRybS1maXhlcyB0b2RheSBhbmQgc2F3
IGEgbG90IG9mIHRoZXNlOiBGYWxsb3V0IGZyb20gdHRtIHJld29yaz8KPj4+IFllcywgSSBmaXhl
ZCB0aGlzIGluIGQxYTczYzY0MWFmZDI2MTdiZDgwYmNlOGI3MWEwOTZmYzViNzRiN2UgaXQgd2Fz
IGluIGRybS1taXNjLW5leHQgaW4gdGhlIGRybS1taXNjIHRyZWUgZm9yIGEgd2hpbGUgYnV0IGhh
c27igJl0IGJlZW4gbWVyZ2VkIGZvciA1LjEyLgo+Pj4KPj4+IHoKPj4+Cj4+IEhtbSwgeWVzIGJ1
dCBkb2Vzbid0IHRoYXQgZml4IHRyaXAgdGhlIHR0bV9ib191bnBpbigpIGRtYV9yZXN2X2Fzc2Vy
dF9oZWxkKGJvLT5iYXNlLnJlc3YpPwo+IE5vLCBkb2VzbuKAmXQgc2VlbSB0by4gVEJIIEnigJlt
IG5vdCBzdXJlIHdoeSBteXNlbGYsIGJ1dCBpdCBzZWVtcyB0byBiZSB3b3JraW5nIGZpbmUuCj4K
PgpXaXRoIENPTkZJR19QUk9WRV9MT0NLSU5HPXkgSSBzZWUgdGhpczoKClvCoMKgwqAgNy4xMTcx
NDVdIFtkcm1dIEZJRk8gYXQgMHgwMDAwMDAwMGZlMDAwMDAwIHNpemUgaXMgODE5MiBraUIKW8Kg
wqDCoCA3LjExNzI4NF0gW2RybV0gVlJBTSBhdCAweDAwMDAwMDAwZTgwMDAwMDAgc2l6ZSBpcyAx
MzEwNzIga2lCClvCoMKgwqAgNy4xMTcyOTFdIElORk86IHRyeWluZyB0byByZWdpc3RlciBub24t
c3RhdGljIGtleS4KW8KgwqDCoCA3LjExNzI5NV0gdGhlIGNvZGUgaXMgZmluZSBidXQgbmVlZHMg
bG9ja2RlcCBhbm5vdGF0aW9uLgpbwqDCoMKgIDcuMTE3Mjk4XSB0dXJuaW5nIG9mZiB0aGUgbG9j
a2luZyBjb3JyZWN0bmVzcyB2YWxpZGF0b3IKCldoaWNoIHdpbGwgcHJvYmFibHkgbWFzayB0aGF0
IGRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpCgovVGhvbWFzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
