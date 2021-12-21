Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D11447C40F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 17:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5D211B0B3;
	Tue, 21 Dec 2021 16:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB52D11B0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 16:45:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k37so30718288lfv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6BcxuSoP4KKIbKcDwoVqc9P1xJ4zWJFdyW7tJdDGuqM=;
 b=U35HBS5uUor1AtMLIHNRQOgZoU28Ks462TgyqbscU/EDyO4KNZLAmVlLrsxtLLkQrT
 akcaozUWLxCi1NlR0QVBfscek8EsIyPOUI3Jx3C6VTDDB7mnrxWXDcBA7gS4a9lm4Na5
 k+3Tb8cEZq/INP9tDlgerGTjw80jH3hThBV0BbhfqhNbYryp4vdShtUrfDwXct9zQ9+z
 rgYEdstQNBICzOt4KLf/4nmaFTGkMpkOZo/Sur5+QD5zrr3JdhS7/Z0P/1LeHdc1qsQM
 QUBz5RH2Z3MOxhp6vKBNQHKZqefyvo/VO1vskNLr1h7lnjvKqPaowsSbaDNs3vCy53gM
 daHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6BcxuSoP4KKIbKcDwoVqc9P1xJ4zWJFdyW7tJdDGuqM=;
 b=zyPEuihTqux6EoTK+jMNclRPVZV5TN+4ScjK15E0g1+Ftzyw12Y5lt/OGuxgYcoHKn
 G++h8RRLhv5nK64eoBlAYtj4tpTkLRyEdQwZ2c7mS3akwutqJ1GuZUjNBgi3iPdZ1V1u
 GIO1QuZFMmQnL1n8nbvszHiDIkoOnaTAFv8Gu+RXfZUCeSUuaztZr8Q0lvqEogIKOVhH
 sQEHxt5zN8cbUzabKAYNNZAYBHz4dGRwXFC9rbf2fYQPoRglPCN0GeMATTgHgaULo28b
 Lwzn0Xap0QHmej8q5fRnOHrD/GYXSt/tdIojDWf0SjjW++Hfh3YWi3KoBJOLgs+MDpjm
 uucA==
X-Gm-Message-State: AOAM530xQ3jHNkBWDQznzohXwAlD3ZsCMHFPVT74NrxyMTA8jUJ1Hz/e
 2UyiPPD0H8gWcRXt/bLs8ws=
X-Google-Smtp-Source: ABdhPJxY//gm8ktKuhUgK3t9T0aUAQHZ6jPz+4q3MwYgjnL3RJW6PG3rDFKkA34L7WB55U4khI73mw==
X-Received: by 2002:ac2:418c:: with SMTP id z12mr3833570lfh.90.1640105131915; 
 Tue, 21 Dec 2021 08:45:31 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id h24sm2677380ljg.106.2021.12.21.08.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 08:45:31 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com> <YcH+Fw9sCzCIzFIx@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com>
Date: Tue, 21 Dec 2021 19:45:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcH+Fw9sCzCIzFIx@orome>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

21.12.2021 19:17, Thierry Reding пишет:
> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
>> 21.12.2021 13:58, Thierry Reding пишет:
>> ..
>>>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>>>> instantiated, AFAICS.
>>>>>
>>>>> I've tested this and it works fine on Venice 2. Since that was the
>>>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>>>
>>>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>>>> test this to verify that.
>>>>
>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>>>> 2023, hence we need to either use:
>>>
>>> All the (at least relevant) functionality that is in panel-edp was in
>>> panel-simple before it was moved to panel-edp. I've backported this set
>>> of patches to v5.15 and it works just fine there.
>>
>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
>> Nyan to keep the older DTBs working?
> 
> I don't see why we would want to do that. It's quite clear that the DTB
> is buggy in this case and we have a more accurate way to describe what's
> really there in hardware. In addition that more accurate representation
> also gets rid of a bug. Obviously because the bug is caused by the
> previous representation that was not accurate.
> 
> Given that we can easily replace the DTBs on these devices there's no
> reason to make this any more complicated than it has to be.

Don't you care about normal people at all? Do you assume that everyone
must to be a kernel developer to be able to use Tegra devices? :/

It's not a problem for you to figure out why display is broken, for
other people it's a problem. Usually nobody will update DTB without a
well known reason, instead device will be dusted on a shelf. In the end
you won't have any users at all.
