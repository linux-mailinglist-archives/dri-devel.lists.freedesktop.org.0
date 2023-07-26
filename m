Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2246762F33
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6910E431;
	Wed, 26 Jul 2023 08:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A9610E42F;
 Wed, 26 Jul 2023 08:07:25 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4R9mhn71bVz9slb;
 Wed, 26 Jul 2023 10:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1690358842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHAU2WtxLXCpVwOzHZxYiWNoKZatMkP5oCbz6WI4SPA=;
 b=vMEbZRzJAQ3lUXTzas65sGQJH7SiTk2H9+hGxGPfZBgaoNnDDESraZNFpqi+KbbBY3Bn76
 pg3PEa4GhMsndYsMHpjPfNTK54A1xOPLLgp+dfcWlaWMem0PuTXRoCsFRDHqtxtZcX6Jur
 Q/HIIU1v8MR3O5Ii0s72NZnFWy8/W/zKsmiKeYGAVbdkmMVb4pNpzZZFxv6TTg92E83vVQ
 QOPqcNW1EBrlF3HSifSTgscVfHRV1vfMQKlpGoMnGSaZB9gM7YROGdoUXkiU2QdrnLen3Z
 l5YzlmE1/iDJypA4/AkNcR/1B6s5Rc7/yATifP8rv4TJHBjWZh86d4MpPq/nnw==
Message-ID: <8eb58a5f-02d0-fadf-1d5a-790b6af2d81e@mailbox.org>
Date: Wed, 26 Jul 2023 10:07:19 +0200
MIME-Version: 1.0
Subject: Re: Non-robust apps and resets (was Re: [PATCH v5 1/1] drm/doc:
 Document DRM device reset expectations)
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
 <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
 <a1fecc5c-30c0-2754-70a1-2edb2fe118fb@igalia.com>
Content-Language: de-CH-frami, en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <a1fecc5c-30c0-2754-70a1-2edb2fe118fb@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c99f3890bef0434ccc7
X-MBO-RS-META: 7uaxsifuwngj5cyzfa3ngxf83jx37585
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/23 15:02, André Almeida wrote:
> Em 25/07/2023 05:03, Michel Dänzer escreveu:
>> On 7/25/23 04:55, André Almeida wrote:
>>> Hi everyone,
>>>
>>> It's not clear what we should do about non-robust OpenGL apps after GPU resets, so I'll try to summarize the topic, show some options and my proposal to move forward on that.
>>>
>>> Em 27/06/2023 10:23, André Almeida escreveu:
>>>> +Robustness
>>>> +----------
>>>> +
>>>> +The only way to try to keep an application working after a reset is if it
>>>> +complies with the robustness aspects of the graphical API that it is using.
>>>> +
>>>> +Graphical APIs provide ways to applications to deal with device resets. However,
>>>> +there is no guarantee that the app will use such features correctly, and the
>>>> +UMD can implement policies to close the app if it is a repeating offender,
>>>> +likely in a broken loop. This is done to ensure that it does not keep blocking
>>>> +the user interface from being correctly displayed. This should be done even if
>>>> +the app is correct but happens to trigger some bug in the hardware/driver.
>>>> +
>>> Depending on the OpenGL version, there are different robustness API available:
>>>
>>> - OpenGL ABR extension [0]
>>> - OpenGL KHR extension [1]
>>> - OpenGL ES extension  [2]
>>>
>>> Apps written in OpenGL should use whatever version is available for them to make the app robust for GPU resets. That usually means calling GetGraphicsResetStatusARB(), checking the status, and if it encounter something different from NO_ERROR, that means that a reset has happened, the context is considered lost and should be recreated. If an app follow this, it will likely succeed recovering a reset.
>>>
>>> What should non-robustness apps do then? They certainly will not be notified if a reset happens, and thus can't recover if their context is lost. OpenGL specification does not explicitly define what should be done in such situations[3], and I believe that usually when the spec mandates to close the app, it would explicitly note it.
>>>
>>> However, in reality there are different types of device resets, causing different results. A reset can be precise enough to damage only the guilty context, and keep others alive.
>>>
>>> Given that, I believe drivers have the following options:
>>>
>>> a) Kill all non-robust apps after a reset. This may lead to lose work from innocent applications.
>>>
>>> b) Ignore all non-robust apps OpenGL calls. That means that applications would still be alive, but the user interface would be freeze. The user would need to close it manually anyway, but in some corner cases, the app could autosave some work or the user might be able to interact with it using some alternative method (command line?).
>>>
>>> c) Kill just the affected non-robust applications. To do that, the driver need to be 100% sure on the impact of its resets.
>>>
>>> RadeonSI currently implements a), as can be seen at [4], while Iris implements what I think it's c)[5].
>>>
>>> For the user experience point-of-view, c) is clearly the best option, but it's the hardest to archive. There's not much gain on having b) over a), perhaps it could be an optional env var for such corner case applications.
>>
>> I disagree on these conclusions.
>>
>> c) is certainly better than a), but it's not "clearly the best" in all cases. The OpenGL UMD is not a privileged/special component and is in no position to decide whether or not the process as a whole (only some thread(s) of which may use OpenGL at all) gets to continue running or not.
>>
> 
> Thank you for the feedback. How do you think the documentation should look like for this part?

The initial paragraph about robustness should say "keep OpenGL working" instead of "keep an application working". If an OpenGL context stops working, it doesn't necessarily mean the application stops working altogether.


If the application doesn't use the robustness extensions, your option b) is what should happen by default whenever possible. And it really has to be possible if the robustness extensions are supported.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

