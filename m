Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFeJHcWhjWlh5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1293A12BFF7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5069C10E70E;
	Thu, 12 Feb 2026 09:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ks7wDTvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D026510E359
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 09:29:08 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-81f4f4d4822so849488b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 01:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770802148; cv=none;
 d=google.com; s=arc-20240605;
 b=LPy3UMe8vx2C3Jw1rijRMLm8qcbUzMGke1lvC1FQwR9/wwaF35/LA0WeGORLO0lcgF
 yfXN9s0zM1PdKvTHzyCdrMRN7quHK4BzvZeyeKHgnx0x1sLbfhyj3kU2Xd04RiPLIVbC
 DrQq8TzDp5LWXmvM+NOtcoWZESqssQXNhe1Hu8ilfKdMWYksJxr7YdIsRijUg58kPH2P
 QViNU/FX8WSaNkMLRMLYTRmY8vDemTAq+EfqZbftxRPza4rgLimYwrV1etkZdLWg+akz
 qkb+g3hf7NYS86L9UeUSj/2zgpMAWodUYHpav4JfA830AeTmQ4G8GdagXIdKR0PTHX6U
 BSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=aUbA9gGxOOEYzhQsTmOgo18IUBnbAndmse6CKYRwrX4=;
 fh=CHhGetTqrTq7CVL/M2VU/rPaSgeNpbSrZbYM9Sf6Hws=;
 b=BJtCyv6oXCc5bydgwXwvG8yWRkWeTvDGq/Nhu4tOH4rhEB2hUUffbJQVc79s+Xbd0r
 YEeHLz8L48Y7+SzW5NXgxVPEOCF1EJraIWHEf2HELln1l53397ZVbR/rIYbV1f87teJE
 cH0SmMDRm+yxSSDNC7lQgGYp/aKZHzdf356kvmW3Xf7b45/MwgLhuWQXHuOcB4gDIpHl
 iIYIfz3MXBhNiqOlcTuRqTiQU4BTLbXIrHafOr/yUnEtXQJVYs1X6D5wRLQmXu6vTGix
 81vLROBKl0lQDqWNhZlr3Ws1sYmbyh8eMd2FT78JQJHxX5Eg4Z3PY1Custo6SSAdbVQ3
 i1Gw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770802148; x=1771406948; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aUbA9gGxOOEYzhQsTmOgo18IUBnbAndmse6CKYRwrX4=;
 b=ks7wDTvApVn4ym33WO4waQRF9G9QlQRRGFTlmnPU20RUu19hKgyKhLaxFI8tOTHn5m
 hvRJP5ZFaZCEWHucW01AxvEfNAruwwjAMHNzy9yFUsimlfetq/ic6p1grnkCMoF4rVQO
 /8WsuptXgRnxT95uIAgslWmVM/A3vH+LIChiYFzsdsZMjVCWZkZ1BhMc1Lnc6pKOsgJN
 uk44ftg+XNgEiLIQmooDo1+cokL9iAMoeyvvKgExgV2LMmjzELadQ9GCYlIzIhUI6Fg1
 K6Qu2MxIYndxYraDozI/2qNsUgOSuJLazECH45+6xJuAIR48ic4xNf0vVNt8ksni1aUC
 Paaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770802148; x=1771406948;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aUbA9gGxOOEYzhQsTmOgo18IUBnbAndmse6CKYRwrX4=;
 b=MkFFGkhKThL88y6fe2PUHrlC6BaTxbKs67yg7tRkygsCywrLMvBVJ/fu6xBNWbgKPq
 JguoHFhJLnNdLvs02mhpmzVcjZb364bcLfcRBTIKVd9F/+0QdAyCgtjT0XeMWvdwfkr1
 wgO42Sww9r/9GB56K/4NJLRVIFJgXffQO4rMoA2dZLa9oYzP+vpZAEuBMOPYcur1oAXT
 /0mMWJd9BLqtMDosMvh/TXfXUm8QshDA0V5gmC9J3KS8dtyfTrjrxlmgb1dyBdVUv8Xq
 AlXQdtm7gu5qPPSXA0MrQeNTljx26ksFia6ZwLF/8yRuBppl+MqVZEVBksVCYURWjlWA
 kfBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtn3fLrYudL84Ba3FdboFGTYqlUXrKhpKKt/fB40ppPmtpeMj7ld/u42C04y2s6pH2dJB9QnyZXQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEay2gO7baevqP9pibyk2Xs655PIiM2WDkl2kvgHHHEhUfNe84
 R2xNJDZnmWJnFjOcHb8zHpNJLURIZ49OLgURpTx940ltpzRFGWBBolkavxjUip0pwZm/buAk9Xc
 6CtF9Tb0pb0RQbpWpALXDM7EIgYaM7Ks=
X-Gm-Gg: AZuq6aIycCFISLmtiaHp1chyLO/S7C6LdJuO0uq6J771XMDeife95OT/nWRuN7MqsDv
 WCTmsExRZL4CLGhdv1TMTaY77tZxP/xuYLzfXA2W4XBlSa1ORf6BRdqRyt8U1OjjdG+0FgG6Ss3
 54Bp4IrC+wm3PqOozHKQq99rbJDNBr9I0UcNGYdsBdT836gYiALA3JHyREqYFgqObDkvgCCW4o9
 bYlKFro/2Fnff8Tp38G4dfan+iy2jVJNT5uwXpYf0kjO53iyKkA9ULSeWoS5nCkJp+tWkRSlZGP
 CI83Hw==
X-Received: by 2002:a05:6a21:6016:b0:366:14af:9bd8 with SMTP id
 adf61e73a8af0-393ad3ec860mr18302078637.78.1770802148294; Wed, 11 Feb 2026
 01:29:08 -0800 (PST)
MIME-Version: 1.0
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Feb 2026 10:28:55 +0100
X-Gm-Features: AZwV_QiVqa8nk_229fGgFvAqqTvdw2d0iztKljKI9n_cT6yo2PG5Hw6XUKahYLw
Message-ID: <CAFLxGvyhdpQMnW6VqyXjLPKyZSQvrV-+GFdUogV4JX7DiGePyg@mail.gmail.com>
Subject: PWM implementation in HWMON and backlight
To: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, 
 DRI mailing list <dri-devel@lists.freedesktop.org>
Cc: ukleinek@kernel.org, lee@kernel.org, danielt@kernel.org, 
 jingoohan1@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 12 Feb 2026 09:47:42 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DATE_IN_PAST(1.00)[24];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-hwmon@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:ukleinek@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:linux@roeck-us.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[richardweinberger@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richardweinberger@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,roeck-us.net];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1293A12BFF7
X-Rspamd-Action: no action

Hello,

The backlight of a board I am working with is controlled via PWM.
Naturally, I thought this would be a straightforward task using the
pwm-backlight driver.

However, the PWM in question is implemented using an NCT6106D chip.
The associated HWMON driver, nct6775-core.c, does not implement a
standard PWM device interface but rather its own custom one.

I am a bit puzzled, is there a specific reason why HWMON does not
utilize the standard PWM framework in this case?
Also, in case I have overlooked something: do we have a backlight
driver available that can interface with an HWMON-based PWM?

-- 
Thanks,
//richard
