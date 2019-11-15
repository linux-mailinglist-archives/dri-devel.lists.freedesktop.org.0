Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F88FD256
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 02:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E416F3D0;
	Fri, 15 Nov 2019 01:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE006F3D0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 01:18:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j26so6654042lfh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 17:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wJ6/omUTJkJcn0C2qSs53kpo0Py+xxf6r4lxyXHfgd4=;
 b=OKTVZAEw0d4QRtK9/xfMATfRS6UgaP7oEA6EeXRsQ7/reTVIhTbYfaKxsouwoAR1iK
 oXsH6Sa7E5BSJ4GRxxcMuDxgTs8fyraHHLX0lpZ8lXPqYHelMqyYRSspfgVmrQHBeCJ7
 29Nzhf1/MwY4CVhgxYV4t2FVmFhXOtjukPtRJNaS/8Lu6kWHRO/EHj+p57J7enTML3/G
 8GIA63Lp9yjqW2DZRPgXtdQC2B+U2DiuLqhhsniIFSBi2QMsms/xyHnEu7gpBmzKbuKF
 1mSIq9wXx22wNvugFCwLDPXloOkd5+qRhXWihCq52ZHwRQosdtiCuDHTGcqGnc0mYdJu
 Hozw==
X-Gm-Message-State: APjAAAVY+HxpOfCpvNrPVx3BJct4Zj2eNg7DSznctx4bdqwPRHkZP4Se
 ydSGVvfKOtul4fdtG/hyl9Yoeljpqq7UlqvXALo=
X-Google-Smtp-Source: APXvYqwKxKRFoEkI95DiRbO+qNgpVmcEJlvMGbvy9N81Vkyy0QfuEiaR4yPHO6ViJKW93JlLhNPPwPdL9Crub+5WCgM=
X-Received: by 2002:a19:710d:: with SMTP id m13mr4053205lfc.160.1573780707495; 
 Thu, 14 Nov 2019 17:18:27 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Nov 2019 11:18:16 +1000
Message-ID: <CAPM=9twvcfHPb4nrAQnHaEWhQrbByR0CfGXbWo_479c3YR47uw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.4-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wJ6/omUTJkJcn0C2qSs53kpo0Py+xxf6r4lxyXHfgd4=;
 b=mZuh+aY4775QAzl8C1NUnjHXVLEakKuznAkRa4Q6zWEcMl1px6oQJteYfALdkSNM0I
 Cvp4xlEFnmLja2KzsFX1B5KnMLdCYWDAsymvcuCCrIgG83GHMUe1m3oJ+jfP+QQZdOi1
 ZWXr75jlhKH1zIKNLpgAOlYaOO53o8XXXjTRbR5XeuZ/C1fssNKQaU9256QJcBwOw2RW
 jKBZiUpz8oXgd6uLtFh4aHABk2XD3QVeNlo4TEOnlnpFRWiW9RjFXgtbO5K4NemNvDjw
 YFpfeo29F/IZhLTeN8+iclfzCfynXFi3578f2ybPwRRr6hsYigWLEcg/YFBcVyLEQrOV
 oLBg==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IExpbnVzLAoKQXNzdW1pbmcgYW4gcmM4IG1pZ2h0IGhhcHBlbiwgYW55d2F5cyBoZXJlIGlz
IHRoaXMgd2Vla3Mgbm9uLWludGVsIGh3CnZ1bG4gZml4ZXMgcHVsbC4gMyBkcml2ZXJzLCBhbGwg
c21hbGwgZml4ZXMuCgpUaGFua3MsCkRhdmUuCgpkcm0tZml4ZXMtMjAxOS0xMS0xNToKZHJtIGZp
eGVzIGZvciA1LjQtcmM4CgppOTE1OgotIE1PQ1MgdGFibGUgZml4ZXMgZm9yIEVITCBhbmQgVEdM
Ci0gVXBkYXRlIERpc3BsYXkncyByYXdjbG9jayBvbiByZXN1bWUKLSBHVlQncyBkbWFidWYgcmVm
ZXJlbmNlIGRyb3AgZml4CgphbWRncHU6Ci0gRml4IGEgcG90ZW50aWFsIGNyYXNoIGluIGZpcm13
YXJlIHBhcnNpbmcKCnN1bjRpOgotIE9uZSBmaXggdG8gdGhlIGRvdGNsb2NrIGRpdmlkZXJzIHJh
bmdlIGZvciBzdW40aQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDMxZjRmNWI0
OTVhNjJjOWE4YjE1YjFjMzU4MWFjZDVlZmViOWFmOGM6CgogIExpbnV4IDUuNC1yYzcgKDIwMTkt
MTEtMTAgMTY6MTc6MTUgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybSB0YWdzL2RybS1m
aXhlcy0yMDE5LTExLTE1Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMDdjZWNjYWNm
YjI3YmUwZTE1MWI4NzZjYWVkYTNhNTU2Y2VmMDk5YzoKCiAgTWVyZ2UgdGFnICdkcm0tZml4ZXMt
NS40LTIwMTktMTEtMTQnIG9mCmdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xp
bnV4IGludG8gZHJtLWZpeGVzICgyMDE5LTExLTE1CjEwOjM4OjM0ICsxMDAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpk
cm0gZml4ZXMgZm9yIDUuNC1yYzgKCmk5MTU6Ci0gTU9DUyB0YWJsZSBmaXhlcyBmb3IgRUhMIGFu
ZCBUR0wKLSBVcGRhdGUgRGlzcGxheSdzIHJhd2Nsb2NrIG9uIHJlc3VtZQotIEdWVCdzIGRtYWJ1
ZiByZWZlcmVuY2UgZHJvcCBmaXgKCmFtZGdwdToKLSBGaXggYSBwb3RlbnRpYWwgY3Jhc2ggaW4g
ZmlybXdhcmUgcGFyc2luZwoKc3VuNGk6Ci0gT25lIGZpeCB0byB0aGUgZG90Y2xvY2sgZGl2aWRl
cnMgcmFuZ2UgZm9yIHN1bjRpCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkRhdmUgQWlybGllICgzKToKICAgICAgTWVyZ2Ug
dGFnICdkcm0taW50ZWwtZml4ZXMtMjAxOS0xMS0xMycgb2YKZ2l0Oi8vYW5vbmdpdC5mcmVlZGVz
a3RvcC5vcmcvZHJtL2RybS1pbnRlbCBpbnRvIGRybS1maXhlcwogICAgICBNZXJnZSB0YWcgJ2Ry
bS1taXNjLWZpeGVzLTIwMTktMTEtMTMnIG9mCmdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3Jn
L2RybS9kcm0tbWlzYyBpbnRvIGRybS1maXhlcwogICAgICBNZXJnZSB0YWcgJ2RybS1maXhlcy01
LjQtMjAxOS0xMS0xNCcgb2YKZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGlu
dXggaW50byBkcm0tZml4ZXMKCkphbmkgTmlrdWxhICgxKToKICAgICAgZHJtL2k5MTU6IHVwZGF0
ZSByYXdjbGsgYWxzbyBvbiByZXN1bWUKCk1hdHQgUm9wZXIgKDIpOgogICAgICBSZXZlcnQgImRy
bS9pOTE1L2VobDogVXBkYXRlIE1PQ1MgdGFibGUgZm9yIEVITCIKICAgICAgZHJtL2k5MTUvdGds
OiBNT0NTIHRhYmxlIHVwZGF0ZQoKUGFuIEJpYW4gKDEpOgogICAgICBkcm0vaTkxNS9ndnQ6IGZp
eCBkcm9wcGluZyBvYmogcmVmZXJlbmNlIHR3aWNlCgpSb2RyaWdvIFZpdmkgKDEpOgogICAgICBN
ZXJnZSB0YWcgJ2d2dC1maXhlcy0yMDE5LTExLTEyJyBvZgpodHRwczovL2dpdGh1Yi5jb20vaW50
ZWwvZ3Z0LWxpbnV4IGludG8gZHJtLWludGVsLWZpeGVzCgpYaWFvamllIFl1YW4gKDEpOgogICAg
ICBkcm0vYW1kZ3B1OiBmaXggbnVsbCBwb2ludGVyIGRlcmVmIGluIGZpcm13YXJlIGhlYWRlciBw
cmludGluZwoKWXVuaGFvIFRpYW4gKDEpOgogICAgICBkcm0vc3VuNGk6IHRjb246IFNldCBtaW4g
ZGl2aXNpb24gb2YgVENPTjBfRENMSyB0byAxLgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYyAgICAgICAgICAgIHwgMzggKysrKysrKysrLS0tLS0tLS0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMgfCAgMyArKwog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbW9jcy5jICAgICAgICAgICAgICAgfCAxMCAr
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyAgICAgICAgICAgICAgICAg
IHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jICAgICAgICAgICAgICAg
ICAgICB8ICAzIC0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jICAgICAgICAg
ICAgICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDM3IGRl
bGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
