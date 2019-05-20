Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB122E80
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6960A892C6;
	Mon, 20 May 2019 08:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90090892D7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:52 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j12so22535931eds.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwgnmEYo2AsN2seVNWQ6w+9PIizDlMfg8yS3XiJMdOk=;
 b=d00pL2ZoInvvn3PAUvnl99uoK44bfZLOUb2n0J/fXokMuJtCau4rQzS72Oo2Fd8twP
 AtimNUaIK/L4GUGq6QjjoCj+QQrK4dJkY501/tu3rgdHVo2aoUOAo7Q38mHXaecv+zYB
 xTJDBikHpdvvgpf0c2zuT0Wzj2g1HfzOBhhx3MukputxhX8Tfv3APSQLLRYFv5hc0o//
 /jkIWVBtGrTle6rM/T4gg0B9UsrjfcBkqAd5ZjK4lILaD5PGda1D1rP0Og0X83DYWLQL
 uTqbc6OHAz0nuA/m3XC8acQuBeKmPlYM3gX1YOPeZBUC6xso2SLk/Fc0clq2VP9krg6b
 JPag==
X-Gm-Message-State: APjAAAUDobqQDzKeIe/muKWxDcaDTSnJycDB4m4gsq6E8YnQ7FuUchoM
 ltH7KdzRqVOTbVxsM0K9CoL+Uoud1+4=
X-Google-Smtp-Source: APXvYqwceNL/LrOuvhdD1jUDdGInDeKdG5i9IVGNSecmbPjM9xRsI2Rc0RFnW2wU5dzx+HqfwLDVKw==
X-Received: by 2002:a50:970a:: with SMTP id c10mr74054624edb.2.1558340570749; 
 Mon, 20 May 2019 01:22:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/33] Revert "backlight/fbcon: Add FB_EVENT_CONBLANK"
Date: Mon, 20 May 2019 10:22:07 +0200
Message-Id: <20190520082216.26273-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwgnmEYo2AsN2seVNWQ6w+9PIizDlMfg8yS3XiJMdOk=;
 b=VbSQAghJf9HGDlQKsfxLWsNnfzStGXkNX/j4p10S+ADRCmX5ava6aXstIoGq/kMwT/
 V5DmK2pw7hfLF1iQGa6rk4HMAXO51zxcMtqHAwNPms7BgcinLOR2sprrHMax1xl5KP03
 /LXXKYtpR4kPUJWk2v7opeAYU3tzrFk3DosG8=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Yisheng Xie <ysxie@foxmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Richard Purdie <rpurdie@rpsys.net>,
 linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA5OTRlZmFjZGY5YTA4N2I1MmY3MWU2MjBiNThkZmE1MjZiMGNm
OTI4LgoKVGhlIGp1c3RpZmljYXRpb24gaXMgdGhhdCBpZiBodyBibGFua2luZyBmYWlscyAoaS5l
LiBmYm9wcy0+ZmJfYmxhbmspCmZhaWxzLCB0aGVuIHdlIHN0aWxsIHdhbnQgdG8gc2h1dCBkb3du
IHRoZSBiYWNrbGlnaHQuIFdoaWNoIGlzIGV4YWN0bHkKX25vdF8gd2hhdCBmYl9ibGFuaygpIGRv
ZXMgYW5kIHNvIHJhdGhlciBpbmNvbnNpc3RlbnQgaWYgd2UgZW5kIHVwCndpdGggZGlmZmVyZW50
IGJlaGF2aW91ciBiZXR3ZWVuIGZiY29uIGFuZCBkaXJlY3QgZmJkZXYgdXNhZ2UuIEdpdmVuCnRo
YXQgdGhlIGVudGlyZSBub3RpZmllciBtYXplIGlzIGdldHRpbmcgaW4gdGhlIHdheSBhbnl3YXkg
SSBmaWd1cmVkCml0J3Mgc2ltcGxlc3QgdG8gcmV2ZXJ0IHRoaXMgbm90IHdlbGwganVzdGlmaWVk
IGNvbW1pdC4KCkNjOiBSaWNoYXJkIFB1cmRpZSA8cnB1cmRpZUBycHN5cy5uZXQ+ClNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRo
b21wc29uQGxpbmFyby5vcmc+CkNjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4K
Q2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBIYW5zIGRlIEdv
ZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpDYzogWWlzaGVuZyBYaWUgPHlzeGllQGZveG1haWwu
Y29tPgpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvYmFja2xpZ2h0LmMgfCAyICstCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
b24uYyAgICB8IDkgLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAgICAg
ICB8IDQgKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMKaW5kZXggZGViODI0YmVmNmUyLi5j
NTU1OTBlYzAwNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdo
dC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5jCkBAIC00Niw3ICs0
Niw3IEBAIHN0YXRpYyBpbnQgZmJfbm90aWZpZXJfY2FsbGJhY2soc3RydWN0IG5vdGlmaWVyX2Js
b2NrICpzZWxmLAogCWludCBmYl9ibGFuayA9IDA7CiAKIAkvKiBJZiB3ZSBhcmVuJ3QgaW50ZXJl
c3RlZCBpbiB0aGlzIGV2ZW50LCBza2lwIGl0IGltbWVkaWF0ZWx5IC4uLiAqLwotCWlmIChldmVu
dCAhPSBGQl9FVkVOVF9CTEFOSyAmJiBldmVudCAhPSBGQl9FVkVOVF9DT05CTEFOSykKKwlpZiAo
ZXZlbnQgIT0gRkJfRVZFTlRfQkxBTkspCiAJCXJldHVybiAwOwogCiAJYmQgPSBjb250YWluZXJf
b2Yoc2VsZiwgc3RydWN0IGJhY2tsaWdodF9kZXZpY2UsIGZiX25vdGlmKTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiY29uLmMKaW5kZXggNThiODc2NzE4ZDgxLi4xNTQ5MDU2YTg0OGUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYmNvbi5jCkBAIC0yMzQ2LDggKzIzNDYsNiBAQCBzdGF0aWMgaW50IGZiY29uX3N3
aXRjaChzdHJ1Y3QgdmNfZGF0YSAqdmMpCiBzdGF0aWMgdm9pZCBmYmNvbl9nZW5lcmljX2JsYW5r
KHN0cnVjdCB2Y19kYXRhICp2Yywgc3RydWN0IGZiX2luZm8gKmluZm8sCiAJCQkJaW50IGJsYW5r
KQogewotCXN0cnVjdCBmYl9ldmVudCBldmVudDsKLQogCWlmIChibGFuaykgewogCQl1bnNpZ25l
ZCBzaG9ydCBjaGFybWFzayA9IHZjLT52Y19oaV9mb250X21hc2sgPwogCQkJMHgxZmYgOiAweGZm
OwpAQCAtMjM1OCwxMyArMjM1Niw2IEBAIHN0YXRpYyB2b2lkIGZiY29uX2dlbmVyaWNfYmxhbmso
c3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbywKIAkJZmJjb25fY2xlYXIo
dmMsIDAsIDAsIHZjLT52Y19yb3dzLCB2Yy0+dmNfY29scyk7CiAJCXZjLT52Y192aWRlb19lcmFz
ZV9jaGFyID0gb2xkYzsKIAl9Ci0KLQotCWxvY2tfZmJfaW5mbyhpbmZvKTsKLQlldmVudC5pbmZv
ID0gaW5mbzsKLQlldmVudC5kYXRhID0gJmJsYW5rOwotCWZiX25vdGlmaWVyX2NhbGxfY2hhaW4o
RkJfRVZFTlRfQ09OQkxBTkssICZldmVudCk7Ci0JdW5sb2NrX2ZiX2luZm8oaW5mbyk7CiB9CiAK
IHN0YXRpYyBpbnQgZmJjb25fYmxhbmsoc3RydWN0IHZjX2RhdGEgKnZjLCBpbnQgYmxhbmssIGlu
dCBtb2RlX3N3aXRjaCkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUv
bGludXgvZmIuaAppbmRleCBlNzYxODUyNDQ1OTMuLjRiOWI4ODJmOGY1MiAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9mYi5oCisrKyBiL2luY2x1ZGUvbGludXgvZmIuaApAQCAtMTMwLDEyICsx
MzAsMTAgQEAgc3RydWN0IGZiX2N1cnNvcl91c2VyIHsKICNkZWZpbmUgRkJfRVZFTlRfR0VUX0NP
TlNPTEVfTUFQICAgICAgICAweDA3CiAvKiAgICAgIENPTlNPTEUtU1BFQ0lGSUM6IHNldCBjb25z
b2xlIHRvIGZyYW1lYnVmZmVyIG1hcHBpbmcgKi8KICNkZWZpbmUgRkJfRVZFTlRfU0VUX0NPTlNP
TEVfTUFQICAgICAgICAweDA4Ci0vKiAgICAgIEEgaGFyZHdhcmUgZGlzcGxheSBibGFuayBjaGFu
Z2Ugb2NjdXJyZWQgKi8KKy8qICAgICAgQSBkaXNwbGF5IGJsYW5rIGlzIHJlcXVlc3RlZCAgICAg
ICAqLwogI2RlZmluZSBGQl9FVkVOVF9CTEFOSyAgICAgICAgICAgICAgICAgIDB4MDkKIC8qICAg
ICAgUHJpdmF0ZSBtb2RlbGlzdCBpcyB0byBiZSByZXBsYWNlZCAqLwogI2RlZmluZSBGQl9FVkVO
VF9NT0RFX0NIQU5HRV9BTEwJMHgwQgotLyoJQSBzb2Z0d2FyZSBkaXNwbGF5IGJsYW5rIGNoYW5n
ZSBvY2N1cnJlZCAqLwotI2RlZmluZSBGQl9FVkVOVF9DT05CTEFOSyAgICAgICAgICAgICAgIDB4
MEMKIC8qICAgICAgQ09OU09MRS1TUEVDSUZJQzogcmVtYXAgYWxsIGNvbnNvbGVzIHRvIG5ldyBm
YiAtIGZvciB2Z2Ffc3dpdGNoZXJvbyAqLwogI2RlZmluZSBGQl9FVkVOVF9SRU1BUF9BTExfQ09O
U09MRSAgICAgIDB4MEYKIC8qICAgICAgQSBoYXJkd2FyZSBkaXNwbGF5IGJsYW5rIGVhcmx5IGNo
YW5nZSBvY2N1cnJlZCAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
