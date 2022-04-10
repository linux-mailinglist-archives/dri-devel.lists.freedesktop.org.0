Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD934FAD29
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 12:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF35510F591;
	Sun, 10 Apr 2022 10:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50D510F58F
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 10:21:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t1so1241091wra.4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=z3dhoN77A8BIqNIGnN8skc8srfBctrP9xyLmy/ZPWPQ=;
 b=jHsnBCiAfI3tY4B9hsETfTAL9I2ae0OOM18MeLE2JZ6IaX26IR16jLF9gz6gWuc08l
 CeX8LeOIBj+De1OVABrIqss7gE1drRblPdD3KbeE8gd88RrOYXFQB+8gHO047jGehUgV
 vGiG9EXjar2ySG9pszW4O8F6Dmf4NkK50f2qPJziFFREJwVhrO2qgXyl9SfZ8rpL4fH7
 UxOMAG7qAgNemhhoZ68lfXqUDIZSGko8nCzoBZRgk50uiA1lxpdluJJrMgxrwQdVzmdI
 kENerhb95vPIfGuXXHtmqs2IzCiDy6mjH2mBxhRvpb8Zt0ZnZGvhkfb/qUr2PtxFs4LQ
 gazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z3dhoN77A8BIqNIGnN8skc8srfBctrP9xyLmy/ZPWPQ=;
 b=Duk5zxLuU+Ww+QwDXrF6rKdNwx8BAcZXcv5Z2W1RjdcHLncPy7N18A6le9nr0HQKdR
 bev8Fv2f4Hcd5+x24DJV3yiPrHgwMers/MAJQooAzxZCIpW8Ca4hTAF+estVhADwPbLo
 VYCv5xm8YS0RwiOeBX2p25YXoMezOBzSifq0V+AAlWJtcgw6vEiq1SW+vJZ7NnXNRsZC
 Uz11nxUHtwAVABKQUkA84lbz9i64tPfx7TaXAtFgpekZneJW7Y7+Ct1V5Yyi1AuZu6C2
 2ngoWLylK/o6Ms11ZK8htNaYfIsZXSpYGeU2k4Y6jW93fVDBBv3YZeXGg6C4nz6pavml
 JFeA==
X-Gm-Message-State: AOAM533lVsuNbm76NFwekliWgKPmSMeW0L3HJM3t1zT/1dWFBVGyVU0x
 q3vCcHEr7JF/aECJty28ais=
X-Google-Smtp-Source: ABdhPJyBjylrb7kUbxruf4eZpPB7xwEY8wAFpb2ZPHPrJA5VYi0/VH+irVGpvDL5huEOycJeOHAf8w==
X-Received: by 2002:a5d:6b4c:0:b0:1e6:8ece:62e8 with SMTP id
 x12-20020a5d6b4c000000b001e68ece62e8mr21217553wrw.201.1649586086215; 
 Sun, 10 Apr 2022 03:21:26 -0700 (PDT)
Received: from elementary ([217.113.241.148]) by smtp.gmail.com with ESMTPSA id
 bu17-20020a056000079100b00207a3124b1dsm1640624wrb.65.2022.04.10.03.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 03:21:25 -0700 (PDT)
Date: Sun, 10 Apr 2022 12:21:22 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/1] drm/vc4: hdmi: Replace drm_detect_hdmi_monitor()
 with is_hdmi
Message-ID: <20220410102122.GA3818@elementary>
References: <20220406165514.6106-1-jose.exposito89@gmail.com>
 <20220406165514.6106-2-jose.exposito89@gmail.com>
 <20220408074110.bz7jne46k7zvrizz@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220408074110.bz7jne46k7zvrizz@houat>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thanks for your comments.

On Fri, Apr 08, 2022 at 09:41:10AM +0200, Maxime Ripard wrote:
> Hi Jose,
> 
> On Wed, Apr 06, 2022 at 06:55:14PM +0200, José Expósito wrote:
> > Once EDID is parsed, the monitor HDMI support information is cached in
> > drm_display_info.is_hdmi by drm_parse_hdmi_vsdb_video().
> > 
> > This driver calls drm_detect_hdmi_monitor() to receive the same
> > information and stores its own cached value, which is less efficient.
> > 
> > Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
> > instead.
> > 
> > drm_detect_hdmi_monitor() is called in vc4_hdmi_connector_detect() and
> > vc4_hdmi_connector_get_modes(). In both cases it is safe to rely on
> > drm_display_info.is_hdmi as shown by ftrace:
> 
> How do you use ftrace to generate that?

I had to add noinline to a couple of relevant functions and run the
usual:

$ sudo trace-cmd record -p function_graph -l "vc4_hdmi_*" [...]

I'll add the command to v2.

 
> > vc4_hdmi_connector_detect:
> > 
> >     vc4_hdmi_connector_detect() {
> >       drm_get_edid() {
> >         drm_connector_update_edid_property() {
> >           drm_add_display_info() {
> >             drm_reset_display_info();
> >             drm_for_each_detailed_block.part.0();
> >             drm_parse_cea_ext() {
> >               drm_find_cea_extension();
> >               cea_db_offsets.part.0();
> >               cea_db_is_hdmi_vsdb.part.0();
> >               drm_parse_hdmi_vsdb_video();
> >               /* drm_display_info.is_hdmi is cached here */
> >             }
> >           }
> >         }
> >       }
> >       /* drm_display_info.is_hdmi is used here */
> >     }
> > 
> > vc4_hdmi_connector_get_modes:
> > 
> >     vc4_hdmi_connector_get_modes() {
> >       drm_get_edid() {
> >         drm_connector_update_edid_property() {
> >           drm_add_display_info() {
> >             drm_reset_display_info();
> >             drm_for_each_detailed_block.part.0();
> >             drm_parse_cea_ext() {
> >               drm_find_cea_extension();
> >               cea_db_offsets.part.0();
> >               cea_db_is_hdmi_vsdb.part.0();
> >               drm_parse_hdmi_vsdb_video();
> >               /* drm_display_info.is_hdmi is cached here */
> >             }
> >           }
> >         }
> >       }
> >       /* drm_display_info.is_hdmi is used here */
> >       drm_connector_update_edid_property();
> >     }
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> I think what you're hinting at in the cover letter would be best though:
> we should just remove that caching entirely and use is_hdmi everywhere

Cool, I'll work on a follow up patch to remove vc4_encoder.hdmi_monitor
and add it to v2.

Thanks,
Jose

