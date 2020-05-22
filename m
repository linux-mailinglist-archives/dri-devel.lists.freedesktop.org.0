Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A821DF64A
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859446E169;
	Sat, 23 May 2020 09:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123616E3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 07:25:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f5so596445wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHgeS900C8sjZPSNqdj5fllI3ugne42uY2C7wCBS5Gc=;
 b=lD8c4JEKWp4wF+rIFa4eB53uzn67CvhVIXCJdVVeXQami4aGZ9RQI+9IC7Q56X9Vxp
 o35EnfKJOJE2FxKUDHkBZXVHu3dt5Mds4QGISSRoPaXCsRivc/sKiC9/K4y5V2svIlA8
 7cESVc1bQfp4oBkny2cx7z7MH31BO7Hyi2vQsIIf7qG+DzWBKej+wTexUk8VSeqdFppN
 Hz9rdN1eY00OtieXvWRiwGNFFYjUw1yVoJzqKM7WBvSoNHkAf6cMoHA9FYAeHxEQgN89
 gAdK75z09uo6bbtcFf6tjWgk0WlNy6rFg7FM/SWtjgL4/ACRUJZmk+k2MWswrAtbyNfz
 Bwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHgeS900C8sjZPSNqdj5fllI3ugne42uY2C7wCBS5Gc=;
 b=MGwv/zMLKyun3BS2pqgLkXKGDw0egvE8AZ8EwJg4cjaDfEYU7fZZw1s2oA85s7sZX7
 Q6JB/EbGCO9K96YkSUCSwHVBvnOGgOY6bKiKkdUF2Eaooxv0136yGfuugD2wGXw5fl5r
 ukjOYKbAQXqOyCOMLUkaw+nEo2AUQ3QYpqcKTSZT2gVuf9fpyhYxCDIk2A1nRoJfFMqt
 zsP+m3kKCKy5kgxY1yoKNtuZ4BNKPCXcdtbpg463U0vqZIvg14XzqAo7y4b3VkeejJlV
 60ObaXPvVP0K7D4dtjgZCzKpyNS0I7igbns48cE4im/nHJjWVUMfbMmCCjtz7VkFswvi
 DaiA==
X-Gm-Message-State: AOAM532xFlMsPc6DIPxcuQg8SANAlr5PSGCafscMCBhv4ocOrnyqxJ3d
 hcuEIAaOrgl8tKrw/MWWo3Y=
X-Google-Smtp-Source: ABdhPJzZtAzIjrObPOreEvfAVtffck8CKlAUsXZQXdOeijTaDTKBgecBn4czPLCpDMJ3+PcRdNzZUA==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr13114869wmm.155.1590132329602; 
 Fri, 22 May 2020 00:25:29 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:29 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date: Fri, 22 May 2020 09:25:21 +0200
Message-Id: <20200522072525.3919332-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KIHYzOiBubyBjaGFu
Z2VzLgogdjI6IGZpeCBjb21taXQgdGl0bGUuCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMKaW5kZXggZTRlM2NlZWFjMzhmLi42YTA4ZGQwN2IwNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMzM4LDggKzMzOCw4IEBAIGVudW0gYnJjbW5hbmRf
cmVnIHsKIAlCUkNNTkFORF9GQ19CQVNFLAogfTsKIAotLyogQlJDTU5BTkQgdjQuMCAqLwotc3Rh
dGljIGNvbnN0IHUxNiBicmNtbmFuZF9yZWdzX3Y0MFtdID0geworLyogQlJDTU5BTkQgdjMuMy12
NC4wICovCitzdGF0aWMgY29uc3QgdTE2IGJyY21uYW5kX3JlZ3NfdjMzW10gPSB7CiAJW0JSQ01O
QU5EX0NNRF9TVEFSVF0JCT0gIDB4MDQsCiAJW0JSQ01OQU5EX0NNRF9FWFRfQUREUkVTU10JPSAg
MHgwOCwKIAlbQlJDTU5BTkRfQ01EX0FERFJFU1NdCQk9ICAweDBjLApAQCAtNTkxLDggKzU5MSw4
IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29u
dHJvbGxlciAqY3RybCkKIAkJY3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFuZF9yZWdzX3Y2MDsK
IAllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNTAwKQogCQljdHJsLT5yZWdfb2Zm
c2V0cyA9IGJyY21uYW5kX3JlZ3NfdjUwOwotCWVsc2UgaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+
PSAweDA0MDApCi0JCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192NDA7CisJZWxz
ZSBpZiAoY3RybC0+bmFuZF92ZXJzaW9uID49IDB4MDMwMykKKwkJY3RybC0+cmVnX29mZnNldHMg
PSBicmNtbmFuZF9yZWdzX3YzMzsKIAogCS8qIENoaXAtc2VsZWN0IHN0cmlkZSAqLwogCWlmIChj
dHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNzAxKQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
