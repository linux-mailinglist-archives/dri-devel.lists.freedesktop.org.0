Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A7A02830
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 15:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12DF10E4AE;
	Mon,  6 Jan 2025 14:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yHIXe0UD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775E510E4AE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 14:39:10 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-71e2dccdb81so9551091a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 06:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736174289; x=1736779089; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fJSZIXJSkHeJBkdcb6ya9oMRq6rzriaUtPDL7vlAVQw=;
 b=yHIXe0UDdic02+/Cw0FIQB4KFYNodofxa4jwizoGTmJadwhS/TxPHp/FD1pu7kZlLR
 ByY2L32S1Ny0yoWNyBF6tkTEWgD0k2oBbB1UbcviTBWwgk9ZiBgGaPybokojaY+7Z04A
 DqUhfgKS57Bu6RVga25ZnxZ/U60Yjbj1xNrsXBe6UA3auakvTgcBV6YGlMuZvrodcO8g
 Oa6zCBOB7yjhnObLJy+GzniYdaFyzFde7xMGmZ1iL+7wJPsgPWTmB0jPnhyin5yiRjQo
 oYDwer6jnCGaSHHvOS7NtUgaCHHrNpdHSRWkQttWxtOGChSptHHgURQNh2G2ED7SvWTD
 H72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736174289; x=1736779089;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJSZIXJSkHeJBkdcb6ya9oMRq6rzriaUtPDL7vlAVQw=;
 b=pDrPfeCehVqw8A5NunO0F0vpIKQLuhGqrfwjqdEOmrSqpIjO5az9TrFC5setSTlyKu
 uJuSKiqCNkMln9+aZn4LFRZvy28moH6rSO5FZjynbJKQFUCSgR/TiIYbQWKVtkVIECLW
 POM6DemvaWQ1jXbDv/JLcTdK9spd+gA+R5sYLnzndomSTmIMjioDBXnLvh7hYl//c5Ii
 TiOmOvgaBHGQU4fhJcftOOER96NJlWNmPNkhk2b4bYXTH9yp4Y2wNZFf7Hn6Xm6TSoBN
 gYshs3k75P1M+pdwM9AdlnbtaEwDxp2avP8/CZEd7pqwjtx/sRxUVJvbU33SbX6sR2nU
 y6kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcQT7Qk4OJ3Kedpl95O55+QuWlQO2PTlmT47okJ6KoHPiHNI8RZlkjIbVuHdB4N5SjPtz4LiWBSJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZeSl74cEBIj2SdkjnNl8++KDGPQctmLIrl2JA6c/p2+wqKRtq
 2+6xdy1mKx4WC0/vPYz0an9OoAWYCWjKHyrhr5eq+FuW3nopDQznpwRLMZd9D45y4ceMAFq+Jj3
 mR18ESzzJPnfZfgTutYy0CfNd6v1eyR1bO0XOF32sDdioO1psDqNJUA==
X-Gm-Gg: ASbGncsErUTqHfmrVwHbvazXdJsNHgyRySnPY6W+0PEkmLL/er8VNgI+yd05SvR7Qnt
 FBIeFxlbZfS5YDQN8vYYaiQJbsyd8vLpRkpZjq2B3GapbupkJy4vTYbuXclGGDQA5jR9nDw==
X-Google-Smtp-Source: AGHT+IHmvXuwvGSdBr59QFJmGXR85prnYmkeJd5ryoQXMvTWEemEChNFf5E52WxYsQ1l+y7kBas5ggRo21B4VIcMRB4=
X-Received: by 2002:a05:690c:7106:b0:6ef:7640:e18a with SMTP id
 00721157ae682-6f3f820f277mr479003527b3.31.1736173959645; Mon, 06 Jan 2025
 06:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-14-damon.ding@rock-chips.com>
 <e52pbjnusvuoqiyoorjr5msrfmgeqs2jt5sk6zcesvzy7cszzk@fzrtpsjoklgu>
 <e2a18f8c-dc38-4b12-968e-dd369cb34cb4@rock-chips.com>
In-Reply-To: <e2a18f8c-dc38-4b12-968e-dd369cb34cb4@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 6 Jan 2025 14:09:34 +0200
Message-ID: <CAA8EJpo5aE4itm8MTeCpqns5eLuWj0TaZW5qwrw02_Zc73NNiw@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] drm/bridge: analogix_dp: Convert
 &analogix_dp_device.aux into a pointer
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Jan 2025 at 13:04, Damon Ding <damon.ding@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2024/12/30 21:35, Dmitry Baryshkov wrote:
> > On Thu, Dec 26, 2024 at 02:33:09PM +0800, Damon Ding wrote:
> >> With the previous patch related to the support of getting panel from
> >> the DP AUX bus, the &analogix_dp_device.aux can be obtained from the
> >> &analogix_dp_plat_data.aux.
> >>
> >> Furthermore, the assignment of &analogix_dp_plat_data.connector is
> >> intended to obtain the pointer of struct analogix_dp_device within the
> >> analogix_dpaux_transfer() function.
> >>
> >> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >> ---
> >>   .../drm/bridge/analogix/analogix_dp_core.c    | 92 ++++++++++---------
> >>   .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
> >>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  2 +-
> >>   3 files changed, 50 insertions(+), 46 deletions(-)
> >>
> >
> > [...]
> >
> >> @@ -1127,6 +1128,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
> >>
> >>      if (!dp->plat_data->skip_connector) {
> >>              connector = &dp->connector;
> >> +            dp->plat_data->connector = &dp->connector;
> >>              connector->polled = DRM_CONNECTOR_POLL_HPD;
> >>
> >>              ret = drm_connector_init(dp->drm_dev, connector,
> >> @@ -1535,7 +1537,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
> >>   static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
> >>                                     struct drm_dp_aux_msg *msg)
> >>   {
> >> -    struct analogix_dp_device *dp = to_dp(aux);
> >> +    struct analogix_dp_plat_data *plat_data = to_pdata(aux);
> >> +    struct drm_connector *connector = plat_data->connector;
> >> +    struct analogix_dp_device *dp = to_dp(connector);
> >
> > I see that Analogix DP driver doesn't support
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR, but at the same time I don't think this
> > is the step in the right direction. Instead please keep the AUX bus on
> > the Analogix side and add an API to go from struct drm_dp_aux to struct
> > analogix_dp_plat_data. Then your done_probing() callback can use that
> > function.
> >
>
> It is truly a more concise way.
>
> In the next version, I will add the following functions on the Analogix
> side in order to get the pointers of struct analogix_dp_plat_data and
> struct drm_dp_aux on the Rockchip side. And the way has already been
> verified.

LGTM, thank you.

>
> struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct
> drm_dp_aux *aux)
> {
>         struct analogix_dp_device *dp = to_dp(aux);
>
>         return dp->plat_data;
> }
> EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);
>
> struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
> {
>         return &dp->aux;
> }
> EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>
> >>      int ret;
> >>
> >>      pm_runtime_get_sync(dp->dev);
> >>
> >
>
> Best regards
> Damon
>


-- 
With best wishes
Dmitry
