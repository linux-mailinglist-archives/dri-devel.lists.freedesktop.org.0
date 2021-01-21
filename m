Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D012FF3D9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 20:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0273589A83;
	Thu, 21 Jan 2021 19:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB258921A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 19:09:58 +0000 (UTC)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 67463615C;
 Thu, 21 Jan 2021 19:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 67463615C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1611256197; bh=0PfEGC/cPJ5o5ce4iP7kPM3qg+xRX/ZAzMq8mA7LR+w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LfmTwdSQP3IBIFsgIimE+P0zc4qOuRRENhFAbFZ81/G0xiY0DScELhTCtldW3XIfz
 Ugs8obCBqzDnsrsJoi5krEbWrGHjyZPpGee+9oAGUJ1ZDXrSP/jMHtPw39Va3bBst2
 L4SlcWZ4eBnLVGq3hawDKWCzzYzGfx0DG20ajnIZZRO05FEVzu6Z6QH1o0t7hxv9Z5
 FAGLGDnT/R3zaflLKjCnNdzZoWBPmMbSxH+vE+gp8swBNJrsI901YZhh5xO0J5KAQE
 q+gS4MkjsOprcfN5wLvJLeHWfw2eGdzUGLUYeV2MifPW5V3sfXPnjMGNWyuhz0xfWx
 Q0+/sodoN2x/A==
Date: Thu, 21 Jan 2021 12:09:54 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v6 00/16] Fix several bad kernel-doc markups
Message-ID: <20210121120954.5ed4c3b2@lwn.net>
In-Reply-To: <cover.1610610937.git.mchehab+huawei@kernel.org>
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Evgeniy Polyakov <zbr@ioremap.net>,
 Richard Gong <richard.gong@linux.intel.com>, Shuah Khan <shuah@kernel.org>,
 Mark Gross <mgross@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Porter <mporter@kernel.crashing.org>,
 Kees Cook <keescook@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Tony Luck <tony.luck@intel.com>,
 Will Drewry <wad@chromium.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Jon Maloy <jmaloy@redhat.com>, Alexandre Bounine <alex.bou9@gmail.com>,
 tipc-discussion@lists.sourceforge.net, Colin Cross <ccross@android.com>,
 Ying Xue <ying.xue@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021 09:04:36 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> 1)  10 remaining fixup patches from the series I sent back on Dec, 1st:
> 
>    parport: fix a kernel-doc markup
>    rapidio: fix kernel-doc a markup
>    fs: fix kernel-doc markups
>    pstore/zone: fix a kernel-doc markup
>    firmware: stratix10-svc: fix kernel-doc markups
>    connector: fix a kernel-doc markup
>    lib/crc7: fix a kernel-doc markup
>    memblock: fix kernel-doc markups
>    w1: fix a kernel-doc markup
>    selftests: kselftest_harness.h: partially fix kernel-doc markups

A week later none of these have shown up in linux-next, so I went ahead
and applied the set.

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
