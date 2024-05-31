Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591E8D6B8F
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 23:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9575810E074;
	Fri, 31 May 2024 21:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iSkZ9Yff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36DC10E074;
 Fri, 31 May 2024 21:31:57 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dfa7f3176d6so69838276.1; 
 Fri, 31 May 2024 14:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717191116; x=1717795916; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hpzU718toH8t7qDT1H6MGfAgV9Y70dHLXdOCxSff0Kw=;
 b=iSkZ9Yff4NYwzvUG5RS8qn0i8uZUOWi3Cku7VkMhSa5+EaeVExJ5TZ6N79oopFIbbD
 fJbwm//rETOlCAggzCEGyuBTPLWA1iVSLjabvtP0n3CAGrFId3BSFSVHPtWNKBFDhC8u
 QAsp7Tlpw8e93Ay/bMB0LoTGGNLltvCh2dy0rx9xvM/VjRZG9emFMajJdlCU60bvo4iq
 Wu2cpRvMsVMEf+xmbSmBQXUohDNDkIHMruiN4j7/C5CWjDGf/CheqJN3HJjL9kCSeKQv
 igEZRl/ngX+OiXl3Ly97IcEUOK7gMuc4nrtCgOwvBTzhWeLY2W3mPAgg4NVbiEdiof2B
 ym1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717191116; x=1717795916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hpzU718toH8t7qDT1H6MGfAgV9Y70dHLXdOCxSff0Kw=;
 b=CpFGQCRW1emElGJxfFqKOEr5srB0olayTdNacTmGba/yKDnY5RH7mwAkSfl4YsqCce
 ycXpofp6NJt5BnRDbQYBe9TxNv63gxWVhPXVa/ujm4LaHVW7wMhOsvRk8mbDjS7QAOIy
 XErBL3n7lbW23PzyttcfLCLH9KY9IfIjEXzwPZuQ5IkpzAJfRSlbUp4A1U0jgjglOxgZ
 zBg6cFEHQMYvOo0rUypGOjRMve7pi/hcAlmfyaft1WrHzcMbet8w39gLVrEGxZXTksDq
 9x5zzZYjlkhdLpuf01fLAt5LGMp9kqrqABDBWSxQmvckGbEfMrntHr7krJQP7fXgGowZ
 WmZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFLzfhX1I9IVPNt2tYPDwDiWBL1HwtZuv+DXqnnqfyDBWo7k/PDl3dKBeVPAnci75xb+ByqX1LBHocwCL8hvGMMhCqY5q1WFaRQRJIq6oI9H8O7vQh7iS4zfcoIpTGo42EpCz9P/TU9P0UVRQLYQ==
X-Gm-Message-State: AOJu0Yz28y+RcPmRQg3kw+zXM7Kw6skQdQDfxELQc3tPbAWd4en/RNBm
 0EP8rXJGcx72DYkb5OPwu1hUoAvPgwNQZhxSFJ7+O9zaC3/DC3rvKjqRvm0c7i2nDQosnAXMIRa
 Hp2kMuXCmunndqC0DJvDEPvz6zYk=
X-Google-Smtp-Source: AGHT+IFhmDcP2xwjMV83P5kwuf/Ei6k7VOsm/LeK83KsKoVGpHpmudzwqmp4Z4Cl78ci9PLaAAbghxVVt8ScyStNGNw=
X-Received: by 2002:a05:6902:220e:b0:dfa:70a5:e3fa with SMTP id
 3f1490d57ef6-dfa72ec9826mr2639967276.0.1717191116512; Fri, 31 May 2024
 14:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240531053704.2009827-1-olvaffe@gmail.com>
 <ZlmQ3_wcL3cgp4Hb@smile.fi.intel.com>
In-Reply-To: <ZlmQ3_wcL3cgp4Hb@smile.fi.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 31 May 2024 14:31:45 -0700
Message-ID: <CAPaKu7SsD+X7KAO=3vEYU_7YGM_f+7k1fdC9nEK=-NaJw8oYaA@mail.gmail.com>
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 christian.koenig@amd.com, alexander.deucher@amd.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alison Schofield <alison.schofield@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000082e3d40619c6b61a"
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

--00000000000082e3d40619c6b61a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 1:57=E2=80=AFAM Andy Shevchenko <
andriy.shevchenko@linux.intel.com> wrote:

> On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:
> > We can skip children resources when the parent resource does not cover
> > the range.
> >
> > This should help vmf_insert_* users on x86, such as several DRM drivers=
.
> > On my AMD Ryzen 5 7520C, when streaming data from cpu memory into amdgp=
u
> > bo, the throughput goes from 5.1GB/s to 6.6GB/s.  perf report says
> >
> >   34.69%--__do_fault
> >   34.60%--amdgpu_gem_fault
> >   34.00%--ttm_bo_vm_fault_reserved
> >   32.95%--vmf_insert_pfn_prot
> >   25.89%--track_pfn_insert
> >   24.35%--lookup_memtype
> >   21.77%--pat_pagerange_is_ram
> >   20.80%--walk_system_ram_range
> >   17.42%--find_next_iomem_res
> >
> > before this change, and
> >
> >   26.67%--__do_fault
> >   26.57%--amdgpu_gem_fault
> >   25.83%--ttm_bo_vm_fault_reserved
> >   24.40%--vmf_insert_pfn_prot
> >   14.30%--track_pfn_insert
> >   12.20%--lookup_memtype
> >   9.34%--pat_pagerange_is_ram
> >   8.22%--walk_system_ram_range
> >   5.09%--find_next_iomem_res
> >
> > after.
>
> Is there any documentation that explicitly says that the children resourc=
es
> must not overlap parent's one? Do we have some test cases? (Either way th=
ey
> needs to be added / expanded).
>
I think it's the opposite.  The assumption here is that a child is always a
subset of its parent.  Thus, if the range to be checked is not covered by a
parent, we can skip the children.

That's guaranteed by __request_resource.  I am less sure
about __insert_resource but it appears to be the case too.  FWIW,
resource_is_exclusive has the same assumption already.

It looks like I need to do some refactoring to add tests.


> P.S> I'm not so sure about this change. It needs a thoroughly testing, es=
p.
> in PCI case. Cc'ing to Ilpo.
>
What's special about PCI?

--=20
> With Best Regards,
> Andy Shevchenko
>
>
>

--00000000000082e3d40619c6b61a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 31, 2024 at 1:57=E2=80=AF=
AM Andy Shevchenko &lt;<a href=3D"mailto:andriy.shevchenko@linux.intel.com"=
>andriy.shevchenko@linux.intel.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, May 30, 2024 at 10:36:57PM -0700,=
 Chia-I Wu wrote:<br>
&gt; We can skip children resources when the parent resource does not cover=
<br>
&gt; the range.<br>
&gt; <br>
&gt; This should help vmf_insert_* users on x86, such as several DRM driver=
s.<br>
&gt; On my AMD Ryzen 5 7520C, when streaming data from cpu memory into amdg=
pu<br>
&gt; bo, the throughput goes from 5.1GB/s to 6.6GB/s.=C2=A0 perf report say=
s<br>
&gt; <br>
&gt;=C2=A0 =C2=A034.69%--__do_fault<br>
&gt;=C2=A0 =C2=A034.60%--amdgpu_gem_fault<br>
&gt;=C2=A0 =C2=A034.00%--ttm_bo_vm_fault_reserved<br>
&gt;=C2=A0 =C2=A032.95%--vmf_insert_pfn_prot<br>
&gt;=C2=A0 =C2=A025.89%--track_pfn_insert<br>
&gt;=C2=A0 =C2=A024.35%--lookup_memtype<br>
&gt;=C2=A0 =C2=A021.77%--pat_pagerange_is_ram<br>
&gt;=C2=A0 =C2=A020.80%--walk_system_ram_range<br>
&gt;=C2=A0 =C2=A017.42%--find_next_iomem_res<br>
&gt; <br>
&gt; before this change, and<br>
&gt; <br>
&gt;=C2=A0 =C2=A026.67%--__do_fault<br>
&gt;=C2=A0 =C2=A026.57%--amdgpu_gem_fault<br>
&gt;=C2=A0 =C2=A025.83%--ttm_bo_vm_fault_reserved<br>
&gt;=C2=A0 =C2=A024.40%--vmf_insert_pfn_prot<br>
&gt;=C2=A0 =C2=A014.30%--track_pfn_insert<br>
&gt;=C2=A0 =C2=A012.20%--lookup_memtype<br>
&gt;=C2=A0 =C2=A09.34%--pat_pagerange_is_ram<br>
&gt;=C2=A0 =C2=A08.22%--walk_system_ram_range<br>
&gt;=C2=A0 =C2=A05.09%--find_next_iomem_res<br>
&gt; <br>
&gt; after.<br>
<br>
Is there any documentation that explicitly says that the children resources=
<br>
must not overlap parent&#39;s one? Do we have some test cases? (Either way =
they<br>
needs to be added / expanded).<br></blockquote><div>I think it&#39;s the op=
posite.=C2=A0 The assumption here is that a child=C2=A0is always a subset o=
f its parent.=C2=A0 Thus, if the range to be checked is not covered by a pa=
rent, we can skip the children.</div><div><br></div><div>That&#39;s guarant=
eed by=C2=A0__request_resource.=C2=A0 I am less sure about=C2=A0__insert_re=
source but it appears to be the case too.=C2=A0 FWIW, resource_is_exclusive=
 has the same assumption already.</div><div>=C2=A0<br></div><div>It looks l=
ike I need to do some refactoring to add tests.<br></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
P.S&gt; I&#39;m not so sure about this change. It needs a thoroughly testin=
g, esp.<br>
in PCI case. Cc&#39;ing to Ilpo.<br></blockquote><div>What&#39;s special ab=
out PCI?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
-- <br>
With Best Regards,<br>
Andy Shevchenko<br>
<br>
<br>
</blockquote></div></div>

--00000000000082e3d40619c6b61a--
