Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C2F1C40C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1058922A;
	Tue, 14 May 2019 07:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26368925E;
 Tue, 14 May 2019 07:27:35 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id g9so8622681pfo.11;
 Tue, 14 May 2019 00:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:mime-version
 :content-disposition:user-agent;
 bh=lyCo4RhtPFnk5/aO02qephrgTtbsGXyGZCb4n0cJnyw=;
 b=BI/Af0kEtR7/TDn2oQBmzO8pIbFLE6pwAoX2Bq9M1m7uVxptcETD+mBRVi1KqOy6Bq
 OvZPHnVnLKukWh7gZbiUwNlbfV1bhIiDdfYsF86pg8tg3fa5pcDP09WA+RxWOalqk1x6
 h8TWrQFj0N+rvVMDCXFS5SMH4+M1MooUNWMcDIMDIh+mtQUfpNzuMfcM5HYFidqRnO/Y
 /6fEZrq4FuO5eFXc7wBP71k7A5qipazaPz4xN0vkdW06Ac9OdmLnmttr5KE9bKbA1uVF
 tvL3O9HhArWn+9Q8WLVtYYK2cOx9Gw7jalmsOICNDAY+DiHCECvhQnLVJwpQMIxmnJ+V
 rKiw==
X-Gm-Message-State: APjAAAXSJr6XiHqLDLRMXfgQE+6JQSfipnucs7b0ALJF1lU1ZiSDb9yu
 qBPmnTmZD606/TqZjLW/aNk=
X-Google-Smtp-Source: APXvYqxbkyut4p6mQIIgh6NfXlp+BvZaBtJJSbumEGh8I67qHa+vAQhNgHsP9GFw7uocH/XK7BDc6g==
X-Received: by 2002:a63:1e5b:: with SMTP id p27mr35433842pgm.213.1557818855330; 
 Tue, 14 May 2019 00:27:35 -0700 (PDT)
Received: from sabyasachi ([2405:205:641d:f30a:5511:e7cb:49d8:c4c3])
 by smtp.gmail.com with ESMTPSA id z9sm8613380pfj.58.2019.05.14.00.27.33
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 May 2019 00:27:34 -0700 (PDT)
Message-ID: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
X-Google-Original-Message-ID: <20190514072728.GA6348@sabyasachi.linux@gmail.com>
Date: Tue, 14 May 2019 12:57:28 +0530
From: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
To: robdclark@gmail.com, airlied@linux.ie, seanpaul@chromium.org,
 jsanka@codeaurora.org, jcrouse@codeaurora.org, chandanu@codeaurora.org
Subject: [PATCH] drm/msm/dpu: Remove duplicate header
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:date:from:to:cc:subject:mime-version:content-disposition
 :user-agent;
 bh=lyCo4RhtPFnk5/aO02qephrgTtbsGXyGZCb4n0cJnyw=;
 b=rC/4goGz+dlS8ODMHvQ0+YTx8qA0gG2SUfvLdyOUSeyYt+5CrLa3HOF9uZRs9AmFj/
 JK8uvTZvnPUMuYG/4AQT+0ysU8q1Q/xh27z/gof/bP2598F0TPBcctKIfMm7ES8nDttU
 tlZEJhiIP4+d0RsrWCPzBjVrxnXZ+yiNeA0VdbBMnzGHGsVFClIhIrN7LzrmqvqXv5wA
 mE44F27yJcCf3IeSVBOh8YkngCVLsy//JXGwU7Tb/JUJZda7vvxw2ppB/5L1mTXich7+
 keJcx7hqHVRTzu2ovsv98FmzxDCARMMrG/V4yXt26xTqJCO5RPxhJn9qUS59q1CnubD6
 IPpg==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 jrdr.linux@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGRwdV9rbXMuaCB3aGljaCBpcyBpbmNsdWRlZCBtb3JlIHRoYW4gb25jZQoKU2lnbmVk
LW9mZi1ieTogU2FieWFzYWNoaSBHdXB0YSA8c2FieWFzYWNoaS5saW51eEBnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMgfCAxIC0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfaHdfbG0uYwppbmRleCBkYmU0OGUwMC4uZDY5MmRlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMKQEAgLTE2LDcgKzE2LDYgQEAKICNpbmNsdWRlICJkcHVf
aHdfbG0uaCIKICNpbmNsdWRlICJkcHVfaHdfbWRzcy5oIgogI2luY2x1ZGUgImRwdV9kYmcuaCIK
LSNpbmNsdWRlICJkcHVfa21zLmgiCiAKICNkZWZpbmUgTE1fT1BfTU9ERSAgICAgICAgICAgICAg
ICAgICAgICAgIDB4MDAKICNkZWZpbmUgTE1fT1VUX1NJWkUgICAgICAgICAgICAgICAgICAgICAg
IDB4MDQKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
