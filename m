Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F19BA2B1
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 23:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5147F10E23A;
	Sat,  2 Nov 2024 22:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GavlxyGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580B910E0F3
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 10:17:25 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7181eb9ad46so1427764a34.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730542644; x=1731147444; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vynadvg6iX3sID33azO+FlsPSY6tF6gRoM9qSXItYIg=;
 b=GavlxyGWfKNZBotccgRKNHsnlHCIpiMeXGrh8sOdbPW2krqTgBoMR46CQQYhquFmVX
 pMOsbGn6flu8ETeZNuZ3GFI1dc8TUhn8sd+Q2wvYBXt5+AzLUzliZZkA1eqyvugXP3dz
 aBKhcyQI8tu8scMU4qiRw65vNA+jzUI/UYxYJrUKlhqnfnHm6h58+sFb3EUm6NqCYw7s
 X8Bd0pOa3ILrU3PFEwvBkOhC/HXKMw0qflmjFhEJEgNp3DvgBmHZ9Sic+AIPME58AEIB
 SkUDacw2B295FVhVOR2OxuE2bskVCTTzwHIe2tMiP0D/OmoTFKVsg0OMlVaB7ZSGVD81
 XflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730542644; x=1731147444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vynadvg6iX3sID33azO+FlsPSY6tF6gRoM9qSXItYIg=;
 b=d8gorJfrlRgV4er/MdXYEO5x6YXxQCHamvzHX9Mz6ayuabR3lE6uCoGwF48ejBTWla
 rVYI8wfv8YKq6zN0ueqNtP8oV4e3NC56FCS0YoXzestcxNIFGt9k4NKjtU50lGXq7A1j
 VXxn1IUAjWNumPjbDoreMmfrLHEKzueVmb0BcW/B93CJj3E0gdBoPKp4PpkcmITV5UTo
 26/YBeYCmk2Iv9vOEgjqB5uWLJ4idsvuImtvl7IqrtWXGVrIZgGb2QHinslS8vq7dwsX
 woDKGczk0y+ie4iF+3RLXUXZ7DH/E8HsRDT/Z9VqmhQDsLGQSCOoK/q+BqM6SOctrF0Z
 jo9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbX6T6S3AuRdQZd22w2kpaLKCkXqoGd3yATnjxfS/d3WlRcI0Aaw0tRcH5gPnUPHVUBsncqhDEbZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1bDXhpMdEovsDcwSA6RfjBGeUDo65l062agLM2Gl7fLTvWkMN
 fou7a1nvaJgeWr2YN8sqfwBeqTPEi/2kMQ6ItECymp+j1uK+qsI7
X-Google-Smtp-Source: AGHT+IHidLOCarYXK3bOwQUlD9L2dhpcG4PxlbHDpS91JTZGSTCQoRppL25J2s1Ke4EKjF3/LoK0/A==
X-Received: by 2002:a05:6830:2690:b0:718:a52:e1cc with SMTP id
 46e09a7af769-7186828d81emr25889797a34.25.1730542644492; 
 Sat, 02 Nov 2024 03:17:24 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ec70607719sm980306eaf.30.2024.11.02.03.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 03:17:23 -0700 (PDT)
Date: Sat, 2 Nov 2024 05:17:20 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/4] proc_pid_fdinfo.5: Make pid clearer in the name
 and 1st paragraph
Message-ID: <20241102101720.cwp7lcidqbzkrub6@illithid>
References: <20241101191156.1272730-1-irogers@google.com>
 <20241101191156.1272730-2-irogers@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5pnc5f5hp5bdfe73"
Content-Disposition: inline
In-Reply-To: <20241101191156.1272730-2-irogers@google.com>
X-Mailman-Approved-At: Sat, 02 Nov 2024 22:14:05 +0000
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


--5pnc5f5hp5bdfe73
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/4] proc_pid_fdinfo.5: Make pid clearer in the name
 and 1st paragraph
MIME-Version: 1.0

Hi Ian,

At 2024-11-01T12:11:54-0700, Ian Rogers wrote:
> diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> index 87e6dbe56..935b54b4c 100644
> --- a/man/man5/proc_pid_fdinfo.5
> +++ b/man/man5/proc_pid_fdinfo.5
[...]
> -this is a subdirectory containing one entry for each file which the
> -process has open, named by its file descriptor.
> +this subdirectory contains one entry for each file that process
> +.IR pid
> +has open, named by its file descriptor.

`IR` is better used with two or more arguments.

As of groff 1.23 (July 2023), the man(7) package will warn you about
problem like this if you ask it to.

$ nroff -man -rCHECKSTYLE=3D1 /tmp/proc_pid_fdinfo_mini.5
an.tmac:/tmp/proc_pid_fdinfo_mini.5:7: style: .IR expects at least 2 argume=
nts, got 1
proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mini=
(5)

Name
       /proc/pid/fdinfo - information about file descriptors

Description
       Text text text text.  One pid to rule them all and in the darkness b=
ind
       them.

example                           2024=E2=80=9011=E2=80=9002           proc=
_pid_fdinfo_mini(5)

I think Alex has a make(1) target that assists with running groff this
way.

groff_man(7):
   Font style macros
     ... It is often necessary to set
     text in different styles without intervening space.  The macros
     .BI, .BR, .IB, .IR, .RB, and .RI, where =E2=80=9CB=E2=80=9D, =E2=80=9C=
I=E2=80=9D, and =E2=80=9CR=E2=80=9D
     indicate bold, italic, and roman, respectively, set their odd=E2=80=90
     and even=E2=80=90numbered arguments in alternating styles, with no spa=
ce
     separating them.

One reason to pay close attention to this point is that

=2EIR foo bar

formats as "foobar" (with "foo" in italics), whereas

=2EI foo bar

formats as "foo bar", with both words in italics.

The different handling of the space is a common manifestation of error.

Regards,
Branden

--5pnc5f5hp5bdfe73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcl/DAACgkQ0Z6cfXEm
bc6BNg//Z3bHTZ3wx1TbS0lEh0b8tKloBfFBMkOkYm/YtDcADzujhdVn/gI2YeX/
M440Gik5t3w8nEE27yCZJdAE6lbho9KzT7W36m6FIX0ZxvU5FfUetJz0+DfeZ9jc
mKuqdqSriHk6C2QIekNAWLUvxpOzy9fg9iIiUNbMGzKi+v3b+b1yYCfWND80fx07
7G1/8XNrV2bpoLj+5fbFkO7vgO6aFdXOIgQHjV2LmPSgQv7yF+Dq8265m2u/dnXn
0bPxX/V118CPYqYB04rQ5BS+4r+BPBiAJo9r544jj3iqSL/Yr/7dpSU3b50YCJpT
uLs+1ZiUV4whb8dbJiDnqbHipnREQtCrK4DS92Bgg+n+sSdslnJIu2oZqYrkDNPi
uAvp4RBUuQbd2gz+T68fE9Fc3zFpCqLtk7GWxyVvRPj2rd6gqVbkW7cB+YLylxQs
DqoUIFJXPkjTclto/5RrWcXviC0yqEHjuD19t1hdYYy1ETDVuLwgPH+O5d/MgWMV
0aYCPfKiG4brg9HUI0kbxfnewSlkncqPsrWWDH3dMV+fY0OcWQpnA1OmDgSQPm6x
iKjYEqYIJiMmr3tWn9I6sU0F+6foe4wfLluNHKOzdNi2o0732uJtZwYCxrg57Hdh
uBd/5EI67WCnK7KYns0av+fzV3cqGRFDm/LpY5VH3lApDUHQFYQ=
=N03W
-----END PGP SIGNATURE-----

--5pnc5f5hp5bdfe73--
