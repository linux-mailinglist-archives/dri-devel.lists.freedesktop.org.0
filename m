Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA792B9B5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E2610E539;
	Tue,  9 Jul 2024 12:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="sJzvxjyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED0610E539;
 Tue,  9 Jul 2024 12:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=ziBWPyZuXFGkV8kVZKK0Xj6BNHEbLXnVYFACz7/URSM=;
 t=1720528917; x=1720960917; b=sJzvxjyXeNPWd/2fkdOEVFOHfCUVkv6GXeVmKNGTIf2ojdP
 ocSEHmIeeMUOuMPAjrwzwp2NxLBZxbmBjRTLUkFjlWDpzDonLUgjfox3lVdTIgjqROJTqkDVOIDso
 dYb8Nc2Ea6aKDNAyEwgDutkuMW82Ru03ZSCzyhuTLJFFS91mr+jbm2139Gl6xDNvINyO8ZFNdKI3i
 +LK24AuDwzH8iaSzMblz++sM4jDQ4iw6Q2il/0uRgVhXwgSgvZZADqcyXps/t1oy1dZfdFN310B0L
 rn3OOtuB0CaR5IZhtcgw6D8eWBz3M5DiVs79HPOdYgPAe2sU2D5U6/I4qIZ7RIOA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sRAAN-0006uA-4B; Tue, 09 Jul 2024 14:41:55 +0200
Message-ID: <af91ef9c-5050-4f16-898a-f0c02a293d3f@leemhuis.info>
Date: Tue, 9 Jul 2024 14:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and
 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
 <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1720528917;
 5dd8eef7; 
X-HE-SMSGID: 1sRAAN-0006uA-4B
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

On 30.06.24 01:18, Mikhail Gavrilov wrote:
> On Sat, Jun 29, 2024 at 9:46 PM Rodrigo Siqueira Jordao
> <Rodrigo.Siqueira@amd.com> wrote:
>>
>> I'm trying to reproduce this issue, but until now, I've been unable to
>> reproduce it. I tried some different scenarios with the following
>> components:
>>
>> 1. Displays: I tried with one and two displays
>>   - 4k@120 - DP && 4k@60 - HDMI
>>   - 4k@244 Oled - DP
>> 2. GPU: 7900XTX
> 
> The issue only reproduced with RDNA2 (6900XT)
> RDNA3 (7900XTX) is not affected.

Hmmm, again this looks stalled -- and the regression report is 6 weeks
old by now. :-/ Or was a solution found in between?

So I assume no solution will be ready in time for the 6.10 final? I also
assume a "simple" temporary revert is not a option or bears big risks?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
