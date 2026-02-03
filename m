Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOcBOSG7gWm7JAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:08:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56699D6984
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F9710E33C;
	Tue,  3 Feb 2026 09:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nl1Ijh8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D75910E33C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 09:08:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 90F81601E4;
 Tue,  3 Feb 2026 09:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA006C116D0;
 Tue,  3 Feb 2026 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770109724;
 bh=cFz/tPYSm3tLT861mZLJJj4g1c0ioBaYgzttMSvII80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nl1Ijh8tmUw6dOsQHRSq/5/G489fyc0fpXqGdNtQ0NRYQDo1uVHlIRTjPgcKPCswM
 ONU90AmSKSjwM1xeUUZA8JIwwfgg6aGIz2+0TbAJGvIbsdCpct87/JpUru5yOyMtw5
 kSMJ8RW0+AwLDgRNQWfa6eur64Qw8cjBRy+fKfLi3Uv7RTV9P4KBkMcLukLwPi9oxP
 f5NOBO2Fsb3hB3Ke6JNe5iKLUMhDJOH+/ywt1eSJaZtrWj4ImWt1bP9GMiIb6lWdH3
 9uI32baRwb+UQpuVeH0riZTCrco/TgE3Q+rJ4pyfvIL0CKrxNJfLc1ZC7WpY4Y6EMK
 Qv/DqRw6b8jPQ==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Remove duplicate initializers
 in tianma_il79900a_dsc
Date: Tue,  3 Feb 2026 10:08:39 +0100
Message-ID: <177010971609.2807136.13257550414662424946.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org>
References: <20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:yelangyan@huaqin.corp-partner.google.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:nathan@kernel.org,m:mripard@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:llvm@lists.linux.dev,m:patches@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,huaqin.corp-partner.google.com,linux.intel.com,suse.de,kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,lists.freedesktop.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 56699D6984
X-Rspamd-Action: no action

On Wed, 14 Jan 2026 13:43:31 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:95:16: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>      95 |         .vbr_enable = 0,
>         |                       ^
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:90:16: note: previous initialization is here
>      90 |         .vbr_enable = false,
>         |                       ^~~~~
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:97:19: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>      97 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>         |                          ^~~~~~~~~~~~~~~~~~~~~~~
>   include/drm/display/drm_dsc.h:22:38: note: expanded from macro 'DSC_RC_MODEL_SIZE_CONST'
>      22 | #define DSC_RC_MODEL_SIZE_CONST             8192
>         |                                             ^~~~
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:91:19: note: previous initialization is here
>      91 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>         |                          ^~~~~~~~~~~~~~~~~~~~~~~
>   include/drm/display/drm_dsc.h:22:38: note: expanded from macro 'DSC_RC_MODEL_SIZE_CONST'
>      22 | #define DSC_RC_MODEL_SIZE_CONST             8192
>         |                                             ^~~~
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:132:25: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>     132 |         .initial_scale_value = 32,
>         |                                ^~
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:126:25: note: previous initialization is here
>     126 |         .initial_scale_value = 32,
>         |                                ^~
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:133:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>     133 |         .nfl_bpg_offset = 3511,
>         |                           ^~~~
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:108:20: note: previous initialization is here
>     108 |         .nfl_bpg_offset = 1402,
>         |                           ^~~~
> 
> [...]

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime
