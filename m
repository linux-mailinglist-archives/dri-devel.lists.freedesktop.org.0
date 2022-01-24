Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99620499295
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 21:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C41110EA4C;
	Mon, 24 Jan 2022 20:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D78410EA37;
 Mon, 24 Jan 2022 20:22:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v123so23763796wme.2;
 Mon, 24 Jan 2022 12:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Ke9g6kY1kLIfyyex335F3KDC37XIQ1ezTOdv6ZYLv/k=;
 b=D80hcT4XcxMGtftOj/oiDZCuJHosbWOP9px3lg36MlSFohIalMEXsIsmWHUeYOBUVM
 SEnLNESjYym6MXBC4OgLnvX3F3afiJMfQn9g7zvmuDDClKoY74ZfeMgQ5KJolU/MiNd7
 F7ewGlbdOGeNAWRJ8WA6uOejSJ3zoxj0T0kEiw6TNpp74QiWLyMsCYYb/cup3DkSHBdG
 nAHisJX8oZAYE4rqRS45RSzV8GGsbClXEaO0jw7YvcaXeAvPSCVWhcWi81OQhBljz3Mb
 FnBBctXMK27UU+EZ9nYFWS8Nl5s1ScmigcH3alPAZBcuaytebOuuunep3czM6jzKMLa8
 E9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ke9g6kY1kLIfyyex335F3KDC37XIQ1ezTOdv6ZYLv/k=;
 b=PQMF86uF3Un3J1LTabDW9XgWOUDDIc1bg+ln7N68PYF3hAqu9kOOy1hx0rMbwrc8Xv
 ts1quLe+gVA8DHh1pl8VuP5G2AoxIvXeqWyn9bvXTaK7jM5MLRrOYv6U5LnUz6QCYCYd
 JWknTmhxh5TmLagpHD+g/DyLYQkqVNRYQcb6Xou8Z3W1yIM2T2aVPTmYTB1DU/3zwvGr
 +vU2ooXm3JG1+vPLG6ymClcQvhzGMjsCV44ugsVP3iXy+gl1+YZFctqdf3ANHtcpZuRz
 fybpmGGX5ThX0dzk3kmT8M402ggenUo26FnA37QntDCwJ14rbOokNC650Lj9ci7QDngz
 X5NA==
X-Gm-Message-State: AOAM5302LP/xpKNrca6O2xw5WOLMiUzpvUCjBZ719vHEpw/DwO/5KLAT
 S6O00oBe9fwReARMvaKEEFRNRE+X8Ew=
X-Google-Smtp-Source: ABdhPJyO2wiaxPV+BJ/+R4PvbC7zfnD9KOapfcHGORzhc/1QStS+iy1PdwoosEFvI+8zJy4QN3OwVA==
X-Received: by 2002:a05:600c:22da:: with SMTP id
 26mr3228599wmg.121.1643055733649; 
 Mon, 24 Jan 2022 12:22:13 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:139c:f8a8:1313:ffa0?
 ([2a02:908:1252:fb60:139c:f8a8:1313:ffa0])
 by smtp.gmail.com with ESMTPSA id m4sm325570wmc.1.2022.01.24.12.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 12:22:13 -0800 (PST)
Subject: Re: [Intel-gfx] [PATCH 06/11] dma-buf: warn about containers in
 dma_resv object
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-7-christian.koenig@amd.com>
 <cfdefdc5-bd4a-31e4-a0e2-fb02acf6d01f@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <319496ce-0551-5cd3-ef0c-4b503c4bc212@gmail.com>
Date: Mon, 24 Jan 2022 21:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cfdefdc5-bd4a-31e4-a0e2-fb02acf6d01f@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.22 um 17:36 schrieb Thomas Hellström (Intel):
>
> On 1/24/22 14:03, Christian König wrote:
>> Drivers should not add containers as shared fences to the dma_resv
>> object, instead each fence should be added individually.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> Is there any indication that this triggers on existing drivers?

There used to be a case in amdgpu which triggered this, but at least I'm 
not aware of any in the current code.

Christian.

>
> Thomas
>
>

