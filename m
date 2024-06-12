Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15D904B59
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 08:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7374610E786;
	Wed, 12 Jun 2024 06:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VwrUKP3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852C610E786
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:08:46 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-797a7f9b552so134481585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 23:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718172525; x=1718777325;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gyE0yRf++M8xpQPQaXpdKeQW4X1m/NGIHRme4AlmbpE=;
 b=VwrUKP3BEc142tMxSrf5Kh95re6P0ONpMtjUrJAhTDiCjzxrGwwIqyAfSmGpOTZX0D
 60U07sOkcT0CYw0jryi6Oe8N1XG4bj24Pyaezy7Y/EE3ny7ch9sZLHrSvYungIUqAlQ0
 iippPO1xkHZjz5CU1p3ZwDzqJg6VLf3L8+5JfPymPC/ualmmRrYB7tPAH7W3KEVpl5KW
 zRxhruA/QAEvbx7cKmL/5Dtb1tbI7kjx6Y3dnlNih2MEtUNkQajL11CSIvO6l+DUpynv
 7x7zfpDxHLhU72D5iwGb+KkChGzU/yjA5a5RgwA90V3XqO4rgim9avkl5Qp88kmQgtAp
 OFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718172525; x=1718777325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyE0yRf++M8xpQPQaXpdKeQW4X1m/NGIHRme4AlmbpE=;
 b=b0JskKf4I1HB+E9O9bLYmiJpb+koWmYiGqetb4E99vzFq1b+bLtEy25db9Mbq/t9tq
 cpaMekViksE90Y+PnL/InvT7HR5CmlLDVVEK3HkPp4aZMLxcx5DJGh/1SMH8zkJ99Qzx
 uQPSYPqvaZxLf1bGnllomhomlVc9qMfQtpA9d3uLGeCUJgEnWdra1eIEI8x5Isd4t1t0
 6QwbfgKcNc1U/9av6qutLtKeLaOVXAkkLlot11u6vJdNWRJzajU8B74EZ4hepe9BcNfb
 IWVOOcGRSB6eUxBTjCIKd+jfAJ/IXq2zskIF2sYTY1v9/BDzB8hpmjUR2PExpSZqkSzv
 CHRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUETHQtguukg/24gW/0wGVLmdOgIioBfXzD7T8KrRDnvj1TPJ2xXMWs1hg6drIwF1TblFDa9B/B8U6lufqOZ1ZFW/VvoH5H0pr85Kl457Iq
X-Gm-Message-State: AOJu0YzFjZ4hQTG0Y7KXvyyfH4faiP5Yazp+NiRIzlWVvlcUAhu0rgzu
 1FFGF2r8JuSEelIcRwg7+X/wQ9Ioa2Ne5+ej4GTs8xQQ0gTpePwNzYl4NQQe0BvtYplRMwpubth
 v54K0gyTPb4oHYAeGnW+xjx6wDEYsiKoqfrkwzg==
X-Google-Smtp-Source: AGHT+IGgNv214CmoVwCSUjRaOqQbUErdoxgXeV4BV/W0aoOAYNd4EZbmAwgtVrL+4MkZyrldxa3mrPpXHofORifQF5I=
X-Received: by 2002:a05:6214:44a1:b0:6b0:62bb:ab9a with SMTP id
 6a1803df08f44-6b1920277a9mr9426226d6.19.1718172524993; Tue, 11 Jun 2024
 23:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
 <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
 <CAGoogDB-mj8_xu04w3V2ZxOBTWoXcPKrVR1NRt6BFcpjHX3-7Q@mail.gmail.com>
 <CAD=FV=WwsR9e-ZXJRY11FvdUZ66YPy9vqmY_=sGDw5Wqk1eV3w@mail.gmail.com>
 <CAGoogDBCzfKwkAA-VAs3_Cdw_4oFO94mt7yjy47Sp2RAtqtPxA@mail.gmail.com>
 <CAD=FV=WYiD-BUpksBnZrkWvORepZqtaAvm5645X-_oJPea0s0w@mail.gmail.com>
 <CAD=FV=WMC0XZBc3UKP+Qzb5aeiWBnXrYDf31PNP5cGeAT-8XcA@mail.gmail.com>
 <CAD=FV=Ua_CuWsPRMsZZhXF2kFjf6-o=s9zKYq=FC4XHQNL8UqQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Ua_CuWsPRMsZZhXF2kFjf6-o=s9zKYq=FC4XHQNL8UqQ@mail.gmail.com>
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Date: Wed, 12 Jun 2024 14:08:34 +0800
Message-ID: <CAGoogDCjpanCwHHuYEu0kU9grv8qy002Utnm1JgRAw-o6TY8=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

I'm so sorry for the late reply.
The information we got from the CSOT is that when the project was
first started, CSO was used. Later, they realized this problem and
changed the VID of other panel models to CSW. Since the panel has
already been shipped, they will keep it as CSO and only the VID for
that panel will be CSO.
Thanks a lot!

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B46=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=B8=89 00:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, May 28, 2024 at 9:27=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Mon, May 6, 2024 at 8:54=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Apr 23, 2024 at 6:55=E2=80=AFPM Xuxin Xiong
> > > <xuxinxiong@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > Hi Doug, thank you!
> > > > We had reported this info to the CSOT to correct the vendor id.
> > > > If they confirm to fix this with the same product ID, we will submi=
t a
> > > > patch to fix this.
> > >
> > > FYI, "top posting" like this is generally frowned upon on kernel
> > > mailing lists. One such reference about this is [1]. Some folks are
> > > very passionate about this topic, so please keep it in mind to avoid
> > > upsetting people in the community.
> > >
> > > In any case: did you get any response from CSOT about the improper ED=
ID?
> >
> > Just following up here. Was there any response from CSOT?
>
> Continuing to follow up here. Did CSOT say anything about this?
>
> -Doug
