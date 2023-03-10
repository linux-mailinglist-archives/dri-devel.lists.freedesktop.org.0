Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0BD6B3F0A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 13:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8FB10E1CF;
	Fri, 10 Mar 2023 12:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83A310E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 12:20:15 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id ky4so5355333plb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 04:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678450815;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=asTNFVHYBUFSk4GRlqWZV4x4IVPoPxPEyap0sAN5uo0=;
 b=TTjFr9R1KsSh9rAJfVF8DAclSK8JnmgWe6xfLOscVmUDIgjal25Y4E8PqQ1psDZHzN
 Q/D4dqpggx1RSnZPn+1ZV59/MKNC0NH20Qcd3tZ8NrFy2QbQQh+3eYOdezwKgmnS4VaW
 mIp3ZY+icrOd3gYT26edt20K31VKeN6jOH2tDnO8hC19e6RgZYburtH6OewoOK/nONTO
 aFEhfgX1XU29/PAWAFHNWor54qOtesM3CQVKSez1vY2YUr43ALL4DKHMyRkC3x/dVjhe
 LoZwK3Q9wTZCDZCJqeG7nGThLPXXiNk+DtEahK3QdUPbHqBiiNUmghN0qHbHB/usTCn1
 OHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678450815;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asTNFVHYBUFSk4GRlqWZV4x4IVPoPxPEyap0sAN5uo0=;
 b=UMsYOAoTMAUG3cT1wggsXNkrgC93FoT1NkAWTtqBCgZMFb7lJAryRGe1pNFgM6PHb8
 RafdPxBMlqs9wcg+998Ryt3Rs4oYuMK4JmM968UeKgtTAXOid5I2j+5zoGzsIvRoCvGC
 e/tbRuZPfkzcSs+OMkqqKGzEDeCL+LOYmmvqhhjqUjigcpYVMUQOtetIqMzkoMW3OxBU
 xNJjHjyY37O81BGKDb+ozB3QJfzSrygKfAw/5JzYX0Rf6gNcKYAhpVk5tcHWOGz6go0x
 hA4Sy6NLnk8a7pyjqZRfgPcLL9k7zkzogzkn/Gim0oF5YrVuSzIpWhuPqwLLzvXN4LhC
 shjw==
X-Gm-Message-State: AO0yUKViHZJFfhZ2TjgLCsKDhS66ahm6RPS63Vd9Sz2V08NDctfMb3cE
 0aNZCTj6eUDBepsnCUbE2Us=
X-Google-Smtp-Source: AK7set/6w9Q7LNt7cBPWqygAgpU6M+EF0xKmpp5LjpvMUnv8kXk2kOyu9IBEi3J5RXqYJVNoQ+mUSA==
X-Received: by 2002:a17:903:2603:b0:19d:16ed:3e34 with SMTP id
 jd3-20020a170903260300b0019d16ed3e34mr22466860plb.26.1678450815375; 
 Fri, 10 Mar 2023 04:20:15 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a1709026f0200b0019aa6bf4450sm1307414plk.188.2023.03.10.04.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 04:20:14 -0800 (PST)
Date: Fri, 10 Mar 2023 20:20:07 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/mipi-dsi: Add a mipi_dual_dsi_dcs_write_seq() macro
Message-ID: <ZAsgd4zsgbvWT0U0@Gentoo>
References: <20230310110542.6649-1-lujianhua000@gmail.com>
 <87mt4k95zp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt4k95zp.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 01:54:18PM +0200, Jani Nikula wrote:
> On Fri, 10 Mar 2023, Jianhua Lu <lujianhua000@gmail.com> wrote:
> > The panels with two dsi connected (sync dual dsi mode) need to transmit
> > dcs command to the two dsi host simultaneously, let's add
> > mipi_dual_dsi_dcs_write_seq() macro for this kind of panels.
> 
> If we were to add a helper for this case, it should be a proper function
> and not a macro like this.
> 
> We'd also need to see a user for this upstream.
> 
> >
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> >  include/drm/drm_mipi_dsi.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index c9df0407980c..d0f0f75d4d83 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -336,6 +336,21 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
> >  		}                                                          \
> >  	} while (0)
> >  
> > +/**
> > + * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
> > + * @dsi: array of 2 DSI peripheral devices
> 
> This makes the assumption the devices are stored in an array. What if
> drivers want to store them differently, for whatever reason? Maybe they
> have an array of some container structs that have the devices? Maybe
> they just have two struct mipi_dsi_device pointers?
This array just store two struct mipi_dsi_device pointers
> 
> > + * @cmd: Command
> > + * @seq: buffer containing data to be transmitted
> > + */
> > +#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)                   \
> > +	do {                                                             \
> > +		if (ARRAY_SIZE(dsi) > 2)                                 \
> > +			return -EINVAL;                                  \
> > +		int i;                                                   \
> 
> I believe this should lead to a warning for mixing code and
> declarations.
> 
> > +		for (i = 0; i < ARRAY_SIZE(dsi); i++)                    \
> > +			mipi_dsi_dcs_write_seq(dsi[i], cmd, seq);        \
> 
> This ignores errors.
mipi_dsi_dcs_write_seq is also a macro, contains error checks in the body block.
> 
> > +	} while (0)
> > +
> 
> Without an example user, I'm not yet convinced about the usefulness of
> the helper, but I'd imagine something like this would be a more generic
> approach, not enforcing the array, and handling errors properly:
> 
> ssize_t mipi_dsi_dual_dcs_write(struct mipi_dsi_device *dsi0,
>                                 struct mipi_dsi_device *dsi1,
>                                 u8 cmd, const void *data, size_t len)
> {
> 	ssize_t err = 0;
> 
> 	if (dsi0)
>         	err = mipi_dsi_dcs_write(dsi0, cmd, data, len);
> 
> 	if (dsi1 && !err)
>         	err = mipi_dsi_dcs_write(dsi1, cmd, data, len);
> 
> 	return err;
> }
Thanks for your explanation and this looks more reasonable.
> 
> But even that begs the question where does it end? There are a lot of
> mipi_dsi_dcs_*() functions as well as mipi_dsi_generic_write(). Dual
> wrappers for all of them? :o
It's definitly useless to wrap all of them. Please ignore this patch.
> 
> 
> BR,
> Jani.
> 
> 
> >  /**
> >   * struct mipi_dsi_driver - DSI driver
> >   * @driver: device driver model driver
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
