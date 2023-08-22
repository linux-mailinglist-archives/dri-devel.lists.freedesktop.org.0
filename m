Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC2784333
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 16:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEC110E375;
	Tue, 22 Aug 2023 14:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9AA10E375
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 14:06:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31aeedbb264so2743008f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692713183; x=1693317983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I7VmeH7rxJqeITamAF4N8qLna0Bq4ZEZkkAI0yGVYdg=;
 b=NDmPfZR3b08sHgbpRAwNFg/TP8dQceggbjkCcFbc98Gxy48zyYPatm8lte1seHzOkP
 kVYgRaa5svvCRsONw67EWdOpebmHTl3fe4KRlniBRkjcGhpDu803G44030tAOfRsg/MA
 x/iSdf9Cm2t/JiIjqipcB+UD3PmECHPsvX2lTiYns9SljwH+MJqhpzmSPG7WvmzbLOED
 83KCuqYcAL3N6aNYZX4QkUH5wCHT7dFQLhOLHQ9+gL18nodzYCcQTXyMMQlF+IjSVUmn
 LWrPQEBDw8hZ47smkBgxK0SybNVfqA0z3yxS5QcBZkCEk3e+j6xPfLk7kMGv1xi7AX/T
 9IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692713183; x=1693317983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I7VmeH7rxJqeITamAF4N8qLna0Bq4ZEZkkAI0yGVYdg=;
 b=YpCqKlDhgoPLN7HlE0CzSQFqmJHN1HMQaGES26n4L2pQcPgO6tE0qNkylTxgEDwVF9
 R4TZ1lOWYh8xL+t7GGJHWz3vCeOmutTfHQvFPHyBeK6EhTIJF7DVdx1DjUYgbwLCP9ce
 QKiNrX+WfkVzKOcifSfo7B4EK7R3QGVHXhPIf1w+oK+Weu42Jgac+17sArDBcevwpS25
 qHQvTGkCJ134GtMcXmUX3tEcOPoBZtPM+0WhXouSfofnYdgo3n+r9HDT8qP0A9zTicoS
 kn8ZGnbQZf7H3NBEWoWFHYIH62CwdB3sfV7S9xlsIfBnSzifQUCXjC52mPWS2YwTvNfV
 v7tw==
X-Gm-Message-State: AOJu0Yyz0wIwNlzqIJhy16ynBnNqjdkjf7ZS3wANcqA7OwJDNm4oBgws
 pVFPyeXiWq3rq5L65nFB7sFWlxF/r/max16tY+NgQXVtBcs=
X-Google-Smtp-Source: AGHT+IGiv4mecy+5cZ8CuUaDXdC0niGWKR8+F2nFs6BWn8wOuReeh0PoP8GB2TlEnmLkRC0V0Zu2F8gwgZr3p/E6mmE=
X-Received: by 2002:a5d:530a:0:b0:317:6edb:6138 with SMTP id
 e10-20020a5d530a000000b003176edb6138mr8253117wrv.62.1692713182385; Tue, 22
 Aug 2023 07:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANgPUHw7yHBXumXYMAG0Z4Xn6Pb1BNvU7saw=_gQ6m7Xdc-Pbg@mail.gmail.com>
 <874jkr6y8w.fsf@intel.com>
In-Reply-To: <874jkr6y8w.fsf@intel.com>
From: Sharique Mohammad <sharq0406@gmail.com>
Date: Tue, 22 Aug 2023 16:06:11 +0200
Message-ID: <CANgPUHwbtKpqJ5KUhF+0K4pdRmxAgCjPAsbnFj3ZEisb-509ew@mail.gmail.com>
Subject: Re: TODO list task: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000f15bd70603837ff4"
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
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f15bd70603837ff4
Content-Type: text/plain; charset="UTF-8"

Ok. So it is already completed.
I have to find something else...

Thanks and regards,
Sharique

Am Di., 22. Aug. 2023 um 14:46 Uhr schrieb Jani Nikula <
jani.nikula@linux.intel.com>:

> On Tue, 22 Aug 2023, Sharq Mohammad <sharq0406@gmail.com> wrote:
> > Hello All,
> >
> > I am a usual kernel developer, and wanted to contribute to the open
> source.
> > I saw a small TODO list in the DRM graphics subsystem, with some tasks.
> > So, just wanted to ask, is anyone working on the task:
> > *Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi*
> >
> > Its on the TODO list.
>
> Yeah, I've got branch
>
>
> https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-is-hdmi-has-audio
>
> BR,
> Jani.
>
>
> >
> > Thanks and regards,
> > Sharique
>
> --
> Jani Nikula, Intel Open Source Graphics Center
>

--000000000000f15bd70603837ff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ok. So it is already completed.</div><div>I have to f=
ind something else...</div><div><br></div><div>Thanks and regards,</div><di=
v>Sharique<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Am Di., 22. Aug. 2023 um 14:46=C2=A0Uhr schrieb Jani Ni=
kula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com">jani.nikula@linux.i=
ntel.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Tue, 22 Aug 2023, Sharq Mohammad &lt;<a href=3D"mailto:sharq0406@gmail=
.com" target=3D"_blank">sharq0406@gmail.com</a>&gt; wrote:<br>
&gt; Hello All,<br>
&gt;<br>
&gt; I am a usual kernel developer, and wanted to contribute to the open so=
urce.<br>
&gt; I saw a small TODO list in the DRM graphics subsystem, with some tasks=
.<br>
&gt; So, just wanted to ask, is anyone working on the task:<br>
&gt; *Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi*<br>
&gt;<br>
&gt; Its on the TODO list.<br>
<br>
Yeah, I&#39;ve got branch<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-is-=
hdmi-has-audio" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedes=
ktop.org/jani/linux/-/commits/drm-edid-is-hdmi-has-audio</a><br>
<br>
BR,<br>
Jani.<br>
<br>
<br>
&gt;<br>
&gt; Thanks and regards,<br>
&gt; Sharique<br>
<br>
-- <br>
Jani Nikula, Intel Open Source Graphics Center<br>
</blockquote></div>

--000000000000f15bd70603837ff4--
