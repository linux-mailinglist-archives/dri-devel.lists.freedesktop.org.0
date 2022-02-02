Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8834A6D71
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1B710E6F4;
	Wed,  2 Feb 2022 09:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F51710E6F4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:03:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 35AFD8388D;
 Wed,  2 Feb 2022 10:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643792597;
 bh=YVvUP4D6tMmAR/VpZZAnjSkSR9ik/uBSO73qg4tC6uM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aduSZ9B6YxdJry1GFBXDBbQqvPOy/uPFmSDpr1Cwqmb4GFlpAtNUgN19XOQRZW5yA
 tw4/nVIttE+dFGXSUVomZNfh8zmXaL12aQPlFO3NFqVSTT0tYJ0p7WwB19wKqF7gYR
 HBQZIWSXuSudZeQUxVils/dPxw/aaL39UDBN7KVkgpXHCrqmW4sIYjyVu/sZEWEA9N
 C/pcQtnNRzzokaps5cyhJFyyZADMsj1CQtlxgNsgq4UOCRQ9OUTfPef9KGQR3BgPaf
 O1nAqhGetrYVCadPv1iAWaVrIYBmjElBf4twlIs4EEyxbzAFeNR3wrTwbbPR/SVFrc
 4FwZvbFfY6Gpg==
Message-ID: <82db25e4-bb64-d8fc-1d09-b93697c835d0@denx.de>
Date: Wed, 2 Feb 2022 10:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: (EXT) Re: [PATCH v2 2/2] drm: mxsfb: Fix NULL pointer dereference
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
 <20220202081755.145716-3-alexander.stein@ew.tq-group.com>
 <61ec1e37-d1a2-6561-493a-06bf37cd71d6@denx.de> <5678101.DvuYhMxLoT@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5678101.DvuYhMxLoT@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 10:00, Alexander Stein wrote:
> Am Mittwoch, 2. Februar 2022, 09:30:38 CET schrieb Marek Vasut:
>> On 2/2/22 09:17, Alexander Stein wrote:
>>> mxsfb should not never dereference the NULL pointer which
>>
>> ... not ever ... but that's really a nitpick.
> 
> Doh, I just copied it from my mail...
> You want me to send a v2.1? Or will someone fix it when applying?

I think it can be fixed when applying, no worries.
