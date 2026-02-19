Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM1+IMIxl2kcvgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:52:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED9916066D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D51889A86;
	Thu, 19 Feb 2026 15:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RlpqgSQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA27D89A86
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 15:52:29 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-64ae2ce2fe1so1078905d50.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 07:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771516349; cv=none;
 d=google.com; s=arc-20240605;
 b=eQOoXajZ/Sdrpe7dS+gysuDgCNYPy3uqSgD+wHKYzUYGp+96/HoPrY64dI3l/BWLpj
 XpZLAGj/nXZREt//mN3kK9MMhcx0jaTQ273cullP1mLU7Wt7XKP8etMwnykx5HECqEMU
 pQrgmmxZHPItiB+6waL2whz51z8fVzDhg+sMYrJ4rCMY9zS3xwakx/qFx+bYtwPpXrGQ
 NfXmqkDhNygjmPuFkjXfJERMfu2/VtJn44oZMy1smB6ojDPev2Kox1I14T9webf3HaEz
 YIc3B/im9sNde0iTPPhvJGEO6R3e57cD53do2HoP2VDXPaf0BJujmEipaKN1BuHDGAsF
 FkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7yzzIIrVgq9Jg2RfUWSeJddUowCepHH8QPJc/aM30to=;
 fh=wg7aAi7g3J8yZ9FRq6OgQoHkSjJlz1VJoOxxZDS5OXE=;
 b=ZhWVGxCw1Ay33Fv1slsGMuf6WURqXfl8MFRVYVO5k7X0irdArLXaI0qURac/WTt+zj
 nEwCxc4rbn1Sn3OTz41V5pGiAEBBR4s7O3Zekpyj6pHQEjmtlrxbYeWygR3x84a1nIwR
 GP4A6S+Og+Q2CM+WHm34RmVfq8djZ83o1z6I4wyU9cCDxnHLwXQcT5I3utEdpOuk7TeY
 1zmYbVVKnALmeXbkF3hEWP/J0Y81A90Udk7a9CEHPw2bcHkbqCF1OaJ0+Bx+FiWc7Ynz
 uGgeuoFFkZ0A7/RHNPj/IYeNqm7uOPPg8OXDlL7ikG/Wy2vv9CSn8SKfpR1no3m1Wtbr
 QcaA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771516349; x=1772121149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yzzIIrVgq9Jg2RfUWSeJddUowCepHH8QPJc/aM30to=;
 b=RlpqgSQTRJhWcj0jbmELz8F2T1EY8pLmmonZ4nLt6U71IAVFA6ZyJPGDGkr63oG66n
 zCqXKfsve4HUL1om27cj+pX48kX3Md3XsgPzchEsHf+hPt8cS0upAsqTA5YyNkj6Vjbc
 C9i0bBoMvk6KQ6YmWWTvEU7d+/nJnH2NJgfudkuBKVMktS0GQXS5KkhUQB+TIpvh6MiN
 EZkRLqaIVj2ILnx+urHLLpWD4UmjqNzE0eq68u/INdIQyMvx4jfs0BnZHJEm+fE7R64L
 HshXpK1z+XSB6zW3gdO9QfKY4zdX63anhtjZaJCveZThJU/Kg2YScg05mbIPbxwwUMxl
 lwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771516349; x=1772121149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7yzzIIrVgq9Jg2RfUWSeJddUowCepHH8QPJc/aM30to=;
 b=RJDJ7u5mrn3c7eqxkFFJ3pD51xCTSnxqgEMNL2wkoOiBKBvQ/fs99VPB6UMl+BKg5v
 2+Iqjc7Sm9isnwPVpPQ6jeOS/xDIpNmj8N/3aKDajqWCS4QjJltlaG2KKd2S4Rd7XZ2Q
 O7HuwNp7d9zNDwCimZeiFzGsplG1hCMTEVbLSEJ8BT5+yM/EECRCSRv+BoFjnsPR4JUn
 U1nIS+zFan2QVL0wIvM4ggaafBuVG9lV+jHiq7VBvFV7LFYRG6RcDWZwVIdIwf5f34q7
 0OFs5yJs3xQKVkpT/WPsId4LMfdkR/oKFZiec/ESQsCGebeSQYIbQNyaHaMPHDEYnktM
 2fiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQdN152avBDT1GCpCqTIGgdgRnJKHkn14kedBD1uO5sqplAqoQppBJY+Xv6AXOwE5+ITMw1VTBts4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvE/tJrXOxiwordLS807I4CPqPgCvBtreyDAqm60Ikr8A2qqEy
 OlcniSLFKZt+fgA3VQ1ymcxfGmJLsYh1jbVWKBJB634dgU9BsDDB01nwd+pD/rDgyGZQcNZDlbc
 L/U3YKXMiMJUFhU7F8v5gJ2ZZ9jSxqR8=
X-Gm-Gg: AZuq6aKXD3cSZlMW4g2EMYVmSSnv9yWHe9vdJ0Jx7uaE7rXoKCMXkgOD2mpyfaAD8Hj
 lkNvwNJjCZxHnDCvBwB8oEkrqBpVX90OBE1CVj1VxLiLNl81r4ccMvNzbsjO9wLTRsE+y1d6sLH
 0uBpi0DLQ9jHFhG2U7y/y1Ic5hx0Q01G/oetHPG89NIOPkxEWELDkpDZ57hcsYQoF7RtKQwY92t
 FZNgQ1Wl8JGmUBhs4CjI1iksu8XiblrNV3yX4znpAip494h0QlKwFXNPLGde1SmywfvBEdawdh5
 1BA/SCMOlJCx+ci0sKpwai13ekKpsOYBdAzFmZM8/Q==
X-Received: by 2002:a05:690e:140e:b0:64a:d67a:1fdc with SMTP id
 956f58d0204a3-64c555626a7mr5259341d50.13.1771516348717; Thu, 19 Feb 2026
 07:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20260214070123.41374-1-architanant5@gmail.com>
 <CAGb2v679248jj4CwQhYAbTUiPJ1=-JqX15CaNY94Cj_dFXwZXw@mail.gmail.com>
 <CADJHxWCzbzD3MK+NLS3UVqXeH4cKop-ErNSnn_RUmAzRLmk7Mw@mail.gmail.com>
 <87ikbx6sf1.fsf@ocarina.mail-host-address-is-not-set>
 <CADJHxWD-UpjgGKst_CDPqXHADVPJY6KL296VFOq6WFBEKqVong@mail.gmail.com>
 <34dd132a-ebec-4116-865b-72e46b7cf520@suse.de>
In-Reply-To: <34dd132a-ebec-4116-865b-72e46b7cf520@suse.de>
From: Archit Anant <architanant5@gmail.com>
Date: Thu, 19 Feb 2026 21:22:17 +0530
X-Gm-Features: AZwV_QgcPKKZQH9oewjFdQwJTPkvQQ77f07yMCMdVomkfnyxIR_tJY2rBsCAumM
Message-ID: <CADJHxWCqqiMRQf=X3YNpiwEe3cnmjOZnDiRrxB_NamjpsiYw+g@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/sitronix: add ST7789V panel driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, wens@kernel.org,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, nathan@kernel.org, 
 geert+renesas@glider.be, marcus.folkesson@gmail.com, david@lechnology.com, 
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:javierm@redhat.com,m:wens@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:david@lechnology.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch,glider.be,lechnology.com,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CED9916066D
X-Rspamd-Action: no action

Hi Thomas,

On Thu, Feb 19, 2026 at 3:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> The thing is that this driver builds upon mipi_dbi_dev, which uses
> simple_display_pipeline internally. So it might be legitimate to use it
> here. Otherwise all the MIPI support from drm_mipi_dbi.c would have to
> be duplicated.
>
> Best regards
> Thomas

Thank you for the clarification.

Since mipi_dbi relies on the simple display pipeline, I will stick to using
mipi_dbi structures for this series.

I will proceed with rebasing my work on top of ChenYu's series (which
also uses mipi_dbi) to add the standalone driver support.

--=20
Sincerely,
Archit Anant
