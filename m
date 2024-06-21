Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FC1911D77
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509DE10EE57;
	Fri, 21 Jun 2024 07:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="v4izR6Vw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13BE10EE57;
 Fri, 21 Jun 2024 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=EGT5e8L1pNhD0BVhYlvh53zXiul0Yh6rVbmqVvfwN2M=;
 t=1718956584; x=1719388584; b=v4izR6VwdX7WcFq0sBqNkoLtZFS2vmsbmxz3RjZWAietfwr
 pkiTPCgQJKkVTpys8gY26mKRuCwnp8utRgm14uY06DUDDM3nO1Xy5TTbMSdmtGvLREPSAavxdR3nr
 ySvYggBZzZzrOu3wjHL8BsWCF2HMz+g8vWQE5d0gQbFn6xzsTsABeIsl59TQ9RdRRSFzGFX079cm5
 C3sj21Rw5CStBLBwWTenelB6/3U98Jp8nZ6XybXA+7QYsPbL70o5ZKF/4chKihMH3M11qT6c0Gcrn
 k87cl+zStGf2DmKw/dtQ6q+xQOTCFiAVpJIGMCza+e5hga6Kyo9AexrtCC9PVa0Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sKZ8A-0007Fh-7F; Fri, 21 Jun 2024 09:56:22 +0200
Message-ID: <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
Date: Fri, 21 Jun 2024 09:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and
 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1718956584;
 5e20c670; 
X-HE-SMSGID: 1sKZ8A-0007Fh-7F
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.06.24 23:19, Mikhail Gavrilov wrote:
> On Fri, Jun 7, 2024 at 6:39 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
>> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
>> @@ -944,7 +944,7 @@ void optc1_set_drr(
>>                                 OTG_V_TOTAL_MAX_SEL, 1,
>>                                 OTG_FORCE_LOCK_ON_EVENT, 0,
>>                                 OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
>> -                               OTG_SET_V_TOTAL_MIN_MASK, 0);
>> +                               OTG_SET_V_TOTAL_MIN_MASK, (1 << 1)); /* TRIGA */
>>
>>                 // Setup manual flow control for EOF via TRIG_A
>>                 optc->funcs->setup_manual_trigger(optc);
> 
> Thanks, Alex.
> I applied this patch on top of 771ed66105de and unfortunately the
> issue is not fixed.
> I saw a green flashing bar on top of the screen again.

Hmmm, I might have missed something, but it looks like nothing happened
here since then. What's the status? Is the issue still happening? Any
solution in sight?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

