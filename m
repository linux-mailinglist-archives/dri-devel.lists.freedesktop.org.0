Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEB171201
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97B989FBC;
	Thu, 27 Feb 2020 08:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23AF89FBC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 08:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9F5ED3FDD8;
 Thu, 27 Feb 2020 09:11:03 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=XxKN2Xlt; 
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
 with ESMTP id I4TNgQ69zXiU; Thu, 27 Feb 2020 09:11:01 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DEC903FD95;
 Thu, 27 Feb 2020 09:11:00 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 02844360161;
 Thu, 27 Feb 2020 09:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582791060; bh=4+EUKvhq052ADxUY5m3Qra0RsCbqHdQMZ0878ICxJ/A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XxKN2Xltkigp8bI3i4eY9sLbnotimpTjgwP/4RwY7bAC+p8ritoU52OUi85dFl1sE
 awh+0IsJUr1oaYibbpGRnRjHDYPDAYRZhh1Ok6JJlENqZf355Mv4guK/U2DwnTzige
 /msPpZyKFVYtYP64oOEkUgVja6dPnqpLzz+G3uhk=
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
Date: Thu, 27 Feb 2020 09:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
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
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 gurchetansingh@chromium.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8yNy8yMCA4OjUzIEFNLCBHZXJkIEhvZmZtYW5uIHdyb3RlOgo+ICAgIEhpLAo+Cj4+PiAr
CQlpZiAoIXNobWVtLT5tYXBfY2FjaGVkKQo+Pj4gKwkJCXByb3QgPSBwZ3Byb3Rfd3JpdGVjb21i
aW5lKHByb3QpOwo+Pj4gICAgCQlzaG1lbS0+dmFkZHIgPSB2bWFwKHNobWVtLT5wYWdlcywgb2Jq
LT5zaXplID4+IFBBR0VfU0hJRlQsCj4+PiAtCQkJCSAgICBWTV9NQVAsIHBncHJvdF93cml0ZWNv
bWJpbmUoUEFHRV9LRVJORUwpKTsKPj4+ICsJCQkJICAgIFZNX01BUCwgcHJvdCkKPj4KPj4gV291
bGRuJ3QgYSB2bWFwIHdpdGggcGdwcm90X3dyaXRlY29tYmluZSgpIGNyZWF0ZSBjb25mbGljdGlu
ZyBtYXBwaW5ncyB3aXRoCj4+IHRoZSBsaW5lYXIga2VybmVsIG1hcCB3aGljaCBpcyBub3Qgd3Jp
dGUtY29tYmluZWQ/Cj4gSSB0aGluayBzbywgeWVzLgo+Cj4+IE9yIGRvIHlvdSBjaGFuZ2UgdGhl
IGxpbmVhciBrZXJuZWwgbWFwIG9mIHRoZSBzaG1lbSBwYWdlcyBzb21ld2hlcmU/Cj4gSGF2bid0
IHNlZW4gYW55dGhpbmcgZG9pbmcgc28gd2hpbGUgYnJvd3NpbmcgdGhlIGNvZGUuCj4KPj4gdm1h
cCBieXBhc3Nlc3MgYXQgbGVhc3QgdGhlCj4+IHg4NiBQQVQgY29yZSBtYXBwaW5nIGNvbnNpc3Rl
bmN5IGNoZWNrIGFuZCB0aGlzIGNvdWxkIHBvdGVudGlhbGx5IGNhdXNlCj4+IHNwdXJpb3VzbHkg
b3ZlcndyaXR0ZW4gbWVtb3J5Lgo+IFdlbGwsIEkgZG9uJ3QgdGhpbmsgdGhlIGxpbmVhciBrZXJu
ZWwgbWFwIGlzIGV2ZXIgdXNlZCB0byBhY2Nlc3MgdGhlCj4gc2htZW0gZ2VtIG9iamVjdHMuICBT
byB3aGlsZSB0aGlzIGlzbid0IGV4YWN0bHkgY2xlYW4gaXQgc2hvdWxkbid0Cj4gY2F1c2UgcHJv
YmxlbXMgaW4gcHJhY3RpY2UuCj4KPiBTdWdnZXN0aW9ucyBob3cgdG8gZml4IHRoYXQ/Cj4KU28g
dGhpcyBoYXMgaGlzdG9yaWNhbGx5IGNhdXNlZCBwcm9ibGVtcyBzaW5jZSB0aGUgbGluZWFyIGtl
cm5lbCBtYXAgaGFzIApiZWVuIGFjY2Vzc2VkIHdoaWxlIHByZWZldGNoaW5nLCBldmVuIGlmIGl0
J3MgbmV2ZXIgdXNlZC4gU29tZSAKcHJvY2Vzc29ycyBsaWtlIEFNRCBhdGhsb24gYWN0dWFsbHkg
ZXZlbiB3cm90ZSBiYWNrIHRoZSBwcmVmZXRjaGVkIApjb250ZW50cyB3aXRob3V0IGV2ZXIgdXNp
bmcgaXQuCgpBbHNvIHRoZSBsaW5lYXIga2VybmVsIG1hcCBjb3VsZCBiZSBjYWNoZWQgc29tZXdo
ZXJlIGJlY2F1c2Ugb2YgdGhlIApwYWdlJ3MgcHJldmlvdXMgdXNhZ2UuIChoaWJlcm5hdGlvbsKg
IGZvciBleGFtcGxlPykKCkkgdGhpbmsgaXQgbWlnaHQgYmUgc2FmZSBmb3Igc29tZSBpbnRlZ3Jh
dGVkIGdyYXBoaWNzIHdoZXJlIHRoZSBkcml2ZXIgCm1haW50YWluZXJzIGNhbiBndWFyYW50ZWUg
dGhhdCBpdCdzIHNhZmUgb24gYWxsIHBhcnRpY3VsYXIgcHJvY2Vzc29ycyAKdXNlZCB3aXRoIHRo
YXQgZHJpdmVyLCBidXQgdGhlbiBJTU8gaXQgc2hvdWxkIGJlIG1vdmVkIG91dCB0byB0aG9zZSBk
cml2ZXJzLgoKT3RoZXIgZHJpdmVycyBuZWVkaW5nIHdyaXRlLWNvbWJpbmUgc2hvdWxkbid0IHJl
YWxseSB1c2Ugc2htZW0uCgpTbyBhZ2FpbiwgdG8gZml4IHRoZSByZWdyZXNzaW9uLCBjb3VsZCB3
ZSByZXZlcnQgMGJlODk1ODkzNjA3ZiAKKCJkcm0vc2htZW06IHN3aXRjaCBzaG1lbSBoZWxwZXIg
dG8gJmRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAiKSBvciBkb2VzIAp0aGF0IGhhdmUgb3RoZXIg
aW1wbGljYXRpb25zPwoKL1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
