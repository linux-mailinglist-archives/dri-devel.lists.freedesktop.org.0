Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 487EE82C97
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DB489BC0;
	Tue,  6 Aug 2019 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0071F6E454
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f9so5547452wre.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UcxCUBbmcFwMvFJ+lzmbbweMssQIyjYeLgMmBVzMwco=;
 b=QPqLG8WmyIV3hIHlq4tVjDiYenweEzTmgKoQgtX6iC1TNVpCtYN6GwEOTI3haFLgGZ
 wQQLxFMwmCwZx/Ci3LBecqOC4oOl9WQ+yStnLBPzH2Dhi2fBNVW79acyn73nEpnTO8Yd
 HtEMgy9KRDe9Uxbs4M4tYhxyNii37GznN0h9SSy882IRkiIlhb0/31uQ+7EtdEitguRP
 5XlGws1jC1IrTz/2kdEz59OxtKPa7WyaZae4tNMBor676PjHWYuuK2vKegRa0zaHhZEu
 C64ebWjaWQz7gG4jLW8wpG9hMdVds3cF/Tj46SPovb2PGgXjxEvCRJ/w5Q3kInb1BKkS
 NXpQ==
X-Gm-Message-State: APjAAAX1eriA3JBF+ZfHvnViW6RgRWmgSyQ/PkS8oHKSEri5eagOr8Ry
 FkLc/T10x5BBK43+k+1ZOnESTQ==
X-Google-Smtp-Source: APXvYqyIqNSpPNxgzAYWIGhNEn2TMUn6UT0Sy9FMytw7EErfFGJd/kNAO6/hg23/W2fym0jSst7kqw==
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr157062902wro.60.1565012470500; 
 Mon, 05 Aug 2019 06:41:10 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/8] drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
Date: Mon,  5 Aug 2019 15:40:58 +0200
Message-Id: <20190805134102.24173-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UcxCUBbmcFwMvFJ+lzmbbweMssQIyjYeLgMmBVzMwco=;
 b=Z4GCLa3Qh6Rov0aWhoMvXszTGWjElSstDzL3OKiiBUS0AOCza+chFFm6WBkjsSUjF2
 m7xOnP1W7oEWspJ28voCXaybtNQT7tTsqqFEx7HvTKUAU3fYoR5vFmub4pqLSkJuo3oj
 mBEKL2w8yl024pYq1sCrC4thtkyQj4cTSdS8GOVPllKzjIeuRMOggkUldGnwUXF6GpcE
 iIi51y/TCARESONkSgnKt7lcAmDGBYh9N3T7XxaRVjeyf/XpaYzK2Aou97XfpPsfE5C8
 7aMp3MHGEMwqTxBVSR/K8yqp3Iha6fOWk47mwTZNgm/mf5wWXhqrJXwWnoQZaOfGuF7o
 qNMg==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvcGVybHkgc2V0dXAgdGhlIGNoYW5uZWwgY291bnQgYW5kIGxheW91dCBpbiBkdy1oZG1pIGky
cyBkcml2ZXIgc28Kd2UgYXJlIG5vdCBsaW1pdGVkIHRvIDIgY2hhbm5lbHMuCgpBbHNvIGNvcnJl
Y3QgdGhlIG1heGltdW0gY2hhbm5lbCByZXBvcnRlZCBieSB0aGUgREFJIGZyb20gNiB0byA4IGNo
CgpDYzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpTaWduZWQtb2ZmLWJ5OiBKZXJv
bWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwppbmRleCAyYjYyNGNmZjU0MWQu
LmNhZjhhZWQ3OGZlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLWkycy1hdWRpby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS1pMnMtYXVkaW8uYwpAQCAtODQsNiArODQsNyBAQCBzdGF0aWMgaW50IGR3X2hk
bWlfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJfQogCiAJ
ZHdfaGRtaV9zZXRfc2FtcGxlX3JhdGUoaGRtaSwgaHBhcm1zLT5zYW1wbGVfcmF0ZSk7CisJZHdf
aGRtaV9zZXRfY2hhbm5lbF9jb3VudChoZG1pLCBocGFybXMtPmNoYW5uZWxzKTsKIAogCWhkbWlf
d3JpdGUoYXVkaW8sIGlucHV0Y2xrZnMsIEhETUlfQVVEX0lOUFVUQ0xLRlMpOwogCWhkbWlfd3Jp
dGUoYXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9DT05GMCk7CkBAIC0xMzksNyArMTQwLDcgQEAgc3Rh
dGljIGludCBzbmRfZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CiAJcGRhdGEub3BzCQk9ICZkd19oZG1pX2kyc19vcHM7CiAJcGRhdGEuaTJzCQk9IDE7Ci0JcGRh
dGEubWF4X2kyc19jaGFubmVscwk9IDY7CisJcGRhdGEubWF4X2kyc19jaGFubmVscwk9IDg7CiAJ
cGRhdGEuZGF0YQkJPSBhdWRpbzsKIAogCW1lbXNldCgmcGRldmluZm8sIDAsIHNpemVvZihwZGV2
aW5mbykpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
