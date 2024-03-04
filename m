Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A48870E9D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 22:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BF111261E;
	Mon,  4 Mar 2024 21:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aChUylf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32F911261D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 21:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709588743;
 bh=XV95ADWCt9SlcZ8u/EFGMeLeOk3IcW2jLKJtlEt3LvQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aChUylf9pqH0pRyxupBsIGBiyQfFvaj6tZQyP/+Oov+ZRgIXTK6RwvtLPZJeLwDhq
 Vm35JuhECN/Bp9GC/be7hxNZwGrq6HCROApsnWxBYuw87dVk0NRDBT6AMkri5Ub/yx
 0f+mwrxnJFeEQ66y3KlDiQpi57UIBa6WfuewCzyly9by+dWGgUqqZkhS6KWZHSqTv9
 EOmXy3qqVdE+HaJAZj389eCSgrYm5l2HNn169EEA//oOlFsInxE1JeRKn+zLmK4aCY
 zTVXd6wPDUjVsf5RQqckMK0KFXbd/yRhU+U6gsLUDS+c05v0TSJ0QfBvulj8dZc+Cn
 JB/Y/knJ89dLw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BB00C3780627;
 Mon,  4 Mar 2024 21:45:36 +0000 (UTC)
Message-ID: <17341b96-5050-4528-867a-9f628434e4e6@collabora.com>
Date: Mon, 4 Mar 2024 18:45:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
 <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
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

Hi Linus,

Thank you for your reply and valuable inputs.

On 01/03/2024 17:10, Linus Torvalds wrote:
> On Fri, 1 Mar 2024 at 02:27, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>>
>> I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
>> should be done. Still, we would like to help people, who are interested in
>> this kind of thing, to set it up. How about we reframe this contribution as a
>> sort of template, or a reference for people to start their setup with,
>> assuming that most maintainers would want to tweak it? We would also be glad
>> to stand by for questions and help, as people try to use it.
> 
> Ack. I think seeing it as a library for various gitlab CI models would
> be a lot more palatable. Particularly if you can then show that yes,
> it is also relevant to our currently existing drm case.

Having it as a library would certainly make my work as the DRM-CI 
maintainer easier and  also simplify the process whenever we consider 
integrating tests into other subsystems.

> 
> So I'm not objecting to having (for example) some kind of CI helper
> templates - I think a logical place would be in tools/ci/ which is
> kind of alongside our tools/testing subdirectory.

Works for me.

We  can skip having a default .gitlab-ci.yml in the root directory and 
instead include clear instructions in our documentation for using these 
templates.

Thanks,
Helen Koike

> 
> (And then perhaps have a 'gitlab' directory under that. I'm not sure
> whether - and how much - commonality there might be between the
> different CI models of different hosts).
> 
> Just to clarify: when I say "a logical place", I very much want to
> emphasize the "a" - maybe there are better places, and I'm not saying
> that is the only possible place. But it sounds more logical to me than
> some.
> 
>              Linus
