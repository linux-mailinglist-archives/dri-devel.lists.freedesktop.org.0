Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKDOJ+0VcWmodQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:07:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E762E5B0A3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AD110E0DA;
	Wed, 21 Jan 2026 18:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aiuzAn9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108FF10E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 18:07:38 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-1244bce2c17so17185c88.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769018857; cv=none;
 d=google.com; s=arc-20240605;
 b=JJfsX81DlcNiovR7azyUScn30wWmohSqVOA636UTwJPcIFkjV/n2SxMe/1vyjyOfqN
 7B2+KwNtNf6y+MXSXoDtqMG59B2QEK4hf72dynSaM7nL+Z0Zuj5Cv3epEvl80n9Fg2b0
 FKMSY29642fvFiMzCD6XfXNg7CfTzqq20RWpZxT5es5pNXJolt1OgAKuEqoeePifFD5k
 rToe4llX3Ey1eI42rVhedPp1xKDLp+u83M6VJ1bzACReWkRK2iT7NL/e5KfKOzqWrjUO
 veWEnDEUAYmg1VJoSz8XfdWOdkrSsb/AHnQm/edn7gqs8x+iCsUWvsHLTpmjJk+E2C9m
 WlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=eKOwdG55kf3gC4fatCORW5h39+BPkhbU4hpVpJ0Seow=;
 fh=cIeRAubWJNoD6eytuKjEi4ASQ4mKSV3pBc7wz2OtnGM=;
 b=eYRMsYiuDyxTYFQoQu16NybQ1aIlreVZk97qklZTSIb6iOFVr+mGPigRXAOz2fllGv
 F7oGH1vNzylBcLfmS18G0Ydyp5VDnLEU4LRuvD73038QisMHzRe32TPDcrOeZRlhGA+m
 bgDmY2zSKmWvaCecGFpSHwAWnNTem3btcEiqXaJJATPCbDs7cyO3nIq5+J8gvjeqBfHz
 uuGz48DkxfBdPZCJQHY/E7EfHiVgBcAy9wtaHs6utcD6mPDAJiPbVXP5byiy1Xf8WVFl
 iYofewWX/udUps7ziSh4fz083vQ6h4POiz8CWM+vC7pQ7TiUNaSOg0/7XYbHnzuQ3crQ
 HDCQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769018857; x=1769623657; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eKOwdG55kf3gC4fatCORW5h39+BPkhbU4hpVpJ0Seow=;
 b=aiuzAn9ALHRrT3unZZk4clnY+ak7/fh1znqZnDD67KP5rOXmSmynoa3h7ZJuK0x1iQ
 KU1GQdDINcDhf9HoRXHzXkacOd3a74h/S8RDcmY8xXAdBMwn6yI5nDo+XqYaf2/B3+dj
 opxOU00+NliEXTvmuL/0CFu82wWM9Q42JTljj+cUtNKTR86mz5qPmx7bofvFf0RbYxQN
 JoJurmCxGCwhD+46HKVM74PjLCvSexn9QGyojX5YZKuxMhTLUjJ0STG3iCXMsgTumdHY
 xGc9vn+BEz3XQA7qdAoPAZ0Awhr0GvAFDLEUcYyy2rV/zTmBofBynn0No81nFbyANg3H
 DtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769018857; x=1769623657;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eKOwdG55kf3gC4fatCORW5h39+BPkhbU4hpVpJ0Seow=;
 b=QmiMZNPvpQ4HwlejOTLMctmKCb6lUIHgqiyCf/5tUNVAg59Sc3aYzg01JTNW7pXeuZ
 8ZyHjuuKTmxisyXs6u06atufU3LTGM9kReT0NfuiOaHMGBBquWz1vlpA4rIVRrfXs2ob
 4yGAtSX8WF0aDb2GhCPvPPWnD82MxQbWDCaQIg/2k8U+vxdzNvtltsoFHtkl/Rrv4+Za
 mHAQyiuQZoUcgl8DFfwdoV7p9hT4lsPwpOA9nGreTiNkKKxOww68cYjWEpvNOF0+QZzS
 OJ+Z0j4JIPVqzdHG9yrLJXMRTOYqVLPBfUroelvpjs0EBfuaNs3JuUMJ09ZcftOry1Tf
 6VeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE23+cCw1Fa/HRcvXQM0UP/WDpcNXeAHPMkgSazmEP3LRWdV7IAppCwcxWsrHXJ4uMfRtgt59bH5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhPNrCBJiw5Lqmd/oYv38DmKTlbVTOJMdiWiR4d9PfImaIPf36
 mqvT9774zQ0EvdjQtUrkboKBr4o+b400nIlPpkrztE6xYgekadsqA7ueXEiInnDtYAUGzV8TKBQ
 pYREmayKpM3dMJZJ4dNkKWZYxWjTIzC4=
X-Gm-Gg: AZuq6aI1VJPJvbU1u4fyW8ybQvBEviofYvDXelAOMUnxH59vnEFf2dNVBx52olj6eca
 TPHUIyMCCs+cP1sHo3fpLI1ahhFo0r5P0OAJMxFxijTeCF/+tfOaku9RKm+loDCwyA9J+HKdaFW
 THdw1j3f1WauqXYWB8JSc4lvgMrst4rNCrRZ/A5XdgVhKHtpz3VRvPjMobaC9sExv38PpKo6XvW
 Yh8XiLpKXfjzzhabSo3JwAdNwvy9FP7GNRnFcx/BUy4CNGC9+nXACQsOd4DKMzW5xZWzhBe2glX
 VaeB/RL2NjjqtgXQVa92QuKocoxCL3HI2BU/uH7qsanU91TtaEazqKtmOAbFR8PGBsc7896W/LV
 TfNKttlAz2eYe
X-Received: by 2002:a05:7022:4185:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-1246956d899mr2418057c88.4.1769018857100; Wed, 21 Jan 2026
 10:07:37 -0800 (PST)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 19:07:22 +0100
X-Gm-Features: AZwV_QiseqhTeH3EBj1muywLFlNQwQxlxlv0CTHuvPva-Rov9foivcF-QK7usc0
Message-ID: <CANiq72mRp62foTCstQxYhVBdh6y_W27wEjWSRX9_kqShuueaSQ@mail.gmail.com>
Subject: panel-ilitek-ili9882t.c:95:16: error: initializer overrides prior
 initialization
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:yelangyan@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:broonie@kernel.org,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[huaqin.corp-partner.google.com,linaro.org,gmail.com];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: E762E5B0A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

With LLVM 21.1.8, I am seeing in an `allmodconfig` for next-20260121:

    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:95:16: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
       95 |         .vbr_enable = 0,
          |                       ^
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:90:16: note:
previous initialization is here
       90 |         .vbr_enable = false,
          |                       ^~~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:97:19: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
       97 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
          |                          ^~~~~~~~~~~~~~~~~~~~~~~
    ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
'DSC_RC_MODEL_SIZE_CONST'
       22 | #define DSC_RC_MODEL_SIZE_CONST             8192
          |                                             ^~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:91:19: note:
previous initialization is here
       91 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
          |                          ^~~~~~~~~~~~~~~~~~~~~~~
    ./include/drm/display/drm_dsc.h:22:38: note: expanded from macro
'DSC_RC_MODEL_SIZE_CONST'
       22 | #define DSC_RC_MODEL_SIZE_CONST             8192
          |                                             ^~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:132:25: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
      132 |         .initial_scale_value = 32,
          |                                ^~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:126:25: note:
previous initialization is here
      126 |         .initial_scale_value = 32,
          |                                ^~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:133:20: error:
initializer overrides prior initialization of this subobject
[-Werror,-Winitializer-overrides]
      133 |         .nfl_bpg_offset = 3511,
          |                           ^~~~
    drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:108:20: note:
previous initialization is here
      108 |         .nfl_bpg_offset = 1402,
          |                           ^~~~

It seems that indeed the variables are duplicated -- something seems
off with commit

    65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma
TL121BVMS07 to DSC 120Hz mode")

Thanks!

Cheers,
Miguel
