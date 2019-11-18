Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CA3101AFD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B1D6EBF5;
	Tue, 19 Nov 2019 08:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4996E483
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 11:39:01 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EB4392065B50C814627D;
 Mon, 18 Nov 2019 19:38:59 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 19:38:49 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <treding@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
Subject: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Date: Mon, 18 Nov 2019 19:46:10 +0800
Message-ID: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

emhlbmdiaW4gKDIpOgogIGRybS90ZWdyYTogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNpbXBs
aWZ5IGNvZGUgaW4KICAgIHRlZ3JhX2JvX2R1bWJfY3JlYXRlCiAgZHJtL3RlZ3JhOiBVc2UgUFRS
X0VSUl9PUl9aRVJPKCkgdG8gc2ltcGxpZnkgY29kZSBpbiB0ZWdyYV9nZW1fY3JlYXRlCgogZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIHwgNSArLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2dlbS5jIHwgNSArLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
