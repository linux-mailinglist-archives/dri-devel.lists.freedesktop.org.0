Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230044EED7F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 14:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABC810E1B4;
	Fri,  1 Apr 2022 12:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E30D10E1B4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 12:53:22 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bu29so4857838lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7nu5zI475wsuUxFB5uZqvOK31lUir62pBykPLjKXqpI=;
 b=mj/3g8GlwDJCedc6wEtcCOnv47S61n05MWOrLh2ietECkVriG7pgqIAqHb2gIjIlXw
 QRsRdNtAYPIGLdL7AmFylNZcMJUEgMM1GRH8D3BUQOZkDwjwD86sEVLbBVdx/HOkl6px
 wDkWD8qVlZyztGSAm7EeQBH9Uz/LRtf78qslUKOBiAUsH7BQjoJyxZ3GqOt17cjmvSyZ
 7YKRXwPtA0S+/YQX9QiWG+H2qMPv9bo1Q3mx72W4qxSqqY6pK2LLQWv7dLA3fh/LLG4J
 LTk7Oyh/T+/cWwQiW5VFHfmTMMKLJ+hbQa5g/MFL7pM2/mNv+f08pkDq6UWG20Ad9yJ1
 c9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7nu5zI475wsuUxFB5uZqvOK31lUir62pBykPLjKXqpI=;
 b=0OUNRofVs+V19dUIbKCW7aBHmkhto3rEzvcP+owkDMYh0esagGMYuIAR7RbtVBUU4p
 4UN9QPGWI7/nH/dWZbCEofYs+BtUrqBUsKMvXRIg+0V6U5fXnHnOGSGsaZof92qOzGk3
 +qvt02fFPuCkExjH03jirDWknpeHP04P8iy5ZUrFPnzpJ49G3qui6dRdR0cBxONCY/pD
 x2NEgLk1SMGxIt+Roz8eBNiu67LNstJxw47wKXi9Ft+Xdn3AYSRAQILGgOYv4UFjQIPn
 KVvBc3WevgoWyKWm+AOtLa6zpXK+LhDqWDBiBk1J0noJI35fbSpSOa7NJXjxqFm16GwB
 naCw==
X-Gm-Message-State: AOAM533ubHZzVjo0P6tmF9QFhmkMGITWxXwSvCk8BF954L/18U+5Ow47
 KrptzkvW1Z9/xWc24bz4vxk=
X-Google-Smtp-Source: ABdhPJyA0lnGdyc1WpOVKGgPfRRkLN0vtE7+nk/JTferqMtqYbGrezl06U1FZ0zZ7T9LODJS3umrzw==
X-Received: by 2002:a05:6512:2214:b0:44a:348a:d6d with SMTP id
 h20-20020a056512221400b0044a348a0d6dmr13815105lfu.506.1648817600032; 
 Fri, 01 Apr 2022 05:53:20 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 a14-20020a05651c010e00b0024ae3080370sm26447ljb.88.2022.04.01.05.53.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Apr 2022 05:53:19 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <041d7795-fdec-8e7d-a9ee-aa79c0faa6f3@rock-chips.com>
Date: Fri, 1 Apr 2022 14:53:16 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5FFECDDD-711F-4D50-97A2-D8213B154245@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
 <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
 <B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com>
 <622c8786-2c3f-13ff-66b7-ad9c8cb9425e@rock-chips.com>
 <041d7795-fdec-8e7d-a9ee-aa79c0faa6f3@rock-chips.com>
To: Andy Yan <andy.yan@rock-chips.com>
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
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andy.yan@rock-chips.com> =
w dniu 01.04.2022, o godz. 14:04:
>=20
> Hi Piotr:
>=20
> On 4/1/22 09:52, Andy Yan wrote:
>=20
> Pls update the new vop2_dump.sh scripts from github. The
>=20
> previous scripts I gave you has some bug. sorry.
>=20

Andy,

Sure. np.
Pls find dump with current vop2_dump.sh
https://pastebin.com/CwVj0kuX

btw: this is with latest patch from Sascha:
=
https://lore.kernel.org/linux-arm-kernel/20220330072822.GX12181@pengutroni=
x.de/


