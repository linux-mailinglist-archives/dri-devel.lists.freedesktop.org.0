Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78585B58E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E7489F01;
	Mon,  1 Jul 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D083889D77
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 00:28:30 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id g18so9724148qkl.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 17:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7qYFyTa++dPYcTB/wPOOwVksoths7n3J/hGDQEqBk9Y=;
 b=PBHGVkfM++/Yv24wPHDmYItaiGdgY5NHbzANM6GuJRgecamEJcM8FjTVryFd+/cc19
 IHrh8CJKlCHh9N6oaK0wG1m3Z8DNsyvCekFmzrXXzDp6pNy96SDUMtU9RTWRJB4dCHL2
 u6gujhJzjDhcfuyAcOeRRNFj/waxSLkhQ40dwdmt2L1YqeBA5gShKBRelmMgXc7BSc6L
 MlrTbiYJ+CJ7J1bzNPbgmNfiwbD9bj0jh/9lZ8IoMdI4yJjkT1Ua79z0gHqskwdEt3LY
 vQdSnRcp22eCyN7UAQc9DMBq5ztv4gZxH3On0SsSI+Ag+oLJaHgYs/1I41jHZADZ8iIL
 jqnQ==
X-Gm-Message-State: APjAAAX+wWsp8rjJGS8zdGlYR/s5uAeM2+w8obnCvImjRwZ+/sRDwDMe
 6TqjXcSmXyA/eTTyxU6pyog=
X-Google-Smtp-Source: APXvYqzYYg9GzCKY0A+FyNahVdDjis8vR4irKL7u8oE3utcfTC+p0obqxkqpQ/Hs/TZEqdYpGLNMew==
X-Received: by 2002:a05:620a:124c:: with SMTP id
 a12mr17969302qkl.336.1561940909759; 
 Sun, 30 Jun 2019 17:28:29 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home
 (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
 by smtp.gmail.com with ESMTPSA id 70sm3971404qkj.118.2019.06.30.17.28.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 17:28:28 -0700 (PDT)
From: Brian Dodge <bdodge09@gmail.com>
To: pavel@ucw.cz
Subject: [PATCH v2 0/2] fix vendor prefix for arcxcnn driver and bindings
Date: Sun, 30 Jun 2019 20:28:13 -0400
Message-Id: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 01 Jul 2019 07:12:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7qYFyTa++dPYcTB/wPOOwVksoths7n3J/hGDQEqBk9Y=;
 b=bPXYpNuRbzysSa/8pQCMk6dwAcL9Rtn+30GYHuF+swMnoy5/1OZjhO3+YEJF4yiLiJ
 dRO6CwvPWIcEUAISJnt5OmmrTt1sR+mHIVck4aKRa0Jmc7yXUX6hwNbOBjSrn60yCSE+
 fp+sf/xnjLOSE+KTH4ZZLmZyfC5hAIYP/VNyOJGu1KcB6OZMUkCCbwkixfQuyrOBojm2
 Bn1rSadoFV/D3ufymRmWCdA0dYC7d/y/u4Dl6OlMzx+GXFuajZ8CteB04fXipQlYHkGt
 qqvkgxAn4Nc76faUjYWMvInhnnYEiPh5cxRQkJsg9PuP2+63mUjtkNAjhJHYCkMRkQVm
 IGGQ==
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

VGhlc2UgdjIgcGF0Y2hlcyBpbmNvcnBvcmF0ZSB0aGUgZm9sbG93aW5nIGNoYW5nZXMKCjEvMiBk
dC1iaW5kaW5nczogYmFja2xpZ2h0OgoKVGhlIGRvY3VtZW50YXRpb24gZm9yICJhcmMiIGhhcyBi
ZWVuIHJlLWFkZGVkIGJ1dCBtYXJrZWQgKGRlcHJlY2F0ZWQpCnRvIG1hdGNoIHRoZSBhY3R1YWwg
ZHJpdmVyIHN1cHBvcnQgZm9yIHRoYXQKCjIvMiBiYWNrbGlnaHQ6IGFyY3hjbm46CgpBZGRlZCBu
ZXctbGluZXMgYW5kIGZpeGVkIHNwZWxsaW5nIGFzIHBlciBmZWVkYmFjawoKT3JpZ2luYWwgcGF0
Y2ggZGVzY3JpcHRpb246CgpUaGlzIHBhdGNoIGlzIHRvIHVwZGF0ZSB0aGUgYXJjeGNubiBiYWNr
bGlnaHQgZHJpdmVyIHRvIHVzZSB0aGUKcHJvcGVyICJhcmN0aWMiIHZlbmRvci1wcmVmaXggYW5k
IGRvY3VtZW50IHRoYXQgaW4gdGhlIGRldmljZS0KdHJlZSBiaW5kaW5ncy4KClRoZXJlIGlzIGF0
IGxlYXN0IG9uZSBleGlzdGluZyBkZXZpY2UgdXNpbmcgdGhlIG9sZCAiYXJjIgp2ZW5kb3ItcHJl
Zml4IChTYW1zdW5nIENocm9tZWJvb2sgUGx1cyksIHNvIHN1cHBvcnQgZm9yIHRoYXQKcmVtYWlu
cyBpbiB0aGUgZHJpdmVyIHNvdXJjZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
