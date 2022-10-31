Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B961407F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 23:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7226C10E1C6;
	Mon, 31 Oct 2022 22:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD83610E1C1;
 Mon, 31 Oct 2022 22:12:20 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id t14so5157185vsr.9;
 Mon, 31 Oct 2022 15:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7A9DWGJjHNFasKu7G8yAZu4sLh9bHGFfFLXIlcIQijo=;
 b=EvDm9F2Jj9rM2D0C+ubMr1rYbB6l4W3fmEXNT05ONlCJSvE2u8prbCrrmTb7DAbxdF
 LMuO/3GikbzO4uxxSObGpPo17SaF2hr6Sfv05hZ3PAbbtxCLyYUhbTULH/ygKlXiEiob
 6ESrXYRiVzEcPGXiINHhYDbqo/debd7qYBCMRrMAQzqxTUY6HBNvG+TFssFh07jlkFVq
 bc6WheWCbufV2MXTCF//tlMWFIpIRkiC0BxaFLkULDDk/PGfgqFcn3luuovEFmeU1UP2
 h7jI4Ptz+lq/9S9PYHWzDeJXvCSspA0Y5eswE7DcrSggRtKVuXwBmtAgCCaVbFhI16zh
 Za0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7A9DWGJjHNFasKu7G8yAZu4sLh9bHGFfFLXIlcIQijo=;
 b=drR854UDYlTauKg3xnsJ7SQifnj/B2J9u/rMaz/QQ6b6SxYZ5Pi/IGQK45tmYZMITT
 IiOxlCf6WQNp6ltxhy61G+zTDcy38dvr8rjtQFhes07WFvyqCt9jllr/Dmo1UDoL5Hq5
 ifo4DTgzWGbs6uqEiqP2Jq9J43EINz1SjrnZnYxno0T5hP+vxUAF84Hf5bwhbSeKtdGC
 JpzgHgNSA0XXiSyHsJz7Fzf+/cbyC6zrrDYfonUABLlwyLsZ5sE2IHVw3dWbuIlPODuj
 IZb3V7NV5hGcQOUhp6GWbf+MIdnw4vNDMWdsh/L9iybzC2bx0ZI4YSef49LMXHyEFK9Y
 Ao6w==
X-Gm-Message-State: ACrzQf3B7keRM/gKGKPr3q8Ctp8l8VIETJBotOeu2dNDXd3198ZigqzI
 5E20osTV2c6cgdlw5+4zLUZA/LZSgWQ1ArGkrzQ=
X-Google-Smtp-Source: AMsMyM6qFW3auipCo22Qx35noWxSNrRmq5+UxEFw0h7IC2/j4fPJ5p3ITVHoYrLaalFuVcKuBrWI+a3GDt2Xwjt6gWs=
X-Received: by 2002:a67:7041:0:b0:3a9:6f82:60d3 with SMTP id
 l62-20020a677041000000b003a96f8260d3mr6305476vsc.23.1667254339741; Mon, 31
 Oct 2022 15:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
 <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
 <Y1rllFeOnT9/PQVA@intel.com>
 <CAJfuBxw_YFvCtHMwVE0K0fa5GJbrZy4hTOSS9FebeDs6fxUUCA@mail.gmail.com>
 <Y1/In+ZBzNguVNoy@intel.com>
In-Reply-To: <Y1/In+ZBzNguVNoy@intel.com>
From: jim.cromie@gmail.com
Date: Mon, 31 Oct 2022 16:11:53 -0600
Message-ID: <CAJfuBxxHNXHEWCEPXnPTh64dq4igaddnrU27NT=OHASmnxgudA@mail.gmail.com>
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

On Mon, Oct 31, 2022 at 7:07 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Sun, Oct 30, 2022 at 08:42:52AM -0600, jim.cromie@gmail.com wrote:
> > On Thu, Oct 27, 2022 at 2:10 PM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Thu, Oct 27, 2022 at 01:55:39PM -0600, jim.cromie@gmail.com wrote:
> > > > On Thu, Oct 27, 2022 at 9:59 AM Ville Syrj=C3=A4l=C3=A4
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wr=
ote:
> > > > > > On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com>=
 wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On 10/21/22 05:18, Jani Nikula wrote:
> > > > > > > > On Thu, 20 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala=
@linux.intel.com> wrote:
> > > > > > > >> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> > > > > > > >>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrot=
e:
> > > > > > > >>>> hi Greg, Dan, Jason, DRM-folk,
> > > > > > > >>>>
> > > > > > > >>>> heres follow-up to V6:
> > > > > > > >>>>   rebased on driver-core/driver-core-next for -v6 applie=
d bits (thanks)
> > > > > > > >>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > > > > > > >>>>
> > > > > > > >>>> It excludes:
> > > > > > > >>>>   nouveau parts (immature)
> > > > > > > >>>>   tracefs parts (I missed --to=3DSteve on v6)
> > > > > > > >>>>   split _ddebug_site and de-duplicate experiment (way un=
ready)
> > > > > > > >>>>
> > > > > > > >>>> IOW, its the remaining commits of V6 on which Dan gave h=
is Reviewed-by.
> > > > > > > >>>>
> > > > > > > >>>> If these are good to apply, I'll rebase and repost the r=
est separately.
> > > > > > > >>>
> > > > > > > >>> All now queued up, thanks.
> > > > > > > >>
> > > > > > > >> This stuff broke i915 debugs. When I first load i915 no de=
bug prints are
> > > > > > > >> produced. If I then go fiddle around in /sys/module/drm/pa=
rameters/debug
> > > > > > > >> the debug prints start to suddenly work.
> > > > > > > >
> > > > > > > > Wait what? I always assumed the default behaviour would sta=
y the same,
> > > > > > > > which is usually how we roll. It's a regression in my books=
. We've got a
> > > > > > > > CI farm that's not very helpful in terms of dmesg logging r=
ight now
> > > > > > > > because of this.
> > > > > > > >
> > > > > > > > BR,
> > > > > > > > Jani.
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > That doesn't sound good - so you are saying that prior to thi=
s change some
> > > > > > > of the drm debugs were default enabled. But now you have to m=
anually enable
> > > > > > > them?
> > > > > > >
> > > > > > > Thanks,
> > > > > > >
> > > > > > > -Jason
> > > > > >
> > > > > >
> > > > > > Im just seeing this now.
> > > > > > Any new details ?
> > > > >
> > > > > No. We just disabled it as BROKEN for now. I was just today think=
ing
> > > > > about sending that patch out if no solutin is forthcoming soon si=
nce
> > > > > we need this working before 6.1 is released.
> > > > >
> > > > > Pretty sure you should see the problem immediately with any drive=
r
> > > > > (at least if it's built as a module, didn't try builtin). Or at l=
east
> > > > > can't think what would make i915 any more special.
> > > > >
> > > >
> > > > So, I should note -
> > > > 99% of my time & energy on this dyndbg + drm patchset
> > > > has been done using virtme,
> > > > so my world-view (and dev-hack-test env) has been smaller, simpler
> > > > maybe its been fatally simplistic.
> > > >
> > > > ive just rebuilt v6.0  (before the trouble)
> > > > and run it thru my virtual home box,
> > > > I didnt see any unfamiliar drm-debug output
> > > > that I might have inadvertently altered somehow
> > > >
> > > > I have some real HW I can put a reference kernel on,0
> > > > to look for the missing output, but its all gonna take some time,
> > > > esp to tighten up my dev-test-env
> > > >
> > > > in the meantime, there is:
> > > >
> > > > config DRM_USE_DYNAMIC_DEBUG
> > > > bool "use dynamic debug to implement drm.debug"
> > > > default y
> > > > depends on DRM
> > > > depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> > > > depends on JUMP_LABEL
> > > > help
> > > >   Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
> > > >   Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
> > > >   bytes per callsite, the .data costs can be substantial, and
> > > >   are therefore configurable.
> > > >
> > > > Does changing the default fix things for i915 dmesg ?
> > >
> > > I think we want to mark it BROKEN in addition to make sure no one
> >
> > Ok, I get the distinction now.
> > youre spelling that
> >   depends on BROKEN
> >
> > I have a notional explanation, and a conflating commit:
> >
> > can you eliminate
> > git log -p ccc2b496324c13e917ef05f563626f4e7826bef1
> >
> > as the cause ?
>
> Reverting that doesn't help.
>

thanks for eliminating it.

> >
> > I do need to clarify, I dont know exactly what debug/logging output
> > is missing such that CI is failing
>
> CI isn't failing. But any logs it produces are 100% useless,
> as are any user reported logs.
>
> The debugs that are missing are anything not coming directly
> from drm.ko.
>
> The stuff that I see being printed by i915.ko are drm_info()
> and the drm_printer stuff from i915_welcome_messages(). That
> also implies that drm_debug_enabled(DRM_UT_DRIVER) does at
> least still work correctly.
>
> I suspect that the problem is just that the debug calls
> aren't getting patched in when a module loads. And fiddling
> with the modparam after the fact does trigger that somehow.
>

ok, heres the 'tape' of a virtme boot,
then modprobe going wrong.

[    1.785873] dyndbg:   2 debug prints in module intel_rapl_msr
[    2.040598] virtme-init: udev is done
virtme-init: console is ttyS0

> load drm driver
bash-5.2# modprobe i915

> drm module is loaded 1st

[    6.549451] dyndbg: add-module: drm.302 sites
[    6.549991] dyndbg: class[0]: module:drm base:0 len:10 ty:0
[    6.550647] dyndbg:  0: 0 DRM_UT_CORE
[    6.551097] dyndbg:  1: 1 DRM_UT_DRIVER
[    6.551531] dyndbg:  2: 2 DRM_UT_KMS
[    6.551931] dyndbg:  3: 3 DRM_UT_PRIME
[    6.552402] dyndbg:  4: 4 DRM_UT_ATOMIC
[    6.552799] dyndbg:  5: 5 DRM_UT_VBL
[    6.553270] dyndbg:  6: 6 DRM_UT_STATE
[    6.553634] dyndbg:  7: 7 DRM_UT_LEASE
[    6.554043] dyndbg:  8: 8 DRM_UT_DP
[    6.554392] dyndbg:  9: 9 DRM_UT_DRMRES
[    6.554776] dyndbg: module:drm attached 1 classes
[    6.555241] dyndbg: 302 debug prints in module drm

> here modprobe reads /etc/modprobe.d/drm-test.conf:
options drm dyndbg=3D"class DRM_UT_CORE +p; class DRM_UT_DRIVER +p"
and dyndbg applies it

[    6.564284] dyndbg: module: drm dyndbg=3D"class DRM_UT_CORE +p; class
DRM_UT_DRIVER +p"
[    6.564957] dyndbg: query 0: "class DRM_UT_CORE +p" mod:drm
[    6.565348] dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
[    6.565836] dyndbg: op=3D'+'
[    6.566059] dyndbg: flags=3D0x1
[    6.566321] dyndbg: *flagsp=3D0x1 *maskp=3D0xffffffff
[    6.566875] dyndbg: parsed: func=3D"" file=3D"" module=3D"drm" format=3D=
""
lineno=3D0-0 class=3DDRM_UT_CORE
[    6.568753] dyndbg: applied: func=3D"" file=3D"" module=3D"drm" format=
=3D""
lineno=3D0-0 class=3DDRM_UT_CORE
[    6.569473] dyndbg: query 1: "class DRM_UT_DRIVER +p" mod:drm
[    6.570139] dyndbg: split into words: "class" "DRM_UT_DRIVER" "+p"
[    6.570522] dyndbg: op=3D'+'
[    6.570699] dyndbg: flags=3D0x1
[    6.570893] dyndbg: *flagsp=3D0x1 *maskp=3D0xffffffff
[    6.571200] dyndbg: parsed: func=3D"" file=3D"" module=3D"drm" format=3D=
""
lineno=3D0-0 class=3DDRM_UT_DRIVER
[    6.571778] dyndbg: no matches for query
[    6.572031] dyndbg: no-match: func=3D"" file=3D"" module=3D"drm"
format=3D"" lineno=3D0-0 class=3DDRM_UT_DRIVER
[    6.572615] dyndbg: processed 2 queries, with 61 matches, 0 errs
[    6.573286] ACPI: bus type drm_connector registered

next required module is loaded, but drm.debug isnt propagated.

[    6.578645] dyndbg: add-module: drm_kms_helper.94 sites
[    6.579487] dyndbg: class[0]: module:drm_kms_helper base:0 len:10 ty:0
[    6.580639] dyndbg:  0: 0 DRM_UT_CORE
[    6.581135] dyndbg:  1: 1 DRM_UT_DRIVER
[    6.581651] dyndbg:  2: 2 DRM_UT_KMS
[    6.582178] dyndbg:  3: 3 DRM_UT_PRIME
[    6.582927] dyndbg:  4: 4 DRM_UT_ATOMIC
[    6.583627] dyndbg:  5: 5 DRM_UT_VBL
[    6.584350] dyndbg:  6: 6 DRM_UT_STATE
[    6.584999] dyndbg:  7: 7 DRM_UT_LEASE
[    6.585699] dyndbg:  8: 8 DRM_UT_DP
[    6.586354] dyndbg:  9: 9 DRM_UT_DRMRES
[    6.587040] dyndbg: module:drm_kms_helper attached 1 classes
[    6.588103] dyndbg:  94 debug prints in module drm_kms_helper

and so on

[    6.595628] dyndbg: add-module: drm_display_helper.150 sites
[    6.596442] dyndbg: class[0]: module:drm_display_helper base:0 len:10 ty=
:0
[    6.597453] dyndbg:  0: 0 DRM_UT_CORE
...
[    6.601678] dyndbg: module:drm_display_helper attached 1 classes
[    6.602335] dyndbg: 150 debug prints in module drm_display_helper

[    6.692760] dyndbg: add-module: i915.1657 sites
[    6.693023] dyndbg: class[0]: module:i915 base:0 len:10 ty:0
[    6.693323] dyndbg:  0: 0 DRM_UT_CORE
....
[    6.695220] dyndbg: module:i915 attached 1 classes
[    6.695463] dyndbg: 1657 debug prints in module i915
bash-5.2#
bash-5.2#


So, what I think I need to add:

ddebug_add_module()  scans the module being loaded,
looking for a param thats wired to dyndbg's modparam callback.
Then it calls that callback, with the val of the sysfs-node
(drm.debug in this case), and the module (i915)

the callback will then run the query to enable callsites per drm.debug.

I'll guess the kparams I need to find are in a section somewhere
Anyone want to toss a lawn-dart at the code I need to look at, copy ?

> --
> Ville Syrj=C3=A4l=C3=A4
> Intel

thanks again
Jim
