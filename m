Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161431E66D0
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 17:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27A86E152;
	Thu, 28 May 2020 15:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC9D6E152
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 15:54:40 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id e1so2207527vkd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eD9Q69yAidIqs4JbIyrQRrLyc1rX+qPaojDMR0joP5U=;
 b=C+6c+/zy8X6oTdVUsHMPt6wtqdA0tC4QkpLSWdowQI9DkamTI3pEeTTNwx05CUF3Ck
 j9QffXYNwLwSAwzGnNt5/ybY54h7uLZdbuPeEvcHeqdlowZRVJZ2u0Z8z9fGW66IR/Ec
 g1E8wcwTUs1kkq97e0xEC+nhTHjbKMwHHKRvv2bi+dJDaUvPB6Eyi5bItg1rvvrgB26l
 1pPdNkR6iMiN1GoI7/dpaQeKS3596mUhoP/w6UbOIPxD2QsREiYbX/29PTbKxGMG/Gtr
 voApI0UepKgzJ5C9/b+P2vRerTtJqf0vDAVf1Oo7UvGcpfMU4ZqjBtYzbYTZLa/rS/fE
 b/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eD9Q69yAidIqs4JbIyrQRrLyc1rX+qPaojDMR0joP5U=;
 b=ZnmzWJrZr5j0Sm87oZ6lLLJ06es5v83UvqVpK6QCfCcq9pwmHwg3Y+wt3yT0ARFZYG
 lt7PsZGxpJTFflMxJTxVr2rscr8Gye1AUpoTpTu7fiV6mCkC7asmwgahoQGPOy+tTyIE
 OPsnThKz7fFDKsxjfjoiMqrc/IQnNb2wpWzfHbiwfT24QK6gBMKYgi+BMQ3LFaLxA8kE
 2g0eSdeoH8dYCseFwS5GX3wC0UKx0dNyAqmFBcRR5SyhUfYy9Vv96GVZSF8nxmbXdvt8
 lEPTwzW+CYGmmrSevOg1nzKVPgiiUB/vMlGwWSTFCeSUfbAl38Y3L4rH+/P2bZnG5bxR
 ur3Q==
X-Gm-Message-State: AOAM5329bvg4HwZSBEBJqSI79mwuvwfIqj0k9utJMoypDsdXwlAButgR
 ZSst8t6ZWyl1FTs8Nu4vAlPP+bkSyvGrzsf9S38=
X-Google-Smtp-Source: ABdhPJw8Xk8oV6L3uEur2x175XF+krnVvLBDXMAI0SFt0rkatKFthbfQqghuLCvU+aV4LiyrGoasfZr/GxwSNaGmR1s=
X-Received: by 2002:a1f:a3c1:: with SMTP id m184mr2268337vke.38.1590681279501; 
 Thu, 28 May 2020 08:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <e9bc87e240b62c80617ea7825144121a470a2d44.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <e9bc87e240b62c80617ea7825144121a470a2d44.1590594512.git-series.maxime@cerno.tech>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 16:51:31 +0100
Message-ID: <CACvgo50j1t5VtMgE7-pquuYRaC_ku5pZ2aBVoD-MCCktfPm-VQ@mail.gmail.com>
Subject: Re: [PATCH v3 066/105] drm/vc4: txp: Turn the TXP into a CRTC of its
 own
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: LAKML <linux-arm-kernel@lists.infradead.org>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Have you considered splitting the series into several parts and
focusing on merging one at a time?
IIRC this the longest series _ever_ submitted to dri-devel, plus it
seems to be growing with each revision.

Due to the sheer volume, it's likely to miss various points - large or
small (like below).

On Thu, 28 May 2020 at 08:47, Maxime Ripard <maxime@cerno.tech> wrote:

> +static int vc4_txp_enable_vblank(struct drm_crtc *crtc)
> +{
> +       return 0;
> +}
> +
> +static void vc4_txp_disable_vblank(struct drm_crtc *crtc) {}
> +
Core should handle if these are NULL, so the stubs should not be needed.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
