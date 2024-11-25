Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691079D9348
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAB810E7E4;
	Tue, 26 Nov 2024 08:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8990810E282
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:22:30 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XxlCR4Ctgz10WWS;
 Mon, 25 Nov 2024 20:20:19 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id E18401401F0;
 Mon, 25 Nov 2024 20:22:26 +0800 (CST)
Received: from [10.67.111.53] (10.67.111.53) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 25 Nov
 2024 20:22:26 +0800
Message-ID: <a8ccbb56-d72c-4752-8ff7-d9166fccb0d0@huawei.com>
Date: Mon, 25 Nov 2024 20:22:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <zhangkunbo@huawei.com>
CC: <airlied@gmail.com>, <chris.zjh@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <liaochang1@huawei.com>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <simona@ffwll.ch>,
 <tzimmermann@suse.de>
References: <20241106024548.1915611-1-zhangkunbo@huawei.com>
Subject: Re: [PATCH] drm/meson: Avoid use-after-free issues with crtc
From: zhangkunbo <zhangkunbo@huawei.com>
In-Reply-To: <20241106024548.1915611-1-zhangkunbo@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.53]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gently ping.

