Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F12610218
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 21:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EFF10E6D3;
	Thu, 27 Oct 2022 19:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE0910E033;
 Thu, 27 Oct 2022 19:56:06 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id e2so1386382vkd.13;
 Thu, 27 Oct 2022 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTHkMF5AYaJe86KSKSivOBUTyiiz/DT6VONprpQISZY=;
 b=AcVgGPFV4XFU+4opW5D6NQQmov1f6MruK2ECWfzufhi2CugH/KgRERclmljMIXWOQT
 3c2vXrfilt5zv6tXmjkI+zfr8RiPz0BP8KREqPLzV0p2E600YN0pNFO4+KmmGIEIYPeS
 7CwKH7xV1Gci59W1q5kz43y+pIOQVqVymoH2j/HBcXQQaKLCYT9ZD95/+wWwzCsTgNL9
 TTO+j871MWK/+LTnKlMy7VWgA/Eass/r3XHoizDq4y48UJpoI86mcUKZJPwYx4ViX/5T
 WwlmeX9RG5X6KnPIDqIECQ0mSI9OjjlgjPcpLXC/VdWvev6Hlg5ch0wGdQp1tyvKa/kr
 bFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTHkMF5AYaJe86KSKSivOBUTyiiz/DT6VONprpQISZY=;
 b=tsHLPr6Us+Zm7B7QWRZ0yqNCynpNobNslL4ZcXNpcs7FuA+spQmqZrkkIwBTbAVbWH
 E2ZFssmWk76vQFBv3e4OieOwBTUhud02AXOioroMhnxMBLgjn0KJntxEEPTORChuPDj5
 IrafZPZwz71GOpxOL/0w72WbUErqDJuk939Qp4YhnSoIa3bZmE7nTL5eLrYBVIyATMrb
 pv5vd0+Axq+uKywyj+AAOj20Rysukg7AwTqHVzM/WpZfX63j2ChMH4s0tRl9Ah0k5wLX
 0B+9a5MKKLxGTQzXRTwrRbW2xuHcTBGuX4k2lqiGFmMThU153yF6vzLYM3bl3ETSpK6F
 phKw==
X-Gm-Message-State: ACrzQf1xEHu9mMThQDTKDP0vAx7G/jb7tyijp9cFuyPSgJJ2qYo9H+w7
 rnzCTAcqFM6dP16JLH1riSNDncuIX5plP4Da6KE=
X-Google-Smtp-Source: AMsMyM69fFfshbe+9+iuZE08oNfMkunP4YgdbieU5QoOpV4Oq/ayeJSAxM8QUzgGG1Gpn7RmsLm2YxlxZGQCNnLmGbs=
X-Received: by 2002:a1f:1e12:0:b0:3a3:6ce9:3f11 with SMTP id
 e18-20020a1f1e12000000b003a36ce93f11mr27088613vke.15.1666900565787; Thu, 27
 Oct 2022 12:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
In-Reply-To: <Y1qqurH/lG0u+3ky@intel.com>
From: jim.cromie@gmail.com
Date: Thu, 27 Oct 2022 13:55:39 -0600
Message-ID: <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
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

On Thu, Oct 27, 2022 at 9:59 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wrote:
> > On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wrote:
> > >
> > >
> > >
> > > On 10/21/22 05:18, Jani Nikula wrote:
> > > > On Thu, 20 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.i=
ntel.com> wrote:
> > > >> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> > > >>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> > > >>>> hi Greg, Dan, Jason, DRM-folk,
> > > >>>>
> > > >>>> heres follow-up to V6:
> > > >>>>   rebased on driver-core/driver-core-next for -v6 applied bits (=
thanks)
> > > >>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > > >>>>
> > > >>>> It excludes:
> > > >>>>   nouveau parts (immature)
> > > >>>>   tracefs parts (I missed --to=3DSteve on v6)
> > > >>>>   split _ddebug_site and de-duplicate experiment (way unready)
> > > >>>>
> > > >>>> IOW, its the remaining commits of V6 on which Dan gave his Revie=
wed-by.
> > > >>>>
> > > >>>> If these are good to apply, I'll rebase and repost the rest sepa=
rately.
> > > >>>
> > > >>> All now queued up, thanks.
> > > >>
> > > >> This stuff broke i915 debugs. When I first load i915 no debug prin=
ts are
> > > >> produced. If I then go fiddle around in /sys/module/drm/parameters=
/debug
> > > >> the debug prints start to suddenly work.
> > > >
> > > > Wait what? I always assumed the default behaviour would stay the sa=
me,
> > > > which is usually how we roll. It's a regression in my books. We've =
got a
> > > > CI farm that's not very helpful in terms of dmesg logging right now
> > > > because of this.
> > > >
> > > > BR,
> > > > Jani.
> > > >
> > > >
> > >
> > > That doesn't sound good - so you are saying that prior to this change=
 some
> > > of the drm debugs were default enabled. But now you have to manually =
enable
> > > them?
> > >
> > > Thanks,
> > >
> > > -Jason
> >
> >
> > Im just seeing this now.
> > Any new details ?
>
> No. We just disabled it as BROKEN for now. I was just today thinking
> about sending that patch out if no solutin is forthcoming soon since
> we need this working before 6.1 is released.
>
> Pretty sure you should see the problem immediately with any driver
> (at least if it's built as a module, didn't try builtin). Or at least
> can't think what would make i915 any more special.
>

So, I should note -
99% of my time & energy on this dyndbg + drm patchset
has been done using virtme,
so my world-view (and dev-hack-test env) has been smaller, simpler
maybe its been fatally simplistic.

ive just rebuilt v6.0  (before the trouble)
and run it thru my virtual home box,
I didnt see any unfamiliar drm-debug output
that I might have inadvertently altered somehow

I have some real HW I can put a reference kernel on,0
to look for the missing output, but its all gonna take some time,
esp to tighten up my dev-test-env

in the meantime, there is:

config DRM_USE_DYNAMIC_DEBUG
bool "use dynamic debug to implement drm.debug"
default y
depends on DRM
depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
depends on JUMP_LABEL
help
  Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
  Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
  bytes per callsite, the .data costs can be substantial, and
  are therefore configurable.

Does changing the default fix things for i915 dmesg ?
or is the problem deeper ?

theres also this Makefile addition, which I might have oversimplified

CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) +=3D -DDYNAMIC_DEBUG_MODULE
