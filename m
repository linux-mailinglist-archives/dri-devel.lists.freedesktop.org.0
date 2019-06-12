Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547A4334F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5A1892A4;
	Thu, 13 Jun 2019 07:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FAC8946E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:28 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id bh12so6337655plb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyNFZYwRtJTUSjA/j/X46P0EDgr7MIqfAVin85AHqAI=;
 b=s4Z0s/bAogtprgdlcGAqoaCLak3Yf0w7LQEL/OuFXXDtEq9TvYpyrDKNK9IWC9XUDI
 uJukcaMDcpEDxvOebLSRtLBzjr0feUeNJvGZLkRD9uujTQy8UDz/FBXHazZVAUDof+wg
 PmBfJRVCPPqx3dZNEAYE4bM0aKfbqmeGTrAzOKwHk9ctE8gtKABF277zt2fAC36KM1M+
 YKKw/S132hz4f2uE9OjNf1d7J6ezyNqotXvN+2ezMJRL+Od0YLAz7ciCTU2yqrlyBWgg
 xUHg4N2WIdfP11YXh60G3jC1AvnP/pMekTemieA1VV4gU+Eqd7YFopACGCdUbDOM7sJa
 0ZJA==
X-Gm-Message-State: APjAAAWRvGYofTO0LOzGyoZdbkwyvao+x2860jPDWMsMOhGw1uzYmAtk
 hIlehLa2kZ2H/JwoOJsXwg98Ke6pN04=
X-Google-Smtp-Source: APXvYqzIELws8sNQHkSyZt89mfV3IWc/t0/+hUi+5+4bzO8+gDeS+OMT5IdfFM7nDPVJYDeTbN8JDQ==
X-Received: by 2002:a17:902:6ac6:: with SMTP id
 i6mr66641679plt.233.1560328407157; 
 Wed, 12 Jun 2019 01:33:27 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:26 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 14/15] drm/bridge: tc358767: Drop unnecessary 8 byte buffer
Date: Wed, 12 Jun 2019 01:32:51 -0700
Message-Id: <20190612083252.15321-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyNFZYwRtJTUSjA/j/X46P0EDgr7MIqfAVin85AHqAI=;
 b=NwFHJ1ZUWon7SC/JBcHFqHY051wqR07OEucDIeCaZGA8LF72pnQkrBT/x5hUhw3VQg
 Z+RSeejCeRkBA4ZUkROJlYa9AS9yFz0aTj/lPr2kE+Zht6m5IUpFFRgX94Jl3yAYHNdd
 0MVsYoA6+UvOXs7g1t75Uz36W+z+KJqH6dexsuYTuoCEk/7rY83nA4Dr7UdskONtbpCl
 O/xKuzTds5M1p8ytbTb2D4WGr9MKOGf0y7SH5199K3rIG8B/xVMPW/hukMc6oi0svIpB
 9gtHXr22GyGVMzwsnvR+shi5WUzI+FRysYEbzFuYJDln4wTb5lbftZxlG1JYHKtOw0Xn
 KSpg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGNfZ2V0X2Rpc3BsYXlfcHJvcHMoKSBuZXZlciByZWFkcyBtb3JlIHRoYW4gYSBieXRlIHZpYSBB
VVgsIHNvCnRoZXJlJ3Mgbm8gbmVlZCB0byByZXNlcnZlIDggZm9yIHRoYXQgcHVycG9zZS4gTm8g
ZnVuY3Rpb24gY2hhbmdlCmludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3Yg
PGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBH
dXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFph
YmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6
aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0
YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCmluZGV4IDAxY2E5MmE2ZDljOC4uODFlZDM1OTQ4N2M3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jCkBAIC02NjEsOCArNjYxLDcgQEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1
cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCiBzdGF0aWMgaW50IHRjX2dldF9kaXNwbGF5X3Byb3BzKHN0
cnVjdCB0Y19kYXRhICp0YykKIHsKIAlpbnQgcmV0OwotCS8qIHRlbXAgYnVmZmVyICovCi0JdTgg
dG1wWzhdOworCXU4IHJlZzsKIAogCS8qIFJlYWQgRFAgUnggTGluayBDYXBhYmlsaXR5ICovCiAJ
cmV0ID0gZHJtX2RwX2xpbmtfcHJvYmUoJnRjLT5hdXgsICZ0Yy0+bGluay5iYXNlKTsKQEAgLTY3
OCwyMSArNjc3LDIxIEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rpc3BsYXlfcHJvcHMoc3RydWN0IHRj
X2RhdGEgKnRjKQogCQl0Yy0+bGluay5iYXNlLm51bV9sYW5lcyA9IDI7CiAJfQogCi0JcmV0ID0g
ZHJtX2RwX2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX01BWF9ET1dOU1BSRUFELCB0bXApOworCXJl
dCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9NQVhfRE9XTlNQUkVBRCwgJnJlZyk7
CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQl0Yy0+bGluay5zcHJlYWQg
PSB0bXBbMF0gJiBEUF9NQVhfRE9XTlNQUkVBRF8wXzU7CisJdGMtPmxpbmsuc3ByZWFkID0gcmVn
ICYgRFBfTUFYX0RPV05TUFJFQURfMF81OwogCi0JcmV0ID0gZHJtX2RwX2RwY2RfcmVhZGIoJnRj
LT5hdXgsIERQX01BSU5fTElOS19DSEFOTkVMX0NPRElORywgdG1wKTsKKwlyZXQgPSBkcm1fZHBf
ZHBjZF9yZWFkYigmdGMtPmF1eCwgRFBfTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HLCAmcmVnKTsK
IAlpZiAocmV0IDwgMCkKIAkJZ290byBlcnJfZHBjZF9yZWFkOwogCiAJdGMtPmxpbmsuc2NyYW1i
bGVyX2RpcyA9IGZhbHNlOwogCS8qIHJlYWQgYXNzciAqLwotCXJldCA9IGRybV9kcF9kcGNkX3Jl
YWRiKCZ0Yy0+YXV4LCBEUF9FRFBfQ09ORklHVVJBVElPTl9TRVQsIHRtcCk7CisJcmV0ID0gZHJt
X2RwX2RwY2RfcmVhZGIoJnRjLT5hdXgsIERQX0VEUF9DT05GSUdVUkFUSU9OX1NFVCwgJnJlZyk7
CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQl0Yy0+bGluay5hc3NyID0g
dG1wWzBdICYgRFBfQUxURVJOQVRFX1NDUkFNQkxFUl9SRVNFVF9FTkFCTEU7CisJdGMtPmxpbmsu
YXNzciA9IHJlZyAmIERQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfRU5BQkxFOwogCiAJZGV2
X2RiZyh0Yy0+ZGV2LCAiRFBDRCByZXY6ICVkLiVkLCByYXRlOiAlcywgbGFuZXM6ICVkLCBmcmFt
aW5nOiAlc1xuIiwKIAkJdGMtPmxpbmsuYmFzZS5yZXZpc2lvbiA+PiA0LCB0Yy0+bGluay5iYXNl
LnJldmlzaW9uICYgMHgwZiwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
