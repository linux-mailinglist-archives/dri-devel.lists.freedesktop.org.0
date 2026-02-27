Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D3yNUxToWkfsAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:18:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513FF1B4617
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33A10EA56;
	Fri, 27 Feb 2026 08:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WkaOVDQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0859D10EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:28:04 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b8fbb24a9a9so427437466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772166483; cv=none;
 d=google.com; s=arc-20240605;
 b=fc/56Oo5Ew+B9jrFqMLxO1dTgfFTDefAXMz9M2jISYD2JWaWdZWmiLM+fUH5meTbRg
 amzBsNKfYeTxZP6vS9DuVtzkGLKuTjuqp/gama/sQPPPipdTuG1e1vI33nSY0t4P71ij
 Ek1Zzd5WFkeLk1sc4GWPz+i7r0IanjG8+urDVRoRDT6spilc2x+l5i2w7aeiSdxgB+hl
 sc6CFLE4CrbmyLrjuMqL8XE+jI/d0CzSLrYzvyWCaL57PBMDv/F2Y5RmXC+7V6tWFh6h
 zdYTUxwQOJjcB67PIwk0VjrP2ghKttWMx9q0T5pW36N9D4Wn/42ysIxOBlklcWgQHs1v
 baRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hR4Vjagazra3UsOkJ8rvojK5VuWb4DUnKeVrzjgBuTw=;
 fh=6PS1MO3d8gkqSedoSVbwWXzoeQYEQEyg+2LsHsd0ZiE=;
 b=Eq8Uu5xSD+yMdPP8I3ivuQGiIjmO4AtCgqqpIOKIzLfbe7Y4nsOBXYBWtk56eNeZSZ
 OQ/czUpVF7eF6MnxIA72W3uGYHcxD/d3QU9wbuykXSGV1Zdrdbcvn9Xc+QMnZuVKeQh4
 2DsjaEqMlbHNZsncjVSILlRHMwlyEkBLPZrgWJ2OVjKi9jAe4Rl2GrosREFo1Ur8w5ZC
 9Tw5TZOu426bLmHf0zcW++tUlFlOVP7rJB0V2MfgxicgSaq6AkHTXVpVNeEqWIN3KuSB
 VnLUB4Wy8dOM010ACdTnnNxkvNeejEOTltAcumm+b39O68pYpVuMxu+fbsefhR9l5XZX
 VVZA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772166483; x=1772771283; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hR4Vjagazra3UsOkJ8rvojK5VuWb4DUnKeVrzjgBuTw=;
 b=WkaOVDQack3b0RjjnaNRq1GcAhXLgtOCN+Utj2ikAlxnoewT4e+7wuqC/CbhEYbk2Y
 +0/QhyZQH8t4EXUWBOJU6g/tOXgXMRsTtVjj9eibaN7ArT31r8VCtyqy9wNEVK0Pbxo8
 O0ei51PkKdtCOsFhtKACjao0xIHM+pG6MPOZ6MpFj+28qN235G2pT7ucYIldqsgbaXk9
 VSbIDCZ0hQcXxlMXLl/MW6U+ZoZMYe/IR8d0S/iPwVDxjhbpDEEcui28r+tqhn/ohDkn
 OvQk2V0A21bzs+YZXooKmmfJWTADAVOu6MN7eKRpymWo48iaQLEUiOYH0xAGvx+qJdR5
 OBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772166483; x=1772771283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hR4Vjagazra3UsOkJ8rvojK5VuWb4DUnKeVrzjgBuTw=;
 b=qGiYVkD+CmQUToRmNoQynVefQJ+KcNl+fTEYWq04Z68wE+ndax0dWyRGGeGezwM7Hb
 mslbZ8vRwsQKEnNbb6zqpRdeDMxIqOLskY2WR2y89TjwRiajryERnzDqTehLBw+Vb+Sd
 pcd8SjeadLa2G8ynNb2eRzyAqvMMdm+3Ncm6IYAFkA0EiTrSNRxxLhiwRJ6dMgHArqIn
 jbBkbl0+V4YW3FHnZGml1RhZLgnPQcHehi7DhlNYDTQQc6Qsi/iyZZHitssBBN8liski
 a1mSRzoa09i+Zbii0BV66eJlPRe4IcALvllYiqUANsirv1oo1QKUUMVN8oYAANIittnq
 cJ2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5w28gjHC5aL0yzGC+3gSy3sq6EpHXKDJABeOemfAptRn5hgA9cyBokPdtRkkBg02c3VQjcU4qHgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyin1+8U/gBDCMaaXsHUlLGzZKmYJXAKFKKQk1duBYRFAIZpEJI
 l5xxx7K5qXFCO1UapooxXR4V2/kZ+yRGaiwV4JxHyUSi00TQKLiWV53gxLA85oPtUVn3uZxTO4Z
 j075HeXaLlOGrDf/ZRM6W57T0s5ELEik=
X-Gm-Gg: ATEYQzz/Vyc+66sEkFAL6pW63OV8E/2lrybC6Kxgx872F0dpf+0acniRvlAsys7IyyT
 gzJ7dtmNh0M0eTdkIUR7rSA9zX6iKCJrD6EsY6H3wWZ+RTosna+5LmJK93ulsZnUa6qUJtYmFSQ
 G/NSbhOdawnlh6xmSQDr5uJYbL8UNxiCPdFXPC2/gs+vyeeHr2xWSU76f4+0piZJ4akMMGphJKT
 MKG3eaBpmE5wG/2CebeTAYHOlFTvfg6vjT2MLHT6+D0DODQ1wPXzhoNZTzEwoa+hW5xaDVOTc4e
 EcvXsw==
X-Received: by 2002:a17:907:c22:b0:b76:d8cc:dfd9 with SMTP id
 a640c23a62f3a-b935707755bmr337090166b.18.1772166482905; Thu, 26 Feb 2026
 20:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20260226172531.13714-1-dhyan19022009@gmail.com>
 <aaCIqUXPB75vR6rK@smile.fi.intel.com>
In-Reply-To: <aaCIqUXPB75vR6rK@smile.fi.intel.com>
From: Dhyan Prajapati <dhyan19022009@gmail.com>
Date: Fri, 27 Feb 2026 09:57:51 +0530
X-Gm-Features: AaiRm51Kla7dFsbkkGnTAyrUlaCwF-68QOoU2JR7j7EjNdVB-MbbvZPMA9ToT08
Message-ID: <CAJwkUtREy0C81Z=zWNmq_mjobV9uYATOhvUiPajegswF-Q=Rqg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix macro whitespace errors
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Donenfeld <Jason@zx2c4.com>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000b24ee7064bc6a926"
X-Mailman-Approved-At: Fri, 27 Feb 2026 08:18:15 +0000
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:gregkh@linuxfoundation.org,m:Jason@zx2c4.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dhyan19022009@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.424];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhyan19022009@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 513FF1B4617
X-Rspamd-Action: no action

--000000000000b24ee7064bc6a926
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah, sorry i should've at least check the definition, i'll keep in mind
not to trust chceckpatch blindly

On Thu, Feb 26, 2026 at 11:23=E2=80=AFPM Andy Shevchenko <
andriy.shevchenko@intel.com> wrote:

> On Thu, Feb 26, 2026 at 10:55:31PM +0530, dhyan19022009@gmail.com wrote:
> >
> > Remove prohibited spaces before closing parentheses in macro calls in
> > fbtft-bus.c, reported by checkpatch.pl
>
> You haven't compiled this, have you?
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

--000000000000b24ee7064bc6a926
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>yeah, sorry i should&#39;ve at least check the defini=
tion, i&#39;ll keep in mind not to trust chceckpatch=C2=A0blindly<br></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 26, 2026 at 11:23=E2=80=AFPM Andy Shevchenko &l=
t;<a href=3D"mailto:andriy.shevchenko@intel.com">andriy.shevchenko@intel.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, Feb 26, 2026 at 10:55:31PM +0530, <a href=3D"mailto:dhyan19022009@=
gmail.com" target=3D"_blank">dhyan19022009@gmail.com</a> wrote:<br>
&gt; <br>
&gt; Remove prohibited spaces before closing parentheses in macro calls in<=
br>
&gt; fbtft-bus.c, reported by <a href=3D"http://checkpatch.pl" rel=3D"noref=
errer" target=3D"_blank">checkpatch.pl</a><br>
<br>
You haven&#39;t compiled this, have you?<br>
<br>
<br>
-- <br>
With Best Regards,<br>
Andy Shevchenko<br>
<br>
<br>
</blockquote></div></div>

--000000000000b24ee7064bc6a926--
