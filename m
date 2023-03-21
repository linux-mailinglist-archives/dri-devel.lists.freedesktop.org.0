Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B186C29FB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 06:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EF410E076;
	Tue, 21 Mar 2023 05:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ABA10E076
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 05:45:55 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f16so14352515ljq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 22:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679377554;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/HBDOzpKH5imfC4osZ7C5dgTOV9Q7fw2SPiikWGL4lc=;
 b=Y+Qc6kHfnFZVD/Btd+XH2aI5kVriqVu91X2973a9xpyltMZaZvQXr0HxHKeUmC+n/Y
 acM6Jm8QTjOblpusfM4S5F5EhZuvyB0Q91EU43GgucInnSGRiDn8APjYVYNseLp/J7AL
 yjYy9DfjwUzSDgxlWjLZG9vNtIldcAfE+yJgWCVvV1InvOH62f78OenMIFA1k84ejC1Q
 iW30yIA10QNgHWVxsug2HyhJnjuI/oBpPMmoM1mP2HFQDx2Mt0eWij4b4edC2YNeHql2
 EnrYjadoKye+6UMU/mSouMECLFfJVJKVNwnNh5hxrCjZqErsMUadk3bx6Nr0PdFtnT43
 UXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679377554;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/HBDOzpKH5imfC4osZ7C5dgTOV9Q7fw2SPiikWGL4lc=;
 b=ouHJKSf9KMorzol1v6zaW8kF2PZDrmudySJd9UD9Xt0ryYSQcARAzVRpXQHV09pbsa
 Li/EcgEfIXV7+KR34v0CkxdLdNQK/Bs9uQA2bAQ4CoE6f3ZpB9TFrAK3rH0s6sWh6dV0
 BuwaKWLDUyvlOf6AHbyfZ8JMgwy97jIIlxOC1IT8tb0hrLoiZSGiDQkgEu1TddolvsNE
 ZYkvSZeQosTuyzF17ftrHigL9vEUEJSv1zQUIXIHIY1dKUT2mcQEVOqjVrSBKi2r6He3
 tublG/lictUOQkiC0KKocPdQIG+/ei875bdJlLta3TubRkZmxqvbP5osr6Fa+UmWmtsr
 zlQw==
X-Gm-Message-State: AO0yUKWIfitzIzhHJl2Hv8G2fOoHtnFiF6UW9qqZf/yDUM+xKq1QRPGi
 rYv6AzZ8Pu50J+u8yNQYEss=
X-Google-Smtp-Source: AK7set8dSP5W4abkNf6oYLDISmKZHVAMC46issOrfH5biXxz6mfFYkUxhEOz9loABb8Mc2QaBVCEmw==
X-Received: by 2002:a2e:3c05:0:b0:29b:d530:b175 with SMTP id
 j5-20020a2e3c05000000b0029bd530b175mr419576lja.17.1679377553772; 
 Mon, 20 Mar 2023 22:45:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1?
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a2e8045000000b0029f7d27b78bsm56751ljg.110.2023.03.20.22.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 22:45:53 -0700 (PDT)
Message-ID: <d13cd7bf-0b1e-e9e1-266a-00db40e51de7@gmail.com>
Date: Tue, 21 Mar 2023 07:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, en-GB
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <maxime@cerno.tech>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
 <20230317150916.a3xrh25ywe5k77yp@houat>
 <e8f50fe8-bad3-e59e-4d80-e2f7db9c9933@gmail.com>
 <5ace543cae7a54db399750a1b330c3ae.sboyd@kernel.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
In-Reply-To: <5ace543cae7a54db399750a1b330c3ae.sboyd@kernel.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Morning Stephen,

On 3/20/23 21:23, Stephen Boyd wrote:
> Quoting Matti Vaittinen (2023-03-18 23:36:20)
>>>
>>> I think you would have an easier time if you just copied and renamed
>>> them into the kunit folder as an preparation series.
>>
>> Yes. That would simplify the syncing between the trees. It slightly bugs
>> me to add dublicate code in kernel-but the clean-up series for DRM users
>> could be prepared at the same time. It would be even possible to just
>> change the drm-helper to be a wrapper for the generic one - and leave
>> the callers intact - although it leaves some seemingly unnecessary
>> "onion code" there.
>>
>>> That way, you wouldn't have to coordinate DRM, CCF and IIO, you'd just
>>> create new helpers that can be reused/converted to by everyone eventually
>>
>> Yes. Thanks - I think I may go with this approach for the v5 :)
> 
> Which kunit directory?

I was thinking of adding the platform_device.h (I liked your suggestion) 
in the include/kunit/

> I imagine if there are conflicts they will be
> trivial so it probably doesn't matter.

Probably so. Still, I am not the one who needs to deal with the 
conflicts. Hence I like at least asking if people see good way to avoid 
them in the first place.

Besides, I was not sure if you were planning to add similar helper or 
just wrappers to individual functions. Wanted to ping you just in case 
this has some impact to what you do.

> Have you Cced kunit folks and the
> list on the kunit patches? They may have some opinion.

This patch was should have contained the 
include/kunit/platform_device.h. That file was pulling the Kunit people 
in recipients but I messed up things with last minute changes so both 
the header and people were dropped. I'll fix this for v5.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

