Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164615338B3
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 10:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A920E10E4BC;
	Wed, 25 May 2022 08:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2128310E54E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:42:38 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4L7PhV3zsfz9sd3;
 Wed, 25 May 2022 10:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1653468154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9Ca66IuoUejRtyMbbQC46KBV4HuFBLq8Gb16DmXtuw=;
 b=o5cF3CPSO7E0PXfcmDMQ0ksC1IIo3OLDIGkAgI0tVz6ltDu22M1eRmDVB9rT5PW6w0MKih
 nL5y/116AvkbTdp3z8F59rTHrZiSeA2NhwuDMJhbqC6oB1sk2FDTVruWBFmkofcxxBOCRw
 GD37YtZDrb04006SjMvmrdOk5+IyzuzRtfirU7C7lOqeU46C7xHCCo/5Wsp1XJkw5YJyV3
 j3hUp9/T8cPFE8hUhbdFO3UPt1WIDvdXZ9e42C7UWhWXT1yyOU/g7OXxfz1SVMeKpCYrF2
 QvAyX50Dea7QPHWvZff+eTpU3ck5NoPBEEQw7tqbfXkZYT/Wcxs/2dnkqgqrGA==
Message-ID: <04ba0498-5b2b-ef01-6393-0db90fd343e8@mailbox.org>
Date: Wed, 25 May 2022 10:42:27 +0200
MIME-Version: 1.0
Subject: Re: How should "max bpc" KMS property work?
Content-Language: en-CA
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <d9c4b940-4a16-cd6f-2672-752a2678c32c@redhat.com>
 <Yoz9GisEO9M4KRPB@intel.com>
 <CADnq5_N9gLzLnmPa4K9+40wTfgyC5TN4sZsuaK6+011DAgMPPA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CADnq5_N9gLzLnmPa4K9+40wTfgyC5TN4sZsuaK6+011DAgMPPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: iqu9gea11i7kc91z3ab6e5nwrbcmbb6h
X-MBO-RS-ID: c1b5afd6bd5e1bae625
X-Rspamd-Queue-Id: 4L7PhV3zsfz9sd3
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-25 00:03, Alex Deucher wrote:
> On Tue, May 24, 2022 at 11:43 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
>> On Tue, May 24, 2022 at 11:36:22AM +0200, Hans de Goede wrote:
>>> Hi,
>>> On 5/23/22 13:54, Sebastian Wick wrote:
>>>> On Mon, May 23, 2022 at 10:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>>
>>>>> Nice to see there would be other uses for knowing which might be higher
>>>>> priority to the larger community.
>>>>>
>>>>> Would it be proper to initialize 'max bpc' to the link depth used by
>>>>> boot-up firmware? I guess it could make things more reliable and solve
>>>>> the Plymouth blanking issue, but not the professional color management
>>>>> use cases.
>>>>
>>>> I was always under the impression that if you do an atomic commit
>>>> without changing any properties that it won't result in a mode set
>>>> which would clearly make the current behavior a bug.
>>>
>>> I agree, IMHO the i915 driver currently setting max-bpc to 12 by default,
>>> causing an unrequested link re-negotation on the first modeset is
>>> a bug in the i195 driver and is also the root cause of this
>>> plymouth bug-report:
>>>
>>> https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/102
>>
>> Why would anyone want to run at 8bpc when they have a panel with
>> higher color depth? So I think someone is going to be doing that
>> modeset eventually anyway.
> 
> We used to do something similar, but then got piles of bug reports
> about the displays running at 30Hz rather than 60 so we changed it to
> 8.  It's hard to say what a user will prefer.

Ville's suggestion elsewhere to filter modes based on minimum bpc (and lower effective bpc as needed for the selected mode, while there's only the "max bpc" property) should take care of that particular issue?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
