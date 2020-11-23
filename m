Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11532C040A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41C689100;
	Mon, 23 Nov 2020 11:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D86C894E7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d142so17513466wmd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6TxZrIbNMVP7o8ffQeQ+THJAoGZCcLMTEIXjKM9FgM=;
 b=QEiN8BF481vy1itk5mYNjHhp3ODhlFKpcihyTsun19jF9lCXKIV2KOMFVEhiFp9nf1
 qXrEGioY6tiSMg08hq7mG0Xx2MWEhwzooA3zubf41pDhYVtUDVBhWqtMCngxLMZ7iGNd
 7/D0B5vel1SGQ38TejgEeUMBrb55noT5ERpnHpIjeemmSZJBCax5XBUBd99gtFd/wrHA
 204okbOUXn24oqRQowzeU3NYjsXBaugokDNaQfuNsQFkhEhgb6P/Cs1eSjVqeD64r4/k
 wSmIWIhgiWGoOONiWrN3St1U7CfX23RzS0sr9bNZgDP3WCFnbiG9JZrTE2zXaivI0W4f
 RJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6TxZrIbNMVP7o8ffQeQ+THJAoGZCcLMTEIXjKM9FgM=;
 b=deJiKoDnOh6hlrzEG9pi/WErarDWnQEQmDTFVerONMZcLTNzM84EKXrLRBmYz8yFTW
 6416b9853/LAxWd0NqIkZQ8kXDM0oHe/7RFu6nARnz3NnPzkt9cmrNuluFGbXWBtqehD
 wKiAbkeLLDOhwIGlp7nvbRDQY0ZOJBRMUqMOzFlzNxSq8hpBdIhoFCuu9E0/qE1QEobb
 7Q8b9ArmQJ0A5EuzjOtAifEkj3CMjkULrk0rE2J9vTtjm5oDl8MqkRVPmWgQYUtkcNOC
 uwANRkOQH5uK30uCRRCoXzfEhUGgRyn69kvAC/5pCU+khAZ5ccUAspnlopIT/PQ4e5f0
 tE1A==
X-Gm-Message-State: AOAM532B7gqxLN9OMGZlVclcCznPlegSETFB6ojS4jkk2164BW9pSatd
 R3h+HbYCTscCksEvHwAvvBdAZQ==
X-Google-Smtp-Source: ABdhPJw5sV/lyQ2vBt5hnGdFgueJFj1mlY3MQP/jo4kh5m98ZS07N7plke4XzDo8WwclZZlteV+fvA==
X-Received: by 2002:a1c:2384:: with SMTP id
 j126mr23894310wmj.116.1606130371886; 
 Mon, 23 Nov 2020 03:19:31 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/amd/amdgpu/dce_v8_0: Supply description for 'async'
Date: Mon, 23 Nov 2020 11:18:46 +0000
Message-Id: <20201123111919.233376-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAuYzoxODU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2FzeW5jJyBub3QgZGVzY3JpYmVkIGluICdkY2VfdjhfMF9wYWdl
X2ZsaXAnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjhfMC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9k
Y2VfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAuYwppbmRleCA3
OTczMTgzZmEzMzVlLi4yMjRiMzAyMTQ0MjdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9kY2VfdjhfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Rj
ZV92OF8wLmMKQEAgLTE3Niw2ICsxNzYsNyBAQCBzdGF0aWMgdm9pZCBkY2VfdjhfMF9wYWdlZmxp
cF9pbnRlcnJ1cHRfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKICAqIEBhZGV2OiBh
bWRncHVfZGV2aWNlIHBvaW50ZXIKICAqIEBjcnRjX2lkOiBjcnRjIHRvIGNsZWFudXAgcGFnZWZs
aXAgb24KICAqIEBjcnRjX2Jhc2U6IG5ldyBhZGRyZXNzIG9mIHRoZSBjcnRjIChHUFUgTUMgYWRk
cmVzcykKKyAqIEBhc3luYzogYXN5bmNocm9ub3VzIGZsaXAKICAqCiAgKiBUcmlnZ2VycyB0aGUg
YWN0dWFsIHBhZ2VmbGlwIGJ5IHVwZGF0aW5nIHRoZSBwcmltYXJ5CiAgKiBzdXJmYWNlIGJhc2Ug
YWRkcmVzcy4KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
