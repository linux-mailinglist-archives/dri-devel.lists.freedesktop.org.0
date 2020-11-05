Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A82A8184
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0656EDA7;
	Thu,  5 Nov 2020 14:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9B6EDA2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so2081865wrp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ohyBbiMl4QAk0hhVQhX7OOzIoCPrYd9chXW0LdTWwg=;
 b=XBW8xFz25wrZDDaO9F9vfOL8x0OhOhpJq3zGD2BEffVr94ia5p8vCiGc1dDvydPk8G
 NDrGwM8qHJIWF+YyN3+pqM04QpTovwtHRwYaY+CB0lm71Gm7e96ItZi/WAkO9B1ijRbJ
 D3zSToxMNbprGNAI1QfIFaElECUMP9+zGdyTDLypSReTAwazDqv05F15HG1XUa+Dn15J
 cMuSKGY3lupgIXoi2hTrHUZpaqPt6dZAhP+Pq/Rx2olZZEtgk11RkFZCZLK2f05T1Vk0
 8wHSBFUOFm63LhPsJnl9L2OhDl4kuTp5kTmGF7uaGIC/XEBoHlD+C41OVq0tg4j7E+K+
 CcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ohyBbiMl4QAk0hhVQhX7OOzIoCPrYd9chXW0LdTWwg=;
 b=IIMribwV51xFXpnCXv5aBFqIFS1AIGj6x0oScNwQm3DoXqsmgoARLsxxmW22y+1PM+
 24LrmYFN27d66eXdMiryolnRLkZj3Xzlxcl1DdN7ZxjJXIpLzxG+Ks0DwzAFLIdigiLi
 O14CseKfoTIUxFlZ9Yxl88fN3adb2B8Bbs19z2/hqikwrc3Mgfj+LQuLDGKpPjJ2mz2T
 q1xbfNMXvwIIb91vCYpdGnygXVjX5XN2sOoHYmCXHNRSeFYLKFINBmaYzZcyOrRn8Mcs
 HQ0LfjxhknIxkbuBVzbfzDC4yQevOl2mC2a4yWzhlO2Nlhk2DUzT+ADjPRBIul8BoW1Q
 auUg==
X-Gm-Message-State: AOAM531Cm046PQi/NvQ0lmLGLh6BKOXSrg1/fMzvPbsRFj/WMeFjTQVP
 NYB17olCY+UXHWwOLJYkyfP0rQ==
X-Google-Smtp-Source: ABdhPJy1zJUpgVBLvXfGwyfP/DxiTdsE/xHFzIPHRB2Y83e58sQ2ACFhophmTpm4Om/fUXHn2r43dQ==
X-Received: by 2002:adf:fe46:: with SMTP id m6mr3113804wrs.254.1604587958250; 
 Thu, 05 Nov 2020 06:52:38 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/19] gpu: drm: bridge: analogix: analogix_dp_reg: Remove
 unused function 'analogix_dp_start_aux_transaction'
Date: Thu,  5 Nov 2020 14:45:17 +0000
Message-Id: <20201105144517.1826692-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jingoo Han <jg1.han@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jason Yan <yanaijie@huawei.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuYzo1Mjc6MTI6IHdhcm5p
bmc6IOKAmGFuYWxvZ2l4X2RwX3N0YXJ0X2F1eF90cmFuc2FjdGlvbuKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCgpDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBz
YW1zdW5nLmNvbT4KQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4K
Q2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4K
Q2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KQ2M6IEplcm5laiBTa3JhYmVjIDxq
ZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEphc29uIFlhbiA8eWFu
YWlqaWVAaHVhd2VpLmNvbT4KQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CkNj
OiBKaW5nb28gSGFuIDxqZzEuaGFuQHNhbXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIC4uLi9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuYyB8
IDQ0IC0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2Rw
X3JlZy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcu
YwppbmRleCA5Y2U0NWM3NTdmOGM4Li5jYWI2YzhiOTJlZmQ0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfcmVnLmMKQEAgLTUyNCw1MCArNTI0
LDYgQEAgdm9pZCBhbmFsb2dpeF9kcF9lbmFibGVfc3dfZnVuY3Rpb24oc3RydWN0IGFuYWxvZ2l4
X2RwX2RldmljZSAqZHApCiAJd3JpdGVsKHJlZywgZHAtPnJlZ19iYXNlICsgQU5BTE9HSVhfRFBf
RlVOQ19FTl8xKTsKIH0KIAotc3RhdGljIGludCBhbmFsb2dpeF9kcF9zdGFydF9hdXhfdHJhbnNh
Y3Rpb24oc3RydWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHApCi17Ci0JaW50IHJlZzsKLQlpbnQg
cmV0dmFsID0gMDsKLQlpbnQgdGltZW91dF9sb29wID0gMDsKLQotCS8qIEVuYWJsZSBBVVggQ0gg
b3BlcmF0aW9uICovCi0JcmVnID0gcmVhZGwoZHAtPnJlZ19iYXNlICsgQU5BTE9HSVhfRFBfQVVY
X0NIX0NUTF8yKTsKLQlyZWcgfD0gQVVYX0VOOwotCXdyaXRlbChyZWcsIGRwLT5yZWdfYmFzZSAr
IEFOQUxPR0lYX0RQX0FVWF9DSF9DVExfMik7Ci0KLQkvKiBJcyBBVVggQ0ggY29tbWFuZCByZXBs
eSByZWNlaXZlZD8gKi8KLQlyZWcgPSByZWFkbChkcC0+cmVnX2Jhc2UgKyBBTkFMT0dJWF9EUF9J
TlRfU1RBKTsKLQl3aGlsZSAoIShyZWcgJiBSUExZX1JFQ0VJVikpIHsKLQkJdGltZW91dF9sb29w
Kys7Ci0JCWlmIChEUF9USU1FT1VUX0xPT1BfQ09VTlQgPCB0aW1lb3V0X2xvb3ApIHsKLQkJCWRl
dl9lcnIoZHAtPmRldiwgIkFVWCBDSCBjb21tYW5kIHJlcGx5IGZhaWxlZCFcbiIpOwotCQkJcmV0
dXJuIC1FVElNRURPVVQ7Ci0JCX0KLQkJcmVnID0gcmVhZGwoZHAtPnJlZ19iYXNlICsgQU5BTE9H
SVhfRFBfSU5UX1NUQSk7Ci0JCXVzbGVlcF9yYW5nZSgxMCwgMTEpOwotCX0KLQotCS8qIENsZWFy
IGludGVycnVwdCBzb3VyY2UgZm9yIEFVWCBDSCBjb21tYW5kIHJlcGx5ICovCi0Jd3JpdGVsKFJQ
TFlfUkVDRUlWLCBkcC0+cmVnX2Jhc2UgKyBBTkFMT0dJWF9EUF9JTlRfU1RBKTsKLQotCS8qIENs
ZWFyIGludGVycnVwdCBzb3VyY2UgZm9yIEFVWCBDSCBhY2Nlc3MgZXJyb3IgKi8KLQlyZWcgPSBy
ZWFkbChkcC0+cmVnX2Jhc2UgKyBBTkFMT0dJWF9EUF9JTlRfU1RBKTsKLQlpZiAocmVnICYgQVVY
X0VSUikgewotCQl3cml0ZWwoQVVYX0VSUiwgZHAtPnJlZ19iYXNlICsgQU5BTE9HSVhfRFBfSU5U
X1NUQSk7Ci0JCXJldHVybiAtRVJFTU9URUlPOwotCX0KLQotCS8qIENoZWNrIEFVWCBDSCBlcnJv
ciBhY2Nlc3Mgc3RhdHVzICovCi0JcmVnID0gcmVhZGwoZHAtPnJlZ19iYXNlICsgQU5BTE9HSVhf
RFBfQVVYX0NIX1NUQSk7Ci0JaWYgKChyZWcgJiBBVVhfU1RBVFVTX01BU0spICE9IDApIHsKLQkJ
ZGV2X2VycihkcC0+ZGV2LCAiQVVYIENIIGVycm9yIGhhcHBlbnM6ICVkXG5cbiIsCi0JCQlyZWcg
JiBBVVhfU1RBVFVTX01BU0spOwotCQlyZXR1cm4gLUVSRU1PVEVJTzsKLQl9Ci0KLQlyZXR1cm4g
cmV0dmFsOwotfQotCiB2b2lkIGFuYWxvZ2l4X2RwX3NldF9saW5rX2JhbmR3aWR0aChzdHJ1Y3Qg
YW5hbG9naXhfZHBfZGV2aWNlICpkcCwgdTMyIGJ3dHlwZSkKIHsKIAl1MzIgcmVnOwotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
