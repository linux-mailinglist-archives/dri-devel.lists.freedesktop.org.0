Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1657194B68
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 23:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DBF6E372;
	Thu, 26 Mar 2020 22:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FD06E372;
 Thu, 26 Mar 2020 22:15:18 +0000 (UTC)
IronPort-SDR: wlmQXy4IIjcc/35biYP2ojjlLiOd8Usiq0A+dcH204NlVkfUrTYJYHenWCSM0ucZovY6FXLzKu
 r9Tj3PX/L+4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 15:15:16 -0700
IronPort-SDR: CKUk0FCouSsk7al6Cj8rQPk+zMLDVT1BC0SFC1EzauelJhK0bySNnImENlWjDo4/4SL+s6i+Y7
 qWoql0QiJ4nw==
X-IronPort-AV: E=Sophos;i="5.72,309,1580803200"; d="scan'208";a="420877850"
Received: from mschuste-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.32.130])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 15:15:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
In-Reply-To: <20200326201158.GA30083@ubuntu-m2-xlarge-x86>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200214054706.33870-1-natechancellor@gmail.com>
 <87v9o965gg.fsf@intel.com>
 <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
 <87o8u1wfqs.fsf@intel.com> <ff302c03-d012-a80d-b818-b7feababb86b@daenzer.net>
 <CAKwvOdnaRG=7mib9vtWX4wkjQXHeUiioonTaZLStMVXfOOSUfw@mail.gmail.com>
 <20200326201158.GA30083@ubuntu-m2-xlarge-x86>
Date: Fri, 27 Mar 2020 00:15:09 +0200
Message-ID: <87r1xehifm.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Mar 2020, Nathan Chancellor <natechancellor@gmail.com> wrote:
> This is the only warning on an x86_64 defconfig build. Apologies if we
> are being too persistent or nagging but we need guidance from the i915
> maintainers on which solution they would prefer so it can be picked up.
> I understand you all are busy and I appreciate the work you all do but
> I do not want this to fall between the cracks because it is annoying to
> constantly see this warning.

Apologies for the delay. As I replied first thing in this thread, this
works for me. Thanks for the patch, pushed to drm-intel-next-queued.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
