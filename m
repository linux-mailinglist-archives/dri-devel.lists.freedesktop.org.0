Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7F637AFA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 15:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51A710E0B1;
	Thu, 24 Nov 2022 14:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFD110E0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 14:02:36 +0000 (UTC)
Received: from [192.168.231.135] (unknown [213.194.153.7])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: rcn)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F01DA6602B2B;
 Thu, 24 Nov 2022 14:02:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669298555;
 bh=jYWBVPfoJa/8wmjQK1buZr4pR+CcoqUbbwsVWP00PxI=;
 h=Date:To:Cc:From:Subject:From;
 b=iS1wEfTG8Ik2tqZV2eG97YsBx4zk9f42G8iI8zKFC7FP1mnO0M5TDByZybmufbyA0
 s9zZKDzwCaMd5VwI9al1IkY97ExWMlVgtKVXHfws5nCnzUJ4zAx12xeRgZLNzhjzIm
 T6LhtKe2vnOoyxi87B9OHeiK9Cbd0kMNvhe/VNhJ04SSCTSV+MMTYaNVwPLLGHoYvS
 aylm+muKOLdNv4oQa7eLUyaaAr0aZ8xAo35Wn19jdAzl4V+3czjYvA1zhBzr6LNW7o
 GenwcSzUQECqDg5ZAkWSCjCVY76od5RNwnnf2fJKqNkKWH40N42jyIguoKzLRgQdXL
 tbbd+t2POVXcQ==
Message-ID: <b306388d-080e-3599-c43d-4299888bef1f@collabora.com>
Date: Thu, 24 Nov 2022 15:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: hjc@rock-chips.com
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
Subject: igt-kms-rockchip regressions since v6.0-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandy,

Going though the KernelCI results I noticed that the v6.0-rc1
kernel introduced a number of regressions in the igt-kms-rockchip
tests:
https://groups.io/g/kernelci-results/message/34239?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Cigt-kms-rockchip%2C20%2C1%2C80%2C95118839

I don't know if anyone is taking a look at this, so I figured out
you could be interested.

Thanks,
Ricardo
