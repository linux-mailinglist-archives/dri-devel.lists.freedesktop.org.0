Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E763187
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ED189B67;
	Tue,  9 Jul 2019 07:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1789E11
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 16:57:57 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i18so7981985pgl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 09:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xDwSUm2ymU/W1fSZho5QIri1l9GMHXrnnJtJgPD9q8c=;
 b=DjxjDTiB1rayC47d2QMul8BNp3jNR6M+rWbElttFa7htNM95inxlktiPIPlIMX6QXG
 8Y/7jdQsrCQNN34OW7DCFqP941eQxDHw+eIz7HFY9fDOoTYmj63y+GutLYbTOyTJW9AH
 GgFCjngnf6l+kfZYvKKiDOK4h+LtCNlcOcrNF2am3TMVkrE/fFp+Cj2anN1//z3pXAmV
 9F+37Wk+fQRLeq/UvNT4K0In2iu+qro/Npvqw7z9el1gatMsz5Osej9xjBm9E49svT2B
 rZygTvNYDy4dbJ9Qrf85hqS8gwaAAU9XJkhCE1es1cV/Va2zgRRVCUZ8JEOy/CxPkigK
 JVxg==
X-Gm-Message-State: APjAAAX/NRVa//p8SrqvRoXGSmu8RLr1u7UFPiBODt9laidM38PSJLVd
 0quE8DgNshHALO35BKmyflw=
X-Google-Smtp-Source: APXvYqzSJot1VXmkklME31WkeSKMsCOKZxANzmuc2CzhjLcyvTi751cZbwfGTLg8UoLNQEdOMtdGbQ==
X-Received: by 2002:a65:62ca:: with SMTP id m10mr25029485pgv.57.1562605077213; 
 Mon, 08 Jul 2019 09:57:57 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id d16sm12280022pgb.4.2019.07.08.09.57.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 09:57:56 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Date: Mon,  8 Jul 2019 09:57:53 -0700
Message-Id: <20190708165753.46275-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xDwSUm2ymU/W1fSZho5QIri1l9GMHXrnnJtJgPD9q8c=;
 b=cUqnE1qJhl3aN0kYxeb2SjpcgFwRj4ZP4G1SQBx2d9jsqA2OItxE1MuXGX5OceJ9rJ
 /i18h7EhofDQiCMmSS9BSVtNTifgQi5NTpjlwB09P9BRk49ZfAqEW/Q8QxakZdxMdy+H
 u2/s7QFSBF2LXOEwYXdTUZ10znesq9ATfZ/7W1EYB0nysxpT73RkiT85DuXmfDlDt78Y
 4WosOgy8yX5QSD8LD5gbB5YRe/+8AoOqah8y0FHeFgN9SZDtig2WKmsQBflUW9ZADZa7
 YVJNqDr2Wj9xCF2VPteY0mHl3inFSA2SNcESc9a792f2A+s+lvWnKKur6/QUixjwTQKs
 2R+A==
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
Cc: devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNoYXJwIExELUQ1MTE2WjAxQiBpcyBhIDEyLjMiIGVEUCBwYW5lbCB3aXRoIGEgMTkyMFgx
MjgwIHJlc29sdXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTExNnowMWIudHh0ICAgICAgfCAy
NiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3NoYXJwLGxkLWQ1MTE2ejAxYi50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTExNnowMWIu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hh
cnAsbGQtZDUxMTZ6MDFiLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLmZkOWNmMzliZGU3NwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxkLWQ1MTE2ejAxYi50eHQKQEAgLTAs
MCArMSwyNiBAQAorU2hhcnAgTEQtRDUxMTZaMDFCIDEyLjMiIFdVWEdBKyBlRFAgcGFuZWwKKwor
UmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJzaGFycCxsZC1k
NTExNnowMWIiCistIHBvd2VyLXN1cHBseTogcmVndWxhdG9yIHRvIHByb3ZpZGUgdGhlIFZDQyBz
dXBwbHkgdm9sdGFnZSAoMy4zIHZvbHRzKQorCitUaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3
aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZy4KKworVGhlIGRldmljZSBub2RlIGNhbiBjb250
YWluIG9uZSAncG9ydCcgY2hpbGQgbm9kZSB3aXRoIG9uZSBjaGlsZAorJ2VuZHBvaW50JyBub2Rl
LCBhY2NvcmRpbmcgdG8gdGhlIGJpbmRpbmdzIGRlZmluZWQgaW4gWzFdLiBUaGlzCitub2RlIHNo
b3VsZCBkZXNjcmliZSBwYW5lbCdzIHZpZGVvIGJ1cy4KKworWzFdOiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQKKworRXhhbXBsZToK
KworCXBhbmVsOiBwYW5lbCB7CisJCWNvbXBhdGlibGUgPSAic2hhcnAsbGQtZDUxMTZ6MDFiIjsK
KwkJcG93ZXItc3VwcGx5ID0gPCZ2bGNkXzN2Mz47CisKKwkJcG9ydCB7CisJCQlwYW5lbF9lcDog
ZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmYnJpZGdlX291dF9lcD47CisJCQl9
OworCQl9OworCX07Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
