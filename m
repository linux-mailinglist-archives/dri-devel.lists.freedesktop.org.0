Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2CCBB9D8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 12:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C0910E465;
	Sun, 14 Dec 2025 11:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GGPst14C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9E210E465
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765710752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bbYEGSqoTTOTTILb/IhwiwV6vikKEDBZxdDSvcoC62I=;
 b=GGPst14CSA0Z3eW88kVoRoSuBUAeAWBM/Z4TlHGBE/JaBJWcAYVJ0n3ZpjNECSHnqZdjoY
 tmJ/wyw2t0fU+39SLOqqjUuCa+HpcwwzZdk8mJnUZh6sKK70lpl1HIISbGkfbRV3wSNQg4
 Ge8Qy783+TgLE165iYr+FkaJAPDlWf4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-p96hF7R4PqqKh-fTX9rmZA-1; Sun, 14 Dec 2025 06:12:28 -0500
X-MC-Unique: p96hF7R4PqqKh-fTX9rmZA-1
X-Mimecast-MFC-AGG-ID: p96hF7R4PqqKh-fTX9rmZA_1765710747
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477563a0c75so16369625e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 03:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765710747; x=1766315547;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbYEGSqoTTOTTILb/IhwiwV6vikKEDBZxdDSvcoC62I=;
 b=PP6nxRG8I3FhlFbinu0O4+hSEKEJIhYYBbRA8yCO2vUOQTIXw2aOXPvItKGS8nXf4H
 TfFUTH6O8OG/LPjlA6PnIFjWVeZjbiJ+hqyicy2hlRcUPuNXxl4hYzBmmLX0OQ8+OlSU
 zT72eEnDwObsHfNUzu9CrWBY5WWCRjRzbqpG0wsgoXo7/7U6JL2VJaeXs0iBDG+6/8Iv
 uHox4LnA+KrGkFeBI9qV9ItI2XQA+6nfocTnaAlxzndCffl6l1UpWHl+mGhfOFYhpZWZ
 JcN4eYVluNFknE7CfNHacWBo/UWBlncK5dQ1uT4x5QluYmqQXFmunmpPTu+jsuhmPhPB
 nBow==
X-Gm-Message-State: AOJu0YzcagXokVwQFhPACQ1V2Yjn3FNv5PVaCvKiUVwv6EIb3S5poNRc
 9yP2oRjgx0nw4FlVC2Uy7Zwfs1XpJV88zs3g+lhTVoRk7Xj9fjQMYRoMkWfMtBQulsmaKAVpsoQ
 QkGF/BRyQUIj4ERNUMmlka70eu1VvsOvoqJCCIjh6Ysh9w6CEY35irHF6dzm9IP7t8mCayA==
X-Gm-Gg: AY/fxX7OeJ9sTB6zaduJG4xxsg27pwAuAWgBySlm4blGmLQ1DlphhZlob0qY4dMIQxj
 BAom0XIm4K+gf4KZwQSYEuEBxUH2GF7t4oH5UQ2YCiOPxSdE345lfzOx5dq+ku0/oGJTrUBrF0y
 lMDDnqSbja3jkTkCbwLUe5Cb9ATRXx6RXprQhaftsu9yLWGej7qkC24s5kuwk2pJq/hBSvieUt6
 yBSnJuimLceuLQmcNAqyrcTl8sJ4pkmQmqCpNjk2H+n596Itx0eyJ7R0rpc8uhdPCHSSblaRveG
 PDo85WPn7hlKG3NQFtRVLjGUHCk/jc0hzLQA+ZEQGPaTyCTl7tJ2QEFTg6DPtbXw72XD5nLvC7D
 0S53tEYZAaD11kzPDuDuiEp4plr2ot7jtZc1QrEQplOAZqp8NtuSpDD3tNNlBqAaPwMZO
X-Received: by 2002:a05:600c:a08e:b0:479:2651:3f9c with SMTP id
 5b1f17b1804b1-47a8f8c57e2mr72118505e9.14.1765710747047; 
 Sun, 14 Dec 2025 03:12:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEduu0M2bmnOfYfENiE/VmdZ0P7MHd5nW+vqYrSVYBCyA6TWZwfYcTT0T2+hmUnJfJRleVnTA==
X-Received: by 2002:a05:600c:a08e:b0:479:2651:3f9c with SMTP id
 5b1f17b1804b1-47a8f8c57e2mr72118335e9.14.1765710746658; 
 Sun, 14 Dec 2025 03:12:26 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm15065577f8f.12.2025.12.14.03.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 03:12:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH RESEND v2 1/6] drm/sitronix/st7571-i2c: rename 'struct
 drm_device' in st7571_device
In-Reply-To: <20251202-st7571-split-v2-1-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
 <20251202-st7571-split-v2-1-1e537a09e92f@gmail.com>
Date: Sun, 14 Dec 2025 12:12:24 +0100
Message-ID: <87ecoxl3l3.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BbWEdJFvjYbwU9kCA7RLSsgIM2eOgS-MM8C7bCyogY0_1765710747
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Rename st7571_device.dev to st7571_device.drm in preparation to
> introduce a 'struct device' member to this structure.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

