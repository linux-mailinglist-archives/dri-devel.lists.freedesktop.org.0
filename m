Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6C8AFB8A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 00:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3096C113725;
	Tue, 23 Apr 2024 22:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="S4lN0I9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55155113725
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=NVAE3VkVW52HSp5ksoolLJSGGPVtWtq4378RJsuZxN0=; b=S4lN0I9a9sWyWRrmv6lkD9P7Um
 AEpFHStviaHtLhBilEWnS/n/ltLpwT9xioe4USjt0zk70ADhJGmJo375udB0Sw7haXkEwEVXKn1Zo
 Mbl2zVc/MYaonvIParwRkmgNsJykNJQoihtja/Qw2sFs4jrYqNT/TQ20kKD+wERE8YX244Ya2+J2W
 lpRn0mB59JyXu94xo3A6DNYtIq5NPnhxppVrGybwxnVxP/ZREjNoKzlHW0iodJsRzhIz4bvXFnSQH
 UMv9uS8HHmYXQP7lYVd5GEal8afOBl9G6nDiOqB98alQ7AYz089IvD2pnuzU53KXHwLNVi6R+UbFW
 begZkY+g==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rzODO-00000001dJI-0e4S; Tue, 23 Apr 2024 22:02:14 +0000
Message-ID: <34a2b16c-58c5-4880-9b2f-fd5627085583@infradead.org>
Date: Tue, 23 Apr 2024 15:02:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix no_vblank field references in documentation
From: Randy Dunlap <rdunlap@infradead.org>
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
 <af0429dc-50eb-4800-87fd-4a63e72b0fc1@infradead.org>
Content-Language: en-US
In-Reply-To: <af0429dc-50eb-4800-87fd-4a63e72b0fc1@infradead.org>
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



On 4/16/24 2:02 PM, Randy Dunlap wrote:
> 
> 
> On 4/16/24 2:00 PM, Marijn Suijten wrote:
>> Hi Randy,
>>
>> [..]
>>
>>> Do you see differences in the generated html for these changes?
>>
>> I have not yet generated the HTML locally to test this patch, but will surely do
>> if that's a requirement.
>>
>>> "&struct somestruct" and "&somestruct" should both be OK AFAIK, although
>>> Documentation/doc-guide/kernel-doc.rst seems to say that using
>>> "&struct somestruct" is preferred.
>>
>> Keep in mind that this patch is about field/member references.  Quoting the
>> relevant paragraph under "Highlights and cross-references":
>>
>>   ``&struct_name->member`` or ``&struct_name.member``
>>     Structure or union member reference. The cross-reference will be to the struct
>>     or union definition, not the member directly.
>>
>> This lacks the struct tag entirely, and observation shows that links with them
>> don't highlight correctly (hence this patch) while member links without struct
>> tag are clickable and have an anchor link to their parent struct.
> 
> Alrigthy. Thank you.
> 

That means:
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
