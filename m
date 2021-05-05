Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA08373871
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721E86E46B;
	Wed,  5 May 2021 10:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E56D6E043;
 Wed,  5 May 2021 10:16:57 +0000 (UTC)
IronPort-SDR: Cb5Zi9ecI9IFsEyTsWTxn0481VVP+KM1oGRZCnCFYFz4kAy5GEAT/v1TiY2MYUi5loxp4rzO+O
 mRc0FOlJiVJA==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="262123841"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="262123841"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:16:55 -0700
IronPort-SDR: U30dEnHdvT5+c2dHJR8RccJwK2sbrlrSUFqR2AvVM8RCcQwEarpH+AZ9Bnx8SZFYCG1Cxc0Lyn
 a5MwFINoEoqw==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="458616820"
Received: from yueqinya-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.254.36.228])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:16:54 -0700
Date: Wed, 5 May 2021 06:16:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Subject: Re: Enabling sample_c optimization for Broadwell GPUs
Message-ID: <YJJwlXt4n936yz68@intel.com>
References: <e99599bf-f503-3227-8361-afcd3d2a098f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e99599bf-f503-3227-8361-afcd3d2a098f@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>, kernel@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andre,

I'm not familiar with the sample c message optimization.
Probably Ken can comment.

However I could check the internal spec here and I saw this bit
only exists with this meaning in Haswell.

For all the other platforms, including Broadwell it got re-purposed with
a different meaning and a programming note:
"This bit should be programmed to zero (0h) at all times."

Also, I could not find any workaround documented anywhere recommending
this bit to be set.

So, I would not recommend to use it in any product, even downstream.
Regardless the state of sample c message optimization in later platforms.

Thanks,
Rodrigo.

On Tue, May 04, 2021 at 08:07:14PM -0300, Andr=E9 Almeida wrote:
> Hi there,
> =

> While browsing an old downstream kernel, I found a patch[0] that enables
> sample_c optimizations at Broadwell GPUs. The message from the upstream
> commit that enables it for Haswell[1] (and presumably where the code at[0]
> was copied from) states that "[..] later platforms remove this bit, and
> apparently always enable the optimization".
> =

> Could you confirm that Broadwell and following architectures enable this
> optimization by default (and thus, patch[0] is a no-op), or should I
> upstream it?
> =

> Thanks,
> 	Andr=E9
> =

> [0] https://github.com/ValveSoftware/steamos_kernel/commit/198990f13e1d94=
29864c177d9441a6559771c5e2
> =

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D944115934436b1ff6cf773a9e9123858ea9ef3da
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
