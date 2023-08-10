Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC62777168
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8496410E4D3;
	Thu, 10 Aug 2023 07:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86910E4D3;
 Thu, 10 Aug 2023 07:33:55 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4RLzFD0594z9sSN;
 Thu, 10 Aug 2023 09:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1691652832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kO91zdzhxanEBFqk2+XfHfxHDjDWHOzAnP1IEWCqVA=;
 b=AEVWOGGR8/yhmcHJ2oJl5zhMmvXnLH7yJSiV09svBXyKk0FEV+3pzTAEzPQ45mSmNHaIfO
 K4vu//fN+r39zx+ICKVbBMGkiMxgh6lCgj/W/+Y3Ya0bPb2jU6P+mw3n3zOwt45SIXw/y6
 YERZjJ6mtKtkohUB7tbpxBJ3+F4ixe/sRSuN/IyukyOHEkqy5FV++rNtUvAa96r7W0pDSw
 CbFDW2Yh6NPE8Bwa9OMj1+X1ESeaLsqWua8pTNi+gkdOmqKgjxiKNKsjg/ZmPCEjnxB+ej
 +eeJH1uGk8toay0/TNnNmcaA4vSQUHMbQOWR9NrPmfUhlcypNZcG54vjz+mGsw==
Message-ID: <ccd5ca3a-f5f2-2601-9f6d-7005bd9f7f66@mailbox.org>
Date: Thu, 10 Aug 2023 09:33:47 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <ZMz3IXIzXS5gNK3G@phenom.ffwll.local>
 <CA+hFU4wbn=efbS10c14A9sLTf9GYJ_O12kowh76ELLdo2+x5fA@mail.gmail.com>
 <CAAxE2A48uybsU6DY+fLTzQ9K2b0Ln+SW6bt3capbGAGb7L8fvQ@mail.gmail.com>
 <3ca7a141-1385-351e-9186-00874e254165@mailbox.org>
 <CAAxE2A5pgwb-xLDzr9XyMp-1k7oFUWR9X812b17LSb98RTFKhA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAAxE2A5pgwb-xLDzr9XyMp-1k7oFUWR9X812b17LSb98RTFKhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 36edb37f26a661c29d2
X-MBO-RS-META: uxaa54m9bc6urrh93kfgws1pkrjfkjch
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
 Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/9/23 21:15, Marek Olšák wrote:
> On Wed, Aug 9, 2023 at 3:35 AM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>> On 8/8/23 19:03, Marek Olšák wrote:
>>> It's the same situation as SIGSEGV. A process can catch the signal,
>>> but if it doesn't, it gets killed. GL and Vulkan APIs give you a way
>>> to catch the GPU error and prevent the process termination. If you
>>> don't use the API, you'll get undefined behavior, which means anything
>>> can happen, including process termination.
>>
>> Got a spec reference for that?
>>
>> I know the spec allows process termination in response to e.g. out of bounds buffer access by the application (which corresponds to SIGSEGV). There are other causes for GPU hangs though, e.g. driver bugs. The ARB_robustness spec says:
>>
>>     If the reset notification behavior is NO_RESET_NOTIFICATION_ARB,
>>     then the implementation will never deliver notification of reset
>>     events, and GetGraphicsResetStatusARB will always return
>>     NO_ERROR[fn1].
>>        [fn1: In this case it is recommended that implementations should
>>         not allow loss of context state no matter what events occur.
>>         However, this is only a recommendation, and cannot be relied
>>         upon by applications.]
>>
>> No mention of process termination, that rather sounds to me like the GL implementation should do its best to keep the application running.
> 
> It basically says that we can do anything.

Not really? If program termination is a possible outcome, the spec otherwise mentions that explicitly, ala "including program termination".


> A frozen window or flipping between 2 random frames can't be described
> as "keeping the application running".

This assumes that an application which uses OpenGL cannot have any other purpose than using OpenGL.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

