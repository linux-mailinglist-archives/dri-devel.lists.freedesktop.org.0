Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D7DB33D44
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7138610E436;
	Mon, 25 Aug 2025 10:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="pn8CoyxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767F710E436
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1756119284; x=1756724084; i=markus.elfring@web.de;
 bh=wabKQd4DE41XkR0sN/uAtt6QH6z+U/z7ulwnz6qzfIo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pn8CoyxTWDBlZT6/ZhYB/rI05tEOGWJ2CTaRBVoh9NhXXPNOycU5YF+GkpLBnAIx
 uHhwgdvQsB4BRI71eJorUgzOAxjELqPuvN+5/GktRPkk4iDe9xsHUrLZ7w81uZicA
 rjkYg9LctKoQuzbL5klibYOyhLB1t9kT7C+RcNhjEJrJ39KU3/1vPEhcLR/p6DIVc
 SNYOvQMGv2KAwze9CrAC/xlbxKobfj/iWuv30exXQdZ7vY0oVqc6ASWotfJZKPemV
 oqiw1ALeP/q6duK+nN8V+MCC2O1MRVITlLeUFQ7y000oMku2g1Qz7im77VSDSbZxp
 6meschqXQwqBGPhaag==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.250]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5CQh-1uPRDw3vTJ-011XI1; Mon, 25
 Aug 2025 12:48:34 +0200
Message-ID: <697bb91b-24ea-4830-8794-373f709aa37e@web.de>
Date: Mon, 25 Aug 2025 12:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/sched/tests: Remove redundant header files
To: Philipp Stanner <phasta@kernel.org>, Liao Yuanhong
 <liaoyuanhong@vivo.com>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250819142630.368796-1-liaoyuanhong@vivo.com>
 <acb4e709-a42f-4591-a406-7745bcd0422f@web.de>
 <119cb44579d745ad3e47d649e6ee6fea9fd9d146.camel@mailbox.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <119cb44579d745ad3e47d649e6ee6fea9fd9d146.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6gKGYGUplaIJxBQreSyssaIBngSiTzFnHMt7//DE487Rg2cg3hM
 PHlE4hJbLIVxieWnFZJM51OkEYALP9gjSZ7nlLz8aJ8pP5ZAKgEWiD/EJ5Awh+nLL1Lt+en
 6Q2zHPBlv95NeQZcwQoU2Hg7mvgQ34+Mka3m8ZNOCsqRw0os9+PT+s23Ao5NVzIGDTWO0Fj
 WwTc4UV16wD3IdFeuh94g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wcQTbwYci88=;HkatEeI4c2w1dRsPu4jnakKcri4
 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
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

>>> The header file <linux/atomic.h> is already included on line 8. Remove=
 the
>>> redundant include.
>>
>> You would like to omit a duplicate #include directive, don't you?

The change intention is probably clear.


>> Will a corresponding refinement become helpful for the summary phrase
>> and change description?
>=20
> I don't understand what you mean. Can you elaborate?
>=20
> Both patch content and description are completely fine as far as I'm con=
cerned.

How do you think about to distinguish better between the deletion of heade=
r files
and an adjustment for a repeated preprocessor directive?

Regards,
Markus
