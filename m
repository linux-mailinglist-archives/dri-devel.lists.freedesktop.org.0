Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F98743E2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 00:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDAB10EDA1;
	Wed,  6 Mar 2024 23:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S5/AtGPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B22410EDA1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 23:30:03 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-42f07863137so1473831cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709767800; x=1710372600;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJPa29UemqkJNoNGTKdfNViJ5FBTYfS9WvG9ykZmeu8=;
 b=S5/AtGPTxf0eQDEHa3+/D8Mf7xK8wj2KPIveRAkUki6xsROTNC3TYDode9aifhHY7Y
 vyyVQa/cpvgwh1yGqvxHsJ8nmiOT6PnQjzO/ZWgSm+v/xz1O+nijMkjue+aXPd4quXXt
 xBXdifWjiVn/qWkzdDuu5SynZED4VxToMyPHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709767800; x=1710372600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJPa29UemqkJNoNGTKdfNViJ5FBTYfS9WvG9ykZmeu8=;
 b=QU9eI1DW/PrZkbjcQzt337YOBQLkjXjP/8hb2vG4ZVyu2vENasMX0W256v6Okz+Boy
 xUz74ccpkTN8QIuWMbuy2ESxLa8r/6TBGAfCg9UzKoN1farLxNWc0CQ2kieQLUnlDHNH
 31U2+H16euuo19VlbhD0ZXDDeqazh8eq8sVitxWvCD64Wq9ZVrfhutpikRUDMfdXaafa
 wvXFqyVSnggU9ih8VWzSxosR2SfNMaLwtKEDKDVMT9K87yollHT1PC1NDvvofWYyn5Zw
 OoFyGZZlq7MMqyHM10SeHGFoVJ+hDhFbb9B/XD86akmOh6IoKW6UFT1ntsfx3fgnhlLp
 BRFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXby170CTDH7VYm+jHTr0uPZ0Nf4tPf4CP2jZAnpv9cIv7Mr+3D7F0cisSqzFhMS6Y/GxV6pspOHXcg9Eb2I8UtbkeH6MpCB0V7xQsHyYIX
X-Gm-Message-State: AOJu0YzwJ0vBPinfSXoDbCzElc3HiSIzsBc96nEB4HlD3PzgH6VKDbyJ
 /CTnxYfkPYh6dUH6J9MKrggkiOdTiUFFx5o/DGMKMryCGfUtg9awbPHzPHMnSV4xrG+Cu47JvMU
 =
X-Google-Smtp-Source: AGHT+IGYz8CaVV9xA43bchg/x71TwCkKNnY1JBSK9F5dEqr/Bdd10Z0bOJSis/y9kNorgYpxYg2XGQ==
X-Received: by 2002:a05:6214:192a:b0:690:9734:84e1 with SMTP id
 es10-20020a056214192a00b00690973484e1mr2710255qvb.0.1709767800138; 
 Wed, 06 Mar 2024 15:30:00 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 x10-20020a0ce24a000000b0069044802760sm8013879qvl.120.2024.03.06.15.29.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 15:29:58 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-42ef8193ae6so55811cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:29:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCUk4El/H5Lqpe3Hba5tW2Nr4KryXzhveodSZhzwT7xG2SuY6P+EhNFSZSc+BmUAgVu/+8R9YODiWwcfQygCUyaTVCjAbLMCMf8mwm2+Zj
X-Received: by 2002:ac8:5ad3:0:b0:42e:dced:d36c with SMTP id
 d19-20020ac85ad3000000b0042edcedd36cmr86231qtd.29.1709767796260; Wed, 06 Mar
 2024 15:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-4-hsinyi@chromium.org>
In-Reply-To: <20240306200353.1436198-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 15:29:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
Message-ID: <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/edid: Add a function to match EDID with
 identity
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
> +static void
> +match_identity(const struct detailed_timing *timing, void *data)
> +{
> +       struct drm_edid_match_closure *closure =3D data;
> +       unsigned int i;
> +       const char *name =3D closure->ident->name;
> +       unsigned int name_len =3D strlen(name);
> +       const char *desc =3D timing->data.other_data.data.str.str;
> +       unsigned int desc_len =3D ARRAY_SIZE(timing->data.other_data.data=
.str.str);
> +
> +       if (name_len > desc_len ||
> +           !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME) ||
> +             is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRING)))
> +               return;
> +
> +       if (strncmp(name, desc, name_len))
> +               return;
> +
> +       /* Allow trailing white spaces and \0. */
> +       for (i =3D name_len; i < desc_len; i++) {
> +               if (desc[i] =3D=3D '\n')
> +                       break;
> +               if (!isspace(desc[i]) && !desc[i])
> +                       return;
> +       }

If my code analysis is correct, I think you'll reject the case where:

name =3D "foo"
desc[13] =3D "foo \0zzzzzzzz"

...but you'll accept these cases:

desc[13] =3D "foo \nzzzzzzzz"
desc[13] =3D "foo \0\0\0\0\0\0\0\0\0"

It somehow seems weird to me that a '\n' terminates the string but not a '\=
0'.

I would have done:

      for (i =3D name_len; i < desc_len; i++) {
              /* Consider \n or \0 to terminate the string */
              if (desc[i] =3D=3D '\n' || desc[i] =3D=3D '\0')
                      break;
              /* OK for spaces at the end, but non-space is a fail */
              if (!isspace(desc[i]))
                      return;
      }


> @@ -367,6 +367,12 @@ struct edid {
>         u8 checksum;
>  } __attribute__((packed));
>
> +/* EDID matching */
> +struct drm_edid_ident {
> +       u32 panel_id;
> +       const char *name;

Might not hurt to have a comment for panel_id saying that it's encoded
by drm_edid_encode_panel_id() so it's obvious what this random u32 is.


-Doug
