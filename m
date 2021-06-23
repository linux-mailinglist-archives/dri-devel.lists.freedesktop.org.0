Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAEB3B1444
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 08:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990E26E2A3;
	Wed, 23 Jun 2021 06:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C76E2A3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 06:56:09 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id m2so957797pgk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t2pWY37sQS7wYmTZFWeBBAVB8lvXIPkxw14DD6JgFyw=;
 b=i/0NPDjzGLbE4LBA80Uu7k//DWQ1Wq/Nxeco/bkPsBwFX9NoqdaNYW0UDh00crxFEu
 iI09uAZ5j9N/sYzrfBKkJ7gxuW0f1N5rs/KbhmonH06zT0Vymn7OwzIKayU4i9Uo7j36
 rYdsiH9bXq/aOqiYNs0DwBDpzP7OG2Z8uwKmnX/huUPh1DWE/SrkPGpv/kUfnEN0fKnG
 HI5QBp6EsjJ0G0woKTmwVlmkEF+IDCrXTidlTNqlJQvbiXr5Yfpx2PS2xmnX8yL1IQE/
 59gSycl8xySsOcTgB8zvz79sg0QRagUAvcgEfWieWBAwIU7mpOw5NYvs0iIju/vBP/xG
 rsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t2pWY37sQS7wYmTZFWeBBAVB8lvXIPkxw14DD6JgFyw=;
 b=thX477XiTRxoyd60YczTVXfZSAOUWvopG9NlXW7gmAlCboYFHGxKFT+wO1vbdPZcFS
 K2dahk6+uM0b3FC9DZ3fzVUUpPaRLkO+QPVDfNnGuMlxuPH3e8+hTy8qDjUglTzN9XlM
 k9mWDQxyc4xFDIXuSgvB/1gYJxGNBQa+BwTe4vFg4yLdpSKiLOc5oQ/0g9Fj/BZC01Zy
 noh5pxC/y3EEgytuwg0aSIsVQyw0Yn9DJeGE7SFIJIy8+xh8fSAb9ZYFY4JaMLDNiElG
 ev/P6KhZZpWYMU3wC9AZIA7gwKWss1t2/qa6XYzHhx2JTZ2h6j9YStGW2cOqWiuSUrSW
 D6Aw==
X-Gm-Message-State: AOAM530imDe5rpYtCg6P3/N7T6g6uWT5eSBEcrWujPOck6WBxUiL8J9A
 gQbcjTUd6a5AEEClWnypIR/dYg==
X-Google-Smtp-Source: ABdhPJxuCyhd1JeMWCXAj2NaviXdgvZBzY0G06KEl//E3ieHfTlplnQbfOEvqSdIRXIZ33PF2clRNg==
X-Received: by 2002:a62:1782:0:b029:2f7:dcbe:c292 with SMTP id
 124-20020a6217820000b02902f7dcbec292mr7593771pfx.63.1624431369445; 
 Tue, 22 Jun 2021 23:56:09 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:1102:c007:eee:4478?
 ([240b:10:c9a0:ca00:1102:c007:eee:4478])
 by smtp.gmail.com with ESMTPSA id v69sm1507491pfc.18.2021.06.22.23.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 23:56:08 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
 <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
 <20210622111239.73aa87aa@eldfell>
From: Esaki Tomohito <etom@igel.co.jp>
Message-ID: <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
Date: Wed, 23 Jun 2021 15:56:05 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622111239.73aa87aa@eldfell>
Content-Type: text/plain; charset=windows-1252
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
Thank you all for your comments.

On 2021/06/22 17:12, Pekka Paalanen wrote:
> On Tue, 22 Jun 2021 13:03:39 +0900
> Esaki Tomohito <etom@igel.co.jp> wrote:
> 
>> Hi, Enrico Weigelt
>> Thank you for reply.
>>
>> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:
>>> On 21.06.21 08:27, Tomohito Esaki wrote:
>>>
>>> Hi,
>>>   
>>>> Virtual DRM splits the overlay planes of a display controller into multiple
>>>> virtual devices to allow each plane to be accessed by each process.
>>>>
>>>> This makes it possible to overlay images output from multiple processes on a
>>>> display. For example, one process displays the camera image without compositor
>>>> while another process overlays the UI.  
>>>
>>> Are you attempting to create an simple in-kernel compositor ?  
>>
>> I think the basic idea is the same as DRMlease.
> 
> Hi,
> 
> indeed. Why not use DRM leases instead?
> 

In this use case, I understand that this is not possible with DRM lease,
am I wrong?
I understand that it’s not possible to lease a plane and update planes
on the same output independently from different processes in current DRM
lease.

If this is correct, what do you think of adding support for plane leases
to the DRM lease to handle this case?

Thanks,
Tomohito Esaki
