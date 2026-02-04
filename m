Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL7QKd8Rg2kPhQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:31:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DCE3DDF
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E66010E5A2;
	Wed,  4 Feb 2026 09:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SR0MdOrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A8710E59E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:31:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-432d2670932so5901909f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770197465; x=1770802265; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KG2GKfbQvjEW2JmZRuLJwTnuQG9bribyjhWUk28KFDY=;
 b=SR0MdOrNMsiqNgBQYYjZBD7Q8Pr7+uXdPsLpnL2iEqcqKwjyHldUjQC5aXQ4dxLTO3
 b5cUQcspn5UjUDFgrD/P6lgUkmgEHm+zBqIYHaYQ+VGAu4UgrmAOw/qZg1jxAGH/bk90
 WNaIu7/7Uaz+GpVIiDBfSkvNyA3yjNPTF002iUkh6S9iGe8srAiPN8nNOwbVEJx7fNX6
 6v0/r6bo/BEWE4tJCEAscWXYfjwCGkFS814KWPpBVH9gI2w+5aIf6psPhXyZtkXf4MMP
 Qf9q7JLomkALOKAUB/8lgfi6iohV3Ba8R5nGrQFs0XMYEsX9AChTmdkCg0mRDdrtiyPq
 t+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770197465; x=1770802265;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KG2GKfbQvjEW2JmZRuLJwTnuQG9bribyjhWUk28KFDY=;
 b=OKUCXl2WVNO7DTLaGXRU9kVJEFgkaBovHCad7QQVJM9yvmnJVZ/ptBAE07Owt1gHuI
 L9A9CMej5XujmnYXTrsfATxrpxI1hBLxJ8X96ofbG53uiikC8v+0t2r+Q9ladOgv15G5
 6BhJNJR6SAtZ6D3hP0d9cODutttBV6pU3cGoAiu1WiEoe56R9x9jHpuZh0dd3WyZ8oos
 qOVlUQag/1EegREmujv2iRQYI/4juhQZZut5N1gUiKdPzTEyEnR4ZSlkfsueqTsgwnXT
 0pnuJ2JeM/MB4xfdRtmek6bviEeDjqpXMObv2iETCaBF1/NgsoihjUefgUnOp5hTl/Np
 e3Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq/NGXpb3zoA2J7txCs4iiWg2w6SxVA40iCQysnhIRh/8yjzoD1JdJn+vBkYD0V0cqT1at+4HenE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycIJoUJY7Zrto24pZRvqk+YA6YYbMU7w8ZBdv5o6R6OblHF6nv
 8vL5yJvtff4JkWbPpeGU9EiD4RPQv5qW5kbJfwPtmmcO+Sd4wglmD0+iUiHSpc8UnSs=
X-Gm-Gg: AZuq6aLxegIzCVKYDoJt72UICMIdM4tZPUFG9QEPtkZImQMj6lkhD/5nJnhuvsRbHUK
 32b5jYDS0GJvnaAt5FS932ePAlF2wrgHJ9Ay4Yc/wgzzMQiXJXNVYF54E6sk+C3D1QCb8abvz7E
 0m0nvTuIIRQReuuQgIt+snY3sxY656kMiQmQmNbH/T5bAhK9PuhJLIX70SRZxYt139IQEdEcw3H
 BqVb3mS+XDVftBcrGbqdtAGdr5fKGbwPUIrMcPn/rPaQGaVH97o8rFMz3SYhOI6+AXTlN9EvzAC
 PDt0C6FS7nXBg9sL/u4QAHR3EKaDyZp9MQ4RK6hsJXgDzlotZAbpitQOMaHQ64n4OKxc9TEUOCm
 mtCAd92Y7SluaG2V51pN0czZWaCSi6GMhCCAn71thEbsF1J3SC7FMnDvLN8RedlASDzGh7jOXc1
 2hMYGpPz6WpAB8Zep4
X-Received: by 2002:a5d:5f45:0:b0:430:fa9a:74d with SMTP id
 ffacd0b85a97d-43617e3fff4mr3072034f8f.24.1770197465047; 
 Wed, 04 Feb 2026 01:31:05 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180588bfsm5307015f8f.26.2026.02.04.01.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 01:31:04 -0800 (PST)
Date: Wed, 4 Feb 2026 12:31:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "staging: fbtft: remove goto from
 define_fbtft_write_reg macro and clarify empty modifier fbtft-bus.c"
Message-ID: <aYMR1Q-Fifzts8gH@stanley.mountain>
References: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishnaworkemail1308@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: 112DCE3DDF
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:17:27AM +0530, KrishnaAgarwal1308 wrote:
> Replace the goto-based error handling in the define_fbtft_write_reg macro with an
> early return while ensuring va_end() is called on all exit paths.
> 
> Also add a short comment explaining the empty modifier argument used
> for native byte-order writes, instead of introducing an identity macro.
> 
> No functional change intended.
> 
> This reverts commit 6eec69e273e124dca8549fc52b0958b2953085ee. As per maintainer's feedback.
> 
> Signed-off-by: Krishna Agarwal <krishnaworkemail1308@gmail.com>
> ---

There is no need to revert the commit because we weren't going to apply
it.

Also checkpatch is going to complain about return statements the same
way it complains about gotos.  Actually, I'm surprised checkpatch
complains about gotos.  Does it differentiate between local gotos?
I can't be bothered to check.  #LazyWeb

regards,
dan carpenter

