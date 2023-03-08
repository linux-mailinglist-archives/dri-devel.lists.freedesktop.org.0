Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61BB6B0EE1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D20A10E68C;
	Wed,  8 Mar 2023 16:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6010E68C;
 Wed,  8 Mar 2023 16:39:18 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1755e639b65so19345632fac.3; 
 Wed, 08 Mar 2023 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678293557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HOwa/kMRvl0ZNeGTMl/f21Hk5h4VCvolFHb6yH1E7A=;
 b=Yr745RWyq3JzSo4tbib05k8wguC5rDY7kTjyMvAi8vxbRG+xdDY9GYrETj+IoA0vQK
 1hCZvzJrjvab6zc5lZC1PbPw0sy7CRpuSO4wtHDJ/01ElKmcvPfHDqzSR8BPwh95reO4
 sBzrv1T8oI0nmuFQeSbfVJ6iahJSTxUgMuetOECgalVXcpMufMlD4W1S5LU8CD+9Y+F5
 gbI58oQi9ou2kVhHkJoiqSk1RzpdeFs8jF3n9G+KmL2+XxWvfNGmkHAogIPGkf9yAMYz
 sfz0oBd2ubhQ/LItPgFaQ6lorhypahVGvUZW6u92kjrDls1+cbQ13Ev/jeYjsGaVcHNA
 gakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HOwa/kMRvl0ZNeGTMl/f21Hk5h4VCvolFHb6yH1E7A=;
 b=wnC+IDTfhOwdZo3YNq3rzxvS3IK9le6MUvFh94Jcqnullnn/zsGqE4rlItVZ2UH4gn
 1WIBnBvAT/ba9LSpUNUrju4lRme4najc9TCjf4HaUt7MPaLH8XxqRy+SS4MOt/dLTD/R
 gIVY3RjL0ZcASC+kIpQw+i+ua3NbM0sk6BO7cyrIYvBNAv0QBOaLjhKbQFva7e8KKe4G
 MrFCAfK7uATMg41RqGA7ywosV/mcyIQeSb6e+5Tp8VaXtLMsqPKMIT9eWnMt/P5NHS1k
 LE/M3gDxeW9q6iaY9OP19+Ea79sToXGoBEfpP6I/bRP1zJNETvZaKA5YBawBLTOU3HNE
 N4PQ==
X-Gm-Message-State: AO0yUKUCXpIDCpgVy492xhoKOzaic7iev95F+3NpJbLskRKxichIAvba
 bX+OBfyMuRIdVqJRHUmRuZIjQqvGpRbOmMjy/UM=
X-Google-Smtp-Source: AK7set9zkyPQWjmBsbYUA/TRidhzesoonwBBMVqRMXy1MJ+C6oc0wUTAYrFJFh6OHeMg44NcfzI0hxQOMTw6aUTnd94=
X-Received: by 2002:a05:6870:5a97:b0:176:31db:9a49 with SMTP id
 dt23-20020a0568705a9700b0017631db9a49mr6451972oab.3.1678293557327; Wed, 08
 Mar 2023 08:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20230308093408.239331-1-qingqing.zhuo@amd.com>
 <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
 <20230308161945.svooztnablyvm75e@houat>
 <PH7PR12MB58315E9E7362E8A750393B6FFBB49@PH7PR12MB5831.namprd12.prod.outlook.com>
 <20230308163248.u7rvtadhlre3yua5@houat>
In-Reply-To: <20230308163248.u7rvtadhlre3yua5@houat>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Mar 2023 11:39:04 -0500
Message-ID: <CADnq5_NYnb1j9RnurMP2-TU4nAQRsPH8hsn_YXoiPZZ4woXOnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: Fix build error with undefined label
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>, "Zhuo,
 Qingqing \(Lillian\)" <Qingqing.Zhuo@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 11:32 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Wed, Mar 08, 2023 at 04:27:01PM +0000, Zhuo, Qingqing (Lillian) wrote:
> > [AMD Official Use Only - General]
> >
> > > Hi,
> >
> > On Wed, Mar 08, 2023 at 11:11:22AM -0500, Hamza Mahfooz wrote:
> > > + vc4 maintainers
> > >
> > > On 3/8/23 04:34, Qingqing Zhuo wrote:
> > > > [Why]
> > > > drivers/gpu/drm/vc4/vc4_hdmi.c: In function =E2=80=98vc4_hdmi_bind=
=E2=80=99:
> > > > drivers/gpu/drm/vc4/vc4_hdmi.c:3448:17: error: label
> > > > =E2=80=98err_disable_runtime_pm=E2=80=99 used but not defined
> > > >
> > > > [How]
> > > > update err_disable_runtime_pm to err_put_runtime_pm.
> > > >
> > > > Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
> > > > ---
> > > >   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > b/drivers/gpu/drm/vc4/vc4_hdmi.c index 9e145690c480..edf882360d24
> > > > 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > @@ -3445,7 +3445,7 @@ static int vc4_hdmi_bind(struct device *dev, =
struct device *master, void *data)
> > > >            */
> > > >           ret =3D pm_runtime_resume_and_get(dev);
> > > >           if (ret)
> > > > -         goto err_disable_runtime_pm;
> > > > +         goto err_put_runtime_pm;
> > > >           if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-=
hdmi0") ||
> > > >                of_device_is_compatible(dev->of_node, "brcm,bcm2711-=
hdmi1"))
> > > > &&
> >
> > > The current drm-misc-next branch doesn't have that context at all. Wh=
at tree is this based on?
> >
> > This is for amd-staging-drm-next.
>
> I don't get it, why is there a vc4 patch in an AMD tree?

There isn't. it just happens to have an vc4 driver with this issue
when we branched it.  Lillian, please double check drm-next or
linux-next for non-AMD drivers

Alex
