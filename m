Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8738D12198
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 20:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB76896C7;
	Thu,  2 May 2019 18:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6E989624
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 18:03:52 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id z26so1504914pfg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 11:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWx0BTDq0IpP5KcejHkSpaBJOp0v0+skd28Nt1+RzDc=;
 b=tuWYdeJOpQo6trflucaQJmVzpWWl2nEbzQaIL4PVI637eGMdDI+Q00+UrQdiysTLhd
 Yi1fNbf12GAjeuefJ/gZXJzB6cVeWusXvbtn0ITR6n/5a7bgmbp9zqBrxHsCm86uz7XK
 v1igQKqXqVUZoJWhGqdrVgxMlrDV4GvNFHDYdExzxf9A4Ur7YkMiKJYGzHHKPmZJXziu
 OTk29vE2t8YuttAo9+3geBQwQGDo0wwdPritcfsHUlR49+24VviAvKuRm8MZ/UMUlUQJ
 pUncgl6mCZDwNyzla+RE60/TBNw0pgOAJKFG2KJmOlKN4JfTwwUJ5CD2CJWS6qyIycWH
 CIjw==
X-Gm-Message-State: APjAAAWOjVcKxOafmM4ktig4yznH18tNFbU6OdXXaoPgsxX7SxI3w/L1
 icDhjru0tvIseUL8v2lZt2v88aa1Y+Y=
X-Google-Smtp-Source: APXvYqxA441nDCQ2R3Wlbs+Sa3jewOk8uYo2Q8oHXUN9/1wWFjpeT9IPj9sBIXfxHl0RRyGAZVEKBg==
X-Received: by 2002:aa7:8dc3:: with SMTP id j3mr5585755pfr.141.1556820230426; 
 Thu, 02 May 2019 11:03:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:4e72:b9ff:fe99:466a])
 by smtp.gmail.com with ESMTPSA id
 c18sm90371672pfc.0.2019.05.02.11.03.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 11:03:49 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
Date: Thu,  2 May 2019 11:03:43 -0700
Message-Id: <20190502180346.4769-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWx0BTDq0IpP5KcejHkSpaBJOp0v0+skd28Nt1+RzDc=;
 b=u9qgaKSUduGlOXr0yTBz/TGhQYhMYNZuK0Oc6IFbSmCcLQhOdJnFNTkU3Yd1rHmUq9
 5EyPotGzQotmVP+k8Y7X3IXUf1Zgr7HN5wkFjGiiTS+sX7X3qrPlC34mfP3YMB/L1IzA
 +Dj8HcgA6zHgSQJfmfbBMiNCWU3jbqVsENBd+30IeM2mGvrqemaC2jj4mcE7CdJBZD66
 nGB1ELb/7s+nsz6qjrjlRezA/pF8v2KO7J2psDDI5pVdeQqcjnibZyjdhgqR3cwtlcp3
 XFoGthnoHvIN7lmhR00wpzn4EmwIM1VUEsnMfM8uo11ltj31jNL67cKDkFuYCuonfsdv
 +oGw==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZXdoYXQgcmVjZW50IGNoYW5nZXMgaW4gdGhlIEFPU1AgYnVpbGQgc3lzdGVtIGhhcyBiZWVu
IG1hZGUKd2hpY2ggZmFpcmx5IHNldmVyZWx5IHJlc3RyaWN0cyB0aGUgYnVpbGQgZW52aXJvbm1l
bnQuIFRoaXMgaGFzCm1hZGUgaXQgZGlmZmljdWx0IHRvIHRlc3QgbWVzYS9tYXN0ZXIgdy8gQU9T
UC9tYXN0ZXIuCgpJJ20gd29ya2luZyB3aXRoIG90aGVycyB0byB0cnkgdG8gcmVtZWR5IHRoaXMs
IGJ1dCBhcyBhIGZpcnN0CnN0ZXAgSSB1c2VkIHNvbWUgaGFja3MgdG8gdGVtcG9yYXJpbHkgcmVt
b3ZlIHRoZSBidWlsZCBlbnZpcm9ubWVudApyZXN0cmljdGlvbnMsIGFuZCB1bnN1cHJpemluZ2x5
IGZvdW5kIG1lc2EvbWFzdGVyIGhhcyBhIGZldwpidWlsZCBpc3N1ZXMgd2hlbiB0cnlpbmcgdG8g
YnVpbGQgdy8gZnJlZWRyZW5vLgoKU28gdGhpcyBwYXRjaCBzZXQgcHJvdmlkZXMgb25seSBzb21l
IHZlcnkgYmFzaWMgYnVpbGQgZml4ZXMKdGhhdCBhcmUgbmVlZGVkIHRvIGdldCBtZXNhL21hc3Rl
ciBidWlsZGluZyB3LyBBT1NQL21hc3RlcgoobWludXMgdGhlIGJ1aWxkIHJlc3RyaWN0aW9ucyBv
biBleHRlcm5hbCB0b29scykuCgpGZWVkYmFjayB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVk
IQoKdGhhbmtzCi1qb2huCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpD
YzogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+CkNjOiBBbWl0IFB1bmRp
ciA8YW1pdC5wdW5kaXJAbGluYXJvLm9yZz4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2Fs
QGxpbmFyby5vcmc+CkNjOiBBbGlzdGFpciBTdHJhY2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+
CkNjOiBHcmVnIEhhcnRtYW4gPGdoYXJ0bWFuQGdvb2dsZS5jb20+CkNjOiBUYXBhbmkgUMOkbGxp
IDx0YXBhbmkucGFsbGlAaW50ZWwuY29tPgpDYzogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtz
dHJhbmQubmV0PgoKQWxpc3RhaXIgU3RyYWNoYW4gKDEpOgogIG1lc2E6IGFuZHJvaWQ6IFJlbW92
ZSB1bm5lY2Vzc2FyeSBkZXBlbmRlbmN5IHRyYWNraW5nIHJ1bGVzCgpBbWl0IFB1bmRpciAoMSk6
CiAgbWVzYTogYW5kcm9pZDogZnJlZWRyZW5vOiBidWlsZCBsaWJmcmVlZHJlbm9fe2RybSxpcjN9
IHN0YXRpYyBsaWJzCgpKb2huIFN0dWx0eiAoMSk6CiAgbWVzYTogYW5kcm9pZDogZnJlZWRyZW5v
OiBGaXggYnVpbGQgZmFpbHVyZSBkdWUgdG8gcGF0aCBjaGFuZ2UKCiBBbmRyb2lkLm1rICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHNyYy9jb21waWxlci9BbmRyb2lk
Lmdsc2wuZ2VuLm1rICAgICAgICAgICAgIHwgIDIgLQogc3JjL2NvbXBpbGVyL0FuZHJvaWQubmly
Lmdlbi5tayAgICAgICAgICAgICAgfCAgMiAtCiBzcmMvZnJlZWRyZW5vL0FuZHJvaWQuZHJtLm1r
ICAgICAgICAgICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysKIHNyYy9mcmVlZHJlbm8vQW5k
cm9pZC5pcjMubWsgICAgICAgICAgICAgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysKIHNy
Yy9mcmVlZHJlbm8vQW5kcm9pZC5tayAgICAgICAgICAgICAgICAgICAgIHwgMzAgKysrKysrKysr
KysrCiBzcmMvZnJlZWRyZW5vL01ha2VmaWxlLnNvdXJjZXMgICAgICAgICAgICAgICB8ICAyICsK
IHNyYy9nYWxsaXVtL0FuZHJvaWQuY29tbW9uLm1rICAgICAgICAgICAgICAgIHwgIDUgKy0KIHNy
Yy9nYWxsaXVtL2RyaXZlcnMvZnJlZWRyZW5vL0FuZHJvaWQuZ2VuLm1rIHwgIDIgKy0KIHNyYy9n
YWxsaXVtL2RyaXZlcnMvZnJlZWRyZW5vL0FuZHJvaWQubWsgICAgIHwgIDIgKy0KIHNyYy9nYWxs
aXVtL3RhcmdldHMvZHJpL0FuZHJvaWQubWsgICAgICAgICAgIHwgIDQgKysKIDExIGZpbGVzIGNo
YW5nZWQsIDEzNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHNyYy9mcmVlZHJlbm8vQW5kcm9pZC5kcm0ubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzcmMv
ZnJlZWRyZW5vL0FuZHJvaWQuaXIzLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3JjL2ZyZWVkcmVu
by9BbmRyb2lkLm1rCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
