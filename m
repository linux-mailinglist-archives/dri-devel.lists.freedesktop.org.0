Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E7BB28D7
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A5310E77B;
	Thu,  2 Oct 2025 05:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KkM0tqci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF89F10E028
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 03:01:04 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-27eceb38eb1so4951455ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 20:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759374064; x=1759978864; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=exMEaUD4l+BfZXAA7jZmkt7d2y/BQDdogniSkQRDRkA=;
 b=KkM0tqci0e4/C5Hkd7gwD7q7FdmgFdJdHAOXlMRTAdZD4k1N6q9zNCWNDpzdKep5Ym
 OnumVeDJKhBpRuyaoCKwMIwLuOeAEpLcdvm/eH+mDuxxRZmKYq5JqOvqpUZ7R6f3zqW2
 I6Az1JWQ8S54+BUvio7lpEZO+uidiaVw/No2lMxGwHOwGH9wdV2Wxt9tdcb4EN0QMoIS
 HsZOHtwRtUeDVzCSF6jU8/D5iVrBK805j5/u1zetlMtaJ9WZH1+0KPrGao3eS/fCx5/y
 aw9wFr2gX5pw9BiY5lsX1i5otC4FS8o8/I/vlh+E30Hk2qDCoqaNWAOyij4cJoejSn+O
 qpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759374064; x=1759978864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=exMEaUD4l+BfZXAA7jZmkt7d2y/BQDdogniSkQRDRkA=;
 b=jOUTY2JWqMqjy0luMKpfO49+Nfup71xtNP+BhDEPFURLBAJj3dWM917djNkmEkzVbH
 0rnQZHW1z0HcM+tMp/1TaJ1wD8vXGusrQ1iWoMKdQ1UPbR8P18Ws9cAlj3trNucj0wGm
 xcFEkEqjFW0EVynkHoVZOTFoh7Cd/HPr0/jDApQdxgm77zEipKQJHJLIBxrAk3lqiYp3
 Si2UGzdvhUpd0PPMUE+DnriAiFeMtC0DKdAqGzzyWNgabUx22ll1T141idWVcFOae42W
 5waVuRyQDP4SgcIzrAvAlzcTo0cgKe7KUa7EqHc8Hy9eY9Ynbl/YY9plFgM0DQXG//5d
 zS2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK7UYnxqj4E8KBGsWw7XgzVQUc+TEt1mahsseUaWFZETMfXyi3fRmlKWxzXQwyd3Gx8DIr4CqGTfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1XfWWuEaglO5YZSlpLwwFC66ftdgGAGVEv1zF6FsVhy2oFdnL
 5lO+50cXaXXByRoNMFWSU/0suOaI6Euluoqfmeb+lPdzaNltn8oWfZ8DNLSYZdAG3cs8fbq4ulZ
 WjSaY7QO8dhfB83hmjKC5BUJHCKeNZEc=
X-Gm-Gg: ASbGncurPe2GFQeFbgwUwr8tSwo3/lrVAUdDc5Wa+yU+Xldef36WytIDKN+QwS/GZFX
 tHm2OEY4Fsk459xFOaIPlWyRofBmJf7ds9jGGHdIPEedgRIp5kDj1a7n4JDU9hKvsvI6ATNNG8L
 IsfOEgaoL5hCzSOpUO3HTSxGwEYHNkq6/0QvNeVxCrQyt/eWgxU/x6g5MQwrv25CiMOA7p6UPCE
 y8ge9Dbnjr3ZPx67XM/lKI32DM1Pzd5Ue/4UQFsUwTJvAY0btd6tCKdtTHAR80=
X-Google-Smtp-Source: AGHT+IGZ3EOZB14q936Cor5TaBjud9pfnn0HKm1BJInR8R+8rd2tgzPJOVzUDnHURwBawHPOtv7LX55GAGyZDVotQIA=
X-Received: by 2002:a17:903:11c7:b0:283:c950:a76f with SMTP id
 d9443c01a7336-28e7f318638mr65897665ad.43.1759374064294; Wed, 01 Oct 2025
 20:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251001033212.25423-1-chintanlike@gmail.com>
 <861c82b3-541b-4746-a5dd-88c614e92b16@suse.de>
In-Reply-To: <861c82b3-541b-4746-a5dd-88c614e92b16@suse.de>
From: Chintan Patel <chintanlike@gmail.com>
Date: Wed, 1 Oct 2025 20:00:53 -0700
X-Gm-Features: AS18NWASXZKjtLSRCMZ8o1RuoHLLGjAbX_bPCpevnExxfiKTHkJ3kh8-f2Xy5ng
Message-ID: <CAAL9DyBTAVQj87fTot_FSCHQEV1W2L1ADYem1VBB2j2F5-yiAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vblank: downgrade vblank wait timeout from WARN to
 debug
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Content-Type: multipart/alternative; boundary="0000000000002123ce0640243232"
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:07 +0000
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

--0000000000002123ce0640243232
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The comment is not necessary. The commit description gives a good rational.
>
> > +             drm_dbg_kms(dev, "WAIT_VBLANK: timeout crtc=3D%d, last=3D=
%llu,
> curr=3D%llu\n",
> > +                     pipe, last, curr);
> > +     } else {
> > +             drm_dbg_kms(dev, "WAIT_VBLANK: completed crtc=3D%d,
> last=3D%llu, curr=3D%llu\n",
> > +                     pipe, last, curr);
> > +             }
>
> Rather drop the else branch.
>
> Best regards
> Thomas
>
> >
> >       drm_vblank_put(dev, pipe);
> >   }
>
> Hi Thomas,
>
> Thanks a lot for your review and suggestions.  I am just starting out her=
e.
> I=E2=80=99ve sent a v2 addressing your comments.
>
> Best regards,
> Chintan
>
>
>
>

--0000000000002123ce0640243232
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><br><div class=3D"gmail_quo=
te gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
The comment is not necessary. The commit description gives a good rational.=
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(dev, &quo=
t;WAIT_VBLANK: timeout crtc=3D%d, last=3D%llu, curr=3D%llu\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pipe, last, curr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(dev, &quo=
t;WAIT_VBLANK: completed crtc=3D%d, last=3D%llu, curr=3D%llu\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pipe, last, curr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Rather drop the else branch.<br>
<br>
Best regards<br>
Thomas<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_vblank_put(dev, pipe);<br>
&gt;=C2=A0 =C2=A0}<br><br>Hi Thomas,<br><br>Thanks a lot for your review an=
d suggestions.=C2=A0 I am just starting out here.<br>I=E2=80=99ve sent a v2=
 addressing your comments.<br><br>Best regards, =C2=A0<br>Chintan<br><br><b=
r>
<br>
</blockquote></div></div>

--0000000000002123ce0640243232--
