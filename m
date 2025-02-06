Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C951FA2B22D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 20:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D37710E929;
	Thu,  6 Feb 2025 19:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TaNeQ/Rp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042F410E931
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:21:53 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30227ccf803so11183441fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738869712; x=1739474512;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iejGLtNphddMwsWcL999rzVMsajm+EjwWDRl83wuIdw=;
 b=TaNeQ/RpHK8A+LYv+ciZ4zEYCbvj31GLXhiotcLEcrn+9Ju1+r+4WUxW41eC+1OmY2
 WrSKjOGoxCPpU6Ds9MBN/S0Aj0xYysz9CjR0Xwb7+njJVz2gR0K8DmnxB4fkfexNRqFQ
 iY309qS9QRmHmKiLp9kI0OD+OJqcBm7sWHawA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738869712; x=1739474512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iejGLtNphddMwsWcL999rzVMsajm+EjwWDRl83wuIdw=;
 b=UqA2BkJTZB5Zdz5GqcEWjG50ysbFcDkRab02ia4G7X3Jjgn/eVWQIl2Q55W+HCSHa5
 WiVsBJEUxBQiYja0TiqIbmQnO2YbJMnp2BQDgAjRBGqjwXl8PHunsrSUm/ea0XMcBq0p
 fz4k1ENYDhLFxZWc+v52Y9/Tntl21gmiTu6oOQVWSdovJJQaTkJeJYWKJyZe9u20zMWi
 Z5MmNUYTHJWA1WLtSWE5+XiTsG0BEk8MpQcZIIPvHAsTe2stRDx1M1RHPRH3LPgT4+5h
 eOOD3dOieCTSjDE7CLRH1KU9oRlBP+i+Ux+3Etoon2i+Xqmt8pnlzSbLHYyeMg6bzBHg
 BSdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrJftwD84JGoD7YolKbrG+aA1cEMY/xPrGjGn6E7EZUnaZEBh8D3OpjRhMqDV6uDkrpKl7hrBK3J4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzves7zoQ1ArNlgN/wfPb7OVZwqjZbbdxbin7psmRQNDQBFWyVp
 0GM4p2jlFQXSJ2+jdIv6CI5nhR+Q7PIG/bGDdaIF1AmBV1wEXx0p7uygtdH740HA51BY7YSAACO
 +/kMx
X-Gm-Gg: ASbGnctNKfd1x/2qlsPI4WdCJT4t+gxpJNYHzSsGMweiq54ddHZyAuWH8FE4yhlxHiX
 451fubTIj9iemT6RPoNPJBaLmRfbdb/Jf53PlZLgwMifxx9/frdIzJvq8bl3LxZKQuwjTVcLWL4
 6jeaGrfHryqUcKzJzxLvFjB6qNSMJ/2uiA4Ivlx5T38WI6a1CePIomvLeJ9TVfa+r2jRgIS7ASh
 vAnv78FTq+StCsLCsc7/gYNyUu5rWFOlnew5KnXE/4nveMStkKOR94gQ/INWmaoOhSHVKBMuNHU
 Zuwl/ELiHAMnqEcdihLwFWnAG5Z1Ago/Nzh734OMXsimzSnq9qxa2DRGToU=
X-Google-Smtp-Source: AGHT+IHpGh9RYIzjrQxReLOgTc5kucts3FmASYGDTD3qnKBHhlgtOsPe+92tDBncPQO3jhzI1MQ6jg==
X-Received: by 2002:a2e:bd04:0:b0:306:124c:69d5 with SMTP id
 38308e7fff4ca-307e5a739f9mr613271fa.34.1738869712124; 
 Thu, 06 Feb 2025 11:21:52 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de18fbfcsm2064451fa.37.2025.02.06.11.21.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 11:21:52 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30797730cbdso12657811fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 11:21:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVTdMJLIxPdN5bYi85skxFgoD10TDmUfEjBL+t9VsX9fmN86BpkiiCrbPFo3Sm5V+CXe44cFYp3gbc=@lists.freedesktop.org
X-Received: by 2002:a2e:be8d:0:b0:302:1d24:8db7 with SMTP id
 38308e7fff4ca-307e57f026amr522881fa.19.1738869711621; Thu, 06 Feb 2025
 11:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
 <20250206-overlaid-eastward-610a0d6e34cd@spud>
In-Reply-To: <20250206-overlaid-eastward-610a0d6e34cd@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 11:21:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
X-Gm-Features: AWEUYZmS9xcU_MiFvWfdau59tVoQMHbzAishOQlY882_MKeaoyXcwaaKzpaqmEY
Message-ID: <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add csot
To: Conor Dooley <conor@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Thu, Feb 6, 2025 at 10:13=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Feb 06, 2025 at 09:12:45AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
> > <yelangyan@huaqin.corp-partner.google.com> wrote:
> > >
> > > Add "csot" to the Devicetree Vendor Prefix Registry.
> > >
> > > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 42d14899d584..375f1f7c79ef 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -336,6 +336,8 @@ patternProperties:
> > >      description: Crystalfontz America, Inc.
> > >    "^csky,.*":
> > >      description: Hangzhou C-SKY Microsystems Co., Ltd
> > > +  "^csot,.*":
> > > +    description: Guangzhou China Star Optoelectronics Technology Co.=
, Ltd
> >
> > Doing a `git log` on
> > `Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
> > most patches use the subject prefix `dt-bindings: vendor-prefixes`,
> > not `dt-bindings: vendor`. If device-tree folks care about this
> > difference and they don't want to fix it when applying, they might
> > request you to send a new version.
> >
> > In any case, that's fairly minor so I'm OK with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I would assume this will go through the DT tree, not drm-misc. If this
> > is wrong then someone should shout.
>
> idk, probably the whole series should go together via drm-misc.
> %subject can change if there's a resubmission, otherwise
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Ah, I'm fine landing it with drm-misc. I'll land it tomorrow unless
there are objections. I'll adjust the subject when landing.

-Doug
