Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376B20F38A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 13:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C926E0BF;
	Tue, 30 Jun 2020 11:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA66B6E0BF;
 Tue, 30 Jun 2020 11:28:54 +0000 (UTC)
IronPort-SDR: jxFTMje7AX4iOWgfZ2qal4QNREQBp9yUDXtfpUKMg7aBisICL5kqSf8V6wW4ZORFNn0ZSdWAdg
 CkDx7ODgb12A==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="133659111"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="133659111"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 04:28:54 -0700
IronPort-SDR: 8FsIScqUd6XybB4TwPoVe8ouT1DyWB0gS+2ZZaba3IiTPySeeIJ6mL1Cf72uTSXvRhBPL4oqws
 3hpPziN9TlAw==
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="454578729"
Received: from rgrotewx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.12])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 04:28:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/i915/display: fix missing null check on allocated dsb
 object
In-Reply-To: <45e8594c-14e5-ba67-9708-1b72fa2c51d3@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200616114221.73971-1-colin.king@canonical.com>
 <20200616115459.GN4151@kadam>
 <45e8594c-14e5-ba67-9708-1b72fa2c51d3@canonical.com>
Date: Tue, 30 Jun 2020 14:28:47 +0300
Message-ID: <877dvon66o.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Animesh Manna <animesh.manna@intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Jun 2020, Colin Ian King <colin.king@canonical.com> wrote:
> On 16/06/2020 12:54, Dan Carpenter wrote:
>> On Tue, Jun 16, 2020 at 12:42:21PM +0100, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently there is no null check for a failed memory allocation
>>> on the dsb object and without this a null pointer dereference
>>> error can occur. Fix this by adding a null check.
>>>
>>> Note: added a drm_err message in keeping with the error message style
>>> in the function.
>> 
>> Don't give in to peer pressure!  That's like being a lemming when Disney
>> film makers come to push you off the cliff to create the 1958 nature
>> film "White Wilderness".
>
> :-)

Pushed, thanks for the patch and smile.

BR,
Jani.


>
>> 
>> regards,
>> dan carpenter
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
