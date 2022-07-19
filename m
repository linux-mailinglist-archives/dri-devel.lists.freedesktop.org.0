Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB9857A9F0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 00:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018F14B92A;
	Tue, 19 Jul 2022 22:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CC61136B9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 22:41:58 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v12so21562297edc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1v88GEiD0LQIbnFj2jGBP7QMVI4Ye70Um7rX2tcudFs=;
 b=DSV9XrUjnSb4DLR1xhP0mrXjZVDOmdJuwxvFM2IOkqN4GRaSRkynMCnsWBMdrITuMn
 iukDW9Rs/o4k+BPgEmjKYDO2oQagJqq9y4IBe5Smpi+ZlBxF+PBdpFBhhl5KNA/kgnrt
 34gkoMp7ZkYhXP1emnQ2sphjIIu6H7msQ0iSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1v88GEiD0LQIbnFj2jGBP7QMVI4Ye70Um7rX2tcudFs=;
 b=hH77mjxgI/04JzFKJZ9yXHbiakybxKV3I4sUTc0ZtYx9uyOVxyF+7gkhqJnwz5cWLT
 91zlTbW6trGX9NJGZvT5Mj4Re1JChdxR+0H1uS35oiNvAJi2G5ZcwpTjZwmExZqaaNBU
 Ymk0LPLVs9L/cIqqF0fpZSgzK5NAlvqOCGso/ghiErGVAj3ktyOOfnILUDoExmgnTbGo
 OxlzStl3lLRqhGeZjegSI6Ilhu2D6nhwDqc/+EFOJkJkQnRuRaDxX52kvbcH8+h/bbn8
 dwRN5i6nqM6YTX/TRW5oLWtvko047+R4OtLVCaAvV4K3AnmQB/9JAfbifBB3gkiTL2+6
 BGUg==
X-Gm-Message-State: AJIora+YuO374hTa1BXDRPA8+/U59c2YcIr7r5j5eJnzEG+sUyXPGe2G
 F+X0/u9IxCU98QzOxbjqckxIgNTr2r/0gCvBwaA=
X-Google-Smtp-Source: AGRyM1v9Sb88pmyPKMFSjaeVQ7/uZ1sq3kAQ9mwLqQ0arwr0V84pTVYV2z5H9f385X9J9jxEOT6rzA==
X-Received: by 2002:a05:6402:274c:b0:43a:9204:95fb with SMTP id
 z12-20020a056402274c00b0043a920495fbmr47887972edd.259.1658270516933; 
 Tue, 19 Jul 2022 15:41:56 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 w5-20020aa7dcc5000000b00438a13508c4sm11184134edu.51.2022.07.19.15.41.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 15:41:56 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id n12so10830545wrc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:41:56 -0700 (PDT)
X-Received: by 2002:a05:6000:2c9:b0:21d:bd7d:3af6 with SMTP id
 o9-20020a05600002c900b0021dbd7d3af6mr27860158wry.405.1658270516096; Tue, 19
 Jul 2022 15:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-3-nfraprado@collabora.com>
In-Reply-To: <20220719203857.1488831-3-nfraprado@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 15:41:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URVf6kDm9A8OsFqmy7tdsNsoDTBvfUy8aT=kfzofyDtA@mail.gmail.com>
Message-ID: <CAD=FV=URVf6kDm9A8OsFqmy7tdsNsoDTBvfUy8aT=kfzofyDtA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel-edp: Add panel entry for B120XAN01.0
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 19, 2022 at 1:39 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add panel identification entry for the AUO B120XAN01.0 (product ID:
> 0x1062) panel.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 675d793d925e..152e00eb846f 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1879,6 +1879,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAK01"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116X=
AN06.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133U=
AN01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120X=
AN01.0"),

 * Sort first by vendor, then by product ID.

0x1062 sorts at the top of the AUO panels, not at the bottom.

-Doug
