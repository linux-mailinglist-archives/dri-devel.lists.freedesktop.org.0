Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK3RGnU8kmn2sAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:36:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E50013FCAF
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 22:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00CD10E0A3;
	Sun, 15 Feb 2026 21:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WlM3dlDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAFC10E1D7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:22:02 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-79628fb5c05so17914337b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 21:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771132921; cv=none;
 d=google.com; s=arc-20240605;
 b=FeNkTOp6Mf1DhRtveQVFHUxRUlYrkVuCISD6E2p3uSQJ2CEhSR6lAhK7NsWNXADERd
 XzjG3Hl3btBGNmq4zrwm9cPkfqemQ1TAhISEfjYNoXCoaBNPL1+Wy10NexyLufQBp4mQ
 uS1Orrg+C9tAYQAltD55sB4Rox3bl4Ht1bGlXYICXxz80hPSe2ktzHefujhUiAVv2aSL
 fp09wz0PQSo1S+XOlVNhNLABYQVL2Fuh4iP8QVMBfOoLPbH4ljTqh8FTahz+delDt6WI
 WOcS5qeKd4nlw1sZ8IHYfocXaPzREdPIGb7+zJOo89RbGm0wCYYrPb97X05xq6oYh9rI
 Ryhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=czrEt8tluT+koTJth58wHuH0mYDYo6r9u64JjRhdsoE=;
 fh=gAuCM0evvR5iFahl+TTHXDo4+LJ+3oE7zb1KhgB0+ms=;
 b=IvKkdD4yGaSdWwUZigNVM0yigAXxqDwlJEK/URxhUhxGYWJlTjj731KEmCmOKbNJyG
 lgixJO1akXE3hHyn1GkkECNBzamL/Q5Yx4XVQ3t5OHX2Bg/doK+AAYN+iVAkixD7g047
 3ou1Cas0nM8+oKnKHecmibF5IVP7QW3FdiMaf6bQfyHL5JCfIHJk512vhVPiWfr4RX/9
 g1k0AKpV9cg8D+fIaT17ytAZVkpZLTXHiuw4KDtx6XwqZuR0S7oi3OwJ6xzjpdOknpkR
 CQYp2ZsWoq9rztO1IHcStxzKiEKPrKkOpvqcL3YdjyeN0YXTOZ5Oj1tpnuR7veyczsLE
 f8vw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771132921; x=1771737721; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=czrEt8tluT+koTJth58wHuH0mYDYo6r9u64JjRhdsoE=;
 b=WlM3dlDJskHatr4r/t3dPOvnFtcMzrH45vLjG4ohVcMpR08TH6NYcedpbQ8Eyev5BS
 FfM2gGdea2Z9G5edhwJmcjLn0Dh0QdtpRtCFu1QK6rdSQ5AnRs/3hMrsAjgrufU1buDw
 0qLQzOi5f3f5R8ocSfhhb0aOZEwH62eoQHBlBp0ztkvNO0AdGtJ2+zpQgZiYjeUzvnaa
 s5xHv0v9Ncdza5k66M1vMUyUvrW/5pIsMMIk43GRguS6KTeR7cOsza1VV5VxUM27Wrk9
 PBibY1jT36kngImGUu0UEmei0PBBFn0g7hVy2T9VTxlLMjGJaiXfHJl69NMTwhtxfZoZ
 9tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771132921; x=1771737721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czrEt8tluT+koTJth58wHuH0mYDYo6r9u64JjRhdsoE=;
 b=uZT9Nx2piI98UFL4hJrJtNsc2usYaNsPr6uhDmc2J5V/GMWJyxFkMRukvMIjWOZv6L
 JaiEEVOh+ZlFi3p6r8CWI3liJlSR79PuKSYAdbN8RuSWcHGuLnoSDqtH7IP38ybBcokA
 LLEBsxmrC4ypQ/2Xb4+Nhww+/gYnqwCDmQOhc4MlHUF59j1bKdtS3OLee4JAAVe2XlWd
 ktHvsBoeE1gqBt8eTsWysln+DS6c3Pqe4LOy/4B6CgSvuZf5nvF5uk1/+ExEr0ZyaTCU
 rGSH12YUq35MA+MH7M2CnBKy9hw10kTwON8wpqcPNpHDx3APGYVoDv+K5AaxPbX0ydgD
 mScA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7rk7iUiVMjVJATYLOcAHNlWeKrycwJyeBUbAeM9p5vwDleR50L0whrJmcHAFkl9YSRhqhV8GSTPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye2var+VfegiAPk+rpm0A3/mM6rMTz8uShRc1up/DrQ4EpSI76
 tj9rQ7714Nd+22VDvgrJhO+umJ2ZcAxy705GxYP8lkpTjsZQT51u8PO+sau2+jXEfcw10Bgt3+X
 c/lM9l9FRDReEbA0piMToLNCjIbrNbC8=
X-Gm-Gg: AZuq6aJeaFex90YaGt7qh6F9Eg/CqGuNJWAaVnIvMIpZKEHUa/oUVZZErTujqr4/JCE
 LkXXVEDdtsyDFDFQ0OeWomt/pZWdtBZxS47d61/ts0bTENiMaq3hzRjwUxXOm1VN78pH5bmf8eT
 C/n1z+zUAhFqb0sA44srGEZ2bTLoRYIpJN9b2i8REcSD/f7D9WbbgTTfOSjaSpAWQDrJSvWP5Je
 84UiqW2exCiiZ6Uk6NNgqOTwbDnCVAxLzLGU8M6aWqculBXxezzC2FSQOc/3VfJcA3gPtysKfie
 mFz/7ATVWNRoWTaw7Rc0Ecrxbfx044oNfGQI4yvAFw==
X-Received: by 2002:a05:690c:7201:b0:796:2dfb:4aeb with SMTP id
 00721157ae682-797a0cd10c1mr56869117b3.37.1771132921413; Sat, 14 Feb 2026
 21:22:01 -0800 (PST)
MIME-Version: 1.0
References: <20260214070123.41374-1-architanant5@gmail.com>
 <3bb62aa4-d3b5-4dba-b3bf-fc1a82264274@lechnology.com>
In-Reply-To: <3bb62aa4-d3b5-4dba-b3bf-fc1a82264274@lechnology.com>
From: Archit Anant <architanant5@gmail.com>
Date: Sun, 15 Feb 2026 10:51:50 +0530
X-Gm-Features: AZwV_Qh0loZWrFRPUBi3E5XeTI4sZNIryR1c3aP8NOUcorrdWhABwvDt8Rn4btQ
Message-ID: <CADJHxWDgARMDXCKJ+F+z2mOooqxptPfjbYk2dVG38scZ7hNSaA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/sitronix: add ST7789V panel driver
To: David Lechner <david@lechnology.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com, nathan@kernel.org, 
 geert+renesas@glider.be, marcus.folkesson@gmail.com, noralf@tronnes.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 15 Feb 2026 21:36:42 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:david@lechnology.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,redhat.com,glider.be,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1E50013FCAF
X-Rspamd-Action: no action

Hi David,

> Do we actually need a custom driver for these or can we use
> drivers/gpu/drm/tiny/panel-mipi-dbi.c with a firmware file for
> init?

That was my initial thought as well, but looking at the staging driver
(fb_st7789v.c), there is conditional logic in the initialization sequence.

The HSD20_IPS panel requires different PORCTRL (0xB2), GCTRL (0xB7), and
Gamma (0xE0/E1) settings compared to the standard panel. A static
firmware blob via panel-mipi-dbi would not allow selecting between
these configurations based on the compatible string, so a dedicated
driver seemed necessary to preserve this support.

Best regards,
Archit
