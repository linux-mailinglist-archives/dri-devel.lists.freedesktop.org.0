Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CueOL63gmkzZAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 04:06:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C584E124E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 04:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560F810E292;
	Wed,  4 Feb 2026 03:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IyruQVzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF38610E349
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 03:06:33 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso97673086d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 19:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770174392; cv=none;
 d=google.com; s=arc-20240605;
 b=iOkMDegqF0gJE1IN0Yg1ZRs5HWg3yJa553zuAylYcdIJ5RVmar0ruZOmffda6yHty1
 M4Sf7rktuZ79RV6nqkTkRI/+m5rhM8VXODhJxxs1j5YmJX1QKoypKBxCh1Ye9yNpeHSK
 JibXezMu7gveAGHszghlDlPipCXdZAL2BjviDk4UQ6nBJBKFoWXW4lpr0ubPc2OkZVdy
 o87A65NavSfYcM1RsOpazZIueUOu3+IJPIxqB1irjMu2FOuuVcB306rdpkPGZ0WxXJXn
 lisyiue8T9mj74GpAu2hZtniUxHaZbx1fcoSTk2sE42WBoIhfu0voeD0Nj5hQGyHT7bc
 TJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=A8N9MT4yu1DypaanJBIAJZRniFiCYHpEjQ1NX9sA9us=;
 fh=TrP4BlUZUw4Z6nwAexJ2m4bkf+tEh6QRCZMmxosDH7g=;
 b=VmkWed26nk03vOf5qFj9FNH+KK7OeC8tIIoD4QtmZHVclsV5faC+FAUeg1VmaNjFhh
 Wp4mrkESK7b4C2EbqSSrZPOw5OxUJ6/RRBMF3P6K4Q7Rv61Ul5NeK56s3acZWxn6zT1Q
 3dL5h31U8NEbQy+rwD24xpGAyZER1TC149nFaGBHrWz/dfPZdgwjBi+jaS5l7p3/elpE
 brQRmo9tgp1519OQ7mb64N5V4mHqshLnZKYBlxHv8P1jJDWVIwbBGjQ5QbyHi9cwqNpk
 Ph40dD8J0k617s8F51hWbP0Esy0ArM9IJ7JH6YrrMHyJ8Znzy7nigOewSpQSQBzrj/a2
 qIcw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770174392; x=1770779192; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A8N9MT4yu1DypaanJBIAJZRniFiCYHpEjQ1NX9sA9us=;
 b=IyruQVzJ5hUHgSMYBPvZ2WCz58nvkpFwMO4M+aj4/2TrRrtRT6Dqq2Bo3Oi8WWrVc9
 UHqbRF1O0VAtBdHjoM8H4VEVW2zL6oU37TJdZD8JIjn1E75JiWoeqGO3tkWbtWb2cC6p
 RdAwClMoXPyLLVd26tk0A5jKHXUVo0jeacqdxwiBSTu/zHmTtX1lapUY30af3JEeLlGT
 eySB2bSjiog4tryIZgYnBi7zVIiRGl5BzD6RuCSBKzE++O+xPt9eW/MQGlCCKSbIVa8b
 5ntqdKf9uxqLT5iCDWt3/k3mPOODsQPGNLPuM8L2u06hK20NHDPBmAAVn9oGAclKHfS1
 a92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770174392; x=1770779192;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8N9MT4yu1DypaanJBIAJZRniFiCYHpEjQ1NX9sA9us=;
 b=QnuLOkfCFfV1PEnuw1d64e9vkKVV0J7cd4mQyOlTvJzejPMgcWYhmx1A86LpZgkjkj
 NnF2XTsiWCuCVXLsPNYskDgZsD2+iPJrdyEtzqHCV+6W/hz4ts9hr7t2OLRt8uxv5H7S
 GJefTdQRmiW6RYEfrtrSuW4zM6hFzOttozSsRlhgdTgQDmi117CePT6Qo/a/xGOP5gNG
 MfzOM01jrBruIoNmJ2Xm36u+ePmPm32rU3Dm246JTKefeP4EjHfaBNOQIg487pOHFCnu
 YPauHPHSM8DA9IW8bS/QeG4iaVvqkgy30vIHXtCFNcz0chdPL0FHVK9xUC0tWWrbqyHp
 N/dg==
X-Gm-Message-State: AOJu0YwB0btlJ4k6iwEcG0lQPu4a/wBREmrXQR/dgSG0bDvqTDFGkKt7
 JzEi6eFLZgff3ooclUn0BE6naw26AzAZbdjKQzC3Ldzw0fpv+nE8PRR9IwvMy0JP1kxwdB0PY0N
 NlzDyz2CccoQnmc1YsY9jM3VljwiCcJY=
X-Gm-Gg: AZuq6aK/DfhEjDjyaIEgUbiriv6d9c31Wnd0d14yhEqAzkKgmcTYWqUWf0IreQKCVRf
 9BHrU1K/glMUZK1yyhQYBYgx1QWiFKi5PvIilW4Ld+boS09VSL6m44dca71e7iwow8QqYeOclTz
 0laxNJCrDUoqZkiY5iXWrm7IhI7lanQFVJCXHyW4mN7nF0Lk82myxOtXWmpv+2Zt9/qdoX3/99e
 Z/FSj7tLr2gIVpQiUc4JC/sXjmw3p2qRnUh+EWghXuqwHa5XUTEVF4VQafJYPSAUx3DJPKz6Rpv
 k8HnNmckYfzhBgMognaa4otmq+JXWaLMHz85eKPCkXRiiXxcm1O/NlS+lBGPUVw3JQ==
X-Received: by 2002:a05:6214:20cc:b0:894:6c2d:533a with SMTP id
 6a1803df08f44-895221c7e17mr25625656d6.37.1770174392620; Tue, 03 Feb 2026
 19:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20260203052431.2219998-1-airlied@gmail.com>
 <b805ed6d234c0c154b8f824c4c900e1c41736f7b.camel@redhat.com>
In-Reply-To: <b805ed6d234c0c154b8f824c4c900e1c41736f7b.camel@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Feb 2026 13:06:21 +1000
X-Gm-Features: AZwV_QjfBR7fOGcbhHcV8VzV_YWqVX90mEH07zepS-v0OE-MnLCfx9UcQIBBl_g
Message-ID: <CAPM=9tzqHn8GzFd9H6+=1C8KcHOQgig3tMsq32vMcQR9Hhg=bg@mail.gmail.com>
Subject: Re: nouveau : fix r570 suspend/resume regression
To: lyude@redhat.com, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4C584E124E
X-Rspamd-Action: no action

This is now pushed to drm-misc-fixes.

Dave.

On Wed, 4 Feb 2026 at 06:08, <lyude@redhat.com> wrote:
>
> For the whole series:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Lyude Paul <lyude@redhat.com>
>
> My power bill thanks you :)
>
> On Tue, 2026-02-03 at 15:21 +1000, Dave Airlie wrote:
> > Since R570 firmware got enabled, a number of GPUs have not being
> > successfully suspend/resuming. Lyude showed it on RTX6000, which
> > I reproduced and wasted a lot of time down various rabbit holes.
> >
> > There are two required fixes, the first one adds proper sequence
> > numbers to the rpc messages, which fixes a bunch of NOCAT asserts.
> >
> > Then we have to pass the runtime vs non-runtime state down to the
> > GSP fbsr code. This however requires replacing a bool with an enum
> > which refactors quite a bunch of interfaces unfortunately, but it
> > was the cleanest way to do it.
> >
> > The final patch hooks up the interface so normal suspend doesn't
> > set the GCOFF flags.
> >
> > Dave.
>
