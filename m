Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOu/HZZ0fGkmNAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD08B8BA1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364D10E976;
	Fri, 30 Jan 2026 09:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S22tIEZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2C710E31B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 11:11:48 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-649278a69c5so862059d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 03:11:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769685106; cv=none;
 d=google.com; s=arc-20240605;
 b=PXxhl41F2EjUvzXlC5ebWzm4hJiK1vlKTt+ibKc32sN1G0T0Od6JQa+3ZP6Y7tUU8T
 xB9YJwPRasq3MjNWDbqNzMYY704Sgk2t5eBti6HSnFsmR4UnxKEilSqnB+GtYQFWS8qu
 AlK4a3B2Bi7Rnd25ju2jLK2a4WQs5BMRgcNPDqIfrVQjVZvTF1PaSqr2Z9z+dvoBVcY4
 44OLT0obNfWaUGz9puZuC1RmXLiwSqHrGnd6uDDcJ+LKLM/bAPrbLeWxVz+kYsYD62wM
 c+xeOtHcTFAxKHeA4Q/EeuXi037SpDylCHCOCWO0sG2k0cl31hBk1Ge1TBfrbGuGsUPS
 1TTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=A2VVN3PX/0dR6iudxlJIzv+M6Jlcz0XUviUB4ad/T9A=;
 fh=nu27mjZTEhZGvSxl0QJIc/O9udVKpzh8mqFjwCTBB4U=;
 b=KA7e7BC4TAni1K2MRC3SoviKrPTvbZkB76JwJ2lFKQ1PiJRjTQIqnkg+GYYDG8ATNx
 yD0PDOyM0nNbSV6HbCvjKG7yCE47+96VJ/DCdnDwkB7KJK6GIUM6SEfaoUabzvfYFcYH
 504Dz0FbELrW5O+HLP4RhiRoaP1jv8L5xKsQUexNp0jHTZ3x1zsU+Ew3lhCPOHmA9uem
 ySECTsWpYzbpxIFTflMUmzScVjYEo3tFqa0j72FsjfLplTnBdDZ52NRRkosoy2N+F6CI
 M4w8yPstdpy2RS8+f3MGo5Eo5Rz2LRQV6KRps4v70CSaQoDT5/ofbqnqZzc93TxOD3H5
 +CbA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769685106; x=1770289906; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A2VVN3PX/0dR6iudxlJIzv+M6Jlcz0XUviUB4ad/T9A=;
 b=S22tIEZXP5qjW/j9eaXbVzPZtQtIAppn53tOzZs1kWkGPMzpFDr5gmkoKUwLc1zjJz
 Jy4kz2ofBrRdsK7RH6fQcxeqj80H0Up5Usvt90CXyT31crqJlu0N6pcthgJxokkHVgKr
 71UkBZej5fXlzztPQqc8ZERyXhT8LQl4UR2trzK29Ri8iAQPDWCsen7phQU62C8FmGHn
 RAqgBwHqlLam0awzuk+I4x5eqsPWU3/aZ7FGrqFVu9Rnje53VjnJAWOSU8W362pcrs5H
 ORHV7P9AD4n3l39OJMRwlpnsSJtTExiq2XxwT1RUzDb25nav4261vjlRiw4wxp3RQv9p
 TNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769685106; x=1770289906;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2VVN3PX/0dR6iudxlJIzv+M6Jlcz0XUviUB4ad/T9A=;
 b=NiXifsoqWnceCuo+olC1sAhQEvWofbHhd2cw+Vsd+1eXOM0E4jChfM7h9vrA9yAZgL
 oyN2Xm5/xSpZi06rDkdCzPNW4DKSDi+CHivftZkPG8VK8GKisU8p8a2b5NDmgQ6tMksn
 5l0jWR+caOMzHdxk39GDccg8p+Tckc7dOljPRCYs8OqFwTV8S/WR1AZ0oNb47GEm3dnY
 i/gJyiR7qONwyuUx1Nwml0kAgJr+pl2fmabY99J2iDhloG/wHPoJvrTX3ShdNvBiS9P3
 +hveCpgZ75pyrGBK8NNoU9fRMosEW3qCVQKrClMQL+XtupmDaPMYu7/7Mk2SqMSGfOex
 RW1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeD8maOZ/KRYDEfo2DN2EyGmojFVj+Jmne520QNCUymmXwdfy0YMrIos//n5WQnHB5MVTnm4jGMaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn0s8ZahB6+NCtTK4aEzUpbetO/MwQshUZ9e20XQTlJzk8e+kV
 3424HA70YQUQum1Y28IA0zaqkrOb3lptfBYcFf+NGq+HGlOfcRLXq7+TiFxK/SEL/nySItbWdV0
 FQh1/NJIwaeSU268ZW5AJTulgxa3nTho=
X-Gm-Gg: AZuq6aJeTaGofRsQzDt8A9Bxgmu8LlQJkE5qADz69Eurncxktmzo+Vz1jFclBQicFFn
 ezgr92xLxIuJjPCkkQvS5F/JvZkoS/nHCIEBVCRhd88Ey+Ob07jy3tBmtW91raTCzH7E99HhtCc
 IBdBn5xt9GGFs3N2HEXW8hY6UOA/ATYwv7QcJDn++W0QUcVf5X+M4MGRwgjsT0GQGY5Gu/U6CyA
 dWxLSEzAG8koG9FEsTllISfOHPBUUAKcoDmzMn86VWefUV9CT03ShuiBzQhXRwwwB/qjs89
X-Received: by 2002:a53:d00a:0:b0:649:58c0:e410 with SMTP id
 956f58d0204a3-6498fc6e589mr5146867d50.94.1769685106165; Thu, 29 Jan 2026
 03:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20260128203938.962414-1-csshin9928@gmail.com>
 <aXr-RhUXwIvMHYZI@stanley.mountain>
 <aXs9lvhF9MIQASv0@smile.fi.intel.com>
In-Reply-To: <aXs9lvhF9MIQASv0@smile.fi.intel.com>
From: =?UTF-8?B?7Iug7LCs7IiY?= <csshin9928@gmail.com>
Date: Thu, 29 Jan 2026 20:11:35 +0900
X-Gm-Features: AZwV_QhVBhp-qzjcTJOnkd-InxJaA4isVK_xQf_0LB0s9OkdJnML2sAQmbs_xXQ
Message-ID: <CALWzWLHrV6FUQzOibLnf6QD1+NmfwKqeSnkzPaFg39c0rZZ2mA@mail.gmail.com>
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, andy@kernel.org,
 gregkh@linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Content-Type: multipart/alternative; boundary="0000000000001e0ba6064984ec66"
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:dan.carpenter@linaro.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CFD08B8BA1
X-Rspamd-Action: no action

--0000000000001e0ba6064984ec66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the explanation.

I understand the issue now, and I'd like to withdraw this patch.
Sorry for the confusion, and thank you for taking the time to review it.

Best regards,
ChanSoo Shin

On Thu, Jan 29, 2026 at 7:59=E2=80=AFPM Andy Shevchenko <andriy.shevchenko@=
intel.com>
wrote:

> On Thu, Jan 29, 2026 at 09:29:26AM +0300, Dan Carpenter wrote:
> > On Thu, Jan 29, 2026 at 05:39:38AM +0900, ChanSoo Shin wrote:
> > > Instead of marking the entire display as dirty, calculate the start
> > > and end rows based on the damage offset and length and only mark the
> > > affected rows dirty. This reduces unnecessary full framebuffer update=
s
> > > for partial writes.
> > >
> > > Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> > > ---
> >
> > TL/DR:  I suck as a reviewer so I would be nervous to apply this
> > without testing.  Andy is an expert here and we trust him so if he's
> > okay with it then great.  Or if some other expert could sign off, but
> > I don't know enough to sign off myself.
>
> The rule of thumb for _this_ driver (or set of drivers under FBTFT) is
> that: we are in maintenance mode and we only accept bugfixes or treewide
> changes. The rest can be accepted but unlikely. Either way, we really
> want to see this (kind of changes) being tested on real HW. It's not as
> simple as renaming variable 'i' to 'j'.
>
> > The problem for me is how do I review something like this?  Staging
> > is a grab bag of different modules and I'm not an expert in any of
> > the subsystems.  Normally, it's easy to review staging patches
> > because they are clean up work which does change how the code works
> > so I just look for unintentional side effects.
> >
> > It's trickier to review a patch like this which changes runtime.  If
> > it were fixing a bug, then I could verify the bug is real and say
> > well, "Maybe the fix is wrong, but we were going to corrupt memory
> > anyway, so the worst case is that it is as bad as before.  It can't
> > make the problem worse."
> >
> > This is your first kernel patch.  You don't work for a company that
> > makes the hardware.  You said earlier in a private email that this
> > hasn't been tested.
>
> Unfortunately it is not the best driver to go with this. At some point I
> might
> be able to test this when I setup my fbtft minilab at home, I have a few
> I=E6=B6=8E,
> SPI, and parallel panels.
>
> > The patch looks reasonable to me, but it also looks simple.  If it
> > were that easy why didn't the original author do it?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

--0000000000001e0ba6064984ec66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Thanks for the explanatio=
n.</p><p class=3D"gmail-isSelectedEnd">I understand the issue now, and I&#3=
9;d like to withdraw this patch.<br>Sorry for the confusion, and thank you =
for taking the time to review it.</p><p>Best regards,<br>ChanSoo Shin</p></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Jan 29, 2026 at 7:59=E2=80=AFPM Andy Shevchenko=
 &lt;<a href=3D"mailto:andriy.shevchenko@intel.com">andriy.shevchenko@intel=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Thu, Jan 29, 2026 at 09:29:26AM +0300, Dan Carpenter wrote:<br>
&gt; On Thu, Jan 29, 2026 at 05:39:38AM +0900, ChanSoo Shin wrote:<br>
&gt; &gt; Instead of marking the entire display as dirty, calculate the sta=
rt<br>
&gt; &gt; and end rows based on the damage offset and length and only mark =
the<br>
&gt; &gt; affected rows dirty. This reduces unnecessary full framebuffer up=
dates<br>
&gt; &gt; for partial writes.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: ChanSoo Shin &lt;<a href=3D"mailto:csshin9928@gmai=
l.com" target=3D"_blank">csshin9928@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; <br>
&gt; TL/DR:=C2=A0 I suck as a reviewer so I would be nervous to apply this<=
br>
&gt; without testing.=C2=A0 Andy is an expert here and we trust him so if h=
e&#39;s<br>
&gt; okay with it then great.=C2=A0 Or if some other expert could sign off,=
 but<br>
&gt; I don&#39;t know enough to sign off myself.<br>
<br>
The rule of thumb for _this_ driver (or set of drivers under FBTFT) is<br>
that: we are in maintenance mode and we only accept bugfixes or treewide<br=
>
changes. The rest can be accepted but unlikely. Either way, we really<br>
want to see this (kind of changes) being tested on real HW. It&#39;s not as=
<br>
simple as renaming variable &#39;i&#39; to &#39;j&#39;.<br>
<br>
&gt; The problem for me is how do I review something like this?=C2=A0 Stagi=
ng<br>
&gt; is a grab bag of different modules and I&#39;m not an expert in any of=
<br>
&gt; the subsystems.=C2=A0 Normally, it&#39;s easy to review staging patche=
s<br>
&gt; because they are clean up work which does change how the code works<br=
>
&gt; so I just look for unintentional side effects.<br>
&gt; <br>
&gt; It&#39;s trickier to review a patch like this which changes runtime.=
=C2=A0 If<br>
&gt; it were fixing a bug, then I could verify the bug is real and say<br>
&gt; well, &quot;Maybe the fix is wrong, but we were going to corrupt memor=
y<br>
&gt; anyway, so the worst case is that it is as bad as before.=C2=A0 It can=
&#39;t<br>
&gt; make the problem worse.&quot;<br>
&gt; <br>
&gt; This is your first kernel patch.=C2=A0 You don&#39;t work for a compan=
y that<br>
&gt; makes the hardware.=C2=A0 You said earlier in a private email that thi=
s<br>
&gt; hasn&#39;t been tested.<br>
<br>
Unfortunately it is not the best driver to go with this. At some point I mi=
ght<br>
be able to test this when I setup my fbtft minilab at home, I have a few I=
=E6=B6=8E,<br>
SPI, and parallel panels.<br>
<br>
&gt; The patch looks reasonable to me, but it also looks simple.=C2=A0 If i=
t<br>
&gt; were that easy why didn&#39;t the original author do it?<br>
<br>
-- <br>
With Best Regards,<br>
Andy Shevchenko<br>
<br>
<br>
</blockquote></div>

--0000000000001e0ba6064984ec66--
