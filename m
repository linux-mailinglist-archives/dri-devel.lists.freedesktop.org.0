Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D39932169C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 13:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1898F89361;
	Mon, 22 Feb 2021 12:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 505 seconds by postgrey-1.36 at gabe;
 Mon, 22 Feb 2021 12:22:04 UTC
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FC56E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 12:22:04 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 04947AAD;
 Mon, 22 Feb 2021 13:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 message-id:references:in-reply-to:subject:subject:from:from:date
 :date:content-transfer-encoding:content-type:content-type
 :mime-version:received:received:received; s=dkim20160331; t=
 1613996015; x=1615810416; bh=su6lN/wfDzpqvIMHiCSOa35nXcRiEiL67qu
 Y39rTeko=; b=bM0Y5l8y5eb5/KPO2JNE8jFtVjv6yO7e2++iJoOYhuf0nbqsWPU
 lpLCwWbqoUAQa2xzqBhJTanYdzMxcEFlm04tWblVBSTwH+RatT44DmjjNpgKzipQ
 SWwTK+lhtFB1FkRL9m+7aNNnGrJcjqQeW1aQNdeLqHM89QRAqUxPw/bolSmzWf+x
 6JcwYfBjUBTJDLCyFwKdU3LQjYeBZoptDj7AesXuMTY5aOyJJhi/5PhjBdK4CqRe
 eKUo49vLEMq7KdA4oQc3XJyot+sQegPgyrBP8XGIkH6mUkceehlDfieXeBwBXP9P
 3TEPVNanoWPGj6mpwBHONwrGS69y6VLSVCbW8BeuNd1kpyf960OMa+HnaDO3wMP1
 M5UkqYqqePqb4hnKkQ6gvROcM2TK1yRojKFETbtDe3LkpJU1cU02YD8L5pXRzYbM
 RVxmQOQKuf9GEJLlNd1E6cvarxQ6qzHQfzU1KcUea/YDVOPbVnmbxHYl3wHjz/TU
 RN6qXa495mCEc4rd9gzFcfqQKaYBz+9qgpotD9EZ/5amflvn4GOCpcvm7DHf54N2
 Puy5M4GwIfOZK/EfnJehegp4xh4pz6SLY0W7FgJfwNFr8p2d2/pyRDzVPmCynmrd
 vsYCyvzJeZiuUJX7J4jGXx/OjpzObu8raySiv+Q00CfwB49uhhbbYHAE=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-10 required=5
 tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdfDJeDEk9-6; Mon, 22 Feb 2021 13:13:35 +0100 (CET)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 0D0F35ED;
 Mon, 22 Feb 2021 13:13:34 +0100 (CET)
Received: from int-subm002.mykolab.com (unknown [10.9.37.2])
 by int-mx003.mykolab.com (Postfix) with ESMTPS id 81279A4C;
 Mon, 22 Feb 2021 13:13:32 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 22 Feb 2021 13:13:30 +0100
From: Federico Vaga <federico.vaga@vaga.pv.it>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] doc: use KCFLAGS instead of EXTRA_CFLAGS to pass flags
 from command line
In-Reply-To: <20210221152524.197693-1-masahiroy@kernel.org>
References: <20210221152524.197693-1-masahiroy@kernel.org>
Message-ID: <d3f3b273ff2ac78e5cecc10789ffd2da@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
X-Mailman-Approved-At: Mon, 22 Feb 2021 12:28:50 +0000
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Harry Wei <harryxiyou@gmail.com>, dri-devel@lists.freedesktop.org,
 Alex Shi <alex.shi@linux.alibaba.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-21 16:25, Masahiro Yamada wrote:
> You should use KCFLAGS to pass additional compiler flags from the
> command line. Using EXTRA_CFLAGS is wrong.
> 
> EXTRA_CFLAGS is supposed to specify flags applied only to the current
> Makefile (and now deprecated in favor of ccflags-y).
> 
> It is still used in arch/mips/kvm/Makefile (and possibly in external
> modules too). Passing EXTRA_CFLAGS from the command line overwrites
> it and breaks the build.
> 
> I also fixed drivers/gpu/drm/tilcdc/Makefile because commit 
> 816175dd1fd7
> ("drivers/gpu/drm/tilcdc: Makefile, only -Werror when no -W* in
> EXTRA_CFLAGS") was based on the same misunderstanding.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/process/4.Coding.rst                            | 2 +-
>  Documentation/process/submit-checklist.rst                    | 2 +-
>  Documentation/translations/it_IT/process/4.Coding.rst         | 2 +-
>  Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_CN/process/4.Coding.rst         | 2 +-
>  drivers/gpu/drm/tilcdc/Makefile                               | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

-- 
Federico Vaga
http://www.federicovaga.it/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
