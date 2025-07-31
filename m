Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D4B176E1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D4E10E7DF;
	Thu, 31 Jul 2025 20:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mV9eWZNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6D010E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:01:18 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6156c3301ccso2666a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753992077; x=1754596877;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4B+Gc5g7Q5xkPte+e+rtUPltSMHyDQNEhLddUtHkKo=;
 b=mV9eWZNrpgmy8/OwiJPhXF2UBxRAflliQjpnhX3YgKtWhNrLnLNSi5USlc84pw+PF8
 ALiuxknSQEvJZXXQp/FNCwhpqxHCeC3pLukzFY04922Cuk+3iAPX/9T1BPSKJw1DQXDJ
 SggHJXqYbXCJk1ne13LwFpee3gw6osWPykJuPN+J10HjDQL/0e75ZbFitgywh3egitWP
 Y+yb/Tr8ciKPKPWw3qM2OC3oLKeCY41q/NlE9KpUUYlD5DvqHzJb8CblQeipe8xB1m+i
 pqbqTy+BUTu1+zg4/mLFG3B4QvRaou4fnXqmW5oXJzxuEKXnkJFwF3a1PCSNA6LjG9i4
 HOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753992077; x=1754596877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4B+Gc5g7Q5xkPte+e+rtUPltSMHyDQNEhLddUtHkKo=;
 b=PLmFATPRzh7Zgn6bzr3SH8DPRkKAMwn9aE0rwQ8uEghQafa3BH6WAakabz0plNXdqU
 0Lonk4EV5RsUCPAnhT3igs78NS2QExYxrkXyoDXTK+OdtZa8iIBtuAXtXdVo4a5qvgKx
 Ili5VmUNxcJwiPUO9L+Ek7Z+v2op0asWOuldZxaxTVbY3p7BS4/jJiQyG6Eu4+KOVDP3
 KlcVUsZ+gaD2bqEaMi8z2j5BwzdzS3SJ+nxT1lWhiUZN7GBv8iqkwUISFWbcOAQdlJ3M
 ZXlw+BUEIV6jCWFGiai+SQnu92kNMK3VYoZ8FgRjZLkkp1BkGL+BYQ0B5uumSwkuvPRn
 hj4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjtl62unUEhZK6LCtIviersd8Fa862Ds15DMQ4sdD8Gb1z7Y5NfXj3k8VyG2wnknvJHfSsjSdjTxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ9UH/x4xqyM7ExaOsdx4qxp+jXN8tKup0CKrfzBgcnFfVGVPX
 I/c6UdZlUzCmGJsD9ydKVkeRm6AaTH9wRTpyZrZXmhLlldhmIKPkEl9nNJyche33gHf927MWIea
 790urPyoGUuKJRJPkfGCtnxO0WDPMFFWoFvdwexNQ
X-Gm-Gg: ASbGncslBrywXt86q9BssmtUqfL3t6390pVMbk/T2JaHNnvQKQfXzw/84eIY1+TH+Eg
 SCu3nDBMyX9ynBnMXzM3lkBbjPoHyt5XTaQq0eEMi7a+LWyAl7sDxmiBPfmxHNMvKVrx/DEx8Wb
 4yxkdI+jwlgDcbGfvqBwxP/mt+lt+NYa8DsSGAN6K+lxVV0kaP4+8Uk5d4b9mDwCj2VE3wYqgfN
 6aZGCbIztO1jnUvYM/sOu0YcG61DxofeiPCyA==
X-Google-Smtp-Source: AGHT+IHGcwHAtHu5K2dQoF6Q1Va8xnfXD6dn1kwEfUjWrGJacU1Z7dtDAziML3bVAL5d/XMASujNYe3MyNDT/TYWX7E=
X-Received: by 2002:a50:aa8b:0:b0:60e:2e88:13b4 with SMTP id
 4fb4d7f45d1cf-615cba4acfbmr10864a12.3.1753992076959; Thu, 31 Jul 2025
 13:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-7-marievic@google.com>
 <5683507a-dacc-4e46-893f-d1e775d2ef22@suswa.mountain>
In-Reply-To: <5683507a-dacc-4e46-893f-d1e775d2ef22@suswa.mountain>
From: Marie Zhussupova <marievic@google.com>
Date: Thu, 31 Jul 2025 16:01:04 -0400
X-Gm-Features: Ac12FXzOGGXGhE1duhbD0s56UlVQ0g2I8y9BFv08H051qzMmNgVQAGnFiVjL2Lc
Message-ID: <CAAkQn5JVPnN_dowQAjexom9O+2vThSOiNiY4woCgRPwGNNmt7w@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 31, 2025 at 11:58=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hi Marie,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Marie-Zhussupova/k=
unit-Add-parent-kunit-for-parameterized-test-context/20250730-033818
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kself=
test.git kunit
> patch link:    https://lore.kernel.org/r/20250729193647.3410634-7-marievi=
c%40google.com
> patch subject: [PATCH 6/9] kunit: Enable direct registration of parameter=
 arrays to a KUnit test
> config: nios2-randconfig-r072-20250731 (https://download.01.org/0day-ci/a=
rchive/20250731/202507310854.pZvIcswn-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202507310854.pZvIcswn-lkp@intel.com/
>
> New smatch warnings:
> lib/kunit/test.c:723 kunit_run_tests() error: we previously assumed 'test=
_case->generate_params' could be null (see line 714)
>
> vim +723 lib/kunit/test.c
>
> 914cc63eea6fbe Brendan Higgins     2019-09-23  681  int kunit_run_tests(s=
truct kunit_suite *suite)
> 914cc63eea6fbe Brendan Higgins     2019-09-23  682  {
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  683      char param_desc[K=
UNIT_PARAM_DESC_SIZE];
> 914cc63eea6fbe Brendan Higgins     2019-09-23  684      struct kunit_case=
 *test_case;
> acd8e8407b8fcc David Gow           2021-08-03  685      struct kunit_resu=
lt_stats suite_stats =3D { 0 };
> acd8e8407b8fcc David Gow           2021-08-03  686      struct kunit_resu=
lt_stats total_stats =3D { 0 };
> 8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  687      const void *curr_=
param;
> 914cc63eea6fbe Brendan Higgins     2019-09-23  688
> c272612cb4a2f7 David Gow           2022-07-01  689      /* Taint the kern=
el so we know we've run tests. */
> c272612cb4a2f7 David Gow           2022-07-01  690      add_taint(TAINT_T=
EST, LOCKDEP_STILL_OK);
> c272612cb4a2f7 David Gow           2022-07-01  691
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  692      if (suite->suite_=
init) {
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  693              suite->su=
ite_init_err =3D suite->suite_init(suite);
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  694              if (suite=
->suite_init_err) {
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  695                      k=
unit_err(suite, KUNIT_SUBTEST_INDENT
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  696                       =
         "# failed to initialize (%d)", suite->suite_init_err);
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  697                      g=
oto suite_end;
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  698              }
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  699      }
> 1cdba21db2ca31 Daniel Latypov      2022-04-29  700
> cae56e1740f559 Daniel Latypov      2022-04-29  701      kunit_print_suite=
_start(suite);
> 914cc63eea6fbe Brendan Higgins     2019-09-23  702
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  703      kunit_suite_for_e=
ach_test_case(suite, test_case) {
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  704              struct ku=
nit test =3D { .param_value =3D NULL, .param_index =3D 0 };
> acd8e8407b8fcc David Gow           2021-08-03  705              struct ku=
nit_result_stats param_stats =3D { 0 };
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  706
> 887d85a0736ff3 Rae Moar            2023-03-08  707              kunit_ini=
t_test(&test, test_case->name, test_case->log);
> 03806177fa4cbb Marie Zhussupova    2025-07-29  708              __kunit_i=
nit_parent_test(test_case, &test);
> 03806177fa4cbb Marie Zhussupova    2025-07-29  709
> 529534e8cba3e6 Rae Moar            2023-07-25  710              if (test_=
case->status =3D=3D KUNIT_SKIPPED) {
> 529534e8cba3e6 Rae Moar            2023-07-25  711                      /=
* Test marked as skip */
> 529534e8cba3e6 Rae Moar            2023-07-25  712                      t=
est.status =3D KUNIT_SKIPPED;
> 529534e8cba3e6 Rae Moar            2023-07-25  713                      k=
unit_update_stats(&param_stats, test.status);
> 44c50ed8e59936 Marie Zhussupova    2025-07-29 @714              } else if=
 (!test_case->generate_params && !test.params_data.params) {
>                                                                          =
   ^^^^^^^^^^^^^^^^^^^^^^^^^^
> Imagine ->generate_parms is NULL but test.params_data.params is
> non-NULL.
>
> 37dbb4c7c7442d David Gow           2021-11-02  715                      /=
* Non-parameterised test. */
> 529534e8cba3e6 Rae Moar            2023-07-25  716                      t=
est_case->status =3D KUNIT_SKIPPED;
> 37dbb4c7c7442d David Gow           2021-11-02  717                      k=
unit_run_case_catch_errors(suite, test_case, &test);
> 37dbb4c7c7442d David Gow           2021-11-02  718                      k=
unit_update_stats(&param_stats, test.status);
> 03806177fa4cbb Marie Zhussupova    2025-07-29  719              } else if=
 (test_case->status !=3D KUNIT_FAILURE) {
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  720                      /=
* Get initial param. */
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  721                      p=
aram_desc[0] =3D '\0';
> 8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  722                      /=
* TODO: Make generate_params try-catch */
> 13ee0c64bd88a3 Marie Zhussupova    2025-07-29 @723                      c=
urr_param =3D test_case->generate_params(&test, NULL, param_desc);
>                                                                          =
            ^^^^^^^^^^^^^^^^^^^^^^^^^^
> Then this could crash.
>
> I suspect that this is fine, but I bet that in the previous
> condition, just testing one would probably have been sufficient
> or maybe we could have change && to ||.

Hello Dan,

My apologies for the HTML version of this email earlier. Here is the
plain text version.

As of now, test.params_data.params can only be populated in a param_init
function, which can only be used if we register the test case with a
KUNIT_CASE_PARAM_WITH_INIT macro. That macro auto populates
test_case->generate_params with a function called
kunit_get_next_param_and_desc()
(which iterates over the parameter array) if the test user didn't provide t=
heir
own generator function. So, there shouldn't be a case where
test_case->generate_params is NULL but test.params_data.params is NON-NULL.

However, to be robust, we could add a NULL check  before calling
test_case->generate_params on line 723.

Thank you!
-Marie

>
> 529534e8cba3e6 Rae Moar            2023-07-25  724                      t=
est_case->status =3D KUNIT_SKIPPED;
> 6c738b52316c58 Rae Moar            2022-11-23  725                      k=
unit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> 6c738b52316c58 Rae Moar            2022-11-23  726                       =
         "KTAP version 1\n");
> 44b7da5fcd4c99 David Gow           2021-11-02  727                      k=
unit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> 44b7da5fcd4c99 David Gow           2021-11-02  728                       =
         "# Subtest: %s", test_case->name);
> fadb08e7c7501e Arpitha Raghunandan 2020-11-16  729
> 8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  730                      w=
hile (curr_param) {
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
