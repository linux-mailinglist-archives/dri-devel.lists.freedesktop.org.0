Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F225070AB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3510EF24;
	Tue, 19 Apr 2022 14:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B3010EF22
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:36:01 +0000 (UTC)
Date: Tue, 19 Apr 2022 22:35:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1650378957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QawvvwMKEl52ui8qtXQSbeAZjXUbrb0qfB23spQfQ5o=;
 b=V2i84UtxHjyIILi/gKDecMrXxZHmNluIocH16r4VPQD6u4LEOHLM+hQg3Pt5MaSbts9s1F
 pIy1R8GpScNNC3spVtoSLh6JAQcD3kjT7l23TKEbJhDrTtWtr9vSsO1w/8ujxPTvCe0HN4
 KmQ5TaCHq+fTgMKN7hS57OFf0e/ApZk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Message-ID: <20220419143529.GA44323@chq-T47>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19 4月 22 16:07:44, Christian König wrote:
> Am 19.04.22 um 15:59 schrieb Cai Huoqing:
> > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > which is integrated into NVIDIA Jetson AGX Xavier,
> > so add driver support for this accelerator.
> > 
> > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> > 
> 
> Well doesn't looks so bad on first glance (regarding coding style etc..)
> 
> But am I blind or isn't there any UAPI for the driver? I mean adding a DRM
> driver without any change to include/uapi/drm is really odd.
thanks for your reply, I will rename nvdla_ioctl.h which is UAPI headfile,
then put it to include/uapi/drm.

thanks,
Cai
> 
> Regards,
> Christian.
