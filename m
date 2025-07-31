Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FFB176C6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 21:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB85710E7DB;
	Thu, 31 Jul 2025 19:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ixd0m60x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CA310E7DF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 19:49:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-61543b05b7cso2760a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 12:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753991396; x=1754596196;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w0NmmPrgKMAdI4zT8cKWXm7HR1XmVftYuLV66NFbboQ=;
 b=ixd0m60x9A333nRNRZRgIT4FzqTzhBqxfdCSY3/CZgbcGTu2i2as/k5EjhLVDwCRE9
 H3Hm9tmW35AxhdtEmzOI61PHKRNoGt899lREicObsqK7rt797Dg3lvWgjtj0VIeZNiSI
 DqeDVsSXSS1GUx/O9SFGFj74b/VLWaANBlJc7qninqYv3/y2ULqejxbYNRgaRuKFYyOD
 7wFvHy35ZUvRQL+ofr+G3HuKRKYab6k6oMjq530EDyR613AZerRyT9nPmKZKhFR6ASLV
 Sr1biFr3rWoMdLz2Z1Mr536Knozl12DLP7wSiYlwklh+oPjzRlIadMm/lUWX6DEj8b67
 WFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753991396; x=1754596196;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0NmmPrgKMAdI4zT8cKWXm7HR1XmVftYuLV66NFbboQ=;
 b=gGO2T8OjQg+u9pmnp1FWeGJ5igcavTdkMV2xmvbIgHDrdAUfP6eouLEjRpfAELD6S1
 MjeK7Fc72CGXSWsjd1saMug7aUP5h61qfVPgDsdI43EHuXbmHiNbgqneTYNBJZH8r0XD
 RUnQI8FUWnqZcuotTTy9vfF/my2zhpB2rqf56lK41JiGUoLdYD7eETzVNCOudwZ3k3nt
 nvn5RpBhVI4npWZ9L+hoVHZnNJvaLpYIo4Psuf01eAY5zQNZtXFljWqQ5PPxQ9S6DPdW
 zwpKnV99nmnG3kGlDo41K5M4dNJCOkqV/FsqqamF9i3NNlLPLWZrXrYP3AM5k+5hq3pn
 gNig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXIOJvrU+GbNeXBUBi/VuJCr/q1lFQYx1KubKBQRvP5gvj6ySKEgfYrQehNlxvhUpeT3acK2a51tU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoZGzwfKUzPVk8fRs8aJeicsiS8Zh7PRsFYNBjMgeJZh844MRu
 kxeuScfXNC3bRgqY+o6gAu9Ns9HOm94MoK/YGFk/BUxeN3l+yQDLCDepejJnDwkkH+xbVnN7get
 Tt0aIMjthP0mGWO8Iy5qznXoBdlzNjJ1C47mc9O4N
X-Gm-Gg: ASbGncufmdfQdkHl5XGimZar9LC0tiY2zv2S5L8jM+mrq0oRRZwpquQ+iyKXdy/IfGU
 aZY+09E/zZzRJQxrkfdi+h7HB9zFuwRcAxT5jrG5C8u9rVzvD9IRYN1zSRiXPriIyvWD4azS8vX
 fngJSXJwFlD408u6nXf5nyopWYTQHBy5Vyvs9w5fIEWUJ1epx45lxXKBHry4NDC7uBOwWE2BphR
 CzMOn9tj5+iDuns/xMRTYGrGWGGcBN2uKdsXg==
X-Google-Smtp-Source: AGHT+IHEobKbrTSKZCGkN83GAfbPBtK7r0ACp3iFe62DoQnJeuFCDuy1TWvW86AyI6V2Iwo/t9fo+z0HLx68aeXX3B4=
X-Received: by 2002:a50:955b:0:b0:615:28c0:fac8 with SMTP id
 4fb4d7f45d1cf-615cb709cc4mr11672a12.4.1753991395595; Thu, 31 Jul 2025
 12:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-7-marievic@google.com>
 <5683507a-dacc-4e46-893f-d1e775d2ef22@suswa.mountain>
In-Reply-To: <5683507a-dacc-4e46-893f-d1e775d2ef22@suswa.mountain>
From: Marie Zhussupova <marievic@google.com>
Date: Thu, 31 Jul 2025 15:49:43 -0400
X-Gm-Features: Ac12FXy9pctOjhAPWBrCxe7TRxwbUutDqcqHowGqJpY31Ox_2dkMf4vGOaTdX74
Message-ID: <CAAkQn5KtGMYqEP07xvs5GR_5b591Lo+YPu5uT9HiduMo900Mxw@mail.gmail.com>
Subject: Re: [PATCH 6/9] kunit: Enable direct registration of parameter arrays
 to a KUnit test
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, rmoar@google.com, davidgow@google.com, 
 shuah@kernel.org, brendan.higgins@linux.dev, lkp@intel.com, 
 oe-kbuild-all@lists.linux.dev, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000137eab063b3ef2a1"
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

--000000000000137eab063b3ef2a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 11:58=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org>
wrote:

> Hi Marie,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Marie-Zhussupova/kunit-Add=
-parent-kunit-for-parameterized-test-context/20250730-033818
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> kunit
> patch link:
> https://lore.kernel.org/r/20250729193647.3410634-7-marievic%40google.com
> patch subject: [PATCH 6/9] kunit: Enable direct registration of parameter
> arrays to a KUnit test
> config: nios2-randconfig-r072-20250731 (
> https://download.01.org/0day-ci/archive/20250731/202507310854.pZvIcswn-lk=
p@intel.com/config
> )
> compiler: nios2-linux-gcc (GCC) 8.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202507310854.pZvIcswn-lkp@intel.com/
>
> New smatch warnings:
> lib/kunit/test.c:723 kunit_run_tests() error: we previously assumed
> 'test_case->generate_params' could be null (see line 714)
>
> vim +723 lib/kunit/test.c
>
> 914cc63eea6fbe Brendan Higgins     2019-09-23  681  int
> kunit_run_tests(struct kunit_suite *suite)
> 914cc63eea6fbe Brendan Higgins     2019-09-23  682  {
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  683      char
> param_desc[KUNIT_PARAM_DESC_SIZE];
> 914cc63eea6fbe Brendan Higgins     2019-09-23  684      struct kunit_case
> *test_case;
> acd8e8407b8fcc David Gow           2021-08-03  685      struct
> kunit_result_stats suite_stats =3D { 0 };
> acd8e8407b8fcc David Gow           2021-08-03  686      struct
> kunit_result_stats total_stats =3D { 0 };
> 8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  687      const void
> *curr_param;
> 914cc63eea6fbe Brendan Higgins     2019-09-23  688
> c272612cb4a2f7 David Gow           2022-07-01  689      /* Taint the
> kernel so we know we've run tests. */
> c272612cb4a2f7 David Gow           2022-07-01  690
> add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> c272612cb4a2f7 David Gow           2022-07-01  691
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  692      if
> (suite->suite_init) {
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  693
> suite->suite_init_err =3D suite->suite_init(suite);
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  694              if
> (suite->suite_init_err) {
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  695
> kunit_err(suite, KUNIT_SUBTEST_INDENT
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  696
>         "# failed to initialize (%d)", suite->suite_init_err);
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  697
> goto suite_end;
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  698              }
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  699      }
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  700
> cae56e1740f559 Daniel Latypov      2022-04-29  701
> kunit_print_suite_start(suite);
> 914cc63eea6fbe Brendan Higgins     2019-09-23  702
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  703
> kunit_suite_for_each_test_case(suite, test_case) {
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  704              struct
> kunit test =3D { .param_value =3D NULL, .param_index =3D 0 };
> acd8e8407b8fcc David Gow           2021-08-03  705              struct
> kunit_result_stats param_stats =3D { 0 };
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  706
> 887d85a0736ff3 Rae Moar            2023-03-08  707
> kunit_init_test(&test, test_case->name, test_case->log);
> 03806177fa4cbb Marie Zhussupova    2025-07-29  708
> __kunit_init_parent_test(test_case, &test);
> 03806177fa4cbb Marie Zhussupova    2025-07-29  709
> 529534e8cba3e6 Rae Moar            2023-07-25  710              if
> (test_case->status =3D=3D KUNIT_SKIPPED) {
> 529534e8cba3e6 Rae Moar            2023-07-25  711                      /=
*
> Test marked as skip */
> 529534e8cba3e6 Rae Moar            2023-07-25  712
> test.status =3D KUNIT_SKIPPED;
> 529534e8cba3e6 Rae Moar            2023-07-25  713
> kunit_update_stats(&param_stats, test.status);
> 44c50ed8e59936 Marie Zhussupova    2025-07-29 @714              } else if
> (!test_case->generate_params && !test.params_data.params) {
>
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^
> Imagine ->generate_parms is NULL but test.params_data.params is
> non-NULL.


> 37dbb4c7c7442d David Gow           2021-11-02  715                      /=
*
> Non-parameterised test. */
> 529534e8cba3e6 Rae Moar            2023-07-25  716
> test_case->status =3D KUNIT_SKIPPED;
> 37dbb4c7c7442d David Gow           2021-11-02  717
> kunit_run_case_catch_errors(suite, test_case, &test);
> 37dbb4c7c7442d David Gow           2021-11-02  718
> kunit_update_stats(&param_stats, test.status);
> 03806177fa4cbb Marie Zhussupova    2025-07-29  719              } else if
> (test_case->status !=3D KUNIT_FAILURE) {
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  720                      /=
*
> Get initial param. */
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  721
> param_desc[0] =3D '\0';
> 8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  722                      /=
*
> TODO: Make generate_params try-catch */
> 13ee0c64bd88a3 Marie Zhussupova    2025-07-29 @723
> curr_param =3D test_case->generate_params(&test, NULL, param_desc);
>
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^
> Then this could crash.
>
> I suspect that this is fine, but I bet that in the previous
> condition, just testing one would probably have been sufficient
> or maybe we could have change && to ||.
>

Hello Dan,

As of now, test.params_data.params can only be populated in a param_init
function, which can only be used if we register the test case with a
KUNIT_CASE_PARAM_WITH_INIT macro. That macro auto populates
test_case->generate_params with a function called
kunit_get_next_param_and_desc()
(which iterates over the parameter array) if the test user didn't provide
their
own generator function. So, there shouldn't be a case where
test_case->generate_params is NULL but test.params_data.params is NON-NULL.

However, to be robust, we could add a NULL check  before calling
test_case->generate_params on line 723.

Thank you!
-Marie

>
> 529534e8cba3e6 Rae Moar            2023-07-25  724
> test_case->status =3D KUNIT_SKIPPED;
> 6c738b52316c58 Rae Moar            2022-11-23  725
> kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> 6c738b52316c58 Rae Moar            2022-11-23  726
>         "KTAP version 1\n");
> 44b7da5fcd4c99 David Gow           2021-11-02  727
> kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> 44b7da5fcd4c99 David Gow           2021-11-02  728
>         "# Subtest: %s", test_case->name);
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  729
> 8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  730
> while (curr_param) {
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

--000000000000137eab063b3ef2a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"ltr"><br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jul 31, 2025 at 11:58=E2=80=AFAM Dan Carpenter &lt;<a href=3D"mailto:dan.c=
arpenter@linaro.org" target=3D"_blank">dan.carpenter@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Marie,<br=
>
<br>
kernel test robot noticed the following build warnings:<br>
<br>
<a href=3D"https://git-scm.com/docs/git-format-patch#_base_tree_information=
" rel=3D"noreferrer" target=3D"_blank">https://git-scm.com/docs/git-format-=
patch#_base_tree_information</a>]<br>
<br>
url:=C2=A0 =C2=A0 <a href=3D"https://github.com/intel-lab-lkp/linux/commits=
/Marie-Zhussupova/kunit-Add-parent-kunit-for-parameterized-test-context/202=
50730-033818" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel=
-lab-lkp/linux/commits/Marie-Zhussupova/kunit-Add-parent-kunit-for-paramete=
rized-test-context/20250730-033818</a><br>
base:=C2=A0 =C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/gi=
t/shuah/linux-kselftest.git" rel=3D"noreferrer" target=3D"_blank">https://g=
it.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git</a> kunit<=
br>
patch link:=C2=A0 =C2=A0 <a href=3D"https://lore.kernel.org/r/2025072919364=
7.3410634-7-marievic%40google.com" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lore.kernel.org/r/20250729193647.3410634-7-marievic%40google.com</a><b=
r>
patch subject: [PATCH 6/9] kunit: Enable direct registration of parameter a=
rrays to a KUnit test<br>
config: nios2-randconfig-r072-20250731 (<a href=3D"https://download.01.org/=
0day-ci/archive/20250731/202507310854.pZvIcswn-lkp@intel.com/config" rel=3D=
"noreferrer" target=3D"_blank">https://download.01.org/0day-ci/archive/2025=
0731/202507310854.pZvIcswn-lkp@intel.com/config</a>)<br>
compiler: nios2-linux-gcc (GCC) 8.5.0<br>
<br>
If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of<br>
the same patch/commit), kindly add following tags<br>
| Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" targe=
t=3D"_blank">lkp@intel.com</a>&gt;<br>
| Reported-by: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@linaro.org=
" target=3D"_blank">dan.carpenter@linaro.org</a>&gt;<br>
| Closes: <a href=3D"https://lore.kernel.org/r/202507310854.pZvIcswn-lkp@in=
tel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/r/20=
2507310854.pZvIcswn-lkp@intel.com/</a><br>
<br>
New smatch warnings:<br>
lib/kunit/test.c:723 kunit_run_tests() error: we previously assumed &#39;te=
st_case-&gt;generate_params&#39; could be null (see line 714)<br>
<br>
vim +723 lib/kunit/test.c<br>
<br>
914cc63eea6fbe Brendan Higgins=C2=A0 =C2=A0 =C2=A02019-09-23=C2=A0 681=C2=
=A0 int kunit_run_tests(struct kunit_suite *suite)<br>
914cc63eea6fbe Brendan Higgins=C2=A0 =C2=A0 =C2=A02019-09-23=C2=A0 682=C2=
=A0 {<br>
fadb08e7c7501e Arpitha Raghunandan 2020-11-16=C2=A0 683=C2=A0 =C2=A0 =C2=A0=
 char param_desc[KUNIT_PARAM_DESC_SIZE];<br>
914cc63eea6fbe Brendan Higgins=C2=A0 =C2=A0 =C2=A02019-09-23=C2=A0 684=C2=
=A0 =C2=A0 =C2=A0 struct kunit_case *test_case;<br>
acd8e8407b8fcc David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-08-03=
=C2=A0 685=C2=A0 =C2=A0 =C2=A0 struct kunit_result_stats suite_stats =3D { =
0 };<br>
acd8e8407b8fcc David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-08-03=
=C2=A0 686=C2=A0 =C2=A0 =C2=A0 struct kunit_result_stats total_stats =3D { =
0 };<br>
8631cd2cf5fbf2 Marie Zhussupova=C2=A0 =C2=A0 2025-07-29=C2=A0 687=C2=A0 =C2=
=A0 =C2=A0 const void *curr_param;<br>
914cc63eea6fbe Brendan Higgins=C2=A0 =C2=A0 =C2=A02019-09-23=C2=A0 688=C2=
=A0 <br>
c272612cb4a2f7 David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02022-07-01=
=C2=A0 689=C2=A0 =C2=A0 =C2=A0 /* Taint the kernel so we know we&#39;ve run=
 tests. */<br>
c272612cb4a2f7 David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02022-07-01=
=C2=A0 690=C2=A0 =C2=A0 =C2=A0 add_taint(TAINT_TEST, LOCKDEP_STILL_OK);<br>
c272612cb4a2f7 David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02022-07-01=
=C2=A0 691=C2=A0 <br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 692=C2=
=A0 =C2=A0 =C2=A0 if (suite-&gt;suite_init) {<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 693=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suite-&gt;suite_init_err =3D =
suite-&gt;suite_init(suite);<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 694=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (suite-&gt;suite_init_err)=
 {<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 695=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=
unit_err(suite, KUNIT_SUBTEST_INDENT<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 696=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;# failed to initialize (%d)&quot;,=
 suite-&gt;suite_init_err);<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 697=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
oto suite_end;<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 698=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 699=C2=
=A0 =C2=A0 =C2=A0 }<br>
1cdba21db2ca31 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 700=C2=
=A0 <br>
cae56e1740f559 Daniel Latypov=C2=A0 =C2=A0 =C2=A0 2022-04-29=C2=A0 701=C2=
=A0 =C2=A0 =C2=A0 kunit_print_suite_start(suite);<br>
914cc63eea6fbe Brendan Higgins=C2=A0 =C2=A0 =C2=A02019-09-23=C2=A0 702=C2=
=A0 <br>
fadb08e7c7501e Arpitha Raghunandan 2020-11-16=C2=A0 703=C2=A0 =C2=A0 =C2=A0=
 kunit_suite_for_each_test_case(suite, test_case) {<br>
fadb08e7c7501e Arpitha Raghunandan 2020-11-16=C2=A0 704=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct kunit test =3D { .param_value =3D NULL,=
 .param_index =3D 0 };<br>
acd8e8407b8fcc David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-08-03=
=C2=A0 705=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct kunit_res=
ult_stats param_stats =3D { 0 };<br>
fadb08e7c7501e Arpitha Raghunandan 2020-11-16=C2=A0 706=C2=A0 <br>
887d85a0736ff3 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-03-08=
=C2=A0 707=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kunit_init_test(=
&amp;test, test_case-&gt;name, test_case-&gt;log);<br>
03806177fa4cbb Marie Zhussupova=C2=A0 =C2=A0 2025-07-29=C2=A0 708=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __kunit_init_parent_test(test_case, =
&amp;test);<br>
03806177fa4cbb Marie Zhussupova=C2=A0 =C2=A0 2025-07-29=C2=A0 709=C2=A0 <br=
>
529534e8cba3e6 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-07-25=
=C2=A0 710=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (test_case-&g=
t;status =3D=3D KUNIT_SKIPPED) {<br>
529534e8cba3e6 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-07-25=
=C2=A0 711=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Test marked as skip */<br>
529534e8cba3e6 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-07-25=
=C2=A0 712=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 test.status =3D KUNIT_SKIPPED;<br>
529534e8cba3e6 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-07-25=
=C2=A0 713=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 kunit_update_stats(&amp;param_stats, test.status);<br>
44c50ed8e59936 Marie Zhussupova=C2=A0 =C2=A0 2025-07-29 @714=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!test_case-&gt;generate_param=
s &amp;&amp; !test.params_data.params) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^<br=
>
Imagine -&gt;generate_parms is NULL but test.params_data.params is<br>
non-NULL.</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
37dbb4c7c7442d David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-11-02=
=C2=A0 715=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Non-parameterised test. */<br>
529534e8cba3e6 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-07-25=
=C2=A0 716=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 test_case-&gt;status =3D KUNIT_SKIPPED;<br>
37dbb4c7c7442d David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-11-02=
=C2=A0 717=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 kunit_run_case_catch_errors(suite, test_case, &amp;test);<br>
37dbb4c7c7442d David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-11-02=
=C2=A0 718=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 kunit_update_stats(&amp;param_stats, test.status);<br>
03806177fa4cbb Marie Zhussupova=C2=A0 =C2=A0 2025-07-29=C2=A0 719=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (test_case-&gt;status !=3D=
 KUNIT_FAILURE) {<br>
fadb08e7c7501e Arpitha Raghunandan 2020-11-16=C2=A0 720=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get initial par=
am. */<br>
fadb08e7c7501e Arpitha Raghunandan 2020-11-16=C2=A0 721=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 param_desc[0] =3D =
&#39;\0&#39;;<br>
8631cd2cf5fbf2 Marie Zhussupova=C2=A0 =C2=A0 2025-07-29=C2=A0 722=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO:=
 Make generate_params try-catch */<br>
13ee0c64bd88a3 Marie Zhussupova=C2=A0 =C2=A0 2025-07-29 @723=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curr_param =
=3D test_case-&gt;generate_params(&amp;test, NULL, param_desc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
Then this could crash.<br>
<br>
I suspect that this is fine, but I bet that in the previous<br>
condition, just testing one would probably have been sufficient<br>
or maybe we could have change &amp;&amp; to ||.<br></blockquote><div><br></=
div><div>Hello Dan,</div><div><br></div><div>As of now, test.params_data.pa=
rams can only be populated in a param_init</div><div>function, which can on=
ly be used if we register the test case with a=C2=A0</div><div>KUNIT_CASE_P=
ARAM_WITH_INIT macro. That macro auto populates=C2=A0</div><div>test_case-&=
gt;generate_params with a function called kunit_get_next_param_and_desc()=
=C2=A0</div><div>(which iterates over the parameter array) if the test user=
 didn&#39;t provide their=C2=A0</div><div>own generator function. So, there=
 shouldn&#39;t be a case where=C2=A0</div><div>test_case-&gt;generate_param=
s is NULL but test.params_data.params is NON-NULL.=C2=A0</div><div><br></di=
v><div>However, to be robust, we could add a NULL check=C2=A0 before callin=
g=C2=A0</div><div>test_case-&gt;generate_params on line 723.</div><div><br>=
</div><div>Thank you!</div><div>-Marie</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
529534e8cba3e6 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-07-25=
=C2=A0 724=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 test_case-&gt;status =3D KUNIT_SKIPPED;<br>
6c738b52316c58 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2022-11-23=
=C2=A0 725=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 kunit_log(KERN_INFO, &amp;test, KUNIT_SUBTEST_INDENT KUNIT_SU=
BTEST_INDENT<br>
6c738b52316c58 Rae Moar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2022-11-23=
=C2=A0 726=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;KTAP version 1\n&quo=
t;);<br>
44b7da5fcd4c99 David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-11-02=
=C2=A0 727=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 kunit_log(KERN_INFO, &amp;test, KUNIT_SUBTEST_INDENT KUNIT_SU=
BTEST_INDENT<br>
44b7da5fcd4c99 David Gow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02021-11-02=
=C2=A0 728=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;# Subtest: %s&quot;,=
 test_case-&gt;name);<br>
fadb08e7c7501e Arpitha Raghunandan 2020-11-16=C2=A0 729=C2=A0 <br>
8631cd2cf5fbf2 Marie Zhussupova=C2=A0 =C2=A0 2025-07-29=C2=A0 730=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (c=
urr_param) {<br>
<br>
-- <br>
0-DAY CI Kernel Test Service<br>
<a href=3D"https://github.com/intel/lkp-tests/wiki" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/intel/lkp-tests/wiki</a><br>
<br>
</blockquote></div></div>
</div>
</div>
</div>

--000000000000137eab063b3ef2a1--
