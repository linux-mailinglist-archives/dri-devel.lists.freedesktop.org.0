Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AF8CB1FD
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 18:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487C210E157;
	Tue, 21 May 2024 16:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eRXQGHFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994D89D7F;
 Tue, 21 May 2024 16:12:48 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-5f415fd71f8so478977a12.3; 
 Tue, 21 May 2024 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716307968; x=1716912768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCvtAT9yL4bsyunfEMr4mUSenqzklzI9+JXqeALbOyQ=;
 b=eRXQGHFwb86Oaj0T29EtKcSU4uW880AH0ISYNJWHrwOkJgejuUr1DAPMppjOouip6v
 JnKiQOipxT+zf+3rnpylLxlnj98zQYwbArlnVLgONq3t8y6fvkfA+ZaFZL7Yx3IJaeD9
 e9X2n8hOkIfBJfq8PTdOQBATHDPB4dnoauMNSxDYrkmkpaq3/L8bMzV2G/xfvClkDOiI
 rlOZ3HT4PDGA28LpSWeCOpbZFJkAAjkfYR8ZXv1VRxg+W0ctWJJG8ckpVHUgn30v1kvN
 VfJ8Hnz/wmFXb4i29QzNdDwjltAmerSoauDGgyQruljtek/rEIoxK58fer+rJoN25NcE
 kD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716307968; x=1716912768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCvtAT9yL4bsyunfEMr4mUSenqzklzI9+JXqeALbOyQ=;
 b=MbFzJpXY4LWeJTWNbwFw3FdPLT4AJcWTJ+WEisnHuvtd1kNebn5HFrki4q4XOIdoQU
 XUr54ML4UjuwspQv6wxz4iOH25hwNgxqy+kFvOvnlPr4qrzGxzWd2PIWrTBv6CE5/2Y0
 VNljyJoojgKIVCMsGrcD3rHjoTWCBynZp/IHggjptjtjfrBe16q/+eqstpAtkAwW/W/w
 vMQWnGEgeh96F/mvpbjUIY6nsTEluqxSKO5Qh4Xka36vMqU/fbkTOxFRd5C1AGE8pK7C
 2V2dhqTUmmpBv7zxKZHgAF6t0UG7GAA2qaQpZPDX8slAxktPow+y6IRZ23a5S89fCsM1
 tsUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz1Se5QPTpU3hFfDPfNUHxAfUUgJLfOc7gfTnc/KTTOkK9EghfOvixVUHr4M6Dov74wSgbp/Ro8/ORPengk3RLicJBikqGYkqYl7V94eHTVveJ/8IPMpV4KZTF3EuloppQA+82c7A1XKxFHMi4wnNvU5H4q1q5fsHowwx0yRbKN8chzkrnbUz1bR0Cl6ajWA==
X-Gm-Message-State: AOJu0YwrNdNi7eEd87MtN4urKooU65IS6ZHlvYY6BrolrRTxyKzwAm+H
 PsBFDUS/g4CSfIZNMBjO9/HJu5GY4kOBV2KoPlHNYviihcew6ZFky71D8mT9LNPQ6XA93DXq5xj
 KWj4zB961IJ82q6eq2H1uSnCqmOk=
X-Google-Smtp-Source: AGHT+IHAP3KDnJJS0O7SkGfKIP7uk1EKp+f8X1mluB24KubBN9tLU3rOHMtfN8y0ky6xkTXQo2yflL/anOYUpzKLWLA=
X-Received: by 2002:a17:90a:eb07:b0:2a3:10d3:239d with SMTP id
 98e67ed59e1d1-2b6ccd6bbbdmr28841420a91.32.1716307967824; Tue, 21 May 2024
 09:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
 <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
 <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
 <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
 <CO6PR12MB5489FA9307280A4442BAD51DFCE72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <87wmo2hver.fsf@intel.com> <6f66e479-2f5a-477a-9705-dca4a3606760@amd.com>
 <83df4e94-e1ec-42f6-8a15-6439ef4a25b7@leemhuis.info>
In-Reply-To: <83df4e94-e1ec-42f6-8a15-6439ef4a25b7@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 May 2024 12:12:36 -0400
Message-ID: <CADnq5_P+WsL8B6B2vK5ENe8VWdvheoHyxoUfgF3Oex8Gvp7Lbg@mail.gmail.com>
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 "Lin, Wayne" <Wayne.Lin@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 "lyude@redhat.com" <lyude@redhat.com>,
 "imre.deak@intel.com" <imre.deak@intel.com>, 
 =?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've got it teed up.  Is drm-misc-fixes the right branch since we are
in the merge window?

Alex

On Tue, May 21, 2024 at 7:20=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> Hmm, from here it looks like the patch now that it was reviewed more
> that a week ago is still not even in -next. Is there a reason?
>
> I know, we are in the merge window. But at the same time this is a fix
> (that already lingered on the lists for way too long before it was
> reviewed) for a regression in a somewhat recent kernel, so it in Linus
> own words should be "expedited"[1].
>
> Or are we again just missing a right person for the job in the CC?
> Adding Dave and Sima just in case.
>
> Ciao, Thorsten
>
> [1]
> https://lore.kernel.org/all/CAHk-=3Dwis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6=
SRUwQUBQ@mail.gmail.com/
>
> On 12.05.24 18:11, Limonciello, Mario wrote:
> > On 5/10/2024 4:24 AM, Jani Nikula wrote:
> >> On Fri, 10 May 2024, "Lin, Wayne" <Wayne.Lin@amd.com> wrote:
> >>>> -----Original Message-----
> >>>> From: Limonciello, Mario <Mario.Limonciello@amd.com>
> >>>> Sent: Friday, May 10, 2024 3:18 AM
> >>>> To: Linux regressions mailing list <regressions@lists.linux.dev>;
> >>>> Wentland, Harry
> >>>> <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> >>>> Cc: lyude@redhat.com; imre.deak@intel.com; Leon Wei=C3=9F
> >>>> <leon.weiss@ruhr-uni-
> >>>> bochum.de>; stable@vger.kernel.org; dri-devel@lists.freedesktop.org;
> >>>> amd-
> >>>> gfx@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> >>>> Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
> >>>> drm_dp_add_payload_part2
> >>>>
> >>>> On 5/9/2024 07:43, Linux regression tracking (Thorsten Leemhuis) wro=
te:
> >>>>> On 18.04.24 21:43, Harry Wentland wrote:
> >>>>>> On 2024-03-07 01:29, Wayne Lin wrote:
> >>>>>>> [Why]
> >>>>>>> Commit:
> >>>>>>> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
> >>>>>>> allocation/removement") accidently overwrite the commit
> >>>>>>> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in
> >>>>>>> drm_dp_add_payload_part2") which cause regression.
> >>>>>>>
> >>>>>>> [How]
> >>>>>>> Recover the original NULL fix and remove the unnecessary input
> >>>>>>> parameter 'state' for drm_dp_add_payload_part2().
> >>>>>>>
> >>>>>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
> >>>>>>> allocation/removement")
> >>>>>>> Reported-by: Leon Wei=C3=9F <leon.weiss@ruhr-uni-bochum.de>
> >>>>>>> Link:
> >>>>>>> https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc=
8.c
> >>>>>>> amel@ruhr-uni-bochum.de/
> >>>>>>> Cc: lyude@redhat.com
> >>>>>>> Cc: imre.deak@intel.com
> >>>>>>> Cc: stable@vger.kernel.org
> >>>>>>> Cc: regressions@lists.linux.dev
> >>>>>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> >>>>>>
> >>>>>> I haven't been deep in MST code in a while but this all looks pret=
ty
> >>>>>> straightforward and good.
> >>>>>>
> >>>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >>>>>
> >>>>> Hmmm, that was three weeks ago, but it seems since then nothing
> >>>>> happened to fix the linked regression through this or some other
> >>>>> patch. Is there a reason? The build failure report from the CI mayb=
e?
> >>>>
> >>>> It touches files outside of amd but only has an ack from AMD.  I
> >>>> think we
> >>>> /probably/ want an ack from i915 and nouveau to take it through.
> >>>
> >>> Thanks, Mario!
> >>>
> >>> Hi Thorsten,
> >>> Yeah, like what Mario said. Would also like to have ack from i915 and
> >>> nouveau.
> >>
> >> It usually works better if you Cc the folks you want an ack from! ;)
> >>
> >> Acked-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >
> > Thanks! Can someone with commit permissions take this to drm-misc?
> >
> >
> >
