Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99460B53D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 20:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE0F10E01F;
	Mon, 24 Oct 2022 18:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B476E10E01F;
 Mon, 24 Oct 2022 18:16:58 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so3409309ejc.4;
 Mon, 24 Oct 2022 11:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+JrNSRhjhtNV1zUqz7edpRKlS25HhVnyp4v0GBc4I2k=;
 b=ErkAFu7vQ+RBqYgeFehxt5BmnnafaJRcp/J6XrZBMltuDAwsk+ZPyYCSeKnRyGz/Sp
 dDOMvbSyY3mE7N7MjIuEcBXWAht8+kD32rReIf9SODzLlyspABIHJAu7a+NkjgmtaAyc
 tBJSGSxQCMNS/ACztDbo8nICwOhDh1RDaE8xNgzRq+6XmDyogdZnl4ZTOKaVXxzgJbIy
 VaxUpWY0P3T7Eu/TWltRThvrPiJPyeRJgky4HmOjKTw7+pUBhG7zPN/NlEpJEG1iqBq/
 vsp+c1OLhjriwmA0dLuwhqIHDFrTf4xW3JGeWyCd0K+eL9w2pTETY9aWjl7iO0ZMXRd4
 NGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+JrNSRhjhtNV1zUqz7edpRKlS25HhVnyp4v0GBc4I2k=;
 b=XHschV6J1ApuC/3a4hxiH4k07AHThGgscsWfpwoHOCOQZxrZTNHhtThIVgTNI1lmj5
 9NvLZcumvlz+YYWtuSnEcV0AxTyqj2268549hETvdCWAhiCz8+L/6x4ZJpIbYs8ywqJG
 Re9+aIX+ZlAocAjr6DgFWahvJH+ZYKUIusf5v6oWrByXZZLs1LLFC77Nx+Jk58t0RL4M
 sg/qA5Pv9CbOm19AcDjHhVVNUsXAl3uvNttT0SbYMfNhwxffNbW/+MCruzTQ/US4n0Em
 06sQT8UmhvfRZVW4uAmxJIsapFKm8ALj7U8g5isRmBcTd/U/zMz9YJkXLpu/UMM86po7
 bnFg==
X-Gm-Message-State: ACrzQf2n2pNIGSxZMJdcLh/r4MmHCEISttOdfHZMDQsibKq1o7qoXjYK
 YRYmWCXhiBX78jx1sSsVuvw=
X-Google-Smtp-Source: AMsMyM6gpc2iC1XRiikzm5JVRf4wy/DI9YhN4byrr6CdQ7etiOjJdXHw+g4OSdOk6ZDruTsK4AzV2w==
X-Received: by 2002:a17:907:2d09:b0:78d:4240:a45e with SMTP id
 gs9-20020a1709072d0900b0078d4240a45emr29214915ejc.350.1666635416970; 
 Mon, 24 Oct 2022 11:16:56 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.84])
 by smtp.googlemail.com with ESMTPSA id
 t23-20020a170906179700b00782cd82db09sm212396eje.106.2022.10.24.11.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 11:16:56 -0700 (PDT)
Message-ID: <3de34172-f489-5a12-ca86-9552493394af@gmail.com>
Date: Mon, 24 Oct 2022 21:16:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
 <Y1a2Eb1rwMyk35v+@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <Y1a2Eb1rwMyk35v+@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, maxime@cerno.tech,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.10.2022 18.58, Ville Syrjälä wrote:
> On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
>> On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
>>>
>>> Hi,
>>>
>>> I've discussing the idea for the past year to add an IGT test suite that
>>> all well-behaved KMS drivers must pass.
>>>
>>> The main idea behind it comes from v4l2-compliance and cec-compliance,
>>> that are being used to validate that the drivers are sane.
>>>
>>> We should probably start building up the test list, and eventually
>>> mandate that all tests pass for all the new KMS drivers we would merge
>>> in the kernel, and be run by KCi or similar.
>>
>> Let's get https://patchwork.freedesktop.org/patch/502641/ merged
>> first, that already gives us a mechanism similar to what we use in
>> mesa to track pass/fail/flake
>>
>> Beyond that, I think some of the igt tests need to get more stable
>> before we could consider a "mustpass" list.  The kms_lease tests seem
>> to fail on msm due to bad assumptions in the test about which CRTCs
>> primary planes can attach to.  The legacy-cursor crc tests seem a bit
>> racy (there was a patch posted for that, not sure if it landed yet),
>> etc.
> 
> I think the safest set to start with would be pure uapi validation
> stuff. Anything that interactics with real world hardware is a much
> tougher cookie.
> 

I agree with Ville

As is with different pixel formats on different kms crc tests there are 
specialities just to make crcs happy hence I think crc tests will need 
to be carefully chosen for this type test set.

And as for those legacy cursor tests to be included people first need 
consensus across drivers how those tests are supposed to work and then 
strip out platform specific quirks from those tests.

/Juha-Pekka

>>
>> The best thing to do is actually start running CI and tracking xfails
>> and flakes ;-)
>>
>> BR,
>> -R
>>
>>> I did a first pass to create a draft of such a test-suite, which would
>>> contain:
>>>
>>> igt@core_auth@basic-auth
>>> igt@core_auth@getclient-master-drop
>>> igt@core_auth@getclient-simple
>>> igt@core_auth@many-magics
>>> igt@core_getclient
>>> igt@core_getstats
>>> igt@core_getversion
>>> igt@core_hotunplug@hotrebind-lateclose
>>> igt@core_hotunplug@hotunbind-rebind
>>> igt@core_hotunplug@unbind-rebind
>>> igt@core_setmaster
>>> igt@core_setmaster_vs_auth
>>> igt@device_reset@unbind-reset-rebind
>>> igt@drm_read
>>> igt@dumb_buffer
>>> igt@fbdev
>>> igt@feature_discovery@display
>>> igt@kms_3d
>>> igt@kms_addfb_basic
>>> igt@kms_async_flips
>>> igt@kms_color
>>> igt@kms_concurrent
>>> igt@kms_cursor_crc
>>> igt@kms_cursor_edge_walk
>>> igt@kms_cursor_legacy@basic-busy-flip-before-cursor
>>> igt@kms_cursor_legacy@basic-flip-after-cursor
>>> igt@kms_cursor_legacy@basic-flip-after-cursor
>>> igt@kms_display_modes
>>> igt@kms_dither
>>> igt@kms_dp_aux_dev
>>> igt@kms_flip@basic-flip-vs-dpms
>>> igt@kms_flip@basic-flip-vs-modeset
>>> igt@kms_flip@basic-flip-vs-wf_vblank
>>> igt@kms_flip@basic-plain-flip
>>> igt@kms_flip_event_leak@basic
>>> igt@kms_force_connector_basic@force-connector-state
>>> igt@kms_force_connector_basic@force-edid
>>> igt@kms_force_connector_basic@force-load-detect
>>> igt@kms_force_connector_basic@prune-stale-modes
>>> igt@kms_getfb
>>> igt@kms_hdmi_inject
>>> igt@kms_hdr
>>> igt@kms_invalid_mode
>>> igt@kms_lease
>>> igt@kms_panel_fitting
>>> igt@kms_pipe_crc_basic
>>> igt@kms_plane_alpha_blend
>>> igt@kms_plane
>>> igt@kms_plane_cursor
>>> igt@kms_plane_lowres
>>> igt@kms_plane_multiple
>>> igt@kms_plane_scaling
>>> igt@kms_prop_blob
>>> igt@kms_properties
>>> igt@kms_rmfb
>>> igt@kms_scaling_modes
>>> igt@kms_sequence
>>> igt@kms_setmode
>>> igt@kms_sysfs_edid_timing
>>> igt@kms_tv_load_detect
>>> igt@kms_universal_plane
>>> igt@kms_vblank
>>> igt@kms_vrr
>>> igt@kms_writeback
>>>
>>> Most of them are skipped on vc4 right now, but I could see that some of
>>> them fail already (kms_rmfb, core_hotunplug), so it proves to be useful
>>> already.
>>>
>>> What do you think? Is there some more tests needed, or did I include
>>> some tests that shouldn't have been there?
>>>
>>> Thanks!
>>> Maxime
> 

