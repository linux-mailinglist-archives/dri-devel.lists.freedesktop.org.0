Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC142230675
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B130E6E0F2;
	Tue, 28 Jul 2020 09:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574A76E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:22:43 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id a1so14222633edt.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pj/6iNI9BXh2IpkwxFyVZ9ViZpts8hjLJiwkYWzPkKk=;
 b=sTr89E5aW3uieuKH4ExWmwkmoQriKUcErP7SiOZdrPs7LXuICsDuGvp40fwGhd+tgz
 cj2xAjGI2/VfgXwmSpfVrQz+oJoSfKbbzqmNgg7ZoCK3zkJcgD3tFSuiZKq6wqWgq+2G
 yfINS3n7gtcdh77iKxNr4OoMH2xCqKZ3F6v+2lN0X1jea1SzHMxQFs6kItNhSsc4jT3+
 1HNgHWVm37oFZaBiSnSrTd1v7n4UXXamMZBKS5EYca+rvH6wkuBrRLMcBgpdxptHFGei
 BcUi9rqSHij2MaGCsAYBOU2MvPkTufePuHwo8l2M0Z61q66rnegmDmfnP3Lep92Id2Uf
 G21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pj/6iNI9BXh2IpkwxFyVZ9ViZpts8hjLJiwkYWzPkKk=;
 b=sqBt/9WZqdQ8LWv3L5sEuRSyQN9WKoCiyWQQ9ECSe60BJNdnro5dWjNEeM38mUTCCP
 hkZohXPyMldCxLBmtQnIphZU23e2C1oJxR7kT8E6kqF5HmUV0qvwWhTuEgm5LRU+07rs
 emkpd1qvTrVZeyYoB0kLjHv+wTQ9HhpMMHQsM7UuWjpFNz9BNBb1wEQXq3x8wkVY66a5
 3unczZbEU9womuDWZd7PWeyHvYBg8HSIzJ2IvEnlnhizJT8GoMVeBlEfZeVL4Vuzq9pt
 mBfb74LIW4SkMc1ZMFFUjJIDcniaxVM3iItNpM3SgmfJnwDUqOGrf8g/Gvtp5Vu2xYIq
 jTDQ==
X-Gm-Message-State: AOAM530CBLZgO6itwIKkxLkc77cBQC+QsDP4c5ATLP8gbXkaD9VDJA5t
 9Ff4+synzZS/xy0825gSi78/mViw
X-Google-Smtp-Source: ABdhPJxrW0t5cEmz1cX9gWlR4YC3RtOmh0hqTSbsYw7/sXVkT8D5AtCdOvo5AtBYvcWPnf5bQxqn4w==
X-Received: by 2002:a05:6402:3193:: with SMTP id
 di19mr9311162edb.98.1595928161498; 
 Tue, 28 Jul 2020 02:22:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id dj22sm9301123edb.54.2020.07.28.02.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 02:22:41 -0700 (PDT)
Subject: Re: ttm_tt_set_placement_caching on vram->ram transfers
To: Dave Airlie <airlied@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <CAPM=9tx8V2TWSTwKCik1iUvnQExZoBtGYdQZ_4MdKjdHmQJE5A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a23fddfa-ca4a-e818-5454-31714db397d4@gmail.com>
Date: Tue, 28 Jul 2020 11:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tx8V2TWSTwKCik1iUvnQExZoBtGYdQZ_4MdKjdHmQJE5A@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.07.20 um 05:23 schrieb Dave Airlie:
> Hi Christian + Ben,
>
> Just been reviewing around driver TTM code, and found an inconsistency,
>
> amdgpu + radeon both call the above before binding the ttm and going
> gpu vram->ram copies, but I don't see nouveau doing it Not sure if it
> could cause any issues, but it does look inconsistent.

What amdgpu and radeon do here sounds superfluous to me. The tt 
structure should have been allocated with the right caching attributes 
in the first place.

BTW: Changing the caching attributes of pages on the fly is utterly 
nonsense to begin with. This only works 100% correctly on x86, and there 
only by coincident :)

Christian.

>
> Dave.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
