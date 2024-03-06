Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA98743DE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 00:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C621910ED38;
	Wed,  6 Mar 2024 23:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HEotuD4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ADC10ED38
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 23:29:41 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-42e63a658e1so808951cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709767779; x=1710372579;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGsPzppFtUXfRhn5RIjUZ0vV1nkpHRnqu3sV9ck0Fd8=;
 b=HEotuD4xJVUuOZZddt9MhmtI3KSqc6vFHdpIEweiw1VFzKHQbUDr/H9EB6Y3cxLJdY
 PKML0BseQhMVBiQwZN3IUAVOvjAKz8NUib0PHW+bWFKsZUwjVoxbAA+mbbX/YFb96UOZ
 u4juLDP5VBn/1qrV00fqP3Ve0nQRmVJl6hgmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709767779; x=1710372579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGsPzppFtUXfRhn5RIjUZ0vV1nkpHRnqu3sV9ck0Fd8=;
 b=gueAC++x7DK1uI4QXPfNy7i1yUnE4Xry/A4ANTt+64FLHVytAwf+LzymJMghCxIshh
 FHooi4TOa0mmClSQgKtXlFOnr3o0Pl2F8nMEcP4S6aA/BKzTD7nndUtR39wwU9J3A30C
 h1PY3hYZM+o0XxItcqnc/xY2NpddFUJjnNfkp7386Rs6o0a0pKb4kJQdQfTEz2pwbpTv
 7o+TR2c8qKGVZlRy2MGClDJ6HGCKZaskGPrgd1AnaKfAemStdYMWDBJmYg7BOGEuHjDp
 YQanpHkySd3k14QdJ6nP48XL/6T/kokQN9XrwzoFqe/5TYKQ0G7xMbGCeCNzyP7ZD7zc
 nzkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULDNHprTBn1W/CDP32z9UryOQRdqhrBnFbwjDvy151FGyeWKdPjE3RQjBJo7YxAQlAazfDZlerbLnU0BMAVqn3bXxVR59rA+VTptSBZ+tk
X-Gm-Message-State: AOJu0YxVtHSNBU3QfHu7gqPhtLQBZQBlQcL/7FB7oZJeJEiAZfEXd0Ct
 v+Vrtzu76iKeT0dZI5EGwRW3LAfxAct1r7+V5Ta3pwkpAQYDf1pfa/aX2BfI8ehZ9SWR3MojdMc
 =
X-Google-Smtp-Source: AGHT+IHvjc2C69R2iBZ7GScu2d0M57yWFZY2beA6/SIecpet13Z6TZeoqV+CL6O2l1xW4Y/+bgyzWw==
X-Received: by 2002:a05:620a:16b7:b0:788:3fe3:13db with SMTP id
 s23-20020a05620a16b700b007883fe313dbmr3327815qkj.60.1709767778754; 
 Wed, 06 Mar 2024 15:29:38 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 vv10-20020a05620a562a00b0078835bfddb8sm2273870qkn.84.2024.03.06.15.29.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 15:29:37 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-42ef8193ae6so55521cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:29:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQyArPn8aKNSMvZS7ewIgSv/jnx1nI+duO0WEoOeXVKAMbxMIdhQRIGnxd5/zn0uqAMiKnIBRHRpz14Oosr/UstXJEGzAiyqG/Arx7K0ft
X-Received: by 2002:ac8:5dc8:0:b0:42e:eac5:23d7 with SMTP id
 e8-20020ac85dc8000000b0042eeac523d7mr192594qtx.0.1709767777192; Wed, 06 Mar
 2024 15:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-2-hsinyi@chromium.org>
In-Reply-To: <20240306200353.1436198-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 15:29:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XcMRLvSU+_QrNMSOo4JH0hPmA-F3HFjOBj=QwHHQy_mA@mail.gmail.com>
Message-ID: <CAD=FV=XcMRLvSU+_QrNMSOo4JH0hPmA-F3HFjOBj=QwHHQy_mA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] drm_edid: Add a function to get EDID base block
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> @@ -2764,58 +2764,71 @@ static u32 edid_extract_panel_id(const struct edi=
d *edid)
>  }
>
>  /**
> - * drm_edid_get_panel_id - Get a panel's ID through DDC
> - * @adapter: I2C adapter to use for DDC
> + * drm_edid_get_panel_id - Get a panel's ID from EDID
> + * @drm_edid: EDID that contains panel ID.
>   *
> - * This function reads the first block of the EDID of a panel and (assum=
ing
> + * This function uses the first block of the EDID of a panel and (assumi=
ng
>   * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit=
 value
>   * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that'=
s
>   * supposed to be different for each different modem of panel.
>   *
> + * Return: A 32-bit ID that should be different for each make/model of p=
anel.
> + *         See the functions drm_edid_encode_panel_id() and
> + *         drm_edid_decode_panel_id() for some details on the structure =
of this
> + *         ID.
> + */
> +u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid)
> +{

I'd leave it up to Jani, but I'd wonder whether we need to confirm
drm_edid->size here is at least as big as the base block. In other
words: is there ever any chance that someone would have allocated a
struct drm_edid but not actually read a full base block into it?

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
