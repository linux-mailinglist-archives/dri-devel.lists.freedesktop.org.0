Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84738871E73
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 13:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CC2112A65;
	Tue,  5 Mar 2024 12:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lCbW5Fku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Tue, 05 Mar 2024 12:01:28 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E64112A65
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 12:01:28 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Tpv9Y2RPSz9sdN;
 Tue,  5 Mar 2024 12:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1709639649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HiRlMg6h832yaauOUM6BWIgl8Xd8q3pgd4fABlp2sNE=;
 b=lCbW5Fkub4izG2Oae+U/G280FBsPwV8XxqT1+OYlgVxXYXzDihADmuze4xgdqFMYUvK8rW
 oJyybsoihkw07bNiavbIs7msvfck72PWOOWrJpj3uur04l60nNW4XiNT2MazDIG2W2VARa
 +a8hijWBWxiv34doewuhy6xQPcrV4jS9lUt20cdGct+RgK5pnbrx7WDxxZ0dr6/q9A1yh4
 UgG1XdhWaaoGRB/8J1rihDNeV2+oRpWWFVIc/Nt6eGR+1qHXm5ZO4ZvRGinB7ysS0kj2pb
 UBuAw51IIfos4Ml37c6FKtD7AeZDaY9K5+q/oTSvnBtn6WL4wk/D5xFyZVwu6A==
Message-ID: <2c828aa1-d9bb-4b27-844b-a098e206318f@mailbox.org>
Date: Tue, 5 Mar 2024 12:54:01 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: iuhiedtbyd865d5er91f663bapgj73ny
X-MBO-RS-ID: 76dfc0d5d612d7f2266
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

On 2024-02-29 21:21, Linus Torvalds wrote:
> On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>>
>> However, I think a better approach would be *not* to add the .gitlab-ci.yaml
>> file in the root of the source tree, but instead change the very same repo
>> setting to point to a particular entry YAML, *inside* the repo (somewhere
>> under "ci" directory) instead.
> 
> I really don't want some kind of top-level CI for the base kernel project.
> 
> We already have the situation that the drm people have their own ci
> model. II'm ok with that, partly because then at least the maintainers
> of that subsystem can agree on the rules for that one subsystem.
> 
> I'm not at all interested in having something that people will then
> either fight about, or - more likely - ignore, at the top level
> because there isn't some global agreement about what the rules are.
> 
> For example, even just running checkpatch is often a stylistic thing,
> and not everybody agrees about all the checkpatch warnings.
> 
> I would suggest the CI project be separate from the kernel.

That would be missing a lot of the point / benefit of CI.

A CI system which is separate from the kernel will tend to be out of sync, so it can't gate the merging of changes and thus can't prevent regressions from propagating.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

