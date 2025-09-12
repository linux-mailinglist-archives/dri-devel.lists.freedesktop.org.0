Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE57B55855
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 23:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9E010ECDD;
	Fri, 12 Sep 2025 21:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nDsRUTJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894D710ECDD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 21:27:16 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-323266d6f57so2596523a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757712434; x=1758317234;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUw0RSeecD2zLIJbgNY9ciVUY1nz8HUWc231yjxf71A=;
 b=nDsRUTJhbOTNQ5n7Y4rBQL9tYV8MFl213JPoa07hGqo8swjVQrXKXUsihQqwS6NLc6
 sLavH+k2PyF1AgpB245NxJrTCZSEiWnDkz3in5BpXcj2CPuY5mgkoUqCUWFIQyLBE/BD
 nL7Ofba7WaYlUJJ3ZQBoSMfgTFwGMo7QeM46A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757712434; x=1758317234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUw0RSeecD2zLIJbgNY9ciVUY1nz8HUWc231yjxf71A=;
 b=mjJRhq0t+fDIW2M/2whstJSOfcnljfnCaJIJ0PzalbGqEy8BtTbdJ5Zv0Md06/NPY1
 h3C9XZEqRnN15Bg7hoDYb370Y3ib57LXx2RrbCx5HKujf/1NCSZXCuYlI1rwWWM1R88r
 DLr+JeIWRu9rxJf3kj2nUDyrTH/qLH41tzJsZm6YIAoGgS3Xthdbkk502MValdPfL9i5
 /wecPOuxdL5CFtt8J9CsPEQ6VBDpncZGFIyaeiPWUlznQL/h/fyipAxc4U5QBtxuBrOa
 VzoxWiE8VdknJ8aY5Wf/ew3Lq/a4Y3DFAPzRMDWpexcaI4lTaeIn+4DxpDIua96SdvE3
 2XBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyDFHnJMol7ok5XqbKZEcRmj22KdzY1UmsRny25i4cmcLve3NAOjEzDX1cAJEVM73wPYKxNQiQa80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW5JI8mQu/EDJCd9LZVEdf/hmuk3DrrRrR71vKmrpP9h00UgAL
 ggcZiryv22QAqWdHdR80fM5zF0fs9RTrRcpywz7zFYaIeH8cdPV22g/VMKAfH4oMPSUhkPE/N2T
 ehHw=
X-Gm-Gg: ASbGncvDC4FbzPO709iFuSV1KTU5e/8M1xcnPQXWy5fMIuzcEOvmbP3BRvu3jFtO1Lj
 vs3HukK63wQQ24h4Ul89Q7l1J04PrKWScsEBbVZ3ThfDPmXzfzeXUbHqOs51vwfRtFmHu0kTjyd
 OHmsBs6IoFWNCKh+thZzUKZhhjM8407NyWEmA61L066ab9+stU5/r/fh3aUe+l+EnQstX9t5S5/
 X/fJCj5E7jhehbBqwlYc+pkwc75M/H4AaD+BEX1PEXSlB4Qey8ofatn1ihHITFYM+g//wc/MEfk
 CYaPshVCjSse0mnXj37JAwQOn63twNNnJzxkvAIpvJEdhl1JXSUHiuhAKxPaNSXoyeZA8ESggGL
 7S1qQQ3txgx9ehXgWxibfJ8SLHghsVP3eM9Gdk8UfxiL+cSQH0/IaqSfq1vrBbNVfFKtd7v9aSF
 QEOGMkQU5G/gY=
X-Google-Smtp-Source: AGHT+IEz+vyUhAlSLZ3eDr0LTjtGaDcZomCv0wAnSVLB5iVkKGAYdSEgEfb64Bt7D6IjqIXs14gjeQ==
X-Received: by 2002:a17:90a:fc4e:b0:329:cb75:fed7 with SMTP id
 98e67ed59e1d1-32de4f5cdd8mr5125462a91.19.1757712434312; 
 Fri, 12 Sep 2025 14:27:14 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com.
 [209.85.210.170]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a398dbbasm5567213a12.40.2025.09.12.14.27.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 14:27:13 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-772481b2329so2690373b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:27:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMIfiCk3dSEqDp+62WH1qdl7qzkKL+A6quqzlI7LEN1HZhLm2viQCxZpBS6MKxDPmUEU2nMNpTeLg=@lists.freedesktop.org
X-Received: by 2002:a05:6a20:3c8e:b0:243:a525:7701 with SMTP id
 adf61e73a8af0-2602c71d56amr5497919637.60.1757712432247; Fri, 12 Sep 2025
 14:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250912192457.2067602-1-john.ripple@keysight.com>
 <20250912210805.2910936-1-john.ripple@keysight.com>
In-Reply-To: <20250912210805.2910936-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 Sep 2025 14:27:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVuCNMcPKZjaefAvLXi4Lxxw01HQQc+mEBX1nk8ot-WQ@mail.gmail.com>
X-Gm-Features: Ac12FXwx2NSAgRWKlv3w_UTmvEXFowVCuHvSB09H2KBQpce9XrDYtw6c8t5JqHc
Message-ID: <CAD=FV=WVuCNMcPKZjaefAvLXi4Lxxw01HQQc+mEBX1nk8ot-WQ@mail.gmail.com>
Subject: Re: [PATCH V5] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
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

On Fri, Sep 12, 2025 at 2:08=E2=80=AFPM John Ripple <john.ripple@keysight.c=
om> wrote:
>
> @@ -413,6 +446,13 @@ static int __maybe_unused ti_sn65dsi86_resume(struct=
 device *dev)
>         if (pdata->refclk)
>                 ti_sn65dsi86_enable_comms(pdata, NULL);
>
> +       if (client->irq) {
> +               ret =3D regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, =
IRQ_EN,
> +                                        IRQ_EN);
> +               if (ret)
> +                       pr_err("Failed to enable IRQ events: %d\n", ret);

Shoot, I should have noticed it before. Sorry! :(

Probably most of the "pr_" calls in your patch should be "dev_" calls.
"struct ti_sn65dsi86" should have a dev pointer in it. That's probably
worth spinning the patch. It's really close now, though!


> @@ -1309,6 +1372,41 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_s=
n65dsi86 *pdata)
>         return 0;
>  }
>
> +static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
> +{
> +       struct ti_sn65dsi86 *pdata =3D private;
> +       struct drm_device *dev =3D pdata->bridge.dev;
> +       u8 status;
> +       int ret;
> +       bool hpd_event;
> +
> +       ret =3D ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
> +       if (ret) {
> +               pr_err("Failed to read IRQ status: %d\n", ret);
> +               return IRQ_NONE;
> +       }
> +
> +       hpd_event =3D status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS=
);
> +
> +       if (!status)
> +               return IRQ_NONE;

It wouldn't have been worth spinning just for this, but if we're
spinning anyway I'd probably put the "if (!status)" check down below
right before you grab the mutex, just to keep all the HPD processing
together.


> @@ -1931,6 +2029,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *cl=
ient)
>         dev_set_drvdata(dev, pdata);
>         pdata->dev =3D dev;
>
> +       mutex_init(&pdata->hpd_mutex);
> +
>         mutex_init(&pdata->comms_mutex);

Again, it wouldn't be worth spinning on its own, but if you happened
to want to get rid of the blank line between the two I wouldn't
object. ;-)


> @@ -1971,6 +2071,18 @@ static int ti_sn65dsi86_probe(struct i2c_client *c=
lient)
>         if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
>                 return dev_err_probe(dev, -EOPNOTSUPP, "unsupported devic=
e id\n");
>
> +       if (client->irq) {
> +               ret =3D devm_request_threaded_irq(pdata->dev, client->irq=
, NULL,
> +                                               ti_sn_bridge_interrupt,
> +                                               IRQF_ONESHOT,
> +                                               dev_name(pdata->dev), pda=
ta);
> +
> +               if (ret) {
> +                       return dev_err_probe(dev, ret,
> +                                            "failed to request interrupt=
\n");
> +               }

Another tiny nitpick if you happen to want to fix up when you're
spinning. Officially the above "if" statement probably shouldn't have
braces. I think checkpatch won't yell since it's kinda two lines, but
it's really just one statement... You could even make it one line
since the 80-column rule has been relaxed a bit in the last few
years...


Sorry, I should have noticed the "pr_" stuff on the last review. Sorry
for making you spin again. Hopefully the last one? I think the patch
looks a lot nicer now FWIW! :-)

-Doug
