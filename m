Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE462A937A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 10:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EFD6E1B3;
	Fri,  6 Nov 2020 09:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115186E042
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 09:55:03 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E42C721734;
 Fri,  6 Nov 2020 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604656503;
 bh=fq0Ui8t6PiSDl63PaQnqQ+wD7V5/mQ8ZBFhNNG3yCok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iOqu7iq8fkqhQinW+HWeXRONm4gVqP0ORpaGzDUMT9zotN8/ZoAt8k4smbdnLkRfA
 gQF4QwYnBsQf3JTygZryT4dYi6nYvqpqKGLuqzS6PEjkhnobvGexT83gHte/RclSzw
 WjuqDzk0ase4qrOZuSmZgJVWNdu/bBS1goiCMzjw=
Date: Fri, 6 Nov 2020 10:54:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/36] Rid W=1 issues from TTY
Message-ID: <20201106095450.GA2660312@kroah.com>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
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
Cc: Robert Love <rlove@google.com>, Nick Holloway <alfie@dcs.warwick.ac.uk>,
 Russ Gorby <russ.gorby@intel.com>, Kevin Wells <kevin.wells@nxp.com>,
 -- <julian@uhunix.uhcc.hawaii.edu>, Andrew Morton <andrewm@uow.edu.eu>,
 Laxman Dewangan <ldewangan@nvidia.com>, Paul Mackerras <paulus@samba.org>,
 "David A. Hinds" <dahinds@users.sourceforge.net>,
 linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Bill Hawes <whawes@star.net>,
 Roland Stigge <stigge@antcom.de>, Russell King <linux@armlinux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jan Dumon <j.dumon@option.com>,
 Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Gerald Baeza <gerald.baeza@st.com>,
 Marko Kohtala <Marko.Kohtala@hut.fi>, linux-media@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linaro-mm-sig@lists.linaro.org,
 Stanislav Voronyi <stas@cnti.uanet.kharkov.ua>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Andrew J. Kroll" <ag784@freenet.buffalo.edu>,
 processes-Sapan Bhatia <sapan@corewars.org>, Miloslav Trmac <mitr@redhat.com>,
 Mike Hudson <Exoray@isys.ca>, Joseph Barrow <d.barow@option.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 paulkf@microgate.com, Filip Aben <f.aben@option.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Jelinek <jj@ultra.linux.cz>,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Russell King <rmk@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 07:35:13PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Many of these now applied, please update the series against my
tty-testing branch and resend the rest.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
