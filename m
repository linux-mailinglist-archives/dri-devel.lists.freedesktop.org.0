Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB630580225
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019AB963C2;
	Mon, 25 Jul 2022 15:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261FD12B484
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658763996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJ885KKzcUvf1e2EVl4lSKhnhoxNx06B5g4T95NscQU=;
 b=QLlTi3+7VQ8ttDQ+z/lEH46mQLREKPXKjdbuOXDlwL00BoY7FbexOw7tfIPaev70CToVlX
 SJpaFbwnWYonm7PI24VszSpPZwSp+cjDP51Xvwa32DwXk5/tasERcWZIdrID5cEBObbJf/
 byIKxQT9WUj+Twz7EmxThDqG+vRDMf4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-xtiKj9z0MiOQX9acitbppQ-1; Mon, 25 Jul 2022 11:46:35 -0400
X-MC-Unique: xtiKj9z0MiOQX9acitbppQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f21-20020a1cc915000000b003a3551598a1so1296437wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZJ885KKzcUvf1e2EVl4lSKhnhoxNx06B5g4T95NscQU=;
 b=HOZKnI07zaTCEk0XnxbdwAfwlwWi+4oNG06UTUjc6K88+Va9FGk1Yn7iuA5u3lURL6
 yF1nw8OuWLN0nVFQwPLzrzC/Bp2N+QznhgiOmECqC3hHjeKacKx+mArt+N2rx3Qqs9Hw
 qZW9hZWfdzPjEyIeJL3S8wSRCS+Eo5SQ4JXzqPePbOqWIimRQfZ4Hwx1JduPImlbqTIa
 zrImctgA9cuBr6TwcCaMJRU7xKhk9uR++tRwB3GIQ+7JhYUkB9uHYB4xsUAE2WyKCpbu
 hpDGvTP9XhhgRdEGgc9WEmskmDIOQV9oXhrsNbfOIRn8Mz+4c48EqgMRDyHf519CUT60
 Ro0Q==
X-Gm-Message-State: AJIora/dR+BM/SudrZ7ugiNrQ7uATJyikw+IrE8m/IjWvbtvmZwmXeeY
 IPQJnDuxkn3uYCFf/H76aXxCT0vDZaVEz9vLyHX1YdfFq70mMulQEC109fW2LovSOEZPoFAnoqI
 IG1/At7lrSK0uNCRJLDQcWGaecmgs
X-Received: by 2002:a05:6000:79b:b0:21e:9709:2c28 with SMTP id
 bu27-20020a056000079b00b0021e97092c28mr1207787wrb.539.1658763993862; 
 Mon, 25 Jul 2022 08:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sef1GCaKVbSp+vxG6KoAAfgr161OZAbpd5DTP5j+7q2VRX59IcIlySPt3xxwReMmx+Yu5DCg==
X-Received: by 2002:a05:6000:79b:b0:21e:9709:2c28 with SMTP id
 bu27-20020a056000079b00b0021e97092c28mr1207777wrb.539.1658763993587; 
 Mon, 25 Jul 2022 08:46:33 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0021e47386eb8sm12290743wrw.2.2022.07.25.08.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:46:33 -0700 (PDT)
Message-ID: <3d2de29a-2a96-867d-907f-6b85573586ab@redhat.com>
Date: Mon, 25 Jul 2022 17:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/10] drm/simpledrm: Convert to atomic helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-6-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Replace the simple-KMS helpers with the regular atomic helpers. The
> regular helpers are better architectured and therefore allow for easier
> code sharing among drivers. No functional changes.
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

But I've a question below...
 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 283 ++++++++++++++++++++-----------
>  1 file changed, 180 insertions(+), 103 deletions(-)

[...]

> +static void simpledrm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +						struct drm_atomic_state *old_state)
> +{
> +	/*
> +	 * Always enabled; screen updates are performed by
> +	 * the primary plane's atomic_update function.
> +	 */
> +}
> +
> +static void simpledrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +						 struct drm_atomic_state *old_state)
> +{
> +	/*
> +	 * Always enabled; disabling clears the screen in the
> +	 * primary plane's atomic_disable function.
> +	 */
> +}

...do we really need to have these ? Can't we just not set them ?

> +
> +static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
> +	.mode_valid = simpledrm_crtc_helper_mode_valid,
> +	.atomic_check = simpledrm_crtc_helper_atomic_check,
> +	.atomic_enable = simpledrm_crtc_helper_atomic_enable,
> +	.atomic_disable = simpledrm_crtc_helper_atomic_disable,
> +};
> +
looking at https://elixir.bootlin.com/linux/latest/source/include/drm/drm_modeset_helper_vtables.h#L703
that says the .atomic_{en,dis}able handlers are optional.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

