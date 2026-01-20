Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB1dLQCnb2lDEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D846FD1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D305810E5E4;
	Tue, 20 Jan 2026 12:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="Nab99AEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A00D10E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:56:01 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-88a2b99d8c5so44163236d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 04:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768913760; cv=none;
 d=google.com; s=arc-20240605;
 b=iwRtI4Os7AIaWJ5EiBLwgiczgCPX83DQguJ4461KZJn6VN4NqOGseevtUru84TyZ6f
 2XPyp2iqEu5b1Zm4W4pyd7pvrmjJP9iOYpkKp4h7cfw+S37DK2jUJ1wJjlFm5pPvRGVT
 w1JvaHlyRaParMrGYeQB0DEXFl0ZKybmC/KXjEpgoT38EgHDI4Rfzd5IfYnsL6azJ/2g
 SKpQz2Defqra5vJ+D592QrBfDRbCb3+QPTVSMlRqY0/FU+3j74l88ieM4ta7wt+Eydx6
 suW0dMyig1W9G1AQk2q5nVT6iDQ1Jg97DWPmFC4hGu598DwJMJ/sh80eYrYHPY48aKMb
 aRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xIKhuYFw63DINEPQxv2wgmdGn5ZNASi1pTjZrRr4yhE=;
 fh=PI22at6lUvh48B/tH3vX4I7ersfrwW/w08+ORHTBEho=;
 b=WQWYyxSDQ+Zt6XFJO1u6qgjdRydEc2L7lJjiAYCpk6Q3Us8PGiNaRDnx9c8vRUBytG
 RYVaKJB9ZXTQRjrKpW9x7JOE4a71NxNV0J98KIra7BKMN/2qsqY2ta0zJNDprBxe2nSj
 cXQVudYbugauI8NmF/Dy3g/skvsuBWjHDkL5ITMYcF6LgnU9gBL7Tt7KfIbWOXhfAPNo
 TuRseSW6w6ZokZWbG8N1dBc6f8EqNi88XY0T10SdOxe50Ac4ZT+9A4ihjFOaedcoI7v1
 DcbNZ2nNCA6zDGo7S2LfpEkEs+4pjGWCbdDUnUmxqNq/d5L12dR8ePLXGTA/7Gn85a1o
 7KxA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1768913760; x=1769518560;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xIKhuYFw63DINEPQxv2wgmdGn5ZNASi1pTjZrRr4yhE=;
 b=Nab99AEKHISL4S+XUBsHBK6aE5vANYfxpk4bRWiYDkIhlHd90DUn8qVREB2hdxL7hx
 itoETpsL3uauEuYaoQNue8B6dToOt2/1pT7ucr0rrLaeVOIZ47KJ7p+QSrBDxdJHZZ14
 LTzFPQA5XxhZ4m4msDkbxagN9NX0XLzP43hge0ZDfQXSjyKXXhL8YGulL7MeSIMn25lJ
 3AxTuOZKz0X6xRtPk/Lb4eE3upz+yzN1f9+L8nRAdaRnXE5D2pHmxqsLldfdgc5gw9m7
 kbi3EwP2S0mdlrU31WsdkDxBYW8eQruJwk2SBwtoHEhSmvXiUuLW+9bNglbJrYfhoE8c
 Y0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768913760; x=1769518560;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIKhuYFw63DINEPQxv2wgmdGn5ZNASi1pTjZrRr4yhE=;
 b=moOp+j+Z76HWElO5McKiUgRDHx59vlGqDc07H8C2EVfCcfgqddk31rmN44WKFbypvW
 MvMd8vWBi4HCFEaypImOJ5zDJ8xCunEgxbk0H4gKecFOxGTtlFKoxngQXMWzY61DXSYJ
 fEkJKJqOhLNzeJHsDy/h+ShegF2F7gqNgXzbYpa6ruH6vSxRAUIW0bGoxEJhIoRnhEJT
 NVz8xnjEIYIyvUqyapVgN05bE6Uq39zm5/lq5cJACDreHvbbkn963yLu5ESumeCtOljm
 U5DV36yKtZYy0H2fEspWUQdvBp3TdAss6wRPMC47ryUVlFeuj/Bzj6yLo0H6I+/wCmJu
 dWcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCcGO1n9T+p65NGwuLkjlVtQro5T0Vi89FkZSg93kJHHD4u5ewfzNgOGA7+ekW869/svVemQWpvqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEBSSdleAlBC0MiUWL0fDoHFan4Zkk99+4gvF6VM5QORiJzeNh
 8foOvilVGv35MVtigCIf42zxqxh8voJklGR0Ie6J+iTa44/zY4wumjdYxvOXJR/w9iCpHL/h/2V
 CkrC58q5UqmQ5oC1znxmv0NrJsnchC6yApdyp3/r2rw==
X-Gm-Gg: AZuq6aIlCnlvZtwBZVt9DOQZQ6kRIKlwDoLhIO2mpU8aIuzJZfehQRv8V4mTOJwFnl3
 2SyXH9gvf2pzz4OjEARpY4dmB1D5u8jlVVR9e0Ti8t45q1CAVtBSa90LYZ68gPTNMik6yqy3H45
 OwjQFY2KYtJ+pS/oQzyobq5fGZG5KXPaDIrmked02zznCJUvJ3/oCxK5z35LOpZP2A49Z9Vanyl
 538O7mi6JgY8OsA5pmhuvzAfB/Lzls8Z91vfycqmP9CM3tEErRdx+71Q6I+yu9rqfRahkmgOCgW
 B8w=
X-Received: by 2002:a05:6214:19c5:b0:894:6dc8:924d with SMTP id
 6a1803df08f44-8946dc893a8mr4189616d6.24.1768913760251; Tue, 20 Jan 2026
 04:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com>
 <20260120-cpitchen-mainline_gfx2d-v6-2-1a16cd1d70b8@microchip.com>
In-Reply-To: <20260120-cpitchen-mainline_gfx2d-v6-2-1a16cd1d70b8@microchip.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 12:55:47 +0000
X-Gm-Features: AZwV_QhsNtOa999KaX-_EQFOd0iUAVt0uZ4iVZSigcVCX1SaDa3SaynZsl9mIpQ
Message-ID: <CAPj87rPwJ_FHpzn-4wQ_3kG=iJfLbnF=KpCrOA8a59WrSW9c2Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/microchip: add a driver for the Microchip
 GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[fooishbar.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:cyrille.pitchen@microchip.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[fooishbar.org:query timed out];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,microchip.com,bootlin.com,tuxon.dev,armlinux.org.uk,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,fooishbar.org:dkim]
X-Rspamd-Queue-Id: 689D846FD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cyrille,

On Tue, 20 Jan 2026 at 12:06, Cyrille Pitchen
<cyrille.pitchen@microchip.com> wrote:
> +static int mchp_gfx2d_ioctl_alloc_buffer(struct drm_device *dev, void *data,
> +                                        struct drm_file *file_priv)
> +{
> +       struct drm_mchp_gfx2d_alloc_buffer *args = data;
> +       struct mchp_gfx2d_gem_object *gfx2d_obj;
> +       enum dma_data_direction dir;
> +       struct drm_gem_object *obj;
> +       int ret;
> +
> +       ret = to_dma_data_direction(args->direction, &dir);
> +       if (ret)
> +               return ret;
> +
> +       if (!valid_pixel_format(args->format))
> +               return -EINVAL;
> +
> +       gfx2d_obj = mchp_gfx2d_gem_create_with_handle(file_priv, dev,
> +                                                     args->size, dir,
> +                                                     &args->handle);
> +       if (IS_ERR(gfx2d_obj))
> +               return PTR_ERR(gfx2d_obj);
> +
> +       gfx2d_obj->width = args->width;
> +       gfx2d_obj->height = args->height;
> +       gfx2d_obj->stride = args->stride;

You need to validate height*stride vs. the size here. Same on the import path.

Cheers,
Daniel
