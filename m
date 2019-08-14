Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6748DD4C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BB06E7CA;
	Wed, 14 Aug 2019 18:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5596E7D2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:07 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id w10so13322pgj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e2lnOM0nFup0+pDAGMOKduOv8qYBIIuH1dlGE1F9sPs=;
 b=MxIu9KKXKzcIFE71+lP/yM6c/uJre3xMb0g4tnJrzjUKfUDsZYJoqMUqNKO1vDt0jP
 iDljq+TPw5g3PPLVbQaFu92IgG+fgAx3Mdf9WtZNqltKoGwGcwa0G86kSCoGiGeOISq2
 YexHPJtdq7n0+WT9lH7k68KoCAUaRYWU/A9U77cMDc88dfVdIozmAPy9xb3rT3qY0qAv
 I8wDKuhLO0QJ0UUO/ePtlRDJfAJL6nwA+nX52Y/VEorFfYhJSpWrOO+ogvyb91Cqcx3/
 jXiXpLZ3aUnEnURTn3/k47MkiLxDc2A/Tj7Sutn7bnwGzuJVsGx9akHKiRYAby4kic21
 kW7w==
X-Gm-Message-State: APjAAAVTnNC5QF2t6NR93FrqBzsV9hqeCracavQV7YZfa37kfstmzBT+
 Pp4UgMrlB0YV03nhLDolvpCZQA==
X-Google-Smtp-Source: APXvYqzCysw5Y/5dmalFUJZRxuOj2cWrLosCwl46s9aspUhN6WQQhOJ4b4h1iOtEIPC6cZFBiEMV7Q==
X-Received: by 2002:a63:3fc9:: with SMTP id m192mr471718pga.429.1565808426805; 
 Wed, 14 Aug 2019 11:47:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:06 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 00/26] drm: Kirin driver cleanups to prep for
 Kirin960 support
Date: Wed, 14 Aug 2019 18:46:36 +0000
Message-Id: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=e2lnOM0nFup0+pDAGMOKduOv8qYBIIuH1dlGE1F9sPs=;
 b=ieBmvOQNdM7BQd6Gca54c7f9RiF5MCWMIzSkw+wXsP2vjco7xd/LwS6OHt7Vh+UZ7e
 7X24Y6DGIMQVMarWETzWtvF3pDWJWSw1YKDBP8rmmDG7pP/GyO6pbbioIou35P4bC9bF
 /ELRg6ljWXtk4eXrayC3/WrpoC6NwCzClrkkIsqBD2sBlXMDpG0z63orWyQLi/7zZU2v
 6maY394hvg3TvFaqJlUdFc9s5xmIuQKjdjGQmWLr1VUlH1QFPoSa8q35I3WJoYfFuEXn
 8C2x/ZkXdmNPUKXBQznie/ercfyaygJhrUTnTAcWqdVCkqZVKPV62Jby73cv1LF5wEYw
 +PNA==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCB3YW50ZWQgdG8gcmVzZW5kIHRoaXMgcGF0Y2ggc2V0IHNvIEkgZGlkbid0IGhhdmUgdG8K
Y29udGludWUgY2FycnlpbmcgaXQgZm9yZXZlciB0byBrZWVwIHRoZSBIaUtleTk2MCBib2FyZCBy
dW5uaW5nLgoKVGhpcyBwYXRjaHNldCBjb250YWlucyBvbmUgZml4IChpbiB0aGUgZnJvbnQsIHNv
IGl0cyBlYXNpZXIgdG8KZXZlbnR1YWxseSBiYWNrcG9ydCksIGFuZCBhIHNlcmllcyBvZiBjaGFu
Z2VzIGZyb20gWWlQaW5nIHRvCnJlZmFjdG9yIHRoZSBraXJpbiBkcm0gZHJpdmVyIHNvIHRoYXQg
aXQgY2FuIGJlIHVzZWQgb24gYm90aApraXJpbjYyMCBiYXNlZCBkZXZpY2VzIChsaWtlIHRoZSBv
cmlnaW5hbCBIaUtleSBib2FyZCkgYXMgd2VsbAphcyBraXJpbjk2MCBiYXNlZCBkZXZpY2VzIChs
aWtlIHRoZSBIaUtleTk2MCBib2FyZCkuCgpUaGUgZnVsbCBraXJpbjk2MCBkcm0gc3VwcG9ydCBp
cyBzdGlsbCBiZWluZyByZWZhY3RvcmVkLCBidXQgYXMKdGhpcyBiYXNlIGtpcmluIHJld29yayB3
YXMgZ2V0dGluZyB0byBiZSBzdWJzdGFudGlhbCwgSSB3YW50ZWQKdG8gc2VuZCBvdXQgdGhlIGZp
cnN0IGNodW5rLCBzbyB0aGF0IHRoZSByZXZpZXcgYnVyZGVuIHdhc24ndApvdmVyd2hlbG1pbmcu
CgpUaGUgZnVsbCBIaUtleTk2MCBwYXRjaCBzdGFjayBjYW4gYmUgZm91bmQgaGVyZToKICBodHRw
czovL2dpdC5saW5hcm8ub3JnL3Blb3BsZS9qb2huLnN0dWx0ei9hbmRyb2lkLWRldi5naXQvbG9n
Lz9oPWRldi9oaWtleTk2MC1tYWlubGluZS1XSVAKCnRoYW5rcwotam9obgoKQ2M6IFJvbmdyb25n
IFpvdSA8em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxp
YW5nQGhpc2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+CgpEYSBMdiAoMSk6CiAgZHJtOiBraXJpbjogRml4IGZvciBoaWtleTYyMCBkaXNwbGF5IG9m
ZnNldCBwcm9ibGVtCgpKb2huIFN0dWx0eiAoNCk6CiAgZHJtOiBraXJpbjogR2V0IHJpZCBvZiBk
cm1QLmggaW5jbHVkZXMKICBkcm06IGtpcmluOiBSZW1vdmUgSElTSV9LSVJJTl9EV19EU0kgY29u
ZmlnIG9wdGlvbgogIGRybToga2lyaW46IFJlbW92ZSB1bnJlYWNoYWJsZSByZXR1cm4KICBkcm06
IGtpcmluOiBNb3ZlIHdvcmtxdWV1ZSB0byBhZGVfaHdfY3R4IHN0cnVjdHVyZQoKWHUgWWlQaW5n
ICgyMSk6CiAgZHJtOiBraXJpbjogUmVtb3ZlIHVuY2Vzc2FyeSBwYXJhbWV0ZXIgaW5kaXJlY3Rp
b24KICBkcm06IGtpcmluOiBSZW1vdmUgb3V0X2Zvcm1hdCBmcm9tIGFkZV9jcnRjCiAgZHJtOiBr
aXJpbjogUmVuYW1lIGFkZV9wbGFuZSB0byBraXJpbl9wbGFuZQogIGRybToga2lyaW46IFJlbmFt
ZSBhZGVfY3J0YyB0byBraXJpbl9jcnRjCiAgZHJtOiBraXJpbjogRHluYW1pY2FsbHkgYWxsb2Nh
dGUgdGhlIGh3X2N0eAogIGRybToga2lyaW46IE1vdmUgcmVxdWVzdCBpcnEgaGFuZGxlIGluIGFk
ZSBodyBjdHggYWxsb2MKICBkcm06IGtpcmluOiBNb3ZlIGtpcmluX2NydGMsIGtpcmluX3BsYW5l
LCBraXJpbl9mb3JtYXQgdG8KICAgIGtpcmluX2RybV9kcnYuaAogIGRybToga2lyaW46IFJlYW5t
ZSBkY19vcHMgdG8ga2lyaW5fZHJtX2RhdGEKICBkcm06IGtpcmluOiBNb3ZlIGFkZSBjcnRjL3Bs
YW5lIGhlbHAgZnVuY3Rpb25zIHRvIGRyaXZlcl9kYXRhCiAgZHJtOiBraXJpbjogTW92ZSBjaGFu
bmVsIGZvcm1hdHMgdG8gZHJpdmVyIGRhdGEKICBkcm06IGtpcmluOiBNb3ZlIG1vZGUgY29uZmln
IGZ1bmN0aW9uIHRvIGRyaXZlcl9kYXRhCiAgZHJtOiBraXJpbjogTW92ZSBwbGFuZSBudW1iZXIg
YW5kIHByaW1heSBwbGFuZSBpbiBkcml2ZXIgZGF0YQogIGRybToga2lyaW46IE1vdmUgY29uZmln
IG1heF93aWR0aCBhbmQgbWF4X2hlaWdodCB0byBkcml2ZXIgZGF0YQogIGRybToga2lyaW46IE1v
dmUgZHJtIGRyaXZlciB0byBkcml2ZXIgZGF0YQogIGRybToga2lyaW46IEFkZCByZWdpc3RlciBj
b25uZWN0IGhlbHBlciBmdW5jdGlvbnMgaW4gZHJtIGluaXQKICBkcm06IGtpcmluOiBSZW5hbWUg
cGxhbmVfaW5pdCBhbmQgY3J0Y19pbml0CiAgZHJtOiBraXJpbjogRml4IGRldi0+ZHJpdmVyX2Rh
dGEgc2V0dGluZwogIGRybToga2lyaW46IE1ha2UgZHJpdmVyX2RhdGEgdmFyaWFibGUgbm9uLWds
b2JhbAogIGRybToga2lyaW46IEFkZCBhbGxvY19od19jdHgvY2xlYW5faHdfY3R4IG9wcyBpbiBk
cml2ZXIgZGF0YQogIGRybToga2lyaW46IFBhc3MgZHJpdmVyIGRhdGEgdG8gY3J0YyBpbml0IGFu
ZCBwbGFuZSBpbml0CiAgZHJtOiBraXJpbjogTW92ZSBhZGUgZHJtIGluaXQgdG8ga2lyaW4gZHJt
IGRydgoKIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vS2NvbmZpZyAgICAgICB8ICAx
MCArLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9NYWtlZmlsZSAgICAgIHwgICA0
ICstCiAuLi4vZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fYWRlX3JlZy5oICAgfCAgIDEg
KwogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyAgIHwgMzYwICsr
KysrKystLS0tLS0tLS0tLQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9k
cnYuYyAgIHwgMjU3ICsrKysrKysrKy0tLS0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9r
aXJpbl9kcm1fZHJ2LmggICB8ICA0OCArKy0KIDYgZmlsZXMgY2hhbmdlZCwgMzc5IGluc2VydGlv
bnMoKyksIDMwMSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
