Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEgYLFD+emmHAQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 07:29:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782EAC3A6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 07:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D3E10E002;
	Thu, 29 Jan 2026 06:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dHUiJQR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D3810E002
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 06:29:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4806f9e61f9so2746185e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 22:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769668170; x=1770272970; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=puA+CnwxAlMqbOnhYN3pZRQlGRvX1b7vDRdIRgp2KfA=;
 b=dHUiJQR5x1lMzKKRfVGy+JWemZo8mzoAIJtLg44PaFiPf5GsW/6uu54IH9MNyhWEkV
 H/Ydic97UIkABG2fxqvSpQC1sOz0Dq+PFBTlBmFGvvXYaAjWW5Hf4VjlZLeQWvwcd+C7
 CjMt+k3Kyxh/tWExKZ65gc5H4ehDnJ+lPIw88oh7nLtuM1jA3N6eUn1hIjVuAOGV2OhW
 Hoji7m1Vk6lDq8IpYyWlNTqmB9OMKTiAmhWFvR/AivVpHGipHcnvxlOFNhU9YVYyvC/6
 +m5MdZxJFTS7KX1KUtyRa/+CFoNedztcf/llw206ix0k+K+CaAhRUbN6zguBouuSY3j4
 OPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769668170; x=1770272970;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puA+CnwxAlMqbOnhYN3pZRQlGRvX1b7vDRdIRgp2KfA=;
 b=jNW0VTPb4X1qcuCQ+7sc8wA/B8fT1vH9CVeoPaiDsKYAWNEUfnBPjM5Aj0frLKQWHQ
 WZI3zM0dwxZ1vqsLrBO3H1sD9cErkZxh2rU2s+C4ueW6G3NEisGgC4VO8D8QGC8xxjYD
 HJIwMTydP7doCYha42lac5gxYMcy0rs7FkNgDXmydr+4/MumEwPCJlOYEbHXM8FLV5xD
 m5uzbLMm6OCYqVNzSviztbeYJB+BWAjkCSJcplR8rg3unKqFNRjaW/gqxhoF0KCZwJjX
 ra7VgRisFl3hlA/Xq4Ys6sAhi+w88IRBUManbI+mSdwjnAEKhyZrAMEh0wimc+d4tiN7
 CyjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOkZmkNBtnkhufGEk4uuFidRdSz5QAo9H/X+QK7ExM3VtbZIJor6cQ4pzsq3MrD/XfXi+1F9niYNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb2ZkM8nVi1XG6J0Y1RIZZZdc2A76fhCbzQ73JoiQnc9RBDo51
 tjtXfw2MY+OcIg/oSYouJDU8EgTLlJheP348nTmZ7nWsOcHzeCTV5AiRqcA6yK3v/Go=
X-Gm-Gg: AZuq6aIRsLe77SO7X9HNHiXCyAzrK9r9CdOwmjPntftsNxsXu9FBO5Zblzx44GInAIc
 6SEASYxMzqO3/KqcohgfPo6tWsgPzYTkPtuEMXrLGzr7roG1FuMqtqMnTy+xAgQhqMbLjNwCZ0E
 Oc+rQSIxyp9arBVVJQXLxcRLCsVo2Q3A33aqtKMC8moNV5u2Do1vsrQdF+KMGC5vs8hQrLKCFDR
 4Kl5TkEgGI8rATeT65zeK5kxQWQ6AiLXHgY3aK2rkx8yGe02dyxDE2LpfMmAXnMLKEXyFK1ADoo
 2vv9/SnRrTLf3/iav5vaodUS+oS86FQAHFnrYRd+pmB5WPcHxL9ZV29yYQ28I3gLozgs2ir81qz
 u27tGy8h7P26C5rfcz8UNtoraS0aLKzpWdyX/Yjt6VlPiQ43NtbFIDsjxWxF7YPu9PlnfF4Puab
 +FmNfgkIg48L5D0fxd
X-Received: by 2002:a05:600c:468f:b0:477:a9e:859a with SMTP id
 5b1f17b1804b1-48069c6948fmr105945805e9.22.1769668170238; 
 Wed, 28 Jan 2026 22:29:30 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffc0sm130968845e9.5.2026.01.28.22.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 22:29:29 -0800 (PST)
Date: Thu, 29 Jan 2026 09:29:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aXr-RhUXwIvMHYZI@stanley.mountain>
References: <20260128203938.962414-1-csshin9928@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128203938.962414-1-csshin9928@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:csshin9928@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 0782EAC3A6
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:39:38AM +0900, ChanSoo Shin wrote:
> Instead of marking the entire display as dirty, calculate the start
> and end rows based on the damage offset and length and only mark the
> affected rows dirty. This reduces unnecessary full framebuffer updates
> for partial writes.
> 
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---

TL/DR:  I suck as a reviewer so I would be nervous to apply this
without testing.  Andy is an expert here and we trust him so if he's
okay with it then great.  Or if some other expert could sign off, but
I don't know enough to sign off myself.


The problem for me is how do I review something like this?  Staging
is a grab bag of different modules and I'm not an expert in any of
the subsystems.  Normally, it's easy to review staging patches
because they are clean up work which does change how the code works
so I just look for unintentional side effects.

It's trickier to review a patch like this which changes runtime.  If
it were fixing a bug, then I could verify the bug is real and say
well, "Maybe the fix is wrong, but we were going to corrupt memory
anyway, so the worst case is that it is as bad as before.  It can't
make the problem worse."

This is your first kernel patch.  You don't work for a company that
makes the hardware.  You said earlier in a private email that this
hasn't been tested.

The patch looks reasonable to me, but it also looks simple.  If it
were that easy why didn't the original author do it?

regards,
dan carpenter

