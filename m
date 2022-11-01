Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24D615113
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 18:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF90410E410;
	Tue,  1 Nov 2022 17:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192D510E40C;
 Tue,  1 Nov 2022 17:52:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id k2so39015982ejr.2;
 Tue, 01 Nov 2022 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c2avhcvZqGJHzXUG3n7mmEHgSdhs0LnBOQLKLScDVAA=;
 b=HCBhJGPBqq9tcd7hijDQhFC6XVk8pQAzGfYGUsbbcFWTHhR+2YZNDJgXE9mwtPf3PZ
 3VwpTls+ukFWn/YA9ilySSRavVV0u1ndYieZBTC1qjk9HPmEmJyMvroyPbK3SiXMbMBB
 FTt7v92HoBH+PxAm2Ev6HcYIdv1qkx1jT67/vC/pNgBDy7OurpzpbRZ94qfrpePmoFvW
 Oj0BO5CHRxt6QWbigl1RbVkAv5UyRlPWCZU4t0+Vd5RJJo2q9gckcKJgrcjeuXQl7wui
 4HelI4XaeiVpjopA/e3u9jETrZXoJ2wmqhnBhZZBuM3F8tKctDfBkglz1k6Zas4aR/VD
 Hc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c2avhcvZqGJHzXUG3n7mmEHgSdhs0LnBOQLKLScDVAA=;
 b=lAVhpU10le/AyVrtrLdbSlXNSOoWSeK0D2VcTnzkdv+3k/iVjcZ7F2okL/hBgpjEpD
 auZpXNj+rHN0lYCfOYLgnLCBTIE/HukGec2DSdsW+ec5norEFyNXW2jqx9c3/jPdl+tH
 t+ngehIg9i9OUVm40s6Dj/pZljcTF5rQwxcax1HJ4nK+Dhf5RWJCFLYfDprF1GppIREq
 s8w6w0E/K6zNdKhrELuIBl+lvgSVKHkPwtX3rc0ihYU+TdbixkgNffoUNUOqAhg2+qz5
 vk34e8QdY40/HpH3P+wKo2O3pGK7b3biQDPTiFscKCjMIDsn9V98vTpGuWaOa7y0VTjX
 ruFg==
X-Gm-Message-State: ACrzQf1nJIoT21PJBrN6bEMkn0sOehLOK7aF9Zg5g90wfcLyIxmg8QE1
 0g9zkPn3x5ePCKrNtzFFpCE=
X-Google-Smtp-Source: AMsMyM6ErDiqmhlt0U94q7J7ycQEj+mZo55t6HWxn3UGmRk25t2+McXPbdxyjQ0fNlaHfERo1D/dhg==
X-Received: by 2002:a17:907:da0:b0:7ad:9760:e1d2 with SMTP id
 go32-20020a1709070da000b007ad9760e1d2mr18865951ejc.419.1667325164648; 
 Tue, 01 Nov 2022 10:52:44 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:49b3:944:a1d4:4523?
 ([2a02:908:1256:79a0:49b3:944:a1d4:4523])
 by smtp.gmail.com with ESMTPSA id
 w9-20020aa7da49000000b00461a98a2128sm4712666eds.26.2022.11.01.10.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 10:52:44 -0700 (PDT)
Message-ID: <ca6c98eb-fdb0-5fee-3925-5b697e3e6b50@gmail.com>
Date: Tue, 1 Nov 2022 18:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6 some games (Cyberpunk 2077, Forza
 Horizon 4/5) hang at start
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
 <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
 <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mikhail,

Am 30.10.22 um 23:05 schrieb Mikhail Gavrilov:
> On Wed, Oct 26, 2022 at 12:29 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Attached is the original test patch rebased on current amd-staging-drm-next.
>>
>> Can you test if this is enough to make sure that the games start without
>> crashing by fetching the userptrs?
> 1. Over the past week the list of games affected by this issue updated
> with new games: The Outlast Trials, Gotham Knights, Sackboy: A Big
> Adventure.
>
> 2. I tested the patch and it really solves the problem with the launch
> of all the listed games and does not create new problems.
>
> 3. The only thing I noticed is that in the game Sackboy: A Big
> Adventure, when using the kernel built from the commit
> b229b6ca5abbd63ff40c1396095b1b36b18139c3 + the attached patch, I can’t
> connect to friend coop session due to the steam client hangs. The
> kernel built from commit 736ec9fadd7a1fde8480df7e5cfac465c07ff6f3
> (this is the commit prior to dd80d9c8eecac8c516da5b240d01a35660ba6cb6)
> free of this problem.
>
> I need to spend some more time to find the commit after which leads to
> hanging [3] the steam client.

Let's focus on one problem at a time.

The issue here is that somehow userptr handling became racy after we 
removed the lock, but I don't see why.

We need to fix this ASAP since it is probably a much wider problem and 
the additional lock just hides it somehow.

Going to provide you with an updated patch tomorrow.

Thanks,
Christian.

>
> Thanks.
>

