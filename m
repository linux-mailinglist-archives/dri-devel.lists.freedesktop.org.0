Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B77B6F2E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 19:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7794510E2FA;
	Tue,  3 Oct 2023 17:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66C10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 17:00:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 3AF4C6E2;
 Tue,  3 Oct 2023 17:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3AF4C6E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1696352421; bh=90J31QEv8FGbWrRzoVwWZcTEzbXsi3Oh57o8nNW1+jU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Jv8wpMpY8gVh2mxKuopxJuPeE2oQ+5goX2MIa+p5pyooDgBitxunGJNmev59New5c
 X1dUpnyswLMSeqG1tYa5ubuQrWBX4xfGOfxGeYk8rBE62UIZGYUMMXM4Rod4PHhdSL
 yBzjtYL/zAoJCiDDia9BRgqDcm2D5gG15bYH2ixnbRGWeIplTynIFvGDotZMgQfm5F
 oj6MVXdCt5fyGlcmFrIlbaDvMmbr+gqLiQAY5NjLvzSoDdOEeaQiEJpSBzl0wjuECe
 rFHKA9AlXox3/bf0237lwnitDSge9UuZmQXN1+H8CJAd+sC/hBe6qSpv2l+R6T+AnY
 yxaYoq1/b4KZA==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/2] Add support for inlined documentation for kunit and
 kselftests
In-Reply-To: <cover.1693550658.git.mchehab@kernel.org>
References: <cover.1693550658.git.mchehab@kernel.org>
Date: Tue, 03 Oct 2023 11:00:20 -0600
Message-ID: <87pm1vd4kb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> This is a follow-up of the discussions taken here:
>
>    https://lore.kernel.org/linux-doc/20230704132812.02ba97ba@maurocar-mobl2/T/#t
>
> I sent a previous version as RFC. This is basically what we had there, with some
> improvements at test_list.py.
>
> It adds a new extension that allows documenting tests using the same tool we're
> using for DRM unit tests at IGT GPU tools: https://gitlab.freedesktop.org/drm/igt-gpu-tools.
>
> While kernel-doc has provided documentation for in-lined functions/struct comments,
> it was not meant to document tests.
>
> Tests need to be grouped by the test functions. It should also be possible to produce
> other outputs from the documentation, to integrate it with test suites. For instance, 
> Internally at Intel, we use the comments to generate DOT files hierarchically grouped
> per feature categories.
>
> This is meant to be an initial series to start documenting kunit.

I've played with this a bit...a couple of quick impressions:

- That's quite a chunk of Python code to be adding.  I've not yet had
  the chance to read it through properly, will hopefully be able to do
  so soon.  A bit more commenting would not have gone amiss here...

- I kind of think that this should go under dev-tools rather than being
  a new top-level directory.  Is there a reason not to put it there?

Thanks,

jon
