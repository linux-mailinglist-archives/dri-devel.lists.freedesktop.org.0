Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB07D6297
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA7010E569;
	Wed, 25 Oct 2023 07:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Tue, 24 Oct 2023 21:45:38 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545BF10E4E4;
 Tue, 24 Oct 2023 21:45:38 +0000 (UTC)
Received: from mail.home (82-181-196-180.bb.dnainternet.fi [82.181.196.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: timo.lindfors)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SFQSm4989z49Pyg;
 Wed, 25 Oct 2023 00:39:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1698183593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8Hrl6tegBZ7YL46PueumA96t3uL0oJQe1ff1LEe7Zo=;
 b=LditiTTvVWNoVAFavoOX6uuFJCXDgFTTY9hPWRUzsg425U4j6Q2rUxUp2lvvBZaFWdF7Lm
 2Y1aecGwRLFXYfe0E1OqLsnZkwud2yyLH596B8sezPM6cxZizygaFNKDR83vo8x8bWdXsI
 2P7xyKHyIgBIy1PTurpOrHhX/G+HXCp8pD096/O+F9ayXgRH9kecCqBLRBc6AWbzEkfLSQ
 mAf4LdL4+UTO4CeIm0lA5OQ7QIxHHygSK8ZhUUOoGCQpY52nmkXPnqokgas+cYn1a6DOop
 ex5gFgJTZD1pe7Nd2yGbSu67AMeDdFdQDf3DLExxscSdRcGVtCofHy7Hxf9enw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1698183593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8Hrl6tegBZ7YL46PueumA96t3uL0oJQe1ff1LEe7Zo=;
 b=qr8NrFnVI+uyC40dCcQH6LX22wPKXffCx1ZF0v8a3nB0uv+RmGlVLRZ9QLi9d3Cu006oyt
 8xQreQW8DW4WulqbUzjnwjtQl1WGV8Vc9deNFL/tQ2iHkzQPeUtZ05cjhe0bGQWTV6hc0t
 cFI40YcXdDNZoF27EeXr6gXcfRc33cQAm033VEQXTQAN0dpjxjRBQoxgV7bPCl9Yju3UtR
 3PnTtSUHj+jxT7lcxOkAF6JmW43VcOcxgIwoGi8yiytezV5JFp9bfQl4MZSh4680Rv4SF+
 U8llOioTt4fJRJRgwRRYDeHeqBBUex4FiDzNs8zlonJHkr93IC3Jt5qI1O8DiA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1698183593; a=rsa-sha256; cv=none;
 b=MkTBklG/qhJpar/gXdwFSqhcySO2Wct/9kFGUHkWtJiKKhcEEhxnF0q3DIzKGoY6x4N4Nq
 6Esg/W3QrEaDVbBGiIQd6ea5TPygg0Th7F1WCR6IsaXL32+SxkQ55nxyGCGCWJax6fOTT1
 hx+KYOeETzuiZGAldv8BfaoiVxhPedEtSdWnplI83LLLewThA01Q1XalAZ5q4S//CSm6lU
 6LlgMKQXE/a/Yhj9QzSiCNOsElRQIe2qi1Lr+lQmwwTOj7NbbLX3/6Msk3CIMZiJFCf1Eu
 moiqL/w4LUbKFydCnzec9aGpgsNMBmn/76Ct+LcHK7EVIrb8uhIZDrEG/TMPcA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=timo.lindfors smtp.mailfrom=timo.lindfors@iki.fi
Received: from localhost ([127.0.0.1]) by mail.home with esmtp (Exim 4.89)
 (envelope-from <timo.lindfors@iki.fi>)
 id 1qvP7r-0007TH-Ld; Wed, 25 Oct 2023 00:39:47 +0300
Date: Wed, 25 Oct 2023 00:39:47 +0300 (EEST)
From: Timo Lindfors <timo.lindfors@iki.fi>
To: Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
In-Reply-To: <ZTgydqRlK6WX_b29@eldamar.lan>
Message-ID: <alpine.DEB.2.20.2310250027230.28685@mail.home>
References: <alpine.DEB.2.20.2310242308150.28457@mail.home>
 <ZTgydqRlK6WX_b29@eldamar.lan>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Mailman-Approved-At: Wed, 25 Oct 2023 07:28:39 +0000
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
Cc: Timo Lindfors <timo.lindfors@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, 1054514@bugs.debian.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 24 Oct 2023, Salvatore Bonaccorso wrote:
> Thanks for the excelent constructed report! I think it's best to
> forward this directly to upstream including the people for the
> bisected commit to get some idea.

Thanks for the quick reply!

> Can you reproduce the issue with 6.5.8-1 in unstable as well?

Unfortunately yes:

ansible@target:~$ uname -r
6.5.0-3-amd64
ansible@target:~$ time sudo ./reproduce.bash
Wed 25 Oct 2023 12:27:00 AM EEST starting round 1
Wed 25 Oct 2023 12:27:24 AM EEST starting round 2
Wed 25 Oct 2023 12:27:48 AM EEST starting round 3
bug was reproduced after 3 tries

real    0m48.838s
user    0m1.115s
sys     0m45.530s

I also tested upstream tag v6.6-rc6:

...
+ detected_version=6.6.0-rc6
+ '[' 6.6.0-rc6 '!=' 6.6.0-rc6 ']'
+ exec ssh target sudo ./reproduce.bash
Wed 25 Oct 2023 12:37:16 AM EEST starting round 1
Wed 25 Oct 2023 12:37:42 AM EEST starting round 2
Wed 25 Oct 2023 12:38:10 AM EEST starting round 3
Wed 25 Oct 2023 12:38:36 AM EEST starting round 4
Wed 25 Oct 2023 12:39:01 AM EEST starting round 5
Wed 25 Oct 2023 12:39:27 AM EEST starting round 6
bug was reproduced after 6 tries


For completeness, here is also the grub_set_default_version.bash script 
that I had to write to automate this (maybe these could be in debian 
wiki?):

#!/bin/bash
set -x

version="$1"

idx=$(expr $(grep "menuentry " /boot/grub/grub.cfg | sed 1d |grep -n "'Debian GNU/Linux, with Linux $version'"|cut -d: -f1) - 1)
exec sudo grub-set-default "1>$idx"



-Timo

