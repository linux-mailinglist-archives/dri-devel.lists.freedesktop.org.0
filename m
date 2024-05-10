Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8338C21AD
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976E110E105;
	Fri, 10 May 2024 10:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+YPmtly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D588410E038;
 Fri, 10 May 2024 10:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715335753; x=1746871753;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AUpf3wieelOW4Oybfw7FBJbRDJexa7/gEyn5W+WWBrE=;
 b=h+YPmtlyY1kbbc8aFHtC+sp7hROz4zYoG5hyIy/TuLoomdz5rYpFaUYb
 jZBDAydfLyjF6FKUqRFIjDHeXnCLZg+LiNKkG7E6gYxtCeiVZ38bKGUoP
 83UmZpc8DsR7fefJMYMZH2dXvx/wWdtbFJrNE2b1TTZyu9lQLoOevozw6
 CeDkpYN/ZLf7G7d6h7To0qKef9Qk1YjRn2Kkf9FpYon/NPFQcnJjvIcX5
 kJhbMQt0auI1TQA6QXgfD/1SQAX0u//duICbv2Z+rVZBQaY4hPZEt3yRI
 C0PHP4MS6JSS13iJjpb8QopL5SJTMuHhc0gzqwvFwiXC14Os7X+aOsdAd A==;
X-CSE-ConnectionGUID: go9Lm9EzT2WQAkfwVMuKlQ==
X-CSE-MsgGUID: cmDZk1QLSXqHKVpPLlRR0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="14259553"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="14259553"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 03:09:12 -0700
X-CSE-ConnectionGUID: fR+NzAfiSZibUFAxHTQi6g==
X-CSE-MsgGUID: CcL5EJ/iRV2+oDSx5Mhp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="34087516"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 03:09:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
In-Reply-To: <20240510102036.3ea40b37@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
Date: Fri, 10 May 2024 13:09:04 +0300
Message-ID: <87o79ehtbz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Em Fri, 10 May 2024 11:08:38 +0300
> Jani Nikula <jani.nikula@intel.com> escreveu:
>
>> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrot=
e:
>> > The drm/msm driver had adopted using Python3 script to generate regist=
er
>> > header files instead of shipping pre-generated header files. Document
>> > the minimal Python version supported by the script.
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  Documentation/process/changes.rst | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/process/changes.rst b/Documentation/process=
/changes.rst
>> > index 5685d7bfe4d0..8d225a9f65a2 100644
>> > --- a/Documentation/process/changes.rst
>> > +++ b/Documentation/process/changes.rst
>> > @@ -63,6 +63,7 @@ cpio                   any              cpio --versi=
on
>> >  GNU tar                1.28             tar --version
>> >  gtags (optional)       6.6.5            gtags --version
>> >  mkimage (optional)     2017.01          mkimage --version
>> > +Python (optional)      3.5.x            python3 --version=20=20
>>=20
>> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point in
>> using anything older than the oldest supported version of Python,
>> i.e. 3.8 at this time?
>
> What's the point of breaking compilation with on older distros?
> The idea of minimal versions here is to specify the absolute minimum
> version that it is required for the build to happen. If 3.5 is
> the minimal one, then be it.

AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
at least be aware *why* we'd be sticking to old versions.

Minimum versions here also means sticking to features available in said
versions, for Python just as well as for GCC or any other tool. That's
not zero cost.

I guess there are two angles here too. The absolute minimum version
currently required, and the, uh, maximum the minimum version can be
safely bumped to. Say, you want to use a feature not available in the
current minimum, how far up can you bump the version to?

Could we define and document the criteria (e.g. based on distros as you
suggest below) so we don't have to repeat the discussion?


BR,
Jani.

>
> -
>
> Now, a criteria is needed to raise the minimal version. IMO, the
> minimal version shall be at least the minimal one present on most
> used LTS distros that are not EOL.
>
> I would look for at least 4 such distros:
>
> - Debian
>
>   Looking at https://wiki.debian.org/LTS, Debian 10 EOL will be on
>   June, 2024.
>
>   Looking at:
>
> 	https://distrowatch.com/table.php?distribution=3Ddebian
>
>   Debian 10 uses python 3.7.3.
>
> - Looking at Distrowatch for openSUSE Leap 15.5, it uses Python
>   3.6.15 and has an EOL schedule for Dec, 2024.
>
> - RHEL 8.9 uses a bigger version than those two - 3.11.5 - again
>   looking at Distrowatch to check it.
>
> - SLES 15 SP4 and above uses Python 3.11, according with:
>   https://www.suse.com/c/python-3-11-stack-for-suse-linux-enterprise-15/
>
> From the above, IMO kernel shall support building with Python 3.6=20
> at least until the end of this year.
>
> Regards,
> Mauro

--=20
Jani Nikula, Intel
