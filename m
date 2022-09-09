Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F225B3B72
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 17:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82E710E042;
	Fri,  9 Sep 2022 15:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5559F10E042;
 Fri,  9 Sep 2022 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662735962; x=1694271962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=We9KN/npBy9H+uViA+V3sWO0mdLaDEfmpJXJMfwhST4=;
 b=SuKzwPqf5v+kIiwlEp230kDDfGo+kATTEbBFxMOBpbU5C6bdvvmpIFY9
 MYUiuUBUvXupPPBM7VmSn0ryIRArurqhBCk3KSIEHqnYtRDDNlrCsbxsw
 P4BQypxeU00F/CFbH/gNkkmuXpkjdBPGD3l5OOdMRMVDSz6BjCvO3kLJX
 CgSVPAXer0jBMNm3xJHREvJoNPJaTSfd4Oel2wgxXv3SOhyX8TPGdoA58
 TaXJ5ZFbQczQ3CRX+lV94snasvHmpeH6zdqByxd01F/2eHzDWNzVxR1W9
 dbjQxa0Lra1V5fMfFhsOQJhYL0WDSluhWwjJ3I6pO+31MVz6RDmBcZ62e g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="361448750"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="361448750"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 08:06:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="677188805"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.25.143])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 08:05:57 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/4] lib/igt_kmod: rename kselftest
 functions to ktest
Date: Fri, 09 Sep 2022 17:05:54 +0200
Message-ID: <3054638.CbtlEUcBR6@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220829000920.38185-2-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-2-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-kselftest@vger.kernel.org, magalilemes00@gmail.com,
 maira.canal@usp.br, dlatypov@google.com, tales.aparecida@gmail.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 n@nfraprado.net, davidgow@google.com, skhan@linuxfoundation.org,
 andrealmeid@riseup.net, Isabella Basso <isabbasso@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 29 August 2022 02:09:17 CEST Isabella Basso wrote:
> This aims at making IGT's structure more general to different kernel
> testing frameworks such as KUnit, as they use a lot of the same
> functionality.
> 
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>

LGTM

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/igt_kmod.c | 22 +++++++++++-----------
>  lib/igt_kmod.h | 12 ++++++------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bcf7dfeb..bb6cb7bb 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -718,8 +718,8 @@ static int open_parameters(const char *module_name)
>  	return open(path, O_RDONLY);
>  }
>  
> -int igt_kselftest_init(struct igt_kselftest *tst,
> -		       const char *module_name)
> +int igt_ktest_init(struct igt_ktest *tst,
> +		   const char *module_name)
>  {
>  	int err;
>  
> @@ -738,7 +738,7 @@ int igt_kselftest_init(struct igt_kselftest *tst,
>  	return 0;
>  }
>  
> -int igt_kselftest_begin(struct igt_kselftest *tst)
> +int igt_ktest_begin(struct igt_ktest *tst)
>  {
>  	int err;
>  
> @@ -753,7 +753,7 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
>  	return 0;
>  }
>  
> -int igt_kselftest_execute(struct igt_kselftest *tst,
> +int igt_kselftest_execute(struct igt_ktest *tst,
>  			  struct igt_kselftest_list *tl,
>  			  const char *options,
>  			  const char *result)
> @@ -791,13 +791,13 @@ int igt_kselftest_execute(struct igt_kselftest *tst,
>  	return err;
>  }
>  
> -void igt_kselftest_end(struct igt_kselftest *tst)
> +void igt_ktest_end(struct igt_ktest *tst)
>  {
>  	kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
>  	close(tst->kmsg);
>  }
>  
> -void igt_kselftest_fini(struct igt_kselftest *tst)
> +void igt_ktest_fini(struct igt_ktest *tst)
>  {
>  	free(tst->module_name);
>  	kmod_module_unref(tst->kmod);
> @@ -820,15 +820,15 @@ void igt_kselftests(const char *module_name,
>  		    const char *result,
>  		    const char *filter)
>  {
> -	struct igt_kselftest tst;
> +	struct igt_ktest tst;
>  	IGT_LIST_HEAD(tests);
>  	struct igt_kselftest_list *tl, *tn;
>  
> -	if (igt_kselftest_init(&tst, module_name) != 0)
> +	if (igt_ktest_init(&tst, module_name) != 0)
>  		return;
>  
>  	igt_fixture
> -		igt_require(igt_kselftest_begin(&tst) == 0);
> +		igt_require(igt_ktest_begin(&tst) == 0);
>  
>  	igt_kselftest_get_tests(tst.kmod, filter, &tests);
>  	igt_subtest_with_dynamic(filter ?: "all") {
> @@ -847,9 +847,9 @@ void igt_kselftests(const char *module_name,
>  	}
>  
>  	igt_fixture {
> -		igt_kselftest_end(&tst);
> +		igt_ktest_end(&tst);
>  		igt_require(!igt_list_empty(&tests));
>  	}
>  
> -	igt_kselftest_fini(&tst);
> +	igt_ktest_fini(&tst);
>  }
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index f98dd29f..ceb10cd0 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -50,7 +50,7 @@ void igt_kselftests(const char *module_name,
>  		    const char *result_option,
>  		    const char *filter);
>  
> -struct igt_kselftest {
> +struct igt_ktest {
>  	struct kmod_module *kmod;
>  	char *module_name;
>  	int kmsg;
> @@ -63,19 +63,19 @@ struct igt_kselftest_list {
>  	char param[];
>  };
>  
> -int igt_kselftest_init(struct igt_kselftest *tst,
> +int igt_ktest_init(struct igt_ktest *tst,
>  		       const char *module_name);
> -int igt_kselftest_begin(struct igt_kselftest *tst);
> +int igt_ktest_begin(struct igt_ktest *tst);
>  
>  void igt_kselftest_get_tests(struct kmod_module *kmod,
>  			     const char *filter,
>  			     struct igt_list_head *tests);
> -int igt_kselftest_execute(struct igt_kselftest *tst,
> +int igt_kselftest_execute(struct igt_ktest *tst,
>  			  struct igt_kselftest_list *tl,
>  			  const char *module_options,
>  			  const char *result);
>  
> -void igt_kselftest_end(struct igt_kselftest *tst);
> -void igt_kselftest_fini(struct igt_kselftest *tst);
> +void igt_ktest_end(struct igt_ktest *tst);
> +void igt_ktest_fini(struct igt_ktest *tst);
>  
>  #endif /* IGT_KMOD_H */
> 




