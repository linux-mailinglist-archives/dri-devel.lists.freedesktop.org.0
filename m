Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2610512A12D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 13:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A7D89C84;
	Tue, 24 Dec 2019 12:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A4189C80;
 Tue, 24 Dec 2019 12:12:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Dec 2019 04:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,351,1571727600"; d="scan'208";a="268402202"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Dec 2019 04:12:12 -0800
Received: from bgsmsx101.gar.corp.intel.com (10.223.4.170) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Dec 2019 04:12:12 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.30]) by
 BGSMSX101.gar.corp.intel.com ([169.254.1.193]) with mapi id 14.03.0439.000;
 Tue, 24 Dec 2019 17:42:08 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/display: cleanup intel_bw_state on
 i915 module removal
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/display: cleanup intel_bw_state
 on i915 module removal
Thread-Index: AQHVr+fzeyTTfxDJYE6Ao8vVS2t8rqe0H8yAgAEowwCAASEFgIAAMZuAgAfMFYCACt9cMA==
Date: Tue, 24 Dec 2019 12:12:08 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F8236416A@BGSMSX104.gar.corp.intel.com>
References: <20191209143921.9240-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20191211055739.uxe46chnhkc2byul@ldmartin-desk1>
 <20191211064041.GA3339@plaxmina-desktop.iind.intel.com>
 <20191212002250.357dhphi3clst7qy@ldmartin-desk1>
 <20191212173717.GG85422@mdroper-desk1.amr.corp.intel.com>
 <20191212203449.e5ztqbkk7ljj2qqa@ldmartin-desk1>
 <20191217193905.6vyypeiwkt3omhvr@ldmartin-desk1.jf.intel.com>
In-Reply-To: <20191217193905.6vyypeiwkt3omhvr@ldmartin-desk1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>,
 David Airlie <airlied@linux.ie>, "Laxminarayan Bharadiya,
 Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Lucas De
>Marchi
>Sent: Wednesday, December 18, 2019 1:09 AM
>To: Roper, Matthew D <matthew.d.roper@intel.com>
>Cc: Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com>; David Airlie
><airlied@linux.ie>; Laxminarayan Bharadiya, Pankaj
><pankaj.laxminarayan.bharadiya@intel.com>; Summers, Stuart
><stuart.summers@intel.com>; dri-devel@lists.freedesktop.org; Vivi, Rodrigo
><rodrigo.vivi@intel.com>; intel-gfx@lists.freedesktop.org
>Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: cleanup intel_bw_state on i915
>module removal
>
>On Thu, Dec 12, 2019 at 12:34:49PM -0800, Lucas De Marchi wrote:
>>On Thu, Dec 12, 2019 at 09:37:17AM -0800, Matt Roper wrote:
>>>On Wed, Dec 11, 2019 at 04:22:50PM -0800, Lucas De Marchi wrote:
>>>>On Wed, Dec 11, 2019 at 12:10:41PM +0530, Bharadiya,Pankaj wrote:
>>>>> On Tue, Dec 10, 2019 at 09:57:39PM -0800, Lucas De Marchi wrote:
>>>>> > On Mon, Dec 09, 2019 at 08:09:02PM +0530, Pankaj Bharadiya wrote:
>>>>> > >intel_bw_state allocated memory is not getting freed even after
>>>>> > >module removal.
>>>>> > >
>>>>> > >kmemleak reported backtrace:
>>>>> > >
>>>>> > >   [<0000000079019739>] kmemdup+0x17/0x40
>>>>> > >   [<00000000d58c1b9d>] intel_bw_duplicate_state+0x1b/0x40 [i915]
>>>>> > >   [<000000007423ed0c>] drm_atomic_get_private_obj_state+0xca/0x140
>>>>> > >   [<00000000100e3533>] intel_bw_atomic_check+0x133/0x350 [i915]
>>>>> > >   [<00000000126d0e0c>] intel_atomic_check+0x1ab7/0x20d0 [i915]
>>>>> > >   [<00000000d5dfc004>] drm_atomic_check_only+0x563/0x810
>>>>> > >   [<00000000c9379611>] drm_atomic_commit+0xe/0x50
>>>>> > >   [<00000000ec82b765>] drm_atomic_helper_disable_all+0x133/0x160
>>>>> > >   [<000000003c44760c>] drm_atomic_helper_shutdown+0x65/0xc0
>>>>> > >   [<00000000414e3e5c>] i915_driver_remove+0xcb/0x130 [i915]
>>>>> > >   [<00000000f8544c2a>] i915_pci_remove+0x19/0x40 [i915]
>>>>> > >   [<000000002dcbd148>] pci_device_remove+0x36/0xb0
>>>>> > >   [<000000003c8c6b0a>] device_release_driver_internal+0xe0/0x1c0
>>>>> > >   [<00000000580e9566>] unbind_store+0xc3/0x120
>>>>> > >   [<00000000869d0df5>] kernfs_fop_write+0x104/0x190
>>>>> > >   [<000000004dc1a355>] vfs_write+0xb9/0x1d0
>>>>> >
>>>>> > what I find strange in this is that the last state was allocated
>>>>> > by the "driver remove" code path.
>>>>> >
>>>>> > >
>>>>> > >Call the drm_atomic_private_obj_fini(), which inturn calls the
>>>>> > >intel_bw_destroy_state() to make sure the intel_bw_state memory
>>>>> > >is freed properly.
>>>>> > >
>>>>> > >Signed-off-by: Pankaj Bharadiya
>>>>> > ><pankaj.laxminarayan.bharadiya@intel.com>
>>>>> > >---
>>>>> > >drivers/gpu/drm/i915/display/intel_bw.c      | 5 +++++
>>>>> > >drivers/gpu/drm/i915/display/intel_bw.h      | 1 +
>>>>> > >drivers/gpu/drm/i915/display/intel_display.c | 2 ++
>>>>> > >3 files changed, 8 insertions(+)
>>>>> > >
>>>>> > >diff --git a/drivers/gpu/drm/i915/display/intel_bw.c
>>>>> > >b/drivers/gpu/drm/i915/display/intel_bw.c
>>>>> > >index dcb66a33be9b..b228671d5a5d 100644
>>>>> > >--- a/drivers/gpu/drm/i915/display/intel_bw.c
>>>>> > >+++ b/drivers/gpu/drm/i915/display/intel_bw.c
>>>>> > >@@ -486,3 +486,8 @@ int intel_bw_init(struct drm_i915_private
>>>>> > >*dev_priv)
>>>>> > >
>>>>> > >	return 0;
>>>>> > >}
>>>>> > >+
>>>>> > >+void intel_bw_cleanup(struct drm_i915_private *dev_priv) {
>>>>> > >+	drm_atomic_private_obj_fini(&dev_priv->bw_obj);
>>>>> > >+}
>>>>> > >diff --git a/drivers/gpu/drm/i915/display/intel_bw.h
>>>>> > >b/drivers/gpu/drm/i915/display/intel_bw.h
>>>>> > >index 9db10af012f4..20b9ad241802 100644
>>>>> > >--- a/drivers/gpu/drm/i915/display/intel_bw.h
>>>>> > >+++ b/drivers/gpu/drm/i915/display/intel_bw.h
>>>>> > >@@ -25,6 +25,7 @@ struct intel_bw_state {
>>>>> > >
>>>>> > >void intel_bw_init_hw(struct drm_i915_private *dev_priv); int
>>>>> > >intel_bw_init(struct drm_i915_private *dev_priv);
>>>>> > >+void intel_bw_cleanup(struct drm_i915_private *dev_priv);
>>>>> > >int intel_bw_atomic_check(struct intel_atomic_state *state);
>>>>> > >void intel_bw_crtc_update(struct intel_bw_state *bw_state,
>>>>> > >			  const struct intel_crtc_state *crtc_state); diff --git
>>>>> > >a/drivers/gpu/drm/i915/display/intel_display.c
>>>>> > >b/drivers/gpu/drm/i915/display/intel_display.c
>>>>> > >index 3190aa27ffdc..756eb90b1bb1 100644
>>>>> > >--- a/drivers/gpu/drm/i915/display/intel_display.c
>>>>> > >+++ b/drivers/gpu/drm/i915/display/intel_display.c
>>>>> > >@@ -17912,6 +17912,8 @@ void intel_modeset_driver_remove(struct
>>>>> > >drm_i915_private *i915)
>>>>> > >
>>>>> > >	intel_gmbus_teardown(i915);
>>>>> > >
>>>>> > >+	intel_bw_cleanup(i915);
>>>>> >
>>>>> > This doesn't seem to match the (reverse) order of
>>>>> > intel_modeset_init()... but it's actually the gmbus_teardown()
>>>>> > that is out of place. Did you check if it's not a wrong shutdown ordering?
>>>>> >
>>>>>
>>>>> In intel_modeset_init(), intel_gmbus_setup() happens after
>>>>> intel_bw_init().
>>>>> I think the patch follows the reverse ordering properly.
>>>>> Am I missing anything?
>>>>
>>>>I said it seems that it's the gmbus_teardown() that is out of place.
>>>>Have you seen my comment above? Why are we duplicating the bw_state
>>>>on the module-remove code path?
>>>
>>>I think that part is legitimate.  Part of the module remove sequence
>>>does an atomic commit to turn everything off.  During atomic
>>>transactions, we create duplicates of all modesetting state objects
>>>can be modified; if/when the transaction succeeds, those duplicates
>>>are swapped into the actual driver state and the old objects are destroyed.
>>>Thus in cases like this where we forget to destroy a private object
>>>state, that leaked state structure will be the one allocated during
>>>the very last atomic transaction that happened (i.e., on the driver
>>>teardown codepath).
>>
>>humn, that makes sense. The new duplicate state will replace the
>>previous one and hence why we see it in the backtrace, rather than one
>>allocated previously.
>>
>>thanks
>>Lucas De Marchi
>
>and...
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Lucas De Marchi

Pushed the changes to dinq. Thanks for the patch and reviews.

Regards,
Uma Shankar

>>
>>>
>>>
>>>Matt
>>>
>>>>
>>>>Lucas De Marchi
>>>>
>>>>>
>>>>> Thanks,
>>>>> Pankaj
>>>>>
>>>>> > thanks
>>>>> > Lucas De Marchi
>>>>> >
>>>>> > >+
>>>>> > >	destroy_workqueue(i915->flip_wq);
>>>>> > >	destroy_workqueue(i915->modeset_wq);
>>>>> > >
>>>>> > >--
>>>>> > >2.23.0
>>>>> > >
>>>>> > >_______________________________________________
>>>>> > >Intel-gfx mailing list
>>>>> > >Intel-gfx@lists.freedesktop.org
>>>>> > >https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>>>
>>>--
>>>Matt Roper
>>>Graphics Software Engineer
>>>VTT-OSGC Platform Enablement
>>>Intel Corporation
>>>(916) 356-2795
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
