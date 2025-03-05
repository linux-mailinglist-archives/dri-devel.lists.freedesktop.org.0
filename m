Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF4A4FE18
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 12:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8CC10E10C;
	Wed,  5 Mar 2025 11:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Me3XjAeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D9E10E741
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741175847; x=1772711847;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KUvTkzD8ZdVvFMlqnAmrsjZYnS0TavK1VWfGeCYlXFw=;
 b=Me3XjAeqGMB8q+cFmSQOh9QFztlFJQUNYbHnNvV/j3ai+Is8u6lMXNN4
 GGwXW/rliLd//XcmAZPYXl47hjT6fBsL+8LAwjP7SMQPseQtrYQC+ELWX
 z85ZfzBIGGw3HwMzXgp2cEt8WXsoC+McfOCaMkeO26wUbIXSmZ2fPwXEy
 Y1lSzFYIBxFT31uIO1RJUs23wvc/7R9riv4QS3ydagx1gDG5VKfj9aOJ5
 XJU80nhG+3nNT8wwPk/Dq5ugdaNmYC/Vzpdpp0chR3CE9X10wGYjhD2k5
 BdKqiHOHlNeXRql+HZt3H1S1uQF7DRkQGCnSiCQDvjaWB7fyNTkWebPsy A==;
X-CSE-ConnectionGUID: uWv5nN1oQj+C3/o0ftrFgQ==
X-CSE-MsgGUID: AQld0AYtSp2jD/9KaK+tkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46060841"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="46060841"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:57:26 -0800
X-CSE-ConnectionGUID: TghoJe+CRSCXQvevc1s4bg==
X-CSE-MsgGUID: WQatGI/eRC6jtjchl6Mcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="123262532"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:57:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>, Ofir Bitton
 <obitton@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>
Cc: "jgg@nvidia.com" <jgg@nvidia.com>, koby.elbaz@intel.com,
 konstantin.sinyuk@intel.com
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
In-Reply-To: <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
 <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com>
Date: Wed, 05 Mar 2025 13:57:19 +0200
Message-ID: <87cyevy9k0.fsf@intel.com>
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

On Wed, 05 Mar 2025, "Avizrat, Yaron" <yaron.avizrat@intel.com> wrote:
> On 29/07/2024 15:17, Ofir Bitton wrote:
>> I will be leaving Intel soon, Yaron Avizrat will take the role
>> of habanalabs driver maintainer.
>>
>> Signed-off-by: Ofir Bitton <obitton@habana.ai>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ed2d2dbcec81..a4b36590061e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9599,7 +9599,7 @@ S:	Maintained
>>  F:	block/partitions/efi.*
>>=20=20
>>  HABANALABS PCI DRIVER
>> -M:	Ofir Bitton <obitton@habana.ai>
>> +M:	Yaron Avizrat <yaron.avizrat@intel.com>
>>  L:	dri-devel@lists.freedesktop.org
>>  S:	Supported
>>  C:	irc://irc.oftc.net/dri-devel
>
> Acked-by: Yaron Avizrat <yaron.avizrat@intel.com>
>
> Apologies for the long silence =E2=80=94 it=E2=80=99s been a challenging =
period with
> the Habanalabs-Intel merger, but we're back and ready to continue
> contributing.
>
> We'll be moving forward with our roadmap =E2=80=94 upstreaming the latest
> HabanaLabs driver, including recent changes and full support for the
> entire GaudiX series.
>
> To support this effort, Koby Elbaz and Konstantin Sinyuk will join me
> as co-maintainers on a regular basis.

Should they be added as maintainers in the MAINTAINERS entry too?

Are you going to pick this up and apply to the Habanalabs repo, and send
a pull request with it? Or how do you propose to proceed?


BR,
Jani.


--=20
Jani Nikula, Intel
