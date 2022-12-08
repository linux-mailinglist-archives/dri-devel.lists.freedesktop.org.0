Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1D647635
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 20:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3126C10E4C0;
	Thu,  8 Dec 2022 19:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F42310E1F2;
 Thu,  8 Dec 2022 19:29:47 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id l127so2395419oia.8;
 Thu, 08 Dec 2022 11:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sRE4um4KvV3qs2o8/z+QYu6AzewZgU69Cuzh5rXDgi4=;
 b=DoEul69jtaQoQjx4jIRPxdaZhZaSjq9k9vy6Xhl1WLJT2Fk13zI7QYRtNP+hlyZbI8
 bjDzI5PVxHwKEpBQR67gH7wmfYcSwrmtuhMHy+Q+ECah6qBtpXEmlkNR5rNa9XnlrXQv
 wwAOFZnxazzBdaiaV14mGkY/EyZHeTYIKuVY4BfOFSCDkaAF/9K+Wk0ryf1n0e5UqN2u
 IRrZtq9eLVFxPmgyiQV7N6U1jk7XNWaWWGpFWtw2LH7Fq2sLeQ8MU1hly5UIBBSibfag
 rO8sIWRn7n0T7WptLy7X/x07RnMMUDGa9N9CPHzHfFXa7zGoVmT8s7I4tpmSHf9vNaEX
 ikEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sRE4um4KvV3qs2o8/z+QYu6AzewZgU69Cuzh5rXDgi4=;
 b=Y3WTQzx1KpFOBRbkeOt22HKhd/8foLTKp6mGGLs31NL9OCsyKRlC5h39io9GYwjX+O
 Cqv0PgC/QW3N/S2ILIQ99zazU6taR1x8kZXsvmpmwbIxW1UHYPMcQH6U/3q2mqmI5Jdq
 EIeFZJteHTIAQn30TmTINmFyFXkdfWaboymbGQvOQddFrYEwToLMWe0Q7yDnJ+hOt/58
 m4FBcqhV9IpFiIFnxLRqKpwl1KxI1PIZnxLzOfo7HIafbEFYob2rhnhj+sMPDIhCKyIP
 krgWysgrKenVbrz3FJOgmg7ktZgWc21yURVD5tgNOiwOMAVJH2fxOkjx8SPT23UkDoR0
 OBzQ==
X-Gm-Message-State: ANoB5pl4+mMj4w0/X9L7P1WM0iuwGYgnL1Wc3cKAgTmqTZGCG/RVSMt1
 A7adLVjKulk2X386l4XjL3usyy5d0G0hJmO+p3dRXnlR
X-Google-Smtp-Source: AA0mqf4vYfwtfwzC8r8KZjHRbTZ26uFtOG78fl2YJ8yY/nXiHhbBxvgKwqxkbmqIl+31pdYzAXcXhIcymWC+S0h6RQQ=
X-Received: by 2002:aca:1913:0:b0:35b:f5f7:3ed0 with SMTP id
 l19-20020aca1913000000b0035bf5f73ed0mr12406902oii.46.1670527786696; Thu, 08
 Dec 2022 11:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20221208192525.5763-1-Sungjoon.Kim@amd.com>
In-Reply-To: <20221208192525.5763-1-Sungjoon.Kim@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Dec 2022 14:29:35 -0500
Message-ID: <CADnq5_MU2+aRx0ehf2GA3BkVRXQN7w5MiUbPrU-Wp9pSkS8eVA@mail.gmail.com>
Subject: Re: [PATCH] drm/display: Include missing DPCD definitions from DP2.0
 spec
To: Sung Joon Kim <Sungjoon.Kim@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: alexander.deucher@amd.com, rodrigo.siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel

On Thu, Dec 8, 2022 at 2:25 PM Sung Joon Kim <Sungjoon.Kim@amd.com> wrote:
>
> The missing DPCD defintions from DP2.0 spec is as follows:
>
> DOWNSPREAD_CTRL (107h):
>         ADAPTIVE_SYNC_SDP_EN (bit 6)
>                 For sink devices that support Adaptive-Sync operation
>                 and Panel Replay
>
> DPRX_FEATURE_ENUMERATION_LIST_CONT_1 (2214h):
>         ADAPTIVE_SYNC_SDP_SUPPORTED (bit 0)
>                 Bit to check sink device has Adaptive-Sync capability
>         AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (bit 1)
>                 A sink device that clears this bit will generate VSync pulse
>                 leading edge of the HDMI output on the line count at which
>                 Adaptive-Sync SDP is received as long as source device transmits
>                 Adaptive-Sync SDP either in first line or first 3840 pixel cycles
>                 of the line whichever occurs first.
>         VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED (bit 4)
>                 Bit to check sink device has SDP framework version 1 capability
> ---
>  include/drm/display/drm_dp.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 4d0abe4c7ea9..4f33b6aeb91e 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -603,6 +603,7 @@
>
>  #define DP_DOWNSPREAD_CTRL                 0x107
>  # define DP_SPREAD_AMP_0_5                 (1 << 4)
> +# define DP_ADAPTIVE_SYNC_SDP_EN            (1 << 6)
>  # define DP_MSA_TIMING_PAR_IGNORE_EN       (1 << 7) /* eDP */
>
>  #define DP_MAIN_LINK_CHANNEL_CODING_SET            0x108
> @@ -1105,6 +1106,11 @@
>  # define DP_VSC_EXT_CEA_SDP_SUPPORTED                  (1 << 6)  /* DP 1.4 */
>  # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED         (1 << 7)  /* DP 1.4 */
>
> +#define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
> +# define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
> +# define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (1 << 1)
> +# define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED  (1 << 4)
> +
>  #define DP_128B132B_SUPPORTED_LINK_RATES       0x2215 /* 2.0 */
>  # define DP_UHBR10                             (1 << 0)
>  # define DP_UHBR20                             (1 << 1)
> --
> 2.20.1
>
