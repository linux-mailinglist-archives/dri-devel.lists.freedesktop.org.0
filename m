Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C619C3AEB78
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB77891A4;
	Mon, 21 Jun 2021 14:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCAF2891A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:34:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C83D0D6E;
 Mon, 21 Jun 2021 07:34:37 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D32133F694;
 Mon, 21 Jun 2021 07:34:36 -0700 (PDT)
Subject: Re: [PATCH v2 02/12] drm/panfrost: Get rid of the unused
 JS_STATUS_EVENT_ACTIVE definition
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <cc766827-fd7c-1127-9ece-f608024656d9@arm.com>
Date: Mon, 21 Jun 2021 15:34:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621133907.1683899-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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

On 21/06/2021 14:38, Boris Brezillon wrote:
> Exception types will be defined as an enum in panfrost_drm.h so userspace
> and use the same definitions if needed.

s/and/can/ ?

While it is (currently) unused in the kernel, this is a hardware value
so I'm not sure why it's worth removing this and not the other
(currently) unused values here. This is the value returned from the
JS_STATUS register when the slot is actively processing a job.

Steve

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_regs.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index dc9df5457f1c..1940ff86e49a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -262,9 +262,6 @@
>  #define JS_COMMAND_SOFT_STOP_1		0x06	/* Execute SOFT_STOP if JOB_CHAIN_FLAG is 1 */
>  #define JS_COMMAND_HARD_STOP_1		0x07	/* Execute HARD_STOP if JOB_CHAIN_FLAG is 1 */
>  
> -#define JS_STATUS_EVENT_ACTIVE		0x08
> -
> -
>  /* MMU regs */
>  #define MMU_INT_RAWSTAT			0x2000
>  #define MMU_INT_CLEAR			0x2004
> 

