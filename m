Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BED7B6F3C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 19:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28ACE10E2FF;
	Tue,  3 Oct 2023 17:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6902610E2FC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 17:04:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D52552B4;
 Tue,  3 Oct 2023 17:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D52552B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1696352697; bh=yfhmtqCCvv97Y2SWhdu1bHhleLPoOqHF30l72GJ9Ltk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=H/05ERPWSImHNqwm9Zq8R0utmS9epf+7PtA/NbNBp4uw/BxS+wjtzIi0PldP1COFh
 MkFuhIiYlGzA58hMCRpnhYT5MUDBXHantIdnjEiplg+OBqAEsbXvvdgy4czrH+ws4p
 YLDpwrBc1/Rvx1rEYKMJ56nADEEsKnSW1JZQb/PVzQZEJn3lTRoxWvyLNvAumh3cFm
 KJyTT8cdpe34bWGRJEi1aah7eQR3VXKs6OV3qlkDqmUP4qyZigGvkn8xXUhGKAiDGP
 F4fn3Jth6eje/gFxZlir+3YpF5isP2V7b0KhqOw/oxfmagBXBH3RDYsDfqU6Nwr3hO
 j6nN5q8SIfUbQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm: add documentation for drm_buddy_test kUnit test
In-Reply-To: <da7e150c65b85b414f2f9790e04442408678877d.1693550658.git.mchehab@kernel.org>
References: <cover.1693550658.git.mchehab@kernel.org>
 <da7e150c65b85b414f2f9790e04442408678877d.1693550658.git.mchehab@kernel.org>
Date: Tue, 03 Oct 2023 11:04:56 -0600
Message-ID: <87lecjd4cn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, David Gow <davidgow@google.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Christian =?utf-8?Q?K?= =?utf-8?Q?=C3=B6nig?= <christian.koening@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One other little thing...

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> As an example for the new documentation tool, add a documentation
> for drm_buddy_test.
>
> I opted to place this on a completely different directory, in order
> to make easier to test the feature with:
>
> 	$ make SPHINXDIRS=3D"tests" htmldocs
>
> Acked-by: Christian K=C3=B6nig <christian.koening@amd.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  Documentation/index.rst                |  2 +-
>  Documentation/tests/index.rst          |  6 ++++++
>  Documentation/tests/kunit.rst          |  5 +++++
>  drivers/gpu/drm/tests/drm_buddy_test.c | 12 ++++++++++++
>  4 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/tests/index.rst
>  create mode 100644 Documentation/tests/kunit.rst
>
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 9dfdc826618c..80a6ce14a61a 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -60,7 +60,7 @@ Various other manuals with useful information for all k=
ernel developers.
>     fault-injection/index
>     livepatch/index
>     rust/index
> -
> +   test/index

Since you called the directory "tests", this generates a couple of
warnings in the htmldocs build.

(but, again, I think it should be dev-tools/tests, and perhaps
referenced from the selftest docs already there)

jon
