Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3696A59DA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 14:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2999110E6A5;
	Tue, 28 Feb 2023 13:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020710E6A5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 13:15:34 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CB7A6602FD8;
 Tue, 28 Feb 2023 13:15:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677590133;
 bh=OAOTdgG3rPw/CSoYUWxkatssMmb/9HbfVprr2UGFI7o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e0H7Gy2PC4dlFFcz4dqTQKLCa490oqL6+ekGIdkMnUSapeByQBAo9dTg04+mlnyl0
 yV2nLddf4GExSImBnhXRm5AXe8xW/W6sejLCibw0e0QCFc6MhSd4acZXv/6mGa3G8V
 3eSXX9dLKhydbsZCamBg4zVTo9LGZcpeWngazbsb4jUSgmFFg4oKwI+DnLcyxIEous
 /LEqOEjxiPJN75EwzTDlHQw4XJNSWJApvF3ukzs3GR1rt/MdL4us4WQnjoT9RcdpRp
 GEVE1HomoyY0KVhix7/NG2MwD5ziv61aZApDchuVE3EASEWimHsyY18BYL2LiNTj56
 MRo03uVbLxVpA==
Message-ID: <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
Date: Tue, 28 Feb 2023 16:15:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/shmem-helper: Fix compile error
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
References: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Asahi Lina <lina@asahilina.net>,
 Javier Martinez Canillas <javierm@redhat.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/28/23 15:50, Andi Shyti wrote:
> Commit 67b7836d4458 ("drm/shmem-helper: Switch to reservation
> lock") removes the drm_gem_shmem_get_pages_locked() and
> drm_gem_shmem_put_pages_locked().
> 
> But then commit ddddedaa0db9 ("drm/shmem-helper: Fix locking for
> drm_gem_shmem_get_pages_sgt()") reintroduces it.
> 
> Somehow these two commits got mixed up and produce the following
> compile error:

The 67b7836d4458 goes after ddddedaa0db9 in misc-next. It was a bad
merge conflict resolution in drm-tip that was fixed yesterday, there is
no problem in misc-next. Where do you see this error?

-- 
Best regards,
Dmitry

