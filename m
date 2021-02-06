Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F420A311F1A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 18:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48686E497;
	Sat,  6 Feb 2021 17:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D478D6E428;
 Sat,  6 Feb 2021 12:47:36 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id y14so10524902ljn.8;
 Sat, 06 Feb 2021 04:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/z7HFF3L/qI3FvkGB7cDrmovm/gwu9it6WOSqPW1Scg=;
 b=rpVOK/Rd+ASx3prdTxZHrUJZejSp7hH4U8F7NpDj9T5UkUTPfSAASfTEOxSvGSCoY4
 HAU8U6PIh5eBMnpifru+4ktXo6U8dhLr4UntJQ+Ty8GyA5Ce3Ftxb+rvAetptvq4EDIn
 8AOGuBQL81nhWUHgmGLt1LnIKeQ2FlQRd0OIRvYnIzqOXgr/j2M+fbrqgXZf6KkBwidZ
 ctYs4eMAXL7yN6Ey08jKnrbsjr22NoxCy8H04JrgYTRb75C8MIm62RMViPdm/tW4w/MS
 RS5dxTOqm+ZSFNyGgSuQdx+xF4ihXBlXqan6m3EqBziSfQ2sg9TtNvpw+Bt+N5qS8gJa
 D9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/z7HFF3L/qI3FvkGB7cDrmovm/gwu9it6WOSqPW1Scg=;
 b=st/Rc8oJ35Kot96ILQ9z+KvssK0aVxNZ5kWm9H49RQkhKmDNkqhFSINLLxG+gdfStl
 1uexCAfYJjpg27tHnyV52f6LJS3iFyQLVtItrVgvj4AuxERST6uzoFvIf5UdcC2WP/sI
 b6nIwiIE8LbaTrF3g6sNrIqSdrjbUFOEMw9XyfM5STExPbgF2OjzOjpHYyqMeenPcQvo
 Xeb5FkBbyN1UEe2fhSJusnvfAyMR9PkmpbhqeK0+Dmy7OcBH36bT/2a6+60p2sAZT9eV
 IkvrCZAv4qzi5zQ06ygMgd8MUkcee2SE2EF9omWOtlwhot1on6GEDAF60Z8PEAzW46Qp
 aCUw==
X-Gm-Message-State: AOAM531ux+xoNWov6P2XF5/f/uhEDsz5eKTUMM40SRF2rEd8bhEDVzwz
 H7dmyVNFMXP5DztZwEIowZ4=
X-Google-Smtp-Source: ABdhPJyO0e3Ypvqx5DBPT8VEOqHxfnsDG3RyNFOa/SOLmE4YPmAafx82BiTBU3OQjif04/Fyljtz4g==
X-Received: by 2002:a2e:580b:: with SMTP id m11mr5605637ljb.426.1612615655093; 
 Sat, 06 Feb 2021 04:47:35 -0800 (PST)
Received: from grain.localdomain ([5.18.103.226])
 by smtp.gmail.com with ESMTPSA id q63sm1300622ljq.35.2021.02.06.04.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 04:47:33 -0800 (PST)
Received: by grain.localdomain (Postfix, from userid 1000)
 id 5F21056011E; Sat,  6 Feb 2021 15:47:32 +0300 (MSK)
Date: Sat, 6 Feb 2021 15:47:32 +0300
From: Cyrill Gorcunov <gorcunov@gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v3] kcmp: Support selection of SYS_kcmp without
 CHECKPOINT_RESTORE
Message-ID: <20210206124732.GK2172@grain>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205220012.1983-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205220012.1983-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Mailman-Approved-At: Sat, 06 Feb 2021 17:20:51 +0000
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 10:00:12PM +0000, Chris Wilson wrote:
> Userspace has discovered the functionality offered by SYS_kcmp and has
> started to depend upon it. In particular, Mesa uses SYS_kcmp for
> os_same_file_description() in order to identify when two fd (e.g. device
> or dmabuf) point to the same struct file. Since they depend on it for
> core functionality, lift SYS_kcmp out of the non-default
> CONFIG_CHECKPOINT_RESTORE into the selectable syscall category.
> 
...
Reviewed-by: Cyrill Gorcunov <gorcunov@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
