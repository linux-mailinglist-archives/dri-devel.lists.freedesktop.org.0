Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11950C0CC1B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8566C10E046;
	Mon, 27 Oct 2025 09:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="BIt71DIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC0F10E046
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:51:17 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7f04816589bso497098285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1761558676; x=1762163476;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KEm4VUNhIRm4CI9cgj3+YaFqPnvC9u9Y16aUqGdcNbA=;
 b=BIt71DIQQgjwHCoABfl0jhVxNBK9L3W4Z2gnxnk8hphtTxM+e96CaL8Aywzvq2//tQ
 lb27ZgkoEE5dzQjvu6o3wqEAhdOrN0SEruS+x+5TRdFG4ov0m/2UPFZVWd8cbuLxBpzv
 3SIZrZOv9zkN6iIR/Swqnr/Wawu4sBjYyhtK8zhAHuK6WwyB74US66eKSrc4KIKjvfle
 +5dn30jOKUE+vBtA9Wzm50KCYgUSFTQoe9n1TdZvFJAk0LAvF00NvBwAM6tDdY9caECM
 KZsHdkYViI1kxZykevJsAWlHzZtL/V1T17S1fNIIpQMACHunUH/2lWpEpKm2YqHKnvi+
 /eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761558676; x=1762163476;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KEm4VUNhIRm4CI9cgj3+YaFqPnvC9u9Y16aUqGdcNbA=;
 b=VSFLw/ydFFqBImMaY5X1Do8Wy5lsVEjytfKlAcwekMzDqsSXMDA2Xlt4EpLAtwb/gM
 Yp8c88dJWTJujCvm+nwnYDadtrX8iRVxtjU4dk/i9vQ74w67ySoCsQrlIanvyBfJZiec
 d6dsLnrsPvNUhpYd6lFFomS1XIh1/AyfDdNWJfFroahkbf8IdznTDWwqJ2LIUME/BugL
 HJD4Vsr5eAHqOjad52suBItAZWSBB7OT67LWFTJdcX11/dyuiYmwVhUHv7gU4o8wEIVd
 MEtnDTBPVOu27Q+f4E2D91YNVhChvfWS4WfpFIFO179mYLL9lkqFGEt/AVgGsD8nXpcz
 9JMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrlN4nUNJFnvRgMem801rZ9T8WFjZsAlJym21hqEZ/sKkssgREFzF7RB6exaKkshUeAC+a41Hg7u8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+GMszGvJEWLq1s1E8Vsu/WVsthEhPPre3w31e10uNGmTFM6ql
 QOpF827nsmC1TjoXTYLYZ5juzNQrM340ENDghUNSWKstjcDH3XZO9cfk5IkQ3+6uxlKJdFdSUyX
 +cns57uAFmi2MpjIUn7+Fg2D5rj+alSPwu49b2FtO+w==
X-Gm-Gg: ASbGnctfWeJ8kM6kWW1hqaJ+T7JpU/e2ZVO2sAVkUdzUqmdQ7kug9pJqrq66s7zR0wQ
 YlLAGCfVv3+659kKGhLd56DIFpK25AEev3Z2WdqW8lrLoYOz1AYushmZvKa+iYmvZiJDJcJ3XdA
 J5VMW3SMbIOYPiFe79Ie/zfk1S4Z+aLyXBSl+uuSQpEb0c0NZbAmiLj+t5d5JDGZMY4/EzXmfJF
 ZnUz7hHu1slZTlQOaGTAcel/Bn8kZXypHuttZ+kZUXy0wVPEDngxiMmglh6
X-Google-Smtp-Source: AGHT+IEmWTiOrlsUD5Hm5bOmrc4XIQtZAwVHNawNjN449YPwWXnSlk4xpszoLq7387lR+vuxodMoY2+83tdmzyojrLY=
X-Received: by 2002:a05:620a:c47:b0:891:a91e:98c8 with SMTP id
 af79cd13be357-891a91e99eamr3319941285a.23.1761558676598; Mon, 27 Oct 2025
 02:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 27 Oct 2025 09:51:05 +0000
X-Gm-Features: AWmQ_bnUJmMH5yn8SNjXD9lhXOuvZ_9iWgyNcdJBRyB2VgWGh475OYJjqyOR-w4
Message-ID: <CAPj87rPTKv=qv_fHTVvymNmi=nZHyxW-PgR1EFQE7T8gV1pNzg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, greenjustin@chromium.org, 
 sjoerd@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
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

On Fri, 24 Oct 2025 at 21:28, Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
> Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
> driver") added AFBC support to Mediatek DRM and enabled the
> 32x8/split/sparse modifier.
>
> However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
> platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used by
> default since Mesa v25.0.
>
> Kernel trace reports vblank timeouts constantly, and the render is garbled:

Reviewed-by: Daniel Stone <daniels@collabora.com>

This is definitely the right thing to do until we can figure out why
the DRM driver doesn't like the GPU's images, and how we can get it
fixed in either DRM or Mesa.

Cheers,
Daniel
