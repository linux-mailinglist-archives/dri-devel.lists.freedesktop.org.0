Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB85B01E5E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA9210E03E;
	Fri, 11 Jul 2025 13:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fsIEixqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3706F10E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NKqIfuyJtyGfR0SZJka2+dpyfUI6TQBVPgy996gWC+c=; b=fsIEixqa0w/XhKgEDC/043kktZ
 Rsir7dCoHDJRddE2cen9wi1FWgKWOs7rFRlKrUQJFG+9//6yvvpPw2z8spwsSRnXtNhzFyaqgnzql
 TU4LqW0GKCOmO9E49qHr1yeFhxPWW05b6wldcXs8Xn42rC566RrGo1evIF7QQz9waXHQWRls3Bk8Z
 xVsB+sEj9g3L5hvGp+lKHLun4MAYGNV07t6sVoOhLYy63QFMMUQUUDd7Mz97Aw8KQG6QKVgAv9Cbo
 g6PzhJkuoL4ZfssgUNMWA0Mh0eTNnxitGLiCGNROVSz2iOxFvnTVm7V1rw0u4SlvH7e3yJuniRygW
 /pu93vpA==;
Received: from [179.118.186.174] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uaEAk-00FOet-V4; Fri, 11 Jul 2025 15:52:19 +0200
Message-ID: <018a61b2-a5d9-422e-b0a6-890d584d83dd@igalia.com>
Date: Fri, 11 Jul 2025 10:52:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task information"
To: Raag Jadav <raag.jadav@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>
 <aHA33ispT8V6GUhn@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aHA33ispT8V6GUhn@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Em 10/07/2025 18:59, Raag Jadav escreveu:
> On Thu, Jul 10, 2025 at 06:27:45PM -0300, André Almeida wrote:
>> Em 04/07/2025 16:07, André Almeida escreveu:
>>> Fix the following warning:
>>>
>>> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
>>>
>>> Task information
>>> --------------- [docutils]
>>>
>>
>> This series is now merged at drm-misc-next, thanks!
> 
> Shouldn't this be drm-misc-fixes?
> 

The commits that those patches fixes can't be found on drm-misc-fixes as 
it's now, so I thought I should merge it at drm-misc-next.

> Also, this series continues to not land in my inbox. This is why I use raw
> emails in my sendmail automation.
> 
> Raag

