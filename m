Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DCF611A09
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EA510E89A;
	Fri, 28 Oct 2022 18:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB5310E89A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 18:19:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 9B1A560C;
 Fri, 28 Oct 2022 18:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9B1A560C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1666981169; bh=Oc5cMdKanGrG3AiQdbRR/5dfJXVOInrFY/Y/d7mf19w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O9z8oKHanbEgjMaZ5jB56/4e8hU4siOlE4MdLZQ7i/bC80VBFyv31JKvfCVXXJJRN
 n/tVLhiXBdKD9cotPj/qnf2f8sT/bFyEmJPpPH5ZWkiOzJrZ8oM7C/J8mI+WTmVNGS
 wVJW34Lp4U5tz+rYfWRMK6kE4svVrXdo1qxGDMhLmHVA1ZjhUpwe8d6Bm8zivPkdtl
 tTQvd8paOeAy58OKgeay6w2XvPgiyoF6Ofz7By961g2vTqoah197pDN5BQOM1InjGb
 QPv+7lS8NlkUlMICCM3ajsUDIDIEG7frKrDuApsbVSWtcSwnA2gbNk4BWArWgCPV+K
 AEBadMbq1Upjg==
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] docs/sphinx: More depth in the rtd sidebar toc
In-Reply-To: <20221027104406.549734-1-daniel.vetter@ffwll.ch>
References: <20221027104406.549734-1-daniel.vetter@ffwll.ch>
Date: Fri, 28 Oct 2022 12:19:29 -0600
Message-ID: <87tu3n6cb2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> We love to nest our documenation for good structure, but that means
> the table of contents needs to keep up or you can't navigate them.
>
> Realized this trying to find the drm property documentation, which
> with some shuffling around disappeared. Why I didn't realize we can do
> this earlier, no idea.
>
> Since the relevant parts of the toc are only loaded if you're in the
> right .html file there's no harm in going all the way to unlimited.
>
> Note that this has no impact on the classic theme (which doesn't have
> the sidebar) nor on the various :toctree: rendered inline in the
> output.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/conf.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 934727e23e0e..5dc141c66726 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -240,6 +240,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
>                  # Add color-specific RTD normal mode
>                  html_css_files.append('theme_rtd_colors.css')
>  
> +        html_theme_options = {
> +            'navigation_depth': -1,
> +        }
> +
>      except ImportError:
>          html_theme = 'classic'

So this patch isn't against docs-next, and applies to the RTD theme,
which is no longer the default.  I have no objection to it, but have you
looked at how your docs come out with the alabaster theme?

Thanks,

jon
