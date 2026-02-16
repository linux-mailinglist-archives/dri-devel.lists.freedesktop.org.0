Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPgHH+ymk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06991480A1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E3D10E3FF;
	Mon, 16 Feb 2026 23:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hrb+//AZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC6910E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:38:33 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso2969786d50.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 07:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771256313; cv=none;
 d=google.com; s=arc-20240605;
 b=RaYKJDUrukulr9C3Mh8bE8e6cZSsmAndI69jZqsH/2HgJJDNeIt4FsJsOUMjOcrl/V
 yj/b+OkfqP9MHHhxs47dwQYQAACt/w5f3+UvZVckZynD8J/IB7e3Q/PMxmutL80fIDAp
 AYkW6YMFeaWV1JmPfgtXIxCYMYUxCz3gjRiuLHbTMWJ2FrOq9lAS8EEehMLQIQhO8fKX
 Qo01Tto2vLc/h9HR17hoHhyTGkS7yvC7O3twkXEWV1stjTwjSE/YEc20P2DFgTGlNjgp
 12H7CDGiIWL/kRSB7z7kbHwLKhByUwHvPWUN8dLHO57YtOpdkhClr8Ui0ZhnAaSfYQdL
 2Syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fODsp8Wd2KEMymq0wmcad9m/8kvNOfes2fVQf0jcTVc=;
 fh=zQdYOyOEMHl4yV8+j8zukDeesz0lAUyNe6xrpIqYy/o=;
 b=OtfKGUcIPEFdChf1r+O2IevHn9E6rLab8Ih0PakCgvocnMZsaDFbvUq1n5AQKG8DT+
 pFyNte7mOROtVKvSluHg/rozJh03xSA7Bhce4OVoHL3gnjR2UWMIvHIigr/3lvwWl78v
 ZjiiIaaKUTczW9Vh5J8JNolrwC4RguG96ZTKsSk8WnjkwQIfMtOvzuxoHupSZtgBahNe
 aySaw3a+k21CvuN71sNQ54hmiiqPhHqg/7RuBM3ptEi3+RSmbJjNr6Uj4AVzxSdn08Sq
 Gj2A0Uc2uvJwZs9jekkNZk7/3oj1lhswYK0/A3kNPder5ES3kMc+7zLWzM+HU9Qf2itc
 rZww==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771256313; x=1771861113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fODsp8Wd2KEMymq0wmcad9m/8kvNOfes2fVQf0jcTVc=;
 b=Hrb+//AZawlFZCovK61oZ143bbn6GgXCwBTTo01jhjbkes/yRhyy+lFV2hfqbGCM1t
 8XZApZh3lqwj8Y0mm9cFUTOzLfIolaTXz9Q5NFXCCjjWCC55LpZaXw+cUIczC71I8zOC
 9P/xI4fN75FL0vOYh/6wFZad5kYH/cpiwwa7wqfUaGn8ZaYeX5s14tkflNnKsowbVCmw
 q5ZEV5t7VZfwjdHfr0a1obl3pS8QUgh0sk93tw5UsmCZ/wkyySmQABqfmTP776OOmbN+
 h5q7p7JF8AJmNWp16dIA4rZNY5/XmRF8IzZozlOb5b4rgqTVnrEX7Vy4jdZ6IRlTwD5Z
 sQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771256313; x=1771861113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fODsp8Wd2KEMymq0wmcad9m/8kvNOfes2fVQf0jcTVc=;
 b=bpfyQeT6b1OfrfCp9W7JQte89lYmLC/Ylhb3eo0HdVd6NVu7UQ9tYREXUh6IfeJD0B
 yJq7YsXIwKcxktDGQUbLRUuDNjJzt5quw8AqKiZQG/PEaYis5JeCD1Vo5dZqE+OrAEXV
 XJWJM9bsEGc+vuHiTTMwhocYEGyi1lmYbGsGMFWN63H4wCXcYiZwlyw0DR4EwN09sdkF
 gp3vFUdX8v538wNx/SNfWsXgTMr0yyJQCQGS3r7V3HIVVt5Gjg52jxVlW3+e8AElxYr6
 UH7NH6f6p4lThJ1B0SDcpimLxJaMs0t1EyZuYYAMK0lsiSi0FFbDZIIXS8vHP3kzhm6b
 TZBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2NEKvSEGdl/WgYaPRncn1A+nU2rjDTC9nmPNfalQUjxSmm40DBs6F5ri4KShRxiJRfoMsu4xOcLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2qwlP+8G86JZYAyPmyO5zLOgdGJ/pUI3I9CXGUgbkGJJ43rOa
 A5DuRiSMIPuUJ0/NUVdIOIG6KUPQ6abnoqny5Uq3wIVyfr9D9zSzbmNIWg/skyvrL/4lwHiT2nO
 uZ6FBwGCj7IlA4RzZp11c3tkDl2oWn+A=
X-Gm-Gg: AZuq6aJyWCalVwaoMRZ397Qa855VLgbQGTm6RmDO9zstmPHivDygQtSQiFmznGqsB6F
 iNN1ks0QUAyfyuOMckLBrEuFgM5jGmWaAxll31H/fP3IGNbu6gtGpgcLVnhaaFBUXfR8fKjvnvw
 tvVbSMhD9sdKu7Xe0BsS1ybXgFfrPTBsEifS30Aj7luaYOYQY1JJf7fI81z29soWGfd3bs3MDg2
 uVx9bJxqMYKO0qEATDSDdakBSXLPgKYzw/UtX5ADUty/PN4J1QKCjB2EH9v+kj4I7EORzHFJNnL
 UtzgqkfwVYnNe9O8tadEbfAPMqJfI1fTYqISKzLuN/91kV0anPZf
X-Received: by 2002:a53:d015:0:b0:64a:d716:c8b5 with SMTP id
 956f58d0204a3-64c1979ba03mr7245099d50.18.1771256312871; Mon, 16 Feb 2026
 07:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20260214070123.41374-1-architanant5@gmail.com>
 <CAGb2v679248jj4CwQhYAbTUiPJ1=-JqX15CaNY94Cj_dFXwZXw@mail.gmail.com>
 <CADJHxWCzbzD3MK+NLS3UVqXeH4cKop-ErNSnn_RUmAzRLmk7Mw@mail.gmail.com>
 <87ikbx6sf1.fsf@ocarina.mail-host-address-is-not-set>
In-Reply-To: <87ikbx6sf1.fsf@ocarina.mail-host-address-is-not-set>
From: Archit Anant <architanant5@gmail.com>
Date: Mon, 16 Feb 2026 21:08:20 +0530
X-Gm-Features: AZwV_QiXtBl77GaJAvJl1GfZ1mRg72oXG5PskwudBonhn6SiiGASLFYWwAX0yvw
Message-ID: <CADJHxWD-UpjgGKst_CDPqXHADVPJY6KL296VFOq6WFBEKqVong@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/sitronix: add ST7789V panel driver
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: wens@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, nathan@kernel.org, 
 geert+renesas@glider.be, marcus.folkesson@gmail.com, david@lechnology.com, 
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:wens@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:david@lechnology.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,glider.be,lechnology.com,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: B06991480A1
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 1:17=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:

Hi Javier,

>
> Archit Anant <architanant5@gmail.com> writes:
>
> Hello Archit,
>
> > Hi ChenYu,
> >
> > Thank you for the detailed review and the pointers toward the documenta=
tion.
> > I will ensure the headers are sorted alphabetically and the driver name
> > conflict is resolved in the next iteration.
> >
> >> The reset logic in mipi_dbi is inverted when compared to panel-st7789v=
.
> >> mipi_dbi needs to be taught the "proper" reset polarity.
> >
> > Noted. I will look into the mipi_dbi core to see how to handle the rese=
t
> > polarity correctly.
> >
> >> Instead this functionality could be merged into the existing panel-st7=
789v
> >> driver. You mentioned above that that driver only supports the 9-bit S=
PI
> >> transfer mode. However porting that driver over to mipi_dbi would fix =
this,
> >> and remove some redundant code. And tinydrm support could be added on =
top
> >> of that.
> >>
> >> I actually mentioned I was going to work on this on IRC. But I only po=
rted
> >> the driver over to use mipi_dbi, and haven't gotten around to adding
> >> tinydrm support. I can send out the conversion patches if that helps
> >> you.
> >
> > That would be fantastic and would save a lot of redundant effort. If yo=
u
> > send out the patches to convert the existing panel-st7789v driver to
> > mipi_dbi, I would be happy to build the 'tiny' (simple display pipe)
> > support on top of your series.
> >
>
> I think we want to get rid of the simple display pipeline and instead jus=
t
> use regulator atomic helpers, even for the tiny DRM drivers.
>
> Please take a look to previous commits such as 2037174993c8 ("drm/bochs:
> Use regular atomic helpers") or 622113b9f11f ("drm/ssd130x: Replace simpl=
e
> display helpers with the atomic helpers").
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>

Thank you for pointing this out. I based this implementation on the
existing st7735r driver, which currently uses the simple pipe.

I will study the bochs and ssd130x commits to understand the migration to
regular atomic helpers.

If the goal is to move tiny DRM drivers away from the simple pipe, updating
the Sitronix drivers to this new pattern sounds much better.
I will incorporate this into my plan for the next iteration
(building on top of ChenYu's work).

--=20
Sincerely,
Archit Anant
