Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B0E8A760E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 23:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4918C10EA46;
	Tue, 16 Apr 2024 21:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="U9Du23KI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B976B10EA46
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=se6IGHwx0p4O/ZB4wATxGcyPkfueklSfX1M0qValIYk=; b=U9Du23KIIYJ3IKEodyXouSHzf7
 Yn9Sve0BAcMrXCYeRPpS2ewB22yXmx+DkzF4EKmzHJOBJaaUsD9XOxJ+mgDL4Fetbz6zmC8gmf553
 POYISz1k33KtncZwVD1AbUY4lfHCdwcMhSkeQCA7T9s0f/zC/7Oi4xRqcKbpR7+kISXUvadEVlxns
 xKM3Z8IgXkeBMA5dPTnhgEjUSi13HEq5P6Dr9C8Txh1zrZexdLp5Bl48w2TtH14tha4Zqn/g0yK6x
 xI5YpjshK6XjLadQ/Gb+iUN9cS2Em0EVHrPx9OLopA+6O7mqjBXP5QKH67fcbtlEgaDvmJYD/rF8T
 WxHNiIQQ==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rwpwx-0000000Dnb5-0tVk; Tue, 16 Apr 2024 21:02:43 +0000
Message-ID: <af0429dc-50eb-4800-87fd-4a63e72b0fc1@infradead.org>
Date: Tue, 16 Apr 2024 14:02:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix no_vblank field references in documentation
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240416-drm-no_vblank-kdoc-link-v1-1-a1d8d1e9ff34@somainline.org>
 <4c882a69-8609-4b39-a95d-3128027373e1@infradead.org>
 <diiw2ptq4hsqby2zacdejeqyhksc4225atvmos2j74rklnw4v3@tdr5d5c24tpf>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <diiw2ptq4hsqby2zacdejeqyhksc4225atvmos2j74rklnw4v3@tdr5d5c24tpf>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/16/24 2:00 PM, Marijn Suijten wrote:
> Hi Randy,
> 
> [..]
> 
>> Do you see differences in the generated html for these changes?
> 
> I have not yet generated the HTML locally to test this patch, but will surely do
> if that's a requirement.
> 
>> "&struct somestruct" and "&somestruct" should both be OK AFAIK, although
>> Documentation/doc-guide/kernel-doc.rst seems to say that using
>> "&struct somestruct" is preferred.
> 
> Keep in mind that this patch is about field/member references.  Quoting the
> relevant paragraph under "Highlights and cross-references":
> 
>   ``&struct_name->member`` or ``&struct_name.member``
>     Structure or union member reference. The cross-reference will be to the struct
>     or union definition, not the member directly.
> 
> This lacks the struct tag entirely, and observation shows that links with them
> don't highlight correctly (hence this patch) while member links without struct
> tag are clickable and have an anchor link to their parent struct.

Alrigthy. Thank you.

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
