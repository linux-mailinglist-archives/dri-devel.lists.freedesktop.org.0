Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF36BcYhgWl+EQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 23:14:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D1D20BA
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 23:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AA010E2EA;
	Mon,  2 Feb 2026 22:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VX+E3OSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3410E2EA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 22:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8684460010;
 Mon,  2 Feb 2026 22:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA797C116C6;
 Mon,  2 Feb 2026 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770070464;
 bh=sO5KPNQ8TrkL4sJvZKSQZoiBVi33bIgn3j10AQb7f2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VX+E3OShKLDfDhSRpROGEgofypRa6ipIYNLJdS/bzT5kMqki+Sq5mceA5k1fl/VyV
 yQhBEwL6VBTGZLaauoINn8ZDSGaBZuJdD5SwJcfbgasAYeWb8GLpOMxf1EBORTS0B1
 IheeKPPBg4W9Nw3sIT8oGKlX3JCMrk4Fo2M5Z+DwQxYxKxnW9XDYgwEwOyeezk4Gxt
 ENNHPD6PY7odbG+OI/lpKTa/SuowlfdGtkFUWg1h0rfUfcRJIMJqHX7dS09Vx9as6X
 QqziNEjvLjzp6h/c9sKuQksuU3qNpXX4SXZUfrU7GDvEKIjbKJqgQgioCPM6IjcP0F
 uRcR63eTdYfFA==
Date: Mon, 2 Feb 2026 15:14:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Remove duplicate
 initializers in tianma_il79900a_dsc
Message-ID: <20260202221419.GA229639@ax162>
References: <20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:yelangyan@huaqin.corp-partner.google.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:llvm@lists.linux.dev,m:patches@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,huaqin.corp-partner.google.com,linux.intel.com,kernel.org,suse.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,google.com,lists.freedesktop.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6F8D1D20BA
X-Rspamd-Action: no action

Ping? This is still breaking builds and we are about to be in the merge
window...

On Wed, Jan 14, 2026 at 01:43:31PM -0700, Nathan Chancellor wrote:
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
> GCC would warn about this in the same manner but its version,
> -Woverride-init, is disabled for a normal kernel build in
> scripts/Makefile.warn. For clang, -Wextra in drivers/gpu/drm/Makefile
> turns it back but GCC respects turning it off earlier in the command
> line.
> 
> Of all the duplicate fields in the initializer, only nfl_bpg_offset is a
> different value. Clear up the duplicate initializers, keeping the
> 'false' value for .vbr_enable, as it is bool, and the second value for
> .nfl_bpg_offset, assuming it is the correct one since it was the one
> tested in the original change.
> 
> Fixes: 65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mode")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index 370424ddfc80..8b2bfb7d3638 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -88,11 +88,9 @@ static const struct drm_dsc_config tianma_il79900a_dsc = {
>  	.native_422 = false,
>  	.simple_422 = false,
>  	.vbr_enable = false,
> -	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>  	.pic_width = 1600,
>  	.pic_height = 2560,
>  	.convert_rgb = 0,
> -	.vbr_enable = 0,
>  	.rc_buf_thresh = {14, 28, 42, 56, 70, 84, 98, 105, 112, 119, 121, 123, 125, 126},
>  	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>  	.rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST,
> @@ -105,7 +103,6 @@ static const struct drm_dsc_config tianma_il79900a_dsc = {
>  	.initial_offset = 6144,
>  	.rc_quant_incr_limit0 = 11,
>  	.rc_quant_incr_limit1 = 11,
> -	.nfl_bpg_offset = 1402,
>  	.rc_range_params = {
>  		{ 0,  4, DSC_BPG_OFFSET(2)},
>  		{ 0,  4, DSC_BPG_OFFSET(0)},
> @@ -123,7 +120,6 @@ static const struct drm_dsc_config tianma_il79900a_dsc = {
>  		{ 9, 12, DSC_BPG_OFFSET(-12)},
>  		{12, 13, DSC_BPG_OFFSET(-12)},
>  	},
> -	.initial_scale_value = 32,
>  	.slice_chunk_size = 800,
>  	.initial_dec_delay = 657,
>  	.final_offset = 4320,
> 
> ---
> base-commit: b36178488d479e9a53bbef2b01280378b5586e60
> change-id: 20260114-panel-ilitek-ili9882t-fix-override-init-21e19143f770
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
