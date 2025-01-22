Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7AFA18A30
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 03:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0B10E178;
	Wed, 22 Jan 2025 02:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="DjV9xUi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14ECD10E178
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 02:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=5yBT85ljG1wrfV6S+5drF9x61f+zj54LsDIH5RHI2Yg=;
 b=DjV9xUi3F6BvtjRuZE3J9ks4LoIiE2H4D1xFGx9byXRRYU+P5Oc5C4cFywYPp7
 3d47k7x3bwimjr3CxwNHSIWpGmdEFnTlBQGrDVMTtp76B89+kQkoe/r2ggB5gIPu
 gNNQaE8TvGHdSGdCVrGx5w0iHwifoKJHBC3s8POakh1mI=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wAnej0CXJBn0GgDHw--.39692S2; 
 Wed, 22 Jan 2025 10:46:27 +0800 (CST)
Message-ID: <42a2e30f-ce1a-19ae-6886-f11a8a58eea3@163.com>
Date: Wed, 22 Jan 2025 10:46:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/aspeed: Use devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250121075041.201599-1-oushixiong1025@163.com>
 <b5rhfo6q6ko4vf2vubkcma4v7dnpxruh7peyqav6tszj4sg6ee@mzjc543jsujn>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <b5rhfo6q6ko4vf2vubkcma4v7dnpxruh7peyqav6tszj4sg6ee@mzjc543jsujn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnej0CXJBn0GgDHw--.39692S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjku4DUUUU
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQfbD2ePkETEKwABsc
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


在 2025/1/21 18:16, Dmitry Baryshkov 写道:
> On Tue, Jan 21, 2025 at 03:50:41PM +0800, oushixiong1025@163.com wrote:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
> Missing commit message
I will add commit message on v2, thanks.
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> This doesn't match your email address, so SoB is missing.

The SMAP service for my email <oushixiong@kylinos.cn>  is not working 
now, so I sent this patch from my alternate mailbox.

Shixiong Ou <oushixiong@kylinos.cn> and Shixiong Ou 
<oushixiong1025@163.com> are both my email addresses.

