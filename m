Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MaUDHcm6cWkNLwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:51:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7938620F6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F2F10E06C;
	Thu, 22 Jan 2026 05:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RQT50A0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC1010E06C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 05:51:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9620B600AA;
 Thu, 22 Jan 2026 05:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F432C116C6;
 Thu, 22 Jan 2026 05:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769061059;
 bh=Bb74xsoEZKYOuZmvjORZ1FhqK8uLhgEkpy61Bk9sPpw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RQT50A0HzpXu80ghRZZYelxtd/x8OyQziz+nioon3gfvXf/92qBBs57lGczIfxtNA
 C6ZQfIMH4c+6BUPQAqn1Xu2/iUktBrJTujXyhiRRNVhwQagSmOcgIfnpE4q1uvYf4j
 xt64t25jqsSHzJ139EUionCY/xuxvrkEQjt7ISO0A/MJdRIf/BSU8SGZDK5LGihs/s
 Vt8FCi5UM5+WExEbbH7h10iDtUAg/jf6L/b3ExxAB7dm0vZ9i6IZmtX3LiO6zu8b60
 5hQINwr6heezx7iSRJGD899SPOEXy76PsOwYOhF1Iu00+puGDLCEbVMmhvc8K53lkA
 sYNiR0Ul22QNg==
From: Miguel Ojeda <ojeda@kernel.org>
To: nathan@kernel.org
Cc: dri-devel@lists.freedesktop.org, jesszhan0024@gmail.com,
 justinstitt@google.com, llvm@lists.linux.dev,
 maarten.lankhorst@linux.intel.com, morbo@google.com, mripard@kernel.org,
 neil.armstrong@linaro.org, nick.desaulniers+lkml@gmail.com,
 patches@lists.linux.dev, tzimmermann@suse.de,
 yelangyan@huaqin.corp-partner.google.com
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Remove duplicate initializers
 in tianma_il79900a_dsc
Date: Thu, 22 Jan 2026 06:50:50 +0100
Message-ID: <20260122055050.139154-1-ojeda@kernel.org>
In-Reply-To: <20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org>
References: <20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:jesszhan0024@gmail.com,m:justinstitt@google.com,m:llvm@lists.linux.dev,m:maarten.lankhorst@linux.intel.com,m:morbo@google.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:patches@lists.linux.dev,m:tzimmermann@suse.de,m:yelangyan@huaqin.corp-partner.google.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ojeda@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,google.com,lists.linux.dev,linux.intel.com,kernel.org,linaro.org,suse.de,huaqin.corp-partner.google.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,dri-devel-bounces@lists.freedesktop.org]
X-Rspamd-Queue-Id: D7938620F6
X-Rspamd-Action: no action

On Wed, 14 Jan 2026 13:43:31 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
>
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:95:16: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>      95 |         .vbr_enable = 0,

(...coming from https://lore.kernel.org/all/CANiq72mRp62foTCstQxYhVBdh6y_W27wEjWSRX9_kqShuueaSQ@mail.gmail.com/)

Yeah, I am also hitting this -- it would be nice to clean it soon.

Thanks Nathan!

Cheers,
Miguel
