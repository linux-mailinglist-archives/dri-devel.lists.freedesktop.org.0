Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6D386CC84
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B287610E481;
	Thu, 29 Feb 2024 15:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SbGaceTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB9410E10C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:23:27 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-512bd533be0so722708e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 01:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709198605; x=1709803405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N07RhVVTSDQOyo4eDr4hHwQOWKc0jlT5jQWzrwVgOx4=;
 b=SbGaceTDtn/F+KJWf4gI0V/KHEIK1CkdxdBBy17KUEhRhuEvWAHl5YQzDqdGYvWYqW
 AXHE7lpyZvAFR65LOVod7G5mgv2gq0oKaz+LACq+Dy/AL9vTbsD+NsdTWwJjcQYR8G1p
 ahDKtojRXReCoSB0A6DrZ+5ZXBOg6//P/DrE6ChslQ0Wc3QCL4eAr6M0EyxAcl+jHgFJ
 fVVt3etf4UX9a9GTvazQ6K3TPFAqKWkrLipbhbifyOCKfjroq1qlUkZVY923lZwUXSMb
 1tm+W/ixkEwM+IFfOmbFD+OjANdISQjOZlObPOQ7b8Blo3Mbh00rpy9TpZmHiOCfKvnl
 85yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709198605; x=1709803405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N07RhVVTSDQOyo4eDr4hHwQOWKc0jlT5jQWzrwVgOx4=;
 b=QAEf758u9UxUl+22sj1+mQxcZPXDau/KWlLDdKqaLwA0u1Dn5+ZNA6hBOs7lMFV6Z9
 wAKYEQmAeMQhnDE/Cu+OxmMoQDiJgSHs8suqDhLs8Bww4IZRiKfoeGAvdXiiqH7PcHMq
 eoYdsJVkL4Mj/SxvjqkNRnChMtvPiB0Zy14JQy5dbwISjLGMGdHawqMsd3iCtGmuZ2uc
 19DUkkNvDtDfvK3BUHoUBxfGJtFdOylHQE5NJV5PDQu3jRZNbfPJFFhII79SK0d/sbyc
 /s4xR1PF8502tH0BUTJQpNtMOnlH5NVXB7KTsMJDI0wgmAILnkWyZADECGt9AlI7Ov/V
 kHDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKZFDrLCRCP6IwTR4ZrxHRoWwZLMO7aaAH2bTBvS5MVGrt+CrI9E7hihgG8d2boHeNndK5o9w9F4oQc1etxjGBPy09/CBGqzixvuz5b7Rr
X-Gm-Message-State: AOJu0YxZfXfrkcHhK5PyDDH3Fi/IUgvRWnMsYZMfrXH03rRuyOQiGoe4
 Im3qG3WlXsdvkfSGjTchaBzZwX3hPjaTe1yWOiBzmgNXJ9mzSyZN
X-Google-Smtp-Source: AGHT+IH0NneLS2naHPyQSuK2V6PBB0Kthv4bW9sQwfbLO1EV2s0XyuAxODvSdoZ8N7aM5gfpHsgNCA==
X-Received: by 2002:a05:6512:2147:b0:513:2016:47d5 with SMTP id
 s7-20020a056512214700b00513201647d5mr927401lfr.56.1709198604426; 
 Thu, 29 Feb 2024 01:23:24 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi.
 [88.113.27.52]) by smtp.gmail.com with ESMTPSA id
 9-20020ac25f49000000b00513246fe458sm181985lfz.266.2024.02.29.01.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 01:23:24 -0800 (PST)
Message-ID: <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
Date: Thu, 29 Feb 2024 11:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <20240229-dancing-laughing-groundhog-d85161@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Feb 2024 15:12:01 +0000
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

Hi everyone,

On 2/29/24 11:02, Maxime Ripard wrote:
> On Wed, Feb 28, 2024 at 07:55:25PM -0300, Helen Koike wrote:
>> Which rating would you select?
> 
> 4.5 :)
> 
> One thing I'm wondering here is how we're going to cope with the
> different requirements each user / framework has.
> 
> Like, Linus probably want to have a different set of CI before merging a
> PR than (say) linux-next does, or stable, or before doing an actual
> release.
> 
> Similarly, DRM probably has a different set of requirements than
> drm-misc, drm-amd or nouveau.
> 
> I don't see how the current architecture could accomodate for that. I
> know that Gitlab allows to store issues template in a separate repo,
> maybe we could ask them to provide a feature where the actions would be
> separate from the main repo? That way, any gitlab project could provide
> its own set of tests, without conflicting with each others (and we could
> still share them if we wanted to)
> 
> I know some of use had good relationship with Gitlab, so maybe it would
> be worth asking?

GitLab already supports getting the CI YAML from other repos. You can change 
that in the repo settings.

However, I think a better approach would be *not* to add the .gitlab-ci.yaml 
file in the root of the source tree, but instead change the very same repo 
setting to point to a particular entry YAML, *inside* the repo (somewhere 
under "ci" directory) instead.

This way all the different subtrees can have completely different setup, but 
some could still use Helen's work and employ the "scenarios" she implemented.

Nick
