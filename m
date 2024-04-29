Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62F8B661C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 01:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D08610E523;
	Mon, 29 Apr 2024 23:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IuhU4yuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B7C10E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714432611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mfLx3YYQYDI2fQfZd7hxAX01vHPJP0y0RCss9IRqtlc=;
 b=IuhU4yuhit85sSXW0c1/ngScWXluokqXrowSFhujJaK1L/txi9xC5+J2Xt+2CQtB4dK7MB
 +al/yetccNfky9GLo+T4sEdgfhw638k1IArQka/PvXAJwehyZQuGSD2unPhlS1d+N5A9UX
 lSZ3IWexq3QaNvX6esYHI/xnzL3nSMI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-VLIRUQ5-MNCqZHK__5DooA-1; Mon, 29 Apr 2024 19:16:49 -0400
X-MC-Unique: VLIRUQ5-MNCqZHK__5DooA-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5f7ffdfb44aso5082526a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 16:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714432607; x=1715037407;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mfLx3YYQYDI2fQfZd7hxAX01vHPJP0y0RCss9IRqtlc=;
 b=Op/5GbnMPHTN8qLMZCWGaD9xuOS4ZS2HWHLZGLBUSG27lRkC/fanuc4QDFe43mO/O8
 yfthZkG1DGQnPu5JSueOXUXHkPAFOPlrECGHNibZvIXKjMyCqdd8ydKomCZIZ2L+ok1c
 NsxtfpBvZtxK01/wD/Jyq6x5KTFgu14+DXBqOqYtfrOiARWVH82w/UPWNnYn9L3jg3XM
 vAlabAIiqgGPSRYc4qsgyVb5EHesmzoIb9l1p6qXiKLDRUBf9Zg1d285ud1DqbleCStC
 oB/B8ViuQ3TecTWxRtdAkihaZEm+kcD3LJVeszwEi6Jgxz4okQpFMlvsxsEUNadKEIUZ
 QgJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT2+FSfxUcU/7j7kDX4OkU85DanVz/UH+qJOaaB2JiF9+9UScoAI5jsKes9MCuKASPm+OtsTIftWkCKmcYne/Q+rWpWAf7jleLHhJLjk7s
X-Gm-Message-State: AOJu0Yw6kDj9byFVDFFJwzh1UcutcXTutIAzPVvoFKgDdC/w4+MPgreX
 qeEjj8pYKqaWpM6Ng8Bh3iTQ+HijXwdiZ5WtXfppIODWEhai15TOSbPNtKl1OorucCMNWMtLS3W
 hZDntONIxQCWBWWiy9z1YudZSqS7mHBgQSebhbFjLVIZOYnc1PHM5ACs2Fru13qYvE6rlhrWbso
 KiNnIV9bcxne0K4x5JON+SBUD0/P4w+TXCHUfd66Lt
X-Received: by 2002:a05:6a21:3d89:b0:1ad:ab1:9816 with SMTP id
 bj9-20020a056a213d8900b001ad0ab19816mr11473217pzc.22.1714432607699; 
 Mon, 29 Apr 2024 16:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUZvpgPpaOa7H3d2aoUN1Xb/LVQlTAnMr5zKAT1c4HSshzaCk3AJvVbkJJT4xPOcLPr0FgQhO+FGEq+TsZz1w=
X-Received: by 2002:a05:6a21:3d89:b0:1ad:ab1:9816 with SMTP id
 bj9-20020a056a213d8900b001ad0ab19816mr11473202pzc.22.1714432607350; Mon, 29
 Apr 2024 16:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240426154138.64643-1-lyude@redhat.com>
 <20240429182318.189668-1-lyude@redhat.com>
In-Reply-To: <20240429182318.189668-1-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 30 Apr 2024 09:16:35 +1000
Message-ID: <CAMwc25pVJccw6vJtzo9N5qPeKBOpnVTSpQn0TPt9bYx_ECcXqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau/firmware: Fix SG_DEBUG error with
 nvkm_firmware_ctor()
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <keescook@chromium.org>, Ben Skeggs <bskeggs@redhat.com>, 
 open list <linux-kernel@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

> V2:
> * Fixup explanation as the prior one was bogus

For v2 of both patches,

Reviewed-by: Dave Airlie <airlied@redhat.com>

Please apply to drm-misc-fixes

Dave.

