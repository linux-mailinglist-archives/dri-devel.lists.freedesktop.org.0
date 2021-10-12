Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534CE429EC7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 09:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF9B89E41;
	Tue, 12 Oct 2021 07:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14D889E41
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 07:38:20 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id i20so61011022edj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=52gbNdjT7L6a6K8JuDnERJ0ZDRvfR072b1wiOt4CI9g=;
 b=DkOKERI4QxjBHagELAJWqaGehjirjOQLic2mxxmgOp2m1vOhpeM1jwMhQPvPDOjZdQ
 4+w+pz6qk7FxPdaa4zUxrz5rXBsfGOg8Wz09cGQ8z9O7KIzArJAwwaHHN1IRnAb5ryQk
 hOUm5CsxWtMOf8AYqYJ/kAJGklSomGH1MEobI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=52gbNdjT7L6a6K8JuDnERJ0ZDRvfR072b1wiOt4CI9g=;
 b=1dmxN5womp+5+QcjrxD62he1XnMtebKBX9DR58Vns1JpoYuDuy9VAtSSmgYXHXQhja
 xLUfzJyr1y5zoJVV+UN+jwsWTYwKLKKrJgGQmJAS72KtcvW/u8PWJvQxYcLBzNsguVT1
 l2C9ULe4MKP4JmS8XWge04dGtJwgsearQwSpNhR957mEkq+qGiciaWFgD/4aj5F+hWR0
 Sp+kfCbz+ruAFUVVMnhOn2ZAJdY/oKSXVxUVbudzHTM1rzYiLbt6d811X1RVg14m8bPM
 CzzXr2IW225gITWL8hNLcH7TPZs2NZOC5IPiiT+619oQUjG9SZsEYO2apoYbcqB1W4rn
 cUlg==
X-Gm-Message-State: AOAM5306qalQBX1CVAi1EuKHRGONYG7FR9yB0VtkJvLeyRk/zkGrMwZS
 iD/qV4VIr8bJ2OvDlccNK9uUpLIWvTc8cXEETOKfWA==
X-Google-Smtp-Source: ABdhPJx6gPW74sAIZbEKqy1qFrKMkVG37SD22Rc/oqahrmnSZUTDy7lQH/1TPyHUAlzEmM6CjhF5P7nZXbe+ldhiCfk=
X-Received: by 2002:a17:906:b104:: with SMTP id
 u4mr30358811ejy.201.1634024299405; 
 Tue, 12 Oct 2021 00:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
 <CAPY8ntC=mjLRbLY28C5M-3H-jTjN=WasYL9sn9=MxUmnKsMxaw@mail.gmail.com>
 <CAMty3ZA6O8sXknKaPb6ySZHweGrM3=1V+TBPsVi8oLEri3S3_g@mail.gmail.com>
In-Reply-To: <CAMty3ZA6O8sXknKaPb6ySZHweGrM3=1V+TBPsVi8oLEri3S3_g@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 12 Oct 2021 13:08:08 +0530
Message-ID: <CAMty3ZD5qu1ycxkVmfyUGza1tgnszAuDheztCLFC+jcXtoxMqA@mail.gmail.com>
Subject: Re: DSI Bridge switching
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Maxime Ripard <maxime@cerno.tech>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Oct 11, 2021 at 12:51 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Dave,
>
> On Fri, Oct 8, 2021 at 9:32 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > On Fri, 8 Oct 2021 at 14:37, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hello,
> > >
> > > On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > > > Hi,
> > > >
> > > > Removed my invalid email (I will update files next week).
> > > >
> > > > On 08.10.2021 13:14, Jagan Teki wrote:
> > > > > Hi,
> > > > >
> > > > > I think this seems to be a known use case for industrial these days with i.mx8m.
> > > > >
> > > > > The host DSI would configure with two bridges one for DSI to LVDS
> > > > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > > > > can use only one bridge at a time as host DSI support single out port.
> > > > > So we can have two separate device tree files for LVDS and HDMI and
> > > > > load them static.
> > > > >
> > > > > But, one of the use cases is to support both of them in single dts, and
> > > > > - Turn On LVDS (default)
> > > > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> > > >
> > > > Are you sure it will work from hardware PoV? Do you have some demuxer?
> > > > isolation of pins?
> > >
> > > It may be in the category of "you shouldn't do this, but it actually
> > > works". I've seen the same being done with two CSI-2 camera sensors
> > > connected to the same receiver, with one of them being held in reset at
> > > all times.
> >
> > Surely the correct way to do this would be with a D-PHY mux chip such
> > as OnSemi FSA642 [1] or those from Diodes Incorporated [2].
> > How you'd integrate such a mux into DRM is a totally different question.
> > With V4L2 and CSI2 it'd be relatively simple via Media Controller.
> >
> > Just wiring them together isn't going to work very well for DSI
> > reverse direction communication, but neither of the chips Jagan lists
> > support this.
>
> Sorry to mention it before, we have two 2:1 MIPI D-PHY Switch [1] on
> the design which take 2 data-lanes and clock from Host and produce 4
> data-lane and 1 clock to connect to ADV7535 and SN65DSI84 bridges. The
> switch has OE, SEL pins to select the desired to MUXed lanes/clock
> routing to an appropriate bridge.
>
> I think supporting the switch in the pipeline or logic that handle the
> bridge switching might help.

MIPI Switch (PI3WVR626) has OE, SEL logic to select respective data
and clock lanes which are routed to bridge/panel. I think, these OE
and SEL logic can be part of pinmux so we can configure them on
respective bridge/panel nodes pinctrl (atleast on imx8m) instead of
handling them as separate nodes.

Jagan.
