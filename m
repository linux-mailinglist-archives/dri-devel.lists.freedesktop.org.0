Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E2A35177
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99A910E07D;
	Thu, 13 Feb 2025 22:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="K3hE5+LL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE7710E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1739486866; x=1740091666; i=deller@gmx.de;
 bh=bN/fZeinS1oWSX7ccYvenUFgFc/+Deu0YTPHQLIUWCM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=K3hE5+LL/pamdeC6UnCc9ppock1L+I5MhId7lIffyMMtx7n2PCZH0+Fu++uFqIde
 6uzr4ByN3DPVFVbazeW6iIs7TkKfWGaXX0ncRzG3p5O973u5ebmhVWBh2g+nvNCUm
 tB0e/fcWQ8xTQRbIV+yM0mt/bUuwbw9SZKkK7behAe6u4nR/8Um4lbmz/TMKIUwt/
 Ymakoq45bghhMBR3yo4uIvCgF6EG2j5F0lYRXhT22HJg4tRYWJLpSgpwRUVh+15Z6
 pWELna1QieqUra0imzg0+6wmR+5DyqDVcglRAHhK83qpUL7qbHmlQ/rEnoNtLKq5l
 axYYqs8YoVcS9Ws3hA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6e4-1tABOJ3Ih4-00aSYX; Thu, 13
 Feb 2025 23:47:46 +0100
Message-ID: <f075b0f7-3d01-4eb7-b772-825de7a1e001@gmx.de>
Date: Thu, 13 Feb 2025 23:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de> <ZvUwCVNPzp1UGY6h@intel.com>
 <34a7d276-ee26-4a8d-b996-87faa5b224c4@gmx.de> <Z64EzooZqdfLg0pM@intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <Z64EzooZqdfLg0pM@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x8W37MfSEpdjxobO3r5viLwiE+AXbLGYul1nSOybPhTynqd7mE9
 E164KFMetH81+EIM6ADGJcOwlNk0G3rOu/Fl7dZPpjMMihxZTNdOr3q8wKzbXv+N3ua9YkT
 RaoHXtwF4smHVoNL2Nyu+imidR9bktfsVkYG++KGiqDigTcQsO1PSrgTfagvLwWuhKYTupk
 nj0h3KC9jaLJQGrncNKLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jJt1D9bk0HE=;g3atSjZofDPoxTe828J+rzK+lEK
 mHSTP7k7dxk2UzuoU9olH+q6W71O7dDCpCFTw7PtFoejnGz4c9gHkYb+FIFM1im20uqM4gvy1
 Fn7GCmHB85qqAqbOt7UGDETQazjQrMUTw+rZqWP1WIoParVqFyxsOqdXEHqddJ7p4HsHdlgMN
 eG1VQifnxdH4FOX7EZ7fK9KNHE4YcTjfjDzmSLyBqvkszzzhR07vRnm2WGWyCytO8ixkfuUdW
 zubh+Iqv5HPFOWmFK1KTEg/DRf+aNMGkzMPG/es/0viVLHZsPkfZ9YQdkVU9IyDG51sz5REQD
 EGVfVoC5XcbPLvrrbu+4cxgDXLzj8el65g84rQMjXajY8ijWzzL8LMjb768llCplujHRtMXN/
 EeRmezUQuplhnCvYFn6lDdGAYVk4nvuW8iZT3sLlCNg13iBgWKdcckqQddi9btZ3ytUD072Ye
 5UqHZOiqhgRxvnqHoPpNGyfshISLVY69NkIyU2FVNmnB5MVkQIxGxkK6Q9qJ1S+XfFrKGEIaN
 QCdeD6qqX8qyIw/u33KOQPfsIdRM9w3xB8fjC9aZmdcrL+OYxd0dBDcwhE9plKa4sfqZumVAU
 rZZUg+hQGiUL2h8MgAbedWus0U9F0/IvbHPREwz62OYnEtIUQKMkneHtj8OiV1Af1PVuVVIZk
 1e15PyraELBZ4rKxqlA01R3u3xdW1i0KO9z4SxslrhrhL54TNSjrHos18CD9L9SPPePMcGZrB
 +WL8ffDWcfNoMDTiCedvxw4KNcxNs66C+C+GmyWLdhAoPhS+sRXVEnk/fYmOfRFGDUl0ozpEc
 iChRnQQzibJWSRg+UnJi/du4k4qGCymDidHE7mSaBSaa3Ui5v3PwX+Lz+0CaBHjpeoEwn7ktw
 6LTXpE/0G5apwnZpSfUmd95X1Qi1rArnee974YLL8aRNs8kDc1ZRs6p16XT3YE0mH7yQ8Vmo+
 RaF8qzsPRl3bi6bWzg6hLaHls6tzhApCok0wNbKFkyU1WivwVht15e931/vN0g8YhcSETNc+J
 p1cukQO/vAV2H+KAT+wLFtwz4n/W9uTSFfgR318DvqaHMzwlHE1CX30/ZwQSfnM20IRAQ4ZVR
 kHIhxRFhXGzELpaHPB/AzMVetmpd8+qPBdQmXtHuky5MA1OuCtSVZNA4NgD15hUdAmGjxKw9h
 Fn9KnyGVNQ0vWuqWYS0V4ITVqDantssCiHl81WkhlxswuUk7UCyjqONVEyw0j+IGmH5+DdeGX
 1q1rsWdBBMYNB0DagsfjNWo6c9Zrm6zUTbrpW3WIbDuu/zPHQ04OJ6giWdwb9MY6aDFpK43Qk
 vMrS24alPUI/GVymQJ4pnmhshAPE6NhdlvI/HfDbywExk2TsqaWuKkf8e782CbqzSB3cOmHgi
 NYEaw86ZOzSvQpm7/hAekEXvkv30/mKn+EWSzW5O37AzKme8mNNyj75J6W
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

On 2/13/25 15:42, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Thu, Sep 26, 2024 at 12:13:04PM +0200, Helge Deller wrote:
>> On 9/26/24 11:57, Ville Syrj=C3=A4l=C3=A4 wrote:
>>> On Thu, Sep 26, 2024 at 08:08:07AM +0200, Helge Deller wrote:
>>>> Hi Ville,
>>>>
>>>> On 9/23/24 17:57, Ville Syrjala wrote:
>>>>> Currently setting cursor_blink attribute to 0 before any fb
>>>>> devices are around does absolutely nothing. When fb devices appear
>>>>> and fbcon becomes active the cursor starts blinking. Fix the problem
>>>>> by recoding the desired state of the attribute even if no fb devices
>>>>> are present at the time.
>>>>>
>>>>> Also adjust the show() method such that it shows the current
>>>>> state of the attribute even when no fb devices are in use.
>>>>>
>>>>> Note that store_cursor_blink() is still a bit dodgy:
>>>>> - seems to be missing some of the other checks that we do
>>>>>      elsewhere when deciding whether the cursor should be
>>>>>      blinking or not
>>>>> - when set to 0 when the cursor is currently invisible due
>>>>>      to blinking, the cursor will remains invisible. We should
>>>>>      either explicitly make it visible here, or wait until the
>>>>>      full blink cycle has finished.
>>>>
>>>> are you planning to send follow-up patches to address those shortcomi=
ngs?
>>>
>>> Nope. I don't really care about those as I never plan to
>>> turn the cursor blinking back on after turning it off via
>>> udev.
>>
>> Sad, but OK. I will look into this when I find time.
>> I'd hoped to push those patches upstream during this merge window,
>> but then I think I have to delay them at least until kernel 6.13.
>
> What happened to these? Not seeing them anywhere...

The issues above are not fixed yet, so they are still parked in my for-nex=
t-next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/log=
/?h=3Dfor-next-next

Helge
