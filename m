Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEFEB0AE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B156EC2C;
	Thu, 31 Oct 2019 13:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457DE6EE1A;
 Thu, 31 Oct 2019 10:44:12 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q13so5653265wrs.12;
 Thu, 31 Oct 2019 03:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
 b=R4dwKOuWzxj/aHCrfkzkOjnIfKH4arVc2WnK3ZrjF7EqJjhmiKEroGmyITN1AXdBqi
 S1n3segZH4F933GNs9Mz6Ylzj6Ra38TVcm6/cq20JKM3QpErrKEWlpgBtRsil/jfL7C3
 bl2Ar0hTfpK6ykZw5xMRgn38QOe+7c2JzMqqulYm0QMBeqS/cdz9XtXKeuSAQnpQs5CP
 kzevAbHy3BJzM1C2bf6pjjB0+8CQWHFLUk0yl21Doo/aX1MZplyHx0PyVoc0yrDoKI1R
 zE9hjRlKgkj3JrElI+pmu8ylusO1wVRJ9PaqaMJWqaDzLN3C8dEXVV/u9XgNb9/OaqET
 kTug==
X-Gm-Message-State: APjAAAW5cWRxhGWinRtNsvhzqq0V/HFAQTHq47tiFsp9uArVd5ac1dkL
 9YwQ4IlD15W+3ShThlg74Yc=
X-Google-Smtp-Source: APXvYqwkj1tdfMd7sFp61o4YJ6Z6LJARFJVTUzZlGz//Zb+BVBYTcPJi9esZBNQ2DBME+krRoRPLXQ==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr5209626wrm.340.1572518650726; 
 Thu, 31 Oct 2019 03:44:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:44:10 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 2/7] dt-bindings: msm/mdp5: Document optional TBU and
 TBU_RT clocks
Date: Thu, 31 Oct 2019 11:43:57 +0100
Message-Id: <20191031104402.31813-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
 b=p0OVbe70YJ3RbJ4RWYVXcCAEw3/iNsvZ3oB49YKg88yOpRl/02se9mwZF0WkYijZeZ
 ImG8ouyKUEdhrL3zGAO3p547KVwY1NwUr0MwmDW4me3nkHz9c8TxZqO8p9C7wQ9O84ya
 Fi1Bat8I+S6ikAilP7xF8kRaCSXQsnSpoMf1tQoDbPochwjtjeITXUMgj+MOWwHifv0C
 P+m8gWBNc92UyF3M4g+DIkR/74N/O2NgaUEvMR54PMxMq61DgpgRTX75jvc2bsYqceJd
 UBejyM+RIpcf+pTcGMIy+Gcj/g/nAFO3AKFejlmdAucOxh5XpqDuzg43WTM0lsXfwQJq
 XLWg==
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
