Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DB2A2728
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2676E455;
	Mon,  2 Nov 2020 09:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 75092 seconds by postgrey-1.36 at gabe;
 Mon, 02 Nov 2020 09:38:36 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E18B6E456
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:38:36 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CPnsk19chz1qqks;
 Mon,  2 Nov 2020 10:38:34 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CPnsk0Xx5z1qqkM;
 Mon,  2 Nov 2020 10:38:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CmyOEtz0YXK0; Mon,  2 Nov 2020 10:38:33 +0100 (CET)
X-Auth-Info: vplb4A9Mffz9mw/154BQo0iSdT45pj9bltXPIjXlwTMuknypqtdCIHcnZ+VsrgmB
Received: from igel.home (ppp-46-244-190-239.dynamic.mnet-online.de
 [46.244.190.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  2 Nov 2020 10:38:33 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id DB5282C3677; Mon,  2 Nov 2020 10:38:32 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC v2] video: fbdev: atari: Fix TT High video mode
References: <20201101102941.2891076-1-geert@linux-m68k.org>
 <20201101112915.GB1263673@ravnborg.org> <874km91by4.fsf@igel.home>
 <CAMuHMdUMF4R91Nt6mv9Tqz0zSaNh7AV8mghUoKL+uO-_PUH2aQ@mail.gmail.com>
X-Yow: Now, I think it would be GOOD to buy FIVE or SIX STUDEBAKERS
 and CRUISE for ARTIFICIAL FLAVORING!!
Date: Mon, 02 Nov 2020 10:38:32 +0100
In-Reply-To: <CAMuHMdUMF4R91Nt6mv9Tqz0zSaNh7AV8mghUoKL+uO-_PUH2aQ@mail.gmail.com>
 (Geert Uytterhoeven's message of "Mon, 2 Nov 2020 09:39:47 +0100")
Message-ID: <87mu0014kn.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Nov 02 2020, Geert Uytterhoeven wrote:

> 95 ns?

No, 95 MHz.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
