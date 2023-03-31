Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCEC6D1DB6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 12:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9EB10F12D;
	Fri, 31 Mar 2023 10:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC6510F12D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:13:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r11so87598937edd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 03:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680257630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYC/8uRzrCuH+IoYQAOKHM5xqzPAJyXDhjdpELcmRJU=;
 b=HsqZ0sJif04iEEWzU9eJ2arv3VTzqjCTE6uEmdOQ1RxR/bMpi+hgKeuuzphu9eVpaV
 t9vk6sJ+1D/K30XLtz4LZDKpb2nwgwwFwX9QwYDGJ94oK/vxWB7aa8OgGd6CHLmUUQrG
 JBoiqHhn1CKcpp1mw1P5GantuqCn8DpBd+WBRpc3Kta25HuQEw5r7evBroEbLjaC+VLT
 FeI/arsS9x5H0ejQ3qq0Hj5O/iUQn2G+AFOwxm/qG0He/QoZFTFi9WF9eURsOCLtA/Fp
 jAIUlTRAd3RiY24QabNXb7HmGp5j7Tg/bcfS/UDuTxmVv7ZCvzcmR9fI2F5ILdzuN5nU
 COzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680257630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYC/8uRzrCuH+IoYQAOKHM5xqzPAJyXDhjdpELcmRJU=;
 b=U485gcVV+KhXxEVHuRiuYCQ1pGI5tcl4NFM1fI9GBsf7RpPiHNuIwE0zPxkXB1w/uu
 Wj/wGRaidh3wzNgrSzLtkmfEb4xyzyW/IivFpZOnC1e/61E/HwMfmHrGPgJ4Eq9udLYl
 HlgDWk/lcVJkRRvvh0Bp8TqMUlxa+sjN30zwecdvwp8k027X/4+pCgfBtPE1qRyNgM64
 Lj2cL59OcWjS/FRQbHvlN9G8a38w1XgEOjOftfPv3unxRRP77dEcgkSrNdxxwq2URxTn
 ZL3GLdaiMWgjD8XOKwZ8JOZBf/nUrmxdhst9Jl4PKRLEaEQ524dkGGDYQM6l0k9a1X2D
 wm6w==
X-Gm-Message-State: AAQBX9eCtC4V07JOI75DM9C2tuBGlIr0Ow7BkX2g7H1Qy0Z2tpN6hAgm
 hKP0CH7RxEUyKWE1sifb61sUFw==
X-Google-Smtp-Source: AKy350Z8V4y891QtIJixCJ71l2mQycekFY9rc0Va2pDXHv+nDEr0Wj2BsjVWW54RRYmz/I2+XtmP8g==
X-Received: by 2002:a17:906:44b:b0:931:624b:680c with SMTP id
 e11-20020a170906044b00b00931624b680cmr26583862eja.29.1680257630349; 
 Fri, 31 Mar 2023 03:13:50 -0700 (PDT)
Received: from [10.44.2.5] (84-199-106-91.ifiber.telenet-ops.be.
 [84.199.106.91]) by smtp.gmail.com with ESMTPSA id
 u25-20020a1709060b1900b0093e39b921c8sm806334ejg.164.2023.03.31.03.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 03:13:50 -0700 (PDT)
Message-ID: <949a3539-d751-8c35-f161-de40de810c26@tessares.net>
Date: Fri, 31 Mar 2023 12:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/4] docs & checkpatch: allow Closes tags with links
Content-Language: en-GB
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet
 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
 <2194d19d-f195-1a1e-41fc-7827ae569351@leemhuis.info>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <2194d19d-f195-1a1e-41fc-7827ae569351@leemhuis.info>
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
Cc: Conor Dooley <conor.dooley@microchip.com>, mptcp@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thorsten,

On 31/03/2023 11:39, Thorsten Leemhuis wrote:
> On 30.03.23 20:13, Matthieu Baerts wrote:
>> Since v6.3, checkpatch.pl now complains about the use of "Closes:" tags
>> followed by a link [1]. It also complains if a "Reported-by:" tag is
>> followed by a "Closes:" one [2].
>>
>> As detailed in the first patch, this "Closes:" tag is used for a bit of
>> time, mainly by DRM and MPTCP subsystems. It is used by some bug
>> trackers to automate the closure of issues when a patch is accepted.
>> It is even planned to use this tag with bugzilla.kernel.org [3].
>>
>> The first patch updates the documentation to explain what is this
>> "Closes:" tag and how/when to use it. The second patch modifies
>> checkpatch.pl to stop complaining about it.
>>
>> The DRM maintainers and their mailing list have been added in Cc as they
>> are probably interested by these two patches as well.
>>
>> [1] https://lore.kernel.org/all/3b036087d80b8c0e07a46a1dbaaf4ad0d018f8d5.1674217480.git.linux@leemhuis.info/
>> [2] https://lore.kernel.org/all/bb5dfd55ea2026303ab2296f4a6df3da7dd64006.1674217480.git.linux@leemhuis.info/
>> [3] https://lore.kernel.org/linux-doc/20230315181205.f3av7h6owqzzw64p@meerkat.local/
>>
>> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
> 
> Maybe it's just me, but I think those changes do not make it clear
> enough when to use Link: and when to use Closes. Find below an
> alternative proposal how I'd do it for consideration that goes
> 'all-in' for the sake of simplicity.

Thank you for the new proposition.

I like your approach of forcing people to use the "Closes:" tag, I
didn't think it would have been OK. I will wait a bit before sending a
v4 just to get more feedback about that.

The good thing with this approach is that it makes things clear. The
"Closes:" tag is then no longer an alternative to "Link:" but a
different tag, e.g. to be used after "Reported-by" as you did in your patch.

I guess as any warnings from checkpatch.pl, it needs to be interpreted,
e.g. if multiple bugs are reported in the same report as Conor mentioned.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
