Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600CA746FA6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 13:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBE210E0E8;
	Tue,  4 Jul 2023 11:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB21310E0E8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 11:14:25 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6b8b8de2c6bso2418586a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688469264; x=1691061264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmq13IpfgnAPzEDZ3MCvqyIpf9PhLjB+MPzx2szVSfk=;
 b=b7AhtMCftt+cTeOJXwBy5ITli90/x5PMA+MyE+5atctEAz5tSz0BLHemWUOzyQcU15
 arIY+E27ZqZIe8Jofdpx5wdowWEAtVadAAUP1SZ6zv3+ow6M6by33CgrIbvZHlLGyhDm
 DkLDcQmeQs3J/P4bLLOwR6DXAkv2xDG6hZZ5NCb/bSZK65D/3iwLM4fN5XUv+yE5OT4u
 zlAYg0SJyzGtyriDQwiYWRTZGMxZ3cOKYnyR8ozA5WAGyY94jUJCXAtuPD4hQuBrjH12
 aXtiuookOoYhYNSwZNVyQ+Ksn1UBRrtgFIvwrR7CX1r+p8JHZH7VImB3jjeU0ftknJ2E
 VHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688469264; x=1691061264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kmq13IpfgnAPzEDZ3MCvqyIpf9PhLjB+MPzx2szVSfk=;
 b=OV/SdC7aiAH8EeJCmFZVSnzn6HRDRoAcbF0OIA3TFDd/A3Mh0QFIpkcTlcnNHWR6UF
 JPsX2WCCUJvDur7stQuwxbCOBp9Ox389Mabe1DL1WJJiBMV2qlM8tTqoeL/OD5ttcY/T
 b/i72rqw1LtJrA25XkPslEQ03oTTBRTzCwfcycPPH5Guk/AdehLk7wRlS6U0gdTmbIP3
 V5FC01aPGCN/L8Ie0W1qGnvTrAKHtkBI4N1//Um80WV7noOJWLs6IXJxZn/2XZc6isD+
 /SE81T/gRA9yuMp4Nc6D7G1ZNzKSo5VyDb2hS2wSjPJkzrIldIfCW/Nsc2G8nEQ8Rl3c
 BY2w==
X-Gm-Message-State: ABy/qLYJhzXCdE6KuiCJe6L+7+X1sFY++cmJGbCTDrQK/ZQXDFOKwrcb
 38qisAtxpaBC65tdUnx5LK6fxJBCy/PxW0sKDxw56g==
X-Google-Smtp-Source: APBJJlFGYPsDHhZoR1DA74LBsPfA4iDEEhLPHr4gpWDC18z6mMpX2jCRqIPh9EeoZRADFggaiWSfavywya4q4oo5xvo=
X-Received: by 2002:a05:6359:21b:b0:134:ddad:2b4f with SMTP id
 ej27-20020a056359021b00b00134ddad2b4fmr10055345rwb.18.1688469264466; Tue, 04
 Jul 2023 04:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <CAHwB_N+F_PQaRb+BvLmJwUSsbeCCqF3rWcLYuY_9ktrFGK5_7Q@mail.gmail.com>
 <CACRpkdYQb6MMQ7uxPF2UK4Z6UDQs2uHgpzXaeMm8BZm5i+hofQ@mail.gmail.com>
In-Reply-To: <CACRpkdYQb6MMQ7uxPF2UK4Z6UDQs2uHgpzXaeMm8BZm5i+hofQ@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 4 Jul 2023 19:14:12 +0800
Message-ID: <CAHwB_NKD=87cgQMpegbDEQzP00qPvzViMnDSzW7BXPE7-MtfDg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix up the boe-tv101wum-nl6 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 4, 2023 at 6:16=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Jul 4, 2023 at 12:04=E2=80=AFPM cong yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> > On Mon, Jul 3, 2023 at 9:21=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
>
> > > I am surprised that contributors from manufacturers do not seem
> > > to have datasheets for the display controllers embedded in the
> > > panels of their products. Can you take a second look?
> >
> > Sorry, this panel datasheet is not open source, I can't share this data=
sheet.
>
> Perhaps not, but you can use the knowledge in the datasheet to
> name the commands and give better structure to the members of
> the driver, if you know what commands mean then provide
> #define statements to them so sequences become understandable.
> See for example patch 4/4.

Patch 4/4 LGTM, from the datasheet  0XFF is EXTC Command Set Enable .
Description: Set the register, 1 Parameter =3D 98h, 2 Parameter =3D 82h, 3
Parameter =3D Page value to enable =E2=80=9Cpage command set=E2=80=9D avail=
able.
00h =3D Page 0 ,01h =3D Page 1... 0Eh =3D Page 14.

Thank you for you patch.
>
> Yours,
> Linus Walleij
