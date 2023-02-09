Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DBD690D6D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26410EB24;
	Thu,  9 Feb 2023 15:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C384710EB24
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:45:25 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id l15so1132682vkd.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 07:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqrEeOYy3mjqh5KmY+3gTVjzv8Do3LhWFceA0QbUl+Q=;
 b=QPhmCpMd6ZPgvRGEQa4k/r0HMG+R8wiKBF803a4KjRNUmfaoIIFAc2uCF46INTnhLM
 vaZbHXCdTMO68szrINPHDbqFen2qNdxCGL3IYrhajFTsYXd2EXax9Ne0lzSzxukIMOVh
 /sB9flevqoes/H9c4f0s8BgrpQDlyXHB4vd28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqrEeOYy3mjqh5KmY+3gTVjzv8Do3LhWFceA0QbUl+Q=;
 b=1dNnAH78XBqL/188CCWAild3EMywpIR7U4ITGkATJtxebe51/DWlwl2WdX+bS1KHyC
 K4NsHNn3odS2XLZ22yVPu3hOXwi75Bo/B1JvULmy+3kndDvbK4YTGNxHO3aksGw75s5O
 hsYdEbk0/F6F1dKRB8e8QmN/oSyqQ1AXo7YvDttg4eG6X2rz7gUtpkdhQkS+yyQr3weZ
 qv+fCqjK5Ysqm7SsrHjyZKTfkynPQGC5lmNC0N8eFchNOAiu2WtLn1DEco3E2k9jUxtE
 uqRlRKVEPqr8Xx/YU1EqOZwM3GtxSRLMcpBbCwH+tQ6cI+ffNBfz4XtFRDJgcVi85eOG
 vVFA==
X-Gm-Message-State: AO0yUKVrYmwDl/85Myi1Yh4A5F/je4PqEZqrCQk2QK9wlkfhY0tzuhNT
 u6NQGmXrFj2xCe8OofPE4dfjbWdlc9Sc3f1SR/k=
X-Google-Smtp-Source: AK7set+r3x5qIamZUz4jpem6sFqmUnT2fmI27Mxoshi2lGXJ9jyu/dHIidN/AmzT/eNCRf+8ifdQZg==
X-Received: by 2002:a05:6122:17a5:b0:401:c0c:3209 with SMTP id
 o37-20020a05612217a500b004010c0c3209mr3082572vkf.6.1675957524284; 
 Thu, 09 Feb 2023 07:45:24 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 x79-20020a1f3152000000b003b89f00e276sm150508vkx.40.2023.02.09.07.45.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 07:45:23 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id v26so2528381vsk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 07:45:23 -0800 (PST)
X-Received: by 2002:a67:6743:0:b0:411:c22d:8433 with SMTP id
 b64-20020a676743000000b00411c22d8433mr837593vsc.73.1675957523229; Thu, 09 Feb
 2023 07:45:23 -0800 (PST)
MIME-Version: 1.0
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
 <BN0PR02MB8142207261497BE76A6EA07096D99@BN0PR02MB8142.namprd02.prod.outlook.com>
 <BN0PR02MB81426F878B10DDF4AD2F95A896D99@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB81426F878B10DDF4AD2F95A896D99@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Feb 2023 07:45:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WP_XLpvnLe8qDTOYNuhZBCf-PynPa-SOMdfUFEWCYYvg@mail.gmail.com>
Message-ID: <CAD=FV=WP_XLpvnLe8qDTOYNuhZBCf-PynPa-SOMdfUFEWCYYvg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Reserve DSPPs based on user request
To: Kalyan Thota <kalyant@qti.qualcomm.com>
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 9, 2023 at 3:26 AM Kalyan Thota <kalyant@qti.qualcomm.com> wrot=
e:
>
> Kindly ignore my previous email. Sent too early !!
>
> We have tested the changes on top of tip: https://chromium.googlesource.c=
om/chromiumos/third_party/kernel/+log/refs/heads/chromeos-5.15 + 5 CTM patc=
hes ( that you have quoted )
> We didn=E2=80=99t see the issue that you have reported on herobrine. Nigh=
t light always came up on primary display as the reservation with dspp was =
successful.  Are you seeing any reservation failures for primary display ?
>
> Attached a debug patch, can you share the logs when you see the issue.

Sounds good. Since officially this hardware is not available to the
public at this time, I have shared the `dmesg` privately to your (and
Abhinav's) Google partner accounts. Yell if you don't see the
notificatioin. I don't have any reason to believe there's anything
secret in the dmesg, but it didn't seem worth the time to fully audit
it.

For that dmesg, I:

1. Made sure that night light was off.

2. Updated the kernel with the 5 patches + the debug patch.

3. Booted up and logged into ChromeOS

4. Tried turning night light off/on several times and saw nothing on
dmesg while I did this (and night light didn't work)

5. Unplugged power and servo (just to make sure they didn't interfere)

6. Echoed "DOUG: plug in external display now" several times to "/dev/kmsg"

7. Plugged in my external display, which is behind a Type C dock

8. Turned night light on/off several times. Night light worked on the
internal display.

In case it matters, my ChromeOS root filesystem is R111-15328.0.0


> >-----Original Message-----
> >From: Kalyan Thota
> >Sent: Thursday, February 9, 2023 9:47 AM
> >To: Doug Anderson <dianders@chromium.org>; Kalyan Thota (QUIC)
> ><quic_kalyant@quicinc.com>
> >Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> >freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> >kernel@vger.kernel.org; robdclark@chromium.org; swboyd@chromium.org;
> >Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
> >dmitry.baryshkov@linaro.org; Abhinav Kumar (QUIC)
> ><quic_abhinavk@quicinc.com>; marijn.suijten@somainline.org
> >Subject: RE: [PATCH v3 0/4] Reserve DSPPs based on user request
> >
> >Hi Doug,
> >
> >Have you picked the core change to program dspp's  (below) ? the current=
 series
> >will go on top of it.
> >https://patchwork.kernel.org/project/linux-arm-msm/patch/1671542719-1265=
5-
> >1-git-send-email-quic_kalyant@quicinc.com/
> >
> >Thanks,
> >Kalyan
> >
> >>-----Original Message-----
> >>From: Doug Anderson <dianders@chromium.org>
> >>Sent: Wednesday, February 8, 2023 10:44 PM
> >>To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
> >>Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> >>freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> >>kernel@vger.kernel.org; robdclark@chromium.org; swboyd@chromium.org;
> >>Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
> >>dmitry.baryshkov@linaro.org; Abhinav Kumar (QUIC)
> >><quic_abhinavk@quicinc.com>; marijn.suijten@somainline.org
> >>Subject: Re: [PATCH v3 0/4] Reserve DSPPs based on user request
> >>
> >>WARNING: This email originated from outside of Qualcomm. Please be wary
> >>of any links or attachments, and do not enable macros.
> >>
> >>Hi,
> >>
> >>On Wed, Feb 8, 2023 at 5:42 AM Kalyan Thota <quic_kalyant@quicinc.com>
> >>wrote:
> >>>
> >>> This series will enable color features on sc7280 target which has
> >>> primary panel as eDP
> >>>
> >>> The series removes DSPP allocation based on encoder type and allows
> >>> the DSPP reservation based on user request via CTM.
> >>>
> >>> The series will release/reserve the dpu resources when ever there is
> >>> a topology change to suit the new requirements.
> >>>
> >>> Kalyan Thota (4):
> >>>   drm/msm/dpu: clear DSPP reservations in rm release
> >>>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
> >>>   drm/msm/dpu: avoid unnecessary check in DPU reservations
> >>>   drm/msm/dpu: reserve the resources on topology change
> >>>
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 58
> >>> ++++++++++++++++------
> >>-------
> >>>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 +
> >>>  3 files changed, 37 insertions(+), 25 deletions(-)
> >>
> >>I tried out your changes, but unfortunately it seems like there's somet=
hing
> >wrong.
> >>:( I did this:
> >>
> >>1. Picked your 5 patches to the chromeos-5.15 tree (this series plus
> >>[1])
> >>
> >>2. Put them on herobrine villager.
> >>
> >>3. Booted up with no external display plugged in.
> >>
> >>4. Tried to enable night light in the ChromeOS UI.
> >>
> >>5. Night light didn't turn on for the internal display.
> >>
> >>
> >>I also tried applying them to the top of msm-next (had to resolve some
> >>small conflicts). Same thing, night light didn't work.
> >>
> >>
> >>I thought maybe this was because the Chrome browser hasn't been updated
> >>to properly use atomic_check for testing for night light, so I hacked
> >>my herobrine device tree to not mark "mdss_dp" as "okay". Now there's _=
only_
> >an eDP display.
> >>Same thing, night light didn't work.
> >>
> >>
> >>I could only get night light to work for the internal display if I
> >>plugged and unplugged an external display in.
> >>
> >>
> >>Is the above the behavior that's expected right now?
> >>
> >>
> >>[1] https://lore.kernel.org/all/1674814487-2112-1-git-send-email-
> >>quic_kalyant@quicinc.com/
