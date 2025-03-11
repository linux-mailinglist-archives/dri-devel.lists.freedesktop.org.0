Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710DA5BB81
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9166210E536;
	Tue, 11 Mar 2025 09:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXS83HOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483A310E536
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741683665; x=1773219665;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GzN/zJQLCijn273VjDtP477zTbCGzrLmSFpEiCk/eYw=;
 b=RXS83HOEWtKQ+0fvCUb2NTWDL0yOA1dNVpQU+8BQbZjLijlTSvxaQeIf
 AuZ+rDHv2zwzaOLiWcom4KXaU/GcfpItbENsu+yE4bJrbdHPxhs78Gk5Q
 O10HywnOXGMEFs4myoK5PBdtthlfW+3502F7ktcFFiC5eLS0l712PcDhJ
 2+zJzqvHy3whssqpmZAe4+HRyh6+tKOm0L/69G63Hjlftmd3csxfSmTK/
 C5d8h1F5XgITlWOvNIttDqYwglkBG8VPEXDQ6ekmH2MgfeCBSyCLhcVid
 sqwYmGz01ECyTXX+3TcKPwsjTWPKm6haXO4KJhQuSIoqyCN8a9J4IWoB4 Q==;
X-CSE-ConnectionGUID: 08VBZmX4TGSwhDS4Huwrng==
X-CSE-MsgGUID: 4PkJVe4nQBSw18ftcnfaCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46358363"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="46358363"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 02:01:04 -0700
X-CSE-ConnectionGUID: GveN8dxsQFmv5qok75ijgQ==
X-CSE-MsgGUID: RQZDSH5tQViWEi591JPBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="124427671"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 02:01:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>
Cc: Ofir Bitton <obitton@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>, "jgg@nvidia.com" <jgg@nvidia.com>,
 koby.elbaz@intel.com, konstantin.sinyuk@intel.com
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
In-Reply-To: <be353276-3dce-49c1-8a35-164a33ddb9f9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
 <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com>
 <87cyevy9k0.fsf@intel.com>
 <f543ec81-1092-4700-b695-c4126f122444@intel.com>
 <Z8q6pCmCnVCCvBJK@GABBAY.>
 <be353276-3dce-49c1-8a35-164a33ddb9f9@intel.com>
Date: Tue, 11 Mar 2025 11:00:57 +0200
Message-ID: <87bju8gcvq.fsf@intel.com>
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

On Tue, 11 Mar 2025, "Avizrat, Yaron" <yaron.avizrat@intel.com> wrote:
> On 07/03/2025 11:21, Oded Gabbay wrote:
>> On Thu, Mar 06, 2025 at 03:51:24PM +0200, Avizrat, Yaron wrote:
>>> On 05/03/2025 13:57, Jani Nikula wrote:
>>>> On Wed, 05 Mar 2025, "Avizrat, Yaron" <yaron.avizrat@intel.com> wrote:
>>>>> On 29/07/2024 15:17, Ofir Bitton wrote:
>>>>>> I will be leaving Intel soon, Yaron Avizrat will take the role
>>>>>> of habanalabs driver maintainer.
>>>>>>
>>>>>> Signed-off-by: Ofir Bitton <obitton@habana.ai>
>>>>>> ---
>>>>>>  MAINTAINERS | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index ed2d2dbcec81..a4b36590061e 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -9599,7 +9599,7 @@ S:	Maintained
>>>>>>  F:	block/partitions/efi.*
>>>>>>
>>>>>>  HABANALABS PCI DRIVER
>>>>>> -M:	Ofir Bitton <obitton@habana.ai>
>>>>>> +M:	Yaron Avizrat <yaron.avizrat@intel.com>
>>>>>>  L:	dri-devel@lists.freedesktop.org
>>>>>>  S:	Supported
>>>>>>  C:	irc://irc.oftc.net/dri-devel
>>>>> Acked-by: Yaron Avizrat <yaron.avizrat@intel.com>
>>>>>
>>>>> Apologies for the long silence =E2=80=94 it=E2=80=99s been a challeng=
ing period with
>>>>> the Habanalabs-Intel merger, but we're back and ready to continue
>>>>> contributing.
>>>>>
>>>>> We'll be moving forward with our roadmap =E2=80=94 upstreaming the la=
test
>>>>> HabanaLabs driver, including recent changes and full support for the
>>>>> entire GaudiX series.
>>>>>
>>>>> To support this effort, Koby Elbaz and Konstantin Sinyuk will join me
>>>>> as co-maintainers on a regular basis.
>>>> Should they be added as maintainers in the MAINTAINERS entry too?
>>>>
>>>> Are you going to pick this up and apply to the Habanalabs repo, and se=
nd
>>>> a pull request with it? Or how do you propose to proceed?
>>>>
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>> Yes, in a later patch, they would be added as maintainers in the MAINTA=
INERS entry too.
>>> Regarding your second question, we should start with merging Ofir's ini=
tial patch.
>>> Any additional/upcoming changes will be initially merged into the offic=
ial HabanaLabs repo as you mentioned above.
>>>
>>> Regards,
>>> Yaron
>>>
>> Acked-by: Oded Gabbay <ogabbay@kernel.org>
>
> Reminder: can someone pick it up, please?

I thought you picking this up in your tree and then sending a pull
request with it would be a good exercise to get started. ;)

BR,
Jani.


--=20
Jani Nikula, Intel
