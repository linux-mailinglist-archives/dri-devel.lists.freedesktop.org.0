Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2878B127
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476C089C03;
	Tue, 13 Aug 2019 07:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016B789C03
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:32:03 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b29so68824398lfq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 00:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vxu83LzGun/cvg+At2wTJfRfSpQASHRNUqO+Ng51ie8=;
 b=JlrylqaRzaqGQR7rIsr+ABI0z8lmXg7Ci8ySkjpFb+xKs89EgxhZ8zz9lj4LDUxevb
 hGMth4k2JLGfm1wW61FSIxbG3mbRu9pg//WDBfvXSWEhylMWooYP4sdWe5vkS04kbeEq
 8qgGJlTs1J5Janr7RkTz/W1005VS5rbPbDNZjqjHh2SI2a5Nuxz7k4Mz6Y4TXmDT5dRU
 MHmRRkPgD/2K+kTlxlTsRqfxhrPHFrlhJ5q0SnkaaKpXkQPMxFUSTwHnAww2Zas71ONi
 ZVoiZLsdG9rQKGAbStnP8QZfG4fUA0fTr9N01lGaNWXHaxrZQwY87q01q9g1ZDkJSHP9
 9G9g==
X-Gm-Message-State: APjAAAX3zcRy6ql1FSewIE3rT0a8T1/z860uMEjQe+E0vYELBW8Tnlbt
 1IvSVjuI26Bveo5fNoCzytI=
X-Google-Smtp-Source: APXvYqyxKF3rXH4VHIfBOMLXFGVC72dhGFu+jR0IZAyJ29q6Vs2uMqPd2n5EUKqEtsqKjD1scZd+YA==
X-Received: by 2002:ac2:5976:: with SMTP id h22mr21755605lfp.79.1565681522140; 
 Tue, 13 Aug 2019 00:32:02 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t4sm23424123ljh.9.2019.08.13.00.32.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 00:32:01 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] drm/xen-front: Make structure fb_funcs
 constant
To: Nishka Dasgupta <nishkadg.linux@gmail.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
References: <20190813062712.24993-1-nishkadg.linux@gmail.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
Date: Tue, 13 Aug 2019 10:32:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813062712.24993-1-nishkadg.linux@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=vxu83LzGun/cvg+At2wTJfRfSpQASHRNUqO+Ng51ie8=;
 b=sXp80xqW3Rlpc3D+XtVSptkkayCz9E57QP8m8AIDRPT+Yt/VNcLGPv4C73rrlTWeAl
 OfAZuMyMDyfiKVgWn9f0YL/IueFXoHkfPcrtbQSTBzFYrxVz4T6HqPgWu/DJGgo1I5WY
 U5kBxz/wCf4ENAaKc/GYZVIVEXDr3Bc6tbMmWDeEjaHO/xv8Xcleb/efIskcETAUBDid
 9yRTDUCEhKu0I6qCpV4Eq1+hLZ9mPxUorsPqbLh+smqPXdqQYumxyDOCLIPhh8b3j+So
 W01UNLnOwelGIkWozq2avHKCEK58nGg4AvzwCWZ4UJFXbGL9OgOZWnLMxR48bEh354cR
 5maw==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTMvMTkgOToyNyBBTSwgTmlzaGthIERhc2d1cHRhIHdyb3RlOgo+IFN0YXRpYyBzdHJ1
Y3R1cmUgZmJfZnVuY3MsIG9mIHR5cGUgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzLCBpcyB1c2VkIG9u
bHkKPiB3aGVuIGl0IGlzIHBhc3NlZCB0byBkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2Z1bmNzKCkg
YXMgaXRzIGxhc3QKPiBhcmd1bWVudC4gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9mdW5jcyBkb2Vz
IG5vdCBtb2RpZnkgaXRzIGxzdCBhcmd1bWVudAo+IChmYl9mdW5jcykgYW5kIGhlbmNlIGZiX2Z1
bmNzIGlzIG5ldmVyIG1vZGlmaWVkLiBUaGVyZWZvcmUgbWFrZSBmYl9mdW5jcwo+IGNvbnN0YW50
IHRvIHByb3RlY3QgaXQgZnJvbSBmdXJ0aGVyIG1vZGlmaWNhdGlvbi4KPiBJc3N1ZSBmb3VuZCB3
aXRoIENvY2NpbmVsbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hr
YWRnLmxpbnV4QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udF9rbXMuYwo+IGluZGV4IGMyOTU1ZDM3NTM5NC4uNGE5ODRmNDU1NTVlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+IEBAIC00NSw3ICs0NSw3IEBA
IHN0YXRpYyB2b2lkIGZiX2Rlc3Ryb3koc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIpCj4gICAJ
ZHJtX2dlbV9mYl9kZXN0cm95KGZiKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgc3RydWN0IGRybV9m
cmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZnJhbWVidWZmZXJfZnVuY3MgZmJfZnVuY3MgPSB7Cj4gICAJLmRlc3Ryb3kgPSBmYl9kZXN0cm95
LAo+ICAgfTsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
