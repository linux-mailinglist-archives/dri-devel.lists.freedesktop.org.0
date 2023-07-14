Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A9D754083
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC07E10E8C9;
	Fri, 14 Jul 2023 17:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A230510E8C5;
 Fri, 14 Jul 2023 17:35:05 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7918b56b1e1so778270241.2; 
 Fri, 14 Jul 2023 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689356103; x=1691948103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OV2Ug93Gav+8T58ju3y8+5YHTN9dRtivqYz5Rn6HN1A=;
 b=Sm9T+5FUWy9zTWEzVG78o87Iy6UsmlLRmNJgtucTulyYns58ZoWCv8w970rl1/Veyk
 pQ4NLkLFyNSd13q3i3b45TJraXrG9xSh4AjYUF10lBciIC0w+xExyhuyeBXs+6fxG/vo
 hA3bB7vFfEQXnyPAT5lqs1JvkIHQhxS3aGw61j59s3DkT9E4BwGeZksq99GQ7reN7UH/
 0Ah30FOruU1Nll2XF+a8TGNd1gxd043C00oaHodwCqdDUqYB8ygGI5J3wLNW85t+ZfoF
 yl0PNvQhLOjs3oIeysJjAamBdZm04eyfNwI3ESXzlXRzPT/gVBriJqYVRjq31guxDrxf
 Wvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356103; x=1691948103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OV2Ug93Gav+8T58ju3y8+5YHTN9dRtivqYz5Rn6HN1A=;
 b=H5Upze9/xJcZX4lp9JMJaCnOyB1HkqqHAxT/sjZ7G6N74++NJidtk4BnunTFGHmjmb
 5cSnmj2H2Iu/y50c+EJV9Y2iZf8r5KFDgZn8zmvjCKPNn0RPqJNRc2s2nmSDk2FL0CDI
 FxfI/M1wUvaYP4actSah3VnNbg38mV+YH6zBpGTmnIsSZHgyCStWf63tYcpyXm8dc/Lk
 A6tnFfbcFfAouwrzDzgHNomGMFPKk/UUdU09HvodpMJ/PSS+kOAz25z1FjAThR5phSKZ
 n6y+5377W7caEepvRMa/KJAuU3mgoU1Um4GQjW+qhNoBVPv3yS7+ll0spS/j17vrpMIY
 DAow==
X-Gm-Message-State: ABy/qLZX2Cjtb+UGRlbTHh7zzdL7GvZOf+938FpBuWI1llQJD5JR4Sd7
 LhnTC6U7SYX9DF1knP5Ktg90s8xIsOb7Q29MxX2BfCl/
X-Google-Smtp-Source: APBJJlHPWnkuzIUxdR+EPWCIw+Tcbf5bVSlQ7Yephhjpo0reZQAZ9ifJDHW1WXS2A1nan9Wfq45XF7N2gMqGphOO4CM=
X-Received: by 2002:a67:f1c7:0:b0:443:895d:1b53 with SMTP id
 v7-20020a67f1c7000000b00443895d1b53mr3445086vsm.10.1689356103255; Fri, 14 Jul
 2023 10:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230713163626.31338-1-jim.cromie@gmail.com>
 <20230713163626.31338-22-jim.cromie@gmail.com>
 <76995421-a529-ac25-c306-2e4ac2844602@infradead.org>
In-Reply-To: <76995421-a529-ac25-c306-2e4ac2844602@infradead.org>
From: jim.cromie@gmail.com
Date: Fri, 14 Jul 2023 11:34:37 -0600
Message-ID: <CAJfuBxyUoVJU13cVxtp01PLfQ1v3PZVWD9vLLR1y+Fiz5Xd66A@mail.gmail.com>
Subject: Re: [PATCH v4 21/21] dyndbg-doc: add classmap info to howto
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 1:13=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 7/13/23 09:36, Jim Cromie wrote:
> > Add some basic info on classmap usage and api
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  .../admin-guide/dynamic-debug-howto.rst       | 64 ++++++++++++++++++-
> >  1 file changed, 63 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index 8dc668cc1216..878750ce8c1d 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
>
> > @@ -374,3 +373,66 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``=
.
> >  For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format stri=
ng is
> >  its ``prefix_str`` argument, if it is constant string; or ``hexdump``
> >  in case ``prefix_str`` is built dynamically.
> > +
> > +Dynamic Debug classmaps
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Dyndbg generally selects *prdbg* callsites using structural info:
> > +module, file, function, line.  Using classmaps, user modules can
> > +organize/select pr_debug()s as they like.
> > +
> > +- classes coordinates/spans multiple modules
> > +- complements the mod,file,func attrs
> > +- keeps pr_debug's 0-off-cost JUMP_LABEL goodness
> > +- isolates from other class'd and un-class'd pr_debugs()
> > +  (one doesnt mix 2 clients bank accounts)
>
>           doesn't
>


thanks Randy,
got this, and the rest.
