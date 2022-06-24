Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C343355A4B8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CE710E025;
	Fri, 24 Jun 2022 23:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA16A10F249
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 23:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656112492;
 bh=MvGqALxG1kFhKgl304fYJFsRnp9l3J45w+uRN4EBJFE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YrYQMzlKPG8y4QL8388uGsTsNd4htfJ2tWp7Kzgb9QZydPo9QMSO6gf+aCG3uptGv
 7FUHgd5JeXBZzmXPaeD7GJO7lTmpixfvgbQEVCJIJBYk+ynItPXYlbS+sI3DlP2vpS
 eWt8zmOTrzfMdtBMyYwK3WmfC/PNUCI4Be5ZJWJE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [174.250.50.4] ([174.250.50.4]) by web-mail.gmx.net
 (3c-app-mailcom-bs04.server.lan [172.19.170.170]) (via HTTP); Sat, 25 Jun
 2022 01:14:51 +0200
MIME-Version: 1.0
Message-ID: <trinity-420aefe5-fd55-43aa-a57e-41fede46d128-1656112491917@3c-app-mailcom-bs04>
From: Kevin Brace <kevinbrace@gmx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jun 2022 01:14:51 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YrYpjmgwuLQyVF1i@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <YrYpjmgwuLQyVF1i@ravnborg.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:j89bm4lkimqdkLk7Ya0Gq9Nw5akrs+vApXJ6v2Cvn6wvHbfIn7GQVyqEHCDDIN4nXIuTf
 2b1cYaN3vtSjEkEzvzqhbGXAMlROOz103pxxYf38o54gAQqyUYk5Q5DVXoOQDWSWa8jjsefVsgtp
 RC+1Nbhf7UMsbmOmJY2OH/YsSrUdK0foJfMvGZLfX7an1rF0UAqskXzeJCFLAnGifh4L/WXCNONQ
 3vyF4mTr0RQdFLtV0jAvE2PPNFe8BJ88tnZQX+Rup1iBPKY8X2eGqPBF3tF509kGDnKrNg6+gJQK
 DQ=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:62WUj3m+8Ts=:ikdOUhBokVZECelonfGjOK
 WrgGpLbKMCJmMGyqCdwnGr/sqPVYwdfn5TQaELuMt/M03Ig9XYToxl85mSZLNzEStS4Z/lNN2
 6xu9dzqQXTpNIVsQa4kNX33Kqmir1m/n2FrNzGURGzOCqxZC1ADm8dm5442NhpEU2WuQi6irk
 kkXsbk6AK8clRAlz19BZTM4PeJ5kLA/eZW/fnL/P+T2L0VbvWUsLTucV0RzmxDL5JQNxm6Xs1
 MwT78N7siVopWrETDyS8phbo8/PvF2UCLNyKYJVrOia/JEDperMrrFbgGB26y85gOb2LnuXRp
 L4YOTcaaEVZmlS8lMwYlNpkcLlqNj/TZQ4wvViwXBEuuHUBwHH4qH3N2H+gvXokzI6CRoFkxq
 ao4w6e5jSC63fPEaV3eRxe7lH+cVtB6g5CXezhp/g+xUolyYSRltyLDYozOd5sQq3xpHBLWKm
 zY5H3V40/h+Q6uPzJK/vWTalpK3E6ZDIUz14vrtuZM4ki/B1znmMJF+WKdEpi97YQ2Toz+zwy
 576WcX+NSIqtvMlRVmiJKYZA6HiZ/CXwdOeytyB9X3dRUpKt+7RD/Fz0ldaqHLQnHveK9TTKU
 Em1jUCFxaeSXkSOWqHFHshvwytmvb/hNjesfmiKhpDHx/MEuYMZyicrzDv13ZxPAhB5md0kU2
 CF5Kzm+qLBy41kTzfWyfVPb876ylKkAqIhFU/0HW/gGkw2oWTd3hKEuEmhhIB6PV9uowjwb+l
 FsghB5VlGQEIbqXsj7QKw3bYNTRhk+5I6Q3mBCaOzRZElbTR7xzMoRD6xQsJwnz8hzKy9IF9V
 yUD/9Hy
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Oh, sorry that I assumed drivers/gpu/drm/via/ is completely cleared out.
The problem is, I used drm-openchrome repository (customized drm-next bran=
ch for OpenChrome DRM development) to generate the patches.
I happened not to have the original DRM maintainers version installed on m=
y regular development system.
As of now, I am downloading it onto my development system.
I will have a few patches to supplement the patches I posted ready in abou=
t 2 hours per your suggestion.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com


> Sent: Friday, June 24, 2022 at 4:15 PM
> From: "Sam Ravnborg" <sam@ravnborg.org>
> To: "Kevin Brace" <kevinbrace@gmx.com>
> Cc: dri-devel@lists.freedesktop.org, "Kevin Brace" <kevinbrace@bracecomp=
uterlab.com>
> Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
>
> Hi Kevin,
>
> On Fri, Jun 24, 2022 at 03:26:05PM -0500, Kevin Brace wrote:
> > From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> >
> > Hi Dave and Daniel,
> >
> > This is my first attempt (this is not a RFC posting) in trying to get
> > OpenChrome DRM pulled in for Linux 5.20.
>
> I tried to apply the patches one-by-one but they fail as they assume all
> old via files are gone. Please fix v2 so all patches apply clean to the
> chosen base.
>
> There is no need for a respin now, give people a bit time to look at the
> patches first. At least unless someone else needs it.
>
> 	Sam
>
