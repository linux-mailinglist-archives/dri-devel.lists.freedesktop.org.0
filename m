Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A255760CF15
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 16:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383CC10E3B1;
	Tue, 25 Oct 2022 14:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F8310E3A5;
 Tue, 25 Oct 2022 14:33:12 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-13bef14ea06so1968326fac.3; 
 Tue, 25 Oct 2022 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YMy4LItUDnEueP5zJcrzuL5kok/ZugHvFlF48pvFS3A=;
 b=cxyTZiBUfXwWDOnF5q06yNTCZPdEmpfiSJx2JDYJ5QBNlwKCX2nPw3zX7C6Fw0XhFs
 P3vVW3E8Z1ScNMYvOSbud9D0aEV7tZWCdOp6pPpFMVt069Iu3uBFf8x0BY0WLTr7YUHR
 nWWxfKfV3ETIf8ZSZeGPuKdQmZBP3HGcgmHOo83fB5emFdT5em6Oe4KVsAcfEn65T8E/
 LIvGlUsKJZRJOtLv1a6TD9I0w6ZlB8DGnAxjp5LroiCM2rt6DDETY3kNyCxcleER9BMk
 oKqIoAJHB3wXK28FX36XSHVYLpoEN8X70FRpZP5DRuBLedIdvQ1aK2VoDesIYqEWEtev
 k2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMy4LItUDnEueP5zJcrzuL5kok/ZugHvFlF48pvFS3A=;
 b=R6g9E/E4tDuP22gJSwX7uZh2ekgp2e5B00wEOQ51+RYbbHviwqt+HQKhT03TrO4dFa
 bqV7GTTMSUI2v7T0QUTco03OHSxXJ2B2ZTs9Npi/Uxf/LGvnwkJMMDjIKIfg4imCGz9p
 LE6KXKMHHwsgm4Uu7nJqPZqKlZcYJjscdKY+lXR+oGjXlxKBMSU7s7tYNLYyV8SvPg03
 43sz+qLVsz2RBNnCcVLsXZfntJlYaURrJ3Xyz2kk6hhy0dS7Ki3NtsWtCwNX8aOpdDLQ
 l8jimkBnV4kQBnWSW2mYdZiwSL1FAcnkL8dMm1kTxrylY+eAaqHBTihLgIzR6LZCyVSK
 +9nA==
X-Gm-Message-State: ACrzQf3tv5v2NKuRwXq2IS8PJ8ADU09teMwIktJXMzttL6wR/BI10ZIg
 Fp3kNqNU1ViLeTIm2NC4M86JuX04HFxX0b37/ARNw7Tt
X-Google-Smtp-Source: AMsMyM417RT28nOn1lhUq9OLDF2cm9HttIKpNWn0D+kkpLx6Aj2RFq4y3w2AJ7hweX4Bp3z6OyW5JdDSAtGSMoF/srA=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr24120363oao.96.1666708392054; Tue, 25
 Oct 2022 07:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221024192224.180507-1-hamza.mahfooz@amd.com>
 <20221024192224.180507-3-hamza.mahfooz@amd.com>
 <c6adc72b-690f-6752-784f-6ab0695705bd@amd.com>
In-Reply-To: <c6adc72b-690f-6752-784f-6ab0695705bd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Oct 2022 10:33:00 -0400
Message-ID: <CADnq5_MPPuvMxpJ7Tz27jC9g7_Z2=C_Ejy13Xx8pk8mOsSKHxA@mail.gmail.com>
Subject: Re: [PATCH 3/3] Revert "drm/amd/display: Limit max DSC target bpp for
 specific monitors"
To: Harry Wentland <harry.wentland@amd.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>
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
Cc: Ian Chen <ian.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Roman Li <roman.li@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Claudio Suarez <cssk@net-c.es>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@Daniel Vetter
, @Dave Airlie

Any objections taking this through the AMD tree or would you rather it
landed via drm-misc?

Thanks,

Alex

On Tue, Oct 25, 2022 at 10:21 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> Series is
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> On 2022-10-24 15:22, Hamza Mahfooz wrote:
> > This reverts commit 55eea8ef98641f6e1e1c202bd3a49a57c1dd4059.
> >
> > This quirk is now handled in the DRM core, so we can drop all of
> > the internal code that was added to handle it.
> >
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 35 -------------------
> >  1 file changed, 35 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index 4956a0118215..a21e2ba77ddb 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -41,39 +41,6 @@
> >  #include "dm_helpers.h"
> >  #include "ddc_service_types.h"
> >
> > -struct monitor_patch_info {
> > -     unsigned int manufacturer_id;
> > -     unsigned int product_id;
> > -     void (*patch_func)(struct dc_edid_caps *edid_caps, unsigned int param);
> > -     unsigned int patch_param;
> > -};
> > -static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param);
> > -
> > -static const struct monitor_patch_info monitor_patch_table[] = {
> > -{0x6D1E, 0x5BBF, set_max_dsc_bpp_limit, 15},
> > -{0x6D1E, 0x5B9A, set_max_dsc_bpp_limit, 15},
> > -};
> > -
> > -static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param)
> > -{
> > -     if (edid_caps)
> > -             edid_caps->panel_patch.max_dsc_target_bpp_limit = param;
> > -}
> > -
> > -static int amdgpu_dm_patch_edid_caps(struct dc_edid_caps *edid_caps)
> > -{
> > -     int i, ret = 0;
> > -
> > -     for (i = 0; i < ARRAY_SIZE(monitor_patch_table); i++)
> > -             if ((edid_caps->manufacturer_id == monitor_patch_table[i].manufacturer_id)
> > -                     &&  (edid_caps->product_id == monitor_patch_table[i].product_id)) {
> > -                     monitor_patch_table[i].patch_func(edid_caps, monitor_patch_table[i].patch_param);
> > -                     ret++;
> > -             }
> > -
> > -     return ret;
> > -}
> > -
> >  /* dm_helpers_parse_edid_caps
> >   *
> >   * Parse edid caps
> > @@ -148,8 +115,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> >       kfree(sads);
> >       kfree(sadb);
> >
> > -     amdgpu_dm_patch_edid_caps(edid_caps);
> > -
> >       return result;
> >  }
> >
>
