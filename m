Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D2D7BE6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B426E84D;
	Tue, 15 Oct 2019 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0BD6E150;
 Tue, 15 Oct 2019 10:11:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 7so20204564wme.1;
 Tue, 15 Oct 2019 03:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
 b=n01VZqttZy5Nrd9wNVfOIJGSQ/UMQL7x3LUqqOyPe/zjDfd9p0aoMe5Xf7CX5mEpwK
 PzArVvLGj6XKVBKv/zLizFSRO61sJaVEuzfTBWUrx2WufJGIXQBOV4+wjtSbeQLBwE47
 hRIeeHK62YSpenom3Fe0QNjrlmM/bPL/ITi164NGBIpD0MdIzkPDPDeCe1QlsnvznaoW
 0/M3v5Xvm0pZgeiG7qFKu4YXhBcTPP/ChaJLnA0Zm53uhC3iLpo1od09mdvdYvzESqHw
 V5FXdHsDDFuXtemNP7ZAT3alLOImv1CQYepKVstvSyF9uQSgfuiQA9+FzHngjar793LY
 UHmw==
X-Gm-Message-State: APjAAAXqB2TgWEPXb8MpkxCD3+eivdaMlaqCWZLySYor7XtRXekWoVAI
 Hx0zkEDKIIMzOt7K8o33n1s=
X-Google-Smtp-Source: APXvYqyPVLnjDiYl87POHRW8VN0tUihEAxvO/+0++G1lbLs4ypFF2T1OQn38A+5OS4GmxLtWwsmxdQ==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr15633501wml.38.1571134263669; 
 Tue, 15 Oct 2019 03:11:03 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 03:11:03 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/7] dt-bindings: msm/mdp5: Document optional TBU and
 TBU_RT clocks
Date: Tue, 15 Oct 2019 12:10:53 +0200
Message-Id: <20191015101058.37157-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
 b=vGMW97MJ6WdyPk02rAJYW5hBe109q7xTv+F9Pm2vjuApqi+XlsgeMuCb+B4BmrL4zg
 8AlHifAmBgeR844Yp8XFZMS/NpBbhFvIM0gq/6PDxYYEE+DAU1NaRGwmQT1VxOLioYVL
 X/qKOx+WpVZpXZlIwvtp1bobfoeuVz1X0GtW9vy3MSKSXY+QvTLMsqIFPbj2TGFPrMjE
 AdF7tP9j4YSi4IL95oeg/UHYvoOsR6MtPqZXmJmgOw4KdYwwvpZ2ZSt41N678XK0Y4yQ
 4FC1YqpdurRJQKS0KqlZcQSYCu4RCi8tZjJ4yVyRQJiGNy95+YGY6wMQm4bySqFDzFAm
 S62Q==
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

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKVGhl
c2UgdHdvIGNsb2NrcyBhcmVuJ3QgcHJlc2VudCBpbiBhbGwgdmVyc2lvbnMgb2YgdGhlIE1EUDUg
SFc6CndoZXJlIHByZXNlbnQsIHRoZXkgYXJlIG5lZWRlZCB0byBlbmFibGUgdGhlIFRyYW5zbGF0
aW9uIEJ1ZmZlcgpVbml0KHMpLgoKU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21zbS9tZHA1LnR4dCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tc20vbWRwNS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tc20vbWRwNS50eHQKaW5kZXggNGUxMTMzODU0OGFhLi40M2QxMTI3OWM5MjUg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9tZHA1LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tc20vbWRwNS50eHQKQEAgLTc2LDYgKzc2LDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIE9w
dGlvbmFsIHByb3BlcnRpZXM6CiAtIGNsb2NrLW5hbWVzOiB0aGUgZm9sbG93aW5nIGNsb2NrcyBh
cmUgb3B0aW9uYWw6CiAgICogImx1dCIKKyAgKiAidGJ1IgorICAqICJ0YnVfcnQiCiAKIEV4YW1w
bGU6CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
