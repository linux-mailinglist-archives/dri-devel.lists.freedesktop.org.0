Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7C4B305
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405376E2C8;
	Wed, 19 Jun 2019 07:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A646E2C8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 07:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 520F240974;
 Wed, 19 Jun 2019 09:26:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4ND-lMKx3Rj; Wed, 19 Jun 2019 09:26:40 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 424F13F6D0;
 Wed, 19 Jun 2019 09:26:39 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8218736017D;
 Wed, 19 Jun 2019 09:26:39 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-next
Date: Wed, 19 Jun 2019 09:25:31 +0200
Message-Id: <20190619072531.4026-1-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560929199; bh=7rHwlXkr2jwVnaah2RaN5a9P6hQ/QW8DI4kn5sGwU8w=;
 h=From:To:Cc:Subject:Date:From;
 b=ibfzESxqP7cM7bpF3BkDLDMONIR0dyWqe8TREx/NioqCmBI2NaO2irnPzoEO9hRGu
 5lxU/10iDo8zUoj8+M4/+D3r8Lx5uBCxFsD/a5oDRmq8cfDkhz1hQ1uUjGxd/9NZ25
 Jfv5JRrnATEMA6TwEbLZtDX+270iPBxm3KHAXAT0=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ibfzESxq; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas@shipmail.org>,
 linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGF2ZSwgRGFuaWVsCgotIFRoZSBjb2hlcmVudCBtZW1vcnkgY2hhbmdlcyBpbmNsdWRpbmcgbW0g
Y2hhbmdlcy4KLSBTb21lIHZtd2dmeCBkZWJ1ZyBmaXhlcy4KLSBSZW1vdmFsIG9mIHZtd2dmeCBs
ZWdhY3kgc2VjdXJpdHkgY2hlY2tzLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCA1NjE1NjRiZWEzMjQ4MjkzMzk4ZGMzMmVjMzZkYTQwZmI3MWZhZWQwOgoKICBNZXJnZSB0YWcg
J29tYXBkcm0tNS4zJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9tYmEvbGludXggaW50byBkcm0tbmV4dCAoMjAxOS0wNi0xMSAxMzoyOTozMyArMDIw
MCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9w
bGUuZnJlZWRlc2t0b3Aub3JnL350aG9tYXNoL2xpbnV4LyB2bXdnZngtbmV4dAoKZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDliYmZkYTU0NGVkNzllOGU5YWJkZTI3YmZlMmM4NTQyOGQ1
ODJlN2I6CgogIGRybS92bXdnZng6IEtpbGwgdW5uZWVkZWQgbGVnYWN5IHNlY3VyaXR5IGZlYXR1
cmVzICgyMDE5LTA2LTE4IDE1OjIyOjQ4ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpEZWVwYWsgUmF3YXQgKDIp
OgogICAgICBkcm0vdm13Z2Z4OiBBZGQgZGVidWcgbWVzc2FnZSBmb3IgbGF5b3V0IGNoYW5nZSBp
b2N0bAogICAgICBkcm0vdm13Z2Z4OiBVc2UgVk1XX0RFQlVHX0tNUyBmb3Igdm13Z2Z4IG1vZGUt
c2V0dGluZyB1c2VyIGVycm9ycwoKVGhvbWFzIEhlbGxzdHJvbSAoMTEpOgogICAgICBkcm0vdm13
Z2Z4OiBBc3NpZ24gZXZpY3Rpb24gcHJpb3JpdGllcyB0byByZXNvdXJjZXMKICAgICAgbW06IEFs
bG93IHRoZSBbcGFnZXxwZm5dX21rd3JpdGUgY2FsbGJhY2tzIHRvIGRyb3AgdGhlIG1tYXBfc2Vt
CiAgICAgIG1tOiBBZGQgYW4gYXBwbHlfdG9fcGZuX3JhbmdlIGludGVyZmFjZQogICAgICBtbTog
QWRkIHdyaXRlLXByb3RlY3QgYW5kIGNsZWFuIHV0aWxpdGllcyBmb3IgYWRkcmVzcyBzcGFjZSBy
YW5nZXMKICAgICAgZHJtL3R0bTogQWxsb3cgdGhlIGRyaXZlciB0byBwcm92aWRlIHRoZSB0dG0g
c3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0CiAgICAgIGRybS90dG06IFRUTSBmYXVsdCBoYW5k
bGVyIGhlbHBlcnMKICAgICAgZHJtL3Ztd2dmeDogSW1wbGVtZW50IGFuIGluZnJhc3RydWN0dXJl
IGZvciB3cml0ZS1jb2hlcmVudCByZXNvdXJjZXMKICAgICAgZHJtL3Ztd2dmeDogVXNlIGFuIFJC
dHJlZSBpbnN0ZWFkIG9mIGxpbmtlZCBsaXN0IGZvciBNT0IgcmVzb3VyY2VzCiAgICAgIGRybS92
bXdnZng6IEltcGxlbWVudCBhbiBpbmZyYXN0cnVjdHVyZSBmb3IgcmVhZC1jb2hlcmVudCByZXNv
dXJjZXMKICAgICAgZHJtL3Ztd2dmeDogQWRkIHN1cmZhY2UgZGlydHktdHJhY2tpbmcgY2FsbGJh
Y2tzCiAgICAgIGRybS92bXdnZng6IEtpbGwgdW5uZWVkZWQgbGVnYWN5IHNlY3VyaXR5IGZlYXR1
cmVzCgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAgICAgICAgICAgICAg
ICAgICAgfCAxNjkgKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgIHwgICAyICstCiAuLi4vZHJtL3Ztd2dmeC9kZXZpY2VfaW5jbHVk
ZS9zdmdhM2Rfc3VyZmFjZWRlZnMuaCB8IDIzMyArKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3R0bV9sb2NrLmMgICAgICAgICAgICAgICAgICB8IDEwMCAtLS0tLQogZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC90dG1fbG9jay5oICAgICAgICAgICAgICAgICAgfCAgMzAgLS0KIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgICAgICAgICAgICAgICAgIHwgIDEyICstCiBk
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jb250ZXh0LmMgICAgICAgICAgICB8ICAgNCAr
CiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jb3RhYmxlLmMgICAgICAgICAgICB8ICAx
MyArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgICAgICAgICAgICAg
fCAxNjcgKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICAg
ICAgICAgICAgIHwgMTM5ICsrKystLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhl
Y2J1Zi5jICAgICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
a21zLmMgICAgICAgICAgICAgICAgfCAgMjMgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3BhZ2VfZGlydHkuYyAgICAgICAgIHwgNDcyICsrKysrKysrKysrKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYyAgICAgICAgICAgfCAyNDUgKysr
KysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Jlc291cmNlX3ByaXYuaCAg
ICAgIHwgIDE1ICsKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3NoYWRlci5jICAgICAg
ICAgICAgIHwgICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMg
ICAgICAgICAgICB8IDQwNSArKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X3ZhbGlkYXRpb24uYyAgICAgICAgIHwgIDc0ICsrKy0KIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3ZhbGlkYXRpb24uaCAgICAgICAgIHwgIDE2ICstCiBpbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArCiBpbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBpbmNs
dWRlL2xpbnV4L21tLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxOSArLQog
aW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmggICAgICAgICAgICAgICAgICAgICAgfCAgIDQg
Ky0KIG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICsKIG1tL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKIG1tL2FzX2RpcnR5X2hlbHBlcnMuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMzAwICsrKysrKysrKysrKysKIG1tL21lbW9yeS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTQ1ICsrKysrLS0KIDMwIGZpbGVzIGNoYW5nZWQsIDIxMzYg
aW5zZXJ0aW9ucygrKSwgNDgzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3BhZ2VfZGlydHkuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IG1tL2FzX2RpcnR5X2hlbHBlcnMuYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
