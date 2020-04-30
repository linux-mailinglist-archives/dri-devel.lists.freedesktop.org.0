Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE21BF991
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24636E890;
	Thu, 30 Apr 2020 13:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF856E890;
 Thu, 30 Apr 2020 13:32:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x18so6937451wrq.2;
 Thu, 30 Apr 2020 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tR6vRgNB+Hy246JhqymbwaLVzJsBiAZ16wFlCyZoIo8=;
 b=cXzTQ8x1IacAUDwWqH77bcYiQ3Q9+0Or86Jeepl+dh6EiX7iccljrvlzrYElCE18of
 6QjJnbdWdjJAEEPm1ur3wTrOsAaCbR6oMhU+EMsdt+4XkLwFWClUIKDJBee3reQtdQrv
 LRm1eqbRctoOTCgSYyhug46go3Qf8E5qUfbG13fMVvRL0GZUzqERCu2KcOx1y4AhZ9lD
 qaM7HS7kFs7yCNrJeop3fnumwv1CwShwAn6WXrgZAMjQjP2O3z5QU+kEGtuEPCCo6uHE
 mI2MMz2Vudd0RhUOT+S2BcQdr3r9taN61UvGHf5kn/joctiscPmR9pNkHw96UyPrlfOj
 kdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=tR6vRgNB+Hy246JhqymbwaLVzJsBiAZ16wFlCyZoIo8=;
 b=sAhtoQd9KWvLO2cZTAfym60QlbrRZE4Gq/ZzBCuqaZYooTH+iZgBsKYgcSSjIePisl
 BYBBi+GDjVAdzgeL/jtdGOII00zjjOBiiMsMdyyLSjIReBhLEYgPD4rY7mt7/GGJvP8K
 QEhqhh6R0GbGCaW+Thx39Q5T9wd8YLjAMqSBXYEE9m0SaZy3Ciz2RVvX86m4tYNjbnBQ
 t3jlNtR6WdMnwigCGROVSfGZEkBC1QKRTpKD1URKdKZeUpey2WtvwdVidffoM/R0i3SL
 Bup89Jnt+8MVusF5n8jBT1xh8gWuPn6Kv6KpssQnKbLERyG5fgGJKCzNw1eaucBXUSRm
 s9dA==
X-Gm-Message-State: AGi0PuYkgCUCsqzCVcUNgib50TwCAh2+8xgwWFxFbHUHrRq7E1h5NzzO
 69lhpNaQTdEcA9EjACVAZwI=
X-Google-Smtp-Source: APiQypIsi6HpI6xvS1a5t9+IPa9RzomTPfSLeqPDbwTXUT48xAeab9ptQXYSu63nyI8JV19zgiUe2w==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr4192968wrn.108.1588253574598; 
 Thu, 30 Apr 2020 06:32:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k3sm4383362wru.90.2020.04.30.06.32.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Apr 2020 06:32:54 -0700 (PDT)
Subject: Re: [PATCH] drm/radeon: cleanup coding style a bit
To: Bernard <bernard@vivo.com>, Joe Perches <joe@perches.com>
References: <AO2AmAAQCPm7TNcK3aT264ov.3.1588244411605.Hmail.bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <81368fdb-87c5-d963-68c2-e02d0c100363@gmail.com>
Date: Thu, 30 Apr 2020 15:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <AO2AmAAQCPm7TNcK3aT264ov.3.1588244411605.Hmail.bernard@vivo.com>
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
Reply-To: christian.koenig@amd.com
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMjAgdW0gMTM6MDAgc2NocmllYiBCZXJuYXJkOgo+Cj4g5Y+R5Lu25Lq677yaSm9l
IFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiDlj5HpgIHml6XmnJ/vvJoyMDIwLTA0LTI3IDAx
OjUzOjA2Cj4g5pS25Lu25Lq677yaIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+LEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4sQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPiwiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2aWQx
Llpob3VAYW1kLmNvbT4sRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPixEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+LGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcsbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
IOaKhOmAgeS6uu+8mm9wZW5zb3VyY2Uua2VybmVsQHZpdm8uY29tCj4g5Li76aKY77yaUmU6IFtQ
QVRDSF0gZHJtL3JhZGVvbjogY2xlYW51cCBjb2Rpbmcgc3R5bGUgYSBiaXQ+T24gU3VuLCAyMDIw
LTA0LTI2IGF0IDE1OjE4ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMjYu
MDQuMjAgdW0gMTU6MTIgc2NocmllYiBCZXJuYXJkIFpoYW86Cj4+Pj4gTWF5YmUgbm8gbmVlZCB0
byBjaGVjayB3cyBiZWZvcmUga21hbGxvYywga21hbGxvYyB3aWxsIGNoZWNrCj4+Pj4gaXRzZWxm
LCBrbWFsbG9jYHMgbG9naWMgaXMgaWYgcHRyIGlzIE5VTEwsIGttYWxsb2Mgd2lsbCBqdXN0Cj4+
Pj4gcmV0dXJuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRA
dml2by5jb20+Cj4+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+Pj4KPj4+IEknbSB3b25kZXJpbmcgd2h5IHRoZSBhdXRvbWF0ZWQgc2Ny
aXB0cyBoYXZlbid0IGZvdW5kIHRoYXQgb25lIGJlZm9yZS4KPj4gYmVjYXVzZSB0aGlzIHBhdHRl
cm4gaXMKPj4KPj4gCWlmIChmb28pCj4+IAkJa2ZyZWUoYmFyKTsKPj4KPj4gYW5kIHRoZSBwYXR0
ZXJuIGxvb2tlZCBmb3IgaXM6Cj4+Cj4+IAlpZiAoZm9vKQo+PiAJCWtmcmVlKGZvbyk7Cj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbS5jIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9hdG9tLmMKPj4gW10KPj4+PiBAQCAtMTIxMSw4ICsxMjExLDcgQEAgc3Rh
dGljIGludCBhdG9tX2V4ZWN1dGVfdGFibGVfbG9ja2VkKHN0cnVjdCBhdG9tX2NvbnRleHQgKmN0
eCwgaW50IGluZGV4LCB1aW50MzIKPj4+PiAgICAJU0RFQlVHKCI8PFxuIik7Cj4+Pj4gICAgCj4+
Pj4gICAgZnJlZToKPj4+PiAtCWlmICh3cykKPj4+PiAtCQlrZnJlZShlY3R4LndzKTsKPj4+PiAr
CWtmcmVlKGVjdHgud3MpOwo+Pj4+ICAgIAlyZXR1cm4gcmV0Owo+Pj4+ICAgIH0KPj4gSSdtIHdv
bmRlcmluZyBpZiB0aGlzIHJlbW92YWwgaXMgY29ycmVjdCBhcyB0aGUgZnVuY3Rpb24KPj4gaXMg
bmFtZWQgX2xvY2tlZCBhbmQgaXQgbWF5IGJlIHJlY3Vyc2l2ZSBvciBjYWxsZWQgdW5kZXIKPj4g
c29tZSBleHRlcm5hbCBsb2NrLgo+Pgo+IEhpCj4gSSBhbSBhIGxpdHRsZSBjb25mdXNlZCBhYm91
dCB0aGlzLiBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgY2FsbGVyIGd1YXJhbnRlZXMgdGhlIGxvY2sg
cHJvdGVjdGlvbgo+IHRoYXQgd2Ugd2lsbCBub3QgcmVsZWFzZSB0aGUgd3JvbmcgcG9pbnRlci4g
QW5kIHRoZSBOVUxMIGNoZWNrIGlzIHRoZSBzYW1lIHdpdGggdGhlIGZpcnN0IGNoZWNrIGluIGtm
cmVlPwo+IE1heWJlIHdlIGRvIG5vdCBuZWVkIGNoZWNrIHR3aWNoLgoKSSBkb24ndCB1bmRlcnN0
YW5kIHRoZSBjb21tZW50IGVpdGhlci4gV2hlbiB5b3UgbG9vayBhdCB0aGUgZnVuY3Rpb24geW91
IApzZWUgdGhhdCBjb2RlIGlzIGZyZWVpbmcgdXAgdGhlIHRlbXBvcmFyeSBhbGxvY2F0ZWQgYnVm
ZmVyIHdoaWNoIGlzIHRvIApsYXJnZSBmb3IgdGhlIHN0YWNrLgoKSW4gb3RoZXIgd29yZHMgd2Ug
a2NhbGxvYygpIHRoaXMgYnVmZmVyIGEgZmV3IGxpbmVzIGFib3ZlIGFuZCBmcmVlIGl0IApoZXJl
IGFnYWluLiBTbyBJIHRoaW5rIHRoZSBwYXRjaCBpcyBwZXJmZWN0bHkgdmFsaWQuCgpXaGF0IHdl
IGNvdWxkIGRvIGlzIHRvIHVwZGF0ZSB0aGUgY29jaSBwYXR0ZXJuIHRvIGNhdGNoIHRoaXMgYXMg
d2VsbCwgCmJ1dCB0aGlzIGNhc2UgaXMgc28gcmFyZSB0aGF0IGl0IGlzIHByb2JhYmx5IG5vdCB3
b3J0aCBpdC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+IEJlcm5hcmQKPgo+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
