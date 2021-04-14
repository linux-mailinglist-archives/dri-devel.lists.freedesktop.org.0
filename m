Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC46435FA4F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 20:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81B06E4CA;
	Wed, 14 Apr 2021 18:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F076E4CA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:12:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id 18so24855219edx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XaDqv6uPzP6qKRYwsvhGZokvdMBhemyYbul7hQEy7vM=;
 b=qrsUqyKwLxiLtTJIKW7zoZJmBwPpulz25SwG7ERZAZkWHwI6CKy4JTKhtvcgtwmYxi
 DNsRI9oXwnlFM8y1ZQxc5NxqbU2oenwpdvY0dI7NFAKSSY72yhkPKfYTsP+GoSmaRFun
 9LnnQ2uT/XyC5zUzBdzaivrAGo0yJfbDbmV4kfBwiXFUHCuFqdGRrS9n9ja+/6f6Wqen
 vF+5lUDtVuE/cxK/gcDTefDoPSsJPmXWFNHOzAZ2H1Mn32INVKNdqRs7hHCHcoQs4opK
 31g/wHsY1AJ7spPFjrWUHTvT3cyV4tzX1N7oEfwvnqqjii2eCm4WJvPbdC01CeZp0qfO
 lRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaDqv6uPzP6qKRYwsvhGZokvdMBhemyYbul7hQEy7vM=;
 b=KBCig5IHM9XaA7epF2PDbx2gIj+RV86MpYtarN3CTLrLu5FhN6BQ9GrfVFXiUFXANL
 z4iRhlbCDrC5tRhJugfDwatKvvf8fRorH6rNYD2/a4snaGtax9HEHfVk+ZSlbmBya17m
 Q1cuPQ5PPQTWM3608S3L+UvjLq21wKtn2neMPRdSGAKrcrZmJRrhXyDt1B6I5qTebql4
 frcwTCq1iMEpBBxWLz8vkpfmvUdKldOrtQROBZ+9uqAKluZ8/k8D9EqvXMHRIOnlQlrC
 G24DLNxUJee7RBvyqiuU654wd+CjmYHFFipPC1Y9/dJFoXQ+zfdmXoV6FDk0PHekCzmd
 eMRg==
X-Gm-Message-State: AOAM533JooBJEmzdNYewRk9onBI6I2LfiXswE0lRh+gVMeHefoJFVCI9
 b2hdMHsZNvuPVvVbf6SVcr8R0g==
X-Google-Smtp-Source: ABdhPJyFKJ9t/SlxwgkNZtl1Er9EBURioW4mHm6fuoqesYXDLzxQET03VyRMKq1QMeHc3ipnNvmuYQ==
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr179881edc.21.1618423934063; 
 Wed, 14 Apr 2021 11:12:14 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 11:12:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/57] staging: fbtft: fb_ili9320: Remove unused variable 'ret'
Date: Wed, 14 Apr 2021 19:11:10 +0100
Message-Id: <20210414181129.1628598-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9zdGFnaW5nL2ZidGZ0L2ZiX2lsaTkzMjAuYzogSW4gZnVuY3Rpb24g4oCYcmVhZF9kZXZpY2Vj
b2Rl4oCZOgogZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2lsaTkzMjAuYzoyNTo2OiB3YXJuaW5n
OiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KCkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZA
dmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldgpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYl9pbGk5MzIwLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRm
dC9mYl9pbGk5MzIwLmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfaWxpOTMyMC5jCmluZGV4
IGYyZTcyZDE0NDMxZGIuLmYwZWJjNDA4NTdiMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9mYnRmdC9mYl9pbGk5MzIwLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2lsaTkz
MjAuYwpAQCAtMjIsMTEgKzIyLDEwIEBACiAKIHN0YXRpYyB1bnNpZ25lZCBpbnQgcmVhZF9kZXZp
Y2Vjb2RlKHN0cnVjdCBmYnRmdF9wYXIgKnBhcikKIHsKLQlpbnQgcmV0OwogCXU4IHJ4YnVmWzhd
ID0gezAsIH07CiAKIAl3cml0ZV9yZWcocGFyLCAweDAwMDApOwotCXJldCA9IHBhci0+ZmJ0ZnRv
cHMucmVhZChwYXIsIHJ4YnVmLCA0KTsKKwlwYXItPmZidGZ0b3BzLnJlYWQocGFyLCByeGJ1Ziwg
NCk7CiAJcmV0dXJuIChyeGJ1ZlsyXSA8PCA4KSB8IHJ4YnVmWzNdOwogfQogCi0tIAoyLjI3LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
