Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2759710D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 16:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C5295ABB;
	Wed, 17 Aug 2022 14:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4F895A92
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 14:29:25 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id g21so6772711qka.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=nbI+k5DQHbTWrnCEgebBhMe02FygG1PsU1gqd/fMVzQ=;
 b=0iHMYg0kCRDW8yqhXS+ynKl/wauUqc5ln3Q+N+/vnttHptHNQjC8LPtSbNMVBNToQZ
 mG2rnVvxcZ9p3glmpKKS/KOx0OrrmYnG2ieDwB4AOMp7Aq/gtBGmYZbMo8buhWK/fKYn
 Y/L9B6L6dLg4WpDCUzMEopU6aVaa7cWDS3cdCTwP6Irk+szWOYD2Kp5AKwoBAoLualBm
 8wekDBT3vUtmKgbfztzwq8vp/mfW8X+EY3GlkqdFWSBuGDBa9+LvqQG6+NdbE2F2JpSr
 AWvyZcYLCI3ALNAQ0Asd2GEA8Wg/PpgzlyE7k5LuWyprQl3sDyX2HCW57YyjLF4p/aSn
 5Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=nbI+k5DQHbTWrnCEgebBhMe02FygG1PsU1gqd/fMVzQ=;
 b=OrVia6FLyiN2ZIlfEnlfiJTZ25LV2kiJJLWhZ4icU/GdiIDPMv1gmRkiAMfPHImhjv
 R2jSDTUKiT4/M3fVT1hgCPaZug4JobeAGVbZnV9H4N+lxexvX6nAOC5rqeOL3uPLLx9n
 RUvNI2O2xbCkx/cjjDZhsrLAtTdpp21FCPCf/H0K0iy7qABTQbCPQ6mTQ2gUnCh9vTNh
 mZcjMlNoTnye8jA2eEVqo3o1MyjBni0pPLRJgiDqXsKcZ6F8KP80Xqc4U+5lZ2fncmie
 r7nP7B+HBXSGXU24zfYACSsR0wEGTXeeCVqctrvfa4g9Ksb1nPapX33EWmyR0+eUG53M
 +cPg==
X-Gm-Message-State: ACgBeo0PBRWBoJaLCBBLQD4G9iAsq/qhlVkjRjvyxM8RpDGlFivyBbPC
 RZyurSQfwdQrg2cQIHDEYCcq1Q==
X-Google-Smtp-Source: AA6agR6C6mJevKTBi3H2YQPBbQVqiNBMdYN0rm8sN6vMAzMhaxKrVi45NNefk9toDAu3+nfmMuslpQ==
X-Received: by 2002:a05:620a:261d:b0:6bb:fa6:1ad6 with SMTP id
 z29-20020a05620a261d00b006bb0fa61ad6mr12091743qko.65.1660746564595; 
 Wed, 17 Aug 2022 07:29:24 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05622a040600b00339b8a5639csm13236130qtx.95.2022.08.17.07.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 07:29:23 -0700 (PDT)
Message-ID: <eef2fc413695cb96a5071627bfe44830f80cfe9e.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Olivier Masse <olivier.masse@nxp.com>, "brian.starkey@arm.com"
 <brian.starkey@arm.com>
Date: Wed, 17 Aug 2022 10:29:22 -0400
In-Reply-To: <de46324d8fa8fb6a8dda4641e531d30842410744.camel@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <20220805154139.2qkqxwklufjpsfdx@000377403353>
 <7e61668164f8bf02f6c4ee166e85abc42b5ee958.camel@nxp.com>
 <20220812163922.v7sf3havi5dpgi5u@000377403353>
 <de46324d8fa8fb6a8dda4641e531d30842410744.camel@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
Cc: =?ISO-8859-1?Q?Cl=E9ment?= Faure <clement.faure@nxp.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Folks,

Le mardi 16 ao=C3=BBt 2022 =C3=A0 11:20 +0000, Olivier Masse a =C3=A9crit=
=C2=A0:
> Hi Brian,
>=20
>=20
> On ven., 2022-08-12 at 17:39 +0100, Brian Starkey wrote:
> > Caution: EXT Ema
> >=20

[...]

> >=20
> > Interesting, that's not how the devices I've worked on operated.
> >=20
> > Are you saying that you have to have a display controller driver
> > running in the TEE to display one of these buffers?
>=20
> In fact the display controller is managing 3 plans : UI, PiP and
> video. The video plan is protected in secure as you can see on slide
> 11:
> https://static.linaro.org/connect/san19/presentations/san19-107.pdf



just wanted to highlight that all the WPE/GStreamer bit in this presentatio=
n is
based on NXP Vendor Media CODEC design, which rely on their own i.MX VPU AP=
I. I
don't see any effort to extend this to a wider audience. It is not explaini=
ng
how this can work with a mainline kernel with v4l2 stateful or stateless dr=
ivers
and generic GStreamer/FFMPEG/Chromium support.

I'm raising this, since I'm worried that no one cares of solving that high =
level
problem from a generic point of view. In that context, any additions to the
mainline Linux kernel can only be flawed and will only serves specific vend=
ors
and not the larger audience.

Another aspect, is that this design might be bound to a specific (NXP ?)
security design. I've learn recently that newer HW is going to use multiple
level of MMU (like virtual machines do) to protect the memory rather then
marking pages. Will all this work for that too ?

regards,
Nicolas
