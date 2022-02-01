Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861454A68DD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 01:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDD610E242;
	Wed,  2 Feb 2022 00:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDD210E242
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 00:00:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a8so59158758ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 16:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GqllxHt7yNoWu7VaWkakCDa1qzT4RpRcgjBmYDF5Djg=;
 b=d670fUvw0MYPj7AP65Zg5wsXk1t723UvfwdMSeF7nwsVXZuEUwKQyXRDkloAalyg5m
 PRDINzdmr+XKFP9yLKnHNhUpnZc9h/muYNaX9vqgUtS2ZIQZp3Lv3Hxzj/+Ajpa6NDlo
 vDTzfvl8TUIFgMTOil6NCqy2zrmyFmDr9V2gwGQ7qE9v21Z3XWlClovac0H21dI+5diu
 EcoCth1fIHjU0o+piYxzvyHP6xqXqhIVSR4Aot2aRIaUkpHkNzu0b8kyfVrUsUbaRaJw
 Eh6GfxAGRYJ9ZU7e5xW04WjXNH7GHYkKCNnrT8KTy4BXcjvHPYLeB3TP+bwWVULhswqQ
 eCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqllxHt7yNoWu7VaWkakCDa1qzT4RpRcgjBmYDF5Djg=;
 b=j1Xd3GmQKVLksrsq8ssfyBRm1gIyXYqsc5N3/mD7ktbfmppwySUpBHW737uLOR6a8x
 uuSrCy/Ckvy7OGO3ygF66qFo2kupm9istO8eaWWUc5bup1Fgn+CwSvyrYXH2IV22Oq7Z
 J+os/DW05r8v75PtPsI+FZFg73n31bTD2hZOqHgYEYmggwxHp+28ptBcHzfd8/G+QPJr
 m3TAuIN4j9J1ClUaUqYxEJ9lllzrRfRV4jYSQoXpa/LmmEc11vTYqOZijwl7yW4oO0J+
 MZCQNN0yk30yhDrKKidOtIR/r0qy2i6Mye+j/bYe97vbxVYbME+gRUxc+yqkkdSAnUtF
 NZKw==
X-Gm-Message-State: AOAM531vqqEw4OkwjbqtG0Vmf629oKPcnBAbkfVPW6sNAfZpQZlX2k0S
 dEQ/grMnr0VOrxWp+ynqZ8ojm5ZNKKf3eldFY+8=
X-Google-Smtp-Source: ABdhPJzkU+AoivYaiO+CIbSwtDKaKtKrGb1L6g/G7HKxp0CwA2yyfw4ai/4HM+r9lTmE2r5dHKmXjqmmtuLlzBb87Lg=
X-Received: by 2002:a17:907:d10:: with SMTP id
 gn16mr18527609ejc.652.1643760008830; 
 Tue, 01 Feb 2022 16:00:08 -0800 (PST)
MIME-Version: 1.0
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
In-Reply-To: <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Feb 2022 20:59:59 -0300
Message-ID: <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@kernel.org>, Kees Cook <keescook@chromium.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thinh,

On Tue, Feb 1, 2022 at 8:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 2/1/22 15:01, Thinh Nguyen wrote:
> > Hi,
> >
> > One of our test setups is unable to boot (stuck at initramfs). Git
> > bisection points to the commit below:
> >
> > f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> >
> > Reverting this patch resolves the issue. This issue persists in mainline
> > also. Unfortunately there isn't any meaningful log. Hopefully someone
> > can give some insight as to what could be the issue and revert/fix this
> > issue.
>
> Hi,
> Did you enable DRM_FBDEV_EMULATION?
> Please provide the failing .config file.

Does selecting CONFIG_FB=y help?

We had to manually select this option in imx_v6_v7_defconfig after f611b1e7624c.

Please see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.17-rc2&id=c54467482ffd407a4404c990697f432bfcb6cdc4
