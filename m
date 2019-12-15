Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F74C11FFBF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC22C6E191;
	Mon, 16 Dec 2019 08:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ED76E212
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 03:17:19 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id k10so1337177qve.7
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 19:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=/dXw9e16vwl8LpxK98yuq5eDs/kqmpne1VxegZwo9tU=;
 b=vTcdmZlKxf6Ut2mCo3MRUIykmRVOIPR2SVz/XMIIfmlf/CcR506FaZII7DWsRM3CHr
 75t2eanICwi/fUz5NNcTcLldWv0vqC/gj/g40ABeMzqbMJ/FmaHIIUFdlVfthXI2Sw1v
 Hh1U26lmbHakoyOqgN8XPmHJDBaGLmyqvia0gvl5LRV74J/Nff/hsv1lzqO+80XT4wKW
 1hCHVfvRXrh9jcpQ6c1k3mb1scR3m8Z3IjsivBU208msc8JVqlo+3kqOgjbFerQSJCW7
 T59YDUW02RVo6sAw/GlY15kwdIlEpUXY2GaKej0Ra0+h4nR2FBUSEGlQQ5Q0CjlpKLOk
 BQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=/dXw9e16vwl8LpxK98yuq5eDs/kqmpne1VxegZwo9tU=;
 b=hU3OBvH18daVg2EJC/aCAD9MtGe5NiGQhxuWevqZhsmxBwfbUzIKO/vn04jFPFpyEQ
 sCIHVxtB2ReT/J4RRq3D+LyswF9AS88xYOG5eOvxg9HPZcwK5d1i7Ntl9q1bkASI6RA5
 DgIBrMxrJBSpMc9Y8Jc65Yf17ChHt6cDGOvJUKpyEYZFNcZDqwpUg84nHGugHeRJAOZF
 n1bcdjZPWIWzfdUFrOMOlPz/NH0S0+lZgCl48284ECAOi69bRZCNf0ODV1qO7hmFqVE5
 2eRNMMk7zgZbtCvTnoPVH8Sugzqhhxza3m0nMUY4LXIiiqJDmR83qGgBc7lZgxeOGPYS
 3Nyw==
X-Gm-Message-State: APjAAAVaGB8MK/acw2bDINnzLTtsQnp9NmHc5ruHCNo5mNfZ1L8p6Iub
 UUgPZU+sS23TM1U/z+Gyug==
X-Google-Smtp-Source: APXvYqzBXdaiKTf32Px9Udixmb+daFEYrWp8FC6bTC09CpUnoxtDzvVcUtp18RU54sNJ609QMeCjIA==
X-Received: by 2002:a05:6214:7cc:: with SMTP id
 bb12mr5862753qvb.207.1576379838584; 
 Sat, 14 Dec 2019 19:17:18 -0800 (PST)
Received: from [120.7.1.38] ([184.175.21.212])
 by smtp.gmail.com with ESMTPSA id c84sm4567540qkg.78.2019.12.14.19.17.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Dec 2019 19:17:17 -0800 (PST)
To: hch@lst.de, DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Woody Suwalski <terraluna977@gmail.com>
Subject: Regression in 5.4 kernel on 32-bit Radeon IBM T40
Message-ID: <400f6ce9-e360-0860-ca2a-fb8bccdcdc9b@gmail.com>
Date: Sat, 14 Dec 2019 22:17:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.5
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pavel Machek <pavel@ucw.cz>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVncmVzc2lvbiBpbiA1LjQga2VybmVsIG9uIDMyLWJpdCBSYWRlb24gSUJNIFQ0MAp0cmlnZ2Vy
ZWQgYnkKY29tbWl0IDMzYjNhZDM3ODhhYmE4NDZmYzhiOWEwNjVmZTI2ODVhMGI2NGY3MTMKQXV0
aG9yOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KRGF0ZTrCoMKgIFRodSBBdWcgMTUg
MDk6Mjc6MDAgMjAxOSArMDIwMAoKSG93ZHksClRoZSBhYm92ZSBwYXRjaCBoYXMgdHJpZ2dlcmVk
IGEgZGlzcGxheSBwcm9ibGVtIG9uIElCTSBUaGlua3BhZCBUNDAsIAp3aGVyZSB0aGUgc2NyZWVu
IGlzIGNvdmVyZWQgd2l0aCBhIGxvdHMgb2YgcmFuZG9tIHNob3J0IGJsYWNrIGhvcml6b250YWwg
CmxpbmVzLCBvciBkaXN0b3J0ZWQgbGV0dGVycyBpbiBYIHRlcm1zLgoKVGhlIGN1bHByaXQgc2Vl
bXMgdG8gYmUgdGhhdCB0aGUgZG1hX2dldF9yZXF1aXJlZF9tYXNrKCkgaXMgcmV0dXJuaW5nIGEg
CnZhbHVlIDB4M2ZmZmZmZmYKd2hpY2ggaXMgc21hbGxlciB0aGFuIGRtYV9nZXRfbWFzaygpMHhm
ZmZmZmZmZi5UaGF0IHJlc3VsdHMgaW4gCmRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoKT09MCBpbiB0
dG1fYm9fZGV2aWNlKCksIGFuZCB1c2luZyA0MC1iaXRzIGRtYSAKaW5zdGVhZCBvZiAzMi1iaXRz
LgoKSWYgSSBoYXJkY29kZSAiMSIgYXMgdGhlIGxhc3QgcGFyYW1ldGVyIHRvIHR0bV9ib19kZXZp
Y2VfaW5pdCgpIGluIHBsYWNlIApvZiBhIGNhbGwgdG8gZG1hX2FkZHJlc3NpbmdfbGltaXRlZCgp
LHRoZSBwcm9ibGVtIGdvZXMgYXdheS4KCkkgaGF2ZSBhZGRlZCB0aGUgZGVidWcgbGluZXMgc3Rh
cnRpbmcgd2l0aCAid21zOiIgdG8gdGhlIHN0YXJ0IG9mIApyYWRlb25fdHRtX2luaXQoKSBhbmQg
b2YgcmFkZW9uX2RldmljZV9pbml0KClwcmludGluZyB0aGUgaW50ZXJlc3RpbmcgCnZhcmlhYmxl
cy4KLy4uLi4KW8KgwqDCoCAyLjA5MTY5Ml0gTGludXggYWdwZ2FydCBpbnRlcmZhY2UgdjAuMTAz
ClvCoMKgwqAgMi4wOTIzODBdIGFncGdhcnQtaW50ZWwgMDAwMDowMDowMC4wOiBJbnRlbCA4NTVQ
TSBDaGlwc2V0ClvCoMKgwqAgMi4xMDc3MDZdIGFncGdhcnQtaW50ZWwgMDAwMDowMDowMC4wOiBB
R1AgYXBlcnR1cmUgaXMgMjU2TSBAIDB4ZDAwMDAwMDAKW8KgwqDCoCAyLjEwODExMV0gW2RybV0g
cmFkZW9uIGtlcm5lbCBtb2Rlc2V0dGluZyBlbmFibGVkLgpbwqDCoMKgIDIuMTA4MjAwXSByYWRl
b24gMDAwMDowMTowMC4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUKW8KgwqDCoCAy
LjEwOTM2NV0gQ29uc29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBkdW1teSBkZXZpY2UgODB4MjUK
KioqKioqKiByYWRlb25fZGV2aWNlX2luaXQoKQpbwqDCoMKgIDIuMTEwNzEyXSB3bXM6IHJhZGVv
bl9pbml0IGZsYWdzID0gMHg5MDAwMwpbwqDCoMKgIDIuMTEwNzE4XSBbZHJtXSBpbml0aWFsaXpp
bmcga2VybmVsIG1vZGVzZXR0aW5nIChSVjIwMCAKMHgxMDAyOjB4NEM1NyAweDEwMTQ6MHgwNTMw
IDB4MDApLgpbwqDCoMKgIDIuMTExMjIwXSBhZ3BnYXJ0LWludGVsIDAwMDA6MDA6MDAuMDogQUdQ
IDIuMCBicmlkZ2UKW8KgwqDCoCAyLjExMTIzM10gYWdwZ2FydC1pbnRlbCAwMDAwOjAwOjAwLjA6
IHB1dHRpbmcgQUdQIFYyIGRldmljZSBpbnRvIDF4IAptb2RlClvCoMKgwqAgMi4xMTEyNjVdIHJh
ZGVvbiAwMDAwOjAxOjAwLjA6IHB1dHRpbmcgQUdQIFYyIGRldmljZSBpbnRvIDF4IG1vZGUKW8Kg
wqDCoCAyLjExMTI4Nl0gcmFkZW9uIDAwMDA6MDE6MDAuMDogR1RUOiAyNTZNIDB4RDAwMDAwMDAg
LSAweERGRkZGRkZGClvCoMKgwqAgMi4xMTEyOTVdIHJhZGVvbiAwMDAwOjAxOjAwLjA6IFZSQU06
IDEyOE0gMHgwMDAwMDAwMEUwMDAwMDAwIC0gCjB4MDAwMDAwMDBFN0ZGRkZGRiAoMzJNIHVzZWQp
ClvCoMKgwqAgMi4xMTE3MDFdIFtkcm1dIERldGVjdGVkIFZSQU0gUkFNPTEyOE0sIEJBUj0xMjhN
ClvCoMKgwqAgMi4xMTE3MDRdIFtkcm1dIFJBTSB3aWR0aCA2NGJpdHMgRERSCioqKioqKiogcmFk
ZW9uX3R0bV9pbml0KCkKW8KgwqDCoCAyLjExMTcwNl0gd21zOiBkbWFfYWRkcmVzc2luZ19saW1p
dGVkPTB4MApbwqDCoMKgIDIuMTExNzA5XSB3bXM6IGRtYV9nZXRfbWFzaz0weGZmZmZmZmZmLCBi
dXNfZG1hX2xpbWl0PTB4MCwgCmRtYV9nZXRfcmVxdWlyZWRfbWFzaz0weDNmZmZmZmZmClvCoMKg
wqAgMi4xMTU5NzFdIFtUVE1dIFpvbmXCoCBrZXJuZWw6IEF2YWlsYWJsZSBncmFwaGljcyBtZW1v
cnk6IDQzNzAyOCBLaUIKW8KgwqDCoCAyLjExNTk3M10gW1RUTV0gWm9uZSBoaWdobWVtOiBBdmFp
bGFibGUgZ3JhcGhpY3MgbWVtb3J5OiA1MTA0NDAgS2lCCgpXaGF0IHNob3VsZCBiZSB0aGUgcHJv
cGVyIHZhbHVlIG9mIHRoZXNlIGRtYSB2YXJpYWJsZXMgb24gdGhlIDMyLWJpdCBzeXN0ZW0/Ckhv
dyB0byBmaXggdGhhdCBpc3N1ZSBjb3JyZWN0bHkgKHBhdGNoZXMgd2VsY29tZWQgOi0pIClPciBp
cyB0aGUgCnBsYXRmb3JtIGZ1YmFyPwoKVGhhbmtzLCBXb29keQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
