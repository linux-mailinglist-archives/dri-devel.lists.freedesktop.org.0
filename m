Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C177D58094D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 04:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E5A11BD91;
	Tue, 26 Jul 2022 02:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Tue, 26 Jul 2022 02:12:46 UTC
Received: from m13144.mail.163.com (m13144.mail.163.com [220.181.13.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92EF611BD83
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 02:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=bWKrQ
 kLlhJ6iUqCza8HNdTjb0gbYLiJLNsFz+gzIQF4=; b=depw+2vvATj7PvHTl+/1a
 ocXKJFIg3LaF0c3KRJs1EpS4erSVuLCeNXSs4NdR9XlBvufheQMLuRwYs59U/A7r
 A7Aw4cbnIBVdXTUXAT10axj7VFj84SCsRhACcNQhJE6DnhAA2leEeGQ/p8TcEBhP
 v119ojpvL/esp4T9hlF9Oc=
Received: from andyshrk$163.com ( [112.96.229.169] ) by
 ajax-webmail-wmsvr144 (Coremail) ; Tue, 26 Jul 2022 09:57:22 +0800 (CST)
X-Originating-IP: [112.96.229.169]
Date: Tue, 26 Jul 2022 09:57:22 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Rohith Iyer" <quic_rohiiyer@quicinc.com>
Subject: Re:[PATCH libdrm v1 2/2] tests/modetest: Add support for writeback
 connector
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <20220725192639.5437-3-quic_rohiiyer@quicinc.com>
References: <20220725192639.5437-1-quic_rohiiyer@quicinc.com>
 <20220725192639.5437-3-quic_rohiiyer@quicinc.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6d76f7bb.fcf.1823839180b.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kMGowADHzxUCSt9ig2AoAA--.34059W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbivAxKXmASYItPAAACsw
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 hoegsberg@google.com, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIFJvaGl0aDoKCgoKCkF0IDIwMjItMDctMjYgMDM6MjY6MzksICJSb2hpdGggSXllciIgPHF1
aWNfcm9oaWl5ZXJAcXVpY2luYy5jb20+IHdyb3RlOgo+QWRkIHdyaXRlYmFjayBzdXBwb3J0IHRv
IG1vZGV0ZXN0IHdpdGggdGhlIGJlbG93IG9wdGlvbnM6Cgo+KwkJY2FzZSAnbyc6Cj4rCQkJcGlw
ZV9hcmdzLT5kdW1wID0gdHJ1ZTsKPisJCQlkdW1wX3BhdGggPSBvcHRhcmc7Cj4rCQkJYnJlYWs7
Cj4gCQljYXNlICdQJzoKPiAJCQlwbGFuZV9hcmdzID0gcmVhbGxvYyhwbGFuZV9hcmdzLAo+IAkJ
CQkJICAgICAocGxhbmVfY291bnQgKyAxKSAqIHNpemVvZiAqcGxhbmVfYXJncyk7Cj5AQCAtMjA5
OCw2ICsyMTczLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQo+IAkJCWNydGNz
ID0gMTsKPiAJCQlwbGFuZXMgPSAxOwo+IAkJCWJyZWFrOwo+KwkJY2FzZSAneCc6Cj4gCQljYXNl
ICdzJzoKPiAJCQlwaXBlX2FyZ3MgPSByZWFsbG9jKHBpcGVfYXJncywKPiAJCQkJCSAgICAoY291
bnQgKyAxKSAqIHNpemVvZiAqcGlwZV9hcmdzKTsKPkBAIC0yMTA5LDcgKzIxODUsNyBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4gCj4gCQkJaWYgKHBhcnNlX2Nvbm5lY3Rvcigm
cGlwZV9hcmdzW2NvdW50XSwgb3B0YXJnKSA8IDApCj4gCQkJCXVzYWdlKGFyZ3ZbMF0pOwo+LQo+
KwkJCXBpcGVfYXJncy0+Y3VzdG9tID0gKGMgPT0gJ3gnKTsKPiAJCQljb3VudCsrOwo+IAkJCWJy
ZWFrOwo+IAkJY2FzZSAnQyc6Cj5AQCAtMjE2NSw2ICsyMjQxLDcgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiphcmd2KQo+IAo+IAlpZiAodXNlX2F0b21pYykgewo+IAkJcmV0ID0gZHJtU2V0
Q2xpZW50Q2FwKGRldi5mZCwgRFJNX0NMSUVOVF9DQVBfQVRPTUlDLCAxKTsKPisJCWRybVNldENs
aWVudENhcChkZXYuZmQsIERSTV9DTElFTlRfQ0FQX1dSSVRFQkFDS19DT05ORUNUT1JTLCAxKTsK
PiAJCWlmIChyZXQpIHsKPiAJCQlmcHJpbnRmKHN0ZGVyciwgIm5vIGF0b21pYyBtb2Rlc2V0dGlu
ZyBzdXBwb3J0OiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKPiAJCQlkcm1DbG9zZShkZXYuZmQp
Owo+QEAgLTIyMDgsNiArMjI4NSw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikK
PiAJCQlpZiAoc2V0X3ByZWZlcnJlZCB8fCBjb3VudCkKPiAJCQkJc2V0X21vZGUoJmRldiwgcGlw
ZV9hcmdzLCBjb3VudCk7Cj4gCj4rCQkJd3JpdGViYWNrX2NvbmZpZygmZGV2LCBwaXBlX2FyZ3Ms
IGNvdW50KTsKPisKPiAJCQlpZiAocGxhbmVfY291bnQpCj4gCQkJCWF0b21pY19zZXRfcGxhbmVz
KCZkZXYsIHBsYW5lX2FyZ3MsIHBsYW5lX2NvdW50LCBmYWxzZSk7Cj4gCj5AQCAtMjIxNyw2ICsy
Mjk2LDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAJCQkJcmV0dXJuIDE7
Cj4gCQkJfQoKPiAKCgpIb3cgZG8gd2UgbWFrZSBzdXJlIHRoZSB3cml0ZWJhY2sgaXMgZmluaXNo
ZWQ/ICBEbyB3ZSBuZWVkIGEgd3JpdGViYWNrIGZlbmNlIGhlcmU/Cgo+KwkJCS8qCj4rCQkJICog
U2luY2Ugb25seSB3cml0ZWJhY2sgY29ubmVjdG9ycyBoYXZlIGFuIG91dHB1dCBmYiwgdGhpcyBz
aG91bGQgb25seSBiZQo+KwkJCSAqIGNhbGxlZCBmb3Igd3JpdGViYWNrLgo+KwkJCSAqLwo+KwkJ
CWlmIChwaXBlX2FyZ3MtPmR1bXApCj4rCQkJCWR1bXBfb3V0cHV0X2ZiKCZkZXYsIHBpcGVfYXJn
cywgZHVtcF9wYXRoLCBjb3VudCk7Cj4rCj4gCQkJaWYgKHRlc3RfdnN5bmMpCj4gCQkJCWF0b21p
Y190ZXN0X3BhZ2VfZmxpcCgmZGV2LCBwaXBlX2FyZ3MsIHBsYW5lX2FyZ3MsIHBsYW5lX2NvdW50
KTsKPiAKPi0tIAo+Mi4zMS4wCg==
