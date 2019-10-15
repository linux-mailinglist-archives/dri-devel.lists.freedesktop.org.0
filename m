Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F9D7BF1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1141A6E858;
	Tue, 15 Oct 2019 16:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417CE6E7AF;
 Tue, 15 Oct 2019 10:11:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 5so20207317wmg.0;
 Tue, 15 Oct 2019 03:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
 b=FUk8wvXFaAY2Vv7HvFEKRdVyYo5FQ/MfUFP3banm8mISB34lz3u/6EM8YCSUAe8dAz
 Xlo9CzKpdMjZZNqGXCoPo8CDfVIs9huOxUJGF22mDkCuGqmb70se4+VxA3ezoKlBHlAw
 pGnXBV5O5sO+ynaieVRt0cF94ieJm2y282nxsXb36FR7y9ZvsWZpiWSDPqgrKI+AEA1K
 9LQNlJhcBlPsyrbqg4g/Qd7C6k1MZI/UcaTfSI1ULAlAFjQSG26ClGJF3ZTLYGscTxkP
 8BA9KAjmHkGYIHGnOnjZZ1qPPGIIrjwIdzwahapy0qLpO0ym4B0iTicd7MLV216JMqoh
 cthQ==
X-Gm-Message-State: APjAAAWA9oqyD5LeCEB7/3L6H4ojDrYsqttB+/EiAMbnerK7lGbO1shG
 Np3/mE9dg7GfTpM8p4a4mII=
X-Google-Smtp-Source: APXvYqwaT28ROh8W7H79jlgiIgSfuIxdnPW47q5u676fq4bJzk89FhRhR06TPi4ewvwrxDk1OGt4wA==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr17440290wmh.148.1571134266579; 
 Tue, 15 Oct 2019 03:11:06 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 03:11:06 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B
 compatible
Date: Tue, 15 Oct 2019 12:10:56 +0200
Message-Id: <20191015101058.37157-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
 b=qSTQcxLV7utjjgxWnjpUDSKrGcqHyirT803FXxRmFjRBpo3nJvYYRZSoKowE2vU6Eb
 cVNVFjOYn/oRpsN6CRXydjBAYxYMVYXwufIggaWs0K8JiAtMDFxeIsIXBi9waJwla6T5
 Cc4T3MvsIp9DdBEk7BxcCiJAAp6Jd576yiJjuYU6EBwcv+3ehvpshZX3kf4XpFpGQVuU
 NzA1UgWgosF6sEdm8+xss2QDWvrUzBqs0oj5duZ+F3OBCZvSqf2QiOF3TNk9nsZOvwNa
 NtH1acXumxrh3d8NaYA9Tdrrkplf5l0OAKUDz8RYVgryukn7FLQhZ4MP/PKP4erpWbnO
 b5ng==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKT24g
ZmFtaWx5IEIgU29DcywgdGhlIDI4bm0gUExMIGhhcyBhIGRpZmZlcmVudCBpb3NwYWNlIGFkZHJl
c3MKYW5kIHRoYXQgcmVxdWlyZWQgYSBuZXcgY29tcGF0aWJsZSBpbiB0aGUgZHJpdmVyLgoKU2ln
bmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29t
PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2ku
dHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0CmluZGV4
IGFmOTU1ODZjODk4Zi4uZDNiYTllZTIyZjM4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dApAQCAtODMsNiArODMsNyBA
QCBEU0kgUEhZOgogUmVxdWlyZWQgcHJvcGVydGllczoKIC0gY29tcGF0aWJsZTogQ291bGQgYmUg
dGhlIGZvbGxvd2luZwogICAqICJxY29tLGRzaS1waHktMjhubS1ocG0iCisgICogInFjb20sZHNp
LXBoeS0yOG5tLWhwbS1mYW0tYiIKICAgKiAicWNvbSxkc2ktcGh5LTI4bm0tbHAiCiAgICogInFj
b20sZHNpLXBoeS0yMG5tIgogICAqICJxY29tLGRzaS1waHktMjhubS04OTYwIgotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
