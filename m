Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C8EB0BA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850CB6EE69;
	Thu, 31 Oct 2019 13:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646196EE21;
 Thu, 31 Oct 2019 10:44:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p4so5654262wrm.8;
 Thu, 31 Oct 2019 03:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
 b=hbPzfecRirKQFSRffvqy8KxpzAFrQLXQtUpinV1M8hxGbjqWuiXwmnMUgZu4ZNV1zj
 +f11rJt7TViYhjIMy0NIpRvmYff3jz90Bc0ApC8CP+at2e4ksrjVIxQIRbFwEbiZ3nG0
 XFnXXfmGZM3uM9jH2V+Z0SzmLB01IJqWmDXHVp4SrhuLTln7LOeWudC0GMqkTZp2oKLw
 kFGCFYL1/p4nBExQ5/TAScHdFhLOmFH0yBqASdenL7w0fbNmA9aQwhCyzKddP7A/Mw8C
 TGMEGUtEbU3fC3xNXIm3aS0t1mAf38wqrL72YixY33gReDESBueFSOUmVXkjEjoj45z8
 4QHA==
X-Gm-Message-State: APjAAAVcWPN8WHQ26Dq+SBB1h85iFYLiUIZc9BtbNXbxhFk0I8QEYHow
 WtgOwhTH0TNk6SvLbuVl2+M=
X-Google-Smtp-Source: APXvYqwgV7N/8acv9uSD5DCqYy73YyUOoG7pEZ5Ul7G02SbyDFbzKHeu0KIBlrX37UUT/5wybg70Sw==
X-Received: by 2002:a5d:574d:: with SMTP id q13mr3663556wrw.263.1572518653849; 
 Thu, 31 Oct 2019 03:44:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:44:13 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B
 compatible
Date: Thu, 31 Oct 2019 11:44:00 +0100
Message-Id: <20191031104402.31813-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A61m3u12oKMYzHTcbcOV5T5oBURDYn0JpKjZ9AFEq8Q=;
 b=CHPNCazfEYq7wKypwLSmtIQYejllhGhcc5ukmAGRLvp8A3ZzB7tTN0FFVfuE/3IX9a
 woZM7nHqopnw0yQW34jMu0BrJ64+J7+ZOAZ76mcoKnJrHn25diQyx5uAVvgQO/fAx0rp
 O939uxFJcp6s4vQu3VgVKIWDjCYZUXYse9U2zZIzh8Ymel3IrRPLRv1uC32TmrTi4Y8p
 9JJjrosUpXkHCRj6HV8odcf95sLdD5ShTHbDvclgyFnbBvNAbgzyKYDZoH2KS9GxczE6
 IHqioUXyVxty4OYnbslEdt9/Pqe1Aots5k1u8Ca4IsDRdthHYpTj9m99fWXjPE3pzz2U
 An4Q==
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
