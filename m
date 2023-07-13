Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C380751A9E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF0810E623;
	Thu, 13 Jul 2023 07:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D878110E61D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:59:47 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7835e2286c4so11507239f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689235186; x=1691827186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7bNjmQBLzRndIeDOo3XPwwSKET0eUhbNEBYsBMD/HWg=;
 b=QLw4Vwt8hxPTWGJatZxpqd2ELYnQAZuZkdvvNDQDElxkk4KfP4kockhDp9RRz52imF
 msSheeQUB033kv4xjSYBV9QtqoL+aH6EDS5PIWOzohJptv9Hfzv1LlhNMnrhy+Qjv6cj
 TvBnlZzFI8TAbql0M0a24ghgqq354A6k3LK7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689235186; x=1691827186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7bNjmQBLzRndIeDOo3XPwwSKET0eUhbNEBYsBMD/HWg=;
 b=QlWH2yHwISS7q4dFUVEcrD+4w4Tdlpj+XKawzfmFa1+K3h87tU8Bwe8Jt+EYlz9JMY
 CSK+cvQdG2ZtCBMMpR6kvrRbzxH55Yg2DvkSC5kvoQZ29gd/4JAhiFYNee6HDadwkXEB
 YL5OwmIljkchjxLUMG+eTa5TXvv4+9m4Zp72po6oMj9g4Hnop9OqVoIbXcE9biX5k74W
 NIp3AsBJq5WPBGLprTVGUtcHXfo34VLm+T0ZcD0xmQMtBDgiSifVeXzr+gYWFp674Obb
 xCvzo70+jM0cFz0EGreULVgSLH7DV//w/CuoWhiPHuJ+MSatCrR8xFxn+8QebGocJSyd
 tYBg==
X-Gm-Message-State: ABy/qLZ/3t1pE2vcEXKnMEjG3Z+OauV/bnJQQiryfLBvgfWP0PByFL5z
 dLXvkPapHEh3V0KrE3OrgbmPzfxQ7By1A9S82Jg=
X-Google-Smtp-Source: APBJJlEHUeH+fN71A11BI/PMjD3yJVGTAfJntXJij3LNrkSzRILJQJVY6ZC0A65G8PMEf2JK9hFdtg==
X-Received: by 2002:a05:6602:184:b0:787:1cfc:5423 with SMTP id
 m4-20020a056602018400b007871cfc5423mr1126685ioo.16.1689235186708; 
 Thu, 13 Jul 2023 00:59:46 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44]) by smtp.gmail.com with ESMTPSA id
 em22-20020a0566384db600b0040bd3646d0dsm1691511jab.157.2023.07.13.00.59.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 00:59:45 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so11871439f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:59:45 -0700 (PDT)
X-Received: by 2002:a05:6602:356:b0:786:cd9c:cf9e with SMTP id
 w22-20020a056602035600b00786cd9ccf9emr1296590iou.2.1689235185426; Thu, 13 Jul
 2023 00:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 15:59:09 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhpsUFrAz7dS5K-G+Vjw50vxN=n7OFQCB1d-JF6_n-nXw@mail.gmail.com>
Message-ID: <CAC=S1nhpsUFrAz7dS5K-G+Vjw50vxN=n7OFQCB1d-JF6_n-nXw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 7:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use dev_err_probe() across the entire probe function of this driver
> to shrink the size.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
