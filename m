Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCCA614B62
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 14:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0A610E3BC;
	Tue,  1 Nov 2022 13:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD5B10E210;
 Tue,  1 Nov 2022 13:09:53 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id 128so4747572vse.6;
 Tue, 01 Nov 2022 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p3byu4n9XkRAeDHMD0d9xBT+q5llot5CmRdKTseCksc=;
 b=K9IbhaAG8+VhBZYL9H3E2yRd3E3WngZS7SGAOFhGFDKhIpekjxK06uZG9AesR0EXuA
 ACF2rtAMUAj9ULLg39LESvzw93bEnKGQ3SnyydrfP4EOFal2mdzqkF8rgTgpv9TSiKXH
 qZIP0nU4AXlvIlmmOqlOn4AG+b6VMrg589qKXeh1X/XpQQNPHMQ0A//rH8MUea6RyYKs
 xw7xVXqtKpwchon1LUg+W3wwdXz/ixp1SXH6HyEneCYeg6cpBjcBAe4kh+NgXiVIXXla
 ixeUvFrNPuAqBUlBXOJngDrImzSX6szHoTvzA7VdGUw3ejBtUX6ROs7I3Juq5JuRotxy
 z44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p3byu4n9XkRAeDHMD0d9xBT+q5llot5CmRdKTseCksc=;
 b=i+Hbd5mdksQQDSU5pUVSfLYgStsgAOScWopBbayckNFl7hGMvCAjRtfzvK39Fnz3ZG
 3vMtNDkC+g7VF/7bqV57YJeGeYFhUsmaO1XEZ4r41fXMI5RXmM6ftipfwbpk9SAwteBY
 Kbg647RsuKNZUG8U7oXKYUsFwXk5sh5X9DrrWVr/Sl7N0VXkhMRdBvw+Nq5xxBT7ZPFp
 lzmxo/l9v/QHSVFB75zT2WKZpiFOqSjqtnRNR+0za5Ib9o3F0KKLRNMk/z3WOqS7/fyg
 g8NGjQeWsmQTSfc/lY6PuTEGMtOh1RYo1C2KCqESH24vsAE6qAYlqzvYDGHKuRK69noH
 W4xw==
X-Gm-Message-State: ACrzQf1fnyYMMUPBVY04EWVG3VIpwl8xTgqSupJ25hJaJG9BqhbEC7mC
 uMr0VcLcthNqXVdt6SWxMrNEeQ4ToWl441FJaWQ=
X-Google-Smtp-Source: AMsMyM7whVO6k3ftbq7OBUGfvVELYyq4U2doTQPoKukAnDwDy1es+6y+4F2CP82q/45EaPn8za9uY58VtNV+FJLBi30=
X-Received: by 2002:a05:6102:f9a:b0:3aa:1a11:2702 with SMTP id
 e26-20020a0561020f9a00b003aa1a112702mr7287015vsv.73.1667308192527; Tue, 01
 Nov 2022 06:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
 <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
 <Y1rllFeOnT9/PQVA@intel.com>
 <CAJfuBxw_YFvCtHMwVE0K0fa5GJbrZy4hTOSS9FebeDs6fxUUCA@mail.gmail.com>
 <Y1/In+ZBzNguVNoy@intel.com>
 <CAJfuBxxHNXHEWCEPXnPTh64dq4igaddnrU27NT=OHASmnxgudA@mail.gmail.com>
 <9ff84a99-e500-625e-ba9d-20cd752d7ff4@akamai.com> <Y2DeSlGI38fvzvED@intel.com>
In-Reply-To: <Y2DeSlGI38fvzvED@intel.com>
From: jim.cromie@gmail.com
Date: Tue, 1 Nov 2022 07:09:26 -0600
Message-ID: <CAJfuBxx97+ev55Ez4FNimTL77HVd9sGTSrgGfRVf6wPsEv_+RQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, Jason Baron <jbaron@akamai.com>,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 joe@perches.com, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 2:52 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Mon, Oct 31, 2022 at 08:20:54PM -0400, Jason Baron wrote:
> >
> >
> > On 10/31/22 6:11 PM, jim.cromie@gmail.com wrote:
> > > On Mon, Oct 31, 2022 at 7:07 AM Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > >> On Sun, Oct 30, 2022 at 08:42:52AM -0600, jim.cromie@gmail.com wrote=
:
> > >>> On Thu, Oct 27, 2022 at 2:10 PM Ville Syrj=C3=A4l=C3=A4
> > >>> <ville.syrjala@linux.intel.com> wrote:
> > >>>> On Thu, Oct 27, 2022 at 01:55:39PM -0600, jim.cromie@gmail.com wro=
te:
> > >>>>> On Thu, Oct 27, 2022 at 9:59 AM Ville Syrj=C3=A4l=C3=A4
> > >>>>> <ville.syrjala@linux.intel.com> wrote:
> > >>>>>> On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com w=
rote:
> > >>>>>>> On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com>=
 wrote:
> > >>>>>>>>
> > >>>>>>>>
> > >>>>>>>> On 10/21/22 05:18, Jani Nikula wrote:
> > >>>>>>>>> On Thu, 20 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@l=
inux.intel.com> wrote:
> > >>>>>>>>>> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> > >>>>>>>>>>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> > >>>>>>>>>>>> hi Greg, Dan, Jason, DRM-folk,
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> heres follow-up to V6:
> > >>>>>>>>>>>>    rebased on driver-core/driver-core-next for -v6 applied=
 bits (thanks)
> > >>>>>>>>>>>>    rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> It excludes:
> > >>>>>>>>>>>>    nouveau parts (immature)
> > >>>>>>>>>>>>    tracefs parts (I missed --to=3DSteve on v6)
> > >>>>>>>>>>>>    split _ddebug_site and de-duplicate experiment (way unr=
eady)
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> IOW, its the remaining commits of V6 on which Dan gave his=
 Reviewed-by.
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> If these are good to apply, I'll rebase and repost the res=
t separately.
> > >>>>>>>>>>> All now queued up, thanks.
> > >>>>>>>>>> This stuff broke i915 debugs. When I first load i915 no debu=
g prints are
> > >>>>>>>>>> produced. If I then go fiddle around in /sys/module/drm/para=
meters/debug
> > >>>>>>>>>> the debug prints start to suddenly work.
> > >>>>>>>>> Wait what? I always assumed the default behaviour would stay =
the same,
> > >>>>>>>>> which is usually how we roll. It's a regression in my books. =
We've got a
> > >>>>>>>>> CI farm that's not very helpful in terms of dmesg logging rig=
ht now
> > >>>>>>>>> because of this.
> > >>>>>>>>>
> > >>>>>>>>> BR,
> > >>>>>>>>> Jani.
> > >>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>> That doesn't sound good - so you are saying that prior to this=
 change some
> > >>>>>>>> of the drm debugs were default enabled. But now you have to ma=
nually enable
> > >>>>>>>> them?
> > >>>>>>>>
> > >>>>>>>> Thanks,
> > >>>>>>>>
> > >>>>>>>> -Jason
> > >>>>>>>
> > >>>>>>> Im just seeing this now.
> > >>>>>>> Any new details ?
> > >>>>>> No. We just disabled it as BROKEN for now. I was just today thin=
king
> > >>>>>> about sending that patch out if no solutin is forthcoming soon s=
ince
> > >>>>>> we need this working before 6.1 is released.
> > >>>>>>
> > >>>>>> Pretty sure you should see the problem immediately with any driv=
er
> > >>>>>> (at least if it's built as a module, didn't try builtin). Or at =
least
> > >>>>>> can't think what would make i915 any more special.
> > >>>>>>
> > >>>>> So, I should note -
> > >>>>> 99% of my time & energy on this dyndbg + drm patchset
> > >>>>> has been done using virtme,
> > >>>>> so my world-view (and dev-hack-test env) has been smaller, simple=
r
> > >>>>> maybe its been fatally simplistic.
> > >>>>>
> > >>>>> ive just rebuilt v6.0  (before the trouble)
> > >>>>> and run it thru my virtual home box,
> > >>>>> I didnt see any unfamiliar drm-debug output
> > >>>>> that I might have inadvertently altered somehow
> > >>>>>
> > >>>>> I have some real HW I can put a reference kernel on,0
> > >>>>> to look for the missing output, but its all gonna take some time,
> > >>>>> esp to tighten up my dev-test-env
> > >>>>>
> > >>>>> in the meantime, there is:
> > >>>>>
> > >>>>> config DRM_USE_DYNAMIC_DEBUG
> > >>>>> bool "use dynamic debug to implement drm.debug"
> > >>>>> default y
> > >>>>> depends on DRM
> > >>>>> depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> > >>>>> depends on JUMP_LABEL
> > >>>>> help
> > >>>>>    Use dynamic-debug to avoid drm_debug_enabled() runtime overhea=
ds.
> > >>>>>    Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
> > >>>>>    bytes per callsite, the .data costs can be substantial, and
> > >>>>>    are therefore configurable.
> > >>>>>
> > >>>>> Does changing the default fix things for i915 dmesg ?
> > >>>> I think we want to mark it BROKEN in addition to make sure no one
> > >>> Ok, I get the distinction now.
> > >>> youre spelling that
> > >>>    depends on BROKEN
> > >>>
> > >>> I have a notional explanation, and a conflating commit:
> > >>>
> > >>> can you eliminate
> > >>> git log -p ccc2b496324c13e917ef05f563626f4e7826bef1
> > >>>
> > >>> as the cause ?
> > >> Reverting that doesn't help.
> > >>
> > > thanks for eliminating it.
> > >
> > >>> I do need to clarify, I dont know exactly what debug/logging output
> > >>> is missing such that CI is failing
> > >> CI isn't failing. But any logs it produces are 100% useless,
> > >> as are any user reported logs.
> > >>
> > >> The debugs that are missing are anything not coming directly
> > >> from drm.ko.
> > >>
> > >> The stuff that I see being printed by i915.ko are drm_info()
> > >> and the drm_printer stuff from i915_welcome_messages(). That
> > >> also implies that drm_debug_enabled(DRM_UT_DRIVER) does at
> > >> least still work correctly.
> > >>
> > >> I suspect that the problem is just that the debug calls
> > >> aren't getting patched in when a module loads. And fiddling
> > >> with the modparam after the fact does trigger that somehow.
> > >>
> > > ok, heres the 'tape' of a virtme boot,
> > > then modprobe going wrong.
> > >
> > > [    1.785873] dyndbg:   2 debug prints in module intel_rapl_msr
> > > [    2.040598] virtme-init: udev is done
> > > virtme-init: console is ttyS0
> > >
> > >> load drm driver
> > > bash-5.2# modprobe i915
> > >
> > >> drm module is loaded 1st
> > > [    6.549451] dyndbg: add-module: drm.302 sites
> > > [    6.549991] dyndbg: class[0]: module:drm base:0 len:10 ty:0
> > > [    6.550647] dyndbg:  0: 0 DRM_UT_CORE
> > > [    6.551097] dyndbg:  1: 1 DRM_UT_DRIVER
> > > [    6.551531] dyndbg:  2: 2 DRM_UT_KMS
> > > [    6.551931] dyndbg:  3: 3 DRM_UT_PRIME
> > > [    6.552402] dyndbg:  4: 4 DRM_UT_ATOMIC
> > > [    6.552799] dyndbg:  5: 5 DRM_UT_VBL
> > > [    6.553270] dyndbg:  6: 6 DRM_UT_STATE
> > > [    6.553634] dyndbg:  7: 7 DRM_UT_LEASE
> > > [    6.554043] dyndbg:  8: 8 DRM_UT_DP
> > > [    6.554392] dyndbg:  9: 9 DRM_UT_DRMRES
> > > [    6.554776] dyndbg: module:drm attached 1 classes
> > > [    6.555241] dyndbg: 302 debug prints in module drm
> > >
> > >> here modprobe reads /etc/modprobe.d/drm-test.conf:
> > > options drm dyndbg=3D"class DRM_UT_CORE +p; class DRM_UT_DRIVER +p"
> > > and dyndbg applies it
> >
> > Hi,
> >
> > I'm a bit confused with this. My understanding is that there
> > is a 'regression' here from how this used to work. But the
> > 'class' keyword is new - are we sure this is the command-line
> > we are trying to fix?


the regression here is that previously, any late changes to drm.debug
are seen by all callers of drm_debug_enabled(), which checks the bits
when called.

Now, the change to drm.debug causes updates to currently loaded modules'
prdbgs.  But module loading of dependent modules is incomplete,
and those prdbgs are too late.


>
> The thing we need fixed is just the bog standard drm.debug=3D0xe etc.


my example was unfortunate, I repeated the test with
  options drm debug=3D0x1f

the results are the same, dyndbgs callback applies the class queries,
but the helper, driver modules arent yet loaded, so the class'd prdbgs
arent there to be enabled.

The Notional fix (Im working on it)

dyndbg gets static list of CLASSMAPS,

ddebug_attach_module_classes() can then distinguish the "owner"
of each classmap (the 1st module declaring it), from the subsequently
loaded modules (which reuse the same previously declared classmap)

as subsequent modules (say drm_kms_helper) refs the DRM_UT_* classmap
(just attached to drm module), ddebug_attach_module_classes() can
invoke the callback to reapply drm.debug to the newly loaded module.

or so I think.

> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
