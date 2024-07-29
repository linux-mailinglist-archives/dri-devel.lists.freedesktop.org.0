Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CC193F0BC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59D410E0AD;
	Mon, 29 Jul 2024 09:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="am9e0J87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4192C10E0AD;
 Mon, 29 Jul 2024 09:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=nkJMBQ+i71yMhGjEv1tjur3zZieRVTPrwZ+pVSBy+98=;
 t=1722244547; x=1722676547; b=am9e0J87RhOaSW0sdyEardNr/N1QGIfObq+9rIPZWX69yN9
 PcXCmpsYbzAkVWsg+Oc4LX8hEf9Zb5jfjv4MfPYNNIqhee4ZIdrwHenO6/nrmCKcC+PL1pTYIABLn
 Xohp7bpSN68DW6jfAHV+bLWhgr2v6m68p1CSUz4eqyLQpVCl4PcL3japH2Y1j7mgxjIEVTeGQnzdi
 efU9jRJ0sK3JGwaqIgYuEGO08dbVH+AGgetR7eNEWvHBp2dWFJdGSj66WNGrNZRp3zGPEeE7OExe9
 HBAim71qc5M/WTMEoI+nBBGsPWmKvhRntwJ4I2aYGCvtfdInYoNCEPNYHSAMREYQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sYMTo-0004dm-Lx; Mon, 29 Jul 2024 11:15:44 +0200
Message-ID: <ca007d54-c204-4f7f-9eca-5a282324b941@leemhuis.info>
Date: Mon, 29 Jul 2024 11:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
To: Christian Heusel <christian@heusel.eu>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, "Lin, Wayne" <Wayne.Lin@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Wu, Hersen" <hersenxs.wu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "kevin@holm.dev" <kevin@holm.dev>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
 <CO6PR12MB54897CE472F9271B25883DF6FCB72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <e2050c2e-582f-4c6c-bf5f-54c5abd375cb@leemhuis.info>
 <b7f0f3e1-522b-4763-be31-dcee1948f7b3@heusel.eu>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <b7f0f3e1-522b-4763-be31-dcee1948f7b3@heusel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1722244547;
 9e5f9408; 
X-HE-SMSGID: 1sYMTo-0004dm-Lx
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

On 29.07.24 10:47, Christian Heusel wrote:
> On 24/07/29 10:35AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>> [+Greg +stable]
>>
>> On 29.07.24 10:16, Lin, Wayne wrote:
>>>
>>> Thanks for the report.
>>>
>>> Patch fa57924c76d995 ("drm/amd/display: Refactor function dm_dp_mst_is_port_support_mode()")
>>> is kind of correcting problems causing by commit:
>>> 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for mst mode validation")
>>>
>>> Sorry if it misses fixes tag and would suggest to backport to fix it. Thanks!
>>
>> Greg, seem it would be wise to pick up fa57924c76d995 for 6.10.y as
>> well, despite a lack of Fixes or stable tags.
>>
>> Ciao, Thorsten
> 
> The issue is that the fixing commit does not apply to the 6.10 series
> without conflict and the offending commit does not revert cleanly
> aswell.

Hah, many thx, I should have checked that.

Lin, Wayne: could you maybe help out here and provide something for 6.10.y?

Ciao, Thorsten
