Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E7B306FEA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FF789AEA;
	Thu, 28 Jan 2021 07:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4276989AC9;
 Thu, 28 Jan 2021 07:46:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id by1so6377932ejc.0;
 Wed, 27 Jan 2021 23:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8tSL2FYgwWm7DHwugGO6AU//MFSqkIm8mTMSRNrEHEs=;
 b=Hs7BNXmJS2kjye53djBiSStVFg3QHr/7cpPuW4m9nB8TDV9h5EUzP7dXPfztayM1BE
 NJtXKNhkvWSJ5i9Vg52dtbEjVlB2tPnJnxtXEWsWLk+cdMj4KZyaBQwse4ZIQXQzUugp
 Dq5yQn4faHuXeowngz1IxAkbr2V61HGHpaUapCo0z/bHQFdGB1+sGf0DVsDLNVVoAHy8
 SZJUlwTHDHwEc8ojsZjLr//m3tAr38T6A89jYS6gmZ20ZZDCFbr9U9pkKN5W1gjGiq5h
 326ee6pkdmmRlwIg6rgXJzL7g+Z04vqvuMe7UN2r3UOJOxohMK3I/PMXYOn9FXNP2p54
 DK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8tSL2FYgwWm7DHwugGO6AU//MFSqkIm8mTMSRNrEHEs=;
 b=osRMTCYKV25Ap/PuiutUea7ABYSpi+85MYg0Ba2lZFthv6IH9L4w15cV1ajJmDqK2X
 GnkoIBXNo3LtknqwiRuBTFruE8xUhlV6dPnMXZII+SHqw1Ah9EzDs9HVjj52K3xsrbHd
 2S4j3xHv+HXqs95hX0cyfXrq9LGwy2HpDvYOYgG7BY5OxpX/IcZ+/XMCl4S+3fsQb7Mm
 23lUNd0J0aZmkiCpAEzbvKgaqnahoXo97GSnPIWI9Yy+oht0TxbKPsqceMphvMw3PH4h
 EKJHY+BXbptQ8/q1hkk3kGzZ57nnHCN08mowpIAzp+K1L3GfwRbWytC1LzBNlbx6fK77
 sryQ==
X-Gm-Message-State: AOAM531l3lLhkicphG5OijiRuVdLxW4n7lQd/qj2Mspvdpmk/rG4JfwC
 YNS78LQjTKSEggWR3fd1MMc=
X-Google-Smtp-Source: ABdhPJzUoXAnbv3b5ePB038SGaN7G+ltuMcDcD4g8al7hwZIKeNg+VGovEihZVaCXGwBHLWJl4qRiQ==
X-Received: by 2002:a17:906:4e47:: with SMTP id
 g7mr8676113ejw.480.1611820014873; 
 Wed, 27 Jan 2021 23:46:54 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x25sm2540321edv.65.2021.01.27.23.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 23:46:54 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] add ttm trace event support
To: Kevin Wang <kevin1.wang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20210128071322.24313-1-kevin1.wang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1da5dde0-689a-83c9-d49f-5b5eb0bbc8e5@gmail.com>
Date: Thu, 28 Jan 2021 08:46:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128071322.24313-1-kevin1.wang@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: ray.huang@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not a bad start, but that needs quite some more work.

First of all please rebase on top of current drm-misc-next, a whole 
bunch of the stuff you want to trace here was already removed or is 
about to be removed.

Then concentrate on the necessary trace points, for example 
ttm:ttm_bo_device_init/release are overkill.

On the other hand I'm missing important events like pool shrink, tt 
swapout/swapin (ttm_bo_swapout can be dropped) and especially BO init.

I would separate the patches into one for each trace point. Not a must 
have, but it could make it easier to review and we can discuss for each 
one separately.

Thanks,
Christian.

Am 28.01.21 um 08:13 schrieb Kevin Wang:
> the kernel ftrace can better help analyze the kernel running status.
> add some trace events to support TTM.
>
> add trace events list:
>
> ttm:ttm_bo_add_mem_to_lru
> ttm:ttm_bo_del_from_lru
> ttm:ttm_bo_move_mem
> ttm:ttm_bo_wait
> ttm:ttm_bo_evict
> ttm:ttm_bo_swapout
> ttm:ttm_bo_device_init
> ttm:ttm_bo_device_release
> ttm:ttm_bo_init_reserved
> ttm:ttm_bo_validate
> ttm:ttm_bo_release
> ttm:ttm_bo_mmap
> ttm:ttm_bo_vm_fault
> ttm:ttm_bo_vm_access
> ttm:ttm_shrink
> ttm:ttm_mem_global_reserve
> ttm:ttm_mem_global_free
>
> Kevin Wang (3):
>    drm/ttm: add ttm bo trace event support
>    drm/ttm: add ttm vm bo trace event support
>    drm/ttm: add ttm mem trace event support
>
>   drivers/gpu/drm/ttm/ttm_bo.c     |  23 ++
>   drivers/gpu/drm/ttm/ttm_bo_vm.c  |  12 +-
>   drivers/gpu/drm/ttm/ttm_memory.c |   7 +
>   drivers/gpu/drm/ttm/ttm_module.c |   3 +
>   drivers/gpu/drm/ttm/ttm_trace.h  | 469 +++++++++++++++++++++++++++++++
>   5 files changed, 512 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_trace.h
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
