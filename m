Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82518E573C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 01:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989ED6EBD0;
	Fri, 25 Oct 2019 23:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1175B6EBD6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 23:48:40 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d22so2137527pll.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 16:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kpP5L5ZL9jr9Wuirrq/wpxNCtz1x33e9wP9JwvG83tE=;
 b=jqGImQDYM5FeOuvmIczApFFQNqmFJjmw+ES1cMaGr9NuphQdg1524lJ18ojwzazB31
 kxitMC4rZ0d8fh+LS0YjVST5+E1iBDrAr770pQMDFrR4Ng/k0JC9NGb/D+gLwi6rv0qM
 rAyqlDJChZrjsXuPab/VvO/sSfP+OT0fecGWZ7bhQpm7An2ehE0dRtcZuB0HMN5/UoHA
 E8tGCeLQ6sNrM6ux5qSAQRjSQgo96CUmL2JFI/71nm+SJIVT5zssl5BE1cWoJBv+1+l+
 EjbhfCCynSyq3q4NjAu3B4u5fECgTaX7dkciLZRBZLehzaV4LMACxlCuJBYkuvgk0cHj
 UCZA==
X-Gm-Message-State: APjAAAVNRFQi27/ULx1Jo3v+M4CUh0uCnNoCqymEUsTK4AuhUrbU6d+c
 2BVBkJk6z1fCeYXiCaUdBYObqA==
X-Google-Smtp-Source: APXvYqychMWInYueDZ6EKJar8eyzhLNrYGYyX2Zp5f95/WM8Z4uN16jYK60waVFhNpHWeyYvjB4gmg==
X-Received: by 2002:a17:902:aa07:: with SMTP id
 be7mr6818499plb.242.1572047319332; 
 Fri, 25 Oct 2019 16:48:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 cx22sm2817179pjb.19.2019.10.25.16.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 16:48:38 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 1/2] mm: cma: Export cma symbols for cma heap as a module
Date: Fri, 25 Oct 2019 23:48:33 +0000
Message-Id: <20191025234834.28214-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025234834.28214-1-john.stultz@linaro.org>
References: <20191025234834.28214-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kpP5L5ZL9jr9Wuirrq/wpxNCtz1x33e9wP9JwvG83tE=;
 b=aH+q1oJwle0nqOjUevAI2mb8wKUrtDhyNCymP6wx1Ejk2vXIr1dGQFtWul5+98jwl5
 NO9Iy0gKcfG72k6QZO9qhdGo7LSYi0XtxBHzmFcp9Isx9v1/v6olIDuSiz8ZyEYNQEib
 ibY4cf3DmZZuXO/k7TCOxJOoVEUq1q9IGNs9O36Zv62yADhnhDv/ea+isimPR9ixiX0J
 S7AVKbruLRl+6+C5qP1BB4gA+aaGLy3wtcy1dJhqRG5Y7KeXR9sDkspCuLQZPbL0Am4L
 KYy8KYY6fS36vL5cyXVmwC9VUEPcZHQJ6gcR7JBqhiYKRIA0N07LPYw1nkLntijgcZZg
 s5/A==
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
Cc: Sandeep Patil <sspatil@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBnb29nbGUuY29tPgoKRXhwb3J0IGNtYV9nZXRf
bmFtZSwgY21hX2FsbG9jLCBjbWFfcmVsZWFzZSwgY21hX2Zvcl9lYWNoX2FyZWEKYW5kIGRtYV9j
b250aWd1b3VzX2RlZmF1bHRfYXJlYSBzbyB0aGF0IHdlIGNhbiB1c2UgdGhlc2UgZnJvbQp0aGUg
ZG1hYnVmIGNtYSBoZWFwIHdoZW4gaXQgaXMgYnVpbHQgYXMgbW9kdWxlLgoKQ2M6IExhdXJhIEFi
Ym90dCA8bGFiYm90dEByZWRoYXQuY29tPgpDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWlu
LmdhaWduYXJkQGxpbmFyby5vcmc+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KQ2M6IFByYXRpayBQ
YXRlbCA8cHJhdGlrcEBjb2RlYXVyb3JhLm9yZz4KQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0
YXJrZXlAYXJtLmNvbT4KQ2M6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4KQ2M6IEFuZHJl
dyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBZdWUgSHUgPGh1eXVlMkB5
dWxvbmcuY29tPgpDYzogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgpDYzogQ2hl
bmJvIEZlbmcgPGZlbmdjQGdvb2dsZS5jb20+CkNjOiBBbGlzdGFpciBTdHJhY2hhbiA8YXN0cmFj
aGFuQGdvb2dsZS5jb20+CkNjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+CkNj
OiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBn
b29nbGUuY29tPgpbanN0dWx0ejogUmV3cm90ZSBjb21taXQgbWVzc2FnZSwgYWRkZWQKIGRtYV9j
b250aWd1b3VzX2RlZmF1bHRfYXJlYSB0byB0aGUgc2V0IG9mIGV4cG9ydGVkIHN5bWJvbHNdClNp
Z25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGtl
cm5lbC9kbWEvY29udGlndW91cy5jIHwgMSArCiBtbS9jbWEuYyAgICAgICAgICAgICAgICB8IDUg
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEva2Vy
bmVsL2RtYS9jb250aWd1b3VzLmMgYi9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYwppbmRleCA2OWNm
YjQzNDUzODguLmZmNmNiYTYzZWE2ZiAxMDA2NDQKLS0tIGEva2VybmVsL2RtYS9jb250aWd1b3Vz
LmMKKysrIGIva2VybmVsL2RtYS9jb250aWd1b3VzLmMKQEAgLTMxLDYgKzMxLDcgQEAKICNlbmRp
ZgogCiBzdHJ1Y3QgY21hICpkbWFfY29udGlndW91c19kZWZhdWx0X2FyZWE7CitFWFBPUlRfU1lN
Qk9MKGRtYV9jb250aWd1b3VzX2RlZmF1bHRfYXJlYSk7CiAKIC8qCiAgKiBEZWZhdWx0IGdsb2Jh
bCBDTUEgYXJlYSBzaXplIGNhbiBiZSBkZWZpbmVkIGluIGtlcm5lbCdzIC5jb25maWcuCmRpZmYg
LS1naXQgYS9tbS9jbWEuYyBiL21tL2NtYS5jCmluZGV4IDdmZTBiODM1Njc3NS4uZGI0NjQyZTU4
MDU4IDEwMDY0NAotLS0gYS9tbS9jbWEuYworKysgYi9tbS9jbWEuYwpAQCAtMjQsNiArMjQsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAj
aW5jbHVkZSA8bGludXgvbW0uaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRl
IDxsaW51eC9tdXRleC5oPgogI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgpAQCAtNTQsNiArNTUsNyBAQCBjb25zdCBjaGFyICpjbWFfZ2V0X25hbWUoY29u
c3Qgc3RydWN0IGNtYSAqY21hKQogewogCXJldHVybiBjbWEtPm5hbWUgPyBjbWEtPm5hbWUgOiAi
KHVuZGVmaW5lZCkiOwogfQorRVhQT1JUX1NZTUJPTF9HUEwoY21hX2dldF9uYW1lKTsKIAogc3Rh
dGljIHVuc2lnbmVkIGxvbmcgY21hX2JpdG1hcF9hbGlnbmVkX21hc2soY29uc3Qgc3RydWN0IGNt
YSAqY21hLAogCQkJCQkgICAgIHVuc2lnbmVkIGludCBhbGlnbl9vcmRlcikKQEAgLTUwMCw2ICs1
MDIsNyBAQCBzdHJ1Y3QgcGFnZSAqY21hX2FsbG9jKHN0cnVjdCBjbWEgKmNtYSwgc2l6ZV90IGNv
dW50LCB1bnNpZ25lZCBpbnQgYWxpZ24sCiAJcHJfZGVidWcoIiVzKCk6IHJldHVybmVkICVwXG4i
LCBfX2Z1bmNfXywgcGFnZSk7CiAJcmV0dXJuIHBhZ2U7CiB9CitFWFBPUlRfU1lNQk9MX0dQTChj
bWFfYWxsb2MpOwogCiAvKioKICAqIGNtYV9yZWxlYXNlKCkgLSByZWxlYXNlIGFsbG9jYXRlZCBw
YWdlcwpAQCAtNTMzLDYgKzUzNiw3IEBAIGJvb2wgY21hX3JlbGVhc2Uoc3RydWN0IGNtYSAqY21h
LCBjb25zdCBzdHJ1Y3QgcGFnZSAqcGFnZXMsIHVuc2lnbmVkIGludCBjb3VudCkKIAogCXJldHVy
biB0cnVlOwogfQorRVhQT1JUX1NZTUJPTF9HUEwoY21hX3JlbGVhc2UpOwogCiBpbnQgY21hX2Zv
cl9lYWNoX2FyZWEoaW50ICgqaXQpKHN0cnVjdCBjbWEgKmNtYSwgdm9pZCAqZGF0YSksIHZvaWQg
KmRhdGEpCiB7CkBAIC01NDcsMyArNTUxLDQgQEAgaW50IGNtYV9mb3JfZWFjaF9hcmVhKGludCAo
Kml0KShzdHJ1Y3QgY21hICpjbWEsIHZvaWQgKmRhdGEpLCB2b2lkICpkYXRhKQogCiAJcmV0dXJu
IDA7CiB9CitFWFBPUlRfU1lNQk9MX0dQTChjbWFfZm9yX2VhY2hfYXJlYSk7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
