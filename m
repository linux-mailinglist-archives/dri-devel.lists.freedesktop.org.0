Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDBC1FC72F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C366EA90;
	Wed, 17 Jun 2020 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9F36E07F;
 Tue, 16 Jun 2020 11:04:38 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4FF21990F3B21C913701;
 Tue, 16 Jun 2020 19:04:33 +0800 (CST)
Received: from [10.166.212.221] (10.166.212.221) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 16 Jun
 2020 19:04:28 +0800
Subject: Re: [PATCH 1/2] drm/amdgpu/debugfs: fix memory leak when
 pm_runtime_get_sync failed
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20200616063039.260990-1-chentao107@huawei.com>
 <a8fb3d27-d0f5-d28a-d24b-63be866ef76f@amd.com>
From: "chentao (AS)" <chentao107@huawei.com>
Message-ID: <882dba73-8384-919d-671c-a300db4ef0cf@huawei.com>
Date: Tue, 16 Jun 2020 19:04:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <a8fb3d27-d0f5-d28a-d24b-63be866ef76f@amd.com>
Content-Language: en-US
X-Originating-IP: [10.166.212.221]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: tom.stdenis@amd.com, Jack.Xiao@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, yttao@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T2ssIGkgd2lsbCBtb2RpZnkgaXQgaW4gdjIgcGF0Y2guCgpPbiAyMDIwLzYvMTYgMTQ6NTAsIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gUHJvYmFibHkgYmV0dGVyIHRvIHJlbW92ZSB0aGUgZHVw
bGljYXRpb24gb2YgcmVzdWx0IGFuZCByIGhlcmUgYW5kIAo+IHRoZW4gdXNlICJnb3RvIGVyciIu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
