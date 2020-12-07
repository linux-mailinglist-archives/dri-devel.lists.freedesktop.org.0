Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9BA2D1733
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 18:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EF16E83F;
	Mon,  7 Dec 2020 17:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8486E83F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 17:13:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 95917806C8;
 Mon,  7 Dec 2020 18:12:58 +0100 (CET)
Date: Mon, 7 Dec 2020 18:12:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in
 fbmon + fb_notify
Message-ID: <20201207171235.GA2057731@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-3-sam@ravnborg.org>
 <0fb6ff8b-bea3-c5bc-0d37-8a5fdab41abc@infradead.org>
 <dd81dd0e-9701-8332-63eb-2f159c535d02@suse.de>
 <d144fe12-8f05-464e-3c1f-272999b39311@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d144fe12-8f05-464e-3c1f-272999b39311@infradead.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Ajc6Bj9iDLzteYZn-LwA:9 a=CjuIK1q_8ugA:10
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gustavo A R Silva <gustavoars@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Peter Jones <pjones@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,
> >>
> >> Yes, RETURNS: will work. It just looks like any kernel-doc section name,
> >> such as Context: or Note:.
> >> However, the documented format for return info is "Return:".
> >> (see Documentation/doc-guide/kernel-doc.rst)
> > 
> > Thanks for the note. I asked for RETURNS: because the rest of the file appears to be using it. Returns: is certainly the better alternative. I didn't know there was a difference.
> > 
> > Best regards
> > Thomas
> > 
> 
> I'm not insisting on using Return:
> It can stay the same as the rest of the file IMO.

fb_notify.c contains only the three functions modified in this patch.

So it is consistent within this file, but other fbdev/core/ files uses
RETURNS. git grep shows 5 hits only.

So we will stick with the documented practice here.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
