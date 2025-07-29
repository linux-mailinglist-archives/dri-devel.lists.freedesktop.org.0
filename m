Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF67B15506
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 00:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6468110E2DE;
	Tue, 29 Jul 2025 22:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bhULLlix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC0610E2DE;
 Tue, 29 Jul 2025 22:00:48 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-71a3f7f0addso3109367b3.2; 
 Tue, 29 Jul 2025 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753826447; x=1754431247; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bf7MCgMW3rHEy3/8Boxp0Sj1cjXi7btiouj/QL5jI6g=;
 b=bhULLlix0zTHQkxjBaEbi1uH14s8CjalGvh/xE16oj82OE7+Pgfl13T0NzFIAZzfmP
 PGO3/37hS9GpeY7lwa9A4eHyIN9KSbyPw13fyZL1sPTse+P0W4q94xu4NRxwoK1aeBhd
 LL8jrOu51r8d/8MZIUhuY4UBqY1z0nRoD6YtqYv0ceu/QGhUC4juveufTC3OOhnzwdLo
 r2e3IvvYRSj5dLM0LixixN86TlTlKIvt4C0EfHHRzb9bOYplLFrWpxLcknntddPXrpaW
 XjYNmu/fDHfx6icPRxwCuQ3i8HGONKQoSOiJCrjJmYPBTHXRNoHYTpnHGnR72sc3g5kV
 lw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753826447; x=1754431247;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bf7MCgMW3rHEy3/8Boxp0Sj1cjXi7btiouj/QL5jI6g=;
 b=XEN9lDlwnYl/i1cGJeSR6O5SkAGDqEtLAfuyt93MuCZ942k9KGRqLHIe3tn8LFy06D
 mgbKFT6WuT1sm1Ft+0iph+AGcGwL1+NB61pcvZ28JfgJVM4ULH5CcLMesIqyQMiFyq/1
 H/1TU0sC0aUy/Pl7MnQxohjSp4Mc5gvBus2m6VwDwDNcUggnqwltHAMw4M/22MQG/xqM
 H3yWiwbhkGVXTafPj/w6zzvFqQJcZ36ikIhmmJy3/mO1U86NaEVcADmBw9nUjsXmmcgt
 ziV8tJ/1d31JlVIQiOyle5JhT68JTybocaAzam1lG5uPcaf8tss5AnZhQ5FRSuhzsnwi
 AlMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgzQblXRLoYMaLKKsJgmF7g1uf1M2LvMbPaZsB+b1GGwU6HXBrStmb+fHBV9WoXfAm4AjYgMqy@lists.freedesktop.org,
 AJvYcCVtCGqNuuk818xYadVd9WAVkjZpROXSWpR71U0OtDyM4fAOPW2bjdxOSuvdvGy09KnxI8ZQYAQAXUUj@lists.freedesktop.org,
 AJvYcCWRWjS+lD1jtWbTNl6hPv3w+krePGt47vmEKpk7omSy8lKrtI71Xq4taJJLzpb+q+tdo62mD2wWqCkBFJWo7A==@lists.freedesktop.org,
 AJvYcCWadayHuvqvIOMqThiks1FP1sLxk1iCxbeo0k6LZ2HN16b8xHxX9x1u3FJBQvo4q/T06fCMeGHFaJe/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKffuit3ZlP5qNGdd7+jEqkWt7qxm7Reso8/hNQ2g/fzB5ZWEF
 fSAvsuczEp62VwodaIMAwF0BczeHQtEwo69c+YymN5qViHKUAJlkTz5ULuruEOstfu9r20MgiOm
 vyFPVirEb5i05h2ueb/5J1Qrr4M0X9ao=
X-Gm-Gg: ASbGncvGU8BWtHkOH/EYxW+wX26deCm2iTmBGzrw+czNSvBr3m9vamyZCGM+UVVcNJ/
 0R7zghSqKSgV6sOcyisjJC0iS1d8F8GIJ7M8DJKulavpZTgHONzrGFcSJLSajgBEB2MznvDZPKN
 n8T3BUqI/lsk6tgZXME40ONJkzuY6wMNVG+osHcmDitCHRoK3ITYAanYdKU/ElNnxBzb2p9lPwW
 CokPw==
X-Google-Smtp-Source: AGHT+IHNQcrSkJ2HLeMBxvQ4Jv6I61m2VCJ8EIUFg+9bAEeqD9KX6+H+1UjiPC3MR4drzhvRBbsAP4dMFfchymbmwcc=
X-Received: by 2002:a05:690c:380b:b0:719:4dab:4322 with SMTP id
 00721157ae682-71a4665ad33mr18638917b3.22.1753826446723; Tue, 29 Jul 2025
 15:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-29-jim.cromie@gmail.com>
 <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
In-Reply-To: <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Tue, 29 Jul 2025 16:00:20 -0600
X-Gm-Features: Ac12FXyWVXGFelprKK3BcySWxLEORiXBVvTHcbIZRuOv6NNRJOot3b7GOZIJq9Y
Message-ID: <CAJfuBxw8X1w=ZkHaLbXELGt_r2Gkdzgw1FZb_tpqrRvHA7CMxA@mail.gmail.com>
Subject: Re: [PATCH v3 28/54] dyndbg: restore classmap protection when theres
 a controlling_param
To: Sean Paul <seanpaul@chromium.org>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
Content-Type: multipart/alternative; boundary="0000000000005acfd0063b188a75"
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

--0000000000005acfd0063b188a75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 8:47=E2=80=AFAM Sean Paul <seanpaul@chromium.org> w=
rote:

> On Thu, Apr 3, 2025 at 9:48=E2=80=AFAM Jim Cromie <jim.cromie@gmail.com> =
wrote:
> >
>
> \snip
>
> >
> > -static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> > -                                     const struct _ddebug_class_map
> *map,
> > -                                     const char *mod_name)
> > +static struct _ddebug_class_param *
> > +ddebug_get_classmap_kparam(const struct kernel_param *kp,
> > +                          const struct _ddebug_class_map *map)
> >  {
> >         struct _ddebug_class_param *dcp;
> >
> >         if (kp->ops !=3D &param_ops_dyndbg_classes)
> > -               return;
> > +               return false;
>
> Return type is struct _ddebug_class_param *, should this be NULL?
>
>
yes it should. thx.  will revise

>
>

--0000000000005acfd0063b188a75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 20,=
 2025 at 8:47=E2=80=AFAM Sean Paul &lt;<a href=3D"mailto:seanpaul@chromium.=
org">seanpaul@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Thu, Apr 3, 2025 at 9:48=E2=80=AFAM Jim Cromie=
 &lt;<a href=3D"mailto:jim.cromie@gmail.com" target=3D"_blank">jim.cromie@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
<br>
\snip<br>
<br>
&gt;<br>
&gt; -static void ddebug_match_apply_kparam(const struct kernel_param *kp,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct=
 _ddebug_class_map *map,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *=
mod_name)<br>
&gt; +static struct _ddebug_class_param *<br>
&gt; +ddebug_get_classmap_kparam(const struct kernel_param *kp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct _ddebug_class_map *map)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct _ddebug_class_param *dcp;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (kp-&gt;ops !=3D &amp;param_ops_dy=
ndbg_classes)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<=
br>
<br>
Return type is struct _ddebug_class_param *, should this be NULL?<br>
<br></blockquote><div><br></div><div>yes it should. thx.=C2=A0 will revise<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--0000000000005acfd0063b188a75--
