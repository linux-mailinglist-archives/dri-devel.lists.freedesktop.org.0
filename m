Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990C113C8A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 08:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042666F59B;
	Thu,  5 Dec 2019 07:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3176 seconds by postgrey-1.36 at gabe;
 Thu, 05 Dec 2019 02:56:14 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D7F6E977
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 02:56:14 +0000 (UTC)
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id xB51xvft020982;
 Thu, 5 Dec 2019 10:59:57 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp);
 Thu, 05 Dec 2019 10:59:57 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp)
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id xB51xvmN020973;
 Thu, 5 Dec 2019 10:59:57 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: (from i-love@localhost)
 by www262.sakura.ne.jp (8.15.2/8.15.2/Submit) id xB51xuco020972;
 Thu, 5 Dec 2019 10:59:56 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Message-Id: <201912050159.xB51xuco020972@www262.sakura.ne.jp>
X-Authentication-Warning: www262.sakura.ne.jp: i-love set sender to
 penguin-kernel@i-love.sakura.ne.jp using -f
Subject: Re: KASAN: slab-out-of-bounds Read in
 =?ISO-2022-JP?B?ZmJjb25fZ2V0X2Zv?= =?ISO-2022-JP?B?bnQ=?=
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Grzegorz Halat <ghalat@redhat.com>
MIME-Version: 1.0
Date: Thu, 05 Dec 2019 10:59:56 +0900
References: <0000000000002cfc3a0598d42b70@google.com>
 <0000000000003e640e0598e7abc3@google.com>
In-Reply-To: <0000000000003e640e0598e7abc3@google.com>
X-Mailman-Approved-At: Thu, 05 Dec 2019 07:44:39 +0000
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, hpa@zytor.com,
 dri-devel@lists.freedesktop.org, ruscur@russell.cc,
 syzbot <syzbot+4455ca3b3291de891abc@syzkaller.appspotmail.com>,
 takedakn@nttdata.co.jp, stewart@linux.vnet.ibm.com, daniel.thompson@linaro.org,
 mpe@ellerman.id.au, x86@kernel.org, jmorris@namei.org,
 kasan-dev@googlegroups.com, mingo@redhat.com, aryabinin@virtuozzo.com,
 serge@hallyn.com, gleb@kernel.org, syzkaller-bugs@googlegroups.com,
 gwshan@linux.vnet.ibm.com, tglx@linutronix.de, dvyukov@google.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 pbonzini@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8uCgpzeXpib3QgaXMgcmVwb3J0aW5nIHRoYXQgbWVtb3J5IGFsbG9jYXRpb24gc2l6ZSBh
dCBmYmNvbl9zZXRfZm9udCgpIGlzIHRvbyBzbWFsbApiZWNhdXNlIGZvbnQncyBoZWlnaHQgaXMg
cm91bmRlZCB1cCBmcm9tIDEwIHRvIDE2IGFmdGVyIG1lbW9yeSBhbGxvY2F0aW9uLgoKLS0tLS0t
LS0tLQpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwppbmRleCBjOTIzNWEyZjQyZjguLjY4ZmU2NmU0
MzVkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKQEAgLTI0NjEsNiArMjQ2MSw3IEBAIHN0
YXRpYyBpbnQgZmJjb25fZ2V0X2ZvbnQoc3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgY29uc29s
ZV9mb250ICpmb250KQogCiAJaWYgKGZvbnQtPndpZHRoIDw9IDgpIHsKIAkJaiA9IHZjLT52Y19m
b250LmhlaWdodDsKKwkJcHJpbnRrKCJrc2l6ZShmb250ZGF0YSk9JWx1IGZvbnQtPmNoYXJjb3Vu
dD0lZCB2Yy0+dmNfZm9udC5oZWlnaHQ9JWQgZm9udC0+d2lkdGg9JXVcbiIsIGtzaXplKGZvbnRk
YXRhKSwgZm9udC0+Y2hhcmNvdW50LCBqLCBmb250LT53aWR0aCk7CiAJCWZvciAoaSA9IDA7IGkg
PCBmb250LT5jaGFyY291bnQ7IGkrKykgewogCQkJbWVtY3B5KGRhdGEsIGZvbnRkYXRhLCBqKTsK
IAkJCW1lbXNldChkYXRhICsgaiwgMCwgMzIgLSBqKTsKQEAgLTI2NjEsNiArMjY2Miw4IEBAIHN0
YXRpYyBpbnQgZmJjb25fc2V0X2ZvbnQoc3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgY29uc29s
ZV9mb250ICpmb250LAogCXNpemUgPSBoICogcGl0Y2ggKiBjaGFyY291bnQ7CiAKIAluZXdfZGF0
YSA9IGttYWxsb2MoRk9OVF9FWFRSQV9XT1JEUyAqIHNpemVvZihpbnQpICsgc2l6ZSwgR0ZQX1VT
RVIpOworCWlmIChuZXdfZGF0YSkKKwkJcHJpbnRrKCJrc2l6ZShuZXdfZGF0YSk9JWx1IGg9JXUg
cGl0Y2g9JXUgY2hhcmNvdW50PSV1IGZvbnQtPndpZHRoPSV1XG4iLCBrc2l6ZShuZXdfZGF0YSks
IGgsIHBpdGNoLCBjaGFyY291bnQsIGZvbnQtPndpZHRoKTsKIAogCWlmICghbmV3X2RhdGEpCiAJ
CXJldHVybiAtRU5PTUVNOwotLS0tLS0tLS0tCgpOb3JtYWwgdXNhZ2U6CgpbICAgMjcuMzA1Mjkz
XSBrc2l6ZShuZXdfZGF0YSk9ODE5MiBoPTE2IHBpdGNoPTEgY2hhcmNvdW50PTI1NiBmb250LT53
aWR0aD04ClsgICAyNy4zMjg1MjddIGtzaXplKG5ld19kYXRhKT04MTkyIGg9MTYgcGl0Y2g9MSBj
aGFyY291bnQ9MjU2IGZvbnQtPndpZHRoPTgKWyAgIDI3LjM2MjU1MV0ga3NpemUobmV3X2RhdGEp
PTgxOTIgaD0xNiBwaXRjaD0xIGNoYXJjb3VudD0yNTYgZm9udC0+d2lkdGg9OApbICAgMjcuMzg1
MDg0XSBrc2l6ZShuZXdfZGF0YSk9ODE5MiBoPTE2IHBpdGNoPTEgY2hhcmNvdW50PTI1NiBmb250
LT53aWR0aD04ClsgICAyNy4zODc2NTNdIGtzaXplKG5ld19kYXRhKT04MTkyIGg9MTYgcGl0Y2g9
MSBjaGFyY291bnQ9MjU2IGZvbnQtPndpZHRoPTgKWyAgIDI3LjQxNzU2Ml0ga3NpemUobmV3X2Rh
dGEpPTgxOTIgaD0xNiBwaXRjaD0xIGNoYXJjb3VudD0yNTYgZm9udC0+d2lkdGg9OApbICAgMjcu
NDM3ODA4XSBrc2l6ZShuZXdfZGF0YSk9ODE5MiBoPTE2IHBpdGNoPTEgY2hhcmNvdW50PTI1NiBm
b250LT53aWR0aD04ClsgICAyNy40NDA3MzhdIGtzaXplKG5ld19kYXRhKT04MTkyIGg9MTYgcGl0
Y2g9MSBjaGFyY291bnQ9MjU2IGZvbnQtPndpZHRoPTgKWyAgIDI3LjQ2MTE1N10ga3NpemUobmV3
X2RhdGEpPTgxOTIgaD0xNiBwaXRjaD0xIGNoYXJjb3VudD0yNTYgZm9udC0+d2lkdGg9OApbICAg
MjcuNDk1MzQ2XSBrc2l6ZShuZXdfZGF0YSk9ODE5MiBoPTE2IHBpdGNoPTEgY2hhcmNvdW50PTI1
NiBmb250LT53aWR0aD04ClsgICAyNy42MDczNzJdIGtzaXplKG5ld19kYXRhKT04MTkyIGg9MTYg
cGl0Y2g9MSBjaGFyY291bnQ9MjU2IGZvbnQtPndpZHRoPTgKWyAgIDI3LjY1NTY3NF0ga3NpemUo
bmV3X2RhdGEpPTgxOTIgaD0xNiBwaXRjaD0xIGNoYXJjb3VudD0yNTYgZm9udC0+d2lkdGg9OApb
ICAgMjcuNjc1MzEwXSBrc2l6ZShuZXdfZGF0YSk9ODE5MiBoPTE2IHBpdGNoPTEgY2hhcmNvdW50
PTI1NiBmb250LT53aWR0aD04ClsgICAyNy43MDIxOTNdIGtzaXplKG5ld19kYXRhKT04MTkyIGg9
MTYgcGl0Y2g9MSBjaGFyY291bnQ9MjU2IGZvbnQtPndpZHRoPTgKCnN5emJvdCdzIHRlc3RjYXNl
OgoKWyAgMTE1Ljc4NDg5M10ga3NpemUobmV3X2RhdGEpPTQwOTYgaD0xMCBwaXRjaD0xIGNoYXJj
b3VudD0yNTYgZm9udC0+d2lkdGg9OApbICAxMTUuNzkwMjY5XSBrc2l6ZShmb250ZGF0YSk9NDA5
NiBmb250LT5jaGFyY291bnQ9MjU2IHZjLT52Y19mb250LmhlaWdodD0xNiBmb250LT53aWR0aD04
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
