Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD9B03E97
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD5A10E0F3;
	Mon, 14 Jul 2025 12:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Sakp80X7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD6C10E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:06 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45611a6a706so6671855e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752496024; x=1753100824; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sYz8ZEiEw3/21Djvjk4LGP+bxxwIEaZ6IhqRw9leJZk=;
 b=Sakp80X7CF2iczVWXaDENtUyF/kjsbL/cmBcL1Bc9MixdVifOeEqoQXozslTU8JPyT
 4GdhEbWn7m57RCNGjike5OgJL3E5cpu0ltljSzUrBHfZQEgNkXoTVwvFiSyU9fD47YhF
 95x545GPbtuXYhFIC190YnGUJ+cqb4aoHURU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496024; x=1753100824;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sYz8ZEiEw3/21Djvjk4LGP+bxxwIEaZ6IhqRw9leJZk=;
 b=tz8ushj4V03IRXQF1LSKhgohtZv0UY+sNNSlnuBGkvabOJjdTiycYBnmku/mn6loLY
 ETnhjFpJpqOyIVCVcpSYduCe+m3NsGUGElquy9OB7uygVS/VjpE8CRR+X+6UKmaT6jHA
 LBMT6KxohSHOVWh9ef4RHwrB1mxQzeQAbyfhYF5b7EtQKlNfwaP2JElNCWI4+EEWOy+g
 TTmRui4t6UDSemPBakObXfWbH7z7sgCmpK7W48QZ8uNaMIHgX5lg1zy6tp24hS1t64Vb
 3kgKngb5j7JQlRX3OL1DuMU6PXy1cQSYYwad2L85QU7eCVPyqPRCmY8XDJz/sSOoAKeO
 Kfsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoBRSlYg4Z87i+Plbm/sTdtA93FvLnO+fiEpIPZnbfdQXtx5tq5BCorOYsaD06SPU2WH/VAnCZP8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym4NUJoddpogbINEL/c2P6E7ui4lV/pONpDtR14+l1fv7ipD6A
 V4DniCPvXryADLbuzJZj2saDuflVBouWGv0sfbxtXJ/01FnMnUAajISp3rwfvgA4Eow=
X-Gm-Gg: ASbGncuHsUFRB3b+o4d26K6ydtDpyM9V354prb+VgpXYBmfm/ctl1+dnlfCKjuCh2p8
 qQD3rn6rCSbOdpfH/ccD90MJ+6aX2IZmkM4YUF1aMRj1Z3Bi7W+QrzUr24S33Eu8p0bkpPEgq4S
 kJ5V+tq+HpvaldGvglKLhSSBBsFnr/CsL3J9pDbny8uB6koUo3S7PqzQDwrKnWturMRvWvYlcX8
 XDuJ4hHJJI04S5CSMxOQ0gi7jwBpbHpmJ4XAVbOe4nZa3XxmTVoYPmjbfoagArC02dF4vaR8aBL
 dtU3wuck5a9Kf9m00QPsE0Am+u6PPdwyBTaN6Evn4UQjs6/SNv3P3cobN7Uo6NZB6YAWnbT698X
 SoTos+pmnloqNAD0np1v0qYBTQCpFoRZHSA==
X-Google-Smtp-Source: AGHT+IFgiWckt0UTvX15h+un8PmkUe2XQAidXXBzA1B8yBk733OOvVGyJyRrZYszy+MQWV+guTIVeA==
X-Received: by 2002:a05:6000:4b1a:b0:3b6:1e6:c9fb with SMTP id
 ffacd0b85a97d-3b601e6d607mr3702667f8f.11.1752496024322; 
 Mon, 14 Jul 2025 05:27:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26f7bsm12473925f8f.95.2025.07.14.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:27:03 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:27:01 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: of: fix documentation reference
Message-ID: <aHT3lW9WlM-fB_Nb@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou
 <rgallaispou@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250609-drm-misc-next-v1-1-a17b11a06940@gmail.com>
 <11d29a7e-d36b-42e4-abe0-9f72a478c5c6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11d29a7e-d36b-42e4-abe0-9f72a478c5c6@gmail.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Sun, Jul 13, 2025 at 03:51:56PM +0200, Raphaël Gallais-Pou wrote:
> 
> Le 09/06/2025 à 15:35, Raphael Gallais-Pou a écrit :
> > Documentation/devicetree/bindings/graph.txt content has move directly to
> > the dt-schema repo.
> > 
> > Point to the YAML of the official repo instead of the old file.
> > 
> > Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> 
> Hi,
> 
> Gentle ping !

Applied to drm-misc-next, thanks for your patch. For next time around
might help if you include a reference to the upstream commit that moved
the dt file out-of-tree.

Thanks, Sima

> 
> Best regards,
> Raphaël
> > ---
> >   drivers/gpu/drm/drm_of.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index d0183dea770308e77f05da364ffe087d53f3be36..4f65ce729a473ec372bd76a60ac11a40ffb5df97 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -55,7 +55,8 @@ EXPORT_SYMBOL(drm_of_crtc_port_mask);
> >    * and generate the DRM mask of CRTCs which may be attached to this
> >    * encoder.
> >    *
> > - * See Documentation/devicetree/bindings/graph.txt for the bindings.
> > + * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
> > + * for the bindings.
> >    */
> >   uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
> >   				    struct device_node *port)
> > @@ -106,7 +107,9 @@ EXPORT_SYMBOL_GPL(drm_of_component_match_add);
> >    * Parse the platform device OF node and bind all the components associated
> >    * with the master. Interface ports are added before the encoders in order to
> >    * satisfy their .bind requirements
> > - * See Documentation/devicetree/bindings/graph.txt for the bindings.
> > + *
> > + * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
> > + * for the bindings.
> >    *
> >    * Returns zero if successful, or one of the standard error codes if it fails.
> >    */
> > 
> > ---
> > base-commit: 6f392f37165008cfb3f89d723aa019e372ee79b9
> > change-id: 20250609-drm-misc-next-2f4dd8f88bb9
> > 
> > Best regards,
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
