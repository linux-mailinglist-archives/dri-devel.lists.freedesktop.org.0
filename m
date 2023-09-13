Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31479EFBA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 19:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C4110E08B;
	Wed, 13 Sep 2023 17:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F16E10E08B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 17:02:07 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Rm6F70kM3z9svG;
 Wed, 13 Sep 2023 19:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1694624523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlKnzk67aSrFYw3ZTw8IBMqRXvLKk29quzRywYlZlNY=;
 b=jjEV+DgTbcghKhMizj0JhZDNH+k+cAp4WS4mq6Ks5IkjDU0kafDqsuhmoFfLrlR8ClxIi8
 Jgu3inFZBEqgiaQRTjbivX43kK8IctDdU3H9VhqKKCXzCkhXxN2NL9lYYUdgwY0lG4fl5R
 UedplselvF+q3j+CY6ytTXxE+XOO2plO4DX04wNuAajDy8eWvmNhIXRPmCxmJpP5jYBiv2
 bq7Pw5fXjRZ8i8iqUSMUaEpAvjcWTVg+yPOgsU1WAzUU8tTwX0V2kSsWx1aUzER1+++DgF
 VEmgyGzxyRo2BCdFZNInfdWYNAy83SMVaZFfRNlHYjASz5UOFOWyXU+/mdjiIA==
Message-ID: <87df2806-43d4-0bd9-e17c-84203ff9625a@mailbox.org>
Date: Wed, 13 Sep 2023 19:02:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Content-Language: de-CH-frami, en-CA
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <20230908174113.02b65f9c@eldfell>
 <6d506fe7-3c23-3b50-2d29-549ccb4dbe87@suse.de>
 <20230911113827.67ed6c7d@eldfell>
 <cf28003f-6b11-5800-61db-02195d8532be@mailbox.org>
 <39adc271-b79a-82ab-d125-e25e3282b729@redhat.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <39adc271-b79a-82ab-d125-e25e3282b729@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ab173ab8cb8b2f4a1e5
X-MBO-RS-META: mqd9mexejh3arpngetmkng3dh5sgt3k5
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/23 10:14, Jocelyn Falempe wrote:
> On 12/09/2023 17:57, Michel Dänzer wrote:
>> On 9/11/23 10:38, Pekka Paalanen wrote:
>>> On Fri, 8 Sep 2023 17:10:46 +0200
>>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> Am 08.09.23 um 16:41 schrieb Pekka Paalanen:
>>>>> On Fri, 8 Sep 2023 15:56:51 +0200
>>>>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>>>
>>>>>> Another point of concern is CPU consumption: Slow I/O buses may stall
>>>>>> the display thread, but the CPU could do something else in the meantime.
>>>>>> Doing format conversion on the CPU prevents that, hence affecting other
>>>>>> parts of the system negatively. Of course, that's more of a gut feeling
>>>>>> than hard data.
>>
>> Jocelyn, have you measured if the XRGB8888 -> RGB888 conversion copy takes longer than a straight RGB888 -> RGB888 copy in the kernel?
> 
> At least on my Matrox system, the conversion is really negligible compared to the copy, due to slow memory bandwidth. I wasn't able to see a difference, using ktime_get_ns().
> 
> The CPU is an old Intel(R) Core(TM) i3 CPU 540  @ 3.07GHz
> in 1280x1024, the RGB888 copy takes 95ms.
> and the XRGB8888->RGB888 takes also 95ms.
> (and the full XRGB8888 copy takes 125ms)

Then any XRGB8888 → RGB888 conversion in user space has to result in worse performance.


> But let's admit that this discussion is going nowhere, and that I failed to reach a consensus, so I'm now focusing on other things. 

I see consensus, with one person disagreeing.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

