Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E0C1A6AB5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 18:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804A66E082;
	Mon, 13 Apr 2020 16:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2746E082;
 Mon, 13 Apr 2020 16:58:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p10so10846430wrt.6;
 Mon, 13 Apr 2020 09:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=786Abko4OwymZpA7zq9NIU+Jcj7CJ578QomD1bj3ank=;
 b=lGv7MGiYg7oEqYLypfycQaA6ew5I9aewcYJs9NmfJNETIijLfn1NwaDh8AFpk/A6aZ
 x8K73t3qPZTrdm/iXN5neVTcVukcTESm6TxmmAltPPoRdM6w6ta1X8KMW0822rbr/7Pv
 XZ8RzIk85b529lnkQYGf7UIlfSY9Fy/v+TZIajPYd8DS/FAbuuhObHapniZuosPkU3E+
 IC0OxraDowSo5wtqeDC2BpBpqBmG1gD0BeTgjr9deMN83wt6ems1YRVHtG4hXsqPXAI+
 gf6D4GmNPpWNdrAVePhYwlIlQTV0PmrhrzAU72QMkXUnW4uJV995oqf8IDEZ/8e8Pk1J
 7Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=786Abko4OwymZpA7zq9NIU+Jcj7CJ578QomD1bj3ank=;
 b=l23PA/ewY9+1t1/TqAs9yjUpjZKDFErcY7flZDZIL9x5CM1C6+n6UdWJcMinZThkog
 vgFYJcDTZ2ycBCCUwd3GAmoeaazLCggUckVs6UMSzDKS6s0uTZ/2jzKBgpn2TD9bMfBk
 D+Q6AaEgjLLhNQkbBervg2VZIu0luJYij9HNifyNBv40L6sUhs+NrD+HGeXdVa6xCcim
 guDz07PbrIIfjCfDPSO5wzldK/A8KKYP5dIIlQkeswiKMp6GE/2WQohCrdTVp6eVdd8E
 C9R8ToBQNHgLbk+Uctw4NkUt5U/BGyxYcX9lUEGJlsWVHjWZey8ejc+KP8aRNczSSGbf
 Attw==
X-Gm-Message-State: AGi0PuZF967boWWmtkWKHGher2QE7rg3BXXmKHq28dwMmVQ0Oj3o927U
 215Wa2jgTQ70Do5P22polH0WrDkAET6WML9ixrDZ3Q==
X-Google-Smtp-Source: APiQypLgM6ORe/fUey6PXuV88ju5z6/RrBDlwexv9u4wPO+3r3jSj9FiVWLMwss0rxgA7h39Knz1M70XeoItHyrc3oI=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr15152734wrq.374.1586797118982; 
 Mon, 13 Apr 2020 09:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200410114613.15271-1-colin.king@canonical.com>
In-Reply-To: <20200410114613.15271-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 12:58:27 -0400
Message-ID: <CADnq5_MBQyMaLdJE=WOz4pV7u5UZQy3Y_qjL5ZO=7Y=NHQor=w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant assignment to variable
 dp_ref_clk_khz
To: Colin King <colin.king@canonical.com>
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
Cc: Eric Yang <Eric.Yang2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  thanks!

Alex

On Fri, Apr 10, 2020 at 7:46 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable dp_ref_clk_khz is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> index 26db1c5d4e4d..b210f8e9d592 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> @@ -131,7 +131,7 @@ int dce_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
>         struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
>         int dprefclk_wdivider;
>         int dprefclk_src_sel;
> -       int dp_ref_clk_khz = 600000;
> +       int dp_ref_clk_khz;
>         int target_div;
>
>         /* ASSERT DP Reference Clock source is from DFS*/
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
