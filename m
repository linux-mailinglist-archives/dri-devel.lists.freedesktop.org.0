Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DF183309
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC286EADC;
	Thu, 12 Mar 2020 14:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536406E20D;
 Thu, 12 Mar 2020 14:30:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l18so7721129wru.11;
 Thu, 12 Mar 2020 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CZ199YGMe8X/yiLlRBJCL1qcgHi2uRzz1rMzxKv7NqE=;
 b=nhAsPTUc/YwAIwf2dg4UoRSJP1fSCbijeZi0Sl8c80C8z+JCZ8JRPqzUVVsSvE3bql
 MKj2HmMHtNGT1BGQKdfrcTI3+K7JEa3gi4EBpy8EDqR3QNntLcTaE1qyo+ltzGUN1cL3
 nZMBND+JJGcE+guRUkmiD2/EB+WpfskoGGlyXIi7fWCD8nGMX4+VKkjilt/mvMXxXk1e
 QD8h+jdsPBvVm53FkNHU5NKG3753pNtsPXHeru7IAvtDoZ0bUdUgRfATtwY8+lJVkdkR
 iF9sTKX1iB63/+UZimINk5wUXuE1UxBvHY7Vxey/U4PFZkL2cwtWLMXneE3Ry9bf/z0v
 zpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZ199YGMe8X/yiLlRBJCL1qcgHi2uRzz1rMzxKv7NqE=;
 b=SyshbdsK0we9iITh4USr2hE/yCbTNReF07BgENlXVQiPsaCaP3SP+cAGellbETp3zR
 GLnNrI064byiMbw5xR92GcijVGgSL+fET8m016KSuVRld+Lph2xcrSHZSuQ7WpVIYCOY
 CoPcnfRdfuCsVqbowX6voPSOEqITujrjh0YV+kYL74XGVFmsAJW/IgYYqqMJa1eSxgkI
 sz1eafBWdQWaUSBkl0OOWqNOlSf90sCwvbynHzA0MCtaDgkKOI748MxJJrdxjXKI8vcG
 ZU234DM5KYNZw+encUJhcPOP4wkmJGMMLUuHGT+L4LeCEHQEPYwoLDf9kkdyj0mscv8h
 Wd+w==
X-Gm-Message-State: ANhLgQ3SEvS4HfJXVP+lygHy5K6aAHkp2lbSBAMcvfgzQ9acs3mDxXll
 bgJdTXtUHcsPffsWSP2GM7J2QdMgi4hJQt28dJv3JA==
X-Google-Smtp-Source: ADFU+vvgfp+bgvvqu0gSDiULCLkzcvCDO/zK0M+N2et1XxnCyKPsnB8g+YT3aUO+NRbnvjbqlESDIXHQidmqLhiGX1A=
X-Received: by 2002:adf:f74b:: with SMTP id z11mr11875069wrp.124.1584023435960; 
 Thu, 12 Mar 2020 07:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200228213607.23784-1-mario.kleiner.de@gmail.com>
In-Reply-To: <20200228213607.23784-1-mario.kleiner.de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 10:30:24 -0400
Message-ID: <CADnq5_MrT1k1QmsjWFzs2WiGRYEi3Wn+bC6kvU-Na9fabQRArw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add link_rate quirk for Apple 15" MBP
 2017
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Harry Wentland <hwentlan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Feb 28, 2020 at 4:36 PM Mario Kleiner
<mario.kleiner.de@gmail.com> wrote:
>
> This fixes a problem found on the MacBookPro 2017 Retina panel:
>
> The panel reports 10 bpc color depth in its EDID, and the
> firmware chooses link settings at boot which support enough
> bandwidth for 10 bpc (324000 kbit/sec aka LINK_RATE_RBR2
> aka 0xc), but the DP_MAX_LINK_RATE dpcd register only reports
> 2.7 Gbps (multiplier value 0xa) as possible, in direct
> contradiction of what the firmware successfully set up.
>
> This restricts the panel to 8 bpc, not providing the full
> color depth of the panel on Linux <= 5.5. Additionally, commit
> '4a8ca46bae8a ("drm/amd/display: Default max bpc to 16 for eDP")'
> introduced into Linux 5.6-rc1 will unclamp panel depth to
> its full 10 bpc, thereby requiring a eDP bandwidth for all
> modes that exceeds the bandwidth available and causes all modes
> to fail validation -> No modes for the laptop panel -> failure
> to set any mode -> Panel goes dark.
>
> This patch adds a quirk specific to the MBP 2017 15" Retina
> panel to override reported max link rate to the correct maximum
> of 0xc = LINK_RATE_RBR2 to fix the darkness and reduced display
> precision.
>
> Please apply for Linux 5.6+ to avoid regressing Apple MBP panel
> support.
>
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index cb731c1d30b1..fd9e69634c50 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -3401,6 +3401,17 @@ static bool retrieve_link_cap(struct dc_link *link)
>                 sink_id.ieee_device_id,
>                 sizeof(sink_id.ieee_device_id));
>
> +       /* Quirk Apple MBP 2017 15" Retina panel: Wrong DP_MAX_LINK_RATE */
> +       {
> +               uint8_t str_mbp_2017[] = { 101, 68, 21, 101, 98, 97 };
> +
> +               if ((link->dpcd_caps.sink_dev_id == 0x0010fa) &&
> +                   !memcmp(link->dpcd_caps.sink_dev_id_str, str_mbp_2017,
> +                           sizeof(str_mbp_2017))) {
> +                       link->reported_link_cap.link_rate = 0x0c;
> +               }
> +       }
> +
>         core_link_read_dpcd(
>                 link,
>                 DP_SINK_HW_REVISION_START,
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
