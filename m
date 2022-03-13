Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E734D7B72
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 08:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC02810E20B;
	Mon, 14 Mar 2022 07:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B109893A3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 16:14:55 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h11so18644731ljb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 09:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MdfBfkBUpL2bSvoudLMFBEa9b6pECpCEDNH8K1hwrao=;
 b=L2N2StlxKHhQG9J2PUUQ8BMT81Woo2WARfqwCCCaRsZCgYrB8qKZW7nYAVcxEV0MvG
 tAmI14/Fy2JGdqKqs3PVqlGuqRQ8BpIEoEsS7WIDwUntQH4fhtauk18n+SdaBbTbknEg
 T43aEH7UMyT7VepC/Q6G9X121xGeTZWPVzIIumRjSQd+j/Vsp8I3qJKLKqIHRBdZT7HA
 IFOc9cqMtBzSi/mt6pNoqCZZ9zAy3mGmED4YPsP4Q4Bi1DVExMV9Xnghx4G6cvj1mZcn
 G+f98Oe6HB9hQIR/VdLOmejfPMCiVKHSSa//IqLdDWqFJHs/Hn1z4ifHEnaaCzJ5VGYV
 oyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MdfBfkBUpL2bSvoudLMFBEa9b6pECpCEDNH8K1hwrao=;
 b=E5JKSI0bFAiOLrEuoCAF0ZBJmboQhTYMCccc4t75Pwi5/tB3/tNTHPuagj67WFo1HK
 dVDdDB6EFs8Ue2Tnce8UuaqLwySl/xHIMpwrA+2eqOxICqyRMu8hVEpPo18hSJ13y3AX
 cZk8OLWiIsR9ILVOgDnBOAK4ucGYUGMxwV15BLJ38RgzkjIyt4dGNiCIT2UsQIpSP/1P
 Fo7V4vE2Gjs7MGYBxZFlTA5KtwEbCZeVnfQnEEvFJa57/QWgP6DMArSI7v83XoCfnUEe
 zs2j6UX2GS+mkoUVrPm5GeQcyQtrPI/MQkBy+j7wRZ58IgdRIfDvhStal+/eK2iilXEV
 kScQ==
X-Gm-Message-State: AOAM533Ei6a0UQ2LY6usAMo0VOVEJ0fDGJju9g4xtGtpxngTKm7LKtRf
 4R4Ji+ULxe2wu2ununsU2wQ=
X-Google-Smtp-Source: ABdhPJywSUqzwjhi8sTT2bXMPlpeMIA9hr6XzmiR9VlakP+DJzJlrecpRXrO/NRoaY3lGt7mgYEN8Q==
X-Received: by 2002:a2e:320c:0:b0:247:ec95:fdea with SMTP id
 y12-20020a2e320c000000b00247ec95fdeamr11940110ljy.288.1647188093586; 
 Sun, 13 Mar 2022 09:14:53 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 f17-20020a2e1f11000000b00247f8eb86a7sm3158089ljf.108.2022.03.13.09.14.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Mar 2022 09:14:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] drm/bridge: synopsys/dw-hdmi: set cec clock rate
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYq06QSmFAwCuTmBYy4LfQAQDxzx2PGc8HOB1iEjxXHGyg@mail.gmail.com>
Date: Sun, 13 Mar 2022 17:14:49 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <E86F11A4-011B-43ED-90D2-BB6BA9353A3F@gmail.com>
References: <20220126202427.3047814-1-pgwipeout@gmail.com>
 <3AFD1DD4-AF0A-4ECC-B4F5-E6BD6B9F1BB7@gmail.com>
 <CAMdYzYq06QSmFAwCuTmBYy4LfQAQDxzx2PGc8HOB1iEjxXHGyg@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:20:36 +0000
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
Cc: dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Pierre-Hugues Husson <phh@phh.me>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 13.03.2022, o godz. 13:56:
>=20
>>=20
>=20
> I was worried about that, thanks for testing it.
> Can you send me the cec_clk rate before and after this patch?
>=20

Here it is:

working:
                                 enable  prepare  protect                =
                duty  hardware
   clock                          count    count    count        rate   =
accuracy phase  cycle    enable
=
--------------------------------------------------------------------------=
-----------------------------
clk_hdmi_cec                      1        2        0       32743        =
  0     0  50000         Y



non-working:
                                 enable  prepare  protect                =
                duty  hardware
   clock                          count    count    count        rate   =
accuracy phase  cycle    enable
=
--------------------------------------------------------------------------=
-----------------------------
clk_hdmi_cec                      1        2        0       32768        =
  0     0  50000         Y



dmesg
[   52.745988] cec-dw_hdmi: message 44 timed out
[   54.879307] cec-dw_hdmi: message 44 timed out
[   57.012654] cec-dw_hdmi: message 88 timed out
[   59.145973] cec-dw_hdmi: message 88 timed out



player:
2022-03-13 11:04:40.938355 E CECAdapter: =
CLinuxCECAdapterCommunication::Write - ioctl CEC_TRANSMIT failed - =
tx_status=3D00 errno=3D22
2022-03-13 11:04:40.938366 E CECAdapter: =
CLinuxCECAdapterCommunication::Write - ioctl CEC_TRANSMIT failed - =
tx_status=3D00 errno=3D22

