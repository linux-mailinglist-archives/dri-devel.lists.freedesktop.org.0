Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190852466
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2796E89F9F;
	Tue, 25 Jun 2019 07:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B999889E05
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 04:05:47 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id i34so16936610qta.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XoSvE7N+j3Mxg/IlWBM7LJa1qcyCkhIFO08QDOH/raI=;
 b=OE3tFUcRVhOXMxx8Q7K++JvEE2oJHt2pV0f5dftBSbtpAHPlLhUKonBIw/qwof2yNu
 fn92rayTqSljBaaCTwfKaHkuXLoqggaFnYzSKVzRED9KuuXcupCNY69YJ2Hl7jxlfH5J
 WEugqKWH1+/E1pqbWyEvgjOtqpzKM/R8iHwNU4zNaRdUNcYyo39KP/Wh8QVGHScCwMnC
 Q794rNAir5zhKtMsXmj2/XDhnQatNMFR9KgYkoc/OmgXwUInRRMLwtONr5LQ9QMHu6x+
 XUm75qqIt4ARsP5cLNF96jrfTVWuSfAUMnLnfP081X1o8mmbNQ1FOv0s6YijVckELc0R
 tveA==
X-Gm-Message-State: APjAAAVNCZ9cGF6LGqWWgfXtNY9q4i+6xhynn810WZatqLRQ3dGu4uiJ
 Z8idKtKlcrr12h+Vsl7ycJc=
X-Google-Smtp-Source: APXvYqzVgLl6NC4D8YY3vGIeOwlowXRytM35NnhS97fSyed0a2UigQzw125JadsbBPopKo7Dxfr+dg==
X-Received: by 2002:ac8:29c9:: with SMTP id 9mr106932315qtt.196.1561435546877; 
 Mon, 24 Jun 2019 21:05:46 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home
 (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
 by smtp.gmail.com with ESMTPSA id e8sm6741029qkn.95.2019.06.24.21.05.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Jun 2019 21:05:46 -0700 (PDT)
From: Brian Dodge <bdodge09@gmail.com>
To: pavel@ucw.cz
Subject: [PATCH 0/2] fix vendor prefix for arcxcnn driver and bindings
Date: Tue, 25 Jun 2019 00:05:27 -0400
Message-Id: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=XoSvE7N+j3Mxg/IlWBM7LJa1qcyCkhIFO08QDOH/raI=;
 b=aZEOJgBocvFcnzN3COTXh7aIr/gTmHFXM+R2u8j0mtd/ktaH/5E2KiFSboc7jqTj/h
 alfDJZPhA0GjokbKjupf3AhMI80ijLB9I/Zhx0bARILpwCMqpyKCS//ecExyEOplmeqN
 BLc5AI76ePPltb5EAnxkLXP/H/Q3WSMYjbk9b4T2gBWP8RkACXMR+HcqB/6hoGJCDzCj
 7TAzVU55bsuWOPZHIbNpS+QDyUO+dwzGaUhPazvQXlXIJ9KDVfS1v4FR5qg4Kf56YjBu
 1AZ4W4xNam/hll9H+fnBVeew6HRm0bNmAvsIyhfSMCCRV7M14jNE3ypaa6r3M6ApdAlZ
 v5aQ==
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
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoZXNlIHR3byBwYXRjaGVzIHN1cGVyY2VkZSB0aGUgcHJpb3Igc2ltaWxhciB0aHJlZS1wYXRj
aCBzZXQgCnN1Ym1pdHRlZCBvbiA2IE1vdiAyMDE4LiBBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNp
b24uCgpUaGlzIHBhdGNoIGlzIHRvIHVwZGF0ZSB0aGUgYXJjeGNubiBiYWNrbGlnaHQgZHJpdmVy
IHRvIHVzZSB0aGUKcHJvcGVyICJhcmN0aWMiIHZlbmRvci1wcmVmaXggYW5kIGRvY3VtZW50IHRo
YXQgaW4gdGhlIGRldmljZS0KdHJlZSBiaW5kaW5ncy4KClRoZXJlIGlzIGF0IGxlYXN0IG9uZSBl
eGlzdGluZyBkZXZpY2UgdXNpbmcgdGhlIG9sZCAiYXJjIgp2ZW5kb3ItcHJlZml4IChTYW1zdW5n
IENocm9tZWJvb2sgUGx1cyksIHNvIHN1cHBvcnQgZm9yIHRoYXQKcmVtYWlucyBpbiB0aGUgZHJp
dmVyIHNvdXJjZS4KClVubGlrZSB0aGUgcHJldmlvdXMgcGF0Y2ggc2V0IHdoaWNoIGhhc24ndCBi
ZWVuIGFwcGxpZWQsIHRoZXJlCnRoZXJlIGlzIG5vIGFjdHVhbCBmdW5jdGlvbmFsaXR5IGNoYW5n
ZSBoZXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
