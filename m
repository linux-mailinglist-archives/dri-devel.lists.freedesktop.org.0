Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD50AA1181
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD41810E44F;
	Tue, 29 Apr 2025 16:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="W1xSJofm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B94710E44F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:26:54 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-227cf12df27so225965ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745944010; x=1746548810;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFSw9zzZmlKdXsKFkYK6Hk2SAswrTv3a4YDDesvzZZw=;
 b=W1xSJofmYuTGeH+QFWHXoRAXHPm1gdg/OJLUYiwiwemE7CH9vGm1+9HIy4/C8PunVD
 hkmywcEvSmht/ta8a2hOBsk+MUSWBIwL3YvE4omcFfSpVoT+nbToPlUp2dvks0VOl0DF
 bt9r088k1AZ9WnYtY/Q77yO+5Ia3U0ovDT1hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745944010; x=1746548810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFSw9zzZmlKdXsKFkYK6Hk2SAswrTv3a4YDDesvzZZw=;
 b=fMXzKlwmcq8QgGISF/RTVGZdPh4l5cpIcvZMPafM984sogQiipIO1maivvsVIcKD/Y
 LVyyyNa/NeC6WiMpgbHvCAtmmdlvsUluYRUTpVEF5DIcOtOY1IuCEnVl3FLUWafA4x/L
 3qyk0Ha0wJ2tDC68kwTcYOy2EcZ526bMLVrQy9EorJC1F9POSpC5Kp+BRMyFzGttCEhu
 pWLpiIMGM4+4qw1juaxi3F24eud4EPW15iGeoXPz2Uetsy9IFmfkqE6T5c4yBapr1odV
 5uNxMnbke6YJIVb9/KkY1i+qr/i7IM8bCnzZ/nH9jooR6Z4Ic+pC9hIjYNOxJX8lwRRF
 J74w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR0nKzAqaaKNVyprTzNf1QvUaZHONAw24cEvvKwbUZR9DlZcvIi6zFdLerGK7cFBf4YvH02lz5nqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoN1mVNVJGXayFpk4ZouGkOeyncPtl7Wyk7a5wlFdyETtwhNWS
 EBfOOZEAZMfXQ+g/gBzEzKS41QTwSAoBqlL3PUgCwqTFbX8jFn7HaPKJ+wZUC86adFl5G4pryiY
 =
X-Gm-Gg: ASbGncv7kuPdzsFNa6FWkc/3dUvc5VsUhDyASVXJBWdXMgCLNuUR0jQl4mHfTL1yNmG
 4zuTcm2lD92o/D6EfzbmgZY6t0MS36NlUdg6Fy/DSWAPkrQ44p66zSpxfY149BCKHojHrtASMHO
 9ZP1qoWddQGW0ff2+VbqqELcaJHhCV56YWF5t+HHtOweLaQ25BH0RDgepuDZjD4TJhprZjMT6vA
 znDDtM1F3x5I6hKIadcKcfTTiZ65iPqww6XNQZ/UxworqC4UUYV+6frviOPw5pA9w69e0D24J1m
 gXy6dDOY2e3hQ1Uc6CXjv7cJw8xbtd1dGjmd404iU329eXPoLxVre2dhUa2+fXlDuHA6R9KXzGA
 iLbTf
X-Google-Smtp-Source: AGHT+IHgneXuwOay9TLmpKs2TrTMqC9AmrqnTt1Kr1cQVS/5KJSnGmxhvgbQswOHUZEzJC1N74cyIg==
X-Received: by 2002:a17:903:1b24:b0:216:4676:dfb5 with SMTP id
 d9443c01a7336-22de6c64cb0mr49376805ad.21.1745944010509; 
 Tue, 29 Apr 2025 09:26:50 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db52214dasm104427105ad.253.2025.04.29.09.26.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 09:26:49 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-30863b48553so26637a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUqO48aTkIwd4qKRuGC6Fk2XhoSiHJr9hPKjWcxtdSzmybKh2swnf5P8a0qeWQjdDYVfGjDdY11tU=@lists.freedesktop.org
X-Received: by 2002:a17:90b:514c:b0:306:b593:455e with SMTP id
 98e67ed59e1d1-30a2244ac78mr5519557a91.1.1745944008394; Tue, 29 Apr 2025
 09:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250429092030.8025-2-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250429092030.8025-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 09:26:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UsMaXA6aGjG=VxuQqPKT+zXSer8VD7JztpWWw1aq1WGQ@mail.gmail.com>
X-Gm-Features: ATxdqUHoXvlkOKGwmAYlJRi_2idzUonnocWOsACoF9fazlVz2BlbZKPESPlK8BI
Message-ID: <CAD=FV=UsMaXA6aGjG=VxuQqPKT+zXSer8VD7JztpWWw1aq1WGQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/panel-edp: Add support for AUO B140QAN08.H
 panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Apr 29, 2025 at 2:20=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> AUO B140QAN08.H EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 06 af b9 fe 00 00 00 00
> 00 23 01 04 a5 1e 13 78 03 c1 45 a8 55 48 9d 24
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 18 86 40 a0 b0 08 52 70 30 20
> 65 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fd 00 28
> 3c 71 71 22 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 42 31 34 30 51 41 4e 30 38 2e 48 20 0a 01 79
>
> 70 20 79 02 00 21 01 1d c2 0b 58 07 40 0b 08 07
> 88 8b fa 54 7e 24 9d 45 12 0f 02 35 54 40 5e 40
> 5e 00 44 12 78 22 00 14 ef 3c 05 85 3f 0b 9f 00
> 2f 80 1f 00 07 07 51 00 05 00 04 00 25 01 09 ef
> 3c 05 ef 3c 05 28 3c 80 2e 00 06 00 44 40 5e 40
> 5e 81 00 15 74 1a 00 00 03 00 28 3c 00 00 60 ff
> 60 ff 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
      commit: 5f8f898b14b2401e980b1f206b827d985e040ebe
