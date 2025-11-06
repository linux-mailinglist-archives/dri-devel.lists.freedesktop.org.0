Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF710C3A4CB
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D575A10E888;
	Thu,  6 Nov 2025 10:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CXrRldHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE5110E887;
 Thu,  6 Nov 2025 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bEuFMZU9bCseKJUmKXXTmopgNcHGhPkfj40VJHEZmu0=; b=CXrRldHz+7naP6aWLf/T8r9orn
 ZRfXCU913tKkLTtcN9CHWL73Sd9aq4SUDvfzVgTRSX4ghMbopitbHeXQk/EUZhFK5lQM6QtwdtB0r
 oAv7/0L5cOSTfTX5MzGzlLFXy9GvjyGSkCHhd8MzPOZ5K9Dr5T3mDt9GH4opTl6TaIIcmzAj5Vg89
 kIDACHwVrdprWydLpVbGRMxygsmkh6I8q5+nJSyeSaaaPI0740p/6W8M1WNMKIKwI0HzIkVDUur7s
 /aQ08UmQV8qpPTiNv/mT+dGE056NB/HmWXx3ZpqCQ0tDc1xgHuofWyQbn8/fbjnOwaBB1cEcy4FuZ
 +7UHOCuQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vGxMQ-002wIL-O4; Thu, 06 Nov 2025 11:36:58 +0100
Message-ID: <5180cfc6-1bb0-4447-a399-ec039003f229@igalia.com>
Date: Thu, 6 Nov 2025 10:36:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix @alloc_flags description
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251106005217.14026-1-bagasdotme@gmail.com>
 <f935574c-67d1-4a7c-bd8e-e9dff7aa97ea@igalia.com>
 <aQx5aAR3DjengjVt@archie.me>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aQx5aAR3DjengjVt@archie.me>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/11/2025 10:33, Bagas Sanjaya wrote:
> On Thu, Nov 06, 2025 at 08:28:15AM +0000, Tvrtko Ursulin wrote:
>> I assume no one merged it yet to any branch so I can push it to
>> drm-misc-next?
> 
> Of course!

Pushed, thanks again for fixing it!

Regards,

Tvrtko



