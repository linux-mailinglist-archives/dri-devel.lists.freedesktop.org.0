Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C424B75176C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 06:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADB510E069;
	Thu, 13 Jul 2023 04:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5896310E069
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 04:25:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D2A160C4B;
 Thu, 13 Jul 2023 04:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5908C433C7;
 Thu, 13 Jul 2023 04:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689222350;
 bh=u4ObmBjWWEjtYN2BEoY8jv0w35xDE9vIX1JBcp1KKDc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZndtOW2vmZgQOuJIyHHJixv7tYMcv5W7l+9b/ssfJyRFWFGQvydjk7Lo5yuvVZZRe
 hQOh3j5XdHy9IuSfE3IHP55VMQk3Rz6NIXDj3fNHylaT6ZX2l1tmT5EBi4MG/D5YUw
 zmpfD3tzoRUGyW86sHDKOAzFSToTLYIsJZQj877Gg3r5ab7XWcaLxiVsldytmBmGk0
 YltNHHsa/ttF93HkRqUgj/eB9J+MQ9MHDhvmDYEFZ+u4ETq/Sk5xD/yhlYsjU/kkRP
 AfslbxtEsGkaMj8rbO0Uxu/zsEbg6KgvJ9OugElyJzjNh718fZkDiELC10ZWbyNPU6
 ZsnsLxQ+6j0Xw==
Date: Thu, 13 Jul 2023 06:25:42 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH RFC 2/2] drm: add documentation for drm_buddy_test kUnit
 test
Message-ID: <20230713062542.183c0aaa@coco.lan>
In-Reply-To: <87cz0xgokb.fsf@intel.com>
References: <cover.1689171160.git.mchehab@kernel.org>
 <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
 <87cz0xgokb.fsf@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kselftest@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kees Cook <keescook@chromium.org>, Nikolai Kondrashov <spbnick@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-doc@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 Rae Moar <rmoar@google.com>, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, mauro.chehab@intel.com,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Christian =?UTF-8?B?S8O2?= =?UTF-8?B?bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Wed, 12 Jul 2023 18:03:00 +0300
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Wed, 12 Jul 2023, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> > index 09ee6f6af896..dd6c5afd6cd6 100644
> > --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> > +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> > @@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct kunit_suite *suite)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * KTEST_SUITE: set of tests for drm buddy alloc
> > + * Scope: drm subsystem
> > + * Mega feature: drm
> > + * Feature: buddy_alloc
> > + *
> > + * KTEST_TEST: drm_test_buddy_alloc_%s
> > + * Description: Run DRM buddy allocation %arg[1] test
> > + *
> > + * arg[1].values: limit, range, optimistic, smoke, pathological
> > + */
> > +  
> 
> "/**" indicates a kernel-doc comment, and this is not a kernel-doc
> comment.
> 
> $ scripts/kernel-doc -none drivers/gpu/drm/tests/drm_buddy_test.c 
> drivers/gpu/drm/tests/drm_buddy_test.c:752: warning: cannot understand
> function prototype: 'struct kunit_case drm_buddy_tests[] = '
> 
> Nowadays kernel-doc is part of W=1 builds.

True. I already told it at patch 0. I opted to not add a patch for it on this
RFC series, to make it simpler. A simple logic at kernel-doc is enough to 
tell its state machine to ignore blocks that contain the KTEST_\w+: pattern:

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d0116c6939dc..bf386460691f 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -259,6 +259,7 @@ my $doc_sect = $doc_com .
     '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:([^:].*)?$';
 my $doc_content = $doc_com_body . '(.*)';
 my $doc_block = $doc_com . 'DOC:\s*(.*)?';
+my $ktest_block = $doc_com . 'KTEST_\w+:\s*(.*)?';
 my $doc_inline_start = '^\s*/\*\*\s*$';
 my $doc_inline_sect = '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
 my $doc_inline_end = '^\s*\*/\s*$';
@@ -2015,6 +2016,10 @@ sub process_name($$) {
     my $file = shift;
     my $descr;
 
+    if (/$ktest_block/o) {
+	$state = STATE_NORMAL;
+	return;
+    }
     if (/$doc_block/o) {
 	$state = STATE_DOCBLOCK;
 	$contents = "";



Thanks,
Mauro
