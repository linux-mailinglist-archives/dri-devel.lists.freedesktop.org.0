Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99A759521
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 14:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CD510E486;
	Wed, 19 Jul 2023 12:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D3710E486
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:30:58 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3489cd4e3d3so6469565ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689769858; x=1692361858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nyelAFhBqC7a6h8KFfAv2WQuGfH7nEdJ9cZtx3ZPD3w=;
 b=VE7iNtpws7j28phGM9tm3pz1NUfmwVl2IllYO7nmxLTE1LTAnZYvR8lfo+6QeFbnc1
 Wg/Ot6iaw/8lS5AylTLNd818zyyDsQXk178XLYrRAS4FXB+fG3PduHE+8rdCfLyAbKOR
 gLFAQeKv7Qvo2u6+2/aEsu4FhZ4u3ROPSFYmNXi1UsVYgviHfKb/ehXra0xET61tuTdC
 Ob8vZhpQVnSqud6YGJKSt/fQXVlwQg4suNwwTQruBSlxeujuSdAb2oB0WNIiGamikdHK
 PneVoOCo22TaTlJ8bOK+SPd5zNFnFNxj2ginv4HSDuOmlrr6l8wwkdV2G3f6dgXR7Cce
 xAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689769858; x=1692361858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nyelAFhBqC7a6h8KFfAv2WQuGfH7nEdJ9cZtx3ZPD3w=;
 b=Ev3hOMiM6e6Vizm9PpDcFsEx1X58O0HucW8bsa2rRF9tTmamMYuUPwh1wYAPWqflIy
 mJzX7XGGO1NzX5QtdK5pIwThgxgUTr4Ga4WcFk1FgJWiJ9kcd7p1D3R4QROaGTxrSy3X
 x1RitlsA+OoW6GNkIQUoii4iBkwaTmpkg4zQp93+UxFjgrACEcAlOjhK5S4xwYwU8EMy
 r4j5TBg6NAe/EIXWCEiGrQLupJxtFw5+zbmwb6XcU+PSpip782D8kX+KOHRuMpC7bFAY
 DGS2wXoCRx/nxb5pEIvOycjzE2tHyvV8cSvw1+gOHwpgAz3870DfPg95je8KWzEOoumJ
 I3Bg==
X-Gm-Message-State: ABy/qLbbJxp/JcRk/vOGZj/EXPh6GqrIuga4rKLcDpyF8H19C8kMhS6W
 1hnWfk1pL0/mHZWeBqmPigE=
X-Google-Smtp-Source: APBJJlEMyFO+3pdtjDtXrJi07Y2AVy0m52kCGiLm+w9lvt8THgUVqbEF3FDdma3ZuPO9yaElS6E6hw==
X-Received: by 2002:a05:6e02:1bc8:b0:348:90e2:750a with SMTP id
 x8-20020a056e021bc800b0034890e2750amr2650304ilv.8.1689769857778; 
 Wed, 19 Jul 2023 05:30:57 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 mr1-20020a17090b238100b002676e973274sm1211434pjb.0.2023.07.19.05.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 05:30:56 -0700 (PDT)
Message-ID: <4759e7d4-5a8c-8acb-1775-e049b9b06cc1@gmail.com>
Date: Wed, 19 Jul 2023 19:30:46 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: Unexplainable packet drop starting at v6.4
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 hq.dev+kernel@msdfc.xyz
References: <e79edb0f-de89-5041-186f-987d30e0187c@gmail.com>
 <444d8158-cc58-761d-a878-91e5d4d28b71@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <444d8158-cc58-761d-a878-91e5d4d28b71@leemhuis.info>
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
Cc: Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Ethernet Drivers <intel-wired-lan@lists.osuosl.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/23 18:49, Thorsten Leemhuis wrote:
> On 18.07.23 02:51, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> After I updated to 6.4 through Archlinux kernel update, suddenly I noticed random packet losses on my routers like nodes. I have these networking relevant config on my nodes
>>>
>>> 1. Using archlinux
>>> 2. Network config through systemd-networkd
>>> 3. Using bird2 for BGP routing, but not relevant to this bug.
>>> 4. Using nftables for traffic control, but seems not relevant to this bug. 
>>> 5. Not using fail2ban like dymanic filtering tools, at least at L3/L4 level
>>>
>>> After I ruled out systemd-networkd, nftables related issues. I tracked down issues to kernel.
>> [...]
>> See Bugzilla for the full thread.
>>
>> Thorsten: The reporter had a bad bisect (some bad commits were marked as good
>> instead), hence SoB chain for culprit (unrelated) ipvu commit is in To:
>> list. I also asked the reporter (also in To:) to provide dmesg and request
>> rerunning bisection, but he doesn't currently have a reliable reproducer.
>> Is it the best I can do?
> 
> When a bisection apparently went sideways it's best to not bother the
> culprit's developers with it, they most likely will just be annoyed by
> it (and then they might become annoyed by regression tracking, which we
> need to avoid).
> 

I mean don't Cc: the culprit author in that case?

> I'd have forwarded this to the network folks, but in a style along the
> lines of "FYI, in case somebody has a idea or has heard about something
> similar and thus can help; if not, no worries, reporter is repeating the
> bisection".
> 

Aha! I missed that point. I already have networking folks in To: list.

Thanks!

-- 
An old man doll... just what I always wanted! - Clara

