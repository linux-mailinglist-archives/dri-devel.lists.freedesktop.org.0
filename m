Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFd/EFESqGm/ngAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:06:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37961FEABE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B29A10E9AF;
	Wed,  4 Mar 2026 11:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VEBwpDac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5FF10E9AF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:06:53 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b8d7f22d405so1022374966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 03:06:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772622412; cv=none;
 d=google.com; s=arc-20240605;
 b=hMgAU80AXF39qJ8P975+5UWYaZtsuFAZPbde8UaI9PSAJy2aJh7xTleIIIAWjdpgsG
 urCk9r9312kbX92THOrySf+GrssLSYxnCRDR0S1ADhh6m33m9HujvspkgzdvMa2GyvaA
 ZuLkNPegyASZkqxlsT46D4JXFa4b88VfVCiAJEawgCrneFCr0d/SQyMyr0/QLONNKVof
 zkeE1Ul8TnIIXbDzkfL3JtnnE8mMFtm7dJR4XN07iI+Y++3Rk+ps5r/p0qw/ebIDxhXd
 LMjVqXBdHFfmQQI0THN2oPxvkFeslBwobonxxNNkASZZtJSZ3+aVpAMItsswUmNd/YCG
 FxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2fkFTv0j2bW2/GT0WLhD5i89XhK2zX/tXK9CGn4Uwas=;
 fh=4JaQYWX8Qi/edI4lcgxW9m+eZkKSkFmhjenSihzRlQ8=;
 b=Yhma9cwtvFRTMdVGQYcIU0HW1aUfO152A0KOmvg8KIIqefpoZXliz4Hfbfqh19QOaf
 PF9UflCqLXickGzVqqHrvbnYb9r/lJux/rI61kx2OJUsgdbfVFP0Q4xlENQyNZ0vzmN2
 vkYqCoWowEnHsX7PgFjFlvwqFgskwrLJS1Ls3tGdrPGGWjQ/0bytwUScVNh8yNGzy9iz
 MMLgJwTFTp4KAClsTBLKGntCdJ36H6sUhwQX2h+7+u3Z0zZhkVH6sjK88Uf1uxlqAEzu
 MxDG+WI/SD+1oR7VWGRAyvwGUcsyDMmZdOQ1qoa0j3K1uzY6i+CCq7M/kP5wSBLM/LNP
 U/5w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772622412; x=1773227212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2fkFTv0j2bW2/GT0WLhD5i89XhK2zX/tXK9CGn4Uwas=;
 b=VEBwpDacYc96+t2rqfAP7yr50f8T2uK4oX4fN+GqlcEupHH3l/oiqAZ7bA56Ff5QXD
 XNbeK8W99wYOYSEANEiRnW8ObiDIXrA8Oi0BemW1e4eV2iV/vKfhsmyFF9EneBLlk5+Q
 f+R++dnv+zsYHYKrCt/veZCo/ArAPsPMiLUyNqKiNmMH8OJuQmZkxqod9LQBM8tEPwrG
 wbGkUOzPhTUfDR6aA2e5sfFWA6ixDsrdo8E6b46EM3Ju4S0ECrSxeTk/L1e+5IC/bWw/
 a0OWyL17T0kfkjQJ5UF20uRT1DgflNTedPnGWUjqNkBhWaDIVwpmeK5GoyST12h7FfRE
 B7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772622412; x=1773227212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2fkFTv0j2bW2/GT0WLhD5i89XhK2zX/tXK9CGn4Uwas=;
 b=clLhWtIUNhrKrZxmFwp3BfGqxma54+PvploEBu2XLBB6OF2TIU+ZYUWeSlINBMc6qc
 zWF3kfpaBsu3bgtYNkzDAPQDlLJRX7HbUD95CWX/VXgCzCKiFkrLZRKyQ3Grhid5CTXQ
 P7R00BWWJgJNEEBVe82FkaS6kACQSDA0QiKIllL4hOgDEZYaMO/Qgf43wmZhNuLAF/F0
 4/lJNPAHcICFnsFXgZaWdYSUpnKmN6ZxvJWgPRt7lCIC5L/ZY6PWNsjGThbdBe4qLbIg
 MwJZ3YNW8hl3bfTZ4ugYQ9mdJUKMCdbMvCeKlEjlyTJbZTi/zOLVtHuI4q7WACHk9jJh
 hoRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwT4iKPXx1WPAzodF8ZinS/f0S7HNfmUz4BgdCuSBT+xFn7hNI9j5HJGw5AChmvZiSJbmbKoYK2dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfb/9FVnbXiRdeCLay6RKGZryEwwkK1GheBf1m4uTTpJ+TJaUQ
 PRxBm045kBJZoVUpbWWr7wUZjiFPO4xeLaUXNdDEo1meoinmdygxe/hUqjBPmfycUEyzLcA4AOx
 3EhxTh77L+cGW3bh10H71JGtcIT29Kg4=
X-Gm-Gg: ATEYQzzPQ5LVrvhJl8tQGZ2zmb0JmvOAiW801NWeRMbv7lMBdNKIf3xhDkVRhJ7s5Ki
 FP09Qoq1zCAlxupjPCorQjsd2IOrBXkURvukzBRvkTF7GKyd5KLnY0RNyXpIuLBTi/xX3UkoKDK
 nVzTS+n/SwdXOrtU3s8P1hS7aNsQQ0bYgCh6qMfH4QEdf/bc/c0uslMIvIHJn7oOoMOpLwYYo/I
 InTf3CrIWfPdTadTWzNZ0ksj8wK+tXbvblmGPL4PFtUf4htPZHGeYboc3ds8492MWNh9PYsvU9W
 aUJ4qI721tpaSENDqThxh7rUSui40QXIfJKOpGVwDmTdLfqHqEoP/PIx02wsNIUG9MURmhad7yE
 UWXka5bbZGi9uOnhcPA==
X-Received: by 2002:a17:907:3e18:b0:b8e:d4ed:5ee8 with SMTP id
 a640c23a62f3a-b93f11eb667mr103028166b.12.1772622411906; Wed, 04 Mar 2026
 03:06:51 -0800 (PST)
MIME-Version: 1.0
References: <aaf9uQOBzCwQuff4@marchy>
In-Reply-To: <aaf9uQOBzCwQuff4@marchy>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Mar 2026 13:06:15 +0200
X-Gm-Features: AaiRm537Tqrc3m_d0DtxfH65gd9ff1kw56kzwnPZ5X9o-CIIf_MObBUVfO9E2pw
Message-ID: <CAHp75Vd0FqVJ0z8bsxZtArXRy+h8d7i1_XdUpu92GGuFwSGkPQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Update RA8875 Kconfig help description
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: A37961FEABE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:azuddinadam@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 11:39=E2=80=AFAM Adam Azuddin <azuddinadam@gmail.com=
> wrote:
>
> The current description is too brief. Update the description to
> include the manufacturer (RAiO) and the supported resolution
> (up to 800x480 pixels) to help users identify the correct driver.

While this is a good intention, I don't know if it's a good point at
the end as the idea is to have a proper driver to be located under
drivers/gpu/drm/.
Reviewed-by: Andy Shevchenko <andy@kernel.org>
in case Greg wants to take it.

--=20
With Best Regards,
Andy Shevchenko
