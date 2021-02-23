Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055CB322E25
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1736E845;
	Tue, 23 Feb 2021 15:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978646E845
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=3Hy7coD2Qahn0WXq3Yh0aiBE2cTU3et18fBwThw7Mnw=; 
 b=I+B/qqB1C7E5divaVqptOntPf78TU9ms9k3kXHNnmQr3WLXkzk/Dt+rziRAXU1/dh42jKgopZ1v1vZmaRx1ClT8IYEmbWd5nt5jqRa3zgi2hMoBBChAgB0u1cxiAwfYttCEXZitljvNEg7pLdzRvNO9rS7gWHXaO8sqSq8gKv0oA1KGE+LuYhAevDTuSie459bs2wZ+olL9piu2cDQGp6zBd4fKIRC8IFfa4dfqSk2mjCejDK3q+WuS8oIqR8g3XrRbL/TeRHKk6RQIsCFstlYhmf4SWEixPDpEkNe9CIUP3xiNyPhpJMur+0CgPXLW3P5/0GXb6WQ9bOZuEcbFsRQ==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=localhost) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lEa5v-0004dX-BW; Tue, 23 Feb 2021 16:59:27 +0100
From: Neil Roberts <nroberts@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
In-Reply-To: <CAKMK7uFs7z6fAXOntWwBNPBq26PBOkHJ09atv_cYeJCpk4FwjQ@mail.gmail.com>
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <87lfbfc5w2.fsf@yahoo.co.uk>
 <CAKMK7uFs7z6fAXOntWwBNPBq26PBOkHJ09atv_cYeJCpk4FwjQ@mail.gmail.com>
Date: Tue, 23 Feb 2021 16:59:17 +0100
Message-ID: <87im6idbca.fsf@yahoo.co.uk>
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cml0ZXM6Cgo+IGRybV9nZW1fc2htZW1f
ZmF1bHQoKSBkb2VzIG5vdCBzZWVtIHRvIGNoZWNrIGZvciBwdXJnZWQgb2JqZWN0cyBhdCBhbGwu
Cj4KPiBObyBpZGVhIGhvdyB0aGlzIHdvcmtzLCBvciBpZiBpdCBldmVyIHdvcmtlZCwgYnV0IHll
YWggc29tZXRoaW5nIGlzCj4gY2xlYXJseSBzdGlsbCBidXN0ZWQuCgpPaCBvZiBjb3Vyc2UsIHRo
ZSBmYXVsdCBoYW5kbGVyIGRvZXNu4oCZdCBjaGVjayB0aGlzLiBJ4oCZdmUgYWRkZWQgYSBzZWNv
bmQKcGF0Y2ggdG8gbWFrZSBpdCBjaGVjayBhbmQgcG9zdGVkIGl0IGFzIGEgc2VwYXJhdGUgc2Vy
aWVzIGhlcmU6CgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2
ZWwvMjAyMS1GZWJydWFyeS8yOTgxNzAuaHRtbAoKVGhlIHR3byBwYXRjaGVzIGNvbWJpbmVkIG1h
a2UgdGhlIElHVCB0ZXN0IHBhc3MuCgo+IERlZmluaXRlbHkgYSBnb29kIGlkYWUgdG8gaGF2ZSBh
biBpZ3QuIGJ0dyB0byBtYWtlIHRoYXQgZmFzdGVyIHlvdSBjYW4KPiBlaXRoZXIgdXNlIHRoZSB2
bV9kcm9wX2NhY2hlcyBmaWxlIGZyb20gcHJvYyAoaXQncyBhIGJpdCBhIGhhbW1lciksIG9yCj4g
d2hhdCBJIHJlY29tbWVuZDogSGF2ZSBhIGRlZGljYXRlZCBkZWJ1Z2ZzIGZpbGUgdG8gb25seSBk
cm9wCj4gZXZlcnl0aGluZyBmcm9tIHlvdXIgc2hyaW5rZXIuIFRoYXQncyBtdWNoIHF1aWNrZXIg
YW5kICBjb250cm9sbGVkLgo+IFNlZSBlLmcuIHR0bV90dF9kZWJ1Z2ZzX3NocmluayBmcm9tIGQ0
YmQ3Nzc2YTdhYyAoImRybS90dG06IHJld29yawo+IHR0bV90dCBwYWdlIGxpbWl0IHY0Iikgd2hp
Y2ggcmVjZW50bHkgbGFuZGVkIGluIGRybS1taXNjLW5leHQuCgpJIGFncmVlIGl0IHdvdWxkIGJl
IGdyZWF0IHRvIGhhdmUgYSBkZWJ1Z2ZzIG9wdGlvbiB0byB0cmlnZ2VyIHRoZSBwdXJnZS4KSSB3
b25kZXIgaWYgc29tZW9uZSBtb3JlIGludm9sdmVkIGluIFBhbmZyb3N0IHdvdWxkIGxpa2UgdG8g
aW1wbGVtZW50CnRoaXMsIGJlY2F1c2UgSSBhbSBhY3R1YWxseSB0cnlpbmcgdG8gd29yayBvbiBW
QzQgYW5kIHRoaXMgaXMgYWxyZWFkeQp0dXJuaW5nIG91dCB0byBiZSBxdWl0ZSBhIGxvdCBvZiB5
YWsgc2hhdmluZyA6KSBJ4oCZZCBhbHNvIGxpa2UgdG8KaW1wbGVtZW50IHRoZSBzYW1lIGRlYnVn
ZnMgb3B0aW9uIGFuZCBJR1QgdGVzdCBmb3IgVkM0LgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2su
CgpSZWdhcmRzLAotIE5laWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
