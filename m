Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6519B127B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 17:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088366EDB4;
	Thu, 12 Sep 2019 15:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184146EDB4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 15:56:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id r2so1758247lfn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 08:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=08NQ2RyLnhScyge49udAnnrLLM+WIZvYIMmDFFtTPF4=;
 b=Xq/JExzUc5tW+7O5xyPWCF5Rixbjje7B8TP/8rGT+0/yD3M+F5VvE5Y4Y7RqbGIVdK
 TpjwZSNXywBOgYG8BN6lLZHSfTR/cqyRdQ9BA7fiVm9RmipgJhsbiYEEUEdUdcuPGI6c
 ioAHwQDVBy17oNlAep7DI/eOVqujOhhUps49HdOyJ5dwiXsDTUlArbnCeNZi7km4fiOd
 7rERz5KZzi7b502k2Re8mWBC0s3nbMH0bguN9OLTAFJDluj6Tnno1MGZSTu5BR37crYy
 qVOWpNwpj/bKmzLIi7+1UxkFC85PyIrFMqFraWhnYRLiL8vcmDBo0+VlnnnjTeQWAZQ4
 uspQ==
X-Gm-Message-State: APjAAAWirU5XBFTBG+uNHDuWvvDmYB5HVaJaASIDNBxFxD3jqhB0MJ3R
 MWMUuoRD+naRkilOOupZ3BVr93nOwWVwmoKwjKs=
X-Google-Smtp-Source: APXvYqx27FI3Hoesal65btLW4S8NYw6nUV5E4OjFCymMd4GVVjcRSi/tYbb7qvph3V7Zn2MbUOsfPM8lYmTayEHVhHk=
X-Received: by 2002:ac2:530e:: with SMTP id c14mr1549411lfh.165.1568303799145; 
 Thu, 12 Sep 2019 08:56:39 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Sep 2019 01:56:28 +1000
Message-ID: <CAPM=9tws0GHMQd0Byunw3XJXq2vqsbbkoR-rqOxfL3f+Rptscw@mail.gmail.com>
Subject: drm fixes for 5.3-rc9
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=08NQ2RyLnhScyge49udAnnrLLM+WIZvYIMmDFFtTPF4=;
 b=llucwq1amaRqYmqpFKvH5vR/oR4tM9ntXg/yn6CI5DfH8hMKPwkAP8p50FRw8+niiG
 NMRl1l3BcdGp5NqydR/ENBgMF/QK1wUqkyjI3b/WLzb9sbUgus01Z1cv0vPv+coSOpuK
 TwW0tRNRzC5OsPmYW5rIslCKQT/zKn572wAR7fIsYHx/d9qdpETKoqWb4wfRCVuvoNob
 mftAHTue1EZDOFW8xRMeZotpP+MPqKmvjd0EmdVe6V1HwM/o8d3wCyDqp6qRkus5HwHq
 ByyTJvjCl1Z9DyUb48yPKYgPCjsRuPpFYxs5pCe/2BUMoe2YGP3GQiaeCR9Fw5rcm+M6
 uVow==
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

SGV5IExpbnVzLAoKRnJvbSB0aGUgbWFpbnRhaW5lciBzdW1taXQsIGp1c3Qgc29tZSBsYXN0IG1p
bnV0ZSBmaXhlcyBmb3IgZmluYWwsCmRldGFpbHMgaW4gdGhlIHRhZy4KCkRhdmUuCgpkcm0tZml4
ZXMtMjAxOS0wOS0xMzoKZHJtIGZpeGVzIGZvciA1LjMtcmM5CgpsaW1hOgotIGZpeCBnZW1fd2Fp
dCBpb2N0bAoKY29yZToKLSBjb25zdGlmeSBtb2RlcyBsaXN0CgppOTE1OgotIERQIE1TVCBoaWdo
IGNvbG9yIGRlcHRoIHJlZ3Jlc3Npb24KLSBHUFUgaGFuZ3Mgb24gdnVsa2FuIGNvbXB1dGUgd29y
a2xvYWRzClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZjc0YzJiYjk4Nzc2ZTJk
ZTUwOGY0ZDYwN2NkNTE5ODczMDY1MTE4ZToKCiAgTGludXggNS4zLXJjOCAoMjAxOS0wOS0wOCAx
MzozMzoxNSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZpeGVzLTIw
MTktMDktMTMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlNmJiNzExNjAwZGIyM2Vl
ZjJmYTBjMTZhMmQzNjFlMTdiNDViYjI4OgoKICBNZXJnZSB0YWcgJ2RybS1taXNjLWZpeGVzLTIw
MTktMDktMTInIG9mCmdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyBp
bnRvIGRybS1maXhlcyAoMjAxOS0wOS0xMgoyMzoxNDozNSArMTAwMCkKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtIGZp
eGVzIGZvciA1LjMtcmM4CgpsaW1hOgotIGZpeCBnZW1fd2FpdCBpb2N0bAoKY29yZToKLSBjb25z
dGlmeSBtb2RlcyBsaXN0CgppOTE1OgotIERQIE1TVCBoaWdoIGNvbG9yIGRlcHRoIHJlZ3Jlc3Np
b24KLSBHUFUgaGFuZ3Mgb24gdnVsa2FuIGNvbXB1dGUgd29ya2xvYWRzCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlz
IFdpbHNvbiAoMSk6CiAgICAgIGRybS9pOTE1OiBSZXN0b3JlIHJlbGF4ZWQgcGFkZGluZyAoT0NM
X09PQl9TVVBQUkVTX0VOQUJMRSkgZm9yIHNrbCsKCkRhdmUgQWlybGllICgyKToKICAgICAgTWVy
Z2UgdGFnICdkcm0taW50ZWwtZml4ZXMtMjAxOS0wOS0xMScgb2YKZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCBpbnRvIGRybS1maXhlcwogICAgICBNZXJnZSB0YWcg
J2RybS1taXNjLWZpeGVzLTIwMTktMDktMTInIG9mCmdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Au
b3JnL2RybS9kcm0tbWlzYyBpbnRvIGRybS1maXhlcwoKTWF4aW1lIFJpcGFyZCAoMSk6CiAgICAg
IGRybS9tb2RlczogTWFrZSB0aGUgd2hpdGVsaXN0IG1vcmUgY29uc3QKClZhc2lseSBLaG9ydXpo
aWNrICgxKToKICAgICAgZHJtL2xpbWE6IGZpeCBsaW1hX2dlbV93YWl0KCkgcmV0dXJuIHZhbHVl
CgpWaWxsZSBTeXJqw6Rsw6QgKDEpOgogICAgICBkcm0vaTkxNTogTGltaXQgTVNUIHRvIDw9IDhi
cGMgb25jZSBhZ2FpbgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyAgICAgICAgICAgICAg
ICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8
IDEwICsrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3dvcmthcm91bmRz
LmMgfCAgNSAtLS0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyAgICAgICAgICAg
ICB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
