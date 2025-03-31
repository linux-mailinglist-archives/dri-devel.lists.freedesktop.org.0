Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8AA76B5B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6928C10E140;
	Mon, 31 Mar 2025 15:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SnoZNcAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F4F10E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743436593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5lWga/QyMmdOkTxsqf9VB4cCXGX5WJdEnrQK8oyvK0E=;
 b=SnoZNcArKLBb9zFE/vwC3EUwr54b71YVlXVxJ9CbyxknYmUeio6LtBgN3OOCYftaZTLgTe
 JiK8IAMRrR8E2y4OhkT51Jf146WAWdgW2ckgOUUDEE1r4/wyFFRmoqd2DBjzupTk211KBd
 RnhyTnIvxF2e+onS79o6+jbfYgCvchE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-HNqOscfiPFKnfE0kbfaHBw-1; Mon, 31 Mar 2025 11:56:29 -0400
X-MC-Unique: HNqOscfiPFKnfE0kbfaHBw-1
X-Mimecast-MFC-AGG-ID: HNqOscfiPFKnfE0kbfaHBw_1743436589
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f2bdb560ecso57763477b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743436589; x=1744041389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5lWga/QyMmdOkTxsqf9VB4cCXGX5WJdEnrQK8oyvK0E=;
 b=Tln7PeEJ/VXkmdlV8ilYdcExZ5CIOC1t1VeZFCem13JlUOC00jhUQwBE5ka4397ng0
 VVkmtOu+X2GNhpRCXS0P5VUIGUpYlMWYnEyJ4n+aPV6UfTuI0a6fZPa2ejDp2aejTwXT
 ippgHlOW5hexDAtEF18CePzhrGhV2jJwJLpkUewhixIWLKetEb542hDT/X7fk0y+tso6
 NO5c+1h5PKDqgw6hAkFp/5MzzHJ0ptzbzyEY3D0xFmEBPbOxFl5JZt0msYU1sgpIDmUH
 to3QEDehxKSVGJdYumiC09UMjnYN0GWXIrup7Ds5O4ljyBrmLLGAPbhSEoH5p0vgxCiY
 hb2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwbnXuB4MY9UQ42LSfHkx8J93Qabu8p6SRKU3CkzvInW+AOtvVNfPjr42DtlGrVocjfUehDY0PHVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSPE38O14GndlLCsn66gmEl+x1VEKUnzd4DteLtssqbKDUWCMT
 o1FCBojPMSahXOFZUaHr8N0ckM2gnCh/PP/2hh3kek3Vz7iqw0siJA6DvMzq7npMdB60973NEa0
 81nbhXI9JvpE5YqB1kw/8KZWIFEddVWSAyo5PyoygO/wwhdzq9NZhej2l7VPqyn4vWgbNIiZNXt
 jRjB4HpNvMACdMPFilkGrEUiN3NE2Uj5Cp6PPey0Dc
X-Gm-Gg: ASbGncvd592nhOjLJba2IuZLdXlQ0RQpRXBTz0Fy/cwTprZtNoqwdcgOTxdcV+qJvfB
 /09fAAeB+LeotNW0bErop/PArnuCt1I9v4WXgtpilaEmIEXpvSeCw1AZ7gJlW6HFNp9Vbuno=
X-Received: by 2002:a05:690c:4d82:b0:700:a6be:d6b8 with SMTP id
 00721157ae682-70257325258mr120288627b3.35.1743436589261; 
 Mon, 31 Mar 2025 08:56:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo4wAVbOOGJ3SPePd/Vf5i5pH5nmfKJI55Vo1pJ2HHmelgOG2o+Nd5QPbHfGCW4TrGDf3VCiwbT59SsgEPXcc=
X-Received: by 2002:a05:690c:4d82:b0:700:a6be:d6b8 with SMTP id
 00721157ae682-70257325258mr120288247b3.35.1743436588954; Mon, 31 Mar 2025
 08:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
 <20250330-b4-panel-refcounting-v3-1-0e0d4e4641eb@redhat.com>
 <20250331-defiant-jackrabbit-of-culture-cffe6a@houat>
In-Reply-To: <20250331-defiant-jackrabbit-of-culture-cffe6a@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 31 Mar 2025 10:54:55 -0400
X-Gm-Features: AQ5f1JowrLxK8CmjUGu5faxrQCSO6LUwZGjxa-EASE__wOkqSVSH4zG6Q9ob-jg
Message-ID: <CAN9Xe3TaLaagW+HNncPhnJ96mw1ZhvpwSuHEoHAVCvALJf76Vw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X-Z94Tkvi90InQbtBn-2YJe5byj5U5TsIGhy2ahaWWY_1743436589
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000092cafb0631a5763f"
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

--00000000000092cafb0631a5763f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 10:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:

> On Sun, Mar 30, 2025 at 10:24:12PM -0400, Anusha Srivatsa wrote:
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index
> a9c042c8dea1a82ef979c7a68204e0b55483fc28..97a5457b64fbbe9c91c6a4f41b8e1fb=
fe4fa604e
> 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -268,6 +268,30 @@ struct drm_panel {
> >       bool enabled;
> >  };
> >
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> offset,
> > +                          const struct drm_panel_funcs *funcs,
> > +                          int connector_type);
> > +
> > +/**
> > + * devm_drm_panel_alloc - Allocate and initialize a refcounted panel.
> > + * The reference count is initialised to 1 and is automatically  given
> back
> > + * by devm action.
>
> No. I told you in my previous email that it needed to be between the
> arguments and returns
> sections ...
>
> > + * @dev: struct device of the panel device
> > + * @type: the type of the struct which contains struct &drm_panel
> > + * @member: the name of the &drm_panel within @type
> > + * @funcs: callbacks for this panel
> > + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*)
> corresponding to
> > + * the panel interface
>
> ... So here, just like you did for all the other functions you introduced=
.
>
> Also, there's no reference counting yet, so that paragraph should be in
> your second patch.
>

Yup. this patch should just have the helper, arguments and returns.
Anything about refcounting should be in the next one.
Making this change.

Anusha

Maxime
>

--00000000000092cafb0631a5763f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 31,=
 2025 at 10:09=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Sun, Mar 30, 2025 at 10:24:12PM -0400, Anusha S=
rivatsa wrote:<br>
&gt; diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h<br>
&gt; index a9c042c8dea1a82ef979c7a68204e0b55483fc28..97a5457b64fbbe9c91c6a4=
f41b8e1fbfe4fa604e 100644<br>
&gt; --- a/include/drm/drm_panel.h<br>
&gt; +++ b/include/drm/drm_panel.h<br>
&gt; @@ -268,6 +268,30 @@ struct drm_panel {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool enabled;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t =
offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 int connector_type);<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * devm_drm_panel_alloc - Allocate and initialize a refcounted panel.=
<br>
&gt; + * The reference count is initialised to 1 and is automatically=C2=A0=
 given back<br>
&gt; + * by devm action.<br>
<br>
No. I told you in my previous email that it needed to be between the argume=
nts and returns<br>
sections ...<br>
<br>
&gt; + * @dev: struct device of the panel device<br>
&gt; + * @type: the type of the struct which contains struct &amp;drm_panel=
<br>
&gt; + * @member: the name of the &amp;drm_panel within @type<br>
&gt; + * @funcs: callbacks for this panel<br>
&gt; + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresp=
onding to<br>
&gt; + * the panel interface<br>
<br>
... So here, just like you did for all the other functions you introduced.<=
br>
<br>
Also, there&#39;s no reference counting yet, so that paragraph should be in=
<br>
your second patch.<br></blockquote><div><br></div><div>Yup. this patch shou=
ld just have the helper, arguments and returns.</div><div>Anything about re=
fcounting should be in the next one.</div><div>Making this change.</div><di=
v><br></div><div>Anusha</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--00000000000092cafb0631a5763f--

