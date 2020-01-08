Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E181341D0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 13:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBCA89209;
	Wed,  8 Jan 2020 12:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B519789173;
 Wed,  8 Jan 2020 12:35:08 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x6so1544071pfo.10;
 Wed, 08 Jan 2020 04:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=yKbQ6scm0B1cCM4QbxSmHwfLhuhy6eM9BFR8w0agbVM=;
 b=hjE2wtNyVKjcLhTFrmAR60mkR2+RNNf3n5IfqQXJD9Xhg6yZpoGFcyPBrKfH9vGR7X
 PKo5HEIOWOtvFv79p45h4Xixi/3MvqLmrnPS86Ot7ISVYvhxc4ZCoJigOv2mfqdMmDsD
 GL6vjCFotR64tXCURLMP1mj4YT9gBJmt7fhudJxX9MKh9sn09xhqnXfLY79S8sWOwJfO
 6pduNnG9xZA/0gHH9Dlr9b7qbwM73JV0CbuZwMUm9+ZEUYyaLHK7oMis5+obVZJVJUpL
 4ZOnNm/RvrF6r3y2xefUsHrXXQKwaY99ABreLrfq/8fp/eWwAfQtRnG2qeBrwWwNjiqT
 uBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=yKbQ6scm0B1cCM4QbxSmHwfLhuhy6eM9BFR8w0agbVM=;
 b=aPLeniNULpVLeEkGvynOb4YcbawGG8cd/3GySfs4Mdz6eGhI+dkpoTt/k/qVZfpE4K
 EGhjadzLIhVyKu7oyUTeyGO5/572TX26hN1tqHUOlyiWaeJhAlS6OaUb7stTPWnyevIP
 to6sG4L2Bl6uLM70PM5sFVr4aFGZovYxUAwV2TsKe77uCPbwXlRn7z5ZJiISX1FcxuVZ
 olIVrtL9+7rpAN/pICx6tPyxKcmrjFnlIyQrI9ebPMYm5rDHWJZZqj6ZoSSA97o4x7QY
 Zo1U3VyNe71v9Dk+bB1lTgCdBE4TQtDsofWPu6KRVS7WyOz6dBvyZV3Q8XsVgZMBVsa5
 vl4A==
X-Gm-Message-State: APjAAAWPHiVqj2rmjj3AUf3Ov+SerMCpv7ISZNEctRfwAXLXECoetCcM
 j7aCQvORF64NP9BRQ/CVwV28s9B4ADkxj5ajeX2iwfO81kQ=
X-Google-Smtp-Source: APXvYqz1If4V6LRQ2PWvObaqfBgi/38PONPe7a3bcuiSrQEJmIhAHzuDBYi36f/xHbu/oDjxCgk4eyUnTi971BBC+4c=
X-Received: by 2002:a63:941:: with SMTP id 62mr5142130pgj.203.1578486908001;
 Wed, 08 Jan 2020 04:35:08 -0800 (PST)
MIME-Version: 1.0
References: <d24e431a-a5ca-6bb0-812c-bb368ee64876@gnu.org>
In-Reply-To: <d24e431a-a5ca-6bb0-812c-bb368ee64876@gnu.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Jan 2020 14:34:59 +0200
Message-ID: <CAHp75Vdi35+9_4s1OzFRs-G0w0_vcAkKa2av_BWU+Axu1sYskg@mail.gmail.com>
Subject: Fwd: [PATCH] drm/i915: Fix enable OA report logic
To: intel-gfx <Intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel.vetter@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I forwarding this to a (sub)set of correct MLs/maintainers. Please,
follow the instructions they give.

---------- Forwarded message ---------
From: Ebrahim Byagowi <ebrahim@gnu.org>
Date: Mon, Dec 23, 2019 at 12:17 PM
Subject: [PATCH] drm/i915: Fix enable OA report logic
To: <platform-driver-x86@vger.kernel.org>



Clang raises

  drivers/gpu/drm/i915/i915_perf.c:2474:50: warning: operator '?:' has
lower precedence than '|'; '|' will be evaluated first
[-Wbitwise-conditional-parentheses]
                             !(stream->sample_flags & SAMPLE_OA_REPORT) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/i915/i915_perf.c:2474:50: note: place parentheses
around the '|' expression to silence this warning
                             !(stream->sample_flags & SAMPLE_OA_REPORT) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/i915/i915_perf.c:2474:50: note: place parentheses
around the '?:' expression to evaluate it first
                             !(stream->sample_flags & SAMPLE_OA_REPORT) ?
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^

with -Wbitwise-conditional-parentheses and apparently is right
as '|' is evaluated before '?:' which doesn't seem to be the intention
here so let's put parentheses in the right place to fix it.

Signed-off-by: Ebrahim Byagowi <ebrahim@gnu.org>
---
 drivers/gpu/drm/i915/i915_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 2ae14bc14931..db963f7c2e2e 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2471,9 +2471,9 @@ static int gen12_enable_metric_set(struct
i915_perf_stream *stream)
                            * If the user didn't require OA reports,
instruct the
                            * hardware not to emit ctx switch reports.
                            */
-                          !(stream->sample_flags & SAMPLE_OA_REPORT) ?
-
_MASKED_BIT_ENABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS) :
-
_MASKED_BIT_DISABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS));
+                          (!(stream->sample_flags & SAMPLE_OA_REPORT) ?
+
_MASKED_BIT_ENABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS) :
+
_MASKED_BIT_DISABLE(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS)));

        intel_uncore_write(uncore, GEN12_OAG_OAGLBCTXCTRL, periodic ?
                           (GEN12_OAG_OAGLBCTXCTRL_COUNTER_RESUME |
--
2.24.0



-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
