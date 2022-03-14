Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99654D9003
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9F010E177;
	Mon, 14 Mar 2022 23:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A4310E177
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 23:05:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 373E91F41076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647299101;
 bh=ImDNs5MtGaf4nSstH8zkCM28WFaVLQuyemCzF6ZQYJo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=PlTxBut6TmpI+QxoNKeujpyLENjWdEye6aX+0N+6F2/DOWqvfg/tBGqHA5BBm8CI4
 X/PEtRzXZbpIxQNXOSP+0W9ebTMWRTU7FAozYDi8ZeHs8Pa3NHe1IO7b5XESYewp/3
 GoZvmtJx24jW14SESqm1+Qc+1KUVLhEtSav5/rG9qCfIWP/ESK2kgphI2niv0mRLUJ
 HjKo+pGO2RWRRyDFe5aGiYvn5ZaPBT9ucMsNDNUw7+Pu9wMG38u3xcjKqRnJ4Cqs6e
 AVsQv0/1Hzo0rUYayD7AR2j34doPgXwjvp0uZwPU3GY7LcDH0SBNkYOtsnhai7Hozz
 jqwDJ8iUNBe1Q==
Message-ID: <64959ce1-15f0-59f5-a6f8-4258019e5a4b@collabora.com>
Date: Tue, 15 Mar 2022 02:04:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Clark <robdclark@gmail.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
 <d2290971-ea22-8203-631e-b896c76a994b@collabora.com>
 <CAF6AEGuR8B6z+z=VFQ6y01wbboYS_qpkghD1GYdLES_RZOW1wA@mail.gmail.com>
 <42facae5-8f2c-9c1f-5144-4ebb99c798bd@collabora.com>
 <CAF6AEGtebAbWhkvrxzi4UBLdv2LJPQVPBzH-sXcACs7cxznQ8A@mail.gmail.com>
 <05e1fe61-1c29-152f-414b-cd6a44525af0@collabora.com>
 <CAF6AEGvf81epGOs7Zh4WK-7mkXRApO2p-h4g8dTuk4xtc1HOeg@mail.gmail.com>
 <285bf619-8c05-f2f4-3aeb-e013fba8754a@collabora.com>
In-Reply-To: <285bf619-8c05-f2f4-3aeb-e013fba8754a@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/10/22 01:43, Dmitry Osipenko wrote:
>> I think that, given virgl uses host storage, guest shrinker should be
>> still useful.. so I think continue with this series.
> Guest shrinker indeed will be useful for virgl today. I was already
> questioning why virgl needs both host and guest storages, maybe it will
> move to a host-only storage approach in the future.
> 
> I think the variant with the timer expiration actually could be
> interesting to try because it should allow host to purge its VM BOs by
> itself, preventing host OOMs.

While I was working on shrinker v2, I noticed that host-side allocation
may take a significant time. So I decided to defer implementation of my
idea of using timer-based expiration for host-only BOs. I'll need to
examine it more.

>> For host shrinker, I'll have to look more at when crosvm triggers
>> balloon inflation.  I could still go the MADV:WILLNEED_REPLACE
>> approach instead, which does have the advantage of host kernel not
>> relying on host userspace or vm having a chance to run in order to
>> release pages.  The downside (perhaps?) is it would be more specific
>> to virtgpu-native-context and less so to virgl or venus (but I guess
>> there doesn't currently exist a way for madvise to be useful for vk
>> drivers).
> I'll also take a look at what CrOS does, maybe it has some interesting
> ideas.

I looked at CrOS kernel and crosvm, and haven't noticed anything special
there in regards to purging GPU's memory of VM on host-side memory
pressure. If you'll find something, then please let me know.

I sent out v2 of the shrinker series, but missed to CC you on it by
accident, please find it here [1].

[1]
https://lore.kernel.org/dri-devel/20220314224253.236359-1-dmitry.osipenko@collabora.com/T/#t
