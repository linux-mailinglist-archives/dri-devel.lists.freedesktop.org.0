Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE130C5AD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 17:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CA96E94F;
	Tue,  2 Feb 2021 16:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4576E1EE;
 Tue,  2 Feb 2021 16:29:18 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id d20so7569004oiw.10;
 Tue, 02 Feb 2021 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJafALgRjHnc3pk4hWG2YLPFbbjfz2R2r/DUy/DagQA=;
 b=M3b+5gYuwmWiwcuRwWu9yE1WbQlWnIAFHOm0WJADOqnXCbnOsyffd86x8zBpQSgiDe
 BPQ7gWocTOjgVb5EcLZiiu/eX1c4bwyCQ7EN0AadE4jYz3gTJSHFfDQ2rWcqG+peltAV
 nklaHzB11iQslk7FL7nRFqWQ8oRZ43C3Dj5T992pf31NOyq3Y9l6nlYWcGwqf7UTMH7D
 VpzvOeiqV0YI+ggIbOCVFCrNxAgbdCSuvLzvlKB828Tnu51fJf1rAslWQMtaNDig614q
 mxLgBbaiJ/B7IQe1py410oM/+wgsKMgT/i+Oy6B73sRkDp1uD25y861chJVWVUlhV+HW
 QayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJafALgRjHnc3pk4hWG2YLPFbbjfz2R2r/DUy/DagQA=;
 b=nVsAAIwW5x4NfC/a6lwaBPg9LVEjXzA8A6HS23Qqot8VQqL0kwRs6aC76yGuL+IJem
 GhAhT/26IgQkppsfjG9ZwrnWPhwIj74VjhLffhW9/FxiD6CQ1XBUS7LxxDTFcak8mOb1
 5DZAIAebrCM3ALKwDYYAuw4h81FXLb9vq0GqcpADBA7IUdznjBtIzOBS/cQ7jcRSe39o
 4AVRy5ln1jrPxqUAgXJU3roIRjwVWhnV8i+dfx54KPvsv48mpwTds1HNoUfsWIbVX8Mf
 sX+NHppY02QoUiyyiIZMj3C6OxNjBSmAfBMcbqrOKFayLb55A4mspWxDyDpCgJ0iMPnU
 n2lw==
X-Gm-Message-State: AOAM533D0HJl9IoL7RYHv3Rjz4YFSAfYywO90z/jK688r1WBGn0/E+LI
 gz/6zmhFvDZogLtrmzlE2jrQI12t2o4FjzS5RLI=
X-Google-Smtp-Source: ABdhPJysEZOG4JRJWX+nV4fwnRxi6Wx0pQLxM+oUJ1lOxtXbI1+iXokBRtqfmL0fXou8VFKqjf5m3eAjO31cN6P5J5E=
X-Received: by 2002:aca:f5d1:: with SMTP id t200mr3189277oih.123.1612283358299; 
 Tue, 02 Feb 2021 08:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20210202121927.15153-1-bernard@vivo.com>
In-Reply-To: <20210202121927.15153-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Feb 2021 11:29:06 -0500
Message-ID: <CADnq5_NLV1PrR2YLQQqV2CO2oqB3yr1KXLWKJz=Aju+6MMdkzA@mail.gmail.com>
Subject: Re: [PATCH] amd/display: remove unneeded variable: "pattern"
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Joshua Aberback <joshua.aberback@amd.com>,
 Martin Tsai <martin.tsai@amd.com>, opensource.kernel@vivo.com,
 Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Vladimir Stempen <vladimir.stempen@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 jinlong zhang <jinlong.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 8:31 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Remove unneeded variable: "pattern".
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index f95bade59624..d77ae58210f6 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -126,9 +126,7 @@ static void dpcd_set_training_pattern(
>  static enum dc_dp_training_pattern decide_cr_training_pattern(
>                 const struct dc_link_settings *link_settings)
>  {
> -       enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_1;
> -
> -       return pattern;
> +       return DP_TRAINING_PATTERN_SEQUENCE_1;
>  }
>
>  static enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
> --
> 2.29.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
