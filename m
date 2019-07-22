Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8717270884
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1743889DCF;
	Mon, 22 Jul 2019 18:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3E589DCF;
 Mon, 22 Jul 2019 18:27:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DADDE80478;
 Mon, 22 Jul 2019 20:27:32 +0200 (CEST)
Date: Mon, 22 Jul 2019 20:27:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/via: drop use of DRM(READ|WRITE) macros
Message-ID: <20190722182731.GA791@ravnborg.org>
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-2-sam@ravnborg.org>
 <CACvgo52wD5pMjz4jEFMJXQ3kb-PDOkjyfGHhR5PeAT72otjv1g@mail.gmail.com>
 <20190722161720.GA14638@ravnborg.org>
 <CACvgo51_T1rcTnK7dYtQVdRTtcEd8am04THidD-CrHwdS3hk9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51_T1rcTnK7dYtQVdRTtcEd8am04THidD-CrHwdS3hk9w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=vxqJ-7BKnAbTNeuM4hIA:9 a=CjuIK1q_8ugA:10
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1haWwuCgo+ID4gPiBJTUhPIGEgZmFyIGJldHRlciBpZGVhIGlzIHRvIGV4cGFuZCB0aGVz
ZSBtYWNyb3MgYXMgc3RhdGljIGlubGluZSBmdW5jdGlvbnMuCj4gPiA+IFRoZSBleHRyYSBib251
cyBoZXJlIGlzIHRoYXQgdGhlIHBzZXVkby1tYWdpY2FsIFZJQV9CQVNFIHdpbGwgYWxzbyBkaXNh
cHBlYXIuCj4gPiA+Cj4gPiA+IFNpbmNlIGFsbCB0aGUgVklBX1JFQUQ4IGFyZSB1c2VkIGZvciBt
YXNraW5nLCBvbmUgbWlnaHQgYXMgd2VsbCBkcm9wCj4gPiA+IHRoZW0gaW4gZmF2b3VyIG9mIHZp
YV9tYXNrKCkuCgpMaWtlIHRoaXM6CnN0YXRpYyBpbmxpbmUgdTMyIHZpYV9yZWFkKHN0cnVjdCBk
cm1fdmlhX3ByaXZhdGUgKmRldl9wcml2LCB1MzIgcmVnKQp7CiAgICAgICAgcmV0dXJuIHJlYWRs
KCh2b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1taW8tPmhhbmRsZSArIHJlZykpOwp9CgpzdGF0
aWMgaW5saW5lIHZvaWQgdmlhX3dyaXRlKHN0cnVjdCBkcm1fdmlhX3ByaXZhdGUgKmRldl9wcml2
LCB1MzIgcmVnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiB2YWwpCnsKICAgICAg
ICB3cml0ZWwodmFsLCAodm9pZCBfX2lvbWVtICopKGRldl9wcml2LT5tbWlvLT5oYW5kbGUgKyBy
ZWcpKTsKfQoKc3RhdGljIGlubGluZSB2b2lkIHZpYV93cml0ZTgoc3RydWN0IGRybV92aWFfcHJp
dmF0ZSAqZGV2X3ByaXYsIHUzMiByZWcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUz
MiB2YWwpCnsKICAgICAgICB3cml0ZWIodmFsLCAodm9pZCBfX2lvbWVtICopKGRldl9wcml2LT5t
bWlvLT5oYW5kbGUgKyByZWcpKTsKfQoKc3RhdGljIGlubGluZSB2b2lkIHZpYV93cml0ZThfbWFz
a19vcihzdHJ1Y3QgZHJtX3ZpYV9wcml2YXRlICpkZXZfcHJpdiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgcmVnLCB1MzIgbWFzaykKewogICAgICAgIHUzMiB2YWw7
CgogICAgICAgIHZhbCA9IHJlYWRiKCh2b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1taW8tPmhh
bmRsZSArIHJlZykpOwogICAgICAgIHdyaXRlYih2YWwgfCBtYXNrLCAodm9pZCBfX2lvbWVtICop
KGRldl9wcml2LT5tbWlvLT5oYW5kbGUgKyByZWcpKTsKfQoKc3RhdGljIGlubGluZSB2b2lkIHZp
YV93cml0ZThfbWFza19hbmQoc3RydWN0IGRybV92aWFfcHJpdmF0ZSAqZGV2X3ByaXYsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiByZWcsIHUzMiBtYXNrKQp7CiAg
ICAgICAgdTMyIHZhbDsKCiAgICAgICAgdmFsID0gcmVhZGIoKHZvaWQgX19pb21lbSAqKShkZXZf
cHJpdi0+bW1pby0+aGFuZGxlICsgcmVnKSk7CiAgICAgICAgd3JpdGViKHZhbCAmIG1hc2ssICh2
b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1taW8tPmhhbmRsZSArIHJlZykpOwp9CgpQYXRjaGVz
IGFyZSBhbG1vc3QgcmVhZHksIGJ1dCBpZiB0aGVyZSBpcyBhbnkgcXVpY2sgZmVlZGJhY2sgbGV0
IG1lCmtub3cuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
