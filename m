Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627083EBB2D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 19:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA556E8A5;
	Fri, 13 Aug 2021 17:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155506E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 17:16:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i9so325677lfg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k0zJ3rZaNMERSNYqq6URhBvNhvYLmHCNYyswRaf+vtE=;
 b=XdLodVj8joNQK2AkFGxq5HaWGlGcBNVl+74ce9J2nIQ9ND09Uqrv4KHPFAmvIQUrbT
 KA3XUzM+xuR4J4bY3inZvasHe1Jmy1s3dYyyWvH2UuK75HauM/nNoxtcO6BXuTVV0OMI
 VcbsY02OoLfie+s/tZl6R8mjR9JLyoJPrpRW1VS0ZlS31QIlN0ADqaq5FMF7iWv4IKo6
 APgi+sd+oK3azIGwzEfJ2iq1nP38b2lb4EBS71zAZ5OlSprCAMKiYbskFKxYxaUeUmmc
 sgvUzdJQ3n3mcoSCdup4tAgCLg7PEgLkB0yao+KfD6Q1ugUl6CvwUk4dcZ29vrYaggjq
 f3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k0zJ3rZaNMERSNYqq6URhBvNhvYLmHCNYyswRaf+vtE=;
 b=G+L23eYmRlhR+zXlGM0HIvIFhyxSWXHHXfy/Ve1X39vR7aNlcUIuAQF/fQtHoTNqyS
 MRoWsFELAdEgivIDl10q55CAikGaMfKt9tSnwhpv1pJnTc5zBKgVqmdXLVYGbMpvRdJC
 1+7315twZ2Y2WDUl/uwpuSj/IPGDqHImZvxn4IcvpB8a+eVZYrpNf7mpMt0Ct+z2uvML
 Ijm+ums5VkNGM6TnBKiAYski1tBXzs/OKkl9zMaPh8D3afQoEGgPVqCEWvymuvPzq5bF
 ZjtOZ8tuy/PM9mfFzMijRpJMeZcAnok/LjVcCxonaQAXKBe2vHn6EuQgw3ja8oIVaKqa
 ngNQ==
X-Gm-Message-State: AOAM530iMoh6lkKgBol8rpvPu8SihKfYBdy8wovYxnnkGgcQ4TJdNXUA
 yM4/GFJRcy4bimgRkM0Df94=
X-Google-Smtp-Source: ABdhPJxBe/FM/ViWF4zdlx94Z2ckuYNmL2dP5iqD5rQNLHUOYfNegEjAtQ0tXm/RaPlvdBLtG2ufLA==
X-Received: by 2002:a05:6512:4019:: with SMTP id
 br25mr2467106lfb.494.1628874995428; 
 Fri, 13 Aug 2021 10:16:35 -0700 (PDT)
Received: from [192.168.2.145] (46-138-117-53.dynamic.spd-mgts.ru.
 [46.138.117.53])
 by smtp.googlemail.com with ESMTPSA id d7sm224131ljq.112.2021.08.13.10.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 10:16:35 -0700 (PDT)
Subject: Re: [tegra-drm:drm/tegra/for-next 16/17]
 drivers/gpu/drm/tegra/dc.c:1843:53: warning: variable 'new_dc_state' set but
 not used
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <treding@nvidia.com>
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <202108140028.U2Z9tWIN-lkp@intel.com>
 <6a4b2b81-cf37-5a0b-bb6a-4857d1a4ffc5@gmail.com>
Message-ID: <167372e5-1d16-9da4-941e-848209d9e828@gmail.com>
Date: Fri, 13 Aug 2021 20:16:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6a4b2b81-cf37-5a0b-bb6a-4857d1a4ffc5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

13.08.2021 20:12, Dmitry Osipenko пишет:
...
> I probably should update compiler or set W=1 to get that warning. These variables were used in older versions of the patch and they can be removed now.
> 
> Please amend the patch with this:

Perhaps too late already. I'll make patch for that and then also check
whether the UAPI patches were fixed.
