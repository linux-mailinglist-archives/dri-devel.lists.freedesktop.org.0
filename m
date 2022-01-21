Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0B4963B5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 18:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BCB10E38C;
	Fri, 21 Jan 2022 17:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5E910E6E9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 17:24:40 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c24so41724440edy.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zxSjhcqIiBTz5FtYvBjqX03Eiy1rrZD2E08P2cJ52KU=;
 b=NM678zJsYX0428lqgIzEsm+/kvNKf660BfH3ILei9LnXwirxQCMvv2S0IXPrpT1WKu
 5wTrLr7dseACM/hTzw/efdpZ6ovcaWS2PkThZcPpUSzh6UjpjB5CIbykV8ZUO+URH2us
 OX9goTqrkpeWwoHMoIWR0s3S2yGtqxWzt0sxwN6VpW3+C22mMZfdJinl5J2OAq0AXMwL
 C+42W29tsMYVlk3Z0MFRyuyRRilDEY7KD5jF2w9eOWJWVK2hTT7pKy0uQNCR5Wf1hq8d
 oNp7WfXmIqd654OECqR0cWoh54nMcy/o23Xg9XljHb/Dwmno64ynkNAAn5mpU8WeLSkS
 V23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zxSjhcqIiBTz5FtYvBjqX03Eiy1rrZD2E08P2cJ52KU=;
 b=hs2g+oN21156L4NtfRkp5/MQUVD2PIGK6DIdUyyBnYBOupQv7JOAwUKUq2OdJUOmmA
 tVC6Eoqh8jRew6r5gfNOyQZfXuhsbjGXR3m5wBAzb73LND2ifWKwU4NW7mei+8QjL1nX
 GoBGfu/t3Q196dZITeJYlfQRmsLjsx29cGCUoG7IEav27uv389TCNeXvDeeM7/8tqmVu
 LZLViVhdumFBlC3Nv349rBaCsFbB+r1V6Qj22SidES4D65GHqxaDPRSPJNepn7E1CMkw
 5s73m6+0KLboW3Zw1cZhO0WtKQuoWiGkZxVyQR/ULdt+blheoVC403dgPfRsVBMYYKe2
 asYg==
X-Gm-Message-State: AOAM531s67Vs7MAx3avpai9kJ+zVOO8nmJL8jv7ncjZDXwKIFxyJh18J
 22iTdNN/apOtQ/Xd9u7Xq+qn/jdXPQPEIq+cxlE=
X-Google-Smtp-Source: ABdhPJw8X4Z2NQCV2Pl5Ahz1bCXZ/g7xhXPKy2T/rr3g5GGjitmEDscaWPZsNGddyx2Ow5cMc2z6QWEcPHxZzPxwDTo=
X-Received: by 2002:a05:6402:2142:: with SMTP id
 bq2mr5147240edb.5.1642785878479; 
 Fri, 21 Jan 2022 09:24:38 -0800 (PST)
MIME-Version: 1.0
References: <FE3831D8-A33F-470B-AD55-6005786139AF.ref@yahoo.com>
 <FE3831D8-A33F-470B-AD55-6005786139AF@yahoo.com>
In-Reply-To: <FE3831D8-A33F-470B-AD55-6005786139AF@yahoo.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 21 Jan 2022 11:24:09 -0600
Message-ID: <CAHCN7xJvDP7o__42Rm7n-KNhoGa4MTP2iuty+x_k616ANkcu+Q@mail.gmail.com>
Subject: Re: Renesas rcar-du and DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
To: Charles Stevens <chazste@yahoo.com>
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
Cc: kieran.bingham+renesas@ideasonboard.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 29, 2021 at 10:19 PM Charles Stevens <chazste@yahoo.com> wrote:
>
> =EF=BB=BF
> Hi All,
>      I am working on a platform based on the Renesas RZ/G2 SoC family. Th=
is chip uses the rcar-du driver for the display. I would like to submit a p=
atch to address the fact that the driver does not check/honor the flag DRM_=
BUS_FLAG_PIXDATA_DRIVE_POSEDGE. My issue is that I would like to make as sm=
all a change to the driver as possible, but the panel bus_flags don't seem =
to even make it to the crtc driver. The crtc driver seems to use adjusted_m=
ode to set the HSYNC and VSYNC polarity and as I said ignores the pixel clo=
ck polarity leaving it at the default of driving on the falling edge. In my=
 investigations so far I have not figured out how to chase the pointers fro=
m the CRTC to the bridge to the panel in order to be able to look at bus_fl=
ags. My current approach also modifies the encoder initialization to cache =
the needed panel and then find the attached encoder during CRTC initializat=
ion to find the bus flags. This seems like a lot of work and not something =
that would be accepted as a patch. The OMAP DSS seems to have problems acce=
ssing this flag as well. The TI driver goes so far as to document the curre=
nt approach as a HACK and suggest a fairly large change to the driver to ad=
dress the problem. Am I missing something? Is there an easy way to get from=
 a drm_crtc to a drm_panel that is in the same pipeline?
>
>     Any pointers would be greatly appreciated!
+  Laurent, Kieran

Charles,

I added Laurent and Kieran because they appear as the maintainers for
the rcar-du driver.

adam

>
> Thanks!
>
> -charles
