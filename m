Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13477543D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 09:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95B610E24C;
	Wed,  9 Aug 2023 07:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1BC10E24C;
 Wed,  9 Aug 2023 07:35:16 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RLMKD6qZSz9v00;
 Wed,  9 Aug 2023 09:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1691566512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEzjFcmaNxZugcucpOuDAjcZ34NVz+o1bZiw2+i32OM=;
 b=R29Dtl0S1qAUj0JAGUt5pGA9u6ILeV85p8T9JYHMhnC39jns2UGHKleZmk9QQkcRvBTO6p
 kZoX0MI7lTOEcraNsrKV+d+NLtyjTreUK8LAhKwxzmhY8mypZXp7PWl7OoBh1hOHG98qx2
 /XrF/03v7niPWKnhZWewyn+1NIHMIG5qCKJKq0pYb9riQiP7Aqe/aLYPR4QHoGzRLYYSDX
 NaCkb/sNVuqyKCZpk2zu5K4dmiIET8vgHUaOQpIYvmcz+zoPMEzIdf/AbOijzqLA2e1upb
 29G0gcGn6yxfM+fRNZlDaZku0TEPvK4f8AC44UMK+wC/VlhkWp9IihoJLNiwSg==
Message-ID: <3ca7a141-1385-351e-9186-00874e254165@mailbox.org>
Date: Wed, 9 Aug 2023 09:35:10 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <ZMz3IXIzXS5gNK3G@phenom.ffwll.local>
 <CA+hFU4wbn=efbS10c14A9sLTf9GYJ_O12kowh76ELLdo2+x5fA@mail.gmail.com>
 <CAAxE2A48uybsU6DY+fLTzQ9K2b0Ln+SW6bt3capbGAGb7L8fvQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAAxE2A48uybsU6DY+fLTzQ9K2b0Ln+SW6bt3capbGAGb7L8fvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2bdccb62d3f6edce11c
X-MBO-RS-META: xh66k1zp6rbw13e8n5k4ceq5xbddgups
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
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/8/23 19:03, Marek Olšák wrote:
> It's the same situation as SIGSEGV. A process can catch the signal,
> but if it doesn't, it gets killed. GL and Vulkan APIs give you a way
> to catch the GPU error and prevent the process termination. If you
> don't use the API, you'll get undefined behavior, which means anything
> can happen, including process termination.

Got a spec reference for that?

I know the spec allows process termination in response to e.g. out of bounds buffer access by the application (which corresponds to SIGSEGV). There are other causes for GPU hangs though, e.g. driver bugs. The ARB_robustness spec says:

    If the reset notification behavior is NO_RESET_NOTIFICATION_ARB,
    then the implementation will never deliver notification of reset
    events, and GetGraphicsResetStatusARB will always return
    NO_ERROR[fn1].
       [fn1: In this case it is recommended that implementations should
        not allow loss of context state no matter what events occur.
        However, this is only a recommendation, and cannot be relied
        upon by applications.]

No mention of process termination, that rather sounds to me like the GL implementation should do its best to keep the application running.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

