Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2A4EEAEB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 12:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A9410EB61;
	Fri,  1 Apr 2022 10:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE3D10EB61
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 10:03:22 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id t4so2058785pgc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tX+BPVS9BPv8n6VKzSXnF+wc68I5Je6Qk2J6Ghu6RDQ=;
 b=n9knzbXGB/jvF5BOCglcNRiyMIDFcfNQoZLTD2PfR8ROW2mvj+nV0iRrPEdLKZpSph
 vzguSb7cXa66bjzphVmti0yNptHSJQQlAQ6i7yVkYnors74fkIpWuC9+/Odv4N6xiou4
 P1/aduWBtjC0YlAzg0a1qF1MienP9LHtj8dNGo+LKuyI95nIEZ6GOuBWVzdz+NQACbci
 0WRRETdAVG5wG4w0Hi4DCQ6vliDs/yi5iwJk4+CIvvqunJLzmhe7/7TlroQoSbizUdzq
 62rYhZYgHiSBQLRfl9CvSawykOK0o7aWxB+WKpGLZ5Z6uy8GEwy5YJKqx65PTQVZF/Ac
 AQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tX+BPVS9BPv8n6VKzSXnF+wc68I5Je6Qk2J6Ghu6RDQ=;
 b=6kCWa2TzakEmCDl8WRZSDXmEQZ7lkcZdI8GATZSAANDWOtnaXbPXFO5WTIHHe8aFhC
 U1MzvHGSCLLHa5uDaRx8jo3hPi5qlrZwQxJ06942ttVu3P9lY/ZokXTnAF7FBi8SDJ0d
 BfXB5grFYbS8bBm0GAQYCg49WmBdVhkB2O5qLTyFrbkHBymNRyXot+4YdRbzqUay6eCU
 oajuEWIi+cujWJVmk4rVy8QMFwPQmC4wZWXmiQ+0j4FMQf4Pd375IT7l4Pt0Ahqn7fmI
 cjl+HO7Nl4tUoJDkPVTFrVhatQzkq8nSJ+oZtEHlbgVVFFpK+RKqQMB3420pS7xVgRye
 rdZg==
X-Gm-Message-State: AOAM5326MV/3OUW87bgTt02yA6b6fnWi49VgByMAFKhif2MvMMFj7clY
 +WCsRoS0CMbP41QTY8KQ4mzSZ81N/DHRdCkt17I=
X-Google-Smtp-Source: ABdhPJyIPfkp/BerqOovqJMj2WSOiOe9iqYASkuWLcLT7uQMcDzKykZZOUsc0aeY8wKuxeEpNgTHO8kXyukBN3JBL7Y=
X-Received: by 2002:a05:6a00:c85:b0:4fa:f806:10f5 with SMTP id
 a5-20020a056a000c8500b004faf80610f5mr10024572pfv.43.1648807402184; Fri, 01
 Apr 2022 03:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
 <20220330120246.25580-5-xiam0nd.tong@gmail.com>
In-Reply-To: <20220330120246.25580-5-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 1 Apr 2022 12:03:10 +0200
Message-ID: <CAMeQTsa1YeB2GFyUUJ2PJxACZ2dgWprN8mneka=VXDn5o-7+HA@mail.gmail.com>
Subject: Re: [PATCH 4/5] gma500: fix a missing break in cdv_intel_dp_set_m_n
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Zhao Yakui <yakui.zhao@intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 2:03 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete. It
> could lead to a invalid reference to 'lane_count/bpp' after the loop.
>
> The invalid reference to 'lane_count/bpp' is here:
>         cdv_intel_dp_compute_m_n(bpp, lane_count,
>
> To fix this, when found the entry, add a break after the switch statement.
>
> Fixes: 8695b61294356 ("gma500: Add the support of display port on CDV")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

This loop already breaks when the desired conditions are met (see the
if statements).

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index ba6ad1466374..e6473b8da296 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -1016,6 +1016,8 @@ cdv_intel_dp_set_m_n(struct drm_crtc *crtc, struct drm_display_mode *mode,
>                         bpp = dev_priv->edp.bpp;
>                         break;
>                 }
> +
> +               break;
>         }
>
>         /*
> --
> 2.17.1
>
