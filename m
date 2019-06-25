Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A98524C0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFDC6E09E;
	Tue, 25 Jun 2019 07:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54DA89E05
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 04:05:54 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id a15so16942671qtn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YXKj+IPUyIdf9CK0v5ukJZ+u/bRKPv2xw3vKk/om7oI=;
 b=ZEimQobpecSChnfpWl2uYkm958x7RgBlOgGwMlgIo2tpkMQSmZWOj0/aMVAlHHhcB/
 NZBs7nmiaSAqNbSBYgGT2kduynOl4nnoRW2henGUllO+Hyf+ykyDqKD2htqUO7sb8Ubd
 zSDKCitxsiSwSzPQ1zzFtTpNEGn2qmv2QHe13h62rExuKZYzx67YxQVV6Te0KjSTlTnL
 MHDtjukv1P9MvT70uRQsVy8Lw2rsPGoXdnk7sAJ+9T4qnaSzrJLz76KQJFvGthtODlco
 L7KTz1tZ+nqakuB1zwHc7yPpb4lwP/buHVRBNJQT5xAEwDRQiEC4z1jRR5r3u7MEVsOF
 lYOg==
X-Gm-Message-State: APjAAAXPPudas0ob25bRizqfd8SGsg9U/tAFizrl81cqLK7Pgw+5q1dK
 41AmQdXwZA8UrFgEGgHavRM=
X-Google-Smtp-Source: APXvYqy9WBYFmgKGSjQ3wQM1yf0IDmribmspEKiDwjqHsbJCHIWK+I1T8tXyiEAeJdYRRz3qKtD8gw==
X-Received: by 2002:aed:3b1c:: with SMTP id
 p28mr127461530qte.312.1561435553984; 
 Mon, 24 Jun 2019 21:05:53 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home
 (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
 by smtp.gmail.com with ESMTPSA id e8sm6741029qkn.95.2019.06.24.21.05.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Jun 2019 21:05:53 -0700 (PDT)
From: Brian Dodge <bdodge09@gmail.com>
To: pavel@ucw.cz
Subject: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
Date: Tue, 25 Jun 2019 00:05:29 -0400
Message-Id: <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YXKj+IPUyIdf9CK0v5ukJZ+u/bRKPv2xw3vKk/om7oI=;
 b=LChh0/FCvKa/98upK9LB6jvE9HzgZFrHPe76Ce49aYorrRjoequN81oTM3FMzb3jd5
 8nggr3btnYII+db1QPjWhq+kqelC3o5xK5A6KvC6lnIxXyT4Q85Np6cZ+t0gXj6qE8nT
 xu6Oi6BLwVbu/exKZwJrvuCSGiAKZFAeFOT4c52CrsDrmpRa7z5HamrGTz7blynTDhzq
 +GfjVEVvywI6U7Tc/qGnjxUiRMe4NB2WAyCm9AOoiyG7/FmADbd8dwEFx+fEDA83P1Xr
 Orm2OVODkxYyl8IfkP1WJXZOVfS6AAHYmYl4RrED2NXfH7BlIyfruHgQNRuCOrmUcL2E
 ZG2A==
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 Brian Dodge <bdodge09@gmail.com>, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9yaWdpbmFsIHBhdGNoIGFkZGluZyB0aGlzIGRyaXZlciBhbmQgRFQgYmluZGluZ3MgaW1w
cm9wZXJseQp1c2VkICJhcmMiIGFzIHRoZSB2ZW5kb3ItcHJlZml4LiBUaGlzIGFkZHMgImFyY3Rp
YyIgd2hpY2ggaXMgdGhlCnByb3BlciBwcmVmaXggYW5kIHJldGFpbnMgImFyYyIgdG8gYWxsb3cg
ZXhpc3RpbmcgdXNlcnMgb2YgdGhlCiJhcmMiIHByZWZpeCB0byB1cGRhdGUgdG8gbmV3IGtlcm5l
bHMuIFRoZXJlIGlzIGF0IGxlYXN0IG9uZQooU2Ftc3VuZyBDaHJvbWVib29rIFBsdXMpCgpTaWdu
ZWQtb2ZmLWJ5OiBCcmlhbiBEb2RnZSA8YmRvZGdlMDlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2FyY3hjbm5fYmwuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYXJjeGNubl9ibC5j
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYXJjeGNubl9ibC5jCmluZGV4IDdiMWMwYTAuLjE0
YzY3ZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2FyY3hjbm5fYmwuYwor
KysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hcmN4Y25uX2JsLmMKQEAgLTEsOSArMSw5IEBA
CiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAvKgotICogQmFja2xp
Z2h0IGRyaXZlciBmb3IgQXJjdGljU2FuZCBBUkNfWF9DXzBOXzBOIERldmljZXMKKyAqIEJhY2ts
aWdodCBkcml2ZXIgZm9yIHBTZW1pIChmb3JtZXJseSBBcmN0aWNTYW5kKSBBUkNfWF9DXzBOXzBO
IERldmljZXMKICAqCi0gKiBDb3B5cmlnaHQgMjAxNiBBcmN0aWNTYW5kLCBJbmMuCi0gKiBBdXRo
b3IgOiBCcmlhbiBEb2RnZSA8YmRvZGdlQGFyY3RpY3NhbmQuY29tPgorICogQ29weXJpZ2h0IDIw
MTYtMjAxOSAgcFNlbWksIEluYy4KKyAqIEF1dGhvciA6IEJyaWFuIERvZGdlIDxiZG9kZ2VAcHNl
bWkuY29tPgogICovCiAKICNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KQEAgLTE5MSwyNyAr
MTkxLDQwIEBAIHN0YXRpYyB2b2lkIGFyY3hjbm5fcGFyc2VfZHQoc3RydWN0IGFyY3hjbm4gKmxw
KQogCWlmIChyZXQgPT0gMCkKIAkJbHAtPnBkYXRhLT5pbml0aWFsX2JyaWdodG5lc3MgPSBwcm9n
X3ZhbDsKIAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsbGVkLWNvbmZp
Zy0wIiwgJnByb2dfdmFsKTsKKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJj
dGljLGxlZC1jb25maWctMCIsICZwcm9nX3ZhbCk7CisJaWYgKHJldCkKKwkJcmV0ID0gb2ZfcHJv
cGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxsZWQtY29uZmlnLTAiLCAmcHJvZ192YWwpOwogCWlm
IChyZXQgPT0gMCkKIAkJbHAtPnBkYXRhLT5sZWRfY29uZmlnXzAgPSAodTgpcHJvZ192YWw7CiAK
LQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLGxlZC1jb25maWctMSIsICZw
cm9nX3ZhbCk7CisJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyY3RpYyxsZWQt
Y29uZmlnLTEiLCAmcHJvZ192YWwpOworCWlmIChyZXQpCisJCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG5vZGUsICJhcmMsbGVkLWNvbmZpZy0xIiwgJnByb2dfdmFsKTsKIAlpZiAocmV0ID09
IDApCiAJCWxwLT5wZGF0YS0+bGVkX2NvbmZpZ18xID0gKHU4KXByb2dfdmFsOwogCi0JcmV0ID0g
b2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxkaW0tZnJlcSIsICZwcm9nX3ZhbCk7CisJ
cmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyY3RpYyxkaW0tZnJlcSIsICZwcm9n
X3ZhbCk7CisJaWYgKHJldCkKKwkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFy
YyxkaW0tZnJlcSIsICZwcm9nX3ZhbCk7CiAJaWYgKHJldCA9PSAwKQogCQlscC0+cGRhdGEtPmRp
bV9mcmVxID0gKHU4KXByb2dfdmFsOwogCi0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9k
ZSwgImFyYyxjb21wLWNvbmZpZyIsICZwcm9nX3ZhbCk7CisJcmV0ID0gb2ZfcHJvcGVydHlfcmVh
ZF91MzIobm9kZSwgImFyY3RpYyxjb21wLWNvbmZpZyIsICZwcm9nX3ZhbCk7CisJaWYgKHJldCkK
KwkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxjb21wLWNvbmZpZyIsICZw
cm9nX3ZhbCk7CiAJaWYgKHJldCA9PSAwKQogCQlscC0+cGRhdGEtPmNvbXBfY29uZmlnID0gKHU4
KXByb2dfdmFsOwogCi0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxmaWx0
ZXItY29uZmlnIiwgJnByb2dfdmFsKTsKKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2Rl
LCAiYXJjdGljLGZpbHRlci1jb25maWciLCAmcHJvZ192YWwpOworCWlmIChyZXQpCisJCXJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsCisJCQkJImFyYyxmaWx0ZXItY29uZmlnIiwgJnBy
b2dfdmFsKTsKIAlpZiAocmV0ID09IDApCiAJCWxwLT5wZGF0YS0+ZmlsdGVyX2NvbmZpZyA9ICh1
OClwcm9nX3ZhbDsKIAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsdHJp
bS1jb25maWciLCAmcHJvZ192YWwpOworCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUs
ICJhcmN0aWMsdHJpbS1jb25maWciLCAmcHJvZ192YWwpOworCWlmIChyZXQpCisJCXJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsdHJpbS1jb25maWciLCAmcHJvZ192YWwpOwog
CWlmIChyZXQgPT0gMCkKIAkJbHAtPnBkYXRhLT50cmltX2NvbmZpZyA9ICh1OClwcm9nX3ZhbDsK
IApAQCAtMzgxLDYgKzM5NCw4IEBAIHN0YXRpYyBpbnQgYXJjeGNubl9yZW1vdmUoc3RydWN0IGky
Y19jbGllbnQgKmNsKQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhcmN4
Y25uX2R0X2lkc1tdID0geworCXsgLmNvbXBhdGlibGUgPSAiYXJjdGljLGFyYzJjMDYwOCIgfSwK
KwkvKiBoZXJlIHRvIHJlbWFpbSBjb21wYXRpYmxlIHdpdGggYW4gb2xkZXIgYmluZGluZywgZG8g
bm90IHVzZSAqLwogCXsgLmNvbXBhdGlibGUgPSAiYXJjLGFyYzJjMDYwOCIgfSwKIAl7IH0KIH07
CkBAIC00MDQsNSArNDE5LDUgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGFyY3hjbm5fZHJp
dmVyID0gewogbW9kdWxlX2kyY19kcml2ZXIoYXJjeGNubl9kcml2ZXIpOwogCiBNT0RVTEVfTElD
RU5TRSgiR1BMIHYyIik7Ci1NT0RVTEVfQVVUSE9SKCJCcmlhbiBEb2RnZSA8YmRvZGdlQGFyY3Rp
Y3NhbmQuY29tPiIpOworTU9EVUxFX0FVVEhPUigiQnJpYW4gRG9kZ2UgPGJkb2RnZUBwc2VtaS5j
b20+Iik7CiBNT0RVTEVfREVTQ1JJUFRJT04oIkFSQ1hDTk4gQmFja2xpZ2h0IGRyaXZlciIpOwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
