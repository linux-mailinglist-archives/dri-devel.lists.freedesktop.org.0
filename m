Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1FA700A7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC08910E0D2;
	Tue, 25 Mar 2025 13:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="P9iP3brw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1202710E0D2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742908515; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G0wLS12QrrrDHaHlYmP03ogt1xfZVfb9evDM6I16nSkSssTrxIuSuDnI4gjFsPUfTBxy+VnC/WP9Bne1ZnWQZR4F42j8sn5K0PdnpEs77uV4GOU0hvo8fasIBDjCIEv+AxcIEGRxU4NPHwOoq0jCrNYFg56IEoIul2aJSTJnCT8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742908515;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fDm1R/WiqJq/sHw4nivRAfTA+VsQ/zxcGtGcMmbNCvw=; 
 b=jt0z3EbVQFPTCg8o/JmE/nVvms0R3ZOI2oqquW451T3EdrV5xoi5Dczr0gbENDiUJPo9yDUw4TSQ8Q5oxZOl1L4MzhtREsDWOzFQ1eYPazUCYuupDzisoZ5hr6U+BJWwc7YEpu51W6jixHDhoRNjtLDDSdhNhaY93L3XnXQjP3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742908515; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fDm1R/WiqJq/sHw4nivRAfTA+VsQ/zxcGtGcMmbNCvw=;
 b=P9iP3brwesqgWTGBzkjhMfUA6XjB989NDe+Wj+QPxUfY3H2wKFGwHzY2oUufmgSr
 2CvZidmL5N+sN8wfLlZ1tXm6c8Gd60psUk7alhGck8wvSdI0Tbd5oTyfWfUcXQKYjL0
 CShNKfQbkIWa911TrFlo74Opb6QcHe9BSnrLMU8w=
Received: by mx.zohomail.com with SMTPS id 1742908513199129.5870997796227;
 Tue, 25 Mar 2025 06:15:13 -0700 (PDT)
Message-ID: <aa9df686-64ca-4679-acb7-7677de99f7cf@collabora.com>
Date: Tue, 25 Mar 2025 16:15:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/10] drm/gem: Change locked/unlocked postfix of
 drm_gem_v/unmap() function names
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-2-dmitry.osipenko@collabora.com>
 <e21e75a6-76a4-4202-bdff-bec73755229a@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <e21e75a6-76a4-4202-bdff-bec73755229a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 3/24/25 16:05, Christian König wrote:
> Am 22.03.25 um 22:25 schrieb Dmitry Osipenko:
>> Make drm/gem API function names consistent by having locked function
>> use the _locked postfix in the name, while the unlocked variants don't
>> use the _unlocked postfix. Rename drm_gem_v/unmap() function names to
>> make them consistent with the rest of the API functions.
> 
> I usually prefer keeping the function which people should use for new code without a postfix, but that isn't a must have.
> 
> Either way patch #1-#3 are Reviewed-by: Christian König <christian.koenig@amd.com>.

Thanks!

-- 
Best regards,
Dmitry
