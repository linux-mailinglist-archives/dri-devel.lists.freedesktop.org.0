Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5176C865
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83B610E51D;
	Wed,  2 Aug 2023 08:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6B610E51B;
 Wed,  2 Aug 2023 08:34:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RG4ys2vdcz9sTy;
 Wed,  2 Aug 2023 10:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1690965269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPZCXWwaboiCsosFBV+TGKPHI0NZRD50bC97h4h0b6M=;
 b=xrKrYKWk7/9Bk+7eCol7EaX/N4y3Pz1aH1PnjKD71QZcedm26Jh9Mm9niIonqFhr8MDYkn
 AbjGhgo3g0szGmjT/aAR+YWy764hlSZsWlQFQ4Cmjh9RAcJBUmhQxm9jAmT4sv/V8MNZBO
 UJzI35F4HJ7rIZMtfrUPGaAxwYg8WAKsHeTmdK0tIxfDLzxV1z045Yt2AkOVaq4bc77G38
 Hn+OYwq8wIhN0HgrT6P8A0NghZJOs6mmAR7VHQzyWfGdlA+qrhgdrbjYAj6c8gsFwo5USl
 8te9MAgp+Mk+D3iYHoG4S/WRdVlWsyg7dHktbEof5M2Th6a6N8G1oUqWoad6eA==
Message-ID: <a9f88c90-5777-02b0-09b1-26979432b3bc@mailbox.org>
Date: Wed, 2 Aug 2023 10:34:26 +0200
MIME-Version: 1.0
Subject: Re: Non-robust apps and resets (was Re: [PATCH v5 1/1] drm/doc:
 Document DRM device reset expectations)
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
 <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
 <a1fecc5c-30c0-2754-70a1-2edb2fe118fb@igalia.com>
 <8eb58a5f-02d0-fadf-1d5a-790b6af2d81e@mailbox.org>
 <CAAxE2A6xy5yi7yMH-tzEfC2f3AgL7aesYQNpr=1oZ8Rx0K4=Ug@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAAxE2A6xy5yi7yMH-tzEfC2f3AgL7aesYQNpr=1oZ8Rx0K4=Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6a027a11499082f043b
X-MBO-RS-META: qnjcf7y89rjz4khb5t5tdbymgemp7ina
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

On 8/2/23 09:38, Marek Olšák wrote:
> 
> The precedent from the CPU land is pretty strong here. There is
> SIGSEGV for invalid CPU memory access and SIGILL for invalid CPU
> instructions, yet we do nothing for invalid GPU memory access and
> invalid GPU instructions. Sending a terminating signal from the kernel
> would be the most natural thing to do.

After an unhandled SIGSEGV or SIGILL, the process is in an inconsistent state and cannot safely continue executing. That's why the process is terminated by default in those cases.

The same is not true when an OpenGL context stops working. Any threads / other parts of the process not using that OpenGL context continue working normally. And any attempts to use that OpenGL context can be safely ignored (or the OpenGL implementation couldn't support the robustness extensions).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

