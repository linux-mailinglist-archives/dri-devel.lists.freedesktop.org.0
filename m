Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C6C51EF10
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 20:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D97010FEA4;
	Sun,  8 May 2022 18:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151F810FEA4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 18:21:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p10so20402125lfa.12
 for <dri-devel@lists.freedesktop.org>; Sun, 08 May 2022 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gyfkQnrJlNHhAn6+9MG49Hx9MQwFFjJbOEXow1boMqI=;
 b=PJBywVQEh/EUzbIhvMu64wUdOWF2cmbXHh0JnXzJXkAuV+42wjQglPMCE1qFVdXWYF
 vmFGr2Wn/YHIfRy1BJQK7GiQq37gSfM9tGVwtxvn67nKjMHD+HkYTxXjUZLd69FImpv9
 upbo2GbF6LHXoioPNPUjeE4lsjqASAe1FUwBXU2cIJrKF4wegJ3aUA6nfp4t+gVHHjn9
 5kqFazBC+8Xhx1jbEZxNIphfhxQoO0ZszDShCfPyRSGJ0UpaXCKT4729FK5NUuygIxFK
 2xxBXVvwTLnBBDyFuaMCPhIlYenWhcGcL306ddr0iaj65AUVI63976wAqqwKbXEblEDz
 b88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gyfkQnrJlNHhAn6+9MG49Hx9MQwFFjJbOEXow1boMqI=;
 b=G9S5DMgGII+D7/o+a5Oj2xB6IzEEaogLR3415yXPdBT7DsWa5OwwkSePhXLDZ8g+u5
 RngXHrigXvhgOTwaf03V3i0irulYJbDiT4Iia98ZUUj81zbdOZzNUajJGlfN4DorWPsb
 xth+jSxcn9yvVcorHJ3bZDFwOR4ZVAMXkGM9+KcdTBhjrh9V94FSbgDWPbZB7+QIjOqM
 4/ych707sJpcxAPZ+ef7V4BV6OiKeq7hx1kwKfZBbcxtWAszsNmPs1+SoVGK44IbCIy+
 2OfU36zwMZDNVJ3f+tPyMB8lOMdH8VlFWo9SBB8BrVPg5lCJ8xoED3FMVh/PLabzF6lH
 lmtw==
X-Gm-Message-State: AOAM532hOMi0zenm13tNUQCyDlfYId+GHkfCpwa7q+w66Nnuwc+1BDBQ
 kDH5mazVA3ItZz95/N3rgIc=
X-Google-Smtp-Source: ABdhPJwHID2ULTkNdIKhwTDRPaqsf8010Sn55bgPPznVD4x9VKvT+I0iZjMERyNXkPZlng4SwMwzdw==
X-Received: by 2002:a05:6512:3090:b0:473:a636:dbee with SMTP id
 z16-20020a056512309000b00473a636dbeemr9917513lfd.119.1652034108135; 
 Sun, 08 May 2022 11:21:48 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 h10-20020a2e530a000000b0024f3d1daee4sm1447782ljb.108.2022.05.08.11.21.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 May 2022 11:21:47 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
Date: Sun, 8 May 2022 20:21:44 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>>=20
>> I think i have this already (pls see L231/L232 in =
https://pastebin.com/67wu9QrH )
>=20
> I see you have hdmitxm1_cec as the enabled pin. Are you certain it's
> the m1 pin and not the m0 pin?

It depends on board ver.
pls look: =
https://github.com/radxa/kernel/commit/c1d727692e85c0a265913a72e517cf2bd71=
131ba

>>=20
>> Maybe i miss something but adding:
>>=20
>> &usb2phy0_otg {
>>        phy-supply =3D <&vcc5v0_usb_host>;
>>        status =3D "okay";
>> };
>>=20
>> breaks working usb3 port0
>> (so none of usb3 ports are working)
>=20
> Please pass along a full dmesg in this configuration.

Here it is: https://pastebin.com/uArtBLaZ


