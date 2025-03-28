Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E4A742D2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 04:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1FB10E975;
	Fri, 28 Mar 2025 03:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iVAL3uUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127FC10E975
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 03:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743132931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usKcBKUiUQSqKONDJgmZhFPmNI3mTlZy9aKEuoHbHmM=;
 b=iVAL3uUpUqevJeemSkIobldsAY5RWiPwAe3TmdWFIJlCXN5olXaby/ZzUV4I9NC1oisASp
 saNuhde8Vq7fUN2HtUSen+B/fTP5ZKxtM8pVuytEf9Wsxu7swF76etN3pXZMwkw5gtZ2op
 SSJ69rLFAyx2yoL1f1/sJFXq9g/Ucuk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-XgFxPX4OMaOTqr5G2ZgDDA-1; Thu, 27 Mar 2025 23:35:29 -0400
X-MC-Unique: XgFxPX4OMaOTqr5G2ZgDDA-1
X-Mimecast-MFC-AGG-ID: XgFxPX4OMaOTqr5G2ZgDDA_1743132929
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6f2a2ab50f6so24851827b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 20:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743132929; x=1743737729;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=usKcBKUiUQSqKONDJgmZhFPmNI3mTlZy9aKEuoHbHmM=;
 b=bAPquHQJQr3uuwn7YGxMiZVT8OLfpHb9LiYU/2ekIpYJZL7wWkV9CkpsjyVDtX1ax0
 IH2qqCZW95AAGqheFmhqbtT7RTWhPreuklTKbNZDV5ZyrzBo7MnfI9sZkagaT2OZJ8ef
 VKw6nOMDWM3BqblfZqVFUk7HR74w1fHKM3htrO7y6dTmcil6+2AG1VqVvBYeGNpcclAX
 +htnOptvpNarFctdJGJWHO2/SVXlxKDBjIyN5zDXU5pCivb4Tlv95IReOIvb5WHRYs9C
 hWN98k15YhXh/PVKuSWIGCKtT6ge3/3GgogDHX3bkQXRNcZLMShew2q87KVXPxY5DVTd
 b5jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA3V8ZzU6YKg7GJwP+DbbgOrbpPqvaeAblh73GQFA3jxYei37+e9UOmNGeXLSN4LjZq8LW53cpiic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoAuE0ifaRPGUgAHDgbwoULhoUw2wbqG/CPb31cup7AGDcLnky
 lYFkVswWsN3r5ehtsuEPIoFKf/yShrMxxmnIzhoxv6YHMERmm/fj7ro1W+oJYhNcskn/po4JNsd
 H0D+CCbc3cFSX82yJuyg4fcGXysx/sA2KTYoELzDVTQuA8s+8EH5XPFpuVaDbsOm70t7TZdsSRE
 JuVctYu/tGDF9jHaSkXJhjD+YXdObLLh1e1Ex5i/B0
X-Gm-Gg: ASbGnct5WhJO6DPZWzD1YnRczLJjuo+FFu/f8La5l5WPstn3UuvU3/InP20gNqx2gy4
 pf++5IpuJsbV/DKzts5D03jbFPzOl6L03gfjyJCdrVG/tIBadRLKkmzCNxSXnpXnHRJ6dAYQ=
X-Received: by 2002:a05:690c:680e:b0:6fd:3dd3:c768 with SMTP id
 00721157ae682-70224f01e20mr85762597b3.2.1743132928952; 
 Thu, 27 Mar 2025 20:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiiWgeE8KfRgDp7Qss8k23dxLX2Nbvq1hhOC6uiCVNm/a1/gxhUX3wj5hWQhDFY49lNuVaDvUkORnCcQKjF9c=
X-Received: by 2002:a05:690c:680e:b0:6fd:3dd3:c768 with SMTP id
 00721157ae682-70224f01e20mr85762377b3.2.1743132928448; Thu, 27 Mar 2025
 20:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
 <CAD=FV=WvD6tTu_rLTm0njXM5-S_1WBg2rf+TyFZvdi8xUT7yQA@mail.gmail.com>
In-Reply-To: <CAD=FV=WvD6tTu_rLTm0njXM5-S_1WBg2rf+TyFZvdi8xUT7yQA@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 27 Mar 2025 22:32:44 -0400
X-Gm-Features: AQ5f1JptLiItXJqf1k9KSW1nrIdGJWlW1enEH5LZcDQYBadm4S9hrj2t0uxO3eg
Message-ID: <CAN9Xe3QCd1HO2pL5SAVB-TVrVU8AgVZc+D5MD9owkqv6DgKSpg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pheYKVPrDTWNpRLd8O94j91BpWUJmU1uuAKXDmkPaC0_1743132929
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ff377706315ec211"
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

--000000000000ff377706315ec211
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 4:54=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> Hi,
>
> On Wed, Mar 26, 2025 at 8:29=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.=
com>
> wrote:
> >
> > Move away from using deprecated API and use _multi variants
> > if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
> > instead of msleep() and usleep_range() respectively.
> >
> > Used Coccinelle to find the _multi variant APIs,replacing
> > mpi_dsi_msleep() where necessary and for returning
> > dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> > does not have a corresponding _multi() variant. Replacing it with
> > mipi_dsi_dcs_write_seq_multi() instead. This change is manual.
> >
> > The Coccinelle script is the same as the one in commit c8ba07caaecc
> > ("drm/panel/synaptics-r63353: Use _multi variants")
> >
> > v2: Use mipi_dsi_write_buffer_multi() in place of
> > mipi_dsi_dcs_write(). (Dmitry)
> >
> > v3: add commit details where the same coccinelle script is
> > used and remove the actual script from commit log.
> > Use mipi_dsi_dcs_write_seq_multi() for mipi_dsi_dcs_write() (Doug)
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Tejas Vipin <tejasvipin76@gmail.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> > Changes in v3:
> > - Simplify commit log by adding a reference to a patch that uses the
> >   same script.
> > - Simplify code by using a helper that doesnt need additional code
> >   changes other then using the helper itself.
> >
> > - Link to v2:
> https://lore.kernel.org/r/20250324-b4-panel-ls043t1le01-v2-1-e43aedc115be=
@redhat.com
> >
> > Changes in v2:
> > - While mipi_dsi_dcs_write() does not have a corresponding _multi()
> >   variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
> >   APIs following _multi() usage for easier error handling
> >
> > - Link to v1:
> https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0=
@redhat.com
> > ---
> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 41
> +++++++++----------------
> >  1 file changed, 15 insertions(+), 26 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>

Thanks Doug and Neil!

Anusha

--000000000000ff377706315ec211
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 27,=
 2025 at 4:54=E2=80=AFPM Doug Anderson &lt;<a href=3D"mailto:dianders@chrom=
ium.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi,<br>
<br>
On Wed, Mar 26, 2025 at 8:29=E2=80=AFPM Anusha Srivatsa &lt;<a href=3D"mail=
to:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Move away from using deprecated API and use _multi variants<br>
&gt; if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()<br>
&gt; instead of msleep() and usleep_range() respectively.<br>
&gt;<br>
&gt; Used Coccinelle to find the _multi variant APIs,replacing<br>
&gt; mpi_dsi_msleep() where necessary and for returning<br>
&gt; dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()<br>
&gt; does not have a corresponding _multi() variant. Replacing it with<br>
&gt; mipi_dsi_dcs_write_seq_multi() instead. This change is manual.<br>
&gt;<br>
&gt; The Coccinelle script is the same as the one in commit c8ba07caaecc<br=
>
&gt; (&quot;drm/panel/synaptics-r63353: Use _multi variants&quot;)<br>
&gt;<br>
&gt; v2: Use mipi_dsi_write_buffer_multi() in place of<br>
&gt; mipi_dsi_dcs_write(). (Dmitry)<br>
&gt;<br>
&gt; v3: add commit details where the same coccinelle script is<br>
&gt; used and remove the actual script from commit log.<br>
&gt; Use mipi_dsi_dcs_write_seq_multi() for mipi_dsi_dcs_write() (Doug)<br>
&gt;<br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; Cc: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org=
" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
&gt; Cc: Tejas Vipin &lt;<a href=3D"mailto:tejasvipin76@gmail.com" target=
=3D"_blank">tejasvipin76@gmail.com</a>&gt;<br>
&gt; Cc: Doug Anderson &lt;<a href=3D"mailto:dianders@chromium.org" target=
=3D"_blank">dianders@chromium.org</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v3:<br>
&gt; - Simplify commit log by adding a reference to a patch that uses the<b=
r>
&gt;=C2=A0 =C2=A0same script.<br>
&gt; - Simplify code by using a helper that doesnt need additional code<br>
&gt;=C2=A0 =C2=A0changes other then using the helper itself.<br>
&gt;<br>
&gt; - Link to v2: <a href=3D"https://lore.kernel.org/r/20250324-b4-panel-l=
s043t1le01-v2-1-e43aedc115be@redhat.com" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/r/20250324-b4-panel-ls043t1le01-v2-1-e43aedc115b=
e@redhat.com</a><br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; - While mipi_dsi_dcs_write() does not have a corresponding _multi()<br=
>
&gt;=C2=A0 =C2=A0variant replace it with mipi_dsi_dcs_write_buffer_multi() =
to have all<br>
&gt;=C2=A0 =C2=A0APIs following _multi() usage for easier error handling<br=
>
&gt;<br>
&gt; - Link to v1: <a href=3D"https://lore.kernel.org/r/20250316-b4-panel-l=
s043t1le01-v1-1-ee38371b0ba0@redhat.com" rel=3D"noreferrer" target=3D"_blan=
k">https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba=
0@redhat.com</a><br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 41 +++++++++--=
--------------<br>
&gt;=C2=A0 1 file changed, 15 insertions(+), 26 deletions(-)<br>
<br>
Reviewed-by: Douglas Anderson &lt;<a href=3D"mailto:dianders@chromium.org" =
target=3D"_blank">dianders@chromium.org</a>&gt;<br></blockquote><div><br></=
div><div>Thanks Doug and Neil!</div><div><br></div><div>Anusha <br></div></=
div></div>

--000000000000ff377706315ec211--

