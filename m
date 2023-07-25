Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45471761929
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 15:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E631810E137;
	Tue, 25 Jul 2023 13:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C718B10E135;
 Tue, 25 Jul 2023 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vHFIoFaUOYTxKtsOTYJhM5rII5a+WpXzT2eCn/B2n6k=; b=SwYU54Kz4a5uv9Oj9TDviSYGoF
 GWrkAtz7jk7HbU1uIp9vw9s9+Tb190htxJLzlDQ8iRMw3cqV9YzkkVluyF+eTlPLyEqSznaa3VF5O
 FBFTCJRcwEawjKiAzRgdA8lSrrG4qJzGf22F5Vreuk7xTR1TEr1mDuFx9CBh8tMgO1OX74Mdn+25+
 rSBh60ZYpvWmviJEa0KdXdfqgId1rwvJzU3Ip/RLtsGCS0ZmtDSMx4eus7mEnlj088pahanY/HB4H
 5HvWbbIbeenkuVlxuCzCSP2gm5iQYCrQvqZCAOsWE6g+MaCvN81yOyV6Fxtv0x55mSbpGg4dwyQTz
 xrQr6bMw==;
Received: from [189.111.93.147] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qOHgC-003dOU-Jz; Tue, 25 Jul 2023 15:02:20 +0200
Message-ID: <a1fecc5c-30c0-2754-70a1-2edb2fe118fb@igalia.com>
Date: Tue, 25 Jul 2023 10:02:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Non-robust apps and resets (was Re: [PATCH v5 1/1] drm/doc:
 Document DRM device reset expectations)
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
 <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: pierre-eric.pelloux-prayer@amd.com, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

Em 25/07/2023 05:03, Michel Dänzer escreveu:
> On 7/25/23 04:55, André Almeida wrote:
>> Hi everyone,
>>
>> It's not clear what we should do about non-robust OpenGL apps after GPU resets, so I'll try to summarize the topic, show some options and my proposal to move forward on that.
>>
>> Em 27/06/2023 10:23, André Almeida escreveu:
>>> +Robustness
>>> +----------
>>> +
>>> +The only way to try to keep an application working after a reset is if it
>>> +complies with the robustness aspects of the graphical API that it is using.
>>> +
>>> +Graphical APIs provide ways to applications to deal with device resets. However,
>>> +there is no guarantee that the app will use such features correctly, and the
>>> +UMD can implement policies to close the app if it is a repeating offender,
>>> +likely in a broken loop. This is done to ensure that it does not keep blocking
>>> +the user interface from being correctly displayed. This should be done even if
>>> +the app is correct but happens to trigger some bug in the hardware/driver.
>>> +
>> Depending on the OpenGL version, there are different robustness API available:
>>
>> - OpenGL ABR extension [0]
>> - OpenGL KHR extension [1]
>> - OpenGL ES extension  [2]
>>
>> Apps written in OpenGL should use whatever version is available for them to make the app robust for GPU resets. That usually means calling GetGraphicsResetStatusARB(), checking the status, and if it encounter something different from NO_ERROR, that means that a reset has happened, the context is considered lost and should be recreated. If an app follow this, it will likely succeed recovering a reset.
>>
>> What should non-robustness apps do then? They certainly will not be notified if a reset happens, and thus can't recover if their context is lost. OpenGL specification does not explicitly define what should be done in such situations[3], and I believe that usually when the spec mandates to close the app, it would explicitly note it.
>>
>> However, in reality there are different types of device resets, causing different results. A reset can be precise enough to damage only the guilty context, and keep others alive.
>>
>> Given that, I believe drivers have the following options:
>>
>> a) Kill all non-robust apps after a reset. This may lead to lose work from innocent applications.
>>
>> b) Ignore all non-robust apps OpenGL calls. That means that applications would still be alive, but the user interface would be freeze. The user would need to close it manually anyway, but in some corner cases, the app could autosave some work or the user might be able to interact with it using some alternative method (command line?).
>>
>> c) Kill just the affected non-robust applications. To do that, the driver need to be 100% sure on the impact of its resets.
>>
>> RadeonSI currently implements a), as can be seen at [4], while Iris implements what I think it's c)[5].
>>
>> For the user experience point-of-view, c) is clearly the best option, but it's the hardest to archive. There's not much gain on having b) over a), perhaps it could be an optional env var for such corner case applications.
> 
> I disagree on these conclusions.
> 
> c) is certainly better than a), but it's not "clearly the best" in all cases. The OpenGL UMD is not a privileged/special component and is in no position to decide whether or not the process as a whole (only some thread(s) of which may use OpenGL at all) gets to continue running or not.
> 

Thank you for the feedback. How do you think the documentation should 
look like for this part?
