Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF56C8ABA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 16:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF516E054;
	Wed,  2 Oct 2019 14:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E116E054;
 Wed,  2 Oct 2019 14:17:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id i16so7404604wmd.3;
 Wed, 02 Oct 2019 07:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6ZK/alQJG/DzU2yr4fmPDAWsu9lpuXfvvu9e0XLg0VM=;
 b=cP0AhAwJY9ErDTyl2KuXJtlF0uujogH1L2HuYiNP4fUbFZs4P4hMviJLBtCnvRxYva
 ILhJnUpr07REtOZKvCrh4IibwLiln8jSUTZaEp2k/LE3R9P1XMZgUo+cDqZvySg7F6yM
 npBnmGCkZm00MD956wLDLlslZAHFmrButvRMv+f5Zkf1dLg3I7/IfTgyfqbnW4FD1pFg
 OMhzo98vr0w2yt3WL4USVhBq6hbsqpU4cCatujNLS7+UriDeImE02/EGBvr6gA0W0YNv
 VaUjCpS1cz+t2pp3HluxpfPbkbA/GiNf4KI1Fbf7wxhu0jFpL4XhbKvy45VBmZNjqOa2
 7m1A==
X-Gm-Message-State: APjAAAXtbgxp/7c/pD4Hr/IXoTrbXHzJjWFmFF3+rvnh6y4mQw++1R3g
 vRAUk1oEQGGPc6+i53CAEfKZM/EOPrd0YjjffKA=
X-Google-Smtp-Source: APXvYqyXYHJXAwnKoxIMcQTyz+KVy3BGpZtHLq8GhT6Hy6Pq77R1ldTnCYjHcoDu9jFPjmr39XnZGOn/DLiaiC8kTnQ=
X-Received: by 2002:a1c:1a45:: with SMTP id a66mr3100375wma.102.1570025839778; 
 Wed, 02 Oct 2019 07:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
In-Reply-To: <20191002120136.1777161-5-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 10:17:07 -0400
Message-ID: <CADnq5_PkTwTBbQY9JatZD2_sWjdU5_hK7V2GLfviEvMh_QB12Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6ZK/alQJG/DzU2yr4fmPDAWsu9lpuXfvvu9e0XLg0VM=;
 b=R9JOAAoirQ85aRbnoJE2ghGjMgnYZvgp/+N3TS16/mkj/h2NNpOiHgT9N4Vgb5ZFUr
 Qvt9YwtL7wwJGnMGjciAyBDekZP08zC/RE3WCJGsu54Kg60BFF1aRjSRZOlAexfn8HUG
 v9P0wmbcdn6mtEheFbcfdcbYIM7yWN3wnaXSfHIVlUyiWzoG8X+42qteH2PEW6Bod9ij
 YQ5czd+9r7Q5vkS6EEvyoKKuShp889JJ1P+rxHrMcZ4dTbwOQ7G+QM4EetpDK3dNgOFp
 bFZG6SemRrWRHzHE4w/TaSw0YYfUN+0ytvHd1Ea3x/2gSMAuj5O4UX3bjWSZ/jPdiEm6
 UV3Q==
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
Cc: clang-built-linux@googlegroups.com, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA4OjAzIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gSnVzdCBsaWtlIGFsbCB0aGUgb3RoZXIgdmFyaWFudHMsIHRoaXMgb25l
IHBhc3NlcyBpbnZhbGlkCj4gY29tcGlsZS10aW1lIG9wdGlvbnMgd2l0aCBjbGFuZyBhZnRlciB0
aGUgbmV3IGNvZGUgZ290Cj4gbWVyZ2VkOgo+Cj4gY2xhbmc6IGVycm9yOiB1bmtub3duIGFyZ3Vt
ZW50OiAnLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NCcKPiBzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI2NTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UubycgZmFpbGVkCj4KPiBVc2UgdGhlIHNh
bWUgdmFyaWFudCB0aGF0IHdlIGhhdmUgZm9yIGRjbjIwIHRvIGZpeCBjb21waWxhdGlvbi4KPgo+
IEZpeGVzOiBlY2VkNTFmOWJhYmIgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBodWJwIGJsb2NrIGZv
ciBSZW5vaXIgKHYyKSIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KCkknbSBnZXR0aW5nIGFuIGVycm9yIHdpdGggZ2NjIHdpdGggdGhpcyBwYXRjaDoKICBD
QyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjEvZGNu
MjFfcmVzb3VyY2Uubwpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Rj
bjIxL2RjbjIxX3Jlc291cmNlLmM6IEluCmZ1bmN0aW9uIOKAmGNhbGN1bGF0ZV93bV9zZXRfZm9y
X3ZsZXZlbOKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24y
MS9kY24yMV9yZXNvdXJjZS5jOjk2NDoyMjoKZXJyb3I6IFNTRSByZWdpc3RlciByZXR1cm4gd2l0
aCBTU0UgZGlzYWJsZWQKICB3bV9zZXQtPnVyZ2VudF9ucyA9IGdldF93bV91cmdlbnQoZG1sLCBw
aXBlcywgcGlwZV9jbnQpICogMTAwMDsKICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cm1ha2VbNF06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDoyNzM6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjEv
ZGNuMjFfcmVzb3VyY2Uub10gRXJyb3IKMQptYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6NDkwOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdV0gRXJyb3IgMgptYWtlWzNdOiAq
KiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlWzJdOiAqKiogW3NjcmlwdHMv
TWFrZWZpbGUuYnVpbGQ6NDkwOiBkcml2ZXJzL2dwdS9kcm1dIEVycm9yIDIKbWFrZVsxXTogKioq
IFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ5MDogZHJpdmVycy9ncHVdIEVycm9yIDIKbWFrZTog
KioqIFtNYWtlZmlsZToxMDgwOiBkcml2ZXJzXSBFcnJvciAyCgpBbGV4Cgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUgfCAxMiArKysrKysrKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZp
bGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUKPiBpbmRl
eCA4Y2Q5ZGU4YjFhN2EuLmVmNjczYmZmYzI0MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjEvTWFrZWZpbGUKPiBAQCAtMyw3ICszLDE3IEBACj4KPiAgRENO
MjEgPSBkY24yMV9odWJwLm8gZGNuMjFfaHViYnViLm8gZGNuMjFfcmVzb3VyY2Uubwo+Cj4gLUNG
TEFHU18kKEFNRERBTFBBVEgpL2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLm8gOj0gLW1oYXJkLWZs
b2F0IC1tc3NlIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQKPiAraWZuZXEgKCQoY2FsbCBj
Yy1vcHRpb24sIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQpLCkKPiArICAgICAgIGNjX3N0
YWNrX2FsaWduIDo9IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQKPiArZWxzZSBpZm5lcSAo
JChjYWxsIGNjLW9wdGlvbiwgLW1zdGFjay1hbGlnbm1lbnQ9MTYpLCkKPiArICAgICAgIGNjX3N0
YWNrX2FsaWduIDo9IC1tc3RhY2stYWxpZ25tZW50PTE2Cj4gK2VuZGlmCj4gKwo+ICtDRkxBR1Nf
JChBTUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAt
bXNzZSAkKGNjX3N0YWNrX2FsaWduKQo+ICsKPiAraWZkZWYgQ09ORklHX0NDX0lTX0NMQU5HCj4g
K0NGTEFHU18kKEFNRERBTFBBVEgpL2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLm8gKz0gLW1zc2Uy
Cj4gK2VuZGlmCj4KPiAgQU1EX0RBTF9EQ04yMSA9ICQoYWRkcHJlZml4ICQoQU1EREFMUEFUSCkv
ZGMvZGNuMjEvLCQoRENOMjEpKQo+Cj4gLS0KPiAyLjIwLjAKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
