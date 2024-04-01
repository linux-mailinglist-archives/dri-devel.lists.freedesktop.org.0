Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E18936C6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 03:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6737E10ED94;
	Mon,  1 Apr 2024 01:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cNA3l4sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CDB10ED94
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 01:45:51 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-4affeacaff9so988600e0c.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 18:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711935950; x=1712540750; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EmX719rbFW/n7oUGe1sDUbtrCOBDKmsmOFv9z6L3ICI=;
 b=cNA3l4saq1xlzb04n6xyJRhGTqx1ubYtmyCunfLsiWZkbl4aIRb2MO5LrqmcbHZKy5
 CZTSgASaWMSnoW0i0mg5N03woxjTBcWAVVXPpTDc6go07YpYTqP6+t+nVUHIcPXIXtHl
 zCokjd4LV1Ow8J+tkhrSW7TeRhQsk6vIfigIcNo6VOonz9PVZNUS0QuhlwZD15uvgid8
 DMxdsMfWsHZVQjhGmV3RRqlMgFeMS7D3V7f9FL6DaWP25P8YNSVm4YrPQQlpTZrGzEP+
 vaxHcGdYE6ipdADsXAjyl3Rlu67fSQTd64WtDZGVXXAmlBwqKC9bqmTovLnzFxPU+4YT
 ZtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711935950; x=1712540750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EmX719rbFW/n7oUGe1sDUbtrCOBDKmsmOFv9z6L3ICI=;
 b=oqNI7W3sJcN4u2NkDOfuYwHjyIeNFOIWxqSKYKKVZFWze2vOfJFwtt4zO0devKMGGK
 XBYrjgXZ22mbcE/nKLO04H5LeoLDsPLQdfXiv63FyoC/9HVYavGFZjRnMfJ1zwaYQBP8
 sgsCUnDGdlZdX8C04a5kZ+zLJ4LFr0C4W961EDaKH0/4JcGdgwz46TF/lRfe1j77CYtw
 z7tmkY882Axud+Mw8xDWG1FcsTtIN2HoTiKBxk2k+9NDqiIlXzSFsp3xR+WcRbDkI8Wa
 y5iK5qF/DkIIbejr3H95GAypLcQPkUmMhmIYyKHan4Uh5EmGkiwuGk3mda7A09eUA4Ww
 ot8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvFITC/If0Y3F9aUaQrdIvj4yo6fLMw/3IfxqCoZ60ilutfv80yZ/t1te01QiDeB9ePUr+02Cxgo7NvjoMidTh7SOSt3xQpJ0MLn5FlnZK
X-Gm-Message-State: AOJu0YwX6mxOtcBw5q7X2Ym014MXAFOKr8dcaACDs5401Obi8/a0p1r9
 M6msW/nLdoEoK+YGwCX1FPZqaH8q5YaTY3shmI9VanPy0fet/mLkQj4nRU9OidIKggA9IZAqJJ+
 0zYLLIjO5bryOg0wHjMVPvYKawK0=
X-Google-Smtp-Source: AGHT+IEFFkyP+Qx4r/AFko7VilL7haMlAKmGo4aDSA0gIuGBpz/7+6o+21tDr4e1Cj+N1bGLMrS9I/3EXODkP6WWC6U=
X-Received: by 2002:a1f:e4c2:0:b0:4d4:eff:454 with SMTP id
 b185-20020a1fe4c2000000b004d40eff0454mr4541104vkh.1.1711935949760; 
 Sun, 31 Mar 2024 18:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240325033515.814-1-jammy_huang@aspeedtech.com>
 <c04ebd16-f0b0-45be-a831-fae8b50b7011@redhat.com>
 <5df1d391-7683-4d9c-accc-9b446d46a150@suse.de>
In-Reply-To: <5df1d391-7683-4d9c-accc-9b446d46a150@suse.de>
From: =?UTF-8?B?6buD56uL6YqY?= <orbit.huang@gmail.com>
Date: Mon, 1 Apr 2024 09:45:39 +0800
Message-ID: <CAOj9kT3JfE01xUqo1UyR4evbzMZU9xZ+CFfHeeiJGAG=hmJ=Wg@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Fix soft lockup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jammy Huang <jammy_huang@aspeedtech.com>, stable@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000029f3bc0614ff265d"
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

--00000000000029f3bc0614ff265d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas and Jocelyn,

What we do in ast_dp_set_on_off() is a handshake between host driver and
bmc-fw to confirm
the operation, on/off, is completed.

We use some scratch registers in bmc to handshake with host. This handshake
only work if
BMC's scu-lock is opened. If scu-lock is opened too late, then it could
lead to this issue.

Best regards
Jammy

Thomas Zimmermann <tzimmermann@suse.de> =E6=96=BC 2024=E5=B9=B43=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:28=E5=AF=AB=E9=81=93=EF=BC=
=9A

> Hi
>
> Am 27.03.24 um 09:53 schrieb Jocelyn Falempe:
> > Hi,
> >
> > Thanks for your patch.
> > I'm wondering how you can trigger this infinite loop ?
>
> Yeah, a bit more context for this bug would be welcome. It's hard to
> judge the fix without.
>
> Best regards
> Thomas
>
> >
> > Also this looks like a simple fix, that can be easily backported, so
> > I'm adding stable in Cc.
> >
> > If Thomas has no objections, I can push it to drm-misc-fixes.
> >
> > Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> >
>
>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>

--00000000000029f3bc0614ff265d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p>Hi Thomas and Jocelyn,</p>
<p>What we do in ast_dp_set_on_off() is a handshake between host driver and=
 bmc-fw to confirm<br>
 the operation, on/off, is completed.<br>
</p>
<p>We use some scratch registers in bmc to handshake with host. This handsh=
ake only work if<br>
BMC&#39;s scu-lock is opened. If scu-lock is opened too late, then it could=
 lead to this issue.<br>
</p>
<p>Best regards<br>
Jammy<br>
</p></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de">tzimmerman=
n@suse.de</a>&gt; =E6=96=BC 2024=E5=B9=B43=E6=9C=8828=E6=97=A5 =E9=80=B1=E5=
=9B=9B =E4=B8=8A=E5=8D=884:28=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi<br>
<br>
Am 27.03.24 um 09:53 schrieb Jocelyn Falempe:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Thanks for your patch.<br>
&gt; I&#39;m wondering how you can trigger this infinite loop ?<br>
<br>
Yeah, a bit more context for this bug would be welcome. It&#39;s hard to <b=
r>
judge the fix without.<br>
<br>
Best regards<br>
Thomas<br>
<br>
&gt;<br>
&gt; Also this looks like a simple fix, that can be easily backported, so <=
br>
&gt; I&#39;m adding stable in Cc.<br>
&gt;<br>
&gt; If Thomas has no objections, I can push it to drm-misc-fixes.<br>
&gt;<br>
&gt; Reviewed-by: Jocelyn Falempe &lt;<a href=3D"mailto:jfalempe@redhat.com=
" target=3D"_blank">jfalempe@redhat.com</a>&gt;<br>
&gt;<br>
<br>
<br>
<br>
-- <br>
--<br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Frankenstrasse 146, 90461 Nuernberg, Germany<br>
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman<br>
HRB 36809 (AG Nuernberg)<br>
<br>
</blockquote></div></div>

--00000000000029f3bc0614ff265d--
