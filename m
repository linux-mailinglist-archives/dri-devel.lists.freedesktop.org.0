Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC95A4FFC34
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 19:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6788C10E138;
	Wed, 13 Apr 2022 17:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D7F10E138;
 Wed, 13 Apr 2022 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649869959; x=1681405959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3GHeqODc1hevgvCDKZ/t/z2DG0jedAb4Veh9wJu2RrY=;
 b=K0R2ZeMwXEey0oYAUGJmqRObDkgjFrMi3HAXZUkbrTVDJy7Jvbbo/QOK
 YI0FRwEH0KI54b+JPONWAoOu84qUvt5HcbjcPyLk8nhTT0T072/RGatRd
 xmwcPcgrkEk4mjH1dROptcpCJcG81bv0OEOAYR0N+SEV37FKyPENtFYNC
 dsOnqIBG7VT4GUXjmrfwIKi8rl0JD5dWCO18ozzmNpx+HkVdkEDgxngSm
 bK++A80gP7J+TISzBJ7cHhg6gTqaKyj9MOfHQC+GRhvIMrRsl6x/rbOL5
 QzDQ8x01C9QUU/bvcn5Q+/SjTr0HBzaVAZbt8ZdGoDO/W/doDydpJi+ql A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262902765"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="262902765"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:12:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="573361082"
Received: from jardanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.150.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:12:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Fran=C3=A7ois?= Valenduc <francoisvalenduc@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes white
 spots in console screens
In-Reply-To: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
Date: Wed, 13 Apr 2022 20:12:20 +0300
Message-ID: <87v8vcgb63.fsf@intel.com>
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022, Fran=C3=A7ois Valenduc <francoisvalenduc@gmail.com> wr=
ote:
> Commit 15512021eb3975a8c2366e3883337e252bb0eee5=20
> (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spots=20
> to appears on the right upper corner of all console screens (see=20
> https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/view).=
=20
> git-bisect shows that this is the offending commit and if I revert it,=20
> the problem goes away. The problem still occurs with kernel 5.18-rc2 and=
=20
> to all stable trees where it was applied.
> Can somebody explains what happens ?
>
> The video card is the following: VGA compatible controller: Intel=20
> Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00=20
> [VGA controller])
>
> Please tell me if you need more info.

That's commit 15512021eb39 ("drm/i915: Workaround broken BIOS DBUF
configuration on TGL/RKL"), adding Cc's.

Please file a report at fdo gitlab [1] and attach dmesg etc. there.

Thanks,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs


--=20
Jani Nikula, Intel Open Source Graphics Center
