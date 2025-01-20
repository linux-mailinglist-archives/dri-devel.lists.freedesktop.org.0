Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90385A16D52
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 14:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D28B10E40D;
	Mon, 20 Jan 2025 13:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="B2mHJk6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F8410E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 13:22:17 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so798893466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737379276; x=1737984076;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4Npx7Oct9zPMOO2NaFe3DEJQau8prJj8DXgZlRP1r+o=;
 b=B2mHJk6p0/Na+pQOK8SdKBOemjOZ5YHTKrhrX0QRNk0NiL3EtEUMfBAljP9/1VOQbY
 K2ug/0s7LTI4Rrx6ifuuwUbKHRqWOGMf4hh3o+2fglSo1hUqtCwX1ZQVWNhtIRStANkt
 nuhZdfOPakCzYueuuEUeyqU69GmjWveuCAKn/pGRkddov9POglegqIiX8qBpbsPBQHI5
 D9LmiVZ9umz2Xaz6mrMqwWlNM3b5aNrcIT4gpNwGGRJn6JnII6q9DZfCqU8YdYxDoasH
 CRYDYn1I661y/ZrfSCriRmfbmHN7Wvn7ZAdg/YgZQXRmM1We0d8FD2gVg0cZWNriuRh0
 rj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737379276; x=1737984076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Npx7Oct9zPMOO2NaFe3DEJQau8prJj8DXgZlRP1r+o=;
 b=PPfhLTxhRpiNw+FxI38PLeNsxpDREPykwUvFn2P0khqv8XU1ba0sYgry3m90t7m+Gt
 AnEMY/ERnd7VIP4Y009NZDQYUQC9bCrsT8mgByRvizi4kThU6wwPbtzwGcxagUDj4j3g
 2zTL5aHUqF/5rEJQii3CSO34lxgvS6PnMZzQAJ3zX7kaxqbv2JjxlnoYvYHqgP3hvLBU
 KEtza4ApPrVUdWAVQMeb1WJqtxJa4cmovDFw0JbxvYIXuFyoRdmYsTVllCRn6v1MjJ/+
 ZHR8Y3+Loio16y67fA5qTWhLU35cWzSxE/Cmryc4HVICAVAoo0p5FvnOoeLc/U0xByBx
 /cYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhYoTZegVviD8rP70ZZvQyTLt9JTiACyCl55uSkI8ZKa9dqC47Vj14I2W8v6QaoCtpLfuXbeO+ZdQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi0x4ZB7QZhM/D/WO8wam6YCqXH2irrZmcsFeNojE7odSFxFl4
 ucKtY3Fm4wK6LYn8EMrdHl3S8Q9Hn+x3JKtwOx/TB+gei6G8CkSc7wkN3ftbd8oE1n7Oqdb9WUp
 h9ozcVfBWsz8DJKosc85Dv0AJnzmClc3WeihGhg==
X-Gm-Gg: ASbGncsffZ5cpFosld53qUKrUkYj2ST+yeSbAyIaZSnzT8ye0boPJ9Q8CGW5CKxwnTD
 haRpnn5VAVYB9aFt7tWwv2lPXy6VDDkjyHaIy7dSUcS7M7BZ34Irm9mCbwbxdXOM=
X-Google-Smtp-Source: AGHT+IF6YEtsDwD6RMoSrYUv7fGebvulZuM6Zyjh/xDF3wOy6p3GGxH2+/gb6NjTxfgv2SLkyTNQfQRImtMuMGizr3o=
X-Received: by 2002:a17:907:2cc5:b0:ab2:ea29:a2 with SMTP id
 a640c23a62f3a-ab38b3db735mr1341137566b.48.1737379276380; Mon, 20 Jan 2025
 05:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com>
 <f2aj2jye6apigbn4dr5gbkv6vzy44ec736qfk64f4gueoocveb@rnuf3tfw7uie>
In-Reply-To: <f2aj2jye6apigbn4dr5gbkv6vzy44ec736qfk64f4gueoocveb@rnuf3tfw7uie>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Mon, 20 Jan 2025 21:21:05 +0800
X-Gm-Features: AbW1kvawcA68Wsv9Ub2VBFBPgNbOXiWhCWi3Q9_o1qw7mEcTmm97zBfPrrKkU2g
Message-ID: <CA++9cvraXGgmjz11mw6TZ6=mUctW--U0NRsD3YP2srrJ98AhDQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] support for kingdisplay-kd110n11-51ie and
 starry-2082109qfh040022-50e MIPI-DSI panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000009bf6a0062c232215"
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

--0000000000009bf6a0062c232215
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I already have DT binding for my panel.Please help review the patch for
V4. Thank you very much.

On Thu, Jan 16, 2025 at 10:04=E2=80=AFPM Dmitry Baryshkov <
dmitry.baryshkov@linaro.org> wrote:

> On Thu, Jan 16, 2025 at 09:05:30PM +0800, Langyan Ye wrote:
> > The kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e are both
> 10.95" TFT panels.
> > which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver.From the datasheet,
> > MIPI needs to keep the LP11 state before the lcm_reset pin is pulled
> high, so increase lp11_before_reset flag.
> >
> > Langyan Ye (2):
> >   drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie
> >     MIPI-DSI panel
> >   drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e
> >     MIPI-DSI panel
>
> Please provide DT bindings for your panels.
>
> --
> With best wishes
> Dmitry
>

--0000000000009bf6a0062c232215
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I already have DT binding for my panel.Please help rev=
iew the patch for V4. Thank you very much.</div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan=
 16, 2025 at 10:04=E2=80=AFPM Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry=
.baryshkov@linaro.org">dmitry.baryshkov@linaro.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 16, 2025 at 0=
9:05:30PM +0800, Langyan Ye wrote:<br>
&gt; The kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e are both=
 10.95&quot; TFT panels.<br>
&gt; which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.F=
rom the datasheet,<br>
&gt; MIPI needs to keep the LP11 state before the lcm_reset pin is pulled h=
igh, so increase lp11_before_reset flag.<br>
&gt; <br>
&gt; Langyan Ye (2):<br>
&gt;=C2=A0 =C2=A0drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110=
n11-51ie<br>
&gt;=C2=A0 =C2=A0 =C2=A0MIPI-DSI panel<br>
&gt;=C2=A0 =C2=A0drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh=
040022-50e<br>
&gt;=C2=A0 =C2=A0 =C2=A0MIPI-DSI panel<br>
<br>
Please provide DT bindings for your panels.<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--0000000000009bf6a0062c232215--
