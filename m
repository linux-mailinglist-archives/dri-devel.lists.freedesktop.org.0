Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08C3893BB
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 18:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723C46EE14;
	Wed, 19 May 2021 16:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38EE6EE14
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGnpvPgbrDN+JDIydAmxeVfjxeD6fg7sVHqQMUXSv7o=;
 b=dkMXmxietD8GPqM4ylKK1scMdaL3y/DzmNlEtcW9YXlfi18Q3NwK5GHy1/1l9Dr+Mmxzwz
 u4ThB/Oj6cRtLHHWDn3Fb4QuGNsHRd7jROKTk+OkmdiQr3yH2GglCAo3xC6Oouk2itW50b
 hLMF4LbkbxjVJLgk7CwfSUifz3FOjaI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-ETEeZrsZO0WwSDRaUDFXZw-1; Wed, 19 May 2021 12:27:05 -0400
X-MC-Unique: ETEeZrsZO0WwSDRaUDFXZw-1
Received: by mail-qv1-f72.google.com with SMTP id
 b1-20020a0c9b010000b02901c4bcfbaa53so10753070qve.19
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 09:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=nGnpvPgbrDN+JDIydAmxeVfjxeD6fg7sVHqQMUXSv7o=;
 b=Jnqw0/o4taDAv59r5oUql2YD1v4tjQMQ1M7tQC/Ipau/HmE8PlpWa8jesclKZ6iHDe
 57tH4MKleC7r2i0xtJry+Eh6qzA0PM++cIKuJEnk6anCA3H/r6vUVd7N8HO/XUndz/OZ
 y0TrDWHQHgX1Ta843Or6mCmYOM1SBUc/S/eeXNX3kujv0+8HnwHuZrfcQFCKNlFjPdED
 OSV4dwNa6bLhzLFUxpttQqzkDht0qkareowYVQHXjkzzCfizNQQZjjVNzNX/jKQfqSDx
 Xe39C84lT5t0iSxV9u/V9FpAEgApoaxJjQ3KAEYBWWTkQbEKGcdaLdCCaro9qilCvBT3
 1gGw==
X-Gm-Message-State: AOAM532T3H+8ufruVzmBuv9V1jELSEDtIMr6mTgKWek8msutrZSDXXQ6
 qFbw5wh3soG7dILQIOFTAv4HO2rSYrR5NPNBbAuT6gR3IEUCp2y5hFakGr1Fby5q1MUJALievwU
 aDF4tnfegP7NlgKLvte2d5LygJLqi
X-Received: by 2002:ae9:ef14:: with SMTP id d20mr132277qkg.107.1621441624440; 
 Wed, 19 May 2021 09:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxxhWDl0Wrh3EwbniSsRrVjhhrSiaiOxzCbltW98bS6gYPpFU5nR/3zpxDikzE/i/6y4FaOw==
X-Received: by 2002:ae9:ef14:: with SMTP id d20mr132265qkg.107.1621441624268; 
 Wed, 19 May 2021 09:27:04 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id z187sm97109qkb.129.2021.05.19.09.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:27:03 -0700 (PDT)
Message-ID: <57b373372cb64e8a48d12e033a23e7711332b0ec.camel@redhat.com>
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for Samsung 16727
 panel
From: Lyude Paul <lyude@redhat.com>
To: Aaron Ma <aaron.ma@canonical.com>, jani.nikula@intel.com,
 airlied@linux.ie,  maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Wed, 19 May 2021 12:27:03 -0400
In-Reply-To: <20210519095305.47133-1-aaron.ma@canonical.com>
References: <20210519095305.47133-1-aaron.ma@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Reply-To: lyude@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems reasonable to me:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-05-19 at 17:53 +0800, Aaron Ma wrote:
> Another Samsung OLED panel needs DPCD to get control of backlight.
> Kernel 5.12+ support the backlight via:
> commit: <4a8d79901d5b> ("drm/i915/dp: Enable Intel's HDR backlight interface
> (only SDR for now)")
> Only make backlight work on lower versions of kernel.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3474
> Cc: stable@vger.kernel.org # 5.11-
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 5bd0934004e3..7b91d8a76cd6 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1960,6 +1960,7 @@ static const struct edid_quirk edid_quirk_list[] = {
>         { MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>         { MFG(0x4c, 0x83), PROD_ID(0x47, 0x41),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>         { MFG(0x09, 0xe5), PROD_ID(0xde, 0x08),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> +       { MFG(0x4c, 0x83), PROD_ID(0x57, 0x41),
> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>  };
>  
>  #undef MFG

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

