Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7D93F4D8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 14:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D2310E2D2;
	Mon, 29 Jul 2024 12:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jCKpxX7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A4E10E177
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 12:05:52 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6b79fc76d03so18378616d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722254751; x=1722859551; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b1eFHG/gJZDKFSeIKRiXVWS5jkOH7+BDPKwpNOQ1+VM=;
 b=jCKpxX7bYoBgjlPMNK0ke/x6n2CVDIECOXX+QvPotY+z3LvHqiCzDvXNW9wpsMUhto
 CzjlV+1DyhzpQliUS2kkDhXIUlbUViLGNdfJfMhr5kT1q5E2OGlui/VddqVjHimdOC6u
 N+MVYWPAyueqHhZUFmgC9x1/TkpCQnCAg6pLLUkclA317qv9V0QnEAls3bD36lTnNXEZ
 eNp2ZpoOHLYGZYY+h9XHUye3GO7Isq9CQbX+F4nMa5HgNkXlaFxKOKy0BImywSRhDEnK
 D1OsSA4vhuc+Scw/VGN0W5y0XzgbXpUUuqrb9E2EvgRVRLNpaWWuYxwDbu0w8uJ5QfPl
 g41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722254751; x=1722859551;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b1eFHG/gJZDKFSeIKRiXVWS5jkOH7+BDPKwpNOQ1+VM=;
 b=r81vV2EfvVGy1jL9fK1sHBRi20Lyj3+aWlefYmtvmnQgPb6p8INz87Akt4DKyCXOwj
 I8P2/SqGhrDM2gMfo2xpqUKdy7upA5jXNrAjBp/0GlM/cf2HobZOi+mOz5Vlgq7Fv9OU
 Ijt5Ni9H6kAiLPRW8G6ZPHOL//c34EJaM17Sz7+Ois+VeGtSZVhyGrCF+cQwEnyJEOMj
 uJs4tJ4EH6ZtN9l1EWYcxEHFxmccX38HL2aoaHV37N+7SwVJhQGMt8L5htoQVG2bl8Hg
 ClPvY9WPg40+OpfNsZOeJyQ4DdRcbPSXbQOIgSY50O0GnHWcv3tmy+IitC+pqmEQcold
 VAkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ9Nsn2BzMpHaTfWWWF3O0IeLIEq+qd5p8wTuXtCjaOtY0id4JdtOGxXAFJWZ+zuctSPSazmvmcVElWs/xd8r7PDLKnj9ZOm3ozeguhiT5
X-Gm-Message-State: AOJu0YzDP7oRniFIdrh7ouWdNF6EfxcSuKXus7Ijqb1+sHHd3RHw+p9T
 mmqRh7d4VU1gCgLnQGshqe1FbVJ9+7HW3ATqr+djn9J5xZYzt+R5
X-Google-Smtp-Source: AGHT+IGH8UKr0ucxaLYfeyN8JagVjMpPWUGD8vLGcSiPBNx4stPfkpu7abhAucZAuaXCiJxo2Pi28Q==
X-Received: by 2002:a05:6214:2527:b0:6b4:ff83:c02f with SMTP id
 6a1803df08f44-6bb55ada366mr91055596d6.53.1722254750951; 
 Mon, 29 Jul 2024 05:05:50 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fb07bf7sm50779046d6.137.2024.07.29.05.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 05:05:50 -0700 (PDT)
Date: Mon, 29 Jul 2024 08:05:47 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <darls2mffvsw2ktkirzimzij6w5w45hxylvfcfwgmd3k3elmar@xeg6mfpa3yax>
References: <20240729014311.1746371-3-lanzano.alex@gmail.com>
 <0b1ee6f7-b24d-49a6-ba90-d917c864ecf4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b1ee6f7-b24d-49a6-ba90-d917c864ecf4@web.de>
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

On Mon, Jul 29, 2024 at 01:00:47PM GMT, Markus Elfring wrote:
> …
> > +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> > @@ -0,0 +1,684 @@
> …
> > static int sharp_memory_update_display(struct sharp_memory_device *smd,
> > +				       struct drm_framebuffer *fb,
> > +				       struct drm_rect clip,
> > +				       struct drm_format_conv_state *fmtcnv_state)
> > +{
> …
> > +	mutex_lock(&smd->tx_mutex);
> > +
> > +	/* Populate the transmit buffer with frame data */
> …
> > +	mutex_unlock(&smd->tx_mutex);
> > +
> > +	return ret;
> > +}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&smd->tx_mutex);”?
> https://elixir.bootlin.com/linux/v6.10.2/source/include/linux/mutex.h#L196
> 

Ah, I didn't realize guarded mutexes were implemented. That's really
good to know.

I'd usually use them when it's possible to return before mutex_unlock is
called to avoid goto cleanup logic. But it's probably best to just use them
by default.

Thanks for the review. Will clean up in v4.

Best regards,
Alex
