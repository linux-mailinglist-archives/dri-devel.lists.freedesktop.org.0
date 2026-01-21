Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEuyHbkacWmodQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:28:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C55B415
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813A10E853;
	Wed, 21 Jan 2026 18:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pq8bBNU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD21010E853
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 18:28:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9099540C24;
 Wed, 21 Jan 2026 18:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DFAC16AAE;
 Wed, 21 Jan 2026 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769020084;
 bh=9+yIZ1ZnxavmKKgrX9+10mOSVOef6V/raGl5vjFl2ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pq8bBNU9UER77kXx1mmMHY1bvcbpeQPs7tYr2CbWZVhJxkCzUpqohWVttGMwFFyyB
 V7duFzYS6xGgSZhW6Q/0/25QthTU9I0CfQzTeF0QBrjMptS2+xfKsrX7Cjc9W38TB6
 2ADObFEd3U5CSEKw0wOxY7I0FyTgyboV8wqzYG5kT3AwW90lwHto53KnfbpcBVX0Jr
 G5cPoOGkwwVO+1v/zwM7Le9YgMmQCrUo/OnzuL/Ob6d+3gcIOsBglNaJXZ421RH10O
 yTsyWwpSwEokQDVOgjYpUbnl0NU6eJizHjj8NzLKb+oNgIny3CBCya+3hSwgux7GRM
 j1/n6LcfmA2Ig==
Date: Wed, 21 Jan 2026 11:28:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: panel-ilitek-ili9882t.c:95:16: error: initializer overrides
 prior initialization
Message-ID: <20260121182800.GA241748@ax162>
References: <CANiq72mRp62foTCstQxYhVBdh6y_W27wEjWSRX9_kqShuueaSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mRp62foTCstQxYhVBdh6y_W27wEjWSRX9_kqShuueaSQ@mail.gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:yelangyan@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:broonie@kernel.org,m:linux-next@vger.kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[huaqin.corp-partner.google.com,linaro.org,gmail.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: CF1C55B415
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 07:07:22PM +0100, Miguel Ojeda wrote:
> Hi,
> 
> With LLVM 21.1.8, I am seeing in an `allmodconfig` for next-20260121:
> 
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:95:16: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>        95 |         .vbr_enable = 0,
>           |                       ^
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:90:16: note:
> previous initialization is here
>        90 |         .vbr_enable = false,
>           |                       ^~~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:97:19: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>        97 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>           |                          ^~~~~~~~~~~~~~~~~~~~~~~
>     ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
> 'DSC_RC_MODEL_SIZE_CONST'
>        22 | #define DSC_RC_MODEL_SIZE_CONST             8192
>           |                                             ^~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:91:19: note:
> previous initialization is here
>        91 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
>           |                          ^~~~~~~~~~~~~~~~~~~~~~~
>     ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
> 'DSC_RC_MODEL_SIZE_CONST'
>        22 | #define DSC_RC_MODEL_SIZE_CONST             8192
>           |                                             ^~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:132:25: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>       132 |         .initial_scale_value = 32,
>           |                                ^~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:126:25: note:
> previous initialization is here
>       126 |         .initial_scale_value = 32,
>           |                                ^~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:133:20: error:
> initializer overrides prior initialization of this subobject
> [-Werror,-Winitializer-overrides]
>       133 |         .nfl_bpg_offset = 3511,
>           |                           ^~~~
>     drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:108:20: note:
> previous initialization is here
>       108 |         .nfl_bpg_offset = 1402,
>           |                           ^~~~
> 
> It seems that indeed the variables are duplicated -- something seems
> off with commit
> 
>     65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma
> TL121BVMS07 to DSC 120Hz mode")

I have sent

  https://lore.kernel.org/20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org/

for this, it just needs verification and application.

Cheers,
Nathan
