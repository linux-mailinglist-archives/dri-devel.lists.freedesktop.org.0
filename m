Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A47DB5A5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4243B10E24E;
	Mon, 30 Oct 2023 09:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF91410E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:03:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so2664303f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 02:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698656594; x=1699261394; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y5DNReJrJjqC3ApxSGU7LvngHjOHwZujFq9jNZRCwZ0=;
 b=PJ/UitJtZ/5sW15x/TuU3DQ6VdCY4Itlv76ViDN2MtA5rBKkKUvs+cAP173rviNyWA
 Vghawol6eo7cREFuF/O+Ex7T8UUGV5FCWikWTj55WLStL2jSiMsmrXYYWhs5syw/Uxeu
 rs4akx4AaC3m9LpJZwfhZAX2HWt7ChS2qdjpbwgZ7TgG7nOGXOyvCWJpWDpBW56pIlfD
 IZOOcGkHWud97RDKS7wGL7JnyOehJIpYyCwr0s402EhcvasMvdhe1BwwLjxvB9tUL8Aq
 1pGEOkQSuVPpCFVp1VTwX9Q92rr8Fyq22RGjqVaHkWHZe7l2i7nqP9HNgm6faT6irwZk
 vlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698656594; x=1699261394;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y5DNReJrJjqC3ApxSGU7LvngHjOHwZujFq9jNZRCwZ0=;
 b=U1GN/ChzODWNQ2MVzkbv+uRY1z1qLhy76p9jruBzKxt4yowe7QBED8VgAjA+kk9gZu
 O1N25sxEVrb2NcMIZx1p4svGbj5thLv0v39L8bQHf9ayZ+mgbIjmR2B98imgb3xChd4N
 enGwBMHkbzId7ah030vZrSOOFZElspQMcNrT33hc84Icsv2pTOWhj7v/BUMpchMAtHiN
 pqF34nbH8UPLCxdyCfO5K6mouZwMTjIVwqw61t91Qef5VbXKAMh+4Sm7x4ZhVvzXdCsG
 3acM5O9VnrzkYQeOQFICz4yMHmzGGms9nqIWjrXI/hl/wk0tEd+NdL3rDecAuf4FW4or
 +/vQ==
X-Gm-Message-State: AOJu0YzBb3KD7KzOgYFWjifQDVUH8sY67kGfqsOroxExMHGRfRMPsVXI
 +BZrk7EoWeewzi5jAoUNFzZyfA==
X-Google-Smtp-Source: AGHT+IEhsz4/79n5D4u1uifu9B339uC6hyL43ZVUwHGiKOTkc6qwKZ4xELMfYIeVLRV4xprg4rCGaQ==
X-Received: by 2002:adf:f18a:0:b0:32d:ac49:2bb1 with SMTP id
 h10-20020adff18a000000b0032dac492bb1mr7477941wro.63.1698656593914; 
 Mon, 30 Oct 2023 02:03:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d6ac9000000b0032d687fd9d0sm7701427wrw.19.2023.10.30.02.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 02:03:13 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:01:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <keescook@chromium.org>,
 Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: [RFC] drm/tests: annotate intentional stack trace in
 drm_test_rect_calc_hscale()
Message-ID: <02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: linux-kselftest@vger.kernel.org, kv-team <kv-team@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, dri-devel@lists.freedesktop.org,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have started printing more and more intentional stack traces.  Whether
it's testing KASAN is able to detect use after frees or it's part of a
kunit test.

These stack traces can be problematic.  They suddenly show up as a new
failure.  Now the test team has to contact the developers.  A bunch of
people have to investigate the bug.  We finally decide that it's
intentional so now the test team has to update their filter scripts to
mark it as intentional.  These filters are ad-hoc because there is no
standard format for warnings.

A better way would be to mark it as intentional from the start.

Here, I have marked the beginning and the end of the trace.  It's more
tricky for things like lkdtm_FORTIFY_MEM_MEMBER() where the flow doesn't
reach the end of the function.  I guess I would print a different
warning for stack traces that can't have a
"Intentional warning finished\n" message at the end.

I haven't actually tested this patch...  Daniel, do you have a
list of intentional stack traces we could annotate?

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 2 ++
 include/kunit/test.h                  | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 76332cd2ead8..367738254493 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -409,8 +409,10 @@ static void drm_test_rect_calc_hscale(struct kunit *test)
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_INTENTIONAL_WARNING();
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_INTENTIONAL_WARNING();
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
diff --git a/include/kunit/test.h b/include/kunit/test.h
index 20ed9f9275c9..1f01d4c81055 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -337,6 +337,9 @@ void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites);
 void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin);
 void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr);
 
+#define START_INTENTIONAL_WARNING() pr_info("Triggering a stack trace\n")
+#define END_INTENTIONAL_WARNING() pr_info("Intentional warning finished\n")
+
 #if IS_BUILTIN(CONFIG_KUNIT)
 int kunit_run_all_tests(void);
 #else
-- 
2.42.0

