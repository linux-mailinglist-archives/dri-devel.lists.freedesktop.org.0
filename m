Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA2841C53
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 08:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1339510FA27;
	Tue, 30 Jan 2024 07:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162B4112115;
 Tue, 30 Jan 2024 07:04:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40ef6da20feso9793145e9.0; 
 Mon, 29 Jan 2024 23:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706598190; x=1707202990; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=pTUETpTJenxWl+VtgzWBaNr9s4KsWn5wef5pbRbJgpM=;
 b=NWt8+ktYDAufst5PMUdpEjfH6+3jaZoRHxcpejAschn1qpVr7UAjsDV9ncb8PZYmEb
 0WAhZyPGyn/xxLhF491Qp5hHuAOcp7H81VQxIFf0IJS5oLjxgMUJZ/6yUJwm/JN6FHD+
 Aff9GEmEooiz3D0T9OLWq2WVcKSDJl+bfgVf1r/Unfa9FFyIsxoZ9M0JosyZlQUls/Qi
 zjX0jN+c5U1NtZyniZNxheE/GkOR+fZ9elFoXMeFhJL0bzNovtw7fIH0hH5k+TenhE1P
 iP6ER02IaXZmY3J9KpmF1/0GVDlipwsd/16Tg4ZnZXjq1MXGEXAyKGkjdsotP8mgd0FR
 owJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706598190; x=1707202990;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pTUETpTJenxWl+VtgzWBaNr9s4KsWn5wef5pbRbJgpM=;
 b=BTaG8aNAbuxNmiTucf8MeL7xhC5EirA7sh91yJ30eP5SeAMZ5si3+5k4Ooka1KygUo
 I1I48JqYbx/SNTh17yLXyphyUA/phqhE6ZsY36CQ248ZU5bGdK8wMUSYM8N3YcOWziCE
 8hsVD4tk/XUfnqIW9oP2QlrM9tgnfbkQDSap0RQbDfm1EQ0LkVyY8dRjOwjIDS+qNtmP
 iPG3n+PKM9Vdlxafs3HlwDHqpj/yxWE1LYpsDLd1ImdfQ34QU9dU+rU4qwBQ6iYAENVK
 aukJTpICgjTlsgsGWiLtrgWEe/vkZlsC3cNOz8cQiwbGy7gP7TdDHr2mtIsd3Of4nnyi
 fwBg==
X-Gm-Message-State: AOJu0YwdidXCxGgCr/o86pE8B+tyWch4Ls89+RYaZvIzTJfRDfk+/ImI
 BvqG/mI6gHFYgFKMJBOApDG+sPiRpuJFjcVtxK/s+94hysB65/om
X-Google-Smtp-Source: AGHT+IHbCCX5DQ9Y2Dy7lH1GSPWxYoUn+4UQGO+6fgTIAYSzXOlfPa6yFbgtqHrSBqsTJXSwy4N8oQ==
X-Received: by 2002:a05:600c:4fd0:b0:40e:f972:9901 with SMTP id
 o16-20020a05600c4fd000b0040ef9729901mr643965wmq.4.1706598189546; 
 Mon, 29 Jan 2024 23:03:09 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c3b9400b0040eee852a3dsm8839236wms.10.2024.01.29.23.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 23:03:08 -0800 (PST)
Received: by eldamar.lan (Postfix, from userid 1000)
 id 09541BE2DE0; Tue, 30 Jan 2024 08:03:08 +0100 (CET)
Date: Tue, 30 Jan 2024 08:03:07 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Bug#1061449: linux-image-6.7-amd64: a boot message from amdgpu
Message-ID: <ZbifK8M99hTDIsD4@eldamar.lan>
References: <170612149675.7169.757906919183146487.reportbug@kos-moceratops.home>
 <ZbUB0YWxEET3Y0xA@eldamar.lan>
 <acf203a8-b612-437c-a464-228f45e1c694@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acf203a8-b612-437c-a464-228f45e1c694@leemhuis.info>
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
Cc: Lewis Huang <lewis.huang@amd.com>,
 Patrice Duroux <patrice.duroux@gmail.com>, dri-devel@lists.freedesktop.org,
 Phil Hsieh <phil.hsieh@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[for this reply dropping the Debian bugreport to avoid later followups
sending the ack to the mailinglist and adding noise]

On Sun, Jan 28, 2024 at 11:44:59AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 27.01.24 14:14, Salvatore Bonaccorso wrote:
> >
> > In Debian (https://bugs.debian.org/1061449) we got the following
> > quotred report:
> > 
> > On Wed, Jan 24, 2024 at 07:38:16PM +0100, Patrice Duroux wrote:
> >>
> >> Giving a try to 6.7, here is a message extracted from dmesg:
> >> [    4.177226] ------------[ cut here ]------------
> >> [    4.177227] WARNING: CPU: 6 PID: 248 at
> >> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:387
> >> construct_phy+0xb26/0xd60 [amdgpu]
> > [...]
> 
> Not my area of expertise, but looks a lot like a duplicate of
> https://gitlab.freedesktop.org/drm/amd/-/issues/3122#note_2252835
> 
> Mario (now CCed) already prepared a patch for that issue that seems to work.

#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/3122

Thanks. Indeed the reporter confirmed in
https://bugs.debian.org/1061449#55 that the patch fixes the issue.

So a duplicate of the above.

Regards,
Salvatore
