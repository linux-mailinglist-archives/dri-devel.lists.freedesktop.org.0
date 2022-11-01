Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B053614AAD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8D810E3B9;
	Tue,  1 Nov 2022 12:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2147510E3A1;
 Tue,  1 Nov 2022 12:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667305790; x=1698841790;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVyJ7eKhdwkHC5O2oGG3qWa0Uq/lk+yFizhB5oFvMS4=;
 b=T8tmg9gjbwfjDYBcbjFWTTqWgdJ8AcLNFbZndSsQd501BtzJWk4lj4dH
 q7PPUd4bwpUWBjihuTD4UMyQf155ktB+FRCK44FlBhGlE8EwINtsWKYR3
 DmsIXvDfdVjfMd/LZ29Q4bGFAS6ihL1abdpjj9vhVjWLbP2NnufwVcwlv
 bJV5U0RJEpkI7XAFeSov2FJuIWoYGdjyMwiuHhnZHjPoH8I567eqw9NHH
 GFU+E2eo69MtAcGBOBZfXu7hNGItEtVmGAgQ5OkpOaXXSSIRKmQQFL9ig
 Mcx/XK+Y3oaN0rh0XvI1KMWwZWF97Hi8SkWTp9t/R0HyC+bsxOXhblOnH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="371205688"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="371205688"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 05:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="665134700"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="665134700"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 01 Nov 2022 05:29:45 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.29.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 947AE580AA7;
 Tue,  1 Nov 2022 05:29:39 -0700 (PDT)
Date: Tue, 1 Nov 2022 13:29:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: David Gow <davidgow@google.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility
 for KUnit
Message-ID: <20221101132936.4c936414@maurocar-mobl2>
In-Reply-To: <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
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
Cc: Shuah Khan <skhan@linuxfoundation.org>, magalilemes00@gmail.com,
 =?UTF-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 n@nfraprado.net, Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Sep 2022 14:37:06 +0800
David Gow <davidgow@google.com> wrote:

> On Mon, Aug 29, 2022 at 8:10 AM Isabella Basso <isabbasso@riseup.net> wrote:
> >
> > This adds functions for both executing the tests as well as parsing (K)TAP
> > kmsg output, as per the KTAP spec [1].
> >
> > [1] https://www.kernel.org/doc/html/latest/dev-tools/ktap.html
> >
> > Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> > ---  
> 
> Thanks very much for sending these patches out again.
> 
> Alas, I don't have a particularly useful igt setup to test this
> properly, but I've left a couple of notes from trying it on my laptop
> here.
> 
> 
> >  lib/igt_kmod.c | 290 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_kmod.h |   2 +
> >  2 files changed, 292 insertions(+)
> >
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 97cac7f5..93cdfcc5 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -25,6 +25,7 @@
> >  #include <signal.h>
> >  #include <errno.h>
> >  #include <sys/utsname.h>
> > +#include <limits.h>
> >
> >  #include "igt_aux.h"
> >  #include "igt_core.h"
> > @@ -32,6 +33,8 @@
> >  #include "igt_sysfs.h"
> >  #include "igt_taints.h"
> >
> > +#define BUF_LEN 4096
> > +
> >  /**
> >   * SECTION:igt_kmod
> >   * @short_description: Wrappers around libkmod for module loading/unloading
> > @@ -713,6 +716,293 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
> >         kmod_module_info_free_list(pre);
> >  }
> >
> > +/**
> > + * lookup_value:
> > + * @haystack: the string to search in
> > + * @needle: the string to search for
> > + *
> > + * Returns: the value of the needle in the haystack, or -1 if not found.
> > + */
> > +static long lookup_value(const char *haystack, const char *needle)
> > +{
> > +       const char *needle_rptr;
> > +       char *needle_end;
> > +       long num;
> > +
> > +       needle_rptr = strcasestr(haystack, needle);
> > +
> > +       if (needle_rptr == NULL)
> > +               return -1;
> > +
> > +       /* skip search string and whitespaces after it */
> > +       needle_rptr += strlen(needle);
> > +
> > +       num = strtol(needle_rptr, &needle_end, 10);
> > +
> > +       if (needle_rptr == needle_end)
> > +               return -1;
> > +
> > +       if (num == LONG_MIN || num == LONG_MAX)
> > +               return 0;
> > +
> > +       return num > 0 ? num : 0;
> > +}
> > +
> > +static int find_next_tap_subtest(char *record, char *test_name,
> > +                                bool is_subtest)
> > +{
> > +       const char *name_lookup_str,
> > +             *lend, *version_rptr, *name_rptr;
> > +       long test_count;
> > +
> > +       name_lookup_str = "test: ";
> > +
> > +       version_rptr = strcasestr(record, "TAP version ");
> > +       name_rptr = strcasestr(record, name_lookup_str);
> > +
> > +       /*
> > +        * total test count will almost always appear as 0..N at the beginning
> > +        * of a run, so we use it as indication of a run
> > +        */
> > +       test_count = lookup_value(record, "..");
> > +
> > +       /* no count found, so this is probably not starting a (sub)test */
> > +       if (test_count < 0) {
> > +               if (name_rptr != NULL) {
> > +                       if (test_name[0] == '\0')
> > +                               strncpy(test_name,
> > +                                       name_rptr + strlen(name_lookup_str),
> > +                                       BUF_LEN);
> > +                       else if (strcmp(test_name, name_rptr + strlen(name_lookup_str)) == 0)
> > +                               return 0;
> > +                       else
> > +                               test_name[0] = '\0';
> > +
> > +               }
> > +               return -1;
> > +       }
> > +
> > +       /*
> > +        * "(K)TAP version XX" should be the first line on all (sub)tests as per
> > +        * https://www.kernel.org/doc/html/latest/dev-tools/ktap.html#version-lines
> > +        * but actually isn't, as it currently depends on whoever writes the
> > +        * test to print this info  
> 
> FYI: we're really trying to fix cases of "missing version lines",
> largely by making the kunit_test_suites() macro work in more
> circumstances.
> 
> So while it may be worth still handling the case where this is
> missing, I don't think there are any tests in the latest versions of
> the kernel which should have this missing.

That doesn't seem to be the case, at least when the tests are loaded
as module.

I'm working on adding more KUnit tests. At least here, TAP version
doesn't appear before the tests (I'm using drm-tip + my KUnit tests):

	$ dmesg|grep TAP
	[    7.597592] TAP version 14
	$ sudo lcov -z && sudo modprobe test-i915-mock && sudo IGT_KERNEL_TREE=~/linux ~/igt/scripts/code_cov_capture mock_selftest && sudo rmmod test-i915-mock
	Auto-detecting gcov kernel support.
	Found upstream gcov kernel support at /sys/kernel/debug/gcov
	Resetting kernel execution counters
	Done.
	[3734.23]     Code coverage wrote to mock_selftest.info
	$ sudo ./tools/testing/kunit/kunit.py parse /var/log/dmesg
	[12:15:50] ============================================================
	[12:15:50] [ERROR] Test: main: 0 tests run!
	[12:15:50] ============================================================
	[12:15:50] Testing complete. Ran 0 tests: errors: 1

In order for kunit.py KTAP parser to work, I have to cheat by doing:

	$ (dmesg|grep "TAP version"; dmesg|grep -A9999 intel_i915_mock) >logs 
	$ ./tools/testing/kunit/kunit.py parse logs

> > +       /* The kunit module is required for running any kunit tests */
> > +       if (igt_kmod_load("kunit", NULL) != 0) {
> > +               igt_warn("Unable to load kunit module\n");
> > +               goto unload;
> > +       }  
> 
> Do you want to _require_ KUnit be built as a module, rather than built-in here?

I guess it doesn't matter much, for kunit module.

On KUnit test modules themselves, we need to be able to do module
unload/reload, as some IGT tests check or need to do module unload/reload. 

> Equally, does this need to mark a failure (or at least "SKIPPED")
> rather than success, in the case it fails.

Agreed.

> > +
> > +       if (igt_kmod_load(module_name, opts) != 0) {
> > +               igt_warn("Unable to load %s module\n", module_name);
> > +               goto unload;
> > +       }  
> 
> As above, should this record a failure, or skip?

Yes, it should be a failure.

> > +
> > +       igt_kunit_subtests(tst.kmsg, record, &sublevel, &failed_tests);
> > +unload:
> > +       igt_kmod_unload("kunit", 0);  
> 
> Do you want to unconditionally unload the KUnit module here? It's safe
> (maybe even safer) to leave it loaded between runs of KUnit tests.

Agreed.

Regards,
Mauro
