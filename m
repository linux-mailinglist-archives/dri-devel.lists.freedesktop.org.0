Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D989CA77DD6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 16:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7779B10E273;
	Tue,  1 Apr 2025 14:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NbVgzHG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833B10E273
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 14:34:16 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so1191353966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743518055; x=1744122855;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eTh5SHeVHsMzCTb1Q+DgN78bwF0gyC1oK/TiTM7beZE=;
 b=NbVgzHG3LC4AVkSKbjibZfmqWl9VEgC9Ot8UkS6EplcMbcF2gIlU8ip5HSrKczMyfM
 nKu3BMxkhKu+tDZAAPp2dStofXL8x1to2ijOj33/+EmySSouWyWieBmAePUE0swCjBqG
 /mKxkB+MCQ+M8I6/KMf84ltVJqjuBU0+kemyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743518055; x=1744122855;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTh5SHeVHsMzCTb1Q+DgN78bwF0gyC1oK/TiTM7beZE=;
 b=w5ShIl6hT7v4jaJxhi5c64CPQil6f+UZCNwnTxltgkj44jkyheJ4V4p7H85EGH5WYG
 Zh2vC974bInDTDlKJlMq08b7gwE7EPt6yVNiYYIk3oFYmym2biZA/gQVy9WBobkbnK1+
 xVJlRk5TZ/YMuU5LKoheuCYeSm2PvEN4I/bJJkkExi6+RM9UI0GKTaS2lqLXkdw9bjFa
 VvNoYa45rmERWL9aCYZC9jV7Sytttg1pP2x2z5ZdM+SgNbMA2WwqtbWPBzedq6V1xv77
 1UrHrl4FRArdFelH/bWxM+V/qtIg6ajMjpHozrBaIhVSWLTOEgEpYv8sE3D7gDwSoNHF
 vffg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTBbQ6XZauUchRh/fcd50L0Fi20ai3BhH7XmaCYI0Yr2wBC291JcwKWmWWEikjfvkKBL91mQAUp1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI8T+wUvmN74TU22LpJ9nRoqBi9gn09mUq6N+Ie+zxPWFQPaqC
 IXUGQSUp1fLmV2HoYRmd0fWKT0MFlC+WxTDcP4wnbqAvXhB0RBEt9g2I+e8iE9NnvowfKoWnAZ8
 =
X-Gm-Gg: ASbGncsRQHtdcAAWCbKyQBwJazG9q2SKj43PnSlTvj2GNj5BjMuEraG7AB/tFZif192
 YiXWKZngeNe+WG8ylCBzRHtk8LBIVlFSEFXCKMZQ5t4yo78FGHJX7aK8Ka7UXigO5VFFagN9hJQ
 TxxBHPA4WQGDPsKGmxSoDpjHtxzmQSILdh05nctvxQM11yhAK3dnbCo7H/W9bTqf/gWKAq453Af
 umLhHdBwfUEPv1FqjX8efhcrdhp35VEa7kKQIT+d/HGcYfO8tdZ7QZUcqW7AL1lSzO6kll1j6Te
 98z27kMnhOQU5mWCq9v5Y6tETwouOkSujXD6333ZK2SlandotOaNM+cet8hduLN4fscByLfwugu
 CEBItHNp/YOQCGw51
X-Google-Smtp-Source: AGHT+IHhls2TANhnt1QfxM05pb0UM+NsurSWJTLB33n8oVTTVRF4TFXCC2aXY+VRaLbOL/6uVGTSEw==
X-Received: by 2002:a17:907:9718:b0:ac6:f5b5:36e0 with SMTP id
 a640c23a62f3a-ac797de1058mr18405966b.19.1743518054390; 
 Tue, 01 Apr 2025 07:34:14 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac78c9e0756sm74981966b.128.2025.04.01.07.34.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:34:13 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5e789411187so9413a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 07:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUn/5cHUK/aMUiz1We4ukXaXXTwZOcM08ADAmY8wcu5peNU/0n4bqCbcfpeXA4W9m5iRrQqD0l1uX8=@lists.freedesktop.org
X-Received: by 2002:a50:cc91:0:b0:5e5:ba42:80a9 with SMTP id
 4fb4d7f45d1cf-5f0347c665cmr100229a12.1.1743518052834; Tue, 01 Apr 2025
 07:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250401130151.2238772-1-dmitry.osipenko@collabora.com>
 <l2ndn2jo2swv4unuc5r7fm3of6w3teyytpqfpgcvkdwnp3fubc@ect2rh2ikmhn>
In-Reply-To: <l2ndn2jo2swv4unuc5r7fm3of6w3teyytpqfpgcvkdwnp3fubc@ect2rh2ikmhn>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 1 Apr 2025 07:34:01 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkMMVQVXeS9Bo=bkXQs1wG2xHMWBCwxjHxPbLkBU2upbA@mail.gmail.com>
X-Gm-Features: AQ5f1JpkuWyndcUlvHsQpMPOTjRVCP5lLXHzBouOq_RMXhlH1GwCPo-Cy9RHAC8
Message-ID: <CAAfnVBkMMVQVXeS9Bo=bkXQs1wG2xHMWBCwxjHxPbLkBU2upbA@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add Dmitry Osipenko as drm/virtio
 co-maintainer
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, 
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
Content-Type: multipart/alternative; boundary="000000000000338dc10631b86e8a"
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

--000000000000338dc10631b86e8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 7:25=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> wr=
ote:

> On Tue, Apr 01, 2025 at 04:01:51PM +0300, Dmitry Osipenko wrote:
> > I was helping to co-maintain VirtIO-GPU driver in drm-misc with
> > permission from Gerd Hoffmann for past 2 years and would like to
> > receive new patches directly into my inbox. Add myself as co-maintainer=
.
> >
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>
>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>

--000000000000338dc10631b86e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 1, =
2025 at 7:25=E2=80=AFAM Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.c=
om">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Tue, Apr 01, 2025 at 04:01:51PM +0300, Dmitry Osipe=
nko wrote:<br>
&gt; I was helping to co-maintain VirtIO-GPU driver in drm-misc with<br>
&gt; permission from Gerd Hoffmann for past 2 years and would like to<br>
&gt; receive new patches directly into my inbox. Add myself as co-maintaine=
r.<br>
&gt; <br>
&gt; Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@c=
ollabora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt;<br>
<br>
Reviewed-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=
=3D"_blank">kraxel@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div>Reviewed-by: Gurchetan Singh &lt;<a href=3D=
"mailto:gurchetansingh@chromium.org">gurchetansingh@chromium.org</a>&gt;<di=
v class=3D"gmail-yj6qo"></div><br class=3D"gmail-Apple-interchange-newline"=
><div>=C2=A0</div></div></div>

--000000000000338dc10631b86e8a--
