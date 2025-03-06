Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2315A550CF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6DB10E9F3;
	Thu,  6 Mar 2025 16:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ExPWbScw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66EC10E751
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:28:30 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e461015fbd4so576619276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741278510; x=1741883310; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u401eKdfAsjVPwVjKoY3JEKzFhztqUsvAALPu64QJMg=;
 b=ExPWbScwfqVLMLV6Jq3WlzHe7VxPlBmsxM2MR8XyrKbt9W9VO/vzaN784HO0SOhJNU
 gH8stjDEmLvzkfzkTBeSv2fbLk6sgenmr+FDJwbeKNm+7bBgpYGvqms7RJQMEXGgrb+b
 LHpRF6Ek3KSB7jqV9V2m81fWdO+mDg+O5vSr7IWxgB7PeyIFzrBXmpgsYVx8VegpHlRp
 6gHO3x4Z0e0LSCsKP8qShz6dHDgUafxX7TKal7gDs1qWAB4O7Aewv+aLLMsDWD8Xtql0
 g4RebdAuouqH0enYZhMp53GOd01w87npQ0LphRnCFAVxSk2WqnUPa9ucJhjf0dHAhlcN
 fvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278510; x=1741883310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u401eKdfAsjVPwVjKoY3JEKzFhztqUsvAALPu64QJMg=;
 b=nu5DtUmnIVsFYjlzF+t9sg7WhoFg3prso0R/LV83HqYNFe+nMzt6whyrmOYHbB7Zpf
 l8boCjyI1f3SbSWEmRloTMjv5HD0r0p1OAsMSY2gvOcNkv5kFreSrUuelM8pCf5pOf5i
 db6Dd/fVuYPJme6cbXN3bjWP2Dic5Bc7onWCSOIi60qajMpqOCBNyaM5qheucsz/pYDQ
 Iek7fdwGTwY6t316Lci90bi11OInps1fLHCV02t+vJD3Zyv0KLGWWlBJnQLKE/mQCGbs
 GPZYzpyy8grr0wGXAPbqfOnb++cFLwgKdObevI5xrVBktjzXLD44wiHqMG3KBMGX4VoI
 NNdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNT1xoRE0OjP41aT3OaNUy24HrymiP5NxicpESn0yNlysfCksLAVS3m+iFR+L2FlyQLJVHto2T3YM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCqQ6hYb2pExOfi+BhEKbHBeg2SwJ/zu4tvxjg99j002/Umymk
 kX8sUsUxmH4vEuO0S3N4t8OjVWqpO+sKCaApfjd8wiNtsM1/xmHtzycCY7vBASmDqtViKBCoTSr
 kSMIDag3gqjmzjWEqcJw0aLmFl4LjW1XgmOzDBw==
X-Gm-Gg: ASbGncuam+Ln5coO89borBMO0GW4khve4psMLkt+MM2a5h6/BCHvIPU+DfBndwQQ3lm
 1La922KkYIZU4LdcAcb3AjXB4fwxrlcwWe7efhip/RunVSfvnCcKQTWBDhI/wXmgCztifHn2JVp
 u3HNor/5Ko4Kj8CAbG0B8Z7gQPXQwkJEy2uOukUb3nwfvy4Udc8bpEx5dY
X-Google-Smtp-Source: AGHT+IFWX8cMwz1Cinq5ViWvbdeKGSudz4sYjepsj7zpuVhC2/gnGasZpctcONcxuPwKJpNSiunXCog2EiU/l1jDLV4=
X-Received: by 2002:a05:6902:72e:b0:e61:1b41:1765 with SMTP id
 3f1490d57ef6-e611e1af5e5mr11126896276.17.1741278509724; Thu, 06 Mar 2025
 08:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
In-Reply-To: <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Mar 2025 17:28:17 +0100
X-Gm-Features: AQ5f1JrGCXtLbfdfJxbvkwabPWzjGFyxIosg6el8QHcriEDkbtpQ9dR5dwW-KkA
Message-ID: <CAA8EJpqBy22eWZjccT5_UM2PQGjiG4ZEfrb6S_1tP1w962rd8w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>, 
 Doug Anderson <dianders@chromium.org>
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

On Thu, 6 Mar 2025 at 17:10, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
>
>
> On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>>
>> Hi Anusha,
>>
>> On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
>> > Move away from using deprecated API and use _multi
>> > variants if available. Use mipi_dsi_msleep()
>> > and mipi_dsi_usleep_range() instead of msleep()
>> > and usleep_range() respectively.
>> >
>> > Used Coccinelle to find the multiple occurences.
>> > SmPl patch:
>> > @rule@
>> > identifier dsi_var;
>> > identifier r;
>> > identifier func;
>> > type t;
>> > position p;
>> > expression dsi_device;
>> > expression list es;
>> > @@
>> > t func(...) {
>> > ...
>> > struct mipi_dsi_device *dsi_var =3D dsi_device;
>> > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
>> > <+...
>> > (
>> > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
>> > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
>> > |
>> > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
>> > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
>> > |
>> > -mipi_dsi_generic_write(dsi_var,es)@p;
>> > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
>> > |
>> > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
>> > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
>> > |
>> > ....rest of API
>> > ..
>> > )
>> > -if(r < 0) {
>> > -...
>> > -}
>> > ...+>
>>
>> The point of sending a single patch was to review the coccinelle script,
>> so you must put the entire script you used here.
>>
>
> I was actually thinking of sending patches per driver this time around si=
nce Tejas also seems to be looking into similar parts....Thoughts?

Have you discussed it with Tejas? What is his next target?

>> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
>>
>> That hasn't been my email address for 6 years :)
>>
> My bad. Will change this.



--=20
With best wishes
Dmitry
